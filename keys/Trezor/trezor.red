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

trezor: context [
	name:	"Trezor One"
	id:		[534Ch 1]

	command-buffer: make binary! 1000

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

	system/catalog/errors/user: make system/catalog/errors/user [trezor: ["trezor [" :arg1 ": (" :arg2 " " :arg3 ")]"]]

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
		Initialize #()
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
			res len
	][
		res: make map! []
		EthereumGetAddress ids res
		if res/address = none [new-error 'get-eth-address "addr none" res]
		rejoin ["0x" enbase/base res/address 16]
	]

	get-eth-signed-data: func [
		ids				[block!]
		tx				[block!]
		chain-id		[integer!]
		return:			[binary!]
		/local
			req res nonce gas_price gas_limit amount signed data-len
	][
		nonce: trim/head to binary! tx/1
		gas_price: trim/head i256-to-bin tx/2
		gas_limit: trim/head to binary! tx/3
		amount: trim/head i256-to-bin tx/5
		data-len: length? tx/6
		req: make map! reduce [
			'address_n ids
			'nonce nonce 'gas_price gas_price 'gas_limit gas_limit
			'to tx/4 'value amount 'chain_id chain-id
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
		WriteAndRead 'Initialize 'Features #() res
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
		WriteAndRead 'ButtonAck 'ButtonRequest #() res2
		WriteAndRead 'ButtonAck 'EthereumTxRequest #() res
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

trezor-mt: make context [
	name:	"Trezor Model T"
	id:		[1209h 53C1h]
	driver: make trezor-driver []

	command-buffer: make binary! 1000
	request-pin-state: 'Init		;-- Init/Requesting/HasRequested/DeviceError
	serialized_tx: make binary! 500

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

	close-pin-requesting: does [
		request-pin-state: 'Requesting
	]

	request-pin: func [return: [word!]] [
		request-pin-state: 'Requesting
	]

	init: func [][
		request-pin-state: 'Init
		driver/hid-version: 1
		Initialize #()
	]

	get-eth-address: func [
		ids				[block!]
		return:			[string!]
		/local
			res len
	][
		res: make map! []
		EthereumGetAddress ids res
		if res/address = none [new-error 'get-eth-address "addr none" res]
		rejoin ["0x" enbase/base res/address 16]
	]

	get-eth-signed-data: func [
		ids				[block!]
		tx				[block!]
		chain-id		[integer!]
		return:			[binary!]
		/local
			req res nonce gas_price gas_limit amount signed data-len
	][
		nonce: trim/head to binary! tx/1
		gas_price: trim/head i256-to-bin tx/2
		gas_limit: trim/head to binary! tx/3
		amount: trim/head i256-to-bin tx/5
		data-len: length? tx/6
		req: make map! reduce [
			'address_n ids
			'nonce nonce 'gas_price gas_price 'gas_limit gas_limit
			'to tx/4 'value amount 'chain_id chain-id
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
		WriteAndRead 'Initialize 'Features #() res
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
		]

		if driver/msg-id <> trezor-message/get-id 'ButtonRequest [
			new-error 'EthereumSignTx "not ButtonRequest" driver/msg-id
		]

		res2: make map! []
		proto-encode/decode trezor-message/messages 'ButtonRequest res2 command-buffer
		res2: make map! []
		WriteAndRead 'ButtonAck 'ButtonRequest #() res2
		WriteAndRead 'ButtonAck 'EthereumTxRequest #() res
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

		either any [
			driver/msg-id = trezor-message/get-id 'PinMatrixRequest
			driver/msg-id = trezor-message/get-id 'PassphraseRequest
		][
			request-pin-state: 'Requesting
		][
			request-pin-state: 'HasRequested
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
]
