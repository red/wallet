Red []

#include %../../../quick-test/quick-test.red
#include %../../../Libs/ethereum.red
#include %../../../Libs/int256.red

~~~start-file~~~ "ethereum"
===start-group=== "eth-to-wei"

	--test-- "eth-to-wei-1"
		etw1-eth: "0.000000000000000001"
		etw1-wei: to-i256 #{01}
		--assert etw1-wei = eth/eth-to-wei etw1-eth

	--test-- "eth-to-wei-2"
		etw2-eth: "0.000000000000000100"
		etw2-wei: to-i256 100
		--assert etw2-wei = eth/eth-to-wei etw2-eth
		
	--test-- "eth-to-wei-3"
		etw3-eth: "0.123456789012345678"
		etw3-wei: to-i256 #{01B69B4BA630F34E}
		--assert etw3-wei = eth/eth-to-wei etw3-eth
		
	--test-- "eth-to-wei-4"
		etw4-eth: "123456789012345678"
		etw4-wei: to-i256 #{17C6E3BFD70FDEDE6A6D60EC780000} 
		--assert etw4-wei = eth/eth-to-wei etw4-eth
		
===end-group===

~~~end-file~~~
