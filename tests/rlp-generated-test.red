Red []

#include %../../red/quick-test/quick-test.red
#include %../keys/Ledger/rlp.red
#include %../libs/int256.red

~~~start-file~~~ "rlp - generated"

===start-group=== "encode"
	--test-- "encode-1"
		x: "dog"
		y: #{83646f67}
		--assert y = rlp/encode x
	--test-- "encode-2"
		x: "12345678901234567890123456789012345678901234567890123456"
		y: #{b8383132333435363738393031323334353637383930313233343536373839303132333435363738393031323334353637383930313233343536}
		--assert y = rlp/encode x
	--test-- "encode-3"
		x: "123456789012345678901234567890123456789012345678901234567"
		y: #{b839313233343536373839303132333435363738393031323334353637383930313233343536373839303132333435363738393031323334353637}
		--assert y = rlp/encode x
	--test-- "encode-4"
		x: 100
		y: #{64}
		--assert y = rlp/encode x
===end-group===

~~~end-file~~~
