Red [
	Title:	"high level Driver for Trezor"
	Author: "bitbegin"
	File: 	%trezor.red
	Needs:	 View
	Tabs: 	4
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

#include %trezor-message.red
#include %trezor-driver.red

get-message-version: func [
	res			[map!]
	return:		[word!]
][
	if res/major_version = 1 [
		if res/minor_version >= 8 [return 'default]
		return 'v6
	]
	if res/major_version = 2 [
		if res/minor_version > 0 [return 'default]
		if res/patch_version >= 11 [return 'default]
		return 'v6
	]
	'default
]

trezor-old: context [
	name:	"Trezor One"
	id:		[534Ch 1]

	command-buffer: make binary! 1000

	message-version: 'default

	pin-get: make string! 16
	pin-msg: none
	pin-req: none
	pin-ret: none
	request-pin-state: 'Init							;-- Init/Requesting/HasRequested/DeviceError
	serialized_tx: make binary! 500

	no-wait?: false
	passphrase-in: none
	confirm-passphrase: none

	driver: make trezor-driver []

	system/catalog/errors/user: make system/catalog/errors/user [
		trezor: ["trezor [" :arg1 ": (" :arg2 " " :arg3 ")]"]
	]

	new-error: func [name [word!] arg2 arg3][
		cause-error 'user 'trezor [name arg2 arg3]
	]

	connect: does [driver/connect id]

	close: does [
		driver/close
		request-pin-state: 'Init
	]

	init: func [][
		if request-pin-state <> 'Init [return request-pin-state]
		request-pin-state: 'Init
		driver/init
		res: make map! 20
		Initialize res
		message-version: get-message-version res
		if message-version = 'v6 [
			trezor-message/messages: trezor-message/messages-v6
		]
	]

	close-pin-requesting: does [
		if request-pin-state = 'Requesting [
			unview/only pin-dlg
		]
		request-pin-state: 'Init
	]

	request-pin: func [return: [word!]] [
		if request-pin-state <> 'Init [return request-pin-state]

		pin-req: make map! reduce ['address_n reduce [8000002Ch 8000003Ch 80000000h]]
		put pin-req 'show_display false
		pin-msg: 'EthereumGetAddress
		clear pin-get

		request-pin-state: try [request-pin-cmd]
		if error? request-pin-state [return request-pin-state: 'DeviceError]

		if request-pin-state = 'Requesting [
			either driver/msg-id = trezor-message/get-id 'PinMatrixRequest [
				view/flags pin-dlg 'modal
				if driver/msg-id = trezor-message/get-id 'PassphraseRequest [
					request-pin-state: 'Requesting
					view/flags passphrase-dlg 'modal
				]
			][
				view/flags passphrase-dlg 'modal
			]
		]
		request-pin-state
	]

	request-pin-cmd: func [return: [word!]][
		encode-and-write pin-msg pin-req
		driver/message-read clear command-buffer

		if driver/msg-id = trezor-message/get-id 'EthereumAddress [
			return 'HasRequested
		]
		if driver/msg-id = trezor-message/get-id 'PinMatrixRequest [
			return 'Requesting
		]
		if driver/msg-id = trezor-message/get-id 'PassphraseRequest [
			return 'Requesting
		]
		'DeviceError
	]

	get-eth-address: func [
		ids				[block!]
		return:			[string!]
		/local
			res len address
	][
		res: make map! []
		EthereumGetAddress ids res
		if message-version = 'default [return res/address]
		if address: any [res/address res/old_address] [
			return rejoin ["0x" enbase/base address 16]
		]
		new-error 'get-eth-address "addr none" res
	]

	get-eth-signed-data: func [
		ids				[block!]
		tx				[block!]
		chain-id		[integer!]
		return:			[binary!]
		/local
			req res nonce gas_price gas_limit amount signed data-len *to
	][
		nonce: trim/head to binary! tx/1
		gas_price: trim/head i256-to-bin tx/2
		gas_limit: trim/head to binary! tx/3
		amount: trim/head i256-to-bin tx/5
		data-len: length? tx/6
		either message-version = 'default [
			*to: rejoin ["0x" enbase/base tx/4 16]
		][
			*to: tx/4
		]
		req: make map! reduce [
			'address_n ids
			'nonce nonce 'gas_price gas_price 'gas_limit gas_limit
			'to *to 'value amount 'chain_id chain-id
		]
		if data-len > 0 [
			put req 'data_length data-len
			put req 'data_initial_chunk tx/6
		]
		res: make map! []
		if error? try [EthereumSignTx req res][return none]

		append tx reduce [
			to-bin8 res/signature_v
			res/signature_r
			res/signature_s
		]
		rlp/encode tx
	]

	;===================
	;-- commands
	;===================

	Initialize: func [
		res				[map!]
		return:			[integer!]
	][
		WriteAndRead 'Initialize 'Features #[] res
	]

	EthereumGetAddress: func [
		ids				[block!]
		res				[map!]
		return:			[integer!]
		/local
			req			[map!]
	][
		req: make map! reduce ['address_n ids]
		put req 'show_display false
		PinMatrixSequence 'EthereumGetAddress 'EthereumAddress req res
	]

	EthereumSignTx: func [
		req				[map!]
		res				[map!]
		return:			[integer!]
		/local
			res2		[map!]
	][
		encode-and-write 'EthereumSignTx req
		driver/message-read clear command-buffer

		if driver/msg-id = trezor-message/get-id 'PinMatrixRequest [
			request-pin-state: 'Requesting
			clear pin-get
			pin-req: req
			pin-msg: 'EthereumSignTx

			view/flags pin-dlg 'modal
		]

		if driver/msg-id <> trezor-message/get-id 'ButtonRequest [
			new-error 'EthereumSignTx "not ButtonRequest" driver/msg-id
		]

		res2: make map! []
		proto-encode/decode trezor-message/messages 'ButtonRequest res2 command-buffer
		res2: make map! []
		WriteAndRead 'ButtonAck 'ButtonRequest #[] res2
		WriteAndRead 'ButtonAck 'EthereumTxRequest #[] res
	]

	;-- A Sequence like this, GetAbcd -> [PinMatrixRequest -> PinMatrixAck -> GetAbcd] -> Abcd
	PinMatrixSequence: func [
		req-msg			[word!]
		res-msg			[word!]
		req				[map!]
		res				[map!]
		return:			[integer!]
	][
		encode-and-write req-msg req
		driver/message-read clear command-buffer

		if driver/msg-id = trezor-message/get-id 'PinMatrixRequest [
			request-pin-state: 'Requesting
			clear pin-get
			pin-req: req
			pin-msg: req-msg
			view/flags pin-dlg 'modal
		]

		if driver/msg-id = trezor-message/get-id 'PassphraseRequest [
			clear passphrase-in/text
			clear confirm-passphrase/text
			view/flags passphrase-dlg 'modal
		]

		if driver/msg-id = trezor-message/get-id res-msg [
			return proto-encode/decode trezor-message/messages res-msg res command-buffer
		]

		new-error 'PinMatrixSequence "unknown id" driver/msg-id
	]

	WriteAndRead: func [
		req-msg			[word!]
		res-msg			[word!]
		req				[map!]
		res				[map!]
		return:			[integer!]
	][
		encode-and-write req-msg req
		driver/message-read clear command-buffer
		if driver/msg-id = trezor-message/get-id res-msg [
			return proto-encode/decode trezor-message/messages res-msg res command-buffer
		]

		new-error 'WriteAndRead "unknown id" driver/msg-id
	]

	encode-and-write: func [
		msg				[word!]
		value			[map!]
		return:			[integer!]
	][
		proto-encode/encode trezor-message/messages msg value clear command-buffer
		driver/message-write command-buffer trezor-message/get-id msg
	]

	read-and-decode: func [
		msg				[word!]
		value			[map!]
		return:			[integer!]
	][
		driver/message-read clear command-buffer
		proto-encode/decode trezor-message/messages msg value command-buffer
	]

	on-pin-enter: func [face event][
		if request-pin-state = 'Requesting [
			pin-ret: try [encode-and-write 'PinMatrixAck make map! reduce ['pin pin-get]]
			if error? pin-ret [
				request-pin-state: 'DeviceError
				unview
				exit
			]

			pin-ret: try [driver/message-read clear command-buffer]
			if error? pin-ret [
				request-pin-state: 'DeviceError
				unview
				exit
			]
			if driver/msg-id = trezor-message/get-id 'Failure [
				clear pin-show/text
				pin-header/text: "Input Pin Failure! Enter Pin again."
				request-pin-state: try [request-pin-cmd]
				if error? request-pin-state [
					request-pin-state: 'DeviceError
					unview
				]
				clear pin-get
				exit
			]
			request-pin-state: 'HasRequested
		]
		clear pin-show/text
		clear pin-get
		unview
	]

	on-passphrase-enter: func [face event][
		if request-pin-state = 'Requesting [
			if passphrase-in/text <> confirm-passphrase/text [
				header/text: "Passphrases do not match!"
				clear passphrase-in/text
				clear confirm-passphrase/text
				exit
			]
			pin-ret: try [encode-and-write 'PassphraseAck make map! reduce ['passphrase confirm-passphrase/text]]
			if error? pin-ret [
				request-pin-state: 'DeviceError
				unview
				exit
			]
			pin-ret: try [driver/message-read clear command-buffer]
			if any [error? pin-ret driver/msg-id = trezor-message/get-id 'Failure] [
				request-pin-state: 'DeviceError
				unview
				exit
			]
			request-pin-state: 'HasRequested
		]
		clear passphrase-in/text
		clear confirm-passphrase/text
		unview
	]

	pin-dlg: layout [
		title "Please enter your PIN"
		on-close [
			close-pin-requesting
			close
		]
		style label: text 220 middle
		style but: button 60x60 "*"
		style pin-field: field 205 middle
		pad 15x0 pin-header: label "Look at the device for number positions."
		return pad 15x0
		but [append pin-show/text "*" append pin-get "7"]
		but [append pin-show/text "*" append pin-get "8"]
		but [append pin-show/text "*" append pin-get "9"]
		return pad 15x0
		but [append pin-show/text "*" append pin-get "4"]
		but [append pin-show/text "*" append pin-get "5"]
		but [append pin-show/text "*" append pin-get "6"]
		return pad 15x0
		but [append pin-show/text "*" append pin-get "1"]
		but [append pin-show/text "*" append pin-get "2"]
		but [append pin-show/text "*" append pin-get "3"]
		return pad 15x0
		pin-show: pin-field ""
		return pad 15x0
		button "Enter" 205x30 middle :on-pin-enter
		do [
			clear pin-show/text
		]
	]

	passphrase-dlg: layout [
		title "Please enter your passphrase"
		on-close [
			clear passphrase-in/text
			clear confirm-passphrase/text
			on-passphrase-enter none none
		]
		below center
		header: text "Note: Passphrase is case-sensitive" 
		panel [text 130 "Passphrase:" passphrase-in: field 180 ""]
		panel [text 130 "Confirm Passphrase:" confirm-passphrase: field 180 "" ]
		check "Show passphrase" [
			show-passphrase?: either face/data [none]['password]
			passphrase-in/flags: show-passphrase?
			confirm-passphrase/flags: show-passphrase?
		]
		button "Enter" :on-passphrase-enter
		with [passphrase-in/flags: 'password confirm-passphrase/flags: 'password]
	]
]

