Red [
	Title:	"Batch payment utils"
	Author: "Xie Qingtian"
	File: 	%eth-batch.red
	Tabs: 	4
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

eth-batch: context [

	list-font: make font! [name: get 'font-fixed size: 11]

	sanitized?:			yes
	payment-stop?:		no
	batch-results:		make block! 4

	payment-list:		none
	batch-result-btn:	none
	batch-send-btn:		none
	payment-name:		none
	payment-addr:		none
	payment-amount:		none
	add-payment-btn:	none
	signed-data:		none
	total-balance:		none

	sanitize-payments: func [data [block! none!] /local entry c][
		if block? data [
			foreach entry data [
				if find "√×" last entry [
					clear skip tail entry -3
				]
			]
			new-line/all next data yes
		]
		sanitized?: yes
		data
	]

	check-payment: func [
		data	[block!]
		return: [word!]
		/local sum entry addr amount
	][
		unless wallet/valid-amount? batch-gas-price/text [
			batch-gas-price/text: copy "Invaild gas price"
			return 'invalid-price
		]

		sum: to-i256 0
		foreach entry data [
			entry: trim/head skip entry 20
			addr: copy/part entry 42
			unless wallet/valid-address? addr [
				payment-addr/text: copy "Invalid address"
				return 'invalid-address
			]

			amount: trim copy skip entry 42
			either wallet/valid-amount? amount [
				sum: add256 sum eth/eth-to-wei amount
				if lesser-or-equal256? total-balance sum [
					wallet/alert "Insufficient Balance"
					return 'Insufficient-balance
				]
			][
				payment-amount/text: copy "Invaild amount"
				return 'invalid-amount
			]
		]
		return 'ok
	]

	do-add-payment: func [face event /local entry res][
		unless sanitized? [sanitize-payments payment-list/data]
		entry: rejoin [
			pad copy/part trim/head payment-name/text 18 20
			trim payment-addr/text "        "
			trim payment-amount/text
		]
		data: copy payment-list/data
		either add-payment-btn/text = "Add" [
			append data entry
		][
			poke data payment-list/selected entry
		]
		if 'ok = check-payment data [
			payment-list/data: data
			unview
		]
	]

	do-import-payments: function [face event][
		if f: request-file [
			payment-list/data: sanitize-payments load f
		]
	]

	do-export-payments: func [face event][
		if f: request-file/save [
			save f sanitize-payments payment-list/data
		]
	]

	do-check-result: function [face event][
		foreach result batch-results [
			either string? result [
				browse rejoin [wallet/explorer result]
			][							;-- error
				wallet/alert result
			]
		]
	]

	do-batch-payment: func [
		face	[object!]
		event	[event!]
		/local from-addr nonce entry addr to-addr amount result idx
	][
		either batch-send-btn/text = "Stop" [
			floating-text/text: copy "Cancel the transaction on your key"
			floating-dlg/visible?: yes
			center-face/with floating-dlg batch-send-dialog
			view/no-wait floating-dlg
			floating-text/rate: 0:0:2
			payment-stop?: yes
			exit
		][
			unless sanitized? [sanitize-payments payment-list/data]
			if 'ok <> check-payment payment-list/data [exit]
		]
		clear batch-results
		payment-stop?: no
		batch-result-btn/visible?: no
		from-addr: batch-addr-from/text

		nonce: eth/get-nonce wallet/network from-addr
		if nonce = -1 [
			view/flags wallet/nonce-error-dlg 'modal
			exit
		]

		;-- Edge case: ledger key may locked in this moment
		unless string? keys/get-address 0 [
			view/flags wallet/unlock-dev-dlg 'modal
			exit
		]

		batch-send-btn/text: "Stop"
		idx: 1
		floating-text/text: copy "Check the transaction on your key"
		floating-dlg/visible?: yes
		center-face/with floating-dlg batch-send-dialog
		view/no-wait floating-dlg
		floating-text/rate: 0:0:2
		foreach entry payment-list/data [
			payment-list/selected: idx
			process-events
			addr: next find entry " 0x"
			to-addr: copy/part addr 42
			amount: trim copy skip addr 42

			signed-data: wallet/sign-transaction
				from-addr
				to-addr
				batch-gas-price/text
				batch-gas-limit/text
				amount
				nonce

			if payment-stop? [break]

			append pad entry 80 either all [
				signed-data
				binary? signed-data
			][
				result: eth/send-raw-tx wallet/network signed-data
				append batch-results result
				either string? result [nonce: nonce + 1 "√"]["×"]
			][
				if signed-data = 'token-error [
					view/flags wallet/contract-data-dlg 'modal
					break
				]
				"×"
			]
			sanitized?: no
			idx: idx + 1
		]
		unless empty? batch-results [batch-result-btn/visible?: yes]
		batch-send-btn/text: "Send"
	]

	batch-send-dialog: layout [
		title "Batch Payment"
		style lbl: text 350 middle font [name: font-fixed size: 11]
		style btn: button 68
		text 55 "Account:" batch-addr-from: lbl
		text 60 "Gas Limit:" batch-gas-limit: field 60
		text 60 "Gas Price:" batch-gas-price: field 48 "21" return

		payment-list: text-list font list-font data [] 685x400 below
		btn "Add"	[
			add-payment-dialog/text: "Add payment"
			add-payment-btn/text: "Add"
			view/flags add-payment-dialog 'modal
		]
		btn "Edit"	[
			unless empty? payment-list/data [
				unless sanitized? [sanitize-payments payment-list/data]
				add-payment-dialog/text: "Edit payment"
				entry: pick payment-list/data payment-list/selected
				payment-name/text: copy/part entry find entry #" "
				payment-addr/text: copy/part addr: next find entry " 0x" 42
				payment-amount/text: trim copy skip addr 42
				add-payment-btn/text: "OK"
				view/flags add-payment-dialog 'modal
			]
		]
		btn "Remove" [
			dlg: copy [
				below center
				text font-size 11 "Are you sure to remove it?"
				text "none"
				panel [
					pad 0x0
					button "Yes" [
						remove at payment-list/data payment-list/selected
						unview
					]
					button "Cancel" [unview]
				]
			]
			either payment-list/selected > 0 [
				dlg/8: pick payment-list/data payment-list/selected
				view/flags dlg 'modal
			][
				dlg/6: "Please select an item to remove"
				clear skip dlg 6
				append dlg [button "OK" [unview]]
				view/flags dlg 'modal
			]
		]
		btn "Import" :do-import-payments
		btn "Export" :do-export-payments
		pad 0x20
		batch-send-btn: btn "Send"	:do-batch-payment
		batch-result-btn: btn "Results" :do-check-result
		do [batch-result-btn/visible?: no]
	]

	add-payment-dialog: layout [
		style field: field 360 font [name: font-fixed size: 10]
		group-box [
			text "Name:" payment-name: field return
			text "Address:" payment-addr: field return
			text "Amount:" payment-amount: field
		] return
		pad 160x0 add-payment-btn: button "Add" :do-add-payment
		pad 20x0 button "Cancel" [unview]
	]

	floating-dlg: layout/flags [
		floating-text: text font-size 14 "Cancel the transaction on your key"
		rate 0:0:2 on-time [face/rate: none floating-dlg/visible?: no]
	] 'no-title

	setup-actors: does [
		batch-send-dialog/rate: 0:0:1
		batch-send-dialog/actors: make object! [
			on-time: func [face event /local res][
				face/rate: none
				if res: eth/get-gas-price 'fast [batch-gas-price/text: to string! res]
			]
		]
	]

	open: func [addr [string!] balance [vector!] /local price-wei][
		batch-addr-from/text: copy addr
		total-balance: balance
		clear payment-list/data
		batch-gas-limit/text: either wallet/token-contract ["159020"]["21000"]
		if batch-send-dialog/state [unview batch-send-dialog]
		view batch-send-dialog
	]
]
