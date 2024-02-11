Red [
	Title:	 "Red Wallet Settings"
	Author:	 "Xie Qingtian"
	File:	 %settings.red
	Tabs:	 4
	Rights:  "Copyright (C) 2018 Red Foundation. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

cfg-path: none

apply-cfg: function [][
	append token-list/data extract cfg/tokens 4
	wallet/contracts: cfg/tokens
	keys/ledger-path: cfg/Ledger-Path
	if cfg/win-pos [ui/offset: cfg/win-pos]
]

save-cfg: function [][
	offset: ui/offset					;-- offset could be negative in some cases
	if offset/x < 0 [offset/x: 0]
	if offset/y < 0 [offset/y: 0]
	cfg/win-pos:  offset
	cfg/tokens: wallet/contracts
	cfg/Ledger-Path: keys/ledger-path

	save/header cfg-path cfg [Purpose: "RED Wallet Configuration File"]
]

load-cfg: func [/local cfg-dir cfg-content default-cfg][
	cfg-dir: append copy system/options/cache
			#either config/OS = 'Windows [%REDWallet/][%.REDWallet/]

	unless exists? cfg-dir [make-dir/deep cfg-dir]
	cfg-path: append cfg-dir %REDWallet-cfg.red

	default-cfg: [
		version: 0.4.0

		;-- Token name | NetWorks | Decimal places | Fullname
		tokens: [
			"BTC" [
				"MainNet" #(none)
				"TestNet" #(none)
			] 8 "Bitcoin"
			"BTC (Legacy)" [
				"MainNet" #(none)
				"TestNet" #(none)
			] 8 "Bitcoin"
			"ETH" [
				"mainnet" #(none)
				"Rinkeby" #(none)
				"Kovan"	  #(none)
				"Ropsten" #(none)
			] 18 "Ethereum"
			"RED" [
				"mainnet" "76960Dccd5a1fe799F7c29bE9F19ceB4627aEb2f"
				"Rinkeby" "43df37f66b8b9fececcc3031c9c1d2511db17c42"
			] 18 "RED (Red Community Token)"
		]

		Ledger-Path: [8000002Ch 8000003Ch 80000000h idx]
		win-pos:	 #(none)
	]

	cfg: either all [
		exists? cfg-path
		attempt [select cfg-content: load cfg-path 'Red]
	][
		skip cfg-content 2
	][
		default-cfg
	]
	unless cfg/version [cfg: default-cfg]

	apply-cfg
]