Red [
    Title: "Recursive Length Prefix Encoding in Red"
    File: %rlp.red
    Author: "Qingtian Xie"
    Notes: "RLP Encoding based on: https://github.com/ethereum/wiki/wiki/%5BEnglish%5D-RLP"
]

rlp: context [

	encode-length: function [
		len		[integer!]
		offset	[integer!]
		return: [binary!]
	][
		either len < 56 [
			trim/head to-binary len + offset
		][
			len-bin: trim/head to-binary len
			first-byte: trim/head to-binary offset + 55 + length? len-bin
			rejoin [first-byte len-bin]
		]
	]

	encode: function [data [any-type!] return: [binary!]][
		either block? data [
			buffer: make binary! 500
			foreach v data [
				append buffer encode v
			]
			rejoin [encode-length length? buffer 192 buffer]
		][
			buffer: either vector? data [
				trim/head i256-to-bin data
			][
				to binary! data
			]
			if number? data [buffer: trim/head buffer]
			either all [1 = length? buffer buffer/1 < 128][
				buffer
			][
				rejoin [encode-length length? buffer 128 buffer]
			]
		]
	]
]
