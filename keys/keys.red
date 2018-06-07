Red [
	Title:	"Driver for Multiple devices"
	Author: "bitbegin"
	File: 	%keys.red
	Tabs: 	4
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

#include %../libs/int-encode.red
#include %Ledger/ledger.red
#include %Trezor/trezor.red

key: context [
	no-dev: "<No Device>"
	enumerated-devices: []
	valid-device-names: []
	new-valid-names:	[]
	dev-names-in-block: []

	support?: func [
		id			[integer!]
		return:		[logic!]
	][
		if id = ledger/id [return true]
		if id = trezor/id [return true]
		false
	]

	opened?: func [id [integer!] return: [logic!]] [
		case [
			id = ledger/id [ledger/opened?]
			id = trezor/id [trezor/opened?]
			true [false]
		]
	]

	any-opened?: does [
		if ledger/opened? [return true]
		if trezor/opened? [return true]
		false
	]

	get-request-pin-state-by-id: func [id][
		if id = trezor/id [return trezor/request-pin-state]
		'HasRequested
	]

	get-request-pin-state-by-name: func [name][
		if name = trezor/name [return trezor/request-pin-state]
		'HasRequested
	]

	set-request-pin-state-by-id: func [id state][
		if id = trezor/id [trezor/request-pin-state: state]
	]

	set-request-pin-state-by-name: func [name][
		if name = trezor/name [trezor/request-pin-state: state]
	]

	request-pin-by-id: func [id][
		if id = trezor/id [return trezor/request-pin]
		'HasRequested
	]

	request-pin-by-name: func [name][
		if name = trezor/name [return trezor/request-pin]
		'HasRequested
	]

	close-pin-requesting-by-id: func [id][
		if id = trezor/id [trezor/close-pin-requesting]
	]

	enumerate-connected-devices: does [
		if enumerated-devices <> [] [clear enumerated-devices]
		enumerated-devices: hid/enumerate-connected-devices reduce [ledger/id trezor/id]
	]

	free-enum: does [hid/free-enum]

	get-valid-names: func [valid-names [block!] /local len i j id usg index name index-string][
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
		clear valid-names
		until [
			name: dev-names-in-block/:i
			j: i + 1
			index: dev-names-in-block/:j
			either index = 0 [
				append valid-names name
			][
				append valid-names rejoin [name ": " to string! index]
			]

			i: i + 2
			i > len
		]
		valid-names
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

	get-eth-address: func [name [string! none!] bip32-path [block!] idx [integer!] /local bip32][
		if name = none [return 'NoDevice]
		bip32: append copy bip32-path idx
		case [
			name = ledger/name [ledger/get-eth-address bip32]
			name = trezor/name [trezor/get-eth-address bip32]
			true ['NotSupport]
		]
	]

	get-btc-address: func [
		name					[string! none!]
		bip32-path				[block!]
		account					[integer!]
		idx						[integer!]
		network					[url!]
		/local
			bip32				[block!]
			tmp					[block!]
	][
		if name = none [return 'NoDevice]
		tmp: copy bip32-path
		poke tmp 3 (80000000h + account)
		bip32: append tmp idx
		case [
			name = trezor/name [trezor/get-btc-addresses bip32 network]
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

	get-eth-signed-data: func [
		name					[string! none!]
		bip32-path				[block!]
		idx						[integer!]
		tx						[block!]
		chain-id				[integer!]
		/local
			bip32				[block!]
	][
		if name = none [return 'NoDevice]
		bip32: append copy bip32-path idx
		case [
			name = ledger/name [ledger/get-eth-signed-data bip32 tx]
			name = trezor/name [trezor/get-eth-signed-data bip32 tx chain-id]
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
