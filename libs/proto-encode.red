Red [
	Title:	"protobuf(syntax = proto2, no packed feature) encode/decode"
	Author: "bitbegin"
	File: 	%proto-encode.red
	Tabs: 	4
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

#include %proto-parser.red

proto-encode: context [

	system/catalog/errors/user: make system/catalog/errors/user [proto-encode: ["proto-encode [" :arg1 ": (" :arg2 " " :arg3 ")]"]]

	new-error: func [name [word!] arg2 arg3][
		cause-error 'user 'proto-encode [name arg2 arg3]
	]

	msg-ctx: none
	varint-buffer: make binary! 16

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
		new-error 'get-wire-type-id "not support" ret
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

	encode-varint64: func [
		bin				[binary!]
		/local
			rest		[integer!]
			little		[integer!]
			binl		[binary!]
			binh		[binary!]
			intl		[integer!]
			inth		[integer!]
			rest2		[integer!]
			rest3		[integer!]
			i			[integeR!]
			last?		[logic!]
	][
		clear varint-buffer

		binl: back back back back tail bin
		binh: copy/part bin binl
		intl: to integer! binl
		inth: to integer! binh
		rest2: (inth << 8) or (intl >>> 28)
		rest3: inth >> 24

		either all [rest2 = 0 rest3 = 0][last?: true][last?: false]

		i: 0
		rest: intl and 0FFFFFFFh
		forever [
			either all [
				last?
				(rest and FFFFFF80h) = 0 rest < 128] [
				append varint-buffer to integer! rest
				exit
			][
				little: rest and 7Fh
				little: little or 80h
				append varint-buffer to integer! little
				rest: rest >>> 7
			]
			i: i + 1
			if i = 4 [
				either all [rest2 = 0 rest3 = 0][
					rest: 0
				][
					rest: rest2
				]
				either rest3 = 0 [last?: true][last?: false]
			]
			if i = 8 [
				either rest3 = 0 [
					rest: 0
				][
					rest: rest3
				]
				last?: true
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
		if all [string! <> v-type binary! <> v-type] [new-error 'append-series "not series" value]

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
		if integer! <> v-type [new-error 'append-integer "not integer" value]

		ret: 0

		append data repeated-buf
		ret: ret + length? repeated-buf

		encode-varint value
		append data varint-buffer
		ret: ret + length? varint-buffer
		ret
	]

	append-int64: func [
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
		if binary! <> v-type [new-error 'append-int64 "not binary" value]

		ret: 0

		append data repeated-buf
		ret: ret + length? repeated-buf

		len: length? value
		either len > 4 [
			encode-varint64 value
		][
			encode-varint to integer! value
		]

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
		if logic! <> v-type [new-error 'append-logic "not logic" value]

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
			len			[integer! error!]
			buffer		[binary!]
			v-type
	][
		v-type: type? value
		if map! <> v-type [new-error 'append-embedded "not map" value]

		ret: 0

		append data repeated-buf
		ret: ret + length? repeated-buf

		buffer: make binary! 100
		len: try [encode true wire-type value buffer]
		if error? len [new-error 'append-embedded len wire-type]
		if len <> length? buffer [new-error 'append-embedded "not equal" reduce [len length? buffer]]

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
		return:			[integer!]
		/local
			tag			[integer!]
			len			[integer!]
			ret			[integer!]
			rep-buf		[binary!]
			sub-ctx		[block!]
			sub-msg		[block!]
			enum-value	[integer!]
			type-id		[integer!]
			v-type
			sub
	][
		v-type: type? value
		type-id: get-wire-type-id wire-type
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
						ret: ret + len
					]
				][
					len: append-series value rep-buf data
					ret: ret + len
				]
				return ret
			]
			int64 uint64 [
				either block! = v-type [
					foreach sub value [
						len: append-int64 sub rep-buf data
						ret: ret + len
					]
				][
					len: append-int64 value rep-buf data
					ret: ret + len
				]
				return ret
			]
			int32 uint32 enum [
				either block! = v-type [
					foreach sub value [
						len: append-integer sub rep-buf data
						ret: ret + len
					]
				][
					len: append-integer value rep-buf data
					ret: ret + len
				]
				return ret
			]
			bool [
				either block! = v-type [
					foreach sub value [
						len: append-logic sub rep-buf data
						ret: ret + len
					]
				][
					len: append-logic value rep-buf data
					ret: ret + len
				]
				return ret
			]
		]
		sub-ctx: proto-parser/get-msg msg-ctx wire-type
		if all [sub-ctx/1 <> 'message sub-ctx/1 <> 'enum] [new-error 'encode-type "not message/enum" reduce [sub-ctx/1 value]]
		if sub-ctx/1 = 'message [
			either block! = v-type [
				foreach sub value [
					len: append-embedded wire-type sub rep-buf data
					ret: ret + len
				]
			][
				len: append-embedded wire-type value rep-buf data
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
					if enum-value = -1 [new-error 'encode-type "not found" sub]
					len: append-integer enum-value rep-buf data
					ret: ret + len
				]
			][
				enum-value: -1
				foreach sub-msg sub-ctx/3 [
					if value = sub-msg/2 [enum-value: sub-msg/1 break]
				]
				if enum-value = -1 [new-error 'encode-type "not found" sub]
				len: append-integer enum-value rep-buf data
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
		return:			[integer!]
		/local
			sub			[block!]
			olen		[integer!]
			nlen		[integer!]
			len			[integer! error!]
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
				if all [repeated? block! <> v-type][new-error 'encode-each "not repeated" reduce [msg name value]]
				len: try [encode-type sub/3 sub/1 value data]
				if error? len [new-error 'encode-each len reduce [msg name]]
				nlen: length? data
				if len <> (nlen - olen) [new-error 'encode-each "not equal" reduce [len (nlen - olen)]]
				ret: ret + len
				return ret
			]
		]

		new-error 'encode-each "not found" reduce [msg name]
	]

	encode: func [
		ctx				[block! logic!]
		msg				[word!]
		value			[map!]
		data			[binary!]
		return:			[integer!]
		/local
			keys		[block!]
			buffer		[binary!]
			key			[word!]
			ret			[integer!]
			len			[integer!]
			sub-ctx		[block!]
			sub
	][
		keys: keys-of value
		if 0 = length? keys [return 0]

		if ctx = [] [new-error 'encode "empty ctx" msg]
		if ctx <> true [msg-ctx: ctx]

		ret: 0
		foreach key keys [
			sub: value/:key
			sub-ctx: proto-parser/get-msg msg-ctx msg
			if sub-ctx/1 <> 'message [new-error 'encode "not message" msg]
			len: encode-each sub-ctx/3 msg key sub data
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
		return:			[integer!]
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
		new-error 'decode-varint "no end" reduce [i dlen]
	]

	decode-type: func [
		wire-type			[word!]
		name				[word!]
		value				[map!]
		data				[binary!]
		return:				[integer!]
		/local
			ret				[integer!]
			len				[integer! error!]
			varint			[integer! logic!]
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
				len: length? varint-buffer
				if len > 5 [new-error 'decode-type "too large" reduce [wire-type name varint-buffer]]
				varint: to integer! varint-buffer
				;-- we don't support too large string/binary
				if varint < 0 [new-error 'decode-type "negative varint" reduce [wire-type name varint]]
				nvalue: copy/part skip data vlen varint
				if wire-type = 'string [
					nvalue: to string! nvalue
				]
				either not none? ovalue [
					either block! = type? ovalue [
						put value name append ovalue nvalue
					][
						put value name reduce [nvalue]
					]
				][
					put value name nvalue
				]
				ret: ret + vlen + varint
				return ret
			]
			int64 uint64 [
				vlen: decode-varint data
				len: length? varint-buffer
				if len > 8 [new-error 'decode-type "too large" reduce [wire-type name varint-buffer]]
				either not none? ovalue [
					either block! = type? ovalue [
						put value name append ovalue copy varint-buffer
					][
						put value name reduce [copy varint-buffer]
					]
				][
					put value name copy varint-buffer
				]
				ret: ret + vlen
				return ret
			]
			int32 uint32 enum [
				vlen: decode-varint data
				len: length? varint-buffer
				varint: to integer! back back back back tail varint-buffer
				either not none? ovalue [
					either block! = type? ovalue [
						put value name append ovalue varint
					][
						put value name reduce [varint]
					]
				][
					put value name varint
				]
				ret: ret + vlen
				return ret
			]
			bool [
				vlen: decode-varint data
				len: length? varint-buffer
				varint: to integer! back back tail varint-buffer
				either varint-buffer = #{0000} [
					varint: false
				][
					varint: true
				]
				either not none? ovalue [
					either block! = type? ovalue [
						put value name append ovalue varint
					][
						put value name reduce [varint]
					]
				][
					put value name varint
				]
				ret: ret + vlen
				return ret
			]
		]

		sub-ctx: proto-parser/get-msg msg-ctx wire-type
		if all [sub-ctx/1 <> 'message sub-ctx/1 <> 'enum] [new-error 'decode-type "not message/enum" reduce [wire-type name sub-ctx/1]]
		if sub-ctx/1 = 'message [
			vlen: decode-varint data
			len: length? varint-buffer
			if len > 5 [new-error 'decode-type "too large" reduce [wire-type name varint-buffer]]
			varint: to integer! varint-buffer
			;-- we don't support too large embedded message
			if varint < 0 [new-error 'decode-type "negative varint" reduce [wire-type name varint]]
			nvalue: copy/part skip data vlen varint
			nres: make map! []
			len: try [decode true wire-type nres nvalue]
			if error? len [new-error 'decode-type len reduce [wire-type name sub-ctx/1]]
			if len <> varint [new-error 'decode-type "not equal" reduce [len varint]]
			either not none? ovalue [
				either block! = type? ovalue [
					put value name append ovalue nres
				][
					put value name reduce [nres]
				]
			][
				put value name nres
			]
			ret: ret + vlen + varint
			return ret
		]

		if sub-ctx/1 = 'enum [
				vlen: decode-varint data
				len: length? varint-buffer
				if len > 5 [new-error 'decode-type "too large" reduce [wire-type name varint-buffer]]
				varint: to integer! varint-buffer
				if varint < 0 [new-error 'decode-type "negative varint" reduce [wire-type name varint]]
				nvalue: none
				foreach sub-msg sub-ctx/3 [
					if varint = sub-msg/1 [nvalue: sub-msg/2 break]
				]
				if nvalue = none [new-error 'decode-type "not found" reduce [wire-type name varint]]
				either not none? ovalue [
					either block! = type? ovalue [
						put value name append ovalue nvalue
					][
						put value name reduce [nvalue]
					]
				][
					put value name nvalue
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
			len				[integer! error!]
			pos				[binary!]
			repeated?		[logic!]
	][
		wire-type-id: varint and 7
		field-number: varint >>> 3
		ret: 0
		pos: data
		foreach sub msgs [
			wire-type-id2: get-wire-type-id sub/3
			if all [sub/1 = field-number wire-type-id = wire-type-id2][
				repeated?: sub/2 = 'repeated
				len: try [decode-type sub/3 sub/4 value pos]
				if error? len [new-error 'decode-each len reduce [index? pos msg wire-type-id field-number]]
				pos: skip data len
				ret: ret + len
				break
			]
		]

		if ret = 0 [
			wire-type-name: switch/default wire-type-id [
				0			['uint64]
				2			['bytes]
			][
				new-error 'decode-each "unsupported type"
					reduce [index? pos msg wire-type-id field-number]
			]
			len: try [decode-type wire-type-name 'unknown value pos]
			if error? len [new-error 'decode-each len reduce [index? pos msg wire-type-id field-number]]
			pos: skip data len
			ret: ret + len
		]

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
			len				[integer!]
			pos				[binary!]
			varint			[integer!]
			ret				[integer!]
			sub-ctx			[block!]
	][
		dlen: length? data
		if dlen = 0 [return 0]

		if ctx = [] [new-error 'decode "empty ctx" msg]
		if ctx <> true [msg-ctx: ctx]

		ret: 0
		pos: data
		until [
			vlen: decode-varint pos
			len: length? varint-buffer
			if len > 5 [new-error 'decode "too large" reduce [msg varint-buffer]]
			pos: skip pos vlen
			ret: ret + vlen
			varint: to integer! varint-buffer
			;-- print ["head varint: " varint lf]
			;-- we don't support too large field number
			if varint < 0 [new-error 'decode "negative varint" reduce [msg varint]]
			sub-ctx: proto-parser/get-msg msg-ctx msg
			if sub-ctx/1 <> 'message [new-error 'decode "not message" reduce [msg sub-ctx/1]]
			len: decode-each sub-ctx/3 msg varint value pos
			pos: skip pos len
			ret: ret + len
			tail? pos
		]
		ret
	]
]
