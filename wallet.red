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
#include %libs/protobuf.red
#include %libs/ethereum.red
#include %libs/HID/hidapi.red
#include %keys/keys.red

#system [
	with gui [#include %libs/usb-monitor.reds]
]

wallet: context [

	list-font: make font! [name: get 'font-fixed size: 11]

	signed-data: addr-list: min-size: none
	addr-per-page: 5

	networks: [
		https://eth.red-lang.org/mainnet
		https://eth.red-lang.org/rinkeby
		https://eth.red-lang.org/kovan
	]

	explorers: [
		https://etherscan.io/tx/
		https://rinkeby.etherscan.io/tx/
		https://kovan.etherscan.io/tx/
	]

	contracts: [
		"ETH" [
			"mainnet" #[none]
			"Rinkeby" #[none]
			"Kovan"	  #[none]
		]
		"RED" [
			"mainnet" "76960Dccd5a1fe799F7c29bE9F19ceB4627aEb2f"
			"Rinkeby" "43df37f66b8b9fececcc3031c9c1d2511db17c42"
		]
	]

	explorer: explorers/2
	network: networks/2
	net-name: "rinkeby"
	token-name: "ETH"
	token-contract: none

	last-dev: none
	last-ser: none
	connected?:		no
	address-index:	0
	page:			0

	process-events: does [loop 10 [do-events/no-wait]]
	
	form-amount: func [value [float!]][
		pos: find value: form value #"."
		head insert/dup value #" " 8 - ((index? pos) - 1)
	]

	enumerate-connected-devices: does [
		key/enumerate-connected-devices
		dev-list/data: key/get-valid-names
		dev-list/selected: 1
		if dev-list/data = [] [
			info-msg/text: "Please plug in your key..."
			clear addr-list/data
		]
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
			info-msg/text: ""
			exit
		]

		either none <> key/connect name index [
			process-events
			usb-device/rate: none

			if 'InitSuccess <> key/set-init name [
				info-msg/text: "Initialize the key failed..."
				exit
			]
			connected?: yes			
			update-ui yes
		][
			info-msg/text: "This device can't be recognized"
		]
	]

	list-addresses: func [
		/prev /next 
		/local
			name
			addresses addr n
	][
		update-ui no

		if connected? [
			name: get-device-name
			info-msg/text: "Please wait while loading addresses..."
			
			addresses: clear []
			if next [page: page + 1]
			if prev [page: page - 1]
			n: page * addr-per-page
			
			loop addr-per-page [
				addr: key/get-address name n
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
					exit
				]
				append addresses rejoin [addr "      <loading>"]
				addr-list/data: addresses
				process-events
				n: n + 1
			]
			info-msg/text: "Please wait while loading balances..."
			update-ui no
			foreach address addr-list/data [
				addr: copy/part address find address space
				replace address "   <loading>" form-amount either token-contract [
					eth/get-balance-token network token-contract addr
				][
					eth/get-balance network addr
				]
				process-events
			]
			info-msg/text: ""
			update-ui yes
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
	]

	do-select-network: func [face [object!] event [event!] /local idx][
		idx: face/selected
		
		net-name: face/data/:idx
		network:  networks/:idx
		explorer: explorers/:idx
		token-contract: contracts/:token-name/:net-name
		do-reload
	]

	do-select-token: func [face [object!] event [event!] /local idx net][
		idx: face/selected
		net: net-list/selected
		token-name: face/data/:idx

		net-list/data: extract contracts/:token-name 2
		net: net-list/selected: either net > length? net-list/data [1][net]
		net-name: net-list/data/:net
		token-contract: contracts/:token-name/:net-name
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
		delta: (as-pair size/x * 64 size/y * 5.3) - face/size
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
		btn-send/enabled?: all [enabled? addr-list/selected]
		if page > 0 [btn-prev/enabled?: enabled?]
		foreach f [btn-more net-list token-list page-info btn-reload][
			set in get f 'enabled? enabled?
		]
		process-events
	]

	notify-user: does [
		btn-sign/enabled?: no
		process-events
		btn-sign/offset/x: 145
		btn-sign/size/x: 200
		btn-sign/text: "please check on your key"
		process-events
	]

	do-sign-tx: func [face [object!] event [event!] /local tx nonce price limit amount name chain-id][
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
		unless string? key/get-address name 0 [
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

		chain-id: case [
			net-name = "mainnet" [1]
			net-name = "Rinkeby" [4]
			net-name = "Kovan" [42]
		]
		signed-data: key/get-signed-data name address-index tx chain-id

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

	copy-addr: func [][
		if btn-send/enabled? [
			write-clipboard copy/part pick addr-list/data addr-list/selected 42
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
		label "To Address:"		addr-to:	  field hint "0x0000000000000000000000000000000000000000" return
		label "Amount to Send:" amount-field: field 120 hint "0.001" label-unit: label 50 return
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
		dev-list: drop-list data key/get-valid-names 135 select 1 :do-select-dev
		btn-send: button "Send" :do-send disabled
		token-list: drop-list data ["ETH" "RED"] 60 select 1 :do-select-token
		net-list:   drop-list data ["mainnet" "rinkeby" "kovan"] select 2 :do-select-network
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
		text font-size 12 {Please set "Contract data" to "Yes" in Ethereum app's settings.}
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
				on-up: func [face [object!] event [event!] /local id [integer!]][
					id: face/data/2 << 16 or face/data/1
					if support-device? id [
						;-- when plug in a new device, we don't known it's serial number, so reset all devices
						;-- print "on-up"
						connected?: no
						key/close
						enumerate-connected-devices
						connect-device
						list-addresses
					]
				]
				on-down: func [face [object!] event [event!] /local id [integer!]][
					id: face/data/2 << 16 or face/data/1
					if support-device? id [
						;-- when plug out a device, we don't knwon it's serial number, so reset all devices also
						;-- print "on-down"
						face/rate: none
						connected?: no
						info-msg/text: ""
						clear addr-list/data
						key/close
						enumerate-connected-devices
						connect-device
						list-addresses
					]
				]
				on-time: func [face event][
					if connected? [face/rate: none]
					;-- print "on-time"
					key/close
					enumerate-connected-devices
					connect-device
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
