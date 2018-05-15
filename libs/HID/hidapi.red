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
	get-devs: routine [
		vendor_id	[integer!]
		product_id	[integer!]
		return:		[block!]
		/local

	][
		hid/get-devs vendor_id product_id
	]

	open: routine [
		serial-num	[string!]
		/local
			h		[int-ptr!]
	][
		h: hid/open unicode/to-utf16 serial-num
		either null? h [stack/set-last none-value][
			handle/box as-integer h
		]
	]

	read: routine [
		dev		[handle!]
		buffer	[binary!]
		timeout [integer!]		;-- millisec
		/local
			s	[series!]
			p	[byte-ptr!]
			sz	[integer!]
	][
		s: GET_BUFFER(buffer)
		p: (as byte-ptr! s/offset) + buffer/head
		sz: hid/read-timeout as int-ptr! dev/value p s/size timeout
		either sz = -1 [
			;probe "read error"
			stack/set-last none-value
		][
			s/tail: as cell! (p + sz)
		]
	]

	write: routine [
		dev		[handle!]
		data	[binary!]
		/local
			sz	[integer!]
	][
		sz: hid/write as int-ptr! dev/value binary/rs-head data binary/rs-length? data
		;if sz = -1 [
		;	probe "write error"
		;]
	]

	close: routine [
		dev		[handle!]
	][
		if dev/value <> 0 [hid/close as int-ptr! dev/value]
	]
]
