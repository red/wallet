Red [
	Title:	 "Dialogs for Bitcoin transaction"
	Author:	 "bitbegin & Xie Qingtian"
	File:	 %btc-ui.red
	Tabs:	 4
	Rights:  "Copyright (C) 2018 Red Foundation. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

context [

	unit-name: "BTC"

	input-amount: none
	input-fee: none
	input-addr: none

	;- layout item defined as local
	network-to: none
	addr-from: none
	addr-to: none
	amount-field: none
	tx-fee: none
	tx-rate: none
	rate-unit: none
	btn-sign: none
	info-from: none
	info-to: none
	info-amount: none
	info-network: none
	info-fee: none
	info-rate: none
	info-fee: none

	tx-rates: none
	accout-info: []			;-- current selected accout information
	spent-txs: none

	update-utxs: function [][
		origin: accout-info/origin
		forall origin [
			if origin/1/utxs [continue]
			if origin/1/tx-count = 0 [continue]
			if zero256? origin/1/balance [continue]
			unless empty? utxs: btc/get-unspent network origin/1/addr [
				repend origin/1 ['utxs utxs]
				forall utxs [
					info: btc/get-tx-info network utxs/1/tx-hash
					outputs: info/outputs
					index: 0
					forall outputs [
						if outputs/1/address = origin/1/addr [
							break
						]
						index: index + 1
					]
					repend info ['index index]
					repend utxs/1 ['info info]
				]
			]
		]
		change: accout-info/change
		forall change [
			if change/1/utxs [continue]
			if change/1/tx-count = 0 [continue]
			if zero256? change/1/balance [continue]
			unless empty? utxs: btc/get-unspent network change/1/addr [
				repend change/1 ['utxs utxs]
				forall utxs [
					info: btc/get-tx-info network utxs/1/tx-hash
					outputs: info/outputs
					index: 0
					forall outputs [
						if outputs/1/address = change/1/addr [
							break
						]
						index: index + 1
					]
					repend info ['index index]
					repend utxs/1 ['info info]
				]
			]
		]
	]

	update-spent: function [][
		origin: accout-info/origin
		forall origin [
			if utxs: origin/1/utxs [
				forall utxs [
					inputs: spent-txs/inputs
					forall inputs [
						if inputs/1/tx-hash = utxs/1/tx-hash [
							either find utxs/1 'spent [
								utxs/1/spent: yes
							][
								repend utxs/1 ['spent yes]
							]
						]
					]
				]
			]
		]
		change: accout-info/change
		forall change [
			if utxs: change/1/utxs [
				forall utxs [
					inputs: spent-txs/inputs
					forall inputs [
						if inputs/1/tx-hash = utxs/1/tx-hash [
							either find utxs/1 'spent [
								utxs/1/spent: yes
							][
								repend utxs/1 ['spent yes]
							]
						]
					]
				]
			]
		]
	]

	do-send: func [face [object!] event [event!] /local item rate][
		if addr-list/data [
			if addr-list/selected = -1 [addr-list/selected: 1]
			network-to/text: net-name
			item: pick addr-list/data addr-list/selected
			addr-from/text: copy/part item find item space
			reset-sign-button

			accout-info: select keys/btc-accounts address-index
			prepare-tx-dlg/rate: 0:0:1
			label-unit/text: unit-name
			fee-unit/text: unit-name
			clear addr-to/text
			clear amount-field/text

			center-face/with prepare-tx-dlg wallet/ui
			view/flags prepare-tx-dlg 'modal
		]
	]

	check-data: does [
		input-addr: trim any [addr-to/text ""]
		unless btc-addr/decode58-check input-addr [
			addr-to/text: copy "Invalid address"
			return no
		]

		if error? input-amount: try [string-to-i256 trim/all copy amount-field/text 8][
			amount-field/text: copy "Invalid amount"
			return no
		]

		if error? input-fee: try [string-to-i256 trim/all copy tx-fee/text 8][
			tx-fee/text: copy "Invalid fee"
			return no
		]

		if not lesser-or-equal256? (add256 input-amount input-fee) accout-info/balance [
			amount-field/text: copy "Insufficient Balance"
			return no
		]
		yes
	]

	calc-balance: func [
		account				[block!]
		amount				[vector!]
		fee					[vector!]
		addr-to				[string!]
		/local utx
	][
		utx: calc-balance-by-largest account amount fee addr-to
		if utx = none [
			utx: calc-balance-by-order account amount fee addr-to
		]
		utx
	]

	calc-balance-by-largest: function [
		account				[block!]
		amount				[vector!]
		fee					[vector!]
		addr-to				[string!]
		return:				[none! block!]
	][
		change-addr-path: select last account/change 'path
		change-addr: select last account/change 'addr
		ret: copy []
		inputs: copy []
		outputs: copy []
		total: add256 amount fee

		foreach item account/change [
			if item/tx-count = 0 [continue]
			if zero256? item/balance [continue]
			if item/utxs = none [continue]

			foreach utx item/utxs [
				if utx/confirmations < 3 [continue]
				if utx/spent [continue]
				if lesser-or-equal256? total utx/value [
					append/only inputs reduce ['addr item/addr 'pubkey item/pubkey 'tx-hash utx/tx-hash 'path item/path 'info utx/info]
					append/only outputs reduce ['addr addr-to 'value amount]
					rest: sub256 utx/value total
					if #{} <> trim/head i256-to-bin rest [
						len: 1 + length? outputs
						either len = change-index: random len [
							repend/only outputs ['addr change-addr 'path change-addr-path 'value rest]
						][
							outputs-at: at outputs change-index
							insert/only outputs-at reduce ['addr change-addr 'path change-addr-path 'value rest]
						]
						append ret reduce ['change-index change-index]
					]
					append ret reduce ['inputs inputs]
					append ret reduce ['outputs outputs]
					return ret
				]
			]
		]

		foreach item account/origin [
			if item/tx-count = 0 [continue]
			if zero256? item/balance [continue]
			if item/utxs = none [continue]

			foreach utx item/utxs [
				if utx/confirmations < 3 [continue]
				if utx/spent [continue]
				if lesser-or-equal256? total utx/value [
					append/only inputs reduce ['addr item/addr 'pubkey item/pubkey 'tx-hash utx/tx-hash 'path item/path 'info utx/info]
					append/only outputs reduce ['addr addr-to 'value amount]
					rest: sub256 utx/value total
					if #{} <> trim/head i256-to-bin rest [
						len: 1 + length? outputs
						either len = change-index: random len [
							repend/only outputs ['addr change-addr 'path change-addr-path 'value rest]
						][
							outputs-at: at outputs change-index
							insert/only outputs-at reduce ['addr change-addr 'path change-addr-path 'value rest]
						]
						append ret reduce ['change-index change-index]
					]
					append ret reduce ['inputs inputs]
					append ret reduce ['outputs outputs]
					return ret
				]
			]
		]
		none
	]

	calc-balance-by-order: function [
		account				[block!]
		amount				[vector!]
		fee					[vector!]
		addr-to				[string!]
		return:				[none! block!]
	][
		change-addr-path: select last account/change 'path
		change-addr: select last account/change 'addr
		ret: copy []
		inputs: copy []
		outputs: copy []
		total: add256 amount fee
		sum: to-i256 0

		foreach item account/change [
			if item/tx-count = 0 [continue]
			if zero256? item/balance [continue]
			if item/utxs = none [continue]

			foreach utx item/utxs [
				if utx/confirmations < 3 [continue]
				if utx/spent [continue]
				append/only inputs reduce ['addr item/addr 'pubkey item/pubkey 'tx-hash utx/tx-hash 'path item/path 'info utx/info]
				sum: add256 sum utx/value
				if lesser-or-equal256? total sum [
					append/only outputs reduce ['addr addr-to 'value amount]
					rest: sub256 sum total
					if #{} <> trim/head i256-to-bin rest [
						len: 1 + length? outputs
						either len = change-index: random len [
							repend/only outputs ['addr change-addr 'path change-addr-path 'value rest]
						][
							outputs-at: at outputs change-index
							insert/only outputs-at reduce ['addr change-addr 'path change-addr-path 'value rest]
						]
						append ret reduce ['change-index change-index]
					]
					append ret reduce ['inputs inputs]
					append ret reduce ['outputs outputs]
					return ret
				]
			]
		]

		foreach item account/origin [
			if item/tx-count = 0 [continue]
			if zero256? item/balance [continue]
			if item/utxs = none [continue]

			foreach utx item/utxs [
				if utx/confirmations < 3 [continue]
				if utx/spent [continue]
				append/only inputs reduce ['addr item/addr 'pubkey item/pubkey 'tx-hash utx/tx-hash 'path item/path 'info utx/info]
				sum: add256 sum utx/value
				if lesser-or-equal256? total sum [
					append/only outputs reduce ['addr addr-to 'value amount]
					rest: sub256 sum total
					if #{} <> trim/head i256-to-bin rest [
						len: 1 + length? outputs
						either len = change-index: random len [
							repend/only outputs ['addr change-addr 'path change-addr-path 'value rest]
						][
							outputs-at: at outputs change-index
							insert/only outputs-at reduce ['addr change-addr 'path change-addr-path 'value rest]
						]
						append ret reduce ['change-index change-index]
					]
					append ret reduce ['inputs inputs]
					append ret reduce ['outputs outputs]
					return ret
				]
			]
		]
		none
	]

	notify-user: does [
		btn-sign/enabled?: no
		process-events
		btn-sign/offset/x: 132
		btn-sign/size/x: 230
		btn-sign/text: "Confirm the transaction on your key"
		process-events
	]

	do-sign-tx: func [face [object!] event [event!] /local utxs tx-info rate][
		unless check-data [exit]
		notify-user

		utxs: calc-balance accout-info input-amount input-fee input-addr
		unless utxs [
			amount-field/text: copy "unconfirmed balance!"
			reset-sign-button
			exit
		]
		tx-info: clear []
		spent-txs: none
		either error? signed-data: try [keys/get-btc-signed-data utxs tx-info][
			unview
			tx-error/text: rejoin ["Error! Please try again^/^/" form signed-data]
			view/flags tx-error-dlg 'modal
		][
			if binary? signed-data [
				info-from/text:		addr-from/text
				info-to/text:		copy addr-to/text
				info-amount/text:	rejoin [amount-field/text " " unit-name]
				info-network/text:	net-name
				info-fee/text:		rejoin [trim/head tx-fee/text " " unit-name]
				rate: to integer! ((to float! tx-fee/text)  * 1e9 / length? signed-data)
				info-rate/text:		rejoin [form rate / 10.0 " sat/B"]
				unview
				view/flags confirm-sheet 'modal
				spent-txs: utxs
			]
		]

		reset-sign-button
	]

	do-confirm: func [face [object!] event [event!] /local datas result][
		datas: lowercase enbase/base signed-data 16
		either error? result: try [btc/publish-tx network datas][
			unview
			tx-error/text: rejoin ["Error! Please try again^/^/" form result]
			view/flags tx-error-dlg 'modal
		][
			unview
			update-spent
			browse rejoin [explorer result]
		]
	]

	do-select-rate: func [face [object!] event [event!] /local tm][
		tm: ["(about 10 mins)" "(about 30 mins)" "(about 1 hour)"]
		rate-unit/text: pick tm face/selected
		unless error? amount: try [string-to-i256 trim/all copy tx-fee/text 8][
			fee: string-to-i256 "0.00001" 8
			unless utxs: calc-balance accout-info amount fee "none" [
				set-fee 230
				exit
			]
			set-fee keys/get-signed-len utxs
		]
	]

	reset-sign-button: does [
		btn-sign/enabled?: yes
		btn-sign/offset/x: 215
		btn-sign/size/x: 60
		btn-sign/text: "Sign"
	]

	set-fee: function [len [integer!]][
		idx: tx-rate/selected
		rate: pick tx-rates idx
		if idx = 2 [rate: rate - 1]		;-- make it a bit smaller than highest fee
		ifee: mul256 to-i256 len to-i256 rate
		tx-fee/text: trim/head form-i256 ifee 8 8
	]

	do-amount-chage: function [face [object!] event [event!]][
		if error? amount: try [string-to-i256 trim/all copy face/text 8][
			set-fee 230
			exit
		]
		fee: string-to-i256 "0.00001" 8
		unless utxs: calc-balance accout-info amount fee "none" [
			set-fee 230
			exit
		]
		set-fee keys/get-signed-len utxs
	]

	send-dialog: layout [
		title "Send Bitcoin"
		style label: text  100 middle
		style lbl:   text  360 middle font [name: font-fixed size: 10]
		style field: field 360 font [name: font-fixed size: 10]
		label "Network:"		network-to:	  lbl return
		label "From Address:"	addr-from:	  lbl return
		label "To Address:"		addr-to:	  field return
		label "Amount to Send:" amount-field: field 120 on-change :do-amount-chage label-unit: label 50 return
		label "FeeRate:"		tx-rate: drop-list 
			data ["fast" "average" "slow"] 120 select 1 :do-select-rate
			rate-unit: label "(About 10 mins)" 160 return
		label "Fee:"			tx-fee:		  field 120 "0" fee-unit: label 50 return
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
		label "Fee:" 			info-fee:	  info return
		label "FeeRate:"		info-rate:	  info return
		pad 164x10 button "Cancel" [signed-data: none unview] button "Send" :do-confirm
	]

	prepare-tx-dlg: layout/flags [
		text font-size 12 {Preparing the transaction, Please wait a moment.}
	] 'no-title

	setup-actors: does [
		prepare-tx-dlg/rate: 0:0:1
		prepare-tx-dlg/actors: make object! [
			on-time: func [face event /local res][
				face/rate: none
				try [update-utxs]
				tx-rates: btc/get-rate 'all
				unview
				view/flags send-dialog 'modal
			]
			on-close: func [face event][
				face/rate: 0:0:1
			]
		]
	]
]