Red [
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

hid-device-info: alias struct! [
    path 				[c-string!]
    id 					[integer!] ;vendor-id and product-id
    serial-number 		[c-string!]
    manufacturer-string [c-string!]
    product-string 		[c-string!]
    usage 				[integer!] ;usage-page and usage
    release-number		[integer!]
    interface-number	[integer!]
    next				[hid-device-info]
]

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
]

get-devs: func [
    vendor-id 		[integer!] ;vid
    product-id 		[integer!] ;pid
    return:			[block!]
    /local
        blk			[red-block!]
        cur-dev		[hid-device-info]
        ser			[c-string!]
        id 			[integer!]
        tmp			[integer!]
][
    blk: block/push-only* 4
    id: product-id << 16 or vendor-id
    cur-dev: enumerate id

    while [cur-dev <> null] [
        ser: cur-dev/serial-number
        tmp: strcmp ser "null"
        if all [ser <> null tmp <> 0 cur-dev/id = id] [
            block/rs-append blk string/load ser utf16-length? as byte-ptr! ser UTF-16LE
        ]
        cur-dev: cur-dev/next
    ]
    blk
]

open: func [
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
        either serial-number <> null [
            tmp: wcscmp serial-number cur-dev/serial-number
            if tmp = 0 [
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