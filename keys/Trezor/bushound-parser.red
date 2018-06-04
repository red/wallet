Red [
	Title:	"bushound data parser"
	Author: "bitbegin"
	File: 	%bushound-parser.red
	Usage:	comment {1.  .\red.exe -r .\keys\Trezor\bushound-parser.red
			2. we will get bushound-parser.exe from step 1
			3. ./bushound-parser.exe bushound-file
		}
	Tabs: 	4
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]


#include %../../libs/int-encode.red
#include %../../libs/proto-encode.red
#include %trezor-message.red

bushound-parser: context [

	debug-level: 0
	space: charset " ^-^/"
	notspace: complement space
	digit: charset [#"0" - #"9"]
	hex-char: charset [#"a" - #"f"]
	hex-digit: union digit hex-char
	message: make binary! 1000
	message-id: 0
	message-size: 0
	package: make binary! 65
	last-phase: ""

	parse-file: func [
		file					[file!]
		return:					[string!]
		/local
			ret					[logic!]
			content				[string!]
			header-start		[string!]
			header-end			[string!]
			header-data			[string!]
			header				[block!]
			dlm-start			[string!]
			dlm-end				[string!]
			dlm-data			[string!]
			dlm					[block!]
			item-start
			item-end
			item
			item-len
			data-start			[string!]
			data-end			[string!]
			data-item			[string!]
			data-data			[string!]
			data				[binary!]
			data-begin?			[logic!]
			len-pos
			phase-pos
			data-pos
			len-value
			phase-first?
			count
			len
			res
			name
	][
		content: read file

		header: copy []
		header-end: find content "^/---"
		header-start: find/reverse/tail header-end lf
		header-end: find/tail header-end lf
		header-data: copy/part header-start header-end

		dlm: copy []
		dlm-start: header-end
		dlm-end: find/tail dlm-start "^/"
		dlm-data: copy/part dlm-start dlm-end

		item-start: dlm-data
		forever [
			item-start: find item-start notspace
			if item-start = none [break]
			item-end: find/tail item-start space
			either item-end = none [
				item-len: offset? item-start tail dlm-data
			][
				item-len: offset? item-start item-end
			]
			append/only dlm reduce [index? item-start item-len - 1]
			if item-end = none [break]
			item-start: item-end
		]

		foreach item dlm [
			append header reduce [trim/head/tail copy/part at header-data item/1 item/2 item]
		]

		len-pos: select header "Length"
		phase-pos: select header "Phase"
		if none = phase-pos [return false]
		data-pos: select header "Data"
		if none = data-pos [return false]

		data-start: dlm-end
		until [
			clear package
			phase-first?: true
			until [
				data-end: find/tail data-start lf
				if data-end = none [data-end: tail content]
				data-item: copy/part data-start data-end
				phase-value: trim/head/tail copy/part at data-item phase-pos/1 phase-pos/2
				either phase-value <> "" [
					either phase-first? [
						data-data: trim/all copy/part at data-item data-pos/1 data-pos/2
						append package debase/base data-data 16
						phase-first?: false
						last-phase: phase-value
					][
						break
					]
				][
					data-data: trim/all copy/part at data-item data-pos/1 data-pos/2
					append package debase/base data-data 16
				]
				data-start: data-end
				tail? data-end
			]

			if debug-level > 1 [print ["debug-2:: " last-phase ": package: " package]]

			if any [package/1 <> to integer! #{00} package/2 <> to integer! #{3f}] [return data-item]
			either all [package/3 = to integer! #{ff} package/4 = to integer! #{ff}][
				print ["------------------------------------------------------"]
				print [last-phase ": get hid version"]
				print ["------------------------------------------------------" lf]
			][
				either all [package/3 = to integer! #{23} package/4 = to integer! #{23}][
					message-id: to-int16 skip package 4
					message-size: to-int32 skip package 6
					count: 0
					clear message
					either message-size > (65 - 10) [
						count: 65 - 10
						append message copy/part skip package 10 count
						
					][
						if message-size <> 0 [append message copy/part skip package 10 message-size]
						count: message-size
						print ["------------------------------------------------------"]
						if debug-level > 0 [print ["debug-1:: " last-phase ": message: " message]]
						res: make map! []
						name: trezor-message/get-type-name message-id
						print [last-phase ": " "message type: " name]
						len: proto-encode/decode trezor-message/messages name res message
						if block! = type? len [probe len return data-item]
						probe res
						print ["------------------------------------------------------" lf]
					]
				][
					either message-size > (63 + count) [
						count: count + 63
						append message copy/part skip package 2 63
					][
						append message copy/part skip package 2 (message-size - count)
						count: message-size
						print ["------------------------------------------------------"]
						if debug-level > 0 [print ["debug-1:: " last-phase ": message: " message]]
						res: make map! []
						name: trezor-message/get-type-name message-id
						print [last-phase ": " "message type: " name]
						len: proto-encode/decode trezor-message/messages name res message
						if block! = type? len [probe len return data-item]
						probe res
						print ["------------------------------------------------------" lf]
					]
				]
			]

			tail? data-end
		]
	]
]

main: does [
	if none? system/options/args [print "please input file name!" exit]
	file: to file! system/options/args/1
	print system/options/args/2
	if system/options/args/2 <> none [bushound-parser/debug-level: to integer! system/options/args/2 print "debug-level: " bushound-parser/debug-level]
	print bushound-parser/parse-file file
]



main