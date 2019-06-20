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
	btc-path:		[80000031h 80000000h 80000000h 0 idx]	;-- btc segwit path
	btc-segwit:		[80000031h 80000000h 80000000h 0 idx]	;-- btc segwit path
	btc-legacy:		[8000002Ch 80000000h 80000000h 0 idx]

	unused-idx:		-1
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
			BTC [unused-idx: -1 bip32-path: btc-path]
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
					if coin-type <> 'BTC [bip32-path: eth-path]
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

	get-address: func [idx [integer!] /unused /local res][
		do [
			switch coin-type [
				ETH [
					change back tail bip32-path idx
					key/get-eth-address bip32-path
				]
				BTC [
					either unused [
						res: select btc-accounts idx
						select last res/origin 'addr
					][
						poke bip32-path 3 80000000h + idx
						bip32-path/4: 0
						bip32-path/5: 0
						res: key/get-btc-address bip32-path
						either block? res [res/1][res]
					]
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
			switch/default coin-type [
				ETH [
					change back tail bip32-path idx
					key/get-eth-signed-data bip32-path tx chain-id
				]
				BTC [key/get-btc-signed-data tx]
			][none]
		]
	]

	get-legacy-signed-len: function [
		tx			[block!]
		return:		[integer!]
	][
		len: 0
		input-count: length? tx/inputs
		;- version
		len: len + 4
		;-- tx_in count
		len: len + 1
		;-- tx_in
		loop length? tx/inputs [
			;-- tx_hash
			len: len + 32
			;-- index
			len: len + 4
			;-- #{6B}
			len: len + 1
			;-- script
			len: len + 6Bh
			;-- sequeue
			len: len + 4
		]
		;-- tx_out count
		len: len + 1
		loop length? tx/outputs [
			;-- value
			len: len + 8
			;-- #{19}
			len: len + 1
			len: len + 19h
		]
		;-- locktime
		len: len + 4
	]

	get-signed-len: function [
		tx			[block!]
		return:		[integer!]
	][
		if tx/inputs/1/path/1 = (80000000h + 44) [
			;-- legacy
			return get-legacy-signed-len tx
		]
		len: 0
		input-count: length? tx/inputs
		;- version
		len: len + 4
		;-- flag
		len: len + 2
		;-- tx_in count
		len: len + 1
		;-- tx_in
		loop length? tx/inputs [
			;-- tx_hash
			len: len + 32
			;-- index
			len: len + 4
			;-- #{1716}
			len: len + 2
			;-- script
			len: len + 22
			;-- sequeue
			len: len + 4
		]
		;-- tx_out count
		len: len + 1
		loop length? tx/outputs [
			;-- value
			len: len + 8
			;-- #{17 A9 14}
			len: len + 3
			len: len + 20
			;-- #{87}
			len: len + 1
		]
		;-- segwit
		loop length? tx/inputs [
			;-- script num
			len: len + 1
			;-- script len
			len: len + 1
			;-- script
			len: len + 72
			;-- pubkey len
			len: len + 1
			;-- pubkey
			len: len + 33
		]
		;-- locktime
		len: len + 4
	]

	get-batch-balance: function [ids num network][
		blks: make block! num
		addrs: make block! num
		loop num [
			addr-key: do [key/get-btc-address ids]
			addr: either block? addr-key [addr-key/1][addr-key]
			pubkey: either block? addr-key [addr-key/2][none]
			append/only blks reduce ['addr addr 'path copy ids 'pubkey pubkey]
			append addrs addr
			process-events
			ids/5: ids/5 + 1
		]
		balances: btc/get-batch-balance network addrs
		forall blks [
			index: index? blks
			append blks/1 balances/(index)
		]
		blks
	]

	enum-address-info: function [path account network][
		ids: copy path
		poke ids 3 (80000000h + account)

		either ledger-nano-s? [
			BATCH-NUM: 1
			set 'network-delay? no
		][
			BATCH-NUM: 10
			set 'network-delay? yes
		]

		list: copy []
		c-list: copy []
		o-list: copy []

		total: to-i256 0
		;-- change address
		ids/4: 1
		i: 0 j: 0
		forever [
			process-events
			j: i % BATCH-NUM
			if j = 0 [
				ids/5: i
				balance-batch: get-batch-balance ids BATCH-NUM network
			]
			process-events
			item: balance-batch/(j + 1)
			append/only c-list item
			if item/tx-count = 0 [
				append list reduce ['change c-list]
				break
			]

			if zero256? item/balance [
				i: i + 1
				continue
			]
			total: add256 total item/balance

			i: i + 1
		]

		;-- origin address
		ids/4: 0
		i: 0
		forever [
			process-events
			j: i % BATCH-NUM
			if j = 0 [
				ids/5: i
				balance-batch: get-batch-balance ids BATCH-NUM network
			]
			process-events
			item: balance-batch/(j + 1)
			append/only o-list item
			if item/tx-count = 0 [
				append list reduce ['origin o-list]
				break
			]

			if zero256? item/balance [
				i: i + 1
				continue
			]
			total: add256 total item/balance

			i: i + 1
		]

		append list reduce ['balance total]
		list
	]

	get-balance: func [network idx /local res][
		if unused-idx > -1 [return reduce [rejoin ["Unused Account #" idx + 1]]]
		res: enum-address-info bip32-path idx network
		if zero256? res/balance [unused-idx: idx]
		put btc-accounts idx res
		form-i256 res/balance 8 8
	]

	set-btc-network: func [net-name][
		if coin-type = 'BTC [
			poke bip32-path 2 either net-name = "mainnet" [80000000h][80000001h]
			unused-idx: -1
		]
	]

	ledger-nano-s?: does [
		if key [find key/name "Ledger"]
	]
]
