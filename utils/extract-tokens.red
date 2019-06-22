Red [
    Title: "Extract ETH Tokens from Ledger's tokens list"
    File: %extract-tokens.red
    Author: "Xie Qingtian"
    Notes: {
        Ethereum lists: https://github.com/ethereum-lists/tokens
        Ledger Tokens Info: https://raw.githubusercontent.com/LedgerHQ/ledgerjs/master/packages/hw-app-eth/data/erc20.js
        Ledger Tokens list: https://raw.githubusercontent.com/LedgerHQ/ledger-app-eth/master/src/tokens.c
    }
]

utils: context [
	;
	; red>> utils/extract-tokens %eth-tokens.red %tokens-master/tokens/eth/
	;

	to-int32: func [b [binary!]][
		to-integer copy/part b 4
	]

	extract-tokens: function [
		"extract tokens to a file"
		saved-path		[file!]		;-- a file path to save the extract tokens info
		ethereum-lists	[file!]		;-- a folder contains all the ETH tokens info
	][
		;-- extract tokens info data from LedgerHQ
		data: read https://raw.githubusercontent.com/LedgerHQ/ledgerjs/master/packages/hw-app-eth/data/erc20.js
		data: find/tail data #"^""
		data: debase copy/part data find/last data #"^""

		;-- extract token fullname from https://github.com/ethereum-lists/tokens
		eth-lists: read ethereum-lists

		blk: make block! 5000
		until [
			length: to-int32 data
			data: skip data 4
			end: skip data length

			item: copy/part data end

			ticker-len: item/1
			item: next item

			ticker: to-string copy/part item ticker-len
			item: skip item ticker-len

			contract: enbase/base copy/part item 20 16
			item: skip item 20

			decimals: to-int32 item
			data: end

			append blk head contract				;-- token contract address
			append blk ticker						;-- token symbol name
			append blk decimals						;-- token decimals

			;-- extract token fullname
			file: to-file rejoin ["0x" head contract ".json"]
			either find eth-lists file [
				token: load-json read rejoin [ethereum-lists file]
				append blk token/name				;-- token fullname
			][
				append blk ticker
			]

			append blk head item
			new-line skip tail blk -5 yes

			empty? data
		]

		save saved-path blk
	]

	extract-tokens-old: function [
		"extract tokens to a file"
		saved-path		[file!]		;-- a file path to save the extract tokens info
		ethereum-lists	[file!]		;-- a folder contains all the ETH tokens info
	][
		;-- extract tokens list from Ledger
		tokens: read https://raw.githubusercontent.com/LedgerHQ/ledger-app-eth/master/src/tokens.c
		if none? eth-tokens: find tokens "TOKENS_ETHEREUM" [
			probe "Cannot find ETH tokens list"
			exit
		]

		;-- extract token fullname from https://github.com/ethereum-lists/tokens
		eth-lists: read ethereum-lists

		blk: make block! 5000
		begin: find/tail eth-tokens #"{"
		end: find eth-tokens "};"
		tokens: split copy/part begin end "^/^-"
		foreach token tokens [
			if empty? token [continue]

			data: split token ", "
			foreach d data [trim/all d]

			addr: trim/with data/1 "{,}"
			loop 40 [
				change addr skip addr 2
				addr: skip addr 2
			]
			clear skip addr -40
			append blk head addr							;-- token address
			append blk trim/with data/2	#"^""				;-- token symbol name
			append blk to-integer trim/with data/3 "^/},"	;-- token decimals

			;-- extract token fullname
			file: to-file rejoin ["0x" head addr ".json"]
			if find eth-lists file [
				data: load-json read rejoin [ethereum-lists file]
				append blk data/name						;-- token fullname
			]

			new-line skip tail blk -4 yes
		]

		save saved-path blk
	]
]

utils/extract-tokens %eth-tokens.red %tokens-master/tokens/eth/
;utils/get-erc20-info %erc20.data.js
