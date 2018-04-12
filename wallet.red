Red [
	Title:	"RED Wallet (Demo)"
	Author: "Xie Qingtian"
	File: 	%wallet.red
	Needs:	View
	Tabs: 	4
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

#do [debug?: no]

#include %int256.red
#include %hidapi.red
#include %ledger.red
;#include %trezor.red
#include %json.red

wallet: context [

	list-font: make font! [name: get 'font-fixed size: 11]

	ETH-ratio: to-i256 #{5AF3107A4000}
	GWei-ratio: to-i256 100000

	signed-data: none

	networks: [
		https://eth.red-lang.org/v1/jsonrpc/mainnet
		https://eth.red-lang.org/v1/jsonrpc/rinkeby
		https://eth.red-lang.org/v1/jsonrpc/kovan
	]

	etherscans: [
		https://etherscan.io/tx/
		https://rinkeby.etherscan.io/tx/
		https://kovan.etherscan.io/tx/
	]

	contracts: [
		;"RED" "76960Dccd5a1fe799F7c29bE9F19ceB4627aEb2f"
		"RED" "43df37f66b8b9fececcc3031c9c1d2511db17c42"
	]

	etherscan: https://rinkeby.etherscan.io/tx/
	network: https://eth.red-lang.org/v1/jsonrpc/rinkeby
	net-name: "rinkeby"
	token-name: "ETH"
	token-contract: none

	connected?: no

	eth-to-wei: func [eth /local n][
		abc: 2
		if string? eth [eth: to float! eth]
		n: to-i256 to integer! eth * 10000
		mul256 n ETH-ratio
	]

	gwei-to-wei: func [gwei /local n][
		if string? gwei [gwei: to float! gwei]
		n: to-i256 to integer! gwei * 10000
		mul256 n GWei-ratio
	]

	pad: function [data [string! binary!]][
		n: length? data
		either binary? data [c: #{00} len: 32][c: #"0" len: 64]
		if n < len [
			insert/dup data c len - n
		]
		data
	]

	parse-balance: function [amount][
		either (length? amount) % 2 <> 0 [
			poke amount 2 #"0"
			n: 1
		][n: 2]
		n: to-i256 debase/base skip amount n 16
		n: i256-to-int div256 n ETH-ratio
		n / 10000.0
	]

	get-balance-token: func [address [string!] /local body url token-url params reply][
		url: network
		token-url: rejoin ["0x" token-contract]
		params: make map! 4
		params/to: token-url
		params/data: rejoin ["0x70a08231" pad copy skip address 2]

		body: #(
			jsonrpc: "2.0"
			id: 57386342
			method: "eth_call"
		)
		body/params: reduce [params "latest"]
		reply: json/decode write url compose [
			POST
			[
				Content-Type: "application/json"
				Accept: "application/json"
			]
			(to-binary json/encode body)
		]
		parse-balance reply/result
	]

	get-balance: func [address [string!] /local url data n][
		url: replace rejoin [
			network {/eth_getBalance?params=["address","latest"]}
		] "address" address
		data: json/decode read url
		parse-balance data/result
	]

	get-nonce: function [address [string!]][
		url: replace rejoin [
			network
			{/eth_getTransactionCount?params=["address", "pending"]}
		] "address" address
		data: json/decode read url
		either (length? data/result) % 2 <> 0 [
			poke data/result 2 #"0"
			n: 1
		][n: 2]
		to integer! debase/base skip data/result n 16
	]

	get-signed-data: func [tx /local signed][
		signed: ledger/sign-eth-tx 0 tx
		if signed [
			append tx reduce [
				copy/part signed 1
				copy/part next signed 32
				copy/part skip signed 33 32
			]
			rlp/encode tx
		]
	]

	on-connect: func [face [object!] event [event!] /local addresses addr n amount][
		either ledger/connect [
			connected?: yes
			dev/text: "Ledger Nano S"
			addresses: make block! 10
			n: 0
			loop 5 [
				addr: Ledger/get-address n
				unless addr [
					view/flags unlock-dev-dlg 'modal
					exit
				]
				;face/enabled?: no
				amount: either token-contract [
					get-balance-token addr
				][
					get-balance addr
				]
				append addresses rejoin [addr "   " amount]
				addr-list/data: addresses
				loop 3 [do-events/no-wait]
				n: n + 1
			]
		][
			dev/text: "No Device"
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
		network: pick networks idx
		etherscan: pick etherscans idx
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
		loop 3 [do-events/no-wait]
	]

	on-sign-tx: func [face [object!] event [event!] /local tx][
		either token-contract [
			tx: reduce [
				get-nonce addr-from/text			;-- nonce
				gwei-to-wei gas-price/text			;-- gas-price
				to-integer gas-limit/text			;-- gas-limit
				debase/base token-contract 16		;-- to address
				eth-to-wei 0						;-- value
				rejoin [							;-- data
					#{a9059cbb}		;-- method ID
					debase/base pad copy skip addr-to/text 2 16
					pad i256-to-bin eth-to-wei amount-field/text
				]
			]
		][
			tx: reduce [
				get-nonce addr-from/text			;-- nonce
				gwei-to-wei gas-price/text			;-- gas-price
				to-integer gas-limit/text			;-- gas-limit
				debase/base skip addr-to/text 2 16	;-- to address
				eth-to-wei amount-field/text		;-- value
				#{}									;-- data
			]
		]

		notify-user
		signed-data: get-signed-data tx

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
			;info-data/text: mold signed-data
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
			POST
			[
				Content-Type: "application/json"
				Accept: "application/json"
			]
			(to-binary json/encode body)
		]
		browse rejoin [etherscan reply/result]
		unview
	]

	send-dialog: layout [
		title "Send Ether & Tokens"
		style label: text 100 middle
		label "From Address:" addr-from: label 360 return
		label "To Address:" addr-to: field 360 return
		label "Amount to Send:" amount-field: field 300 label-unit: label 50 return
		label "Gas Price:" gas-price: field 360 "21" return
		label "Gas Limit:" gas-limit: field 360 "21000" return
		pad 200x10 btn-sign: button 60 "Sign" :on-sign-tx
	]

	confirm-sheet: layout [
		title "Confirm Transaction"
		style label: text 100 right
		style info: text 330 middle
		label "From Address:" info-from: info return
		label "To Address:" info-to: info return
		label "Amount to Send:" info-amount: info return
		label "Network:" info-network: info return
		label "Gas Price:" info-price: info return
		label "Gas Limit:" info-limit: info return
		label "Max TX Fee:" info-fee: info return
		label "Nonce:" info-nonce: info return
		pad 164x10 button "Cancel" [signed-data: none unview] button "Send" :on-confirm
	]

	ui: layout [
		title "Red Wallet"
		text 60 "Device:" dev: text 120
		drop-list 70x24 data ["mainnet" 1 "rinkeby" 2 "kovan" 3] select 2 :on-select-network
		connect-btn: button 66x25 "Connect" :on-connect
		button 66x25 "Send" :on-send
		drop-list 48x24 data ["ETH" 1 "RED" 2]  select 1 :on-select-token
		return
		addr-list: text-list font list-font 530x200
	]

	unlock-dev-dlg: layout [
		title "Unlock your key"
		text font-size 12 "Please open the ethereum app and set browser support to NO!"
		return
		pad 200x10 button "OK" [unview]
	]

	setup-actors: does [
		ui/actors: make object! [
			on-close: func [face event][
				ledger/close
			]
		]
	]

	open: does [
		setup-actors
		view ui
	]
]

wallet/open