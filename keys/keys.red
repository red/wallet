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

	get-names: func [/local i item] [
		if devs = [] [return [no-dev]]
		i: 1
		collect [
			loop [
				item: devs/:i
				if item == none [break]
				if type? item = integer! [
					case item [
						ledger/id	[keep ledger/name]
						trezor/id	[keep trezor/name]
						true		[keep no-dev]
					]
				]
				i: i + 1
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
