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
	--test-- "modulo-2"
		x: to-i256 #{5840A952480EDC7FF0AAE25E5AC60FE094FEE19AE5729F54E0FB221E3DD23B67}
		y: to-i256 #{6A07A7038A64CB80}
		z: to-i256 #{54AB62BD4AEFE8E7}
		--assert z  = mod256 x  y
	--test-- "modulo-3"
		x: to-i256 #{039254836D4379B83BFF2758BA82BCD09DE52FAEC19F3236F2F2BBCF65C9DA47}
		y: to-i256 #{E0CDF279ABA7B9C8}
		z: to-i256 #{AE44C20D48CFCF37}
		--assert z  = mod256 x  y
	--test-- "modulo-4"
		x: to-i256 #{0582A65B75A4C270F2AE2CFDF618E345D3BDD6E2558D29A103D848AB78DA759A}
		y: to-i256 #{FD26000FA91F6C40}
		z: to-i256 #{13C5B85C375713DA}
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
	--test-- "divide-3"
		x: to-i256 #{1FC9D2903BCEAF9C477894EA17703E2D95F451C391EFE374F8376D426AFD3BCE}
		y: to-i256 #{AF6A8B928648C9D4}
		z: to-i256 #{2E643A2D995E7C5462874B3ED475C1E6236F474C1930454C}
		--assert z  = div256 x  y
	--test-- "divide-4"
		x: to-i256 #{039254836D4379B83BFF2758BA82BCD09DE52FAEC19F3236F2F2BBCF65C9DA47}
		y: to-i256 #{E0CDF279ABA7B9C8}
		z: to-i256 #{04113593CBE37008FC24CE037D4D4C87B0DBBE5E7D787A72}
		--assert z  = div256 x  y
	--test-- "divide-5"
		x: to-i256 #{ED1A39DBCEEF49B6EB321D4C5E4DF20C651691789BF4FD3BF6985F9A08EBC7CC}
		y: to-i256 #{83CFC5C6CADAF602}
		z: to-i256 #{01CC7E044DB69110CAE5ED4BB0DAF48268C543B5B6EDE6FD07}
		--assert z  = div256 x  y
	--test-- "divide-6"
		x: to-i256 #{0582A65B75A4C270F2AE2CFDF618E345D3BDD6E2558D29A103D848AB78DA759A}
		y: to-i256 #{32B6C760C7448456}
		z: to-i256 #{1BD0D828937369D58BC622DF20782AEB00FDC0899FB4E511}
		--assert z  = div256 x  y
	--test-- "divide-7"
		x: to-i256 #{0582A65B75A4C270F2AE2CFDF618E345D3BDD6E2558D29A103D848AB78DA759A}
		y: to-i256 #{FD26000FA91F6C40}
		z: to-i256 #{05928A3945B0F75D7AFC66CE2A17175A2C4CC706A73C74B7}
		--assert z  = div256 x  y
	--test-- "divide-8"
		x: to-i256 #{2D1B32B81AFAEBC555021E4980C9953421890259E2BC921BCF3AC82B88CCF401}
		y: to-i256 #{6BCDB583ABF185C6}
		z: to-i256 #{6B1D03AD95BCECF689C4489EBE494F631B5EDDA2FEA76564}
		--assert z  = div256 x  y
	--test-- "divide-9"
		x: to-i256 #{5840A952480EDC7FF0AAE25E5AC60FE094FEE19AE5729F54E0FB221E3DD23B67}
		y: to-i256 #{0702DF9D88CF598E}
		z: to-i256 #{0C965B2087ABFFBFF5894AD355DD307E936B2FEC9F1797A5DD}
		--assert z  = div256 x  y
	--test-- "divide-10"
		x: to-i256 #{5840A952480EDC7FF0AAE25E5AC60FE094FEE19AE5729F54E0FB221E3DD23B67}
		y: to-i256 #{6A07A7038A64CB80}
		z: to-i256 #{D51406ABAF4E02E3D8CDF5BD08F83D009ECE15752CA81323}
		--assert z  = div256 x  y

===end-group===


===start-group=== "Floats"

	--test-- "fl-1"  --assert 0.0 		== i256-to-float to-i256 0
	--test-- "fl-2"  --assert 1.0 		== i256-to-float to-i256 1
	--test-- "fl-3"  --assert 10.0		== i256-to-float to-i256 10
	--test-- "fl-4"  --assert 100.0		== i256-to-float to-i256 100
	--test-- "fl-5"  --assert 10000.0	== i256-to-float to-i256 10000
	--test-- "fl-6"  --assert 100000.0	== i256-to-float to-i256 100000
	--test-- "fl-7"  --assert 1000000.0	== i256-to-float to-i256 1000000
	--test-- "fl-8"  --assert 32767.0	== i256-to-float to-i256 32767
	--test-- "fl-9"  --assert 32768.0	== i256-to-float to-i256 32768
	--test-- "fl-10" --assert 032769.0	== i256-to-float to-i256 32769
	--test-- "fl-11" --assert 65535.0	== i256-to-float to-i256 65535
	--test-- "fl-12" --assert 65536.0	== i256-to-float to-i256 65536
	--test-- "fl-13" --assert 65537.0	== i256-to-float to-i256 65537

	--test-- "fl-14" --assert (1000000.0 * 1000000.0) 	   = i256-to-float mul256 (to-i256 1000000) to-i256 1000000
	--test-- "fl-15" --assert (123456789.0 * 123456789.0)  = i256-to-float mul256 (to-i256 123456789) to-i256 123456789
	--test-- "fl-16" --assert (1000000000.0 * 123456789.0) = i256-to-float mul256 (to-i256 1000000000) to-i256 123456789

	--test-- "fl-30" --assert 0.0		== i256-to-float to-i256 0.0
	--test-- "fl-31" --assert 1.0		== i256-to-float to-i256 1.0
	--test-- "fl-32" --assert 10.0		== i256-to-float to-i256 10.0
	--test-- "fl-33" --assert 100.0		== i256-to-float to-i256 100.0
	--test-- "fl-34" --assert 10000.0	== i256-to-float to-i256 10000.0
	--test-- "fl-35" --assert 100000.0	== i256-to-float to-i256 100000.0
	--test-- "fl-36" --assert 1000000.0	== i256-to-float to-i256 1000000.0
	--test-- "fl-37" --assert 1e20		== i256-to-float to-i256 1e20

===end-group===

~~~end-file~~~
