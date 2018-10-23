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
	name: "Trezor One"

	vendor-id:	534Ch
	product-id:	1

	ids: does [trezor-driver/ids]

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

	system/catalog/errors/user: make system/catalog/errors/user [trezor: ["trezor [" :arg1 ": (" :arg2 " " :arg3 ")]"]]

	new-error: func [name [word!] arg2 arg3][
		cause-error 'user 'trezor [name arg2 arg3]
	]

	filter?: func [
		_id				[integer!]
		_usage			[integer!]
		return:			[logic!]
	][
		unless find ids _id [return false]
		if (_usage >>> 16) = FF01h [return false]		;-- skip debug integerface
		if (_usage >>> 16) = F1D0h [return false]		;-- skip fido integerface
		true
	]

	support?: func [
		_id				[integer!]
		return:			[logic!]
	][
		if find ids _id [return true]
		false
	]

	connect: does [trezor-driver/connect]

	close: does [
		trezor-driver/close
		request-pin-state: 'Init
	]

	init: func [][
		request-pin-state: 'Init
		trezor-driver/init
		Initialize #()
	]

	close-pin-requesting: does [
		if request-pin-state = 'Requesting [
			unview/only pin-dlg
		]
		request-pin-state: 'Init
	]

	request-pin: func [return: [word!]] [
		;if request-pin-state <> 'Init [return request-pin-state]

		pin-req: make map! reduce ['address_n reduce [8000002Ch 8000003Ch 80000000h]]
		put pin-req 'show_display false
		pin-msg: 'EthereumGetAddress
		clear pin-get

		request-pin-state: try [request-pin-cmd]
		if error? request-pin-state [return request-pin-state: 'DeviceError]

		if request-pin-state = 'Requesting [
			either trezor-driver/msg-id = trezor-message/get-id 'PinMatrixRequest [
				view/flags pin-dlg 'modal
			][
				view/flags passphrase-dlg 'modal
			]
		]
		request-pin-state
	]

	request-pin-cmd: func [return: [word!]][
		encode-and-write pin-msg pin-req
		trezor-driver/message-read clear command-buffer

		if trezor-driver/msg-id = trezor-message/get-id 'EthereumAddress [
			return 'HasRequested
		]
		if trezor-driver/msg-id = trezor-message/get-id 'PinMatrixRequest [
			return 'Requesting
		]
		if trezor-driver/msg-id = trezor-message/get-id 'PassphraseRequest [
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
			req			[map!]
			res			[map!]
			nonce
			gas_price
			gas_limit
			amount
			signed
			data-len
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
		trezor-driver/message-read clear command-buffer

		if trezor-driver/msg-id = trezor-message/get-id 'PinMatrixRequest [
			request-pin-state: 'Requesting
			clear pin-get
			pin-req: req
			pin-msg: 'EthereumSignTx

			view/flags pin-dlg 'modal
		]

		if trezor-driver/msg-id <> trezor-message/get-id 'ButtonRequest [
			new-error 'EthereumSignTx "not ButtonRequest" trezor-driver/msg-id
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
		trezor-driver/message-read clear command-buffer

		if trezor-driver/msg-id = trezor-message/get-id 'PinMatrixRequest [
			request-pin-state: 'Requesting
			clear pin-get
			pin-req: req
			pin-msg: req-msg
			no-wait?: false
			view/flags pin-dlg 'modal
		]

		if trezor-driver/msg-id = trezor-message/get-id 'PassphraseRequest [
			clear passphrase-in/text
			clear confirm-passphrase/text
			no-wait?: false
			view/flags passphrase-dlg 'modal
		]

		if trezor-driver/msg-id = trezor-message/get-id res-msg [
			return proto-encode/decode trezor-message/messages res-msg res command-buffer
		]

		new-error 'PinMatrixSequence "unknown id" trezor-driver/msg-id
	]

	WriteAndRead: func [
		req-msg			[word!]
		res-msg			[word!]
		req				[map!]
		res				[map!]
		return:			[integer!]
	][
		encode-and-write req-msg req
		trezor-driver/message-read clear command-buffer
		if trezor-driver/msg-id = trezor-message/get-id res-msg [
			return proto-encode/decode trezor-message/messages res-msg res command-buffer
		]

		new-error 'WriteAndRead "unknown id" trezor-driver/msg-id
	]

	encode-and-write: func [
		msg				[word!]
		value			[map!]
		return:			[integer!]
	][
		proto-encode/encode trezor-message/messages msg value clear command-buffer
		trezor-driver/message-write command-buffer trezor-message/get-id msg
	]

	read-and-decode: func [
		msg				[word!]
		value			[map!]
		return:			[integer!]
	][
		trezor-driver/message-read clear command-buffer
		proto-encode/decode trezor-message/messages msg value command-buffer
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
		pad 15x0 header: label "Look at the device for number positions."
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
		button "Enter" 205x30 middle [
			if request-pin-state = 'Requesting [
				pin-ret: try [encode-and-write 'PinMatrixAck make map! reduce ['pin pin-get]]
				if error? pin-ret [
					request-pin-state: 'DeviceError
					unview
					exit
				]
				pin-ret: try [trezor-driver/message-read clear command-buffer]
				if error? pin-ret [
					request-pin-state: 'DeviceError
					unview
					exit
				]
				if trezor-driver/msg-id = trezor-message/get-id 'Failure [
					clear pin-show/text
					header/text: "Input Pin Failure! Enter Pin again."
					request-pin-state: try [request-pin-cmd]
					if error? request-pin-state [
						request-pin-state: 'DeviceError
						unview
					]
					clear pin-get
					exit
				]
				if trezor-driver/msg-id = trezor-message/get-id 'PassphraseRequest [
					view/flags passphrase-dlg 'modal
				]
				request-pin-state: 'HasRequested
			]
			clear pin-show/text
			clear pin-get
			unview
		]
		do [
			clear pin-show/text
		]
	]

	passphrase-dlg: layout [
		title "Please enter your passphrase"
		style label: text 220 middle
		pad 15x0 header: label "Note: Passphrase is case-sensitive"
		return
		text "Passphrase"
		return
		passphrase-in: field ""
		return
		text "Confirm Passphrase"
		return
		confirm-passphrase: field ""
		return
		check "Show passphrase"
		return
		button "Enter" middle [
			if request-pin-state = 'Requesting [
				if passphrase-in/text <> confirm-passphrase/text [
					header/text: "Input Passphrase Failure! Enter again."
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
				pin-ret: try [trezor-driver/message-read clear command-buffer]
				if any [error? pin-ret trezor-driver/msg-id = trezor-message/get-id 'Failure] [
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
	]

]
