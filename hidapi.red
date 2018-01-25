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
	#either OS = 'Windows [
		#define LIB_HID_API "hidapi.dll"
	][
		#define LIB_HID_API "libhidapi.so"
	]

	#import [
		"hidapi.dll" cdecl [
			hid_exit: "hid_exit" [
				return:		[integer!]
			]
			hid_open: "hid_open" [
				vendor_id	[integer!]
				product_id	[integer!]
				serial_num	[c-string!]
				return:		[int-ptr!]
			]
			hid_close: "hid_close" [
				device		[int-ptr!]
			]
			hid_write: "hid_write" [
				device		[int-ptr!]
				data		[byte-ptr!]
				length		[integer!]
				return:		[integer!]
			]
			hid_read_timeout: "hid_read_timeout" [
				device		[int-ptr!]
				data		[byte-ptr!]
				length		[integer!]
				millisec	[integer!]
				return:		[integer!]
			]
		]
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

	open: routine [
		vendor_id	[integer!]
		product_id	[integer!]
		return:		[handle!]
	][
		handle/box as-integer hid_open vendor_id product_id null
	]
	
	read: routine [
		dev		[handle!]
		buffer	[binary!]
		timeout [integer!]
		/local
			s	[series!]
			p	[byte-ptr!]
			sz	[integer!]
	][
		s: GET_BUFFER(buffer)
		p: (as byte-ptr! s/offset) + buffer/head
		sz: hid_read_timeout as int-ptr! dev/value p s/size timeout
		either sz = -1 [
			probe "read error"
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
		sz: hid_write as int-ptr! dev/value binary/rs-head data binary/rs-length? data
		if sz = -1 [
			probe "write error"
		]
	]

	close: routine [
		dev		[handle!]
	][
		if dev/value <> 0 [hid_close as int-ptr! dev/value]
	]
]
