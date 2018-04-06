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

#include %ledger.red
#include %json.red

wallet: context [

	list-font: make font! [name: "Consolas" size: 11]

	ETH-ratio: make bignum! #{5AF3107A4000}
	GWei-ratio: make bignum! 100000

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

	etherscan: https://rinkeby.etherscan.io/tx/
	network: https://eth.red-lang.org/v1/jsonrpc/rinkeby
	net-name: "rinkeby"

	eth-to-wei: func [eth /local n][
		if string? eth [eth: to float! eth]
		n: to bignum! to integer! eth * 10000
		n * ETH-ratio
	]

	gwei-to-wei: func [gwei /local n][
		if string? gwei [gwei: to float! gwei]
		n: to bignum! to integer! gwei * 10000
		n * GWei-ratio
	]

	get-balance: func [address [string!] /local url data n][
		url: replace rejoin [
			network {/eth_getBalance?params=["address","latest"]}
		] "address" address
		data: json/decode read url
		either (length? data/result) % 2 <> 0 [
			poke data/result 2 #"0"
			n: 1
		][n: 2]
		n: make bignum! debase/base skip data/result n 16
		n: load form n / ETH-ratio
		n / 10000.0
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
		append tx reduce [
			copy/part signed 1
			copy/part next signed 32
			copy/part skip signed 33 32
		]
		rlp/encode tx
	]

	on-connect: func [face [object!] event [event!] /local addresses addr n][
		either ledger/connect [
			dev/text: "Ledger Nano S"
			addresses: make block! 10
			n: 0
			loop 5 [
				addr: Ledger/get-address n
				unless addr [
					view/flags unlock-dev-dlg 'modal
					exit
				]
				face/enabled?: no
				append addresses rejoin [addr "   " get-balance addr]
				addr-list/data: addresses
				loop 3 [do-events/no-wait]
				n: n + 1
			]
		][
			dev/text: "No Device"
			#if debug? [
				dev/text: "Debug Testing"
				addr: "0x8254e77cF78f4eBB29f5fdDBae72d1192343d2Ef"
				addrs: make block! 2
				append addrs rejoin [addr "   " get-balance addr]
				addr-list/data: addrs
			]
		]
	]

	on-send: func [face [object!] event [event!]][
		if addr-list/data [
			if addr-list/selected = -1 [addr-list/selected: 1]
			addr-from/text: copy/part pick addr-list/data addr-list/selected 42
			view/flags send-dialog 'modal 
		]
	]

	on-select: func [face [object!] event [event!] /local idx][
		idx: face/selected
		net-name: pick face/data idx - 1 * 2
		network: pick networks idx
		etherscan: pick etherscans idx
		connect-btn/enabled?: yes
	]

	on-sign-tx: func [face [object!] event [event!] /local tx][
		tx: reduce [
			get-nonce addr-from/text			;-- nonce
			gwei-to-wei gas-price/text			;-- gas-price
			to-integer gas-limit/text			;-- gas-limit
			debase/base skip addr-to/text 2 16	;-- to address
			eth-to-wei amount-field/text		;-- value
			#{}									;-- data
		]
		;view/flags check-dlg 'modal
		;if check-dlg/state [unview]
		#either debug? [signed-data: #{}][
			signed-data: get-signed-data tx
		]
		if signed-data [
			info-from/text: addr-from/text
			info-to/text: addr-to/text
			info-amount/text: rejoin [amount-field/text " Ether"]
			info-network/text: net-name
			info-price/text: rejoin [gas-price/text " Gwei"]
			info-limit/text: gas-limit/text
			info-fee/text: rejoin [
				mold (to float! gas-price/text) * (to float! gas-limit/text) / 1e9
				" Ether"
			]
			info-nonce/text: mold tx/1
			info-data/text: mold signed-data
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
		label "From Address:" addr-from: label 300 return
		label "To Address:" addr-to: field 300 return
		label "Amount to Send:" amount-field: field 300 return
		label "Gas Price:" gas-price: field 300 "21" return
		label "Gas Limit:" gas-limit: field 300 "21000" return
		pad 170x10 button 60 "Sign" :on-sign-tx
	]

	confirm-sheet: layout [
		title "Confirm Transaction"
		style label: text 100 right
		style info: text 300 middle
		label "From Address:" info-from: info return
		label "To Address:" info-to: info return
		label "Amount to Send:" info-amount: info return
		label "Network:" info-network: info return
		label "Gas Price:" info-price: info return
		label "Gas Limit:" info-limit: info return
		label "Max TX Fee:" info-fee: info return
		label "Nonce:" info-nonce: info return
		label "Data:" info-data: info return
		pad 144x10 button "Cancel" [signed-data: none unview] button "Send" :on-confirm
	]

	ui: layout [
		title "Red Wallet"
		text 60 "Device:" dev: text 120
		drop-list data ["mainnet" 1 "rinkeby" 2 "kovan" 3] select 2 :on-select
		connect-btn: button "Connect" :on-connect
		button "Send" :on-send
		return
		addr-list: text-list font list-font 450x200
	]

	check-dlg: layout [
		title "Check on your key"
		text font-size 12 "Please check the transcation on your key"
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