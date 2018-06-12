Red [
	Title:	 "RED Wallet"
	Author:  "Xie Qingtian"
	File: 	 %wallet.red
	Icon:	 %assets/RED-token.ico
	Needs:	 View
	Version: 0.1.0
	Tabs: 	 4
	Rights:  "Copyright (C) 2018 Red Foundation. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

#include %libs/int256.red
#include %libs/JSON.red
#include %libs/rlp.red
#include %libs/proto-encode.red
#include %libs/ethereum.red
#include %libs/bitcoin.red
#include %libs/HID/hidapi.red
#include %keys/keys.red

#system [
	with gui [#include %libs/usb-monitor.reds]
]

wallet: context [

	list-font: make font! [name: get 'font-fixed size: 11]

	signed-data: addr-list: min-size: none
	addr-per-page: 5

	;-- m / purpose' / coin_type' / account' / change / address_index
	default-purpose: 80000000h + 44
	segwit-purpose: 80000000h + 49
	btc-coin: 80000000h + 0
	btc-test-coin: 80000000h + 1
	eth-coin: 80000000h + 60
	default-account: 80000000h + 0
	default-change: 0

	coins: compose/deep [
		"ETH" [
			;net name		;net server										;explorer server									;BIP32 path																		;chain id			;contract address
			"mainnet"		https://eth.red-lang.org/mainnet				https://etherscan.io/tx/							[(default-purpose) (eth-coin) (default-account) (default-change)]				1					#[none]
			"Rinkeby"		https://eth.red-lang.org/rinkeby				https://rinkeby.etherscan.io/tx/					[(default-purpose) (eth-coin) (default-account) (default-change)]				4					#[none]
			"Kovan"			https://eth.red-lang.org/kovan					https://kovan.etherscan.io/tx/						[(default-purpose) (eth-coin) (default-account) (default-change)]				42					#[none]
			"Ropsten"		https://eth.red-lang.org/ropsten				https://ropsten.etherscan.io/tx/					[(default-purpose) (eth-coin) (default-account) (default-change)]				3					#[none]
		]
		"RED" [
			"mainnet"		https://eth.red-lang.org/mainnet				https://etherscan.io/tx/							[(default-purpose) (eth-coin) (default-account) (default-change)]				1					"76960Dccd5a1fe799F7c29bE9F19ceB4627aEb2f"
			"Rinkeby"		https://eth.red-lang.org/rinkeby				https://rinkeby.etherscan.io/tx/					[(default-purpose) (eth-coin) (default-account) (default-change)]				4					"43df37f66b8b9fececcc3031c9c1d2511db17c42"
		]
		"BTC" [
			"mainnet"		https://api.blockcypher.com/v1/btc/main			https://live.blockcypher.com/btc/tx					[(segwit-purpose) (btc-coin) (default-account) (default-change)]				#[none]				#[none]
			"testnet"		https://api.blockcypher.com/v1/btc/test3		https://live.blockcypher.com/btc-testnet/tx			[(segwit-purpose) (btc-test-coin) (default-account) (default-change)]			#[none]				#[none]
		]
		"BTC-Legacy" [
			"mainnet"		https://api.blockcypher.com/v1/btc/main			https://live.blockcypher.com/btc/tx					[(default-purpose) (btc-coin) (default-account) (default-change)]				#[none]				#[none]
			"testnet"		https://api.blockcypher.com/v1/btc/test3		https://live.blockcypher.com/btc-testnet/tx			[(default-purpose) (btc-test-coin) (default-account) (default-change)]			#[none]				#[none]
		]
	]

	get-network: does [pick find coins/:token-name net-name 2]
	get-explorer: does [pick find coins/:token-name net-name 3]
	get-bip32-path: does [pick find coins/:token-name net-name 4]
	get-chain-id: does [pick find coins/:token-name net-name 5]
	get-contract-addr: does [pick find coins/:token-name net-name 6]

	tokens: extract coins 2

	;-- current token name
	token-name: tokens/1			;-- default "ETH"
	
	net-names: extract coins/:token-name 6
	networks: extract/index coins/:token-name 6 2
	explorers: extract/index coins/:token-name 6 3

	;-- current net name
	net-name: net-names/2			;-- default "Rinkeby"
	network: get-network
	explorer: get-explorer
	token-contract: get-contract-addr
	bip32-path: get-bip32-path

	connected?:		no
	address-index:	0
	page:			0

	process-events: does [loop 10 [do-events/no-wait]]
	
	form-amount: func [value [float!]][
		pos: find value: form value #"."
		head insert/dup value #" " 8 - ((index? pos) - 1)
	]

	enumerate-connected-devices: func [/local len] [
		key/enumerate-connected-devices
		dev-list/data: key/get-valid-names key/valid-device-names
		len: length? dev-list/data
		if len < dev-list/selected [dev-list/selected: len]
		if all [len = 1 dev-list/data/1 = key/no-dev] [
			info-msg/text: "Please plug in your key..."
			dev-list/selected: 1
			clear addr-list/data
		]
	]

	free-enumerate-connected-devices: does [
		key/free-enum
	]

	get-device-name: func [
		return:			[string!]
		/local
			index
			names
			blk
	][
		index: dev-list/selected
		names: dev-list/data
		if names = none [return key/no-dev]
		blk: split names/:index ": "
		blk/1
	]

	get-device-index: func [
		return:			[integer!]
		/local
			index
			names
			blk
	][
		index: dev-list/selected
		names: dev-list/data
		if names = none [return 0]		
		blk: split names/:index ": "
		if blk/2 = none [return 0]
		blk/2
	]

	connect-device: func [
		/local name index
	][
		update-ui no

		name: get-device-name
		index: get-device-index

		if name = key/no-dev [
			;update-ui yes
			exit
		]

		either none <> key/connect name index [
			process-events
			usb-device/rate: none

			if 'InitSuccess <> key/set-init name [
				info-msg/text: "Initialize the key failed..."
				;update-ui yes
				exit
			]

			if 'Init = key/get-request-pin-state-by-name name [
				if 'HasRequested <> key/request-pin-by-name name [
					usb-device/rate: 0:0:1
					info-msg/text: "Please unlock your key"
				]
				;-- print 'Init
			]
			connected?: yes			
		][
			info-msg/text: "This device can't be recognized"
		]
		;update-ui yes
	]

	show-eth-address: func [
		name			[string!]
		n				[integer!]
		addresses		[block!]
		/local
			addr		[string!]
	][
		addr: key/get-eth-address name bip32-path n
		either string? addr [
			info-msg/text: "Please wait while loading addresses..."
		][
			info-msg/text: case [
				addr = 'browser-support-on [{Please set "Browser support" to "No"}]
				addr = 'locked [
					usb-device/rate: 0:0:3
					"Please unlock your key"
				]
				true [{Please open the "Ethereum" application}]
			]
			update-ui yes
			return false
		]
		append addresses rejoin [addr "      <loading>"]
		addr-list/data: addresses
		return true
	]

	enum-eth-address-balance: func [
		/local
			address		[string!]
			addr		[string!]
	][
		info-msg/text: "Please wait while loading balances..."
		update-ui no
		either error? try [
			foreach address addr-list/data [
				addr: copy/part address find address space
				replace address "      <loading>" form-amount either token-contract [
					eth/get-balance-token network token-contract addr
				][
					eth/get-balance network addr
				]
				process-events
			]
		][
			info-msg/text: {Fetch balance: Timeout. Please try "Reload" again}
		][
			info-msg/text: ""
		]
	]

	show-btc-address: func [
		name			[string!]
		n				[integer!]
		addresses		[block!]
		/local
			addr		[string!]
			res
	][
		res: key/get-btc-address name bip32-path n 0 network
		either map? res [
			addr: pick back back tail select res 'origin 1
		][
			addr: res
		]
		either string? addr [
			info-msg/text: "Please wait while loading addresses..."
		][
			info-msg/text: case [
				addr = 'browser-support-on [{Please set "Browser support" to "No"}]
				addr = 'locked [
					usb-device/rate: 0:0:3
					"Please unlock your key"
				]
				true [{Get Address Failed!}]
			]
			update-ui yes
			return false
		]
		append addresses rejoin [addr "      " form-amount select res 'balance]
		addr-list/data: addresses
		return true
	]

	list-addresses: func [
		/prev /next 
		/local
			name
			addresses addr n
			res
			req-pin-state
	][
		update-ui no

		if connected? [
			name: get-device-name
			;-- print name
			req-pin-state: key/get-request-pin-state-by-name name
			;-- print req-pin-state
			if req-pin-state <> 'HasRequested [
				update-ui yes
				exit
			]
			info-msg/text: "Please wait while loading addresses..."

			addresses: clear []
			if next [page: page + 1]
			if prev [page: page - 1]
			n: page * addr-per-page
			
			loop addr-per-page [
				either any [token-name = "ETH" token-name = "RED"][
					if not show-eth-address name n addresses [exit]
					process-events
					n: n + 1
				][
					if not show-btc-address name n addresses [exit]
					process-events
					n: n + 1
				]
			]
			if any [token-name = "ETH" token-name = "RED"][
				enum-eth-address-balance
			]
			update-ui yes
			do-auto-size addr-list
		]
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

	do-select-dev: func [face [object!] event [event!]][
		connected?: no
		key/close
		enumerate-connected-devices
		connect-device
		list-addresses
		free-enumerate-connected-devices
	]

	do-select-network: func [face [object!] event [event!] /local idx][
		idx: face/selected
		
		net-name: face/data/:idx
		network:  networks/:idx
		explorer: explorers/:idx
		token-contract: get-contract-addr
		bip32-path: get-bip32-path
		do-reload
	]

	do-select-token: func [face [object!] event [event!] /local idx net][
		idx: face/selected
		net: net-list/selected
		token-name: face/data/:idx

		net-names: extract coins/:token-name 6
		networks: extract/index coins/:token-name 6 2
		explorers: extract/index coins/:token-name 6 3

		net-list/data: net-names
		net: net-list/selected: either net > length? net-list/data [1][net]
		net-name: net-list/data/:net
		network:  networks/:net
		explorer: explorers/:net
		token-contract: get-contract-addr
		bip32-path: get-bip32-path
		do-reload
	]
	
	do-reload: does [if connected? [list-addresses]]
	
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
		size: size-text/with face "X"
		cols: 64
		if face/data [foreach line face/data [cols: max cols length? line]]
		delta: (as-pair size/x * cols size/y * 5.3) - face/size
		ui/size: ui/size + delta + 8x10					;-- triggers a resizing event
	]

	check-data: func [/local addr amount balance][
		addr: trim any [addr-to/text ""]
		unless all [
			addr/1 = #"0"
			addr/2 = #"x"
			42 = length? addr
			debase/base skip addr 2 16
		][
			addr-to/text: copy "Invalid address"
			return no
		]
		amount: attempt [to float! amount-field/text]
		either all [amount amount > 0.0][
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
		btn-send/enabled?: to-logic all [enabled? addr-list/selected > 0]
		if page > 0 [btn-prev/enabled?: enabled?]
		foreach f [btn-more net-list token-list page-info btn-reload][
			set in get f 'enabled? enabled?
		]
		process-events
	]

	notify-user: does [
		btn-sign/enabled?: no
		process-events
		btn-sign/offset/x: 133
		btn-sign/size/x: 225
		btn-sign/text: "Confirm the transaction on your Ledger"
		process-events
	]

	do-sign-tx: func [face [object!] event [event!] /local tx nonce price limit amount name][
		unless check-data [exit]

		notify-user

		price: eth/gwei-to-wei gas-price/text			;-- gas price
		limit: to-integer gas-limit/text				;-- gas limit
		amount: eth/eth-to-wei amount-field/text		;-- send amount
		nonce: eth/get-nonce network addr-from/text		;-- nonce
		if nonce = -1 [
			unview
			view/flags nonce-error-dlg 'modal
			reset-sign-button
			exit
		]

		name: get-device-name
		;-- Edge case: ledger key may locked in this moment
		unless string? key/get-eth-address name bip32-path 0 [
			reset-sign-button
			view/flags unlock-dev-dlg 'modal
			exit
		]

		either token-contract [
			tx: reduce [
				nonce
				price
				limit
				debase/base token-contract 16			;-- to address
				eth/eth-to-wei 0						;-- value
				rejoin [								;-- data
					#{a9059cbb}							;-- method ID
					debase/base eth/pad64 copy skip addr-to/text 2 16
					eth/pad64 i256-to-bin amount
				]
			]
		][
			tx: reduce [
				nonce
				price
				limit
				debase/base skip addr-to/text 2 16		;-- to address
				amount
				#{}										;-- data
			]
		]

		signed-data: key/get-eth-signed-data name bip32-path address-index tx get-chain-id

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
			info-nonce/text: mold tx/1
			unview
			view/flags confirm-sheet 'modal
		][
			if signed-data = 'token-error [
				unview
				view/flags contract-data-dlg 'modal
			]
			reset-sign-button
		]
	]

	do-confirm: func [face [object!] event [event!] /local result][
		result: eth/call-rpc network 'eth_sendRawTransaction reduce [
			rejoin ["0x" enbase/base signed-data 16]
		]
		unview
		either string? result [
			browse rejoin [explorer result]
		][							;-- error
			tx-error/text: rejoin ["Error! Please try again^/^/" form result]
			view/flags tx-error-dlg 'modal
		]
	]

	copy-addr: func [/local addr][
		if btn-send/enabled? [
			addr: pick addr-list/data addr-list/selected 
			write-clipboard copy/part addr find addr space
		]
	]

	do-more-addr: func [face event][
		unless connected? [exit]
		page-info/selected: page + 2					;-- page is zero-based
		list-addresses/next
		if page > 0 [btn-prev/enabled?: yes]
	]

	do-prev-addr: func [face event][
		unless connected? [exit]
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
		text 50 "Device:"
		dev-list: drop-list data key/get-valid-names key/valid-device-names 135 select 1 :do-select-dev
		btn-send: button "Send" :do-send disabled
		token-list: drop-list data tokens 60 select 1 :do-select-token
		net-list:   drop-list data net-names select 2 :do-select-network
		btn-reload: button "Reload" :do-reload disabled
		return
		
		text bold "My Addresses" pad 280x0 
		text bold "Balances" right return pad 0x-10
		
		addr-list: text-list font list-font 520x100 return middle
		
		info-msg: text 285x20
		text right 50 "Page:" tight
		page-info: drop-list 40 
			data collect [repeat p 10 [keep form p]]
			select (page + 1)
			:do-page
		btn-prev: button "Prev" disabled :do-prev-addr 
		btn-more: button "More" :do-more-addr
	]

	unlock-dev-dlg: layout [
		title "Unlock your key"
		text font-size 12 {Unlock your Ledger key, open the Ethereum app, ensure "Browser support" is "No".}
		return
		pad 262x10 button "OK" [unview]
	]

	contract-data-dlg: layout [
		title "Set Contract data to YES"
		text font-size 12 {Please set "Contract data" to "Yes" in the Ethereum app's settings.}
		return
		pad 180x10 button "OK" [unview]
	]

	nonce-error-dlg: layout [
		title "Cannot get nonce"
		text font-size 12 {Cannot get nonce, please try again.}
		return
		pad 110x10 button "OK" [unview]
	]

	tx-error-dlg: layout [
		title "Send Transaction Error"
		tx-error: area 400x200
	]

	support-device?: func [
		id			[integer!]
		return:		[logic!]
	][
		key/support? id
	]

	monitor-devices: does [
		append ui/pane usb-device: make face! [
			type: 'usb-device offset: 0x0 size: 10x10 rate: 0:0:1
			actors: object [
				on-up: func [face [object!] event [event!] /local id [integer!] len [integer!]][
					id: face/data/2 << 16 or face/data/1
					if support-device? id [
						;-- print "on-up"
						enumerate-connected-devices
						len: length? dev-list/data
						either len > 1 [								;-- if we have multi devices, just reset all
							;-- print [len " devices"]
							face/rate: none
							connected?: no
							info-msg/text: ""
							key/close-pin-requesting-by-id id			;-- for trezor pin request
							key/close
							connect-device
							list-addresses
						][
							if any [
								not key/opened? id
								'Init = key/get-request-pin-state-by-id id
							][
								;-- print "need unlock key"
								connected?: no
								key/close
								connect-device
								list-addresses
							]
						]
						free-enumerate-connected-devices
					]
				]
				on-down: func [face [object!] event [event!] /local id [integer!]][
					id: face/data/2 << 16 or face/data/1
					if support-device? id [
						;-- print "on-down"
						face/rate: none
						connected?: no
						info-msg/text: ""
						clear addr-list/data
						key/close-pin-requesting-by-id id			;-- for trezor pin request
						key/close
						enumerate-connected-devices
						connect-device
						list-addresses
						free-enumerate-connected-devices
					]
				]
				on-time: func [face event /local name][
					name:  get-device-name
					if all [
						connected?
						'Requesting <> key/get-request-pin-state-by-name name
					][face/rate: none]
					;-- print "on-time"
					if not key/any-opened? [
						;-- print "need to enumerate"
						key/close
						enumerate-connected-devices
						connect-device
						free-enumerate-connected-devices
					]
					list-addresses
				]
			]
		]
	]

	setup-actors: does [
		ui/actors: context [
			on-close: func [face event][
				key/close
			]
			on-resizing: function [face event] [
				if any [event/offset/x < min-size/x event/offset/y < min-size/y][exit]
				do-resize event/offset - face/extra
				face/extra: event/offset
			]
		]

		addr-list/actors: make object! [
			on-menu: func [face [object!] event [event!]][
				switch event/picked [
					copy	[copy-addr]
				]
			]
			on-change: func [face event][
				address-index: page * addr-per-page + face/selected - 1
				btn-send/enabled?: to-logic face/selected
			]
		]

		addr-list/menu: [
			"Copy address"		copy
		]
	]

	run: does [
		min-size: ui/extra: ui/size
		setup-actors
		monitor-devices
		do-auto-size addr-list
		view/flags ui 'resize
	]
]

wallet/run
