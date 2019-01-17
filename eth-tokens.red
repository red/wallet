Red [
	Title:	"ETH tokens configuration"
	Author: "Xie Qingtian"
	File: 	%eth-tokens.red
	Tabs: 	4
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

eth-tokens: context [

	ERC20-tokens: #include %assets/tokens-list.red
	TOKENS-LIST: make block! 2000
	wallet-contracts: []
	wallet-token-list: []
	token-list-face: none

	do-add-token: func [
		face [object!] event [event!]
		/local contracts-list sym-list idx cur-idx name data
	][
		contracts-list: skip wallet-contracts 4			;-- skip ETH
		sym-list: skip wallet-token-list 2				;-- skip "Add Tokens" and "ETH"

		idx: all-tokens-list/selected - 1
		cur-idx: current-tokens-list/selected
		name: pick all-tokens-list/data idx * 2 + 1		;-- token fullname
		data: pick all-tokens-list/data idx * 2 + 2		;-- [sym address decimals name]
		poke data 2 reduce ["mainnet" data/2]			;-- [sym ["mainnet" address] decimals name]
		either cur-idx > 0 [
			insert skip current-tokens-list/data cur-idx name
			insert skip contracts-list cur-idx * 4 data
			insert skip sym-list cur-idx data/1
		][
			append current-tokens-list/data name
			append contracts-list data
			append sym-list data/1
		]
	]

	do-remove-token: func [
		face [object!] event [event!]
		/local contracts-list sym-list cur-idx
	][
		contracts-list: skip wallet-contracts 4			;-- skip ETH
		sym-list: skip wallet-token-list 2				;-- skip "Add Tokens" and "ETH"

		cur-idx: current-tokens-list/selected
		if cur-idx > 0 [
			remove at current-tokens-list/data cur-idx
			remove/part at contracts-list (cur-idx - 1) * 4 + 1 4
			remove at sym-list cur-idx
		]
	]

	add-tokens-dlg: layout [
		title "Add ERC20 Tokens"
		all-tokens-list: text-list 240x500
		panel [
			below center 
			button "->" :do-add-token
			button "<-" :do-remove-token
		]
		current-tokens-list: text-list 220x500
		return
		text 160.160.160 560x1 return
		pad 420x0
		button "OK" [
			wallet/contracts: wallet-contracts
			token-list-face/data: wallet-token-list
			unview
		]
		button "Cancel" [unview]
		do [
			all-tokens-list/data: TOKENS-LIST
		]
	]

	make-tokens-list: function [][
		foreach [addr sym dec name] ERC20-tokens [
			token: rejoin [name " (" sym #")"]
			info: reduce [sym addr dec token]
			repend TOKENS-LIST [token info]
		]
	]

	do-config: func [token-list [object!] current-tokens [block!]][
		items-count: 0
		token-list-face: token-list
		wallet-token-list: copy token-list/data
		wallet-contracts: copy wallet/contracts
		current-tokens-list/data: current-tokens
		view/flags add-tokens-dlg 'modal
	]

	init: does [
		make-tokens-list
	]
]
