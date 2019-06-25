Red [
	Title:	"btc-addr"
	Author: "bitbegin"
	File: 	%btc-addr.red
	Tabs: 	4
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

#include %ripemd160.red

btc-addr: context [
	prefix: [
		'P2PKH				0
		'P2SH				5
		'PRIV				80h
		'BIP32-PUBKEY		0488B21Eh
		'BIP32-PRIKEY		0488ADE4h
		'TEST-P2PKH			6Fh
		'TEST-P2SH			C4h
		'TEST-PRIV			EFh
		'TEST-BIP32-PUBKEY	043587CFh
		'TEST-BIP32-PRIKEY	04358394h
	]

	encode58-check: func [data [binary!] return: [string!]][
		append data copy/part checksum checksum data 'sha256 'sha256 4
		enbase/base data 58
	]

	decode58-check: function [data [string!]][
		bin: debase/base data 58
		if 4 >= len: length? bin [return none]
		raw: copy/part bin len - 4
		hash: copy/part skip bin len - 4 4
		hash2: copy/part checksum checksum raw 'sha256 'sha256 4
		if hash <> hash2 [return none]
		raw
	]

	hash160: func [pubkey [binary!] return: [binary!]][
		ripemd160 checksum pubkey 'sha256
	]

	pubkey-to-legacy-addr: func [pubkey [binary!] type [word!] return: [string!]
		/local hash
	][
		insert hash: hash160 pubkey select prefix type
		encode58-check hash
	]

	pubkey-to-addr: func [pubkey [binary!] type [word!] return: [string!]][
		case [
			any [type = 'P2PKH type = 'TEST-P2PKH][pubkey-to-legacy-addr pubkey type]
			any [type = 'P2SH type = 'TEST-P2SH][pubkey-to-segwit-addr pubkey type]
			true [none]
		]
	]

	pubkey-to-segwit-addr: func [pubkey [binary!] type [word!] return: [string!]][
		pubkey-to-legacy-addr pubkey-to-script pubkey type
	]

	pubkey-to-script: func [pubkey [binary!] return: [binary!]
		/local hash
	][
		insert hash: hash160 pubkey #{0014}
		hash
	]
]
