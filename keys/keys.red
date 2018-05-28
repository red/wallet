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
	enumerated-devices: []
	valid-device-names: []
	dev-names-in-block: []

	support?: func [
		id			[integer!]
		return:		[logic!]
	][
		if id = ledger/id [return true]
		if id = trezor/id [return true]
		false
	]

	enumerate-connected-devices: does [
		if enumerated-devices <> [] [clear enumerated-devices]
		enumerated-devices: hid/enumerate-connected-devices reduce [ledger/id trezor/id]
	]

	free-enum: does [hid/free-enum]

	get-valid-names: func [/local len i j id usg index name index-string][
		len: length? enumerated-devices
		if len = 0 [return reduce [no-dev]]
		i: 1
		clear dev-names-in-block
		until [
			id: enumerated-devices/:i
			j: i + 1
			usg: enumerated-devices/:j
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
		clear valid-device-names
		until [
			name: dev-names-in-block/:i
			j: i + 1
			index: dev-names-in-block/:j
			either index = 0 [
				append valid-device-names name
			][
				append valid-device-names reduce [name ": " to string! index]
			]

			i: i + 2
			i > len
		]
		valid-device-names
	]

	get-enum-index: func [
		id				[integer!]
		index			[integer!]
		return:			[integer!]
		/local
			len i j enum-index nid usg
	][
		len: length? enumerated-devices
		if len = 0 [return index]

		enum-index: 0
		count: 0
		i: 1
		until [
			nid: enumerated-devices/:i
			j: i + 1
			usg: enumerated-devices/:j
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

	get-address: func [name [string! none!] idx [integer!]][
		if name = none [return 'NoDevice]
		case [
			name = ledger/name [ledger/get-address idx]
			name = trezor/name [trezor/get-address idx]
			true ['NotSupport]
		]
	]

	set-init: func [name [string! none!]][
		if name = none [return 'NoDevice]
		case [
			name = ledger/name [ledger/set-init]
			name = trezor/name [trezor/set-init]
			true ['NotSupport]
		]
	]

	get-signed-data: func [name [string! none!] idx [integer!] tx [block!] chain-id [integer!]][
		if name = none [return 'NoDevice]
		case [
			name = ledger/name [ledger/get-signed-data idx tx]
			name = trezor/name [trezor/get-signed-data idx tx chain-id]
			true ['NotSupport]
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
