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

	dongle: none
	bip32-path: [8000002Ch 8000003Ch 80000000h idx]
	list: []
	key: none

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

	close: func [][
		if dongle [
			if state = 'HasRequested [
				finish-pin
				remove find list key/name
			]
			do [key/close]
			dongle: none
			key: none
		]
	]

	connect: func [][
		unless dongle [
			key: ledger
			dongle: do [key/connect]	;@@ A work around for the limitaion of the compiler
			if none? dongle [			;-- try Trezor
				key: trezor
				dongle: do [key/connect]
			]
			either dongle [
				unless find list key/name [append list key/name]
				do [
					key/init
					key/request-pin
				]
			][key: none]
		]
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
