Red [
	Title:	"Driver for Ledger Nano S"
	Author: "Xie Qingtian"
	File: 	%ledger.red
	Tabs: 	4
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

#include %hidapi.red

ledger: context [

	DEFAULT_CHANNEL:	0101h
	TAG_APDU:			05h
	PACKET_SIZE:		64
	MAX_APDU_SIZE:		260

	dongle: none
	buffer: make binary! MAX_APDU_SIZE

	connect: func [return: [handle!]][
		dongle: hid/open 2C97h 1	;-- vendor ID (2C97h) and product ID (01h) for the Nano S
		probe form dongle
	]

	get-address: func [
		idx		[integer!]
	][
		
	]

	read: func [][
		
	]

	write: func [][
		
	]

	exchange: func [
		data	[string! binary!]
		return: [binary!]
	][
		
	]

	close: does [hid/close dongle]
]

ledger/connect

probe ledger/get-address 1

ledger/close
