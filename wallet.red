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

wallet: context [

	list-font: make font! [name: "Consolas" size: 11]

	on-connect: func [face [object!] event [event!] /local addresses n][
		either ledger/connect [
			dev/text: "Ledger Nano S"
			addresses: make block! 10
			n: 0
			loop 5 [
				append addresses ledger/get-address n
				n: n + 1
			]
			addr-list/data: addresses
		][
			dev/text: "No Device"
		]
	]

	ui: layout [
		title "Red Wallet"
		text 60 "Device:" dev: text 250 button "Connect" :on-connect
		return
		addr-list: text-list font list-font 400x200
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
