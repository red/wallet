Red [
	Title:	"Driver for Ledger Nano S"
	Author: "Xie Qingtian"
	File: 	%ledger.red
	Tabs: 	4
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

ledger: context [
	name: "Ledger Nano S"

	vendor-id:			2C97h
	product-id:			1
	id: product-id << 16 or vendor-id

	DEFAULT_CHANNEL:	0101h
	TAG_APDU:			05h
	PACKET_SIZE:		#either config/OS = 'Windows [65][64]
	MAX_APDU_SIZE:		260

	dongle: none
	buffer:		make binary! MAX_APDU_SIZE
	data-frame: make binary! PACKET_SIZE

	filter?: func [
		_id				[integer!]
		_usage			[integer!]
		return:			[logic!]
	][
		if _id <> id [return false]
		true
	]

	opened?: func [return: [logic!]] [
		if dongle = none [return false]
		true
	]

	connect: func [index [integer!]][
		unless dongle [
			dongle: hid/open id index
		]
		dongle
	]

	set-init: func [][
		return 'InitSuccess
	]

	read-apdu: func [
		timeout [integer!]				;-- seconds
		/local idx total msg-len data
	][
		idx: 0
		clear buffer
		until [
			if -1 = hid/read dongle clear data-frame timeout * 1000 [
				return buffer
			]

			data: data-frame

			;-- sanity check the frame
			if DEFAULT_CHANNEL <> to-int16 data [
				return copy/part data 4
			]
			if TAG_APDU <> data/3 [
				return buffer
			]
			if idx <> to-int16 skip data 3 [
				return buffer
			]

			;-- extract the message
			data: skip data 5
			if zero? idx [
				total: to-int16 data
				data: skip data 2
			]
			idx: idx + 1

			msg-len: min total length? data

			append/part buffer data msg-len
			total: total - msg-len
			zero? total
		]
		buffer
	]

	write-apdu: func [data [binary!] /local idx limit][
		idx: 0
		while [not empty? data][
			clear data-frame
			append data-frame reduce [	;-- header
				#if config/OS = 'Windows [0]
				to-bin16 DEFAULT_CHANNEL
				TAG_APDU
				to-bin16 idx
			]

			if zero? idx [				;-- first packet's header includes a two-byte length
				append data-frame to-bin16 length? data
			]
			idx: idx + 1

			limit: PACKET_SIZE - length? data-frame
			append/part data-frame data limit
			if PACKET_SIZE <> length? data-frame [
				append/dup data-frame 0 PACKET_SIZE - length? data-frame
			]
			data: skip data limit
			hid/write dongle data-frame
		]
	]

	get-eth-address: func [idx [block!] /local data pub-key-len addr-len][
		data: make binary! 20
		append data reduce [
			E0h
			02h
			0
			0
			4 * 4 + 1
			4
			to-bin32 idx/1
			to-bin32 idx/2
			to-bin32 idx/3
			to-bin32 idx/4
		]
		write-apdu data
		data: read-apdu 1

		case [
			40 < length? data [
				;-- parse reply data
				pub-key-len: to-integer data/1
				addr-len: to-integer pick skip data pub-key-len + 1 1
				rejoin ["0x" to-string copy/part skip data pub-key-len + 2 addr-len]
			]
			#{BF00018D} = data ['browser-support-on]
			#{6804} = data ['locked]
			#{6700} = data ['plug]
		]
	]

	sign-eth-tx: func [addr-idx [block!] tx [block!] /local data max-sz sz signed][
		;-- tx: [nonce, gasprice, startgas, to, value, data]
		tx-bin: rlp/encode tx
		chunk: make binary! 200
		while [not empty? tx-bin][
			clear chunk
			insert/dup chunk 0 5
			max-sz: either head? tx-bin [133][150]
			sz: min max-sz length? tx-bin
			chunk/1: E0h
			chunk/2: 04h
			chunk/3: either head? tx-bin [0][80h]
			chunk/4: 0
			chunk/5: either head? tx-bin [sz + 17][sz]
			if head? tx-bin [
				append chunk reduce [
					4
					to-bin32 addr-idx/1
					to-bin32 addr-idx/2
					to-bin32 addr-idx/3
					to-bin32 addr-idx/4
				]
			]
			append/part chunk tx-bin sz
			write-apdu chunk
			signed: read-apdu 300
			tx-bin: skip tx-bin sz
		]
		if signed = #{6A80} [return 'token-error]
		either 4 > length? signed [none][signed]
	]

	get-eth-signed-data: func [idx tx /local signed][
		signed: sign-eth-tx idx tx
		either all [signed binary? signed][
			append tx reduce [
				copy/part signed 1
				copy/part next signed 32
				copy/part skip signed 33 32
			]
			rlp/encode tx
		][signed]
	]

	close: does [
		if dongle <> none [
			hid/close dongle 
			dongle: none
		]
	]
]

;ledger/connect

;probe ledger/get-address 0

;ledger/close
