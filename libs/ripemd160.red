Red [
	Title:	"ripemd160"
	Author: "bitbegin"
	File: 	%ripemd160.red
	Tabs: 	4
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

#if error? try [_ripemd160_red_][
#do [_ripemd160_red_: yes]

#system [
	#include %ripemd160.reds
]

context [
	_ripemd160: routine [
		ins		[any-type!]
		/local
			data	[byte-ptr!]
			len		[integer!]
			ret		[red-binary!]
			hash	[byte-ptr!]
	][
		switch TYPE_OF(ins) [
			TYPE_BINARY [
				data: binary/rs-head as red-binary! ins
				len: binary/rs-length? as red-binary! ins
			]
			TYPE_STRING [data: as byte-ptr! unicode/to-utf8 as red-string! ins :len]
			default [
				fire [TO_ERROR(script invalid-arg) stack/arguments]
			]
		]

		hash: allocate 20
		ripemd160/init
		ripemd160/update data len
		ripemd160/final hash
		len: 20
		stack/set-last as red-value! binary/load hash len
		free hash
	]

	set 'ripemd160 function [data [binary! string! file!] return: [binary!]][
		if file? data [data: read/binary data]
		_ripemd160 data
	]

]


]