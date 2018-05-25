Red [
	Title:	"Library for communication with HID devices"
	Author: "Xie Qingtian"
	File: 	%hidapi.red
	Tabs: 	4
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

#system [
	#switch OS [
		Windows  [#include %windows.reds]
		macOS	 [#include %macOS.reds]
		#default []
	]

	int-to-bin*: func [int [integer!] bin [red-binary!]
		/local
			p	[int-ptr!]
			s	[series!]
	][
		s: GET_BUFFER(bin)
		p: as int-ptr! s/tail
		p/1: int
		s/tail: as cell! p + 1
	]
]

hid: context [
	enumerate-connected-devices: routine [
		ids			[block!]
		return:		[block!]
	][
		hid/enumerate-connected-devices ids
	]

	free-enum: routine [][
		hid/hid-free-enumeration
	]

	open: routine [
		id			[integer!]
		index		[integer!]
		/local
			h		[int-ptr!]
	][
		if hid/enum-freed? [stack/set-last none-value]

		h: hid/open id index
		either null? h [
			stack/set-last none-value
		][
			handle/box as-integer h
		]
	]

	read: routine [
		dev			[handle!]
		buffer		[binary!]
		timeout		[integer!]		;-- millisec
		return:		[integer!]
		/local
			s	[series!]
			p	[byte-ptr!]
			sz	[integer!]
	][
		s: GET_BUFFER(buffer)
		p: (as byte-ptr! s/offset) + buffer/head
		sz: hid/read-timeout as int-ptr! dev/value p s/size timeout
		if sz <> -1 [
			s/tail: as cell! (p + sz)
		]
		sz
	]

	write: routine [
		dev			[handle!]
		data		[binary!]
		return:		[integer!]
		/local
			sz		[integer!]
	][
		sz: hid/write as int-ptr! dev/value binary/rs-head data binary/rs-length? data
		;if sz = -1 [
		;	probe "write error"
		;]
		sz
	]

	close: routine [
		dev		[handle!]
	][
		if dev/value <> 0 [hid/close as int-ptr! dev/value]
	]
]
