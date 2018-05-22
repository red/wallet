Red [
	Title:	"protobuf(syntax = proto2, no packed feature) parser"
	Author: "bitbegin"
	File: 	%protobuf.red
	Tabs: 	4
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

protobuf: context [
	
	varint-buffer: make binary! 8
	msg-ctx: none

	get-wire-type-id: func [
		wire-type		[word!]
		return:			[integer!]
	][
		switch wire-type [
			int32 int64 uint32 uint64 sint32 sint64 bool enum [return 0]
			fixed64 sfixed64 double [return 1]
			string bytes packed embedded [return 2]
			fixed32 sfixed32 float [return 5]
		]
		return 2
	]

	get-wire-type: func [
		wire-type		[word!]
	][
		if any [
			wire-type = 'string 
			wire-type = 'bytes
			wire-type = 'int32
			wire-type = 'int64
			wire-type = 'uint32
			wire-type = 'uint64
			wire-type = 'enum
			wire-type = 'bool
			wire-type = 'sint32
			wire-type = 'sint64
			wire-type = 'fixed32
			wire-type = 'fixed64
			wire-type = 'sfixed32
			wire-type = 'sfixed64
			wire-type = 'double
			wire-type = 'float
		][return wire-type]
		'embedded
	]

	encode-varint: func [
		int				[integer!]
		/local
			rest		[integer!]
			little		[integer!]
	][
		clear varint-buffer

		rest: int
		while [true][
			either rest < 128 [
				append varint-buffer to integer! rest
				exit
			][
				little: rest and 7Fh
				little: little or 80h
				append varint-buffer to integer! little
				rest: rest >> 7
			]
		]
	]

	append-series: func [
		value
		repeated-buf	[binary!]
		data			[binary!]
		return:			[integer!]
		/local
			ret			[integer!]
			len			[integer!]
			v-type
	][
		v-type: type? value
		if all [string! <> v-type binary! <> v-type] [return -1]

		ret: 0

		append data repeated-buf
		ret: ret + length? repeated-buf

		len: length? value
		encode-varint len
		append data varint-buffer
		ret: ret + length? varint-buffer
		append data value
		ret: ret + length? value
		ret
	]

	append-integer: func [
		value
		repeated-buf	[binary!]
		data			[binary!]
		return:			[integer!]
		/local
			ret			[integer!]
			len			[integer!]
			v-type
	][
		v-type: type? value
		if integer! <> v-type [return -1]

		ret: 0

		append data repeated-buf
		ret: ret + length? repeated-buf

		encode-varint value
		append data varint-buffer
		ret: ret + length? varint-buffer
		ret
	]

	append-logic: func [
		value
		repeated-buf	[binary!]
		data			[binary!]
		return:			[integer!]
		/local
			ret			[integer!]
			len			[integer!]
			v-type
	][
		v-type: type? value
		if logic! <> v-type [return -1]

		ret: 0

		append data repeated-buf
		ret: ret + length? repeated-buf

		either value = true [append data #{01}][append data #{00}]
		ret: ret + 1
		ret
	]

	append-embedded: func [
		wire-type		[word!]
		value
		repeated-buf	[binary!]
		data			[binary!]
		return:			[integer!]
		/local
			ret			[integer!]
			len			[integer!]
			buffer		[binary!]
			v-type
	][
		v-type: type? value
		if map! <> v-type [return -1]

		ret: 0

		append data repeated-buf
		ret: ret + length? repeated-buf

		buffer: make binary! 100
		len: encode wire-type value buffer
		if len < 0 [return len]
		if len <> length? buffer [return -1]

		encode-varint len
		append data varint-buffer
		ret: ret + length? varint-buffer
		append data buffer
		ret: ret + length? buffer
		ret
	]

	encode-type: func [
		wire-type		[word!]
		field-number	[integer!]
		value			[integer! logic! string! binary! map! block!]
		data			[binary!]
		return:			[integer!]
		/local
			tag			[integer!]
			len			[integer!]
			ret			[integer!]
			wire-type2	[word!]
			rep-buf		[binary!]
			v-type
			sub
	][
		v-type: type? value
		wire-type2: get-wire-type wire-type
		tag: field-number << 3 or get-wire-type-id wire-type2
		encode-varint tag
		rep-buf: make binary! 8
		append rep-buf varint-buffer

		ret: 0
		switch wire-type2 [
			string bytes [
				either block! = v-type [
					foreach sub value [
						len: append-series sub rep-buf data
						if len < 0 [return len]
						ret: ret + len
					]
				][
					len: append-series value rep-buf data
					if len < 0 [return len]
					ret: ret + len
				]
				return ret
			]
			int32 int64 uint32 uint64 enum [
				either block! = v-type [
					foreach sub value [
						len: append-integer sub rep-buf data
						if len < 0 [return len]
						ret: ret + len
					]
				][
					len: append-integer value rep-buf data
					if len < 0 [return len]
					ret: ret + len
				]
				return ret
			]
			bool [
				either block! = v-type [
					foreach sub value [
						len: append-logic sub rep-buf data
						if len < 0 [return len]
						ret: ret + len
					]
				][
					len: append-logic value rep-buf data
					if len < 0 [return len]
					ret: ret + len
				]
				return ret
			]
			embedded [
				either block! = v-type [
					foreach sub value [
						len: append-embedded wire-type sub rep-buf data
						if len < 0 [return len]
						ret: ret + len
					]
				][
					len: append-embedded wire-type value rep-buf data
					if len < 0 [return len]
					ret: ret + len
				]
				return ret
			]
			default [return 0]
		]
	]

	encode-each: func [
		msg				[word!]				;-- structure message's name
		name			[word!]				;-- structure message's field name
		value			[integer! logic! string! binary! map! block!]
		data			[binary!]
		return:			[integer!]
		/local
			blk			[block!]
			sub			[block!]
			olen		[integer!]
			nlen		[integer!]
			len			[integer!]
			ret			[integer!]
			repeated?	[logic!]
	][
		either msg-ctx = none [blk: get msg][blk: get in msg-ctx msg]
		if block! <> type? blk [return -1]
		if 0 = length? blk [return 0]
		ret: 0
		foreach sub blk [
			if sub/3 = name [
				olen: length? data
				repeated?: sub/4 = 'repeated
				if all [repeated? block! <> type? value][return -1]
				len: encode-type sub/2 sub/1 value data
				nlen: length? data
				if len <> (nlen - olen) [return -1]
				ret: ret + len
				return ret
			]
		]
		ret
	]

	encode: func [
		msg				[word!]
		value			[map!]
		data			[binary!]
		/local
			keys		[block!]
			buffer		[binary!]
			key			[word!]
			ret			[integer!]
			len			[integer!]
			sub
	][
		keys: keys-of value
		if 0 = length? keys [return 0]

		ret: 0
		foreach key keys [
			sub: value/:key
			len: encode-each msg key sub data
			if len < 0 [return -1]
			ret: ret + len
		]
		ret
	]

	decode: func [
		msg				[word!]
		value			[map!]
		data			[binary!]
	][

	]

	init-ctx: func [ctx [word! none!]][
		either ctx = none [msg-ctx: none][msg-ctx: get ctx]
	]
]
