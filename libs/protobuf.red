Red [
	Title:	"protobuf(syntax = proto2, no packed feature) parser"
	Author: "bitbegin"
	File: 	%protobuf.red
	Tabs: 	4
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

protobuf: context [
	
	msg-ctx: none
	varint-buffer: make binary! 8

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
		]
		ret
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
		return:			[integer!]
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
				reverse varint-buffer
				dlen: length? varint-buffer
				j: 1
				until [
					either 0 = to integer! varint-buffer/:j [
						j: j + 1
					][
						break
					]
					j > dlen
				]
				varint-buffer: skip varint-buffer j - 1
				;-- print ["i: " i " varint: " varint-buffer]
				return i
			]
			off: off + 1
			if off = 8 [off: 0]
			i: i + 1
			i > dlen
		]
		-1
	]

	decode-type: func [
		wire-type			[word!]
		name				[word!]
		value				[map!]
		data				[binary!]
		return:				[integer!]
		/local
			wire-type2		[word!]
			ret				[integer!]
			len				[integer!]
			varint			[integer!]
			vlen			[integer!]
			nres			[map!]
			nvalue
			ovalue
		
	][
		wire-type2: get-wire-type wire-type
		ovalue: select value name

		ret: 0
		switch wire-type2 [
			string bytes [
				vlen: decode-varint data
				if vlen < 0 [return vlen]
				len: length? varint-buffer
				if len > 4 [return -1]
				varint: to integer! varint-buffer
				if varint < 0 [return -1]					;-- we don't support too large string/binary
				nvalue: copy/part skip data vlen varint
				if wire-type2 = 'string [
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
				if vlen < 0 [return vlen]
				len: length? varint-buffer
				if len > 8 [return -1]
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
				if vlen < 0 [return vlen]
				len: length? varint-buffer
				if len > 4 [return -1]
				varint: to integer! varint-buffer
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
				if vlen < 0 [return vlen]
				len: length? varint-buffer
				if len <> 1 [return -1]
				either varint-buffer = #{00} [
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
			embedded [
				vlen: decode-varint data
				if vlen < 0 [return vlen]
				len: length? varint-buffer
				if len > 4 [return -1]
				varint: to integer! varint-buffer
				if varint < 0 [return -1]					;-- we don't support too large embedded message
				nvalue: copy/part skip data vlen varint
				nres: make map! []
				len: decode wire-type nres nvalue
				if len < 0 [return -1]
				if len <> varint [return -1]
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
		]
		ret
	]

	decode-each: func [
		msg					[word!]
		varint				[integer!]
		value				[map!]
		data				[binary!]
		return:				[integer!]
		/local
			blk				[block!]
			sub				[block!]
			wire-type-id	[integer!]
			wire-type-id2	[integer!]
			field-number	[integer!]
			ret				[integer!]
			len				[integer!]
			wire-type		[word!]
			wire-type2		[word!]
			pos				[binary!]
	][
		either msg-ctx = none [blk: get msg][blk: get in msg-ctx msg]
		if block! <> type? blk [return -1]
		if 0 = length? blk [return 0]

		wire-type-id: varint and 7
		field-number: varint >>> 3
		ret: 0
		pos: data
		foreach sub blk [
			wire-type: sub/2
			wire-type2: get-wire-type sub/2
			wire-type-id2: get-wire-type-id wire-type2
			if all [sub/1 = field-number wire-type-id = wire-type-id2][
				len: decode-type wire-type sub/3 value pos
				if len < 0 [return len]
				pos: skip data len
				ret: ret + len
			]
		]

		ret
	]

	decode: func [
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
	][
		dlen: length? data
		if dlen = 0 [return 0]

		ret: 0
		pos: data
		until [
			vlen: decode-varint pos
			if vlen < 0 [return vlen]
			len: length? varint-buffer
			if len > 4 [return -1]
			pos: skip pos vlen
			ret: ret + vlen
			varint: to integer! varint-buffer
			;-- print ["head varint: " varint lf]
			if varint < 0 [return -1]					;-- we don't support too large field number
			len: decode-each msg varint value pos
			if len < 0 [return len]
			pos: skip pos len
			ret: ret + len
			tail? pos
		]
		
		ret
	]

	init-ctx: func [ctx [word! none!]][
		either ctx = none [msg-ctx: none][msg-ctx: get ctx]
	]
]
