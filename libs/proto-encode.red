Red [
	Title:	"protobuf(syntax = proto2, no packed feature) encode/decode"
	Author: "bitbegin"
	File: 	%proto-encode.red
	Tabs: 	4
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

#include %proto-parser.red

proto-encode: context [
	
	msg-ctx: none
	varint-buffer: make binary! 8
	error: make block! 10

	get-wire-type-id: func [
		wire-type		[word!]
		return:			[integer!]
		/local
			ret			[word!]
	][
		switch wire-type [
			int32 int64 uint32 uint64 sint32 sint64 bool [return 0]
			fixed64 sfixed64 double [return 1]
			string bytes packed [return 2]
			fixed32 sfixed32 float [return 5]
		]
		ret: proto-parser/get-msg-type msg-ctx wire-type
		if 'enum = ret [return 0]
		if 'message = ret [return 2]
		append/only error reduce ['get-wire-type-id 'Failure ret]
		return error
	]

	encode-varint: func [
		int				[integer!]
		/local
			rest		[integer!]
			little		[integer!]
	][
		clear varint-buffer

		rest: int
		forever [
			either all [(rest and FFFFFF80h) = 0 rest < 128] [
				append varint-buffer to integer! rest
				exit
			][
				little: rest and 7Fh
				little: little or 80h
				append varint-buffer to integer! little
				rest: rest >>> 7
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
		if all [string! <> v-type binary! <> v-type] [append/only error reduce ['append-series 'NotSeries value] return error]

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
		if integer! <> v-type [append/only error reduce ['append-integer 'NotInteger value] return error]

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
		if logic! <> v-type [append/only error reduce ['append-logic 'NotLogic value] return error]

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
			len			[integer! block!]
			buffer		[binary!]
			v-type
	][
		v-type: type? value
		if map! <> v-type [append/only error reduce ['append-embedded 'NotMap value] return error]

		ret: 0

		append data repeated-buf
		ret: ret + length? repeated-buf

		buffer: make binary! 100
		len: encode true wire-type value buffer
		if block! = type? len [append/only error reduce ['encode-embedded 'encode wire-type] return error]
		if len <> length? buffer [append/only error reduce ['encode-embedded 'LengthNotEqual len len <> length? buffer] return error]

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
		value			[integer! logic! string! binary! map! block! word!]
		data			[binary!]
		return:			[integer! block!]
		/local
			tag			[integer!]
			len			[integer! block!]
			ret			[integer!]
			rep-buf		[binary!]
			sub-ctx		[block!]
			sub-msg		[block!]
			enum-value	[integer!]
			type-id		[integer! block!]
			v-type
			sub
	][
		v-type: type? value
		type-id: get-wire-type-id wire-type
		if block! = type? type-id [append/only error reduce ['encode-type 'Failure type-id] return error]
		tag: field-number << 3 or type-id
		encode-varint tag
		rep-buf: make binary! 8
		append rep-buf varint-buffer

		ret: 0
		switch wire-type [
			string bytes [
				either block! = v-type [
					foreach sub value [
						len: append-series sub rep-buf data
						if block! = type? len [append/only error reduce ['encode-type 'SeriesRepeatedError sub] return error]
						ret: ret + len
					]
				][
					len: append-series value rep-buf data
					if block! = type? len [append/only error reduce ['encode-type 'SeriesError value] return error]
					ret: ret + len
				]
				return ret
			]
			int32 int64 uint32 uint64 enum [
				either block! = v-type [
					foreach sub value [
						len: append-integer sub rep-buf data
						if block! = type? len [append/only error reduce ['encode-type 'IntegerRepeatedError sub] return error]
						ret: ret + len
					]
				][
					len: append-integer value rep-buf data
					if block! = type? len [append/only error reduce ['encode-type 'IntegerError value] return error]
					ret: ret + len
				]
				return ret
			]
			bool [
				either block! = v-type [
					foreach sub value [
						len: append-logic sub rep-buf data
						if block! = type? len [append/only error reduce ['encode-type 'BoolRepeatedError sub] return error]
						ret: ret + len
					]
				][
					len: append-logic value rep-buf data
					if block! = type? len [append/only error reduce ['encode-type 'BoolError value] return error]
					ret: ret + len
				]
				return ret
			]
		]
		sub-ctx: proto-parser/get-msg msg-ctx wire-type
		if sub-ctx = [] [append/only error reduce ['encode-type 'NotDefined wire-type value] return error]
		if all [sub-ctx/1 <> 'message sub-ctx/1 <> 'enum] [append/only error reduce ['encode 'NotKeyWord sub-ctx/1 value] return error]
		if sub-ctx/1 = 'message [
			either block! = v-type [
				foreach sub value [
					len: append-embedded wire-type sub rep-buf data
					if block! = type? len [append/only error reduce ['encode-type 'EmbeddedRepeatedError wire-type sub] return error]
					ret: ret + len
				]
			][
				len: append-embedded wire-type value rep-buf data
				if block! = type? len [append/only error reduce ['encode-type 'EmbeddedError wire-type value] return error]
				ret: ret + len
			]
			return ret
		]
		if sub-ctx/1 = 'enum [
			either block! = v-type [
				foreach sub value [
					enum-value: -1
					foreach sub-msg sub-ctx/3 [
						if sub = sub-msg/2 [enum-value: sub-msg/1 break]
					]
					if enum-value = -1 [append/only error reduce ['encode-type 'EnumRepeatedError 'NotFound sub] return error]
					len: append-integer enum-value rep-buf data
					if block! = type? len [append/only error reduce ['encode-type 'EnumRepeatedError enum-value] return error]
					ret: ret + len
				]
			][
				enum-value: -1
				foreach sub-msg sub-ctx/3 [
					if value = sub-msg/2 [enum-value: sub-msg/1 break]
				]
				if enum-value = -1 [append/only error reduce ['encode-type 'EnumRepeatedError 'NotFound value] return error]
				len: append-integer enum-value rep-buf data
				if block! = type? len [append/only error reduce ['encode-type 'EnumError enum-value] return error]
				ret: ret + len
			]
			return ret
		]
		ret
	]

	encode-each: func [
		msgs			[block!]
		msg				[word!]				;-- structure message's name
		name			[word!]				;-- structure message's field name
		value			[integer! logic! string! binary! map! block! word!]
		data			[binary!]
		return:			[integer! block!]
		/local
			sub			[block!]
			olen		[integer!]
			nlen		[integer!]
			len			[integer! block!]
			ret			[integer!]
			repeated?	[logic!]
			v-type
	][
		ret: 0
		foreach sub msgs [
			if sub/4 = name [
				olen: length? data
				repeated?: sub/2 = 'repeated
				v-type: type? value
				if all [repeated? block! <> v-type][append/only error reduce ['encode-each 'RepeatedError v-type] return error]
				len: encode-type sub/3 sub/1 value data
				if block! = type? len [append/only error ['encode-each 'Failure] return error]
				nlen: length? data
				if len <> (nlen - olen) [append/only error reduce ['encode-each 'LengthNotEqual len nlen - olen] return error]
				ret: ret + len
				return ret
			]
		]

		append/only error reduce ['encode-each 'NotFound name]
		return error
	]

	encode: func [
		ctx				[block! logic!]
		msg				[word!]
		value			[map!]
		data			[binary!]
		return:			[integer! block!]
		/local
			keys		[block!]
			buffer		[binary!]
			key			[word!]
			ret			[integer!]
			len			[integer! block!]
			sub-ctx		[block!]
			sub
	][
		keys: keys-of value
		if 0 = length? keys [return 0]

		if ctx = [] [append/only error reduce ['encode 'CtxError msg] return error]
		if ctx <> true [msg-ctx: ctx clear error]

		ret: 0
		foreach key keys [
			sub: value/:key
			sub-ctx: proto-parser/get-msg msg-ctx msg
			if sub-ctx = [] [append/only error reduce ['encode 'NotDefined msg] return error]
			if sub-ctx/1 <> 'message [append/only error reduce ['encode 'NotMessage msg] return error]
			len: encode-each sub-ctx/3 msg key sub data
			if block! = type? len [append/only error reduce ['encode 'Failure msg] return error]
			ret: ret + len
		]
		ret
	]

	;-- start `decode process`
	get-bits: func [
		value			[integer!]
		start			[integer!]
		len				[integer!]
		return:			[integer!]
		/local
			ret			[integer!]
			mask		[integer!]
	][
		ret: value >> start
		mask: (1 << len) - 1
		ret: ret and mask
		ret
	]

	append-hi-bits: func [
		src				[integer!]
		start			[integer!]
		value			[integer!]
		return:			[integer!]
		/locat
			ret			[integer!]
			mask		[integer!]
			value2		[integer!]
	][
		mask: (1 << start) - 1
		ret: src and mask
		value: value << start
		ret: ret or value
		ret
	]

	decode-varint: func [
		data			[binary!]
		return:			[integer! block!]
		/local
			i			[integer!]
			j			[integer!]
			dlen		[integer!]
			vlen		[integer!]
			temp		[integer!]
			item		[integer!]
			last-item	[integer!]
			msb			[integer!]
			hi			[integer!]
			low			[integer!]
			off			[integer!]
	][
		varint-buffer: head varint-buffer
		clear varint-buffer
		dlen: length? data

		i: 1
		off: 0
		until [
			temp: to integer! data/:i
			msb: temp >> 7
			either msb = 0 [
				hi: get-bits temp off (8 - off)
			][
				hi: get-bits temp off (7 - off)
			]
			low: get-bits temp 0 off
			vlen: length? varint-buffer
			;-- print ["temp: " temp " msb: " msb " off: " off " hi: " hi " low: " low " vlen: " vlen lf]
			if off <> 0 [
				last-item: to integer! varint-buffer/:vlen
				last-item: append-hi-bits last-item (8 - off) low
				varint-buffer/:vlen: last-item
			]
			if any [msb = 0 off <> 7][
				append varint-buffer hi
			]
			if msb = 0 [
				append varint-buffer #{00}
				reverse varint-buffer
				;-- print ["i: " i " varint: " varint-buffer]
				return i
			]
			off: off + 1
			if off = 8 [off: 0]
			i: i + 1
			i > dlen
		]
		append/only error reduce ['decode-varint 'Failure data]
		return error
	]

	decode-type: func [
		wire-type			[word!]
		name				[word!]
		value				[map!]
		data				[binary!]
		return:				[integer!]
		/local
			ret				[integer!]
			len				[integer!]
			varint			[integer!]
			vlen			[integer!]
			nres			[map!]
			sub-ctx			[block!]
			sub-msg			[block!]
			nvalue
			ovalue
		
	][
		ovalue: select value name

		ret: 0
		switch wire-type [
			string bytes [
				vlen: decode-varint data
				if block! = type? vlen [append/only error reduce ['decode-type 'SeriesError] return error]
				len: length? varint-buffer
				if len > 5 [append/only error reduce ['decode-type 'SeriesError varint-buffer] return error]
				varint: to integer! varint-buffer
				;-- we don't support too large string/binary
				if varint < 0 [append/only error reduce ['decode-type 'SeriesError varint] return error]
				nvalue: copy/part skip data vlen varint
				if wire-type = 'string [
					nvalue: to string! nvalue
				]
				either none = ovalue [
					put value name nvalue
				][
					either block! = type? ovalue [
						put value name append ovalue nvalue
					][
						put value name reduce [ovalue nvalue]
					]
				]
				ret: ret + vlen + varint
				return ret
			]
			int64 uint64 [
				vlen: decode-varint data
				if block! = type? vlen [append/only error reduce ['decode-type 'Int64Error] return error]
				len: length? varint-buffer
				if len > 8 [append/only error reduce ['decode-type 'Int64Error varint-buffer] return error]
				either none = ovalue [
					put value name varint-buffer
				][
					either block! = type? ovalue [
						put value name append ovalue varint-buffer
					][
						put value name reduce [ovalue varint-buffer]
					]
				]
				ret: ret + vlen
				return ret
			]
			int32 uint32 enum [
				vlen: decode-varint data
				if block! = type? vlen [append/only error reduce ['decode-type 'Int32Error] return error]
				len: length? varint-buffer
				varint: to integer! back back back back tail varint-buffer
				either none = ovalue [
					put value name varint
				][
					either block! = type? ovalue [
						put value name append ovalue varint
					][
						put value name reduce [ovalue varint]
					]
				]
				ret: ret + vlen
				return ret
			]
			bool [
				vlen: decode-varint data
				if block! = type? vlen [append/only error reduce ['decode-type 'BoolError] return error]
				len: length? varint-buffer
				varint: to integer! back back tail varint-buffer
				either varint-buffer = #{0000} [
					varint: false
				][
					varint: true
				]
				either none = ovalue [
					put value name varint
				][
					either block! = type? ovalue [
						put value name append ovalue varint
					][
						put value name reduce [ovalue varint]
					]
				]
				ret: ret + vlen
				return ret
			]
		]

		sub-ctx: proto-parser/get-msg msg-ctx wire-type
		if sub-ctx = [] [append/only error reduce ['decode-type 'NotDefined wire-type] return error]
		if all [sub-ctx/1 <> 'message sub-ctx/1 <> 'enum] [append/only error reduce ['encode 'NotKeyWord sub-ctx/1] return error]
		if sub-ctx/1 = 'message [
			vlen: decode-varint data
			if block! = type? vlen [append/only error reduce ['decode-type 'EmbeddedError] return error]
			len: length? varint-buffer
			if len > 5 [append/only error reduce ['decode-type 'EmbeddedError 'VarintTooLarge varint-buffer] return error]
			varint: to integer! varint-buffer
			;-- we don't support too large embedded message
			if varint < 0 [append/only error reduce ['decode-type 'EmbeddedError 'VarintNeg varint] return error]
			nvalue: copy/part skip data vlen varint
			nres: make map! []
			len: decode true wire-type nres nvalue
			if len < 0 [append/only error reduce ['decode-type 'EmbeddedError 'CascadeError len] return error]
			if len <> varint [append/only error reduce ['decode-type 'EmbeddedError 'CascadeError len varint] return error]
			either none = ovalue [
				put value name nres
			][
				either block! = type? ovalue [
					put value name append ovalue nres
				][
					put value name reduce [ovalue nres]
				]
			]
			ret: ret + vlen + varint
			return ret
		]

		if sub-ctx/1 = 'enum [
				vlen: decode-varint data
				if block! = type? vlen [append/only error reduce ['decode-type 'EnumError] return error]
				len: length? varint-buffer
				if len > 5 [append/only error reduce ['decode-type 'EnumError 'VarintTooLarge varint-buffer] return error]
				varint: to integer! varint-buffer
				if varint < 0 [append/only error reduce ['decode-type 'EnumError 'VarintNeg varint] return error]
				nvalue: none
				foreach sub-msg sub-ctx/3 [
					if varint = sub-msg/1 [nvalue: sub-msg/2 break]
				]
				if nvalue = none [append/only error reduce ['decode-type 'EnumError 'NotExist varint] return error]
				either none = ovalue [
					put value name nvalue
				][
					either block! = type? ovalue [
						put value name append ovalue nvalue
					][
						put value name reduce [ovalue nvalue]
					]
				]
				ret: ret + vlen
				return ret
		]
		ret
	]

	decode-each: func [
		msgs				[block!]
		msg					[word!]
		varint				[integer!]
		value				[map!]
		data				[binary!]
		return:				[integer!]
		/local
			sub				[block!]
			wire-type-id	[integer!]
			wire-type-id2	[integer!]
			field-number	[integer!]
			ret				[integer!]
			len				[integer! block!]
			pos				[binary!]
	][
		wire-type-id: varint and 7
		field-number: varint >>> 3
		ret: 0
		pos: data
		foreach sub msgs [
			wire-type-id2: get-wire-type-id sub/3
			if all [sub/1 = field-number wire-type-id = wire-type-id2][
				len: decode-type sub/3 sub/4 value pos
				if block! = type? len [append/only error reduce ['decode-each 'Failure pos/1] return error]
				pos: skip data len
				ret: ret + len
			]
		]

		if ret = 0 [append/only error reduce ['decode-each 'Unkown varint] return error]

		ret
	]

	decode: func [
		ctx					[block! logic!]
		msg					[word!]
		value				[map!]
		data				[binary!]
		return:				[integer!]
		/local
			dlen			[integer!]
			vlen			[integer!]
			len				[integer! block!]
			pos				[binary!]
			varint			[integer!]
			ret				[integer!]
			sub-ctx			[block!]
	][
		dlen: length? data
		if dlen = 0 [return 0]

		if ctx = [] [append/only error reduce ['decode 'CtxError msg] return error]
		if ctx <> true [msg-ctx: ctx clear error]

		ret: 0
		pos: data
		until [
			vlen: decode-varint pos
			if block! = type? vlen [append/only error reduce ['decode 'Failure pos/1] return error]
			len: length? varint-buffer
			if len > 5 [append/only error reduce ['decode 'LengthFailure varint-buffer] return error]
			pos: skip pos vlen
			ret: ret + vlen
			varint: to integer! varint-buffer
			;-- print ["head varint: " varint lf]
			;-- we don't support too large field number
			if varint < 0 [append/only error reduce ['decode 'LengthFailure varint] return error]
			sub-ctx: proto-parser/get-msg msg-ctx msg
			if sub-ctx = [] [append/only error reduce ['decode 'NotDefined msg] return error]
			if sub-ctx/1 <> 'message [append/only error reduce ['decode 'NotMessage msg] return error]
			len: decode-each sub-ctx/3 msg varint value pos
			if block! = type? len [append/only error reduce ['decode 'Failure msg] return error]
			pos: skip pos len
			ret: ret + len
			tail? pos
		]
		
		ret
	]

]
