Red [
	Title:	"Driver for Trezor"
	Author: "bitbegin"
	File: 	%trezor.red
	Tabs: 	4
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

trezor: context [
	name: "Trezor"

	vendor-id:			534Ch
	product-id:			1
	id: product-id << 16 or vendor-id

	dongle: none

	connect: func [serial-num [string! none!]][
		unless dongle [
			dongle: hid/open id serial-num
		]
		dongle
	]


	close: does [
		if dongle <> none [
			hid/close dongle 
			dongle: none
		]
	]
]

