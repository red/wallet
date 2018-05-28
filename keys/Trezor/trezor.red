Red [
	Title:	"Driver for Trezor"
	Author: "bitbegin"
	File: 	%trezor.red
	Tabs: 	4
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

#include %message.red

trezor: context [
	name: "Trezor"

	vendor-id:			534Ch
	product-id:			1
	id: product-id << 16 or vendor-id

	dongle: none
	hid-version: 0
	data-frame: make binary! 65
	command-buffer: make binary! 1000
	msg-id: 0
	pin-get: make string! 16

	filter?: func [
		_id				[integer!]
		_usage			[integer!]
		return:			[logic!]
	][
		if _id <> id [return false]
		if (_usage >>> 16) = FF01h [return false]		;-- skip debug integerface
		if (_usage >>> 16) = F1D0h [return false]		;-- skip fido integerface
		true
	]

	connect: func [index [integer!]][
		unless dongle [
			dongle: hid/open id index
			if dongle <> none [
				hid-version: get-hid-version
			]
		]
		dongle
	]

	set-init: func [][
		res: make map! []
		len: Initialize res
		if len < 0 [return 'InitFailure]
		return 'InitSuccess
	]

	get-address: func [
		idx				[integer!]
		/local
			res len
	][
		res: make map! []
		len: EthereumGetAddress idx res
		if len < 0 [
			if msg-id = message/get-msg-id 'Failure [
				return 'Failure
			]
			return 'OtherFailure
		]
		if res/address = none [return 'NoneAddress]
		rejoin ["0x" enbase/base res/address 16]
	]

	get-signed-data: func [
		idx				[integer!]
		tx				[block!]
		chain-id		[integer!]
		/local
			req			[map!]
			res			[map!]
			nonce
			gas_price
			gas_limit
			amount
			signed
			len
	][
		nonce: trim/head to binary! tx/1
		gas_price: trim/head i256-to-bin tx/2
		gas_limit: trim/head to binary! tx/3
		amount: trim/head i256-to-bin tx/5
		req: make map! reduce [
			'address_n reduce [8000002Ch 8000003Ch 80000000h 0 idx]
			'nonce nonce 'gas_price gas_price 'gas_limit gas_limit
			'_to tx/4 'value amount 'chain_id chain-id
		]
		res: make map! []
		len: EthereumSignTx req res
		either len > 0 [
			append tx reduce [
				to-bin8 res/signature_v
				res/signature_r
				res/signature_s
			]
			rlp/encode tx
		]['SignError]
	]

	;===================
	;-- commands
	;===================

	Initialize: func [
		res				[map!]
		return:			[integer!]
		/local
			len			[integer!]
	][
		if protobuf/msg-ctx = none [protobuf/init-ctx 'message]
		len: encode-and-write 'Initialize #()
		if len < 0 [return len]
		len: read-and-decode 'Features res
		len
	]

	EthereumGetAddress: func [
		idx				[integer!]
		res				[map!]
		return:			[integer!]
		/local
			len			[integer!]
			req			[map!]
	][
		req: make map! reduce ['address_n reduce [8000002Ch 8000003Ch 80000000h 0 idx]]
		put req 'show_display false
		len: encode-and-write 'EthereumGetAddress req
		if len < 0 [return len]

		clear command-buffer
		len: message-read command-buffer
		if len < 0 [return len]
		if msg-id = message/get-msg-id 'EthereumAddress [
			len: protobuf/decode 'EthereumAddress res command-buffer
			return len
		]

		if msg-id <> message/get-msg-id 'PinMatrixRequest [return -1]
		len: PinMatrix
		if len < 0 [return len]

		len: read-and-decode 'EthereumAddress res
		if msg-id <> message/get-msg-id 'EthereumAddress [return -1]
		len
	]

	PinMatrix: func [
		return:			[integer!]
		/local
			len			[integer!]
	][
		len: protobuf/decode 'PinMatrixRequest make map! [] command-buffer
		if len < 0 [return len]
		clear pin-get
		pin-dlg pin-get
		len: encode-and-write 'PinMatrixAck make map! reduce ['pin pin-get]
		len
	]

	EthereumSignTx: func [
		req				[map!]
		res				[map!]
		return:			[integer!]
		/local
			len			[integer!]
			res2		[map!]
	][
		len: encode-and-write 'EthereumSignTx req
		if len < 0 [return len]

		clear command-buffer
		len: message-read command-buffer
		if len < 0 [return len]

		if msg-id = message/get-msg-id 'PinMatrixRequest [
			len: PinMatrix
			if len < 0 [return len]
			clear command-buffer
			len: message-read command-buffer
			if len < 0 [return len]
		]

		if msg-id <> message/get-msg-id 'ButtonRequest [return -1]

		res2: make map! []
		len: protobuf/decode 'ButtonRequest res2 command-buffer
		if len < 0 [return len]

		len: encode-and-write 'ButtonAck make map! []
		if len < 0 [return len]

		res2: make map! []
		len: read-and-decode 'ButtonRequest res2
		if len < 0 [return len]
		len: encode-and-write 'ButtonAck make map! []
		if len < 0 [return len]

		len: read-and-decode 'EthereumTxRequest res
		len
	]

	encode-and-write: func [
		msg				[word!]
		value			[map!]
		return:			[integer!]
		/local
			len			[integer!]
	][
		clear command-buffer
		;-- print ["msg: " msg]
		;-- print ["value: " value]
		len: protobuf/encode msg value command-buffer
		if len < 0 [return len]
		len: message-write command-buffer message/get-msg-id msg
		if len < 0 [return len]
		len
	]

	read-and-decode: func [
		msg				[word!]
		value			[map!]
		return:			[integer!]
		/local
			len			[integer!]
	][
		clear command-buffer
		len: message-read command-buffer
		if len < 0 [return len]
		len: protobuf/decode msg value command-buffer
		if len < 0 [return len]
		len
	]

	pin-dlg: func [
		pin		[string!]
	][
		dlg: layout [
			title "Please enter your PIN"
			style label: text 400 middle
			style but: button 50x50 "*"
			style pin-field: field 200 middle
			label "Look at the device for number positions." return
			but [append pin-show/text "*" append pin "7"]
			but [append pin-show/text "*" append pin "8"]
			but [append pin-show/text "*" append pin "9"] return
			but [append pin-show/text "*" append pin "4"]
			but [append pin-show/text "*" append pin "5"]
			but [append pin-show/text "*" append pin "6"] return
			but [append pin-show/text "*" append pin "1"]
			but [append pin-show/text "*" append pin "2"]
			but [append pin-show/text "*" append pin "3"] return
			pin-show: pin-field "" return
			button "Enter" 200 middle [unview]
			do [
				clear pin-show/text
			]
		]

		view/flags dlg 'modal
	]

	;-- high level interface for message write
	message-write: func [
		data			[binary!]
		_id				[integer!]
		return:			[integer!]
		/local
			sz			[integer!]
			msg			[binary!]
			r			[integer!]
	][
		msg-id: _id
		sz: length? data
		msg: make binary! 8 + sz
		append msg reduce [
			to integer! #"#"
			to integer! #"#"
			to-bin16 _id
			to-bin32 sz
			data
		]
		r: write msg
		r
	]

	;-- high level interface for message read
	message-read: func [
		data		[binary!]
		return: 	[integer!]
		/local
			buf		[binary!]
			size	[integer!]
			max		[integer!]
	][
		clear data-frame

		buf: #{000000000000}
		clear buf
		read-buffered buf 1
		while [buf/1 <> to integer! #"#"] [
			clear buf
			read-buffered buf 1
		]

		clear buf
		read-buffered buf 1
		if buf/1 <> to integer! #"#" [return -1]

		clear buf
		read-buffered buf 6
		msg-id: to-int16 buf
		size: to-int32 skip buf 2

		max: 1024 * 1024
		if size > max [return -1]
		size: read-buffered data size
		size
	]

	;-- low level read, read data from buffer
	read-buffered: func [
		data		[binary!]
		len			[integer!]
		/local
			n		[integer!]
			r		[integer!]
			sz		[integer!]
	][
		sz: len
		while [true] [
			if 0 = length? data-frame [
				r: buffer-report
				if r < 0 [return r]
			]

			n: read-report-from-buffer data len
			either n < len [
				len: len - n
			][break]
		]
		sz
	]

	read-report-from-buffer: func [
		data		[binary!]
		len			[integer!]
		return:		[integer!]
		/local
			n		[integer!]
	][
		n: length? data-frame
		if len > n [len: n]
		append data copy/part data-frame len
		data-frame: skip data-frame len
		len
	]

	;-- low level read, put report data to buffer
	buffer-report: func [
		return:		[integer!]
		/local r sz
	][
		until [
			data-frame: clear head data-frame
			r: hid/read dongle data-frame 50
			r <> 0
		]
		if r <= 0 [return r]
		sz: data-frame/1
		if r - 1 < sz [sz: r - 1]
		clear skip data-frame sz + 1
		data-frame: skip head data-frame 1
		sz
	]

	;-- low level write: adapt data length
	write: func [
		data			[binary!]
		return:			[integer!]
		/local
			len			[integer!]
			sz			[integer!]
			r			[integer!]
			src			[binary!]
	][
		len: length? data
		until [
			sz: length? data
			if sz > 63 [sz: 63]
			r: write-report data sz
			if r < 0 [return r]
			data: skip data sz
			tail? data
		]
		len
	]

	;-- low level write: only be used by `write`
	write-report: func [
		data			[binary!]
		size			[integer!]
		return:			[integer!]
		/local
			i			[integer!]
			cnt			[integer!]
			r			[integer!]
	][
		clear data-frame
		switch hid-version [
			1	[append data-frame #{3F}]
			2	[append data-frame #{00} append data-frame #{3F}]
		]

		cnt: 1
		loop 63 [
			either cnt <= size [
				append data-frame data/:cnt
			][
				append data-frame #{00}
			]
			cnt: cnt + 1
		]

		r: hid/write dongle data-frame
		if any [r < 0 r < length? data-frame] [
			return -1
		]
		size
	]


	get-hid-version: func [/local data sz][
		clear data-frame
		loop 65 [
			append data-frame #{ff}
		]
		data-frame/1: 0
		data-frame/2: 3Fh
		sz: hid/write dongle data-frame
		if sz = 65 [return 2]

		clear back tail data-frame
		data-frame/1: 3Fh
		data-frame/2: FFh
		sz: hid/write dongle data-frame
		if sz = 64 [return 1]

		0
	]

	close: does [
		if dongle <> none [
			hid/close dongle 
			dongle: none
		]
	]
]

