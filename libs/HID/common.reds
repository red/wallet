Red/System [
	Title:	"Common functions for Cross-platform"
	Author: "bitbegin"
	File: 	%common.red
	Tabs: 	4
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

root: declare hid-device-info
enum-freed?: true

hid-free-enumeration: func [
	/local
		d 		[hid-device-info]
		next 	[hid-device-info]
][
	d: root
	while [as logic! d] [
		next: d/next
		free as byte-ptr! d/path
		free as byte-ptr! d/serial-number
		free as byte-ptr! d/manufacturer-string
		free as byte-ptr! d/product-string
		free as byte-ptr! d
		d: next
	]
	enum-freed?: true
]

id-filter?: func [
	id				[integer!]
	ids				[red-block!]
	return:			[logic!]
	/local
		size		[integer!]
		value		[red-value!]
		int			[red-integer!]
][
	size:  block/rs-length? ids
	either zero? size [
		return true
	][
		loop size [
			value: block/rs-head ids
			if TYPE_OF(value) = TYPE_INTEGER [
				int: as red-integer! value
				if any [id = int/value int/value = 0] [
					return  true
				]
			]
			block/rs-next ids
			if block/rs-tail? ids [
				return false
			]
		]
	]
	false
]

enum-devs: func [
	ids				[red-block!]
	return:			[red-block!]
	/local
		blk			[red-block!]
		cur-dev		[hid-device-info]
		ser			[c-string!]
		tmp			[integer!]
][
	if not enum-freed? [hid-free-enumeration]

	blk: block/push-only* 4
	cur-dev: enumerate ids
	enum-freed?: false

	while [cur-dev <> null] [
		ser: cur-dev/serial-number
		tmp: strcmp ser "null"
		if all [ser <> null tmp <> 0] [
			block/rs-append blk as red-value! integer/push cur-dev/id
			block/rs-append blk as red-value! string/load ser wcslen ser UTF-16LE
		]
		cur-dev: cur-dev/next
	]
	as red-block! stack/set-last as red-value! blk
]

open: func [
	id				[integer!]
	serial-number	[c-string!]
	return:			[int-ptr!]
	/local
		cur-dev			[hid-device-info]
		path-to-open	[c-string!]
		handle 			[hid-device]
		tmp				[integer!]
][
	path-to-open: null
	handle: null

	cur-dev: root
	while [cur-dev <> null] [
		either all [serial-number <> null id <> 0] [
			tmp: wcscmp serial-number cur-dev/serial-number
			;-- TBD
			;if all [tmp = 0 cur-dev/id = id] [
			if cur-dev/id = id [
				path-to-open: cur-dev/path
				break
			]
		][
			path-to-open: cur-dev/path
			break
		]
		cur-dev: cur-dev/next
	]

	if path-to-open <> null [
		;--open the device
		handle: open-path path-to-open ;--have not been defined
	]

	hid-free-enumeration
	as int-ptr! handle
]