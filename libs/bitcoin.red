Red [
	Title:	"network api for btc"
	Author: "bitbegin"
	File: 	%bitcoin.red
	Tabs: 	4
	Rights:  "Copyright (C) 2018 Red Foundation. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

btc: context [

	system/catalog/errors/user: make system/catalog/errors/user [btc-api: ["btc-api [" :arg1 ": (" :arg2 " " :arg3 ")]"]]

	new-error: func [name [word!] arg2 arg3][
		cause-error 'user 'btc-api [name arg2 arg3]
	]

	network-delay?: yes
	time-delay:	0.51
	top-scalar: to-i256 1e8
	btc-to-sat: func [num [vector!] return: [vector!]][
		mul256 num top-scalar
	]

	try-read: func [url][
		;-- workaround for speed limitation of some WebAPIs
		if network-delay? [
			wait time-delay
		]
		unless error? res: try [read url][return res]
		wait 0.5
		unless error? res: try [read url][return res]
		res
	]

	get-url: func [url [url!] return: [map!]
		/local res res2
	][
		if all [not error? res: try-read url not error? res2: try [load-json res]][return res2]
		new-error 'get-url "server error" reduce [url res]
	]

	get-batch-balance: function [network [url!] addrs [block!]][
		len: length? addrs
		naddrs: copy addrs/1
		addrs: next addrs
		forall addrs [
			append naddrs ","
			append naddrs addrs/1
		]
		url: rejoin [network "/address/" naddrs]
		resp: get-url url
		if 0 <> err-no: resp/err_no [
			new-error 'get-addr-balance "server error" reduce [url err-no resp/err_msg]
		]

		data: resp/data
		either len = 1 [
			if all [
				data = none
				find resp 'data
			][
				return reduce [reduce [
					'tx-count 0
					'unconfirmed-tx-count 0
					'unspent-tx-count 0
				]]
			]
			data: reduce [data]
		][
			unless data [new-error 'get-addr-balance "server error" "no data"]
		]
		if len <> length? data [new-error 'get-addr-balance "server error" "no enough"]
		testnet?: false
		if find network "tchain" [
			testnet?: true
		]
		ret: make block! len
		forall data [
			either data/1 [
				balance: to-i256 data/1/balance
				either testnet? [
					recv: to-i256 data/1/unconfirmed_received
					sent: to-i256 data/1/unconfirmed_sent
					nbalance: add256 balance recv
					nbalance: sub256 nbalance sent
				][
					nbalance: balance
				]
				repend/only ret [
					'tx-count data/1/tx_count
					'unconfirmed-tx-count data/1/unconfirmed_tx_count
					'unspent-tx-count data/1/unspent_tx_count
					'balance nbalance
				]
			][
				repend/only ret [
					'tx-count 0
					'unconfirmed-tx-count 0
					'unspent-tx-count 0
				]
			]
		]
		ret
	]

	get-addr-balance: function [network [url!] address [string!]][
		url: rejoin [network "/address/" address]
		resp: get-url url
		if 0 <> err-no: resp/err_no [
			new-error 'get-addr-balance "server error" reduce [url err-no resp/err_msg]
		]

		unless data: resp/data [return none]
		unless balance: data/balance [return none]
		to-i256 balance
	]

	page-size: 50

	get-unspent-page: function [network [url!] address [string!] page [integer!]][
		url: rejoin [network "/address/" address "/unspent?page=" page]
		resp: get-url url
		if 0 <> err-no: resp/err_no [
			new-error 'get-unspent "server error" reduce [url err-no resp/err_msg]
		]
		unless data: resp/data [return none]
		unless list: data/list [return none]
		if list = [] [return none]
		utxs: copy []
		forall list [
			repend/only utxs [
				'tx-hash list/1/tx_hash
				'value to-i256 list/1/value
				'confirmations list/1/confirmations
			]
		]
		set 'page-size data/pagesize
		utxs
	]

	get-unspent: function [network [url!] address [string!]][
		unless ret: get-unspent-page network address 1 [return none]
		utxs: ret
		i: 2
		while [
			all [
				page-size = length? utxs
				utxs: get-unspent-page network address i
			]
		][
			repend ret utxs
			i: i + 1
		]
		ret
	]

	get-tx-info: function [network [url!] txid [string!]][
		url: rejoin [network "/tx/" txid "?verbose=3"]
		resp: get-url url

		if 0 <> err-no: resp/err_no [
			new-error 'get-tx-info "server error" reduce [url err-no resp/err_msg]
		]
		unless data: resp/data [return none]
		ret: copy []
		unless version: data/version [return none]
		unless lock_time: data/lock_time [return none]
		repend ret ['version version]
		repend ret ['lock_time lock_time]

		unless inputs: data/inputs [return none]
		if inputs = [] [return none]
		unless outputs: data/outputs [return none]
		if outputs = [] [return none]

		info: copy []
		forall inputs [
			if 1 <> length? inputs/1/prev_addresses [
				;-- we don't support this case
				return none
			]
			repend/only info [
				'prev-address inputs/1/prev_addresses/1
				'prev-position inputs/1/prev_position
				'prev-tx-hash inputs/1/prev_tx_hash
				'script-hex inputs/1/script_hex
				'prev-type inputs/1/prev_type
				'sequence to integer! skip i256-to-bin to-i256 inputs/1/sequence 28
			]
		]
		repend ret ['inputs info]

		info: copy []
		forall outputs [
			if 1 <> length? outputs/1/addresses [
				;-- we don't support this case
				return none
			]
			repend/only info [
				'address outputs/1/addresses/1
				'value to-i256 outputs/1/value
				'script-hex outputs/1/script_hex
				'type outputs/1/type
			]
		]
		repend ret ['outputs info]
		ret
	]

	headers: compose [
		Content-Type: "application/json"
		Accept: "application/json"
	]

	post-url: function [url [url!] body [map!]][
		wait 0.5
		command: compose/only [
				POST
				(headers)
				(to-json body)
		]

		if all [not error? res: try [write url command] map? res2: try [load-json res]][return res2]
		new-error 'post-url "server error" reduce [command res]
	]

	publish-tx: function [network [url!] tx [string!]][
		url: rejoin [network "/tools/tx-publish"]
		body: make map! reduce ['rawhex tx]
		resp: post-url url body
		if 0 <> err-no: resp/err_no [
			new-error 'publish-tx "server error" reduce [url err-no resp/err_msg]
		]
		wait 0.5
		decode-tx network tx
	]

	decode-tx: function [network [url!] tx [string!]][
		url: rejoin [network "/tools/tx-decode"]
		body: make map! reduce ['rawhex tx]
		resp: post-url url body
		if 0 <> err-no: resp/err_no [
			new-error 'decode-tx "server error" reduce [url err-no resp/err_msg]
		]
		unless data: resp/data [new-error 'decode-tx "no data" url]
		unless txid: data/txid [new-error 'decode-tx "no txid" url]
		txid
	]

	get-rate: function [speed [word!]][
		network: https://bitcoinfees.earn.com/api/v1/fees/recommended
		unless res: get-url network [return none]

		if speed = 'all [return values-of res]
		if speed = 'average [
			if fee: res/halfHourFee [return fee]
			return none
		]
		if any [
			speed = 'fastest
			speed = 'fast
		][
			if fee: res/fastestFee [return fee]
			return none
		]
		if speed = 'safeLow [
			if fee: res/hourFee [return fee]
			return none
		]
		none
	]
]
