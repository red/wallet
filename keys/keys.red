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

#include %Ledger/ledger.red
#include %Trezor/trezor.red

key: context [
	no-dev: "<No Device>"
	devs: []

	clear-devs: does [
		clear devs
		devs: copy []
	]

	support?: func [
		id			[integer!]
		return:		[logic!]
	][
		any [id = ledger/id id = trezor/id]
	]

	enum-devs: func [/local ids][
		if devs <> [] [clear-devs]
		ids: copy []
		append ids ledger/id
		append ids trezor/id
		devs: hid/enum-devs ids
	]

	free-enum: does [hid/free-enum]

	get-names: func [/local i j id ser][
		if devs = [] [return [no-dev]]
		i: 1
		unique collect [
			while [true] [
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

	connect: func [name [string!] serial-num [string!]][
		switch name [
			ledger/name [
				ledger/connect serial-num
			]
			trezor/name [
				trezor/connect serial-num
			]
			default [none]
		]
	]

	close: does [
		ledger/close
		trezor/close
	]

	close-by-name: func [name [string!]][
		switch name [
			ledger/name [
				ledger/close
			]
			trezor/name [
				trezor/close
			]
		]
	]

	close-by-id: func [id [integer!]][
		switch id [
			ledger/id [
				ledger/close
			]
			trezor/name [
				trezor/close
			]
		]
	]
]
