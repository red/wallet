Red [
	Title:	"Driver for Multiple devices"
	Author: "bitbegin"
	File: 	%keys.red
	Tabs: 	4
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
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
	dev-names: []
	dev-names-in-block: []

	support?: func [
		id			[integer!]
		return:		[logic!]
	][
		if id = ledger/id [return true]
		if id = trezor/id [return true]
		false
	]

	enum-devs: does [
		if devs <> [] [clear devs]
		devs: hid/enum-devs reduce [ledger/id trezor/id]
	]

	free-enum: does [hid/free-enum]

	get-names: func [/local len i j id usg index name index-string][
		len: length? devs
		if len = 0 [return reduce [no-dev]]
		i: 1
		clear dev-names-in-block
		until [
			id: devs/:i
			j: i + 1
			usg: devs/:j
			if any [id = none usg = none] [break]
			case [
				ledger/filter? id usg [
					index: select/last dev-names-in-block ledger/name
					either index = none [index: 0][index: index + 1]
					append dev-names-in-block reduce [ledger/name index]
				]
				trezor/filter? id usg [
					index: select/last dev-names-in-block trezor/name
					either index = none [index: 0][index: index + 1]
					append dev-names-in-block reduce [trezor/name index]
				]
			]
			i: i + 2
			i > len
		]

		len: length? dev-names-in-block
		if len = 0 [return reduce [no-dev]]
		i: 1
		clear dev-names
		until [
			name: dev-names-in-block/:i
			j: i + 1
			index: dev-names-in-block/:j
			either index = 0 [
				append dev-names name
			][
				append dev-names reduce [name ": " to string! index]
			]

			i: i + 2
			i > len
		]
		dev-names
	]

	get-enum-index: func [
		id				[integer!]
		index			[integer!]
		return:			[integer!]
		/local
			len i j enum-index nid usg
	][
		len: length? devs
		if len = 0 [return index]

		enum-index: 0
		count: 0
		i: 1
		until [
			nid: devs/:i
			j: i + 1
			usg: devs/:j
			case [
				all [ledger/id = id id = nid] [
					if ledger/filter? id usg [
						either count = index [
							return enum-index
						][
							count: count + 1
						]
					]
					enum-index: enum-index + 1
				]
				all [trezor/id = id id = nid] [
					if trezor/filter? id usg [
						either count = index [
							return enum-index
						][
							count: count + 1
						]
					]
					enum-index: enum-index + 1
				]
			]

			i: i + 2
			i > len
		]

		index
	]

	connect: func [name [string! none!] index [integer!]][
		if name = none [return none]
		case [
			name = ledger/name [ledger/connect get-enum-index ledger/id index]
			name = trezor/name [trezor/connect get-enum-index trezor/id index]
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
