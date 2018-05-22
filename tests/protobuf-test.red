Red []

#include %../../red/quick-test/quick-test.red
#include %../libs/protobuf.red
#include %../keys/Trezor/message.red

protobuf/init-ctx 'message
x: make binary! 10


~~~start-file~~~ "protobuf message - test"

===start-group=== "get-msg-id"
	--test-- "get-msg-id-1"
		id: message/get-msg-id 'Initialize
		--assert message/MessageType_Initialize = id
	--test-- "get-msg-id-2"
		id: message/get-msg-id 'GetFeatures
		--assert message/MessageType_GetFeatures = id
===end-group===

===start-group=== "encode"
	--test-- "encode-2"
		clear x
		len: protobuf/encode 'Initialize #() x
		y: #{}
		--assert y = x
		--assert len = 0
	--test-- "encode-3"
		clear x
		len: protobuf/encode 'Initialize #(state: #{1234}) x
		y: #{0A021234}
		--assert y = x

===end-group===

~~~end-file~~~