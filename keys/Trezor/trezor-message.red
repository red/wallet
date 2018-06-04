Red [
	Title:	"messages for Trezor"
	Author: "bitbegin"
	File: 	%trezor-message.red
	Tabs: 	4
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]



trezor-message: context [
	messages: #include %messages.red


	get-id: func [
		msg					[word!]
		return:				[integer!]
		/local
			type-blk		[block!]
			msg-blk			[block!]
			msg-type		[word!]

	][
		msg-type: to word! rejoin ["MessageType_" to string! msg]
		foreach type-blk messages [
			if all [type-blk/1 = 'enum type-blk/2 = 'MessageType] [
				foreach msg-blk type-blk/3 [
					if msg-blk/2 = msg-type [
						return msg-blk/1
					]
				]
			]
		]
		-1
	]

	get-type-name: func [
		id					[integer!]
		return:				[word! none!]
		/local
			type-blk		[block!]
			msg-blk			[block!]
			msg-type
	][
		foreach type-blk messages [
			if all [type-blk/1 = 'enum type-blk/2 = 'MessageType] [
				foreach msg-blk type-blk/3 [
					if id = to integer! msg-blk/1 [
						msg-type: split to string! msg-blk/2 "_"
						return to word! msg-type/2
					]
				]
			]
		]
		none
	]
]

