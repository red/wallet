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

	accout-info: []			;-- current selected accout information
	utxs: none

	do-send: func [face [object!] event [event!] /local item rate][
		if addr-list/data [
			if addr-list/selected = -1 [addr-list/selected: 1]
			network-to/text: net-name
			item: pick addr-list/data addr-list/selected
			addr-from/text: copy/part item find item space
			reset-sign-button

			accout-info: select keys/btc-accounts address-index
			tx-rate/text: "20"
			if rate: btc/get-rate 'fast [
				tx-rate/text: to string! rate
			]
			label-unit/text: unit-name
			fee-unit/text: unit-name
			clear addr-to/text
			clear amount-field/text
			view/flags send-dialog 'modal
		]
	]

	check-data: does [
		input-addr: trim any [addr-to/text ""]
		unless all [
			26 <= length? input-addr
			36 >= length? input-addr
		][
			addr-to/text: copy "Invalid address"
			return no
		]

		input-amount: string-to-i256 amount-field/text 8
		input-fee: string-to-i256 tx-fee/text 8

		if string? input-amount [
			amount-field/text: copy "Invalid amount"
			return no
		]

		if string? input-fee [
			tx-fee/text: copy "Invalid fee"
			return no
		]

		if not lesser-or-equal256? (add256 input-amount input-fee) accout-info/balance [
			amount-field/text: copy "Insufficient Balance"
			return no
		]
probe "end check-data"
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

	calc-balance-by-largest: func [
		account				[block!]
		amount				[vector!]
		fee					[vector!]
		addr-to				[string!]
		return:				[none! block!]
		/local change-addr-path change-addr ret inputs outputs total item utx info rest
	][
		probe "calc-balance-by-largest"
		change-addr-path: select last account/change 'path
		change-addr: select last account/change 'addr
		ret: copy []
		inputs: copy []
		outputs: copy []
		total: add256 amount fee

		foreach item account/change [
			if item/balance = none [break]
			if item/utxs = none [continue]

			foreach utx item/utxs [
				if lesser-or-equal256? total utx/value [
					info: btc/get-tx-info network utx/tx-hash
					append/only inputs reduce ['addr item/addr 'pubkey item/pubkey 'tx-hash utx/tx-hash 'path item/path 'info info]
					append/only outputs reduce ['addr addr-to 'value amount]
					rest: sub256 utx/value total
					if #{} <> trim/head i256-to-bin rest [
						append/only outputs reduce ['addr change-addr 'path change-addr-path 'value rest]
					]
					append ret reduce ['inputs inputs]
					append ret reduce ['outputs outputs]
					return ret
				]
			]
		]

		foreach item account/origin [
			if item/balance = none [break]
			if item/utxs = none [continue]

			foreach utx item/utxs [
				if lesser-or-equal256? total utx/value [
					info: btc/get-tx-info network utx/tx-hash
					append/only inputs reduce ['addr item/addr 'pubkey item/pubkey 'tx-hash utx/tx-hash 'path item/path 'info info]
					append/only outputs reduce ['addr addr-to 'value amount]
					rest: sub256 utx/value total
					if #{} <> trim/head i256-to-bin rest [
						append/only outputs reduce ['addr change-addr 'path change-addr-path 'value rest]
					]
					append ret reduce ['inputs inputs]
					append ret reduce ['outputs outputs]
					return ret
				]
			]
		]
		none
	]

	calc-balance-by-order: func [
		account				[block!]
		amount				[vector!]
		fee					[vector!]
		addr-to				[string!]
		return:				[none! block!]
		/local change-addr-path change-addr ret inputs outputs total sum item utx info rest
	][
		change-addr-path: select last account/change 'path
		change-addr: select last account/change 'addr
		ret: copy []
		inputs: copy []
		outputs: copy []
		total: add256 amount fee
		sum: to-i256 0

		foreach item account/change [
			if item/balance = none [break]
			if item/utxs = none [continue]

			foreach utx item/utxs [
				info: btc/get-tx-info network utx/tx-hash
				append/only inputs reduce ['addr item/addr 'pubkey item/pubkey 'tx-hash utx/tx-hash 'path item/path 'info info]
				sum: add256 sum utx/value
				if lesser-or-equal256? total sum [
					append/only outputs reduce ['addr addr-to 'value amount]
					rest: sub256 sum total
					if #{} <> trim/head i256-to-bin rest [
						append/only outputs reduce ['addr change-addr 'path change-addr-path 'value rest]
					]
					append ret reduce ['inputs inputs]
					append ret reduce ['outputs outputs]
					return ret
				]
			]
		]

		foreach item account/origin [
			if item/balance = none [break]
			if item/utxs = none [continue]

			foreach utx item/utxs [
				info: btc/get-tx-info network utx/tx-hash
				append/only inputs reduce ['addr item/addr 'pubkey item/pubkey 'tx-hash utx/tx-hash 'path item/path 'info info]
				sum: add256 sum utx/value
				if lesser-or-equal256? total sum [
					append/only outputs reduce ['addr addr-to 'value amount]
					rest: sub256 sum total
					if #{} <> trim/head i256-to-bin rest [
						append/only outputs reduce ['addr change-addr 'path change-addr-path 'value rest]
					]
					append ret reduce ['inputs inputs]
					append ret reduce ['outputs outputs]
					return ret
				]
			]
		]
probe "end orfer"
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

	do-sign-tx: func [face [object!] event [event!] /local rate][
		notify-user

probe "get-signed-data"
		signed-data: keys/get-signed-data 0 utxs 0
probe "get-signed-data end"

		either binary? signed-data [
			info-from/text:		addr-from/text
			info-to/text:		copy addr-to/text
			info-amount/text:	rejoin [amount-field/text " " unit-name]
			info-network/text:	net-name
			info-fee/text:		rejoin [tx-fee/text " " unit-name]
			rate: to integer! ((to float! tx-fee/text)  * 1e9 / length? signed-data)
			info-rate/text:		rejoin [form rate / 10.0 " sat/B"]
			unview
			view/flags confirm-sheet 'modal
		][
			if error? signed-data [
				unview
				ui-base/tx-error/text: rejoin ["Error! Please try again^/^/" form signed-data]
				view/flags ui-base/tx-error-dlg 'modal
			]
			reset-sign-button
		]
	]

	do-confirm: func [face [object!] event [event!] /local datas txid result][
		datas: lowercase enbase/base signed-data 16
		if error? txid: try [btc/decode-tx network datas][
			ui-base/tx-error/text: rejoin ["Error! Please try again^/^/" form txid]
			view/flags ui-base/tx-error-dlg 'modal
			exit
		]
		either error? result: try [btc/publish-tx network datas][
			unview
			ui-base/tx-error/text: rejoin ["Error! Please try again^/^/" form result]
			view/flags ui-base/tx-error-dlg 'modal
		][
			unview
			browse rejoin [explorer txid]
		]
	]

	do-amount-check: func [face [object!] event [event!] /local len fee][
		reset-sign-button
		if error? try [load face/text][exit]
		unless check-data [exit]

		utxs: calc-balance accout-info input-amount input-fee input-addr
		if utxs = none [
			amount-field/text: copy "NYI.!"
			exit
		]
		len: keys/get-signed-len 0 utxs 0
		fee: (len * to integer! tx-rate/text) / 1e8
		tx-fee/text: to string! fee
	]

	reset-sign-button: does [
		btn-sign/enabled?: yes
		btn-sign/offset/x: 215
		btn-sign/size/x: 60
		btn-sign/text: "Sign"
	]

	send-dialog: layout [
		title "Send Bitcoin"
		style label: text  100 middle
		style lbl:   text  360 middle font [name: font-fixed size: 10]
		style field: field 360 font [name: font-fixed size: 10]
		label "Network:"		network-to:	  lbl return
		label "From Address:"	addr-from:	  lbl return
		label "To Address:"		addr-to:	  field return
		label "Amount to Send:" amount-field: field on-change :do-amount-check 120 label-unit: label 50 return
		label "FeeRate:"		tx-rate:	  field 120 "20" rate-unit: label "sat/B" 50 return
		label "Fee:"			tx-fee:		  field 120 "0.0001" fee-unit: label 50 return
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
]