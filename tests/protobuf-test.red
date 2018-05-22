Red []

#include %../../red/quick-test/quick-test.red
#include %../libs/protobuf.red
#include %../keys/Trezor/message.red


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
	protobuf/init-ctx 'message
	x: make binary! 10
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
	--test-- "encode-3"
		clear x
		len: protobuf/encode 'GetFeatures #() x
		y: #{}
		--assert y = x
		--assert len = 0
	--test-- "encode-4"
		clear x
		len: protobuf/encode 'Features #(vendor: "bitbegin") x
		y: #{0A08626974626567696E}
		--assert y = x
	--test-- "encode-5"
		clear x
		len: protobuf/encode 'Features #(major_version: 100) x
		y: #{1064}
		--assert y = x
	--test-- "encode-6"
		clear x
		len: protobuf/encode 'Features #(minor_version: 10000) x
		y: #{18904E}
		--assert y = x
	--test-- "encode-7"
		clear x
		len: protobuf/encode 'Features #(patch_version: 1000000) x
		y: #{20C0843D}
		--assert y = x
	--test-- "encode-8"
		clear x
		len: protobuf/encode 'Features #(major_version: 100 minor_version: 10000 patch_version: 1000000) x
		y: #{106418904E20C0843D}
		--assert y = x
	--test-- "encode-9"
		clear x
		len: protobuf/encode 'Features #(bootloader_mode: #[true]) x
		y: #{2801}
		--assert y = x
	--test-- "encode-10"
		clear x
		len: protobuf/encode 'Features #(bootloader_mode: #[false]) x
		y: #{2800}
		--assert y = x
	--test-- "encode-11"
		clear x
		len: protobuf/encode 'Features #(coins: [#(coin_name: "Bitcoin" address_type: 100)]) x
		y: #{5A0B0A07426974636F696E1864}
		--assert y = x
	--test-- "encode-12"
		clear x
		len: protobuf/encode 'Features #(coins: [#(coin_name: "Bitcoin" address_type: 100) #(coin_name: "eth" address_type: 200)]) x
		y: #{5A0B0A07426974636F696E18645A080A0365746818C801}
		--assert y = x
===end-group===

~~~end-file~~~