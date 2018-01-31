Red [
	Title:	"RED Wallet for Ledger Nano S (Demo)"
	Author: "Xie Qingtian"
	File: 	%wallet.red
	Needs:	View
	Tabs: 	4
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

#include %ledger.red
#include %json.red

wallet: context [

	list-font: make font! [name: "Consolas" size: 11]

	ETH-ratio: make bignum! #{5AF3107A4000}

	get-balance: func [address [string!] /local url data n][
		url: copy http://api.infura.io/v1/jsonrpc/rinkeby/eth_getBalance?params=%5B%22address%22%2C%22latest%22%5D
		replace url "address" address
		data: json/decode read url
		either (length? data/result) % 2 <> 0 [
			poke data/result 2 #"0"
			n: 1
		][n: 2]
		n: make bignum! debase/base skip data/result 1 16
		n: load form n / ETH-ratio
		n / 10000.0
	]

	on-connect: func [face [object!] event [event!] /local addresses addr n][
		either ledger/connect [
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
		]
	]

	on-send: func [face [object!] event [event!]][
		if all [addr-list/data addr-list/selected][
			addr-from/text: copy/part pick addr-list/data addr-list/selected 42
			view/flags send-dialog 'modal 
		]
	]

	on-transaction: func [face [object!] event [event!]][
		
	]

	send-dialog: layout [
		title "Send Ether & Tokens"
		below
		text "From Address" addr-from: text 300
		text "To Address" addr-to: field 300
		text "Amount to Send" amount-field: field 300
		text "Gas Limit" gas-field: field 300 hint "21000"
		pad 80x0 button "Generate Transaction" :on-transaction
	]

	ui: layout [
		title "Red Wallet"
		text 60 "Device:" dev: text 200
		button "Connect" :on-connect
		button "Send" :on-send
		return
		addr-list: text-list font list-font 450x200
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
