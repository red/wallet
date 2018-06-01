Red [
	Title:	"generate trezor messages in new format"
	Author: "bitbegin"
	File: 	%generate-msg.red
	Usage:	comment {1. ./red.exe keys/Trezor/generate-msg.red
				2. step 1 will put messages.red
				3. include %messages.red to a block!
			}
	Tabs:	4
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

#include %../../libs/proto-parser.red

blk: []
print proto-parser/parse-files [%protob/types.proto %protob/messages.proto] blk

save %messages.red blk
