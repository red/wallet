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
	no-dev: "<No Device>"
	devs: []

	clear-devs: does [
		clear devs
		devs: copy []
	]

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

	enum-devs: func [/local ids] [
		if devs <> [] [clear-devs]
		ids: copy []
		append ids ledger/id
		append ids trezor/id
		devs: hid/enum-devs ids
	]

	free-enum: does [hid/free-enum]

	get-names: func [/local i j id ser] [
		if devs = [] [return [no-dev]]
		i: 1
		unique collect [
			loop [
				id: devs/:i
				j: i + 1
				ser: devs/:j
				if any [id = none ser = none] [break]
				either all [type? id = integer! type? ser = string!] [
					case id [
						ledger/id	[keep rejoin [ledger/name ":" ser]]
						trezor/id	[keep rejoin [trezor/name ":" ser]]
						true		[keep no-dev]
					]
				][break]
				i: i + 2
			]
		]
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

	close: func [dev [string!][
		case dev [
			ledger/name [
				ledger/close
			]
			trezor/name [
				stack/set-last none-value
			]
		]
	]

]
