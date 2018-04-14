Red [
	Title:	"RED Wallet (Demo)"
	Author: "Xie Qingtian"
	File: 	%wallet.red
	Needs:	View
	Tabs: 	4
	Rights:  "Copyright (C) 2018 Red Foundation. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

#do [debug?: yes]

#include %libs/int256.red
#include %libs/json.red
#include %libs/ethereum.red
#include %libs/HID/hidapi.red
#include %keys/Ledger/ledger.red
;#include %trezor.red

wallet: context [

	list-font: make font! [name: get 'font-fixed size: 11]

	signed-data: none

	networks: [
		https://eth.red-lang.org/v1/jsonrpc/mainnet
		https://eth.red-lang.org/v1/jsonrpc/rinkeby
		https://eth.red-lang.org/v1/jsonrpc/kovan
	]

	explorers: [
		https://etherscan.io/tx/
		https://rinkeby.etherscan.io/tx/
		https://kovan.etherscan.io/tx/
	]

	contracts: [
		#either debug? [
			"RED" "43df37f66b8b9fececcc3031c9c1d2511db17c42"	;-- RED token contract on Rinkeby
		][
			"RED" "76960Dccd5a1fe799F7c29bE9F19ceB4627aEb2f"	;-- RED token contract on Mainnet
		]
	]

	explorer: explorers/2
	network: networks/2
	net-name: "rinkeby"
	token-name: "ETH"
	token-contract: none

	connected?: no

	process-events: does [loop 5 [do-events/no-wait]]

	on-connect: func [face [object!] event [event!] /local addresses addr n amount][
		either ledger/connect [
			face/enabled?: no
			process-events
			connected?: yes
			dev/text: "Ledger Nano S"
			addresses: make block! 10
			n: 0
			loop 5 [
				addr: Ledger/get-address n
				unless addr [
					view/flags unlock-dev-dlg 'modal
					face/enabled?: yes
					exit
				]
				amount: either token-contract [
					eth/get-balance-token network token-contract addr
				][
					eth/get-balance network addr
				]
				append addresses rejoin [addr "   " amount]
				addr-list/data: addresses
				process-events
				n: n + 1
			]
			face/enabled?: yes
		][
			dev/text: "<No Device>"
		]
	]

	on-send: func [face [object!] event [event!]][
		if addr-list/data [
			if addr-list/selected = -1 [addr-list/selected: 1]
			addr-from/text: copy/part pick addr-list/data addr-list/selected 42
			gas-limit/text: either token-contract ["79510"]["21000"]
			btn-sign/offset/x: 200
			btn-sign/size/x: 60
			btn-sign/text: "Sign"
			label-unit/text: token-name
			view/flags send-dialog 'modal
		]
	]

	on-select-network: func [face [object!] event [event!] /local idx][
		idx: face/selected
		net-name: pick face/data idx - 1 * 2 + 1
		network:  pick networks idx
		explorer: pick explorers idx
		if connected? [on-connect face event]
		connect-btn/enabled?: yes
	]

	on-select-token: func [face [object!] event [event!] /local idx][
		idx: face/selected
		token-name: pick face/data idx - 1 * 2 + 1
		token-contract: select contracts token-name
		if connected? [on-connect face event]
	]

	notify-user: does [
		btn-sign/offset/x: 150
		btn-sign/size/x: 200
		btn-sign/text: "please check on your key"
		process-events
	]

	on-sign-tx: func [face [object!] event [event!] /local tx][
		either token-contract [
			tx: reduce [
				eth/get-nonce network addr-from/text	;-- nonce
				eth/gwei-to-wei gas-price/text			;-- gas-price
				to-integer gas-limit/text				;-- gas-limit
				debase/base token-contract 16			;-- to address
				eth/eth-to-wei 0						;-- value
				rejoin [								;-- data
					#{a9059cbb}		;-- method ID
					debase/base eth/pad64 copy skip addr-to/text 2 16
					eth/pad64 i256-to-bin eth/eth-to-wei amount-field/text
				]
			]
		][
			tx: reduce [
				eth/get-nonce network addr-from/text	;-- nonce
				eth/gwei-to-wei gas-price/text			;-- gas-price
				to-integer gas-limit/text				;-- gas-limit
				debase/base skip addr-to/text 2 16		;-- to address
				eth/eth-to-wei amount-field/text		;-- value
				#{}										;-- data
			]
		]

		notify-user
		signed-data: ledger/get-signed-data tx

		if signed-data [
			info-from/text: addr-from/text
			info-to/text: addr-to/text
			info-amount/text: rejoin [amount-field/text " " token-name]
			info-network/text: net-name
			info-price/text: rejoin [gas-price/text " Gwei"]
			info-limit/text: gas-limit/text
			info-fee/text: rejoin [
				mold (to float! gas-price/text) * (to float! gas-limit/text) / 1e9
				" Ether"
			]
			info-nonce/text: mold tx/1
			unview
			view/flags confirm-sheet 'modal
		]
	]

	on-confirm: func [face [object!] event [event!] /local url data body reply][
		url: network
		data: rejoin ["0x" enbase/base signed-data 16]
		body: #(
			jsonrpc: "2.0"
			id: 57386342
			method: "eth_sendRawTransaction"
		)
		body/params: reduce [data]
		reply: json/decode write url compose [
			POST [
				Content-Type: "application/json"
				Accept: "application/json"
			]
			(to-binary json/encode body)
		]
		browse rejoin [explorer reply/result]
		unview
	]

	send-dialog: layout [
		title "Send Ether & Tokens"
		style label: text 100 middle
		label "From Address:"	addr-from:	  label 360 return
		label "To Address:"		addr-to:	  field 360 return
		label "Amount to Send:" amount-field: field 300 label-unit: label 50 return
		label "Gas Price:"		gas-price:	  field 360 "21" return
		label "Gas Limit:"		gas-limit:	  field 360 "21000" return
		pad 200x10 btn-sign: button 60 "Sign" :on-sign-tx
	]

	confirm-sheet: layout [
		title "Confirm Transaction"
		style label: text 100 right bold
		style info: text 330 middle
		label "From Address:" 	info-from:    info return
		label "To Address:" 	info-to: 	  info return
		label "Amount to Send:" info-amount:  info return
		label "Network:"		info-network: info return
		label "Gas Price:" 		info-price:	  info return
		label "Gas Limit:" 		info-limit:	  info return
		label "Max TX Fee:" 	info-fee:	  info return
		label "Nonce:"			info-nonce:	  info return
		pad 164x10 button "Cancel" [signed-data: none unview] button "Send" :on-confirm
	]

	ui: layout [
		title "Red Wallet"
		text 60 "Device:" dev: text 120 "<No Device>"
		drop-list data ["mainnet" 1 "rinkeby" 2 "kovan" 3] select 2 :on-select-network
		connect-btn: button "Connect" :on-connect
		button "Send" :on-send
		drop-list 80 data ["ETH" 1 "RED" 2] select 1 :on-select-token
		return
		addr-list: text-list font list-font 530x200
	]

	unlock-dev-dlg: layout [
		title "Unlock your key"
		text font-size 12 {Please open the Ethereum app on your Ledger key and set "Browser support" to "No".}
		return
		pad 260x10 button "OK" [unview]
	]

	setup-actors: does [
		ui/actors: make object! [
			on-close: func [face event][
				ledger/close
			]
		]
	]

	run: does [
		setup-actors
		view ui
	]
]

wallet/run