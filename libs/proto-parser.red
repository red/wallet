Red [
	Title:	"proto file(syntax = proto2, no packed feature) parser"
	Author: "bitbegin"
	File: 	%proto-parser.red
	Tabs: 	4
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

proto-parser: context [
	syntax-version: {syntax = "proto2";}

	msg-ctx: none
	buffer: make string! 10000

	space: charset " ^-^/"

	parse-file: func [
		file				[file!]
		blk					[block!]
		return:				[logic!]
	][
		content-raw: read file
		content: remove-comment content-raw
		syntax: find content "syntax"
		syntax2: copy/part syntax length? syntax-version
		if syntax2 <> syntax-version [exit]

		items: copy []

		enum-rule: [
			copy type to [any space "{"] [any space "{"] (clear items)
			any [
				[any space "}" break] |
				[any space 
					copy name to [any space "="] [any space "="] any space 
					copy number to [[any space "[" to ";"] | [any space ";"]] thru ";"
					(append/only items reduce [to integer! number to word! name])
				]
			]
			(append/only blk reduce ['enum to word! type copy items])
		]

		message-rule: [
			copy type to [any space "{"] [any space "{"] (clear items)
			any [
				[any space "}" break] |
				[any space "reserved" some space thru ";"] |
				[any space 
					copy tags to [any space "="] [any space "="] any space 
					copy number to [[any space "[" to ";"] | [any space ";"]] thru ";"
					(
						tag: split tags space
						if 2 = length? tag [insert tag "optional"]
						append/only items reduce [to integer! number to word! tag/1 to word! tag/2 to word! tag/3]
					)
				]
			]
			(append/only blk reduce ['message to word! type copy items])
		]

		rules: [
			[[some space "message" some space message-rule] | [some space "enum" some space enum-rule]] |
			[thru some space skip to some space] |
			thru end
		]

		parse content [any rules]
	]

	parse-files: func [
		files				[block!]
		blk					[block!]
		return:				[logic!]
	][
		foreach file files [
			if file! = type? file [
				if false = parse-file file blk [return false]
			]
		]
		true
	]

	remove-comment: func [
		str					[string!]
		return:				[string!]
	][
		clear buffer

		comments: [
			[copy text to "/" "/"
				[
					["*" to "*/" "*/"] | [ "/" to lf]
				] (append buffer text)
			] |
			[copy chr thru "/" (append buffer chr)] |
			[copy chr to end end (append buffer chr)]
		]

		parse str [any comments]
		buffer
	]

	get-msg-type: func [
		msgs				[block!]
		msg					[word!]
		return:				[word!]
		/local
			type-blk			[block!]
	][
		foreach type-blk msgs [
			if type-blk/2 = msg [return type-blk/1]
		]
		'NotFound
	]

	get-msg: func [
		msgs				[block!]
		msg					[word!]
		return:				[block!]
		/local
			type-blk			[block!]
	][
		foreach type-blk msgs [
			if type-blk/2 = msg [return type-blk]
		]
		[]
	]
]

