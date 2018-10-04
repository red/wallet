Red [
	Title:	"Management of keys"
	Author: "qtxie"
	File: 	%keys.red
	Tabs: 	4
	Rights:  "Copyright (C) 2018 Red Foundation. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

#include %../libs/int-encode.red
#include %../libs/proto-encode.red
#include %../libs/rlp.red
#include %Ledger/ledger.red
#include %Trezor/trezor.red

keys: context [

	dongle:		none
	bip32-path: [8000002Ch 8000003Ch 80000000h idx]
	list:		[]
	key:		none
	index:		0
	new?:		yes
	current:	none

	support?: func [
		vendor-id	[integer!]
		product-id	[integer!]
		return:		[logic!]
	][
		case [
			all [
				vendor-id = ledger/vendor-id
				product-id = ledger/product-id
			][
				current: ledger
				new?: none? find list ledger/name
				yes
			]
			all [
				vendor-id = trezor/vendor-id
				product-id = trezor/product-id
			][
				current: trezor
				new?: none? find list trezor/name
				yes
			]
			true [
				current: none
				no
			]
		]
	]

	close-key: func [
		vendor-id	[integer!]
		product-id	[integer!]
		return:		[logic!]
		/local res
	][
		either support? vendor-id product-id [
			if state = 'HasRequested [
				finish-pin
				remove find list current/name
			]
			do [current/close]
			res: either key = current [
				dongle: none
				key: none
				yes
			][
				no
			]
			index: length? list
			res
		][no]
	]

	close: func [/force /local name][
		ledger/close
		trezor/close
	]

	connect-key: func [device [object! string!]][
		if string? device [
			device: either device = ledger/name [ledger][trezor]
		]
		do [
			dongle: device/connect
			if dongle [
				key: device
				unless find list key/name [append list key/name]
				key/init
				key/request-pin
				index: length? list
			]
		]
	]

	connect: func [][
		if all [dongle new?][close]

		unless dongle [
			connect-key ledger
			connect-key trezor
		]
		if empty? list [key: none]
		dongle
	]

	state: func [return: [word!]][
		either dongle [
			do [key/request-pin-state]
		]['no-device]
	]

	finish-pin: does [
		do [key/close-pin-requesting]
	]

	get-address: func [idx [integer!]][
		change back tail bip32-path idx
		do [key/get-eth-address bip32-path]
	]

	get-signed-data: func [
		idx			[integer!]
		tx			[block!]
		chain-id	[integer!]
	][
		change back tail bip32-path idx
		do [key/get-eth-signed-data bip32-path tx chain-id]
	]
]
