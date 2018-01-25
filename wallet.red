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

	on-connect: func [face [object!] event [event!]][
		ledger/connect
		dev/text: "Ledger Nano S"
	]

	ui: layout [
		text "Device:" dev: text 100 button "Connect" :on-connect
		return
		text-list 265x400
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
