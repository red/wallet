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
		len: protobuf/encode 'Features #(major_version: 8888h) x
		y: #{10889102}
		--assert y = x
	--test-- "encode-7"
		clear x
		len: protobuf/encode 'Features #(major_version: E8E8E8h) x
		y: #{10E8D1A307}
		--assert y = x
	--test-- "encode-8"
		clear x
		len: protobuf/encode 'Features #(minor_version: 10000) x
		y: #{18904E}
		--assert y = x
	--test-- "encode-9"
		clear x
		len: protobuf/encode 'Features #(patch_version: 1000000) x
		y: #{20C0843D}
		--assert y = x
	--test-- "encode-10"
		clear x
		len: protobuf/encode 'Features #(major_version: 100 minor_version: 10000 patch_version: 1000000) x
		y: #{106418904E20C0843D}
		--assert y = x
	--test-- "encode-11"
		clear x
		len: protobuf/encode 'Features #(bootloader_mode: #[true]) x
		y: #{2801}
		--assert y = x
	--test-- "encode-12"
		clear x
		len: protobuf/encode 'Features #(bootloader_mode: #[false]) x
		y: #{2800}
		--assert y = x
	--test-- "encode-13"
		clear x
		len: protobuf/encode 'Features #(coins: [#(coin_name: "Bitcoin" address_type: 100)]) x		;-- only block! can be used for conins, because of it's repeated property
		y: #{5A0B0A07426974636F696E1864}
		--assert y = x
	--test-- "encode-14"
		clear x
		len: protobuf/encode 'Features #(coins: [#(coin_name: "Bitcoin" address_type: 100) #(coin_name: "eth" address_type: 200)]) x
		y: #{5A0B0A07426974636F696E18645A080A0365746818C801}
		--assert y = x
===end-group===

===start-group=== "decode"
	protobuf/init-ctx 'message
	bin: make binary! 10
	--test-- "decode-1"
		clear bin
		x: #()
		len: protobuf/decode 'Initialize x bin
		y: #()
		--assert y = x
		--assert len = 0
	--test-- "decode-2"
		clear bin
		x: #()
		append bin #{0A021234}
		len: protobuf/decode 'Initialize x bin
		y: #(state: #{1234})
		--assert y = x
	--test-- "decode-3"
		clear bin
		x: #()
		len: protobuf/decode 'GetFeatures x bin
		y: #()
		--assert y = x
		--assert len = 0
	--test-- "decode-4"
		clear bin
		x: #()
		append bin #{0A08626974626567696E}
		len: protobuf/decode 'Features x bin
		y: #(vendor: "bitbegin")
		--assert y = x
	--test-- "decode-5"
		clear bin
		x: #()
		append bin #{1064}
		len: protobuf/decode 'Features x bin
		y: #(major_version: 100)
		--assert y = x
	--test-- "decode-6"
		clear bin
		x: #()
		append bin #{10889102}
		len: protobuf/decode 'Features x bin
		y: #(major_version: 8888h)
		--assert y = x
	--test-- "decode-7"
		clear bin
		x: #()
		append bin #{10E8D1A307}
		len: protobuf/decode 'Features x bin
		y: #(major_version: E8E8E8h)
		--assert y = x
	--test-- "decode-8"
		clear bin
		x: #()
		append bin #{18904E}
		len: protobuf/decode 'Features x bin
		y: #(minor_version: 10000)
		--assert y = x
	--test-- "decode-9"
		clear bin
		x: #()
		append bin #{20C0843D}
		len: protobuf/decode 'Features x bin
		y: #(patch_version: 1000000)
		--assert y = x
	--test-- "decode-10"
		clear bin
		x: #()
		append bin #{106418904E20C0843D}
		len: protobuf/decode 'Features x bin
		y: #(major_version: 100 minor_version: 10000 patch_version: 1000000)
		--assert y = x
	--test-- "decode-11"
		clear bin
		x: #()
		append bin #{2801}
		len: protobuf/decode 'Features x bin
		y: #(bootloader_mode: #[true])
		--assert y = x
	--test-- "decode-12"
		clear bin
		x: #()
		append bin #{2800}
		len: protobuf/decode 'Features x bin
		y: #(bootloader_mode: #[false])
		--assert y = x
	--test-- "decode-13"
		clear bin
		x: #()
		append bin #{5A0B0A07426974636F696E1864}
		len: protobuf/decode 'Features x bin
		y: #(coins: #(coin_name: "Bitcoin" address_type: 100))
		--assert y = x
	--test-- "decode-14"
		clear bin
		x: #()
		append bin #{5A0B0A07426974636F696E18645A080A0365746818C801}
		len: protobuf/decode 'Features x bin
		y: #(coins: [#(coin_name: "Bitcoin" address_type: 100) #(coin_name: "eth" address_type: 200)])
		--assert y = x
===end-group===

~~~end-file~~~