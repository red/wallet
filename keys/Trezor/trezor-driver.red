Red [
	Title:	"low level Driver for Trezor"
	Author: "bitbegin"
	File: 	%trezor.red
	Tabs: 	4
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

trezor-driver: context [

	system/catalog/errors/user: make system/catalog/errors/user [
		trezor-driver: ["trezor-driver [" :arg1 ": (" :arg2 " " :arg3 ")]"]
	]

	new-error: func [name [word!] arg2 arg3][
		cause-error 'user 'trezor-driver [name arg2 arg3]
	]

	dongle: none

	hid-version: 0
	data-frame: make binary! 65
	msg-id: 0

	connect: func [id [block!]][
		unless dongle [
			dongle: hid/open id/1 id/2 1
		]
		dongle
	]

	close: does [
		if dongle <> none [
			hid/close dongle
			dongle: none
		]
	]

	init: does [
		hid-version: get-hid-version
	]

	;-- high level interface for message write
	message-write: func [
		data			[binary!]
		_id				[integer!]
		return:			[integer!]
		/local
			sz			[integer!]
			msg			[binary!]
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
		write msg
	]

	;-- high level interface for message read
	message-read: func [
		data		[binary!]
		return: 	[integer!]
		/local
			buf		[binary!]
			size	[integer!]
			_1MB	[integer!]
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
		if buf/1 <> to integer! #"#" [new-error 'message-read "invalid magic" buf/1]

		clear buf
		read-buffered buf 6
		msg-id: to-int16 buf
		size: to-int32 skip buf 2

		_1MB: 1024 * 1024
		if size > _1MB [new-error 'message-read "too large" reduce [size _1MB]]
		read-buffered data size
	]

	;-- low level read, read data from buffer
	read-buffered: func [
		data		[binary!]
		len			[integer!]
		return:		[integer!]
		/local
			n		[integer!]
			sz		[integer!]
	][
		sz: len
		forever [
			if 0 = length? data-frame [
				buffer-report
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
		/local
			ret		[integer!]
			sz		[integer!]
	][
		until [
			data-frame: clear head data-frame
			ret: hid/read dongle data-frame (600 * 1000)
			ret <> 0
		]
		if ret = 0 [return ret]
		sz: data-frame/1
		if ret - 1 < sz [sz: ret - 1]
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
			src			[binary!]
	][
		len: length? data
		until [
			sz: length? data
			if sz > 63 [sz: 63]
			write-report data sz
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
			ret			[integer!]
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

		ret: hid/write dongle data-frame
		if ret < length? data-frame [
			new-error 'write-report "not equal" reduce [ret length? data-frame]
		]
		size
	]

	get-hid-version: func [return: [integer!] /local data sz][
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

]
