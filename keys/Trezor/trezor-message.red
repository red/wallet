Red [
	Title:	"messages for Trezor"
	Author: "bitbegin"
	File: 	%trezor-message.red
	Tabs: 	4
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

trezor-message: context [
	messages-default: #include %messages.red
	messages-v6: #include %messages-v6.red
	messages: messages-default

	system/catalog/errors/user: make system/catalog/errors/user [trezor-message: ["trezor-message [" :arg1 ": (" :arg2 " " :arg3 ")]"]]

	new-error: func [name [word!] arg2 arg3][
		cause-error 'user 'trezor-message [name arg2 arg3]
	]

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
		new-error 'get-id "not found" msg
	]

	get-type-name: func [
		id					[integer!]
		return:				[word!]
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
		new-error 'get-type-name "not found" id
	]

	get-sub: func [
		msg					[word!]
		sub					[word!]
		return:				[block!]
		/local
			type-blk		[block!]
			msg-blk			[block!]
			msg-type
	][
		foreach type-blk messages [
			if all [type-blk/1 = 'message type-blk/2 = msg] [
				foreach msg-blk type-blk/3 [
					if sub = msg-blk/4 [
						return msg-blk
					]
				]
			]
		]
		new-error 'get-sub "not found" sub
	]
]
