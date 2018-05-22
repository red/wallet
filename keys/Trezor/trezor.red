Red [
	Title:	"Driver for Trezor"
	Author: "bitbegin"
	File: 	%trezor.red
	Tabs: 	4
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

#include %message.red
#include %../../libs/protobuf.red

trezor: context [
	name: "Trezor"

	vendor-id:			534Ch
	product-id:			1
	id: product-id << 16 or vendor-id

	dongle: none
	hid-version: 0
	data-frame: make binary! 65
	read-frame: make binary! 1000
	msg-id: 0

	connect: func [serial-num [string! none!]][
		unless dongle [
			dongle: hid/open id serial-num
			if dongle <> none [
				hid-version: get-hid-version

				tmp: make binary! 100
				len: Initialize tmp tmp
				print ["len: " len lf]
				print ["tmp: " tmp lf]
			]
		]
		dongle
	]

	;===================
	;-- commands
	;===================

	Initialize: func [
		cmd				[binary!]
		res				[binary!]
		return:			[integer!]
		/local
			len			[integer!]
	][
		if protobuf/msg-ctx = none [protobuf/init-ctx 'message]
		len: protobuf/encode 'Initialize #() cmd
		if len < 0 [return -1]
		len: message-write cmd message/get-msg-id 'Initialize
		if len < 0 [return -1]
		len: message-read res
		len
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

