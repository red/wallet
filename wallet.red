Red [
	Title:	 "RED Wallet"
	Author:  "Xie Qingtian"
	File: 	 %wallet.red
	Icon:	 %assets/RED-token.ico
	Needs:	 View
	Version: 0.3.0
	Tabs: 	 4
	Company: "Fullstack technologies"
	Rights:  "Copyright (C) 2018 Red Foundation. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

throw-error: func [msg [string! block!]][
	cause-error 'user 'message form reduce msg
]

#include %libs/int256.red
#include %libs/JSON.red
#include %libs/ethereum.red
#include %libs/bitcoin.red
#include %libs/HID/hidapi.red
#include %keys/keys.red
#include %eth-batch.red
#include %eth-tokens.red

#system [
	with gui [#include %libs/usb-monitor.reds]
]

wallet: context [

	list-font: make font! [name: get 'font-fixed size: 11]

	signed-data: addr-list: min-size: none
	addr-per-page: 5
	locked?: no

	fast-api?: yes

	networks: [
		BTC [
			https://chain.api.btc.com/v3
			https://tchain.api.btc.com/v3
		]
		ETH [
			https://eth.red-lang.org/mainnet
			https://eth.red-lang.org/rinkeby
			https://eth.red-lang.org/kovan
			https://eth.red-lang.org/ropsten
		]
	]

	explorers: [
		BTC [
			https://blockchain.info/tx/
			https://testnet.blockchain.info/tx/
		]
		ETH [
			https://etherscan.io/tx/
			https://rinkeby.etherscan.io/tx/
			https://kovan.etherscan.io/tx/
			https://ropsten.etherscan.io/tx/
		]
	]

	contracts: [
		;-- Token name | NetWorks | Decimal places | Fullname
		"BTC" [
			"MainNet" #[none]
			"TestNet" #[none]
		] 8 "Bitcoin"
		"ETH" [
			"MainNet" #[none]
			"Rinkeby" #[none]
			"Kovan"	  #[none]
			"Ropsten" #[none]
		] 18 "Ethereum"
		"RED" [
			"mainnet" "76960Dccd5a1fe799F7c29bE9F19ceB4627aEb2f"
			"Rinkeby" "43df37f66b8b9fececcc3031c9c1d2511db17c42"
		] 18 "RED (Red Community Token)"
	]

	chain-ids: [	;-- used by Trezor
		1			;-- mainnet
		4			;-- rinkeby
		42			;-- kovan
		3			;-- ropsten
	]

	explorer:	explorers/BTC/1
	network:	networks/BTC/1
	chain-id:	chain-ids/1
	coin-type:	'BTC
	net-name:	"mainnet"
	token-name: "BTC"
	token-contract: none
	token-decimals: 18

	address-index:	0
	page:			0

	cfg: none
	ledger-legacy-path: [8000002Ch 8000003Ch 80000000h idx]

	#include %settings.red

	process-events: does [loop 10 [do-events/no-wait]]

	fetch-balance: func [addr [string! block! integer!]][
		switch coin-type [
			ETH [
				either token-contract [
					eth/get-balance-token network token-contract addr token-decimals
				][
					eth/get-balance network addr
				]
			]
			BTC [keys/get-balance network addr]
		]
	]

	connect: func [][
		usb-device/rate: none
		keys/connect
		dev/data: keys/list
		dev/selected: keys/index
		process-events
	]

	list-addresses: func [/prev /next /local addr-balances addrs addr entry balances n][
		update-ui no

		either keys/key [
			locked?: no
			addrs: clear []
			addr-balances: clear []
			if next [page: page + 1]
			if prev [page: page - 1]
			n: page * addr-per-page

			loop addr-per-page [
				addr: keys/get-address n
				either string? addr [
					info-msg/text: "Please wait while loading addresses..."
				][
					info-msg/text: case [
						addr = 'browser-support-on [{Please set "Browser support" to "No"}]
						addr = 'locked [
							locked?: yes
							usb-device/rate: 0:0:2
							"Please unlock your key"
						]
						true [{Please open an application on the key}]
					]
					exit
				]
				append addrs addr
				append addr-balances rejoin [addr "      <loading>"]
				addr-list/data: addr-balances
				process-events
				n: n + 1
			]
			info-msg/text: "Please wait while loading balances..."
			update-ui no
			either error? try [
				either fast-api? [
					balances: fetch-balance addrs
					n: 1
					foreach addr addrs [
						append addr rejoin ["   " balances/:n]
						n: n + 1
					]
					addr-list/data: addrs
				][
					n: page * addr-per-page
					foreach entry addr-list/data [
						either coin-type = 'BTC [
							replace entry "   <loading>" fetch-balance n
							n: n + 1
						][
							addr: copy/part entry find entry space
							replace entry "   <loading>" fetch-balance addr
						]
						process-events
					]
				]
			][
				info-msg/text: {Fetch balance: Timeout. Please try "Reload" again}
			][
				info-msg/text: ""
			]
			update-ui yes
			do-auto-size addr-list
		][usb-device/rate: 0:0:2]
	]

	reset-sign-button: does [
		btn-sign/enabled?: yes
		btn-sign/offset/x: 215
		btn-sign/size/x: 60
		btn-sign/text: "Sign"
	]

	do-send: func [face [object!] event [event!]][
		if addr-list/data [
			if addr-list/selected = -1 [addr-list/selected: 1]
			network-to/text: net-name
			addr-from/text: copy/part pick addr-list/data addr-list/selected 42
			gas-limit/text: either token-contract ["79510"]["21000"]
			reset-sign-button
			label-unit/text: token-name
			clear addr-to/text
			clear amount-field/text
			view/flags send-dialog 'modal
		]
	]

	select-config: func [idx [integer!]][
		coin-type: either token-name = "BTC" ['BTC]['ETH]
		network:  networks/:coin-type/:idx
		explorer: explorers/:coin-type/:idx
		chain-id: chain-ids/:idx
		token-contract: contracts/:token-name/:net-name
		keys/set-coin-type coin-type
		unless string? token-contract [token-contract: none]
	]

	do-select-network: func [face [object!] event [event!] /local idx][
		idx: face/selected
		net-name: face/data/:idx
		select-config idx
		do-reload
	]

	do-select-token: func [face [object!] event [event!] /local idx net n tokens info][
		idx: face/selected
		if idx = 1 [				;-- add tokens
			tokens: make block! 10
			foreach [sym addrs dec name] skip contracts 8 [
				append tokens name
			]
			eth-tokens/do-config face tokens
			face/selected: 2
			if face/extra = 2 [exit]
			idx: 2
		]

		face/extra: idx				;-- save index
		net: net-list/selected
		token-name: face/data/:idx

		info: find contracts token-name
		token-decimals: info/3
		net-list/data: extract contracts/:token-name 2
		n: length? net-list/data
		net: net-list/selected: either net > n [n][net]
		net-name: net-list/data/:net
		select-config net
		fast-api?: either token-contract [
			clear skip addr-list/menu 2
			no
		][
			append addr-list/menu ["Batch payment" batch]
			yes
		]
		do-reload
	]

	do-select-device: func [face [object!] event [event!] /local key][
		if face/data [
			key: pick face/data face/selected
			keys/connect-key key
			list-addresses
		]
	]

	do-reload: does [if keys/key [list-addresses]]
	
	do-resize: function [delta [pair!]][
		ref: as-pair btn-send/offset/x - 10 ui/extra/y / 2
		foreach-face ui [
			pos: face/offset
			case [
				all [pos/x > ref/x pos/y < ref/y][face/offset/x: pos/x + delta/x]
				all [pos/x < ref/x pos/y > ref/y][face/offset/y: pos/y + delta/y]
				all [pos/x > ref/x pos/y > ref/y][face/offset: pos + delta]
			]
		]
		addr-list/size: addr-list/size + delta
	]
	
	do-auto-size: function [face [object!]][
		size: size-text/with face "XXXXXXXXXX"
		cols: 64
		if face/data [foreach line face/data [cols: max cols length? line]]
		delta: (as-pair size/x * cols / 10 size/y * 5.3) - face/size
		size: ui/size + delta + 8x10
		if all [size/x >= min-size/x size/y >= min-size/y][ui/size: size]
	]

	valid-amount?: func [str [string!] /local num][
		num: attempt [to float! str]
		either all [num num >= 0.0][num][none]
	]

	valid-address?: func [addr [string!]][
		all [
			addr/1 = #"0"
			addr/2 = #"x"
			42 = length? addr
			debase/base skip addr 2 16
		]
	]

	check-data: func [/local amount balance][
		unless valid-address? trim any [addr-to/text ""] [
			addr-to/text: copy "Invalid address"
			return no
		]
		amount: valid-amount? amount-field/text
		either amount [
			balance: to float! skip pick addr-list/data addr-list/selected 42
			if amount > balance [
				amount-field/text: copy "Insufficient Balance"
				return no
			]
		][
			amount-field/text: copy "Invalid amount"
			return no
		]
		yes
	]

	update-ui: function [enabled? [logic!]][
		btn-send/enabled?: to-logic all [enabled? addr-list/selected addr-list/selected > 0]
		if page > 0 [btn-prev/enabled?: enabled?]
		foreach f [btn-more net-list token-list page-info btn-reload][
			set in get f 'enabled? enabled?
		]
		if enabled? [
			my-addr-text/text: "My Addresses"
			if keys/ledger-nano-s? [
				if all [coin-type = 'ETH 4 = length? keys/ledger-path][
					my-addr-text/text: "My Addresses (Legacy)"
				]
			]
		]
		process-events
	]

	notify-user: does [
		btn-sign/enabled?: no
		process-events
		btn-sign/offset/x: 132
		btn-sign/size/x: 230
		btn-sign/text: "Confirm the transaction on your key"
		process-events
	]

	key-locked?: does [
		locked?: either string? keys/get-address 0 [no][
			reset-sign-button
			view/flags unlock-dev-dlg 'modal
			yes
		]
	]

	sign-transaction: func [
		from-addr	[string!]
		to-addr		[string!]
		gas-price	[string!]
		gas-limit	[string!]
		amount		[string!]
		nonce		[integer!]
		/local price limit tx value
	][
		price: eth/gwei-to-wei gas-price
		limit: to-integer gas-limit
		value: eth/eth-to-wei amount

		either token-contract [
			tx: reduce [
				nonce
				price
				limit
				debase/base token-contract 16			;-- to address
				eth/eth-to-wei 0						;-- value
				rejoin [								;-- data
					#{a9059cbb}							;-- method ID
					debase/base eth/pad64 copy skip to-addr 2 16
					eth/pad64 i256-to-bin value
				]
			]
		][
			tx: reduce [
				nonce
				price
				limit
				debase/base skip to-addr 2 16			;-- to address
				value
				#{}										;-- data
			]
		]

		keys/get-signed-data address-index tx chain-id
	]

	do-sign-tx: func [face [object!] event [event!] /local nonce][
		unless check-data [exit]

		nonce: eth/get-nonce network addr-from/text		;-- nonce
		if nonce = -1 [
			unview
			view/flags nonce-error-dlg 'modal
			reset-sign-button
			exit
		]

		;-- Edge case: ledger key may locked in this moment
		if key-locked? [exit]

		notify-user

		signed-data: sign-transaction
			addr-from/text
			addr-to/text
			gas-price/text
			gas-limit/text
			amount-field/text
			nonce

		either all [
			signed-data
			binary? signed-data
		][
			info-from/text:		addr-from/text
			info-to/text:		copy addr-to/text
			info-amount/text:	rejoin [amount-field/text " " token-name]
			info-network/text:	net-name
			info-price/text:	rejoin [gas-price/text " Gwei"]
			info-limit/text:	gas-limit/text
			info-fee/text:		rejoin [
				mold (to float! gas-price/text) * (to float! gas-limit/text) / 1e9
				" Ether"
			]
			info-nonce/text: mold nonce
			unview
			view/flags confirm-sheet 'modal
		][
			if signed-data = 'token-error [
				unview
				view/flags contract-data-dlg 'modal
			]
		]
		reset-sign-button
	]

	do-confirm: func [face [object!] event [event!] /local result][
		result: eth/send-raw-tx network signed-data
		unview
		either string? result [
			browse rejoin [explorer result]
		][							;-- error
			tx-error/text: rejoin ["Error! Please try again^/^/" form result]
			view/flags tx-error-dlg 'modal
		]
	]

	copy-addr: func [][
		if btn-send/enabled? [
			write-clipboard copy/part pick addr-list/data addr-list/selected 42
		]
	]

	do-more-addr: func [face event][
		unless keys/key [exit]
		page-info/selected: page + 2					;-- page is zero-based
		list-addresses/next
		if page > 0 [btn-prev/enabled?: yes]
	]

	do-prev-addr: func [face event][
		unless keys/key [exit]
		if page = 1 [
			btn-prev/enabled?: no
			process-events
		]
		page-info/selected: page
		list-addresses/prev
	]
	
	do-page: func [face event][	
		page: (to-integer pick face/data face/selected) - 1
		if zero? page [btn-prev/enabled?: no]
		list-addresses
	]

	send-dialog: layout [
		title "Send Ether & Tokens"
		style label: text  100 middle
		style lbl:   text  360 middle font [name: font-fixed size: 10]
		style field: field 360 font [name: font-fixed size: 10]
		label "Network:"		network-to:	  lbl return
		label "From Address:"	addr-from:	  lbl return
		label "To Address:"		addr-to:	  field return
		label "Amount to Send:" amount-field: field 120 label-unit: label 50 return
		label "Gas Price:"		gas-price:	  field 120 "21" return
		label "Gas Limit:"		gas-limit:	  field 120 "21000" return
		pad 215x10 btn-sign: button 60 "Sign" :do-sign-tx
	]

	confirm-sheet: layout [
		title "Confirm Transaction"
		style label: text 120 right bold 
		style info: text 330 middle font [name: font-fixed size: 10]
		label "From Address:" 	info-from:    info return
		label "To Address:" 	info-to: 	  info return
		label "Amount to Send:" info-amount:  info return
		label "Network:"		info-network: info return
		label "Gas Price:" 		info-price:	  info return
		label "Gas Limit:" 		info-limit:	  info return
		label "Max TX Fee:" 	info-fee:	  info return
		label "Nonce:"			info-nonce:	  info return
		pad 164x10 button "Cancel" [signed-data: none unview] button "Send" :do-confirm
	]

	ui: layout compose [
		title "RED Wallet"
		text 50 "Device:" dev: drop-list 125 :do-select-device
		btn-send: button "Send" :do-send disabled
		token-list: drop-list data ["Add Tokens"] 80 select 2 :do-select-token
		net-list:   drop-list data ["mainnet" "rinkeby" "kovan" "ropsten"] select 1 :do-select-network
		btn-reload: button "Reload" :do-reload disabled
		return
		
		my-addr-text: text 185 bold "My Addresses" on-dbl-click [
			if all [coin-type = 'ETH keys/ledger-nano-s?][
				keys/ledger-path: either 4 = length? keys/ledger-path [
					keys/trezor-path
				][
					ledger-legacy-path
				]
				keys/bip32-path: keys/ledger-path
				do-reload
			]
		] pad 160x0
		text bold "Balances" right return pad 0x-10
		
		addr-list: text-list font list-font 530x100 return middle
		
		info-msg: text 280x20
		text right 50 "Page:" tight
		page-info: drop-list 50 
			data collect [repeat p 10 [keep form p]]
			select (page + 1)
			:do-page
		btn-prev: button "Prev" disabled :do-prev-addr 
		btn-more: button "More" :do-more-addr
		do [token-list/extra: 2]
	]

	unlock-dev-dlg: layout [
		title "Unlock your key"
		below center
		text font-size 12 {Unlock your key. If it's Ledger, ensure "Browser support" is "No".}
		button "OK" [unview]
	]

	contract-data-dlg: layout [
		title "Set Contract data to YES"
		below center
		text font-size 12 {Please set "Contract data" to "Yes" in the Ethereum app's settings.}
		button "OK" [unview]
	]

	nonce-error-dlg: layout [
		title "Cannot get nonce"
		below center
		text font-size 12 {Cannot get nonce, please try again.}
		button "OK" [unview]
	]

	tx-error-dlg: layout [
		title "Error!"
		tx-error: area 400x200
	]

	alert: func [e][
		tx-error/text: form e
		view/flags tx-error-dlg 'modal
	]

	monitor-devices: does [
		append ui/pane usb-device: make face! [
			type: 'usb-device offset: 0x0 size: 10x10 rate: 0:0:1
			actors: object [
				on-up: func [face [object!] event [event!]][
					if keys/support? face/data [
						face/rate: none
						keys/connect-key keys/current
						if any [keys/new? keys/state = 'Requesting][
							dev/data: keys/list
							dev/selected: keys/index
							list-addresses
							process-events
						]
					]
				]
				on-down: func [face [object!] event [event!] /local state][
					state: keys/state
					if keys/close-key face/data [
						face/rate: none
						info-msg/text: ""
						clear addr-list/data
						if all [keys/index > 0 state <> 'Requesting][
							connect
							list-addresses
						]
					]
					if state <> 'Requesting [
						dev/data: keys/list
						dev/selected: keys/index
					]
				]
				on-time: func [face event][
					face/rate: none
					if all [keys/key keys/state = 'Requesting][exit]
					unless locked? [connect]
					list-addresses
					unless keys/key [face/rate: 0:0:2]
				]
			]
		]
	]

	setup-actors: does [
		ui/actors: context [
			on-close: func [face event][
				keys/close
				save-cfg
				unview/all
			]
			on-resizing: function [face event] [
				if any [event/offset/x < min-size/x event/offset/y < min-size/y][exit]
				do-resize event/offset - face/extra
				face/extra: event/offset
			]
		]

		addr-list/actors: make object! [
			on-menu: func [face [object!] event [event!] /local data addr amount][
				switch event/picked [
					copy	[copy-addr]
					batch	[
						data: pick addr-list/data addr-list/selected
						addr: copy/part data 42
						amount: eth/eth-to-wei trim/head copy skip data 42
						eth-batch/open addr amount
					]
				]
			]
			on-change: func [face event][
				address-index: page * addr-per-page + face/selected - 1
				btn-send/enabled?: to-logic face/selected
			]
		]

		send-dialog/rate: 0:0:1
		send-dialog/actors: make object! [
			on-time: func [face event /local res][
				face/rate: none
				if res: eth/get-gas-price 'fast [gas-price/text: to string! res]
			]
		]

		addr-list/menu: [
			"Copy address"		copy
			"Batch payment"		batch
		]
	]

	run: does [
		eth-tokens/init
		min-size: ui/extra: ui/size
		setup-actors
		monitor-devices
		load-cfg
		do-auto-size addr-list
		view/flags ui 'resize
	]
]

wallet/run
