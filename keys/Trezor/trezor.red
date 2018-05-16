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

	dongle: none

	get-devs: func [
		return:		[block!]
	][
		hid/get-devs vendor-id product-id
	]

	connect: func [serial-num [string!]][
		unless dongle [
			dongle: hid/open serial-num
		]
		dongle
	]


	close: does [hid/close dongle dongle: none]
]

