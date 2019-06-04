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
#include %../libs/btc-addr.red
#include %Ledger/ledger.red
#include %Trezor/trezor.red

keys: context [

	dongle:			none
	list:			[]
	key:			none
	index:			0
	new?:			yes
	current:		none
	coin-type:		'BTC
	support-keys:	reduce [ledger trezor-old trezor]
	eth-path:		[]
	bip32-path:		[80000031h 80000000h 80000000h 0 idx]	;-- btc-segwit
	ledger-path:	[8000002Ch 8000003Ch 80000000h idx]
	trezor-path:	[8000002Ch 8000003Ch 80000000h 0 idx]
	btc-segwit:		[80000031h 80000000h 80000000h 0 idx]
	btc-legacy:		[8000002Ch 80000000h 80000000h 0 idx]

	btc-accounts:	make block! 10	;-- BTC accounts information

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

	set-coin-type: func [type][
		coin-type: type
		switch type [
			BTC [bip32-path: btc-segwit]
			ETH [bip32-path: eth-path]
		]
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
					eth-path: either find key/name "Ledger" [ledger-path][trezor-path]
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

	get-address: func [idx [integer!] /local res][
		do [
			switch coin-type [
				ETH [
					change back tail bip32-path idx
					key/get-eth-address bip32-path
				]
				BTC [
					poke bip32-path 3 80000000h + idx
					bip32-path/4: 0
					bip32-path/5: 0
					res: key/get-btc-address bip32-path
					either block? res [res/1][res]
				]
			]
		]
	]

	get-signed-data: func [
		idx			[integer!]
		tx			[block!]
		chain-id	[integer!]
	][
		do [
			switch coin-type [
				ETH [
					change back tail bip32-path idx
					key/get-eth-signed-data bip32-path tx chain-id
				]
				BTC [
					poke bip32-path 3 80000000h + idx
					bip32-path/4: 0
					bip32-path/5: 0
					key/get-btc-signed-data bip32-path tx
				]
			]
		]
	]

	enum-address-info: func [
		path			[block!]
		account			[integer!]
		return:			[block!]
		/local
			ids list c-list o-list len i addr-key addr pubkey utxs balance total
	][
		ids: copy path
		poke ids 3 (80000000h + account)

		list: copy []
		c-list: copy []
		o-list: copy []

		total: to-i256 0
		;-- change address
		ids/4: 1
		i: 0
		forever [
			process-events
			ids/5: i
			addr-key: do [key/get-btc-address ids]
			addr: either block? addr-key [addr-key/1][addr-key]
			pubkey: either block? addr-key [addr-key/2][none]
			balance: btc/get-addr-balance network addr
			process-events
			if balance = none [
				append/only c-list reduce ['addr addr 'path copy ids 'pubkey pubkey]
				append list reduce ['change c-list]
				break
			]

			utxs: btc/get-unspent network addr
			process-events
			if utxs = none [
				append/only c-list reduce ['addr addr 'balance to-i256 0 'path copy ids 'pubkey pubkey]
				i: i + 1
				continue
			]

			append/only c-list reduce ['addr addr 'utxs utxs 'balance balance 'path copy ids 'pubkey pubkey]
			total: add256 total balance

			i: i + 1
		]

		;-- origin address
		ids/4: 0
		i: 0
		forever [
			process-events
			ids/5: i
			addr-key: do [key/get-btc-address ids]
			addr: either block? addr-key [addr-key/1][addr-key]
			pubkey: either block? addr-key [addr-key/2][none]
			balance: btc/get-addr-balance network addr
			process-events
			if balance = none [
				append/only o-list reduce ['addr addr 'path copy ids 'pubkey pubkey]
				append list reduce ['origin o-list]
				break
			]

			utxs: btc/get-unspent network addr
			process-events
			if utxs = none [
				append/only o-list reduce ['addr addr 'balance to-i256 0 'path copy ids 'pubkey pubkey]
				i: i + 1
				continue
			]

			append/only o-list reduce ['addr addr 'utxs utxs 'balance balance 'path copy ids 'pubkey pubkey]
			total: add256 total balance

			i: i + 1
		]

		append list reduce ['balance total]
		list
	]

	get-balance: func [
		"BTC only"			;-- TBD: add support for ETH
		network	[url!]
		idx		[integer!]
		/local res
	][
		res: enum-address-info bip32-path idx
		put btc-accounts idx res
		form-i256 res/balance 8 8
	]

	ledger-nano-s?: does [
		find key/name "Ledger"
	]
]
