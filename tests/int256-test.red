Red []

#include %../../red/quick-test/quick-test.red
#include %../libs/int256.red

~~~start-file~~~ "uint256"
===start-group=== "modulo"
	--test-- "modulo-1"
		x: to-i256 #{B9F88101560F9040AA7C5E03310B55ED1FE50E9382D61EE96AA3010AD1564E01}
		y: to-i256 #{4ADDDECCAB07F966545C9249CD1C35E25D6F15ED4090E9AC71AA939EBCC89696}
		z: to-i256 #{243CC367FFFF9D7401C3396F96D2EA286506E2B901B44B90874DD9CD57C520D5}
		--assert z  = mod256 x  y
===end-group===

===start-group=== "Divide"
	--test-- "divide-1"
		x: to-i256 #{01}
		y: to-i256 #{00}
		--assert error? try [ div256 x y ]
	--test-- "divide-2"
		x: to-i256 #{00}
		y: to-i256 #{00}
		--assert error? try [ div256 x y ]
	
===end-group===

~~~end-file~~~