trezor: context [
	name:	"Trezor One"
	id:		[1209h 53C1h]

	message-version: 'default
	model:	"1"
	command-buffer: make binary! 1000

	DEFAULT_VERSION:	1
	DEFAULT_SEQUENCE:	-1
	DEFAULT_LOCKTIME:	0

	pin-get: make string! 16
	pin-msg: none
	pin-req: none
	pin-ret: none
	request-pin-state: 'Init							;-- Init/Requesting/HasRequested/DeviceError
	serialized_tx: make binary! 500

	no-wait?: false
	passphrase-in: none
	confirm-passphrase: none

	driver: make trezor-driver [
		init: does [
			hid-version: 1
		]
	]

	system/catalog/errors/user: make system/catalog/errors/user [
		trezor: ["trezor [" :arg1 ": (" :arg2 " " :arg3 ")]"]
	]

	new-error: func [name [word!] arg2 arg3][
		cause-error 'user 'trezor [name arg2 arg3]
	]

	connect: does [driver/connect id]

	close: does [
		driver/close
		request-pin-state: 'Init
	]

	init: func [/local res][
		if request-pin-state <> 'Init [return request-pin-state]
		request-pin-state: 'Init
		driver/init
		res: make map! 20
		Initialize res
		model: res/model
		name: either model = "1" ["Trezor One"]["Trezor Model T"]
		message-version: get-message-version res
		if message-version = 'v6 [
			trezor-message/messages: trezor-message/messages-v6
		]
	]

	close-pin-requesting: does [
		either model = "1" [
			if request-pin-state = 'Requesting [
				unview/only pin-dlg
			]
			request-pin-state: 'Init
		][
			request-pin-state: 'Requesting
		]
	]

	request-pin: func [return: [word!]] [
		if model = "T" [return request-pin-state: 'Requesting]

		if request-pin-state <> 'Init [return request-pin-state]

		pin-req: make map! reduce ['address_n reduce [8000002Ch 8000003Ch 80000000h]]
		put pin-req 'show_display false
		pin-msg: 'EthereumGetAddress
		clear pin-get

		request-pin-state: try [request-pin-cmd]
		if error? request-pin-state [return request-pin-state: 'DeviceError]

		if request-pin-state = 'Requesting [
			either driver/msg-id = trezor-message/get-id 'PinMatrixRequest [
				view/flags pin-dlg 'modal
				if driver/msg-id = trezor-message/get-id 'PassphraseRequest [
					request-pin-state: 'Requesting
					view/flags passphrase-dlg 'modal
				]
			][
				view/flags passphrase-dlg 'modal
			]
		]
		request-pin-state
	]

	request-pin-cmd: func [return: [word!]][
		encode-and-write pin-msg pin-req
		driver/message-read clear command-buffer

		if driver/msg-id = trezor-message/get-id 'EthereumAddress [
			return 'HasRequested
		]
		if driver/msg-id = trezor-message/get-id 'PinMatrixRequest [
			return 'Requesting
		]
		if driver/msg-id = trezor-message/get-id 'PassphraseRequest [
			return 'Requesting
		]
		'DeviceError
	]

	get-eth-address: func [
		ids				[block!]
		return:			[string!]
		/local
			res len address
	][
		res: make map! []
		EthereumGetAddress ids res
		if message-version = 'default [return res/address]
		if address: any [res/address res/old_address] [
			return rejoin ["0x" enbase/base address 16]
		]
		new-error 'get-eth-address "addr none" res
	]

	get-btc-address: func [
		ids				[block!]
		return:			[string!]
		/local res len coin-name segwit?
	][
		res: make map! []
		coin-name: "Bitcoin"
		if ids/2 = (80000000h + 1) [
			coin-name: "Testnet"
		]
		segwit?: false
		if ids/1 = (80000000h + 49) [
			segwit?: true
		]
		GetAddress ids coin-name segwit? res
		if res/address = none [new-error 'get-btc-address "addr none" res]
		res/address
	]

	get-eth-signed-data: func [
		ids				[block!]
		tx				[block!]
		chain-id		[integer!]
		return:			[binary!]
		/local
			req res nonce gas_price gas_limit amount signed data-len *to
	][
		nonce: trim/head to binary! tx/1
		gas_price: trim/head i256-to-bin tx/2
		gas_limit: trim/head to binary! tx/3
		amount: trim/head i256-to-bin tx/5
		data-len: length? tx/6
		either message-version = 'default [
			*to: rejoin ["0x" enbase/base tx/4 16]
		][
			*to: tx/4
		]
		req: make map! reduce [
			'address_n ids
			'nonce nonce 'gas_price gas_price 'gas_limit gas_limit
			'to *to 'value amount 'chain_id chain-id
		]
		if data-len > 0 [
			put req 'data_length data-len
			put req 'data_initial_chunk tx/6
		]
		res: make map! []
		if error? try [EthereumSignTx req res][return none]

		append tx reduce [
			to-bin8 res/signature_v
			res/signature_r
			res/signature_s
		]
		rlp/encode tx
	]

	get-btc-signed-data: func [
		tx			[block!]
		nutx		[block!]
	][
		SignTxSequence tx nutx
	]

	;===================
	;-- commands
	;===================

	Initialize: func [
		res				[map!]
		return:			[integer!]
	][
		WriteAndRead 'Initialize 'Features #[] res
	]

	EthereumGetAddress: func [
		ids				[block!]
		res				[map!]
		return:			[integer!]
		/local
			req			[map!]
	][
		req: make map! reduce ['address_n ids]
		put req 'show_display false
		PinMatrixSequence 'EthereumGetAddress 'EthereumAddress req res
	]

	EthereumSignTx: func [
		req				[map!]
		res				[map!]
		return:			[integer!]
		/local
			res2		[map!]
	][
		encode-and-write 'EthereumSignTx req
		driver/message-read clear command-buffer

		if driver/msg-id = trezor-message/get-id 'PinMatrixRequest [
			request-pin-state: 'Requesting
			if model = "1" [
				clear pin-get
				pin-req: req
				pin-msg: 'EthereumSignTx
				view/flags pin-dlg 'modal
			]
		]

		if driver/msg-id <> trezor-message/get-id 'ButtonRequest [
			new-error 'EthereumSignTx "not ButtonRequest" driver/msg-id
		]

		res2: make map! []
		proto-encode/decode trezor-message/messages 'ButtonRequest res2 command-buffer
		res2: make map! []
		WriteAndRead 'ButtonAck 'ButtonRequest #[] res2
		WriteAndRead 'ButtonAck 'EthereumTxRequest #[] res
	]

	SignTxSequence: func [
		tx				[block!]
		nutx			[block!]
		/local
			input-segwit?
			coin_name res-in req sub-req
			request_type details request_index tx_hash serialized
			tx-input tx-output pre-input pre-output script_type addr-name addr
			last-request_type
			last-output-remove
			bin
	][
		clear serialized_tx
		last-request_type: none
		last-output-remove: false

		coin_name: "Bitcoin"
		if tx/inputs/1/path/2 = (80000000h + 1) [
			coin_name: "Testnet"
		]
		input-segwit?: false
		if tx/inputs/1/path/1 = (80000000h + 49) [
			input-segwit?: true
		]
		res-in: make map! []

		;-- first step, send "SignTx" message
		SignTx length? tx/outputs length? tx/inputs coin_name DEFAULT_LOCKTIME res-in

		forever [
			request_type: select res-in 'request_type
			if request_type = 'TXINPUT [
				details: select res-in 'details
				serialized: select res-in 'serialized
				request_index: select details 'request_index
				tx_hash: select details 'tx_hash
				if all [tx_hash = none request_index <> none] [
					tx-input: tx/inputs/(request_index + 1)
					pre-output: pick tx-input/info/outputs tx-input/info/index + 1
					script_type: either pre-output/type = "P2SH" ['SPENDP2SHWITNESS]['SPENDADDRESS]
					sub-req: make map! reduce [
								'address_n tx-input/path
								'prev_hash debase/base tx-input/tx-hash 16
								'prev_index tx-input/info/index
								'sequence select tx-input/info/inputs/1 'sequence
								'script_type script_type]
					if pre-output/type = "P2SH" [
						put sub-req 'amount trim/head i256-to-bin pre-output/value
					]
					req: make map! []
					put req 'inputs reduce [sub-req]
					req: make map! reduce ['tx req]
					clear res-in
					WriteAndRead 'TxAck 'TxRequest req res-in
				]
				if all [tx_hash <> none request_index <> none] [
					tx-input: FindInputByTxid tx/inputs tx_hash
					pre-input: tx-input/info/inputs/(request_index + 1)
					sub-req: make map! reduce [
								'prev_hash debase/base pre-input/prev-tx-hash 16
								'prev_index pre-input/prev-position
								'script_sig debase/base pre-input/script-hex 16
								'sequence select tx-input/info/inputs/1 'sequence]
					req: make map! []
					put req 'inputs reduce [sub-req]
					req: make map! reduce ['tx req]
					clear res-in
					WriteAndRead 'TxAck 'TxRequest req res-in
				]
				if serialized [
					if all [last-request_type = 'TXOUTPUT last-output-remove] [remove back tail serialized_tx]
					last-output-remove: false
					append serialized_tx select serialized 'serialized_tx
				]
			]
			
			if request_type = 'TXMETA [
				details: select res-in 'details
				request_index: select details 'request_index
				tx_hash: select details 'tx_hash
				if all [tx_hash <> none request_index = none][
					tx-input: FindInputByTxid tx/inputs tx_hash
					sub-req: make map! reduce [
								'version tx-input/info/version
								'lock_time tx-input/info/lock_time
								'inputs_cnt length? tx-input/info/inputs
								'outputs_cnt length? tx-input/info/outputs]
					req: make map! reduce ['tx sub-req]
					clear res-in
					WriteAndRead 'TxAck 'TxRequest req res-in
				]
			]

			if request_type = 'TXOUTPUT [
				details: select res-in 'details
				serialized: select res-in 'serialized
				request_index: select details 'request_index
				tx_hash: select details 'tx_hash
				if all [tx_hash <> none request_index <> none] [
					tx-input: FindInputByTxid tx/inputs tx_hash
					pre-output: tx-input/info/outputs/(request_index + 1)
					sub-req: make map! reduce [
								'amount trim/head i256-to-bin pre-output/value
								'script_pubkey debase/base pre-output/script-hex 16]
					req: make map! []
					put req 'bin_outputs reduce [sub-req]
					req: make map! reduce ['tx req]
					clear res-in
					WriteAndRead 'TxAck 'TxRequest req res-in
				]
				if all [tx_hash = none request_index <> none] [
					tx-output: tx/outputs/(request_index + 1)
					either tx/change-index = (request_index + 1) [
						addr-name: 'address_n
						addr: tx-output/path
						either tx-output/path/1 = (80000000h + 49) [
							script_type: 'PAYTOP2SHWITNESS
						][
							script_type: 'PAYTOADDRESS
						]
					][
						addr-name: 'address
						addr: tx-output/addr
						either coin_name = "Bitcoin" [
							either addr/1 = #"3" [
								script_type: 'PAYTOP2SHWITNESS
							][
								script_type: 'PAYTOADDRESS
							]
						][
							either addr/1 = #"2" [
								script_type: 'PAYTOP2SHWITNESS
							][
								script_type: 'PAYTOADDRESS
							]
						]
					]
					if not input-segwit? [
						script_type: 'PAYTOADDRESS
					]
					sub-req: make map! reduce [
								addr-name addr
								'amount trim/head i256-to-bin tx-output/value
								'script_type script_type]
					req: make map! []
					put req 'outputs reduce [sub-req]
					req: make map! reduce ['tx req]
					clear res-in
					encode-and-write 'TxAck req
					driver/message-read clear command-buffer
					either driver/msg-id = trezor-message/get-id 'TxRequest [
						proto-encode/decode trezor-message/messages 'TxRequest res-in command-buffer
					][
						either driver/msg-id = trezor-message/get-id 'ButtonRequest [
							clear res-in
							proto-encode/decode trezor-message/messages 'ButtonRequest res-in command-buffer

							encode-and-write 'ButtonAck make map! []

							clear res-in
							try [read-and-decode 'TxRequest res-in]
							if driver/msg-id = trezor-message/get-id 'ButtonRequest [
								clear res-in
								proto-encode/decode trezor-message/messages 'ButtonRequest res-in command-buffer

								encode-and-write 'ButtonAck make map! []

								clear res-in
								try [read-and-decode 'TxRequest res-in]
								if driver/msg-id = trezor-message/get-id 'Failure [
									return none
								]
							]
							if driver/msg-id = trezor-message/get-id 'Failure [
								return none
							]
						][
							new-error 'SignTxSequence "not support" 'driver/msg-id
						]
					]
				]
				if serialized [
					bin: select serialized 'serialized_tx
					if all [last-request_type = 'TXOUTPUT last-output-remove] [remove back tail serialized_tx]
					either all [bin/1 = #{02} 33 = length? bin][
						last-output-remove: true
					][
						last-output-remove: false
					]
					append serialized_tx bin
				]
			]
			if request_type = 'TXFINISHED [
				serialized: select res-in 'serialized
				if serialized [
					;if all [last-request_type = 'TXOUTPUT last-output-remove] [remove back tail serialized_tx]
					;last-output-remove: false
					append serialized_tx select serialized 'serialized_tx
				]
				break
			]
			last-request_type: request_type
		]
		serialized_tx
	]

	FindInputByTxid: func [
		inputs			[block!]
		txid			[binary!]
		return:			[block!]
		/local
			i item prev-hash
	][
		tx-hash: enbase/base txid 16
		foreach item inputs [
			if item/tx-hash = tx-hash [
				return item
			]
		]
		new-error 'FindInputByTxid "not found" reduce [inputs txid]
	]

	;-- base message transfer
	SignTx: func [
		outputs_count	[integer!]
		inputs_count	[integer!]
		coin_name		[string!]
		lock_time		[integer!]
		res				[map!]
		return:			[integer!]
		/local
			req			[map!]
	][
		req: make map! reduce ['outputs_count outputs_count 'inputs_count inputs_count 'coin_name coin_name 'lock_time lock_time]
		PinMatrixSequence 'SignTx 'TxRequest req res
	]

	GetAddress: func [
		ids				[block!]
		name			[string!]
		segwit?			[logic!]
		res				[map!]
		return:			[integer!]
		/local
			req			[map!]
	][
		req: make map! reduce ['address_n ids]
		put req 'coin_name name
		put req 'show_display false
		if segwit? [
			put req 'script_type 'SPENDP2SHWITNESS
		]
		PinMatrixSequence 'GetAddress 'Address req res
	]

	;-- A Sequence like this, GetAbcd -> [PinMatrixRequest -> PinMatrixAck -> GetAbcd] -> Abcd
	PinMatrixSequence: func [
		req-msg			[word!]
		res-msg			[word!]
		req				[map!]
		res				[map!]
		return:			[integer!]
	][
		encode-and-write req-msg req
		driver/message-read clear command-buffer

		either model = "1" [
			if driver/msg-id = trezor-message/get-id 'PinMatrixRequest [
				request-pin-state: 'Requesting
				clear pin-get
				pin-req: req
				pin-msg: req-msg
				view/flags pin-dlg 'modal
			]

			if driver/msg-id = trezor-message/get-id 'PassphraseRequest [
				clear passphrase-in/text
				clear confirm-passphrase/text
				view/flags passphrase-dlg 'modal
			]
		][
			either any [
				driver/msg-id = trezor-message/get-id 'PinMatrixRequest
				driver/msg-id = trezor-message/get-id 'PassphraseRequest
			][
				request-pin-state: 'Requesting
			][
				request-pin-state: 'HasRequested
			]
		]

		if driver/msg-id = trezor-message/get-id res-msg [
			return proto-encode/decode trezor-message/messages res-msg res command-buffer
		]

		new-error 'PinMatrixSequence "unknown id" driver/msg-id
	]

	WriteAndRead: func [
		req-msg			[word!]
		res-msg			[word!]
		req				[map!]
		res				[map!]
		return:			[integer!]
	][
		encode-and-write req-msg req
		driver/message-read clear command-buffer
		if driver/msg-id = trezor-message/get-id res-msg [
			return proto-encode/decode trezor-message/messages res-msg res command-buffer
		]

		new-error 'WriteAndRead "unknown id" driver/msg-id
	]

	encode-and-write: func [
		msg				[word!]
		value			[map!]
		return:			[integer!]
	][
		proto-encode/encode trezor-message/messages msg value clear command-buffer
		driver/message-write command-buffer trezor-message/get-id msg
	]

	read-and-decode: func [
		msg				[word!]
		value			[map!]
		return:			[integer!]
	][
		driver/message-read clear command-buffer
		proto-encode/decode trezor-message/messages msg value command-buffer
	]

	on-pin-enter: func [face event][
		if request-pin-state = 'Requesting [
			pin-ret: try [encode-and-write 'PinMatrixAck make map! reduce ['pin pin-get]]
			if error? pin-ret [
				request-pin-state: 'DeviceError
				unview
				exit
			]

			pin-ret: try [driver/message-read clear command-buffer]
			if error? pin-ret [
				request-pin-state: 'DeviceError
				unview
				exit
			]
			if driver/msg-id = trezor-message/get-id 'Failure [
				clear pin-show/text
				pin-header/text: "Input Pin Failure! Enter Pin again."
				request-pin-state: try [request-pin-cmd]
				if error? request-pin-state [
					request-pin-state: 'DeviceError
					unview
				]
				clear pin-get
				exit
			]
			request-pin-state: 'HasRequested
		]
		clear pin-show/text
		clear pin-get
		unview
	]

	on-passphrase-enter: func [face event][
		if request-pin-state = 'Requesting [
			if passphrase-in/text <> confirm-passphrase/text [
				header/text: "Passphrases do not match!"
				clear passphrase-in/text
				clear confirm-passphrase/text
				exit
			]
			pin-ret: try [encode-and-write 'PassphraseAck make map! reduce ['passphrase confirm-passphrase/text]]
			if error? pin-ret [
				request-pin-state: 'DeviceError
				unview
				exit
			]
			pin-ret: try [driver/message-read clear command-buffer]
			if any [error? pin-ret driver/msg-id = trezor-message/get-id 'Failure] [
				request-pin-state: 'DeviceError
				unview
				exit
			]
			request-pin-state: 'HasRequested
		]
		clear passphrase-in/text
		clear confirm-passphrase/text
		unview
	]

	pin-dlg: layout [
		title "Please enter your PIN"
		on-close [
			close-pin-requesting
			close
		]
		style label: text 220 middle
		style but: button 60x60 "*"
		style pin-field: field 205 middle
		pad 15x0 pin-header: label "Look at the device for number positions."
		return pad 15x0
		but [append pin-show/text "*" append pin-get "7"]
		but [append pin-show/text "*" append pin-get "8"]
		but [append pin-show/text "*" append pin-get "9"]
		return pad 15x0
		but [append pin-show/text "*" append pin-get "4"]
		but [append pin-show/text "*" append pin-get "5"]
		but [append pin-show/text "*" append pin-get "6"]
		return pad 15x0
		but [append pin-show/text "*" append pin-get "1"]
		but [append pin-show/text "*" append pin-get "2"]
		but [append pin-show/text "*" append pin-get "3"]
		return pad 15x0
		pin-show: pin-field ""
		return pad 15x0
		button "Enter" 205x30 middle :on-pin-enter
		do [
			clear pin-show/text
		]
	]

	passphrase-dlg: layout [
		title "Please enter your passphrase"
		on-close [
			clear passphrase-in/text
			clear confirm-passphrase/text
			on-passphrase-enter none none
		]
		below center
		header: text "Note: Passphrase is case-sensitive" 
		panel [text 130 "Passphrase:" passphrase-in: field 180 ""]
		panel [text 130 "Confirm Passphrase:" confirm-passphrase: field 180 "" ]
		check "Show passphrase" [
			show-passphrase?: either face/data [none]['password]
			passphrase-in/flags: show-passphrase?
			confirm-passphrase/flags: show-passphrase?
		]
		button "Enter" :on-passphrase-enter
		with [passphrase-in/flags: 'password confirm-passphrase/flags: 'password]
	]
]
