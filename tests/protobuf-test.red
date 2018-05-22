Red []

#include %../../red/quick-test/quick-test.red
#include %../libs/protobuf.red
#include %../keys/Trezor/message.red

protobuf/init-ctx 'message
x: make binary! 10


~~~start-file~~~ "protobuf message - test"

===start-group=== "encode"
	--test-- "encode-1"
		clear x
		len: protobuf/encode 'Initialize #() x
		y: #{}
		--assert y = x
		--assert len = 0
	--test-- "encode-2"
		clear x
		len: protobuf/encode 'Initialize #(state: #{1234}) x
		y: #{0A021234}
		--assert y = x

===end-group===

~~~end-file~~~