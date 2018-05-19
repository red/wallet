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

to-bin8: func [v [integer! char!]][
	to binary! to char! 256 + v and 255
]

to-bin16: func [v [integer! char!]][	;-- big-endian encoding
	skip to-binary to-integer v 2
]

to-bin32: func [v [integer! char!]][	;-- big-endian encoding
	to-binary to-integer v
]

to-int16: func [b [binary!]][
	to-integer copy/part b 2
]

to-int32: func [b [binary!]][
	to-integer copy/part b 4
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
		if id = ledger/id [return true]
		if id = trezor/id [return true]
		false
	]

	enum-devs: does [
		if devs <> [] [clear-devs]
		devs: hid/enum-devs reduce [ledger/id trezor/id]
	]

	free-enum: does [hid/free-enum]

	get-names: func [/local i j id ser cond1 cond2][
		if devs = [] [return reduce [no-dev]]
		i: 1
		unique collect [
			while [true] [
				id: devs/:i
				j: i + 1
				ser: devs/:j
				if id = none [break]
				if ser = none [break]
				cond1: integer! = type? id
				cond2: string! = type? ser
				either all [cond1 cond2] [
					case [
						id = ledger/id	[keep rejoin [ledger/name ":" ser]]
						id = trezor/id	[keep rejoin [trezor/name ":" ser]]
						true			[keep no-dev]
					]
				][break]
				i: i + 2
			]
		]
	]

	connect: func [name [string! none!] serial-num [string! none!]][
		if name = none [return none]
		case [
			name = ledger/name [ledger/connect serial-num]
			name = trezor/name [trezor/connect serial-num]
			true [none]
		]
	]

	close: does [
		ledger/close
		trezor/close
	]

	close-by-name: func [name [string!]][
		case [
			name = ledger/name [ledger/close]
			name = trezor/name [trezor/close]
		]
	]

	close-by-id: func [id [integer!]][
		case [
			id = ledger/id [ledger/close]
			id = trezor/name [trezor/close]
		]
	]
]
