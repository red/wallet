Red [
	Title:	"generate trezor messages in new format"
	Author: "bitbegin"
	File: 	%generate-msg.red
	Usage:	comment {1. ./red.exe keys/Trezor/generate-msg.red
				2. we will get messages.red from step 1
				3. include %messages.red to a block!
			}
	Tabs:	4
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

#include %../../libs/proto-parser.red

blk: []
print proto-parser/parse-files [%protob/types.proto %protob/messages.proto] blk

write %messages.red {Red [Title: "auto generated, don't modify it manully!"]}
write/append %messages.red blk
