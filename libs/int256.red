Red [
	Title:	 "256-bit unsigned integer library"
	Author:	 "Nenad Rakocevic"
	File:	 %int256.red
	Tabs:	 4
	Rights:  "Copyright (C) 2018 Red Foundation. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]


int256: context [
	empty: [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]

	make-i256: function [][
		make vector! compose/only [integer! 16 (empty)]
	]

	set 'to-i256 function [value [integer! float! binary! string!] return: [vector!]][
		switch/default type?/word value [
			integer! [
				spec: reduce [0 0 0 0 0 0 0 0 0 0 0 0 0 0 value / 65536 value % 65536]
			]
			float! [
				spec: make block! 16
				while [value <> 0.0][
					v: to integer! either value < 65536.0 [
						n: 0.0
						value
					][
						n: round/floor value / 65536.0
						value - (n * 65536.0)
					]
					if v > 32768 [v: v - 65536]
					insert spec v
					value: n
				]
				insert/dup spec 0 16 - length? spec
			]
			binary! [
				bin: tail value
				spec: make block! 16

				while [not head? bin][
					bin: back bin
					v: bin/1
					unless head? bin [bin: back bin v: bin/1 << 8 + v]
					insert spec v
				]
				insert/dup spec 0 16 - length? spec
			]
			string! [
				res: to-i256 0
				factor: to-i256 10
				bin: value
				if any [value/1 = #"-" value/1 = #"+"] [
					bin: next value
				]
				while [all [not tail? bin bin/1 <> #"."]][
					if any [bin/1 < #"0" bin/1 > #"9"][
						do make error! rejoin ["to-i256 invalid char " bin/1]
					]
					v: to-i256 to integer! (bin/1 - #"0")
					res: mul256 res factor
					res: add256 res v
					bin: next bin
				]
				return res
			]
		][do make error! "to-i256 error: invalid type!"]
		
		make vector! compose/only [integer! 16 (spec)]
	]

	set 'i256-to-int function [bigint [vector!] return: [integer!]][
		repeat idx 12 [if (bigint/:idx) <> 0 [do make error! "i256-to-int error!"]]
		high: bigint/15 << 16
		if negative? high [high: 65536 + high]
		if negative? low: bigint/16 [low: 65536 + low]
		high + low
	]
	
	set 'i256-to-float function [bigint [vector!] return: [float!]][
		res: 0.0
		p: 1.0 
		idx: 16
		loop 16 [
			v: bigint/:idx
			if negative? v [v: 65536 + v]
			res: v * p + res
			p: p * 65536.0
			idx: idx - 1
		]
		res
	]

	set 'i256-to-bin function [bigint [vector!] return: [binary!]][
		bin: make binary! 32
		idx: 16

		until [
			v: bigint/:idx and 65535
			insert bin v % 256
			insert bin v / 256
			zero? idx: idx - 1
		]
		bin
	]

	set 'i256-to-string function [bigint [vector!] return: [string!]
		/local res factor rest chr
	][
		res: make string! 64
		factor: to-i256 10
		rest: bigint
		forever [
			rest: div256/rem rest factor
			chr: to string! i256-to-int rest/2
			insert res chr
			if zero256? rest/1 [break]
			rest: rest/1
		]
		res
	]

	set 'zero256? function [bigint [vector!] return: [logic!] /local idx][
		repeat idx length? bigint [if (bigint/:idx) <> 0 [return false]]
		true
	]

	less-equal256?: routine [
		left	[vector!]
		right	[vector!]
		return: [logic!]
		/local
			pl [byte-ptr!]
			pr [byte-ptr!]
			p  [byte-ptr!]
			l  [integer!]
			r  [integer!]
			i  [integer!]
	][
		pl: vector/rs-head left
		pr: vector/rs-head right

		i: 1
		until [
			l: (as-integer pl/2) << 8 + as-integer pl/1
			r: (as-integer pr/2) << 8 + as-integer pr/1
			if l < r [return yes]
			if l > r [return no]
			pl: pl + 2
			pr: pr + 2
			i: i + 1
			any [i = 17 l <> r]
		]
		l = r
	]

	set 'lesser-or-equal256? function [left [vector!] right [vector!] return: [logic!]][
		less-equal256? left right
	]

	shift-left: routine [v [vector!] /local	p [byte-ptr!]][
		p: vector/rs-head v
		p/2: p/2 << 1 or (p/1 >>> 7)
		p/1: p/1 << 1 or (p/4 >>> 7)
		p/4: p/4 << 1 or (p/3 >>> 7)
		p/3: p/3 << 1 or (p/6 >>> 7)

		p/6: p/6 << 1 or (p/5 >>> 7)
		p/5: p/5 << 1 or (p/8 >>> 7)
		p/8: p/8 << 1 or (p/7 >>> 7)
		p/7: p/7 << 1 or (p/10 >>> 7)

		p/10: p/10 << 1 or (p/9  >>> 7)
		p/9:  p/9  << 1 or (p/12 >>> 7)
		p/12: p/12 << 1 or (p/11 >>> 7)
		p/11: p/11 << 1 or (p/14 >>> 7)

		p/14: p/14 << 1 or (p/13 >>> 7)
		p/13: p/13 << 1 or (p/16 >>> 7)
		p/16: p/16 << 1 or (p/15 >>> 7)
		p/15: p/15 << 1 or (p/18 >>> 7)

		p/18: p/18 << 1 or (p/17 >>> 7)
		p/17: p/17 << 1 or (p/20 >>> 7)
		p/20: p/20 << 1 or (p/19 >>> 7)
		p/19: p/19 << 1 or (p/22 >>> 7)

		p/22: p/22 << 1 or (p/21 >>> 7)
		p/21: p/21 << 1 or (p/24 >>> 7)
		p/24: p/24 << 1 or (p/23 >>> 7)
		p/23: p/23 << 1 or (p/26 >>> 7)

		p/26: p/26 << 1 or (p/25 >>> 7)
		p/25: p/25 << 1 or (p/28 >>> 7)
		p/28: p/28 << 1 or (p/27 >>> 7)
		p/27: p/27 << 1 or (p/30 >>> 7)

		p/30: p/30 << 1 or (p/29 >>> 7)
		p/29: p/29 << 1 or (p/32 >>> 7)
		p/32: p/32 << 1 or (p/31 >>> 7)
		p/31: p/31 << 1
	]

	set 'shl256 function [v [vector!]][
		shift-left v
		v
	]

	add-256: routine [
		left  [vector!]
		right [vector!]
		res	  [vector!]
		/local
			pl [byte-ptr!]
			pr [byte-ptr!]
			p  [byte-ptr!]
			l  [integer!]
			r  [integer!]
			v  [integer!]
			c  [integer!]
	][
		pl: (vector/rs-head left)  + 32
		pr: (vector/rs-head right) + 32
		p:  (vector/rs-head res)   + 32

		c: 0
		loop 16 [
			pl: pl - 2
			pr: pr - 2
			p:  p  - 2
			l: (as-integer pl/2) << 8 + as-integer pl/1
			r: (as-integer pr/2) << 8 + as-integer pr/1
			v: l + r + c
			c: as-integer v > 65535
			p/1: as-byte v
			p/2: as-byte v >>> 8
		]
	]

	set 'add256 function [left [vector!] right [vector!] return: [vector!]][
		add-256 left right res: make-i256
		res
	]

	sub-256: routine [
		left  [vector!]
		right [vector!]
		res	  [vector!]
		/local
			pl [byte-ptr!]
			pr [byte-ptr!]
			p  [byte-ptr!]
			l  [integer!]
			r  [integer!]
			v  [integer!]
			c  [integer!]
	][
		pl: (vector/rs-head left)  + 32
		pr: (vector/rs-head right) + 32
		p:  (vector/rs-head res)   + 32

		c: 0
		loop 16 [
			pl: pl - 2
			pr: pr - 2
			p:  p  - 2
			l: (as-integer pl/2) << 8 + as-integer pl/1
			r: (as-integer pr/2) << 8 + as-integer pr/1
			v: l - r - c								;-- borrowed carry bit
			c: as-integer l < (r + c)
			p/1: as-byte v
			p/2: as-byte v >>> 8
		]
	]

	set 'sub256 function [left [vector!] right [vector!] return: [vector!]][
		sub-256 left right res: make-i256
		res
	]

	set 'mul256 function [left [vector!] right [vector!] return: [vector!]][
		idx: 16
		res: make-i256
		s: copy left
		until [
			r: right/:idx
			loop 16 [
				if r and 1 <> 0 [res: add256 res s]
				shl256 s
				r: shift r 1
			]
			zero? idx: idx - 1
		]
		res
	]

	set 'div256 function [dividend [vector!] divisor [vector!] /rem return: [vector! block!]][
		t: 0 repeat idx 16 [t: t + divisor/:idx]
		if zero? t [cause-error 'math 'zero-divide []]
		
		q: make-i256
		r: make-i256
		repeat idx 16 [
			d: dividend/:idx and 65535
			bit: 15
			loop 16 [
				shl256 r
				r/16: r/16 or (1 and shift d bit)
				shl256 q
				if less-equal256? divisor r [
					r: sub256 r divisor
					q/16: q/16 or 1
				]
				bit: bit - 1
			]
		]
		either rem [reduce [q r]][q]
	]

	set 'mod256 func [l [vector!] r [vector!] return: [vector!]][
		second div256/rem l r
	]
]
