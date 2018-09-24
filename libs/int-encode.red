Red [
	Title:	"integer encode/decode"
	Author: "bitbegin"
	File: 	%int-encode.red
	Tabs: 	4
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

to-bin8: func [v [integer! char!]][
	to binary! to char! 256 + v and 255
]

;-- default: big-endian encoding
to-bin16: func [v [integer! char!] /little /local res][
	res: skip to-binary to-integer v 2
	if little [reverse res]
	res
]

;-- default: big-endian encoding
to-bin32: func [v [integer! char!] /little /local res][
	res: to-binary to-integer v
	if little [reverse res]
	res
]

to-int16: func [b [binary!]][
	to-integer copy/part b 2
]

to-int32: func [b [binary!]][
	to-integer copy/part b 4
]

string-to-i256: func [s [string!] scalar [integer!] return: [vector!]
	/local dot left right
][
	either dot: find s #"." [
		left: copy/part s dot
		right: copy next dot
	][
		left: copy s
		right: copy ""
	]

	either scalar >= length? right [
		append/dup right #"0" (scalar - length? right)
	][
		right: copy/part right scalar
	]

	append left right
	to-i256 left
]

form-i256: func [bigint [vector!] scalar [integer!] max-point [integer!] /nopad return: [string!]
	/local str abs len left right s res
][
	abs: str: i256-to-string bigint
	if any [str/1 = #"-" str/1 = #"+"] [abs: next abs]

	len: length? abs
	either scalar >= len [
		left: copy "0"
		insert/dup right: copy abs #"0" (scalar - len)
	][
		left: copy/part abs len - scalar
		right: copy/part at abs (len + 1 - scalar) scalar
	]
	s: right
	forever [
		s: back tail s
		either s/1 = #"0" [remove s][break]
	]
	if empty? right [
		right: "0"
	]

	if max-point < length? right [
		right: copy/part right max-point
	]
	unless nopad [
		if 8 > length? left [insert/dup left #" " 8 - length? left]
	]
	either max-point > 0 [
		res: rejoin [left "." right]
	][
		res: left
	]

	if str/1 = #"-" [insert res #"-"]
	res
]
