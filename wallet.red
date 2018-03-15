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

#do [debug?: yes]

#include %ledger.red
#include %json.red

wallet: context [

	list-font: make font! [name: "Consolas" size: 11]

	ETH-ratio: make bignum! #{5AF3107A4000}
	GWei-ratio: make bignum! 100000

	signed-data: none

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
		url: copy https://api.infura.io/v1/jsonrpc/rinkeby/eth_getBalance?params=%5B%22address%22%2C%22latest%22%5D
		replace url "address" address
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
		url: copy https://api.infura.io/v1/jsonrpc/rinkeby/eth_getTransactionCount?params=%5B%22address%22%2C%20%22pending%22%5D
		replace url "address" address
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
			face/enabled?: no
			dev/text: "Ledger Nano S"
			addresses: make block! 10
			n: 0
			loop 5 [
				addr: Ledger/get-address n
				append addresses rejoin [addr "   " get-balance addr]
				n: n + 1
			]
			addr-list/data: addresses
		][
			dev/text: "No Device"
			#if debug? [
				dev/text: "Debug Testing"
				addr: "0xEd6cF9Ecc7561845fafe16B181e3dF2453b7C334"
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

	on-transaction: func [face [object!] event [event!] /local tx][
		tx: reduce [
			get-nonce addr-from/text			;-- nonce
			gwei-to-wei gas-price/text			;-- gas-price
			to-integer gas-limit/text			;-- gas-limit
			debase/base skip addr-to/text 2 16	;-- to address
			eth-to-wei amount-field/text		;-- value
			#{}									;-- data
		]
		view/flags check-dlg 'modal
		#either debug? [signed-data: #{1234}][
			signed-data: get-signed-data tx
		]
		if check-dlg/state [unview]
		if signed-data [
			info-from/text: addr-from/text
			info-to/text: addr-to/text
			info-amount/text: amount-field/text
			info-network/text: "Rinkeby Testnet"
			info-price/text: gas-price/text
			info-limit/text: gas-limit/text
			info-fee/text: mold (to float! gas-price/text) * (to float! gas-limit/text)
			info-nonce/text: mold tx/1
			info-data/text: mold signed-data
			view/flags confirm-sheet 'modal
		]
	]

	on-confirm: func [face [object!] event [event!] /local url data body reply][
		url: https://api.infura.io/v1/jsonrpc/rinkeby
		data: rejoin ["0x" enbase/base signed-data 16]
		body: #(
			jsonrpc: "2.0"
			id: 57386342
			method: "eth_sendRawTransaction"
		)
		body/params: reduce [data]
		reply: json/decode write/info url compose [
			POST
			[
				Content-Type: "application/json"
				Accept: "application/json"
			]
			(json/encode body)
		]
		probe reply/result			;-- tx hash
	]

	send-dialog: layout [
		title "Send Ether & Tokens"
		style label: text 100 middle
		label "From Address:" addr-from: label 300 return
		label "To Address:" addr-to: field 300 return
		label "Amount to Send:" amount-field: field 300 return
		label "Gas Price:" gas-price: field 300 "21" return
		label "Gas Limit:" gas-limit: field 300 "21000" return
		pad 144x10 button "Generate Transaction" :on-transaction
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
		pad 144x10 button "No" [signed-data: none unview] button "Yes" :on-confirm
	]

	ui: layout [
		title "Red Wallet"
		text 60 "Device:" dev: text 200
		button "Connect" :on-connect
		button "Send" :on-send
		return
		addr-list: text-list font list-font 450x200
	]

	check-dlg: layout [
		title "Check on your key"
		text "Please check the transcation on your key"
		button "Ok"
	]

	setup-actors: does [
		ui/actors: make object! [
			on-close: func [face event][
				ledger/close
			]
		]
	]

	open: does [
		view ui
	]
]

wallet/open
