Red [
	Title:	"Driver for Multiple devices"
	Author: "bitbegin"
	File: 	%keys.red
	Tabs: 	4
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

#include %keys/Ledger/ledger.red
#include %keys/Trezor/trezor.red

key: context [
	none-dev: ["<No Device>" []]
	devs: copy none-dev

	support?: func [
		vendor-id	[integer!]
		product-id	[integer!]
		return:		[logic!]
	][
		any [
			all [
				vendor-id = ledger/vendor-id
				product-id = ledger/product-id
			]
			all [
				vendor-id = trezor/vendor-id
				product-id = trezor/product-id
			]
		]
	]

	get-devs: func[][
		if devs <> none-dev [
			clear devs
			devs: copy none-dev
		]
		devs: append devs reduce [ledger/name ledger/get-devs]
	]

	connect: func [dev [string!] serial-num [string!]][
		case dev [
			ledger/name [
				ledger/connect serial-num
			]
			trezor/name [
				stack/set-last none-value
			]
			true [stack/set-last none-value]
		]
	]
]
