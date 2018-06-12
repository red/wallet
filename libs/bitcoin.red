Red [
	Title:	"bitcoin utility functions"
	Author: "bitbegin"
	File: 	%bitcoin.red
	Tabs: 	4
	Rights:  "Copyright (C) 2018 Red Foundation. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]


btc: context [

	last-txs: copy []

	get-url: func [network [url!] params [string!] /local res][
		res: json/decode read append copy network params
		res
	]

	get-tx-hash: func [network [url!] address [string!] /local data txs tx hash value][
		data: get-url network append copy "/addrs/" reduce [address "?unspentOnly=true"]
		if none <> select data 'error [return 'error]
		txs: select data 'txrefs
		clear last-txs
		if any [txs = [] txs = none] [return last-txs]
		foreach tx txs [
			hash: select tx 'tx_hash
			value: select tx 'value
			append last-txs reduce [hash value]
		]
		last-txs
	]

	get-last-balance: func [/local values value ret][
		ret: to-i256 0
		values: extract/index last-txs 2 2
		foreach value values [
			ret: add256 ret to-i256 value
		]
		ret
	]

	get-balances: func [network [url!] addresses [block!] /local ret address][
		ret: to-i256 0
		foreach address addresses [
			if word? get-tx-hash network address [return 'error]
			ret: add256 ret get-last-balance
		]
		ret
	]

	balance-empty?: func [network [url!] address [string!] /local data txs][
		data: get-url network append copy "/addrs/" address
		if none <> select data 'error [return 'error]
		txs: select data 'txrefs
		if any [txs = [] txs = none] [return true]
		false
	]

]

