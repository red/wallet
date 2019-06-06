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

call/wait "git clone https://github.com/trezor/trezor-common/"
;-- message-v6 need "git checkout 482a8e37f0f627bfefc720ed0bd8a8c4a93cdbe3"

blk: []
print proto-parser/parse-files [
	%trezor-common/protob/messages.proto
	%trezor-common/protob/messages-management.proto
	%trezor-common/protob/messages-common.proto
	%trezor-common/protob/messages-ethereum.proto
	%trezor-common/protob/messages-bitcoin.proto
] blk

write %messages.red {Red [Title: "auto generated, don't modify it manully!"]}
write/append %messages.red blk
