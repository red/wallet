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

	dongle:			none
	list:			[]
	key:			none
	index:			0
	new?:			yes
	current:		none
	support-keys:	reduce [ledger trezor-old trezor]
	bip32-path:		[8000002Ch 8000003Ch 80000000h idx]
	ledger-path:	[8000002Ch 8000003Ch 80000000h idx]
	trezor-path:	[8000002Ch 8000003Ch 80000000h 0 idx]

	support?: func [
		id		[block!]
		return:	[logic!]
		/local key
	][
		foreach key support-keys [
			if id = key/id [
				current: key
				new?: none? find list key/name
				return yes
			]
		]
		no
	]

	close-key: func [
		id		[block!]
		return: [logic!]
		/local res
	][
		either support? id [
			if state = 'HasRequested [
				finish-pin
			]
			remove find list current/name
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
		foreach key support-keys [key/close]
		key: none
		dongle: none
	]

	connect-key: func [device [object! string!] /local handle k][
		if string? device [
			foreach k support-keys [
				if k/name = device [
					device: k
					break
				]
			]
		]
		do [
			handle: device/connect
			either handle [
				key: device
				key/init
				either 'Init = key/request-pin [
					key: none
					dongle: none
				][
					dongle: handle
					unless find list key/name [append list key/name]
					bip32-path: either find key/name "Ledger" [ledger-path][trezor-path]
				]
				index: length? list
			][
				current: key
			]
		]
	]

	connect: func [/local k][
		if all [dongle new?][close]

		unless dongle [
			foreach k support-keys [connect-key k]
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

	ledger-nano-s?: does [
		find key/name "Ledger"
	]
]
