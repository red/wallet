Red []

;#include %quick-test/quick-test.red
#include %../int256.red

~~~start-file~~~ "uint256"
===start-group=== "add"
	--test-- "add-1"
		x: to-i256 #{00}
		y: to-i256 #{01}
		z: to-i256 #{01}
		--assert z  = add256 x  y

	--test-- "add-2"
		x: to-i256 #{00}
		y: to-i256 #{02}
		z: to-i256 #{02}
		--assert z  = add256 x  y

	--test-- "add-3"
		x: to-i256 #{00}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{29e42a8d59042cfd}
		--assert z  = add256 x  y

	--test-- "add-4"
		x: to-i256 #{00}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{313e8c305103debc}
		--assert z  = add256 x  y

	--test-- "add-5"
		x: to-i256 #{00}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{47cf2956be337e18}
		--assert z  = add256 x  y

	--test-- "add-6"
		x: to-i256 #{00}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{4261adbfa675703b}
		--assert z  = add256 x  y

	--test-- "add-7"
		x: to-i256 #{00}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{8aaea8e413a5aae3}
		--assert z  = add256 x  y

	--test-- "add-8"
		x: to-i256 #{00}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{cfee9cc0728f738b}
		--assert z  = add256 x  y

	--test-- "add-9"
		x: to-i256 #{00}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{b98f44079672da71}
		--assert z  = add256 x  y

	--test-- "add-10"
		x: to-i256 #{00}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{f456abaafa5235e8}
		--assert z  = add256 x  y

	--test-- "add-11"
		x: to-i256 #{00}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{1869750cb59bdd8e}
		--assert z  = add256 x  y

	--test-- "add-12"
		x: to-i256 #{00}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{46ca311ec9ac6057}
		--assert z  = add256 x  y

	--test-- "add-13"
		x: to-i256 #{00}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		--assert z  = add256 x  y

	--test-- "add-14"
		x: to-i256 #{00}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		--assert z  = add256 x  y

	--test-- "add-15"
		x: to-i256 #{00}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		--assert z  = add256 x  y

	--test-- "add-16"
		x: to-i256 #{00}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		--assert z  = add256 x  y

	--test-- "add-17"
		x: to-i256 #{00}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		--assert z  = add256 x  y

	--test-- "add-18"
		x: to-i256 #{00}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		--assert z  = add256 x  y

	--test-- "add-19"
		x: to-i256 #{00}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		--assert z  = add256 x  y

	--test-- "add-20"
		x: to-i256 #{00}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		--assert z  = add256 x  y

	--test-- "add-21"
		x: to-i256 #{00}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		--assert z  = add256 x  y

	--test-- "add-22"
		x: to-i256 #{00}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		--assert z  = add256 x  y

	--test-- "add-23"
		x: to-i256 #{00}
		y: to-i256 #{01}
		z: to-i256 #{01}
		--assert z  = add256 x  y

	--test-- "add-24"
		x: to-i256 #{00}
		y: to-i256 #{02}
		z: to-i256 #{02}
		--assert z  = add256 x  y

	--test-- "add-25"
		x: to-i256 #{00}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{29e42a8d59042cfd}
		--assert z  = add256 x  y

	--test-- "add-26"
		x: to-i256 #{00}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{313e8c305103debc}
		--assert z  = add256 x  y

	--test-- "add-27"
		x: to-i256 #{00}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{47cf2956be337e18}
		--assert z  = add256 x  y

	--test-- "add-28"
		x: to-i256 #{00}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{4261adbfa675703b}
		--assert z  = add256 x  y

	--test-- "add-29"
		x: to-i256 #{00}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{8aaea8e413a5aae3}
		--assert z  = add256 x  y

	--test-- "add-30"
		x: to-i256 #{00}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{cfee9cc0728f738b}
		--assert z  = add256 x  y

	--test-- "add-31"
		x: to-i256 #{00}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{b98f44079672da71}
		--assert z  = add256 x  y

	--test-- "add-32"
		x: to-i256 #{00}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{f456abaafa5235e8}
		--assert z  = add256 x  y

	--test-- "add-33"
		x: to-i256 #{00}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{1869750cb59bdd8e}
		--assert z  = add256 x  y

	--test-- "add-34"
		x: to-i256 #{00}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{46ca311ec9ac6057}
		--assert z  = add256 x  y

	--test-- "add-35"
		x: to-i256 #{00}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		--assert z  = add256 x  y

	--test-- "add-36"
		x: to-i256 #{00}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		--assert z  = add256 x  y

	--test-- "add-37"
		x: to-i256 #{00}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		--assert z  = add256 x  y

	--test-- "add-38"
		x: to-i256 #{00}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		--assert z  = add256 x  y

	--test-- "add-39"
		x: to-i256 #{00}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		--assert z  = add256 x  y

	--test-- "add-40"
		x: to-i256 #{00}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		--assert z  = add256 x  y

	--test-- "add-41"
		x: to-i256 #{00}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		--assert z  = add256 x  y

	--test-- "add-42"
		x: to-i256 #{00}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		--assert z  = add256 x  y

	--test-- "add-43"
		x: to-i256 #{00}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		--assert z  = add256 x  y

	--test-- "add-44"
		x: to-i256 #{00}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		--assert z  = add256 x  y

	--test-- "add-45"
		x: to-i256 #{01}
		y: to-i256 #{00}
		z: to-i256 #{01}
		--assert z  = add256 x  y

	--test-- "add-46"
		x: to-i256 #{01}
		y: to-i256 #{00}
		z: to-i256 #{01}
		--assert z  = add256 x  y

	--test-- "add-47"
		x: to-i256 #{01}
		y: to-i256 #{02}
		z: to-i256 #{03}
		--assert z  = add256 x  y

	--test-- "add-48"
		x: to-i256 #{01}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{29e42a8d59042cfe}
		--assert z  = add256 x  y

	--test-- "add-49"
		x: to-i256 #{01}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{313e8c305103debd}
		--assert z  = add256 x  y

	--test-- "add-50"
		x: to-i256 #{01}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{47cf2956be337e19}
		--assert z  = add256 x  y

	--test-- "add-51"
		x: to-i256 #{01}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{4261adbfa675703c}
		--assert z  = add256 x  y

	--test-- "add-52"
		x: to-i256 #{01}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{8aaea8e413a5aae4}
		--assert z  = add256 x  y

	--test-- "add-53"
		x: to-i256 #{01}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{cfee9cc0728f738c}
		--assert z  = add256 x  y

	--test-- "add-54"
		x: to-i256 #{01}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{b98f44079672da72}
		--assert z  = add256 x  y

	--test-- "add-55"
		x: to-i256 #{01}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{f456abaafa5235e9}
		--assert z  = add256 x  y

	--test-- "add-56"
		x: to-i256 #{01}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{1869750cb59bdd8f}
		--assert z  = add256 x  y

	--test-- "add-57"
		x: to-i256 #{01}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{46ca311ec9ac6058}
		--assert z  = add256 x  y

	--test-- "add-58"
		x: to-i256 #{01}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6d}
		--assert z  = add256 x  y

	--test-- "add-59"
		x: to-i256 #{01}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0b}
		--assert z  = add256 x  y

	--test-- "add-60"
		x: to-i256 #{01}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face4}
		--assert z  = add256 x  y

	--test-- "add-61"
		x: to-i256 #{01}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4124}
		--assert z  = add256 x  y

	--test-- "add-62"
		x: to-i256 #{01}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b5}
		--assert z  = add256 x  y

	--test-- "add-63"
		x: to-i256 #{01}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe213}
		--assert z  = add256 x  y

	--test-- "add-64"
		x: to-i256 #{01}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1f}
		--assert z  = add256 x  y

	--test-- "add-65"
		x: to-i256 #{01}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f9}
		--assert z  = add256 x  y

	--test-- "add-66"
		x: to-i256 #{01}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649432}
		--assert z  = add256 x  y

	--test-- "add-67"
		x: to-i256 #{01}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9c0}
		--assert z  = add256 x  y

	--test-- "add-68"
		x: to-i256 #{02}
		y: to-i256 #{00}
		z: to-i256 #{02}
		--assert z  = add256 x  y

	--test-- "add-69"
		x: to-i256 #{02}
		y: to-i256 #{00}
		z: to-i256 #{02}
		--assert z  = add256 x  y

	--test-- "add-70"
		x: to-i256 #{02}
		y: to-i256 #{01}
		z: to-i256 #{03}
		--assert z  = add256 x  y

	--test-- "add-71"
		x: to-i256 #{02}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{29e42a8d59042cff}
		--assert z  = add256 x  y

	--test-- "add-72"
		x: to-i256 #{02}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{313e8c305103debe}
		--assert z  = add256 x  y

	--test-- "add-73"
		x: to-i256 #{02}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{47cf2956be337e1a}
		--assert z  = add256 x  y

	--test-- "add-74"
		x: to-i256 #{02}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{4261adbfa675703d}
		--assert z  = add256 x  y

	--test-- "add-75"
		x: to-i256 #{02}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{8aaea8e413a5aae5}
		--assert z  = add256 x  y

	--test-- "add-76"
		x: to-i256 #{02}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{cfee9cc0728f738d}
		--assert z  = add256 x  y

	--test-- "add-77"
		x: to-i256 #{02}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{b98f44079672da73}
		--assert z  = add256 x  y

	--test-- "add-78"
		x: to-i256 #{02}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{f456abaafa5235ea}
		--assert z  = add256 x  y

	--test-- "add-79"
		x: to-i256 #{02}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{1869750cb59bdd90}
		--assert z  = add256 x  y

	--test-- "add-80"
		x: to-i256 #{02}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{46ca311ec9ac6059}
		--assert z  = add256 x  y

	--test-- "add-81"
		x: to-i256 #{02}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6e}
		--assert z  = add256 x  y

	--test-- "add-82"
		x: to-i256 #{02}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0c}
		--assert z  = add256 x  y

	--test-- "add-83"
		x: to-i256 #{02}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face5}
		--assert z  = add256 x  y

	--test-- "add-84"
		x: to-i256 #{02}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4125}
		--assert z  = add256 x  y

	--test-- "add-85"
		x: to-i256 #{02}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b6}
		--assert z  = add256 x  y

	--test-- "add-86"
		x: to-i256 #{02}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe214}
		--assert z  = add256 x  y

	--test-- "add-87"
		x: to-i256 #{02}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa20}
		--assert z  = add256 x  y

	--test-- "add-88"
		x: to-i256 #{02}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333fa}
		--assert z  = add256 x  y

	--test-- "add-89"
		x: to-i256 #{02}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649433}
		--assert z  = add256 x  y

	--test-- "add-90"
		x: to-i256 #{02}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9c1}
		--assert z  = add256 x  y

	--test-- "add-91"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{00}
		z: to-i256 #{29e42a8d59042cfd}
		--assert z  = add256 x  y

	--test-- "add-92"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{00}
		z: to-i256 #{29e42a8d59042cfd}
		--assert z  = add256 x  y

	--test-- "add-93"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{01}
		z: to-i256 #{29e42a8d59042cfe}
		--assert z  = add256 x  y

	--test-- "add-94"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{02}
		z: to-i256 #{29e42a8d59042cff}
		--assert z  = add256 x  y

	--test-- "add-95"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{5b22b6bdaa080bb9}
		--assert z  = add256 x  y

	--test-- "add-96"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{71b353e41737ab15}
		--assert z  = add256 x  y

	--test-- "add-97"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{6c45d84cff799d38}
		--assert z  = add256 x  y

	--test-- "add-98"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{b492d3716ca9d7e0}
		--assert z  = add256 x  y

	--test-- "add-99"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{f9d2c74dcb93a088}
		--assert z  = add256 x  y

	--test-- "add-100"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{e3736e94ef77076e}
		--assert z  = add256 x  y

	--test-- "add-101"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{011e3ad638535662e5}
		--assert z  = add256 x  y

	--test-- "add-102"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{424d9f9a0ea00a8b}
		--assert z  = add256 x  y

	--test-- "add-103"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{70ae5bac22b08d54}
		--assert z  = add256 x  y

	--test-- "add-104"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f726778912255a35d869}
		--assert z  = add256 x  y

	--test-- "add-105"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65f0ba86207fbb1907}
		--assert z  = add256 x  y

	--test-- "add-106"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38ef0b3879daa773d9e0}
		--assert z  = add256 x  y

	--test-- "add-107"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb526788e6a3ef6e20}
		--assert z  = add256 x  y

	--test-- "add-108"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5ca2ea304cb556a6b1}
		--assert z  = add256 x  y

	--test-- "add-109"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a972371788abd40f0f}
		--assert z  = add256 x  y

	--test-- "add-110"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab7a46c8fdfc3dd71b}
		--assert z  = add256 x  y

	--test-- "add-111"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042e59ffbabc37760f5}
		--assert z  = add256 x  y

	--test-- "add-112"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab34acee27bab68c12e}
		--assert z  = add256 x  y

	--test-- "add-113"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c940b0ef8d2fe5e6bc}
		--assert z  = add256 x  y

	--test-- "add-114"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{00}
		z: to-i256 #{313e8c305103debc}
		--assert z  = add256 x  y

	--test-- "add-115"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{00}
		z: to-i256 #{313e8c305103debc}
		--assert z  = add256 x  y

	--test-- "add-116"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{01}
		z: to-i256 #{313e8c305103debd}
		--assert z  = add256 x  y

	--test-- "add-117"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{02}
		z: to-i256 #{313e8c305103debe}
		--assert z  = add256 x  y

	--test-- "add-118"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{5b22b6bdaa080bb9}
		--assert z  = add256 x  y

	--test-- "add-119"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{790db5870f375cd4}
		--assert z  = add256 x  y

	--test-- "add-120"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{73a039eff7794ef7}
		--assert z  = add256 x  y

	--test-- "add-121"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{bbed351464a9899f}
		--assert z  = add256 x  y

	--test-- "add-122"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{01012d28f0c3935247}
		--assert z  = add256 x  y

	--test-- "add-123"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{eacdd037e776b92d}
		--assert z  = add256 x  y

	--test-- "add-124"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{01259537db4b5614a4}
		--assert z  = add256 x  y

	--test-- "add-125"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{49a8013d069fbc4a}
		--assert z  = add256 x  y

	--test-- "add-126"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{7808bd4f1ab03f13}
		--assert z  = add256 x  y

	--test-- "add-127"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7267ee373c852358a28}
		--assert z  = add256 x  y

	--test-- "add-128"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65f814e7c377bacac6}
		--assert z  = add256 x  y

	--test-- "add-129"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38ef1292db7d9f738b9f}
		--assert z  = add256 x  y

	--test-- "add-130"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb59c1ea899bef1fdf}
		--assert z  = add256 x  y

	--test-- "add-131"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5caa4491efad565870}
		--assert z  = add256 x  y

	--test-- "add-132"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a97991792ba3d3c0ce}
		--assert z  = add256 x  y

	--test-- "add-133"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab81a12aa0f43d88da}
		--assert z  = add256 x  y

	--test-- "add-134"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042ecfa5d4ebb7712b4}
		--assert z  = add256 x  y

	--test-- "add-135"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab35229441ea36872ed}
		--assert z  = add256 x  y

	--test-- "add-136"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c9480b513027e5987b}
		--assert z  = add256 x  y

	--test-- "add-137"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{00}
		z: to-i256 #{47cf2956be337e18}
		--assert z  = add256 x  y

	--test-- "add-138"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{00}
		z: to-i256 #{47cf2956be337e18}
		--assert z  = add256 x  y

	--test-- "add-139"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{01}
		z: to-i256 #{47cf2956be337e19}
		--assert z  = add256 x  y

	--test-- "add-140"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{02}
		z: to-i256 #{47cf2956be337e1a}
		--assert z  = add256 x  y

	--test-- "add-141"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{71b353e41737ab15}
		--assert z  = add256 x  y

	--test-- "add-142"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{790db5870f375cd4}
		--assert z  = add256 x  y

	--test-- "add-143"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{8a30d71664a8ee53}
		--assert z  = add256 x  y

	--test-- "add-144"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{d27dd23ad1d928fb}
		--assert z  = add256 x  y

	--test-- "add-145"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{0117bdc61730c2f1a3}
		--assert z  = add256 x  y

	--test-- "add-146"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{01015e6d5e54a65889}
		--assert z  = add256 x  y

	--test-- "add-147"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{013c25d501b885b400}
		--assert z  = add256 x  y

	--test-- "add-148"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{60389e6373cf5ba6}
		--assert z  = add256 x  y

	--test-- "add-149"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{8e995a7587dfde6f}
		--assert z  = add256 x  y

	--test-- "add-150"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f726957410eebf652984}
		--assert z  = add256 x  y

	--test-- "add-151"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a660ea584e9e4ea6a22}
		--assert z  = add256 x  y

	--test-- "add-152"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38ef292378a40ca32afb}
		--assert z  = add256 x  y

	--test-- "add-153"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb705287b0091ebf3b}
		--assert z  = add256 x  y

	--test-- "add-154"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5cc0d52f161a85f7cc}
		--assert z  = add256 x  y

	--test-- "add-155"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a9902216521103602a}
		--assert z  = add256 x  y

	--test-- "add-156"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab9831c7c7616d2836}
		--assert z  = add256 x  y

	--test-- "add-157"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7043038afa7528a6b210}
		--assert z  = add256 x  y

	--test-- "add-158"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab368b9e14510981249}
		--assert z  = add256 x  y

	--test-- "add-159"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c95e9bee56951537d7}
		--assert z  = add256 x  y

	--test-- "add-160"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{00}
		z: to-i256 #{4261adbfa675703b}
		--assert z  = add256 x  y

	--test-- "add-161"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{00}
		z: to-i256 #{4261adbfa675703b}
		--assert z  = add256 x  y

	--test-- "add-162"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{01}
		z: to-i256 #{4261adbfa675703c}
		--assert z  = add256 x  y

	--test-- "add-163"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{02}
		z: to-i256 #{4261adbfa675703d}
		--assert z  = add256 x  y

	--test-- "add-164"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{6c45d84cff799d38}
		--assert z  = add256 x  y

	--test-- "add-165"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{73a039eff7794ef7}
		--assert z  = add256 x  y

	--test-- "add-166"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{8a30d71664a8ee53}
		--assert z  = add256 x  y

	--test-- "add-167"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{cd1056a3ba1b1b1e}
		--assert z  = add256 x  y

	--test-- "add-168"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{0112504a801904e3c6}
		--assert z  = add256 x  y

	--test-- "add-169"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{fbf0f1c73ce84aac}
		--assert z  = add256 x  y

	--test-- "add-170"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{0136b8596aa0c7a623}
		--assert z  = add256 x  y

	--test-- "add-171"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{5acb22cc5c114dc9}
		--assert z  = add256 x  y

	--test-- "add-172"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{892bdede7021d092}
		--assert z  = add256 x  y

	--test-- "add-173"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f72690069557a7a71ba7}
		--assert z  = add256 x  y

	--test-- "add-174"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a6609380952cd2c5c45}
		--assert z  = add256 x  y

	--test-- "add-175"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38ef23b5fd0cf4e51d1e}
		--assert z  = add256 x  y

	--test-- "add-176"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb6ae50c18f160b15e}
		--assert z  = add256 x  y

	--test-- "add-177"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5cbb67b37f02c7e9ef}
		--assert z  = add256 x  y

	--test-- "add-178"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a98ab49abaf945524d}
		--assert z  = add256 x  y

	--test-- "add-179"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab92c44c3049af1a59}
		--assert z  = add256 x  y

	--test-- "add-180"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042fe1d7ede10e8a433}
		--assert z  = add256 x  y

	--test-- "add-181"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab3634c65adf8da046c}
		--assert z  = add256 x  y

	--test-- "add-182"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c9592e72bf7d5729fa}
		--assert z  = add256 x  y

	--test-- "add-183"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{00}
		z: to-i256 #{8aaea8e413a5aae3}
		--assert z  = add256 x  y

	--test-- "add-184"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{00}
		z: to-i256 #{8aaea8e413a5aae3}
		--assert z  = add256 x  y

	--test-- "add-185"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{01}
		z: to-i256 #{8aaea8e413a5aae4}
		--assert z  = add256 x  y

	--test-- "add-186"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{02}
		z: to-i256 #{8aaea8e413a5aae5}
		--assert z  = add256 x  y

	--test-- "add-187"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{b492d3716ca9d7e0}
		--assert z  = add256 x  y

	--test-- "add-188"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{bbed351464a9899f}
		--assert z  = add256 x  y

	--test-- "add-189"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{d27dd23ad1d928fb}
		--assert z  = add256 x  y

	--test-- "add-190"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{cd1056a3ba1b1b1e}
		--assert z  = add256 x  y

	--test-- "add-191"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{015a9d45a486351e6e}
		--assert z  = add256 x  y

	--test-- "add-192"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{01443decebaa188554}
		--assert z  = add256 x  y

	--test-- "add-193"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{017f05548f0df7e0cb}
		--assert z  = add256 x  y

	--test-- "add-194"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{a3181df0c9418871}
		--assert z  = add256 x  y

	--test-- "add-195"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{d178da02dd520b3a}
		--assert z  = add256 x  y

	--test-- "add-196"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f726d853907c14d7564f}
		--assert z  = add256 x  y

	--test-- "add-197"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a66518504773a5c96ed}
		--assert z  = add256 x  y

	--test-- "add-198"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38ef6c02f831621557c6}
		--assert z  = add256 x  y

	--test-- "add-199"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bbb332073d5e90ec06}
		--assert z  = add256 x  y

	--test-- "add-200"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5d03b4aea36ff82497}
		--assert z  = add256 x  y

	--test-- "add-201"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a9d30195df66758cf5}
		--assert z  = add256 x  y

	--test-- "add-202"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edabdb114754b6df5501}
		--assert z  = add256 x  y

	--test-- "add-203"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7043466a7a027e18dedb}
		--assert z  = add256 x  y

	--test-- "add-204"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab3ab9960d2660a3f14}
		--assert z  = add256 x  y

	--test-- "add-205"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c9a17b6de3ea8764a2}
		--assert z  = add256 x  y

	--test-- "add-206"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{00}
		z: to-i256 #{cfee9cc0728f738b}
		--assert z  = add256 x  y

	--test-- "add-207"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{00}
		z: to-i256 #{cfee9cc0728f738b}
		--assert z  = add256 x  y

	--test-- "add-208"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{01}
		z: to-i256 #{cfee9cc0728f738c}
		--assert z  = add256 x  y

	--test-- "add-209"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{02}
		z: to-i256 #{cfee9cc0728f738d}
		--assert z  = add256 x  y

	--test-- "add-210"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{f9d2c74dcb93a088}
		--assert z  = add256 x  y

	--test-- "add-211"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{01012d28f0c3935247}
		--assert z  = add256 x  y

	--test-- "add-212"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{0117bdc61730c2f1a3}
		--assert z  = add256 x  y

	--test-- "add-213"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{0112504a801904e3c6}
		--assert z  = add256 x  y

	--test-- "add-214"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{015a9d45a486351e6e}
		--assert z  = add256 x  y

	--test-- "add-215"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{01897de0c809024dfc}
		--assert z  = add256 x  y

	--test-- "add-216"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{01c445486b6ce1a973}
		--assert z  = add256 x  y

	--test-- "add-217"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{e85811cd282b5119}
		--assert z  = add256 x  y

	--test-- "add-218"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{0116b8cddf3c3bd3e2}
		--assert z  = add256 x  y

	--test-- "add-219"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7271d93845873c11ef7}
		--assert z  = add256 x  y

	--test-- "add-220"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a6696c4f85399465f95}
		--assert z  = add256 x  y

	--test-- "add-221"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38efb142ec0dc0ff206e}
		--assert z  = add256 x  y

	--test-- "add-222"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bbf871fb19bd7ab4ae}
		--assert z  = add256 x  y

	--test-- "add-223"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5d48f4a27fcee1ed3f}
		--assert z  = add256 x  y

	--test-- "add-224"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96aa184189bbc55f559d}
		--assert z  = add256 x  y

	--test-- "add-225"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edac20513b3115c91da9}
		--assert z  = add256 x  y

	--test-- "add-226"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d70438baa6ddedd02a783}
		--assert z  = add256 x  y

	--test-- "add-227"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab3f0d954aec4f407bc}
		--assert z  = add256 x  y

	--test-- "add-228"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c9e6bb61c049712d4a}
		--assert z  = add256 x  y

	--test-- "add-229"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{00}
		z: to-i256 #{b98f44079672da71}
		--assert z  = add256 x  y

	--test-- "add-230"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{00}
		z: to-i256 #{b98f44079672da71}
		--assert z  = add256 x  y

	--test-- "add-231"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{01}
		z: to-i256 #{b98f44079672da72}
		--assert z  = add256 x  y

	--test-- "add-232"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{02}
		z: to-i256 #{b98f44079672da73}
		--assert z  = add256 x  y

	--test-- "add-233"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{e3736e94ef77076e}
		--assert z  = add256 x  y

	--test-- "add-234"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{eacdd037e776b92d}
		--assert z  = add256 x  y

	--test-- "add-235"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{01015e6d5e54a65889}
		--assert z  = add256 x  y

	--test-- "add-236"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{fbf0f1c73ce84aac}
		--assert z  = add256 x  y

	--test-- "add-237"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{01443decebaa188554}
		--assert z  = add256 x  y

	--test-- "add-238"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{01897de0c809024dfc}
		--assert z  = add256 x  y

	--test-- "add-239"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{01ade5efb290c51059}
		--assert z  = add256 x  y

	--test-- "add-240"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{d1f8b9144c0eb7ff}
		--assert z  = add256 x  y

	--test-- "add-241"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{0100597526601f3ac8}
		--assert z  = add256 x  y

	--test-- "add-242"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f72707342b9f97a485dd}
		--assert z  = add256 x  y

	--test-- "add-243"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a6680659f9abd29c67b}
		--assert z  = add256 x  y

	--test-- "add-244"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38ef9ae39354e4e28754}
		--assert z  = add256 x  y

	--test-- "add-245"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bbe212a260e15e1b94}
		--assert z  = add256 x  y

	--test-- "add-246"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5d329549c6f2c55425}
		--assert z  = add256 x  y

	--test-- "add-247"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96aa01e23102e942bc83}
		--assert z  = add256 x  y

	--test-- "add-248"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edac09f1e27839ac848f}
		--assert z  = add256 x  y

	--test-- "add-249"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7043754b152600e60e69}
		--assert z  = add256 x  y

	--test-- "add-250"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab3da79fbf5e8d76ea2}
		--assert z  = add256 x  y

	--test-- "add-251"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c9d05c09076d549430}
		--assert z  = add256 x  y

	--test-- "add-252"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{00}
		z: to-i256 #{f456abaafa5235e8}
		--assert z  = add256 x  y

	--test-- "add-253"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{00}
		z: to-i256 #{f456abaafa5235e8}
		--assert z  = add256 x  y

	--test-- "add-254"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{01}
		z: to-i256 #{f456abaafa5235e9}
		--assert z  = add256 x  y

	--test-- "add-255"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{02}
		z: to-i256 #{f456abaafa5235ea}
		--assert z  = add256 x  y

	--test-- "add-256"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{011e3ad638535662e5}
		--assert z  = add256 x  y

	--test-- "add-257"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{01259537db4b5614a4}
		--assert z  = add256 x  y

	--test-- "add-258"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{013c25d501b885b400}
		--assert z  = add256 x  y

	--test-- "add-259"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{0136b8596aa0c7a623}
		--assert z  = add256 x  y

	--test-- "add-260"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{017f05548f0df7e0cb}
		--assert z  = add256 x  y

	--test-- "add-261"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{01c445486b6ce1a973}
		--assert z  = add256 x  y

	--test-- "add-262"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{01ade5efb290c51059}
		--assert z  = add256 x  y

	--test-- "add-263"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{010cc020b7afee1376}
		--assert z  = add256 x  y

	--test-- "add-264"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{013b20dcc9c3fe963f}
		--assert z  = add256 x  y

	--test-- "add-265"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f72741fb9342fb83e154}
		--assert z  = add256 x  y

	--test-- "add-266"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a66bb2d073e210921f2}
		--assert z  = add256 x  y

	--test-- "add-267"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38efd5aafaf848c1e2cb}
		--assert z  = add256 x  y

	--test-- "add-268"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bc1cda0a04453d770b}
		--assert z  = add256 x  y

	--test-- "add-269"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5d6d5cb16a56a4af9c}
		--assert z  = add256 x  y

	--test-- "add-270"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96aa3ca998a64d2217fa}
		--assert z  = add256 x  y

	--test-- "add-271"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edac44b94a1b9d8be006}
		--assert z  = add256 x  y

	--test-- "add-272"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7043b0127cc964c569e0}
		--assert z  = add256 x  y

	--test-- "add-273"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab4154163994cb6ca19}
		--assert z  = add256 x  y

	--test-- "add-274"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454ca0b2370aad133efa7}
		--assert z  = add256 x  y

	--test-- "add-275"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{00}
		z: to-i256 #{1869750cb59bdd8e}
		--assert z  = add256 x  y

	--test-- "add-276"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{00}
		z: to-i256 #{1869750cb59bdd8e}
		--assert z  = add256 x  y

	--test-- "add-277"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{01}
		z: to-i256 #{1869750cb59bdd8f}
		--assert z  = add256 x  y

	--test-- "add-278"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{02}
		z: to-i256 #{1869750cb59bdd90}
		--assert z  = add256 x  y

	--test-- "add-279"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{424d9f9a0ea00a8b}
		--assert z  = add256 x  y

	--test-- "add-280"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{49a8013d069fbc4a}
		--assert z  = add256 x  y

	--test-- "add-281"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{60389e6373cf5ba6}
		--assert z  = add256 x  y

	--test-- "add-282"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{5acb22cc5c114dc9}
		--assert z  = add256 x  y

	--test-- "add-283"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{a3181df0c9418871}
		--assert z  = add256 x  y

	--test-- "add-284"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{e85811cd282b5119}
		--assert z  = add256 x  y

	--test-- "add-285"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{d1f8b9144c0eb7ff}
		--assert z  = add256 x  y

	--test-- "add-286"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{010cc020b7afee1376}
		--assert z  = add256 x  y

	--test-- "add-287"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{5f33a62b7f483de5}
		--assert z  = add256 x  y

	--test-- "add-288"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f726660e5ca4b6cd88fa}
		--assert z  = add256 x  y

	--test-- "add-289"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65df3fd09fdc52c998}
		--assert z  = add256 x  y

	--test-- "add-290"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eef9bdc45a040b8a71}
		--assert z  = add256 x  y

	--test-- "add-291"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb40ecd36600871eb1}
		--assert z  = add256 x  y

	--test-- "add-292"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c916f7acc11ee5742}
		--assert z  = add256 x  y

	--test-- "add-293"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a960bc6208086bbfa0}
		--assert z  = add256 x  y

	--test-- "add-294"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab68cc137d58d587ac}
		--assert z  = add256 x  y

	--test-- "add-295"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042d425462b200f1186}
		--assert z  = add256 x  y

	--test-- "add-296"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab339542cfb080071bf}
		--assert z  = add256 x  y

	--test-- "add-297"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c92f363a0c8c7d974d}
		--assert z  = add256 x  y

	--test-- "add-298"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{00}
		z: to-i256 #{46ca311ec9ac6057}
		--assert z  = add256 x  y

	--test-- "add-299"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{00}
		z: to-i256 #{46ca311ec9ac6057}
		--assert z  = add256 x  y

	--test-- "add-300"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{01}
		z: to-i256 #{46ca311ec9ac6058}
		--assert z  = add256 x  y

	--test-- "add-301"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{02}
		z: to-i256 #{46ca311ec9ac6059}
		--assert z  = add256 x  y

	--test-- "add-302"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{70ae5bac22b08d54}
		--assert z  = add256 x  y

	--test-- "add-303"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{7808bd4f1ab03f13}
		--assert z  = add256 x  y

	--test-- "add-304"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{8e995a7587dfde6f}
		--assert z  = add256 x  y

	--test-- "add-305"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{892bdede7021d092}
		--assert z  = add256 x  y

	--test-- "add-306"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{d178da02dd520b3a}
		--assert z  = add256 x  y

	--test-- "add-307"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{0116b8cddf3c3bd3e2}
		--assert z  = add256 x  y

	--test-- "add-308"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{0100597526601f3ac8}
		--assert z  = add256 x  y

	--test-- "add-309"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{013b20dcc9c3fe963f}
		--assert z  = add256 x  y

	--test-- "add-310"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{5f33a62b7f483de5}
		--assert z  = add256 x  y

	--test-- "add-311"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f726946f18b6cade0bc3}
		--assert z  = add256 x  y

	--test-- "add-312"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a660da08cb1f0634c61}
		--assert z  = add256 x  y

	--test-- "add-313"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38ef281e806c181c0d3a}
		--assert z  = add256 x  y

	--test-- "add-314"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb6f4d8f781497a17a}
		--assert z  = add256 x  y

	--test-- "add-315"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5cbfd036de25feda0b}
		--assert z  = add256 x  y

	--test-- "add-316"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a98f1d1e1a1c7c4269}
		--assert z  = add256 x  y

	--test-- "add-317"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab972ccf8f6ce60a75}
		--assert z  = add256 x  y

	--test-- "add-318"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d70430286023d341f944f}
		--assert z  = add256 x  y

	--test-- "add-319"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab367b4e90d1c10f488}
		--assert z  = add256 x  y

	--test-- "add-320"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c95d96f61ea08e1a16}
		--assert z  = add256 x  y

	--test-- "add-321"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{00}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		--assert z  = add256 x  y

	--test-- "add-322"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{00}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		--assert z  = add256 x  y

	--test-- "add-323"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{01}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6d}
		--assert z  = add256 x  y

	--test-- "add-324"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{02}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6e}
		--assert z  = add256 x  y

	--test-- "add-325"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f726778912255a35d869}
		--assert z  = add256 x  y

	--test-- "add-326"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7267ee373c852358a28}
		--assert z  = add256 x  y

	--test-- "add-327"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f726957410eebf652984}
		--assert z  = add256 x  y

	--test-- "add-328"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f72690069557a7a71ba7}
		--assert z  = add256 x  y

	--test-- "add-329"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f726d853907c14d7564f}
		--assert z  = add256 x  y

	--test-- "add-330"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7271d93845873c11ef7}
		--assert z  = add256 x  y

	--test-- "add-331"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f72707342b9f97a485dd}
		--assert z  = add256 x  y

	--test-- "add-332"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f72741fb9342fb83e154}
		--assert z  = add256 x  y

	--test-- "add-333"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f726660e5ca4b6cd88fa}
		--assert z  = add256 x  y

	--test-- "add-334"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f726946f18b6cade0bc3}
		--assert z  = add256 x  y

	--test-- "add-335"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{beab1970b7995ef3c1ab40a20d308971c793b37666d7818c147b432b27e89776}
		--assert z  = add256 x  y

	--test-- "add-336"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{8cc5ab5f658ee0a22cd931e5f30dcf1db84deb58486f30152ef936e54fa1584f}
		--assert z  = add256 x  y

	--test-- "add-337"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{a9044bc350677bbbcf721abe4ae73db8d69c891dfabc8dcf95f7d49354018d7e}
		--assert z  = add256 x  y

	--test-- "add-338"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{c10935b91d52fef40c9f7002a570423b558888debad2e4d19e078608a46b558a}
		--assert z  = add256 x  y

	--test-- "add-339"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{a5a3288fcde2c1addf765443be9fe6d3f6af0ec2b5ce67690960b8b66ba4df64}
		--assert z  = add256 x  y

	--test-- "add-340"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{00}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		--assert z  = add256 x  y

	--test-- "add-341"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{00}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		--assert z  = add256 x  y

	--test-- "add-342"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{01}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0b}
		--assert z  = add256 x  y

	--test-- "add-343"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{02}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0c}
		--assert z  = add256 x  y

	--test-- "add-344"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65f0ba86207fbb1907}
		--assert z  = add256 x  y

	--test-- "add-345"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65f814e7c377bacac6}
		--assert z  = add256 x  y

	--test-- "add-346"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a660ea584e9e4ea6a22}
		--assert z  = add256 x  y

	--test-- "add-347"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a6609380952cd2c5c45}
		--assert z  = add256 x  y

	--test-- "add-348"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a66518504773a5c96ed}
		--assert z  = add256 x  y

	--test-- "add-349"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a6696c4f85399465f95}
		--assert z  = add256 x  y

	--test-- "add-350"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a6680659f9abd29c67b}
		--assert z  = add256 x  y

	--test-- "add-351"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a66bb2d073e210921f2}
		--assert z  = add256 x  y

	--test-- "add-352"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65df3fd09fdc52c998}
		--assert z  = add256 x  y

	--test-- "add-353"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a660da08cb1f0634c61}
		--assert z  = add256 x  y

	--test-- "add-354"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{beab1970b7995ef3c1ab40a20d308971c793b37666d7818c147b432b27e89776}
		--assert z  = add256 x  y

	--test-- "add-355"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{61e3d57eeb4638164a28daef249bcc3c1f3f87ef05c4c354a82aaae0752698ed}
		--assert z  = add256 x  y

	--test-- "add-356"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{de65aaac1ae779e1035c90112698d546c99268ea4777e220ef59b9ec71a22d2d}
		--assert z  = add256 x  y

	--test-- "add-357"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{e18e8a2306057b6085650ec9b7e579dd76f28820fdc3f8c23fdc6152830965be}
		--assert z  = add256 x  y

	--test-- "add-358"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{7e2275e2d61ed32fecc1c3c77c753ad73d8e25b4b812210f0f29488e7986ce1c}
		--assert z  = add256 x  y

	--test-- "add-359"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{96275fd8a30a566829ef190bd6fe3f59bc7a2575782878111738fa03c9f09628}
		--assert z  = add256 x  y

	--test-- "add-360"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{7ac152af539a1921fcc5fd4cf02de3f25da0ab597323faa882922cb1912a2002}
		--assert z  = add256 x  y

	--test-- "add-361"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{00}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		--assert z  = add256 x  y

	--test-- "add-362"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{00}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		--assert z  = add256 x  y

	--test-- "add-363"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{01}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face4}
		--assert z  = add256 x  y

	--test-- "add-364"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{02}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face5}
		--assert z  = add256 x  y

	--test-- "add-365"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38ef0b3879daa773d9e0}
		--assert z  = add256 x  y

	--test-- "add-366"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38ef1292db7d9f738b9f}
		--assert z  = add256 x  y

	--test-- "add-367"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38ef292378a40ca32afb}
		--assert z  = add256 x  y

	--test-- "add-368"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38ef23b5fd0cf4e51d1e}
		--assert z  = add256 x  y

	--test-- "add-369"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38ef6c02f831621557c6}
		--assert z  = add256 x  y

	--test-- "add-370"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38efb142ec0dc0ff206e}
		--assert z  = add256 x  y

	--test-- "add-371"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38ef9ae39354e4e28754}
		--assert z  = add256 x  y

	--test-- "add-372"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38efd5aafaf848c1e2cb}
		--assert z  = add256 x  y

	--test-- "add-373"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eef9bdc45a040b8a71}
		--assert z  = add256 x  y

	--test-- "add-374"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38ef281e806c181c0d3a}
		--assert z  = add256 x  y

	--test-- "add-375"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{8cc5ab5f658ee0a22cd931e5f30dcf1db84deb58486f30152ef936e54fa1584f}
		--assert z  = add256 x  y

	--test-- "add-376"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{61e3d57eeb4638164a28daef249bcc3c1f3f87ef05c4c354a82aaae0752698ed}
		--assert z  = add256 x  y

	--test-- "add-377"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{ac803c9ac8dcfb8f6e8a81550c761af2ba4ca0cc290f90aa09d7ada6995aee06}
		--assert z  = add256 x  y

	--test-- "add-378"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{afa91c11b3fafd0ef093000d9dc2bf8967acc002df5ba74b5a5a550caac22697}
		--assert z  = add256 x  y

	--test-- "add-379"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{4c3d07d1841454de57efb50b625280832e485d9699a9cf9829a73c48a13f8ef5}
		--assert z  = add256 x  y

	--test-- "add-380"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{6441f1c750ffd816951d0a4fbcdb8505ad345d5759c0269a31b6edbdf1a95701}
		--assert z  = add256 x  y

	--test-- "add-381"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{48dbe49e018f9ad067f3ee90d60b299e4e5ae33b54bba9319d10206bb8e2e0db}
		--assert z  = add256 x  y

	--test-- "add-382"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{f5fd1ff40710ff7f0c2823d8add0cf8abd1a7917670733a2023f073ba0d44114}
		--assert z  = add256 x  y

	--test-- "add-383"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{f3924c5555cf9b8552ee207c0da89b74b254936705428db7f821144d255166a2}
		--assert z  = add256 x  y

	--test-- "add-384"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{00}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		--assert z  = add256 x  y

	--test-- "add-385"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{00}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		--assert z  = add256 x  y

	--test-- "add-386"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{01}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4124}
		--assert z  = add256 x  y

	--test-- "add-387"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{02}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4125}
		--assert z  = add256 x  y

	--test-- "add-388"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb526788e6a3ef6e20}
		--assert z  = add256 x  y

	--test-- "add-389"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb59c1ea899bef1fdf}
		--assert z  = add256 x  y

	--test-- "add-390"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb705287b0091ebf3b}
		--assert z  = add256 x  y

	--test-- "add-391"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb6ae50c18f160b15e}
		--assert z  = add256 x  y

	--test-- "add-392"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bbb332073d5e90ec06}
		--assert z  = add256 x  y

	--test-- "add-393"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bbf871fb19bd7ab4ae}
		--assert z  = add256 x  y

	--test-- "add-394"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bbe212a260e15e1b94}
		--assert z  = add256 x  y

	--test-- "add-395"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bc1cda0a04453d770b}
		--assert z  = add256 x  y

	--test-- "add-396"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb40ecd36600871eb1}
		--assert z  = add256 x  y

	--test-- "add-397"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb6f4d8f781497a17a}
		--assert z  = add256 x  y

	--test-- "add-398"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{de65aaac1ae779e1035c90112698d546c99268ea4777e220ef59b9ec71a22d2d}
		--assert z  = add256 x  y

	--test-- "add-399"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{ac803c9ac8dcfb8f6e8a81550c761af2ba4ca0cc290f90aa09d7ada6995aee06}
		--assert z  = add256 x  y

	--test-- "add-400"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{c8bedcfeb3b596a911236a2d644f898dd89b3e91db5cee6470d64b549dbb2335}
		--assert z  = add256 x  y

	--test-- "add-401"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{e0c3c6f480a119e14e50bf71bed88e1057873e529b73456678e5fcc9ee24eb41}
		--assert z  = add256 x  y

	--test-- "add-402"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{c55db9cb3130dc9b2127a3b2d80832a8f8adc436966ec7fde43f2f77b55e751b}
		--assert z  = add256 x  y

	--test-- "add-403"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{00}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		--assert z  = add256 x  y

	--test-- "add-404"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{00}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		--assert z  = add256 x  y

	--test-- "add-405"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{01}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b5}
		--assert z  = add256 x  y

	--test-- "add-406"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{02}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b6}
		--assert z  = add256 x  y

	--test-- "add-407"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5ca2ea304cb556a6b1}
		--assert z  = add256 x  y

	--test-- "add-408"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5caa4491efad565870}
		--assert z  = add256 x  y

	--test-- "add-409"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5cc0d52f161a85f7cc}
		--assert z  = add256 x  y

	--test-- "add-410"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5cbb67b37f02c7e9ef}
		--assert z  = add256 x  y

	--test-- "add-411"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5d03b4aea36ff82497}
		--assert z  = add256 x  y

	--test-- "add-412"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5d48f4a27fcee1ed3f}
		--assert z  = add256 x  y

	--test-- "add-413"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5d329549c6f2c55425}
		--assert z  = add256 x  y

	--test-- "add-414"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5d6d5cb16a56a4af9c}
		--assert z  = add256 x  y

	--test-- "add-415"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c916f7acc11ee5742}
		--assert z  = add256 x  y

	--test-- "add-416"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5cbfd036de25feda0b}
		--assert z  = add256 x  y

	--test-- "add-417"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{e18e8a2306057b6085650ec9b7e579dd76f28820fdc3f8c23fdc6152830965be}
		--assert z  = add256 x  y

	--test-- "add-418"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{afa91c11b3fafd0ef093000d9dc2bf8967acc002df5ba74b5a5a550caac22697}
		--assert z  = add256 x  y

	--test-- "add-419"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{cbe7bc759ed39828932be8e5f59c2e2485fb5dc891a90505c158f2baaf225bc6}
		--assert z  = add256 x  y

	--test-- "add-420"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{e3eca66b6bbf1b60d0593e2a502532a704e75d8951bf5c07c968a42fff8c23d2}
		--assert z  = add256 x  y

	--test-- "add-421"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{c88699421c4ede1aa330226b6954d73fa60de36d4cbade9f34c1d6ddc6c5adac}
		--assert z  = add256 x  y

	--test-- "add-422"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{00}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		--assert z  = add256 x  y

	--test-- "add-423"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{00}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		--assert z  = add256 x  y

	--test-- "add-424"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{01}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe213}
		--assert z  = add256 x  y

	--test-- "add-425"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{02}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe214}
		--assert z  = add256 x  y

	--test-- "add-426"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a972371788abd40f0f}
		--assert z  = add256 x  y

	--test-- "add-427"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a97991792ba3d3c0ce}
		--assert z  = add256 x  y

	--test-- "add-428"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a9902216521103602a}
		--assert z  = add256 x  y

	--test-- "add-429"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a98ab49abaf945524d}
		--assert z  = add256 x  y

	--test-- "add-430"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a9d30195df66758cf5}
		--assert z  = add256 x  y

	--test-- "add-431"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96aa184189bbc55f559d}
		--assert z  = add256 x  y

	--test-- "add-432"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96aa01e23102e942bc83}
		--assert z  = add256 x  y

	--test-- "add-433"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96aa3ca998a64d2217fa}
		--assert z  = add256 x  y

	--test-- "add-434"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a960bc6208086bbfa0}
		--assert z  = add256 x  y

	--test-- "add-435"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a98f1d1e1a1c7c4269}
		--assert z  = add256 x  y

	--test-- "add-436"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{a9044bc350677bbbcf721abe4ae73db8d69c891dfabc8dcf95f7d49354018d7e}
		--assert z  = add256 x  y

	--test-- "add-437"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{7e2275e2d61ed32fecc1c3c77c753ad73d8e25b4b812210f0f29488e7986ce1c}
		--assert z  = add256 x  y

	--test-- "add-438"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{4c3d07d1841454de57efb50b625280832e485d9699a9cf9829a73c48a13f8ef5}
		--assert z  = add256 x  y

	--test-- "add-439"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{c8bedcfeb3b596a911236a2d644f898dd89b3e91db5cee6470d64b549dbb2335}
		--assert z  = add256 x  y

	--test-- "add-440"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{cbe7bc759ed39828932be8e5f59c2e2485fb5dc891a90505c158f2baaf225bc6}
		--assert z  = add256 x  y

	--test-- "add-441"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{8080922b3bd8733037b5f32814b4f3a0cb82fb1d0c0d845498b58b6bf6098c30}
		--assert z  = add256 x  y

	--test-- "add-442"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{651a8501ec6835ea0a8cd7692de498396ca98101070906ec040ebe19bd43160a}
		--assert z  = add256 x  y

	--test-- "add-443"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{00}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		--assert z  = add256 x  y

	--test-- "add-444"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{00}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		--assert z  = add256 x  y

	--test-- "add-445"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{01}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1f}
		--assert z  = add256 x  y

	--test-- "add-446"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{02}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa20}
		--assert z  = add256 x  y

	--test-- "add-447"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab7a46c8fdfc3dd71b}
		--assert z  = add256 x  y

	--test-- "add-448"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab81a12aa0f43d88da}
		--assert z  = add256 x  y

	--test-- "add-449"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab9831c7c7616d2836}
		--assert z  = add256 x  y

	--test-- "add-450"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab92c44c3049af1a59}
		--assert z  = add256 x  y

	--test-- "add-451"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edabdb114754b6df5501}
		--assert z  = add256 x  y

	--test-- "add-452"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edac20513b3115c91da9}
		--assert z  = add256 x  y

	--test-- "add-453"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edac09f1e27839ac848f}
		--assert z  = add256 x  y

	--test-- "add-454"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edac44b94a1b9d8be006}
		--assert z  = add256 x  y

	--test-- "add-455"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab68cc137d58d587ac}
		--assert z  = add256 x  y

	--test-- "add-456"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab972ccf8f6ce60a75}
		--assert z  = add256 x  y

	--test-- "add-457"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{c10935b91d52fef40c9f7002a570423b558888debad2e4d19e078608a46b558a}
		--assert z  = add256 x  y

	--test-- "add-458"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{96275fd8a30a566829ef190bd6fe3f59bc7a2575782878111738fa03c9f09628}
		--assert z  = add256 x  y

	--test-- "add-459"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{6441f1c750ffd816951d0a4fbcdb8505ad345d5759c0269a31b6edbdf1a95701}
		--assert z  = add256 x  y

	--test-- "add-460"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{e0c3c6f480a119e14e50bf71bed88e1057873e529b73456678e5fcc9ee24eb41}
		--assert z  = add256 x  y

	--test-- "add-461"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{e3eca66b6bbf1b60d0593e2a502532a704e75d8951bf5c07c968a42fff8c23d2}
		--assert z  = add256 x  y

	--test-- "add-462"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{8080922b3bd8733037b5f32814b4f3a0cb82fb1d0c0d845498b58b6bf6098c30}
		--assert z  = add256 x  y

	--test-- "add-463"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{7d1f6ef7b953b92247ba2cad886d9cbbeb9580c1c71f5dee0c1e6f8f0dacde16}
		--assert z  = add256 x  y

	--test-- "add-464"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{00}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		--assert z  = add256 x  y

	--test-- "add-465"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{00}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		--assert z  = add256 x  y

	--test-- "add-466"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{01}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f9}
		--assert z  = add256 x  y

	--test-- "add-467"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{02}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333fa}
		--assert z  = add256 x  y

	--test-- "add-468"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042e59ffbabc37760f5}
		--assert z  = add256 x  y

	--test-- "add-469"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042ecfa5d4ebb7712b4}
		--assert z  = add256 x  y

	--test-- "add-470"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7043038afa7528a6b210}
		--assert z  = add256 x  y

	--test-- "add-471"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042fe1d7ede10e8a433}
		--assert z  = add256 x  y

	--test-- "add-472"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7043466a7a027e18dedb}
		--assert z  = add256 x  y

	--test-- "add-473"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d70438baa6ddedd02a783}
		--assert z  = add256 x  y

	--test-- "add-474"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7043754b152600e60e69}
		--assert z  = add256 x  y

	--test-- "add-475"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7043b0127cc964c569e0}
		--assert z  = add256 x  y

	--test-- "add-476"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042d425462b200f1186}
		--assert z  = add256 x  y

	--test-- "add-477"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d70430286023d341f944f}
		--assert z  = add256 x  y

	--test-- "add-478"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{a5a3288fcde2c1addf765443be9fe6d3f6af0ec2b5ce67690960b8b66ba4df64}
		--assert z  = add256 x  y

	--test-- "add-479"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{7ac152af539a1921fcc5fd4cf02de3f25da0ab597323faa882922cb1912a2002}
		--assert z  = add256 x  y

	--test-- "add-480"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{48dbe49e018f9ad067f3ee90d60b299e4e5ae33b54bba9319d10206bb8e2e0db}
		--assert z  = add256 x  y

	--test-- "add-481"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{c55db9cb3130dc9b2127a3b2d80832a8f8adc436966ec7fde43f2f77b55e751b}
		--assert z  = add256 x  y

	--test-- "add-482"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{c88699421c4ede1aa330226b6954d73fa60de36d4cbade9f34c1d6ddc6c5adac}
		--assert z  = add256 x  y

	--test-- "add-483"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{651a8501ec6835ea0a8cd7692de498396ca98101070906ec040ebe19bd43160a}
		--assert z  = add256 x  y

	--test-- "add-484"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{7d1f6ef7b953b92247ba2cad886d9cbbeb9580c1c71f5dee0c1e6f8f0dacde16}
		--assert z  = add256 x  y

	--test-- "add-485"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{00}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		--assert z  = add256 x  y

	--test-- "add-486"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{00}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		--assert z  = add256 x  y

	--test-- "add-487"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{01}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649432}
		--assert z  = add256 x  y

	--test-- "add-488"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{02}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649433}
		--assert z  = add256 x  y

	--test-- "add-489"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab34acee27bab68c12e}
		--assert z  = add256 x  y

	--test-- "add-490"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab35229441ea36872ed}
		--assert z  = add256 x  y

	--test-- "add-491"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab368b9e14510981249}
		--assert z  = add256 x  y

	--test-- "add-492"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab3634c65adf8da046c}
		--assert z  = add256 x  y

	--test-- "add-493"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab3ab9960d2660a3f14}
		--assert z  = add256 x  y

	--test-- "add-494"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab3f0d954aec4f407bc}
		--assert z  = add256 x  y

	--test-- "add-495"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab3da79fbf5e8d76ea2}
		--assert z  = add256 x  y

	--test-- "add-496"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab4154163994cb6ca19}
		--assert z  = add256 x  y

	--test-- "add-497"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab339542cfb080071bf}
		--assert z  = add256 x  y

	--test-- "add-498"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab367b4e90d1c10f488}
		--assert z  = add256 x  y

	--test-- "add-499"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{f5fd1ff40710ff7f0c2823d8add0cf8abd1a7917670733a2023f073ba0d44114}
		--assert z  = add256 x  y

	--test-- "add-500"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{00}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		--assert z  = add256 x  y

	--test-- "add-501"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{00}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		--assert z  = add256 x  y

	--test-- "add-502"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{01}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9c0}
		--assert z  = add256 x  y

	--test-- "add-503"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{02}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9c1}
		--assert z  = add256 x  y

	--test-- "add-504"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c940b0ef8d2fe5e6bc}
		--assert z  = add256 x  y

	--test-- "add-505"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c9480b513027e5987b}
		--assert z  = add256 x  y

	--test-- "add-506"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c95e9bee56951537d7}
		--assert z  = add256 x  y

	--test-- "add-507"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c9592e72bf7d5729fa}
		--assert z  = add256 x  y

	--test-- "add-508"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c9a17b6de3ea8764a2}
		--assert z  = add256 x  y

	--test-- "add-509"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c9e6bb61c049712d4a}
		--assert z  = add256 x  y

	--test-- "add-510"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c9d05c09076d549430}
		--assert z  = add256 x  y

	--test-- "add-511"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454ca0b2370aad133efa7}
		--assert z  = add256 x  y

	--test-- "add-512"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c92f363a0c8c7d974d}
		--assert z  = add256 x  y

	--test-- "add-513"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c95d96f61ea08e1a16}
		--assert z  = add256 x  y

	--test-- "add-514"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{f3924c5555cf9b8552ee207c0da89b74b254936705428db7f821144d255166a2}
		--assert z  = add256 x  y

===end-group===

===start-group=== "subtract"
	--test-- "subtract-1"
		x: to-i256 #{01}
		y: to-i256 #{00}
		z: to-i256 #{01}
		--assert z  = sub256 x  y

	--test-- "subtract-2"
		x: to-i256 #{01}
		y: to-i256 #{00}
		z: to-i256 #{01}
		--assert z  = sub256 x  y

	--test-- "subtract-3"
		x: to-i256 #{02}
		y: to-i256 #{00}
		z: to-i256 #{02}
		--assert z  = sub256 x  y

	--test-- "subtract-4"
		x: to-i256 #{02}
		y: to-i256 #{00}
		z: to-i256 #{02}
		--assert z  = sub256 x  y

	--test-- "subtract-5"
		x: to-i256 #{02}
		y: to-i256 #{01}
		z: to-i256 #{01}
		--assert z  = sub256 x  y

	--test-- "subtract-6"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{01}
		z: to-i256 #{fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe}
		--assert z  = sub256 x  y

	--test-- "subtract-7"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{02}
		z: to-i256 #{fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd}
		--assert z  = sub256 x  y

	--test-- "subtract-8"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffd61bd572a6fbd302}
		--assert z  = sub256 x  y

	--test-- "subtract-9"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffcec173cfaefc2143}
		--assert z  = sub256 x  y

	--test-- "subtract-10"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffb830d6a941cc81e7}
		--assert z  = sub256 x  y

	--test-- "subtract-11"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffbd9e5240598a8fc4}
		--assert z  = sub256 x  y

	--test-- "subtract-12"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffff7551571bec5a551c}
		--assert z  = sub256 x  y

	--test-- "subtract-13"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffff3011633f8d708c74}
		--assert z  = sub256 x  y

	--test-- "subtract-14"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffff4670bbf8698d258e}
		--assert z  = sub256 x  y

	--test-- "subtract-15"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffff0ba9545505adca17}
		--assert z  = sub256 x  y

	--test-- "subtract-16"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffe7968af34a642271}
		--assert z  = sub256 x  y

	--test-- "subtract-17"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffb935cee136539fa8}
		--assert z  = sub256 x  y

	--test-- "subtract-18"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{8b398857670efc402dd23433922eb9d64faef4902b3f08d9b25b1867fece5493}
		--assert z  = sub256 x  y

	--test-- "subtract-19"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{b61b5e37e157a4cc10828b2a60a0bcb7e8bd57f96de9759a3929a46cd94913f5}
		--assert z  = sub256 x  y

	--test-- "subtract-20"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{e800cc493362231da55499e67ac3770bf80320178c51c7111eabb0b2b190531c}
		--assert z  = sub256 x  y

	--test-- "subtract-21"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{6b7ef71c03c0e152ec20e4c478c66e014db03f1c4a9ea844d77ca1a6b514bedc}
		--assert z  = sub256 x  y

	--test-- "subtract-22"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{685617a518a2dfd36a18660be779c96aa0501fe5945291a386f9fa40a3ad864b}
		--assert z  = sub256 x  y

	--test-- "subtract-23"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{cbc22be54889880402bbb10e22ea0870d9b48251da046956b7ad1304ad301ded}
		--assert z  = sub256 x  y

	--test-- "subtract-24"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{b3bd41ef7b9e04cbc58e5bc9c86103ee5ac8829119ee1254af9d618f5cc655e1}
		--assert z  = sub256 x  y

	--test-- "subtract-25"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{cf234f18cb0e4211f2b77788af315f55b9a1fcad1ef28fbd44442ee1958ccc07}
		--assert z  = sub256 x  y

	--test-- "subtract-26"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{220213c2c58cdd634e834240d76bb9694ae266d10ca7054cdf154811ad9b6bce}
		--assert z  = sub256 x  y

	--test-- "subtract-27"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{246ce76176ce415d07bd459d7793ed7f55a84c816e6bab36e9333b00291e4640}
		--assert z  = sub256 x  y

	--test-- "subtract-28"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{00}
		z: to-i256 #{29e42a8d59042cfd}
		--assert z  = sub256 x  y

	--test-- "subtract-29"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{00}
		z: to-i256 #{29e42a8d59042cfd}
		--assert z  = sub256 x  y

	--test-- "subtract-30"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{01}
		z: to-i256 #{29e42a8d59042cfc}
		--assert z  = sub256 x  y

	--test-- "subtract-31"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{02}
		z: to-i256 #{29e42a8d59042cfb}
		--assert z  = sub256 x  y

	--test-- "subtract-32"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{117ab580a3684f6f}
		--assert z  = sub256 x  y

	--test-- "subtract-33"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{00}
		z: to-i256 #{313e8c305103debc}
		--assert z  = sub256 x  y

	--test-- "subtract-34"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{00}
		z: to-i256 #{313e8c305103debc}
		--assert z  = sub256 x  y

	--test-- "subtract-35"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{01}
		z: to-i256 #{313e8c305103debb}
		--assert z  = sub256 x  y

	--test-- "subtract-36"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{02}
		z: to-i256 #{313e8c305103deba}
		--assert z  = sub256 x  y

	--test-- "subtract-37"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{075a61a2f7ffb1bf}
		--assert z  = sub256 x  y

	--test-- "subtract-38"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{18d517239b68012e}
		--assert z  = sub256 x  y

	--test-- "subtract-39"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{00}
		z: to-i256 #{47cf2956be337e18}
		--assert z  = sub256 x  y

	--test-- "subtract-40"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{00}
		z: to-i256 #{47cf2956be337e18}
		--assert z  = sub256 x  y

	--test-- "subtract-41"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{01}
		z: to-i256 #{47cf2956be337e17}
		--assert z  = sub256 x  y

	--test-- "subtract-42"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{02}
		z: to-i256 #{47cf2956be337e16}
		--assert z  = sub256 x  y

	--test-- "subtract-43"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{1deafec9652f511b}
		--assert z  = sub256 x  y

	--test-- "subtract-44"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{16909d266d2f9f5c}
		--assert z  = sub256 x  y

	--test-- "subtract-45"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{056d7b9717be0ddd}
		--assert z  = sub256 x  y

	--test-- "subtract-46"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{2f65b44a0897a08a}
		--assert z  = sub256 x  y

	--test-- "subtract-47"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{0104f837f4871dc1}
		--assert z  = sub256 x  y

	--test-- "subtract-48"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{00}
		z: to-i256 #{4261adbfa675703b}
		--assert z  = sub256 x  y

	--test-- "subtract-49"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{00}
		z: to-i256 #{4261adbfa675703b}
		--assert z  = sub256 x  y

	--test-- "subtract-50"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{01}
		z: to-i256 #{4261adbfa675703a}
		--assert z  = sub256 x  y

	--test-- "subtract-51"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{02}
		z: to-i256 #{4261adbfa6757039}
		--assert z  = sub256 x  y

	--test-- "subtract-52"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{187d83324d71433e}
		--assert z  = sub256 x  y

	--test-- "subtract-53"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{1123218f5571917f}
		--assert z  = sub256 x  y

	--test-- "subtract-54"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{29f838b2f0d992ad}
		--assert z  = sub256 x  y

	--test-- "subtract-55"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{00}
		z: to-i256 #{8aaea8e413a5aae3}
		--assert z  = sub256 x  y

	--test-- "subtract-56"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{00}
		z: to-i256 #{8aaea8e413a5aae3}
		--assert z  = sub256 x  y

	--test-- "subtract-57"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{01}
		z: to-i256 #{8aaea8e413a5aae2}
		--assert z  = sub256 x  y

	--test-- "subtract-58"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{02}
		z: to-i256 #{8aaea8e413a5aae1}
		--assert z  = sub256 x  y

	--test-- "subtract-59"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{60ca7e56baa17de6}
		--assert z  = sub256 x  y

	--test-- "subtract-60"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{59701cb3c2a1cc27}
		--assert z  = sub256 x  y

	--test-- "subtract-61"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{42df7f8d55722ccb}
		--assert z  = sub256 x  y

	--test-- "subtract-62"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{484cfb246d303aa8}
		--assert z  = sub256 x  y

	--test-- "subtract-63"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{724533d75e09cd55}
		--assert z  = sub256 x  y

	--test-- "subtract-64"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{43e477c549f94a8c}
		--assert z  = sub256 x  y

	--test-- "subtract-65"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{00}
		z: to-i256 #{cfee9cc0728f738b}
		--assert z  = sub256 x  y

	--test-- "subtract-66"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{00}
		z: to-i256 #{cfee9cc0728f738b}
		--assert z  = sub256 x  y

	--test-- "subtract-67"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{01}
		z: to-i256 #{cfee9cc0728f738a}
		--assert z  = sub256 x  y

	--test-- "subtract-68"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{02}
		z: to-i256 #{cfee9cc0728f7389}
		--assert z  = sub256 x  y

	--test-- "subtract-69"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{a60a7233198b468e}
		--assert z  = sub256 x  y

	--test-- "subtract-70"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{9eb01090218b94cf}
		--assert z  = sub256 x  y

	--test-- "subtract-71"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{881f7369b45bf573}
		--assert z  = sub256 x  y

	--test-- "subtract-72"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{8d8cef00cc1a0350}
		--assert z  = sub256 x  y

	--test-- "subtract-73"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{453ff3dc5ee9c8a8}
		--assert z  = sub256 x  y

	--test-- "subtract-74"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{165f58b8dc1c991a}
		--assert z  = sub256 x  y

	--test-- "subtract-75"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{b78527b3bcf395fd}
		--assert z  = sub256 x  y

	--test-- "subtract-76"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{89246ba1a8e31334}
		--assert z  = sub256 x  y

	--test-- "subtract-77"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{00}
		z: to-i256 #{b98f44079672da71}
		--assert z  = sub256 x  y

	--test-- "subtract-78"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{00}
		z: to-i256 #{b98f44079672da71}
		--assert z  = sub256 x  y

	--test-- "subtract-79"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{01}
		z: to-i256 #{b98f44079672da70}
		--assert z  = sub256 x  y

	--test-- "subtract-80"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{02}
		z: to-i256 #{b98f44079672da6f}
		--assert z  = sub256 x  y

	--test-- "subtract-81"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{8fab197a3d6ead74}
		--assert z  = sub256 x  y

	--test-- "subtract-82"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{8850b7d7456efbb5}
		--assert z  = sub256 x  y

	--test-- "subtract-83"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{71c01ab0d83f5c59}
		--assert z  = sub256 x  y

	--test-- "subtract-84"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{772d9647effd6a36}
		--assert z  = sub256 x  y

	--test-- "subtract-85"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{2ee09b2382cd2f8e}
		--assert z  = sub256 x  y

	--test-- "subtract-86"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{a125cefae0d6fce3}
		--assert z  = sub256 x  y

	--test-- "subtract-87"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{72c512e8ccc67a1a}
		--assert z  = sub256 x  y

	--test-- "subtract-88"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{00}
		z: to-i256 #{f456abaafa5235e8}
		--assert z  = sub256 x  y

	--test-- "subtract-89"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{00}
		z: to-i256 #{f456abaafa5235e8}
		--assert z  = sub256 x  y

	--test-- "subtract-90"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{01}
		z: to-i256 #{f456abaafa5235e7}
		--assert z  = sub256 x  y

	--test-- "subtract-91"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{02}
		z: to-i256 #{f456abaafa5235e6}
		--assert z  = sub256 x  y

	--test-- "subtract-92"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{ca72811da14e08eb}
		--assert z  = sub256 x  y

	--test-- "subtract-93"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{c3181f7aa94e572c}
		--assert z  = sub256 x  y

	--test-- "subtract-94"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{ac8782543c1eb7d0}
		--assert z  = sub256 x  y

	--test-- "subtract-95"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{b1f4fdeb53dcc5ad}
		--assert z  = sub256 x  y

	--test-- "subtract-96"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{69a802c6e6ac8b05}
		--assert z  = sub256 x  y

	--test-- "subtract-97"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{24680eea87c2c25d}
		--assert z  = sub256 x  y

	--test-- "subtract-98"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{3ac767a363df5b77}
		--assert z  = sub256 x  y

	--test-- "subtract-99"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{dbed369e44b6585a}
		--assert z  = sub256 x  y

	--test-- "subtract-100"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{ad8c7a8c30a5d591}
		--assert z  = sub256 x  y

	--test-- "subtract-101"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{00}
		z: to-i256 #{1869750cb59bdd8e}
		--assert z  = sub256 x  y

	--test-- "subtract-102"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{00}
		z: to-i256 #{1869750cb59bdd8e}
		--assert z  = sub256 x  y

	--test-- "subtract-103"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{01}
		z: to-i256 #{1869750cb59bdd8d}
		--assert z  = sub256 x  y

	--test-- "subtract-104"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{02}
		z: to-i256 #{1869750cb59bdd8c}
		--assert z  = sub256 x  y

	--test-- "subtract-105"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{00}
		z: to-i256 #{46ca311ec9ac6057}
		--assert z  = sub256 x  y

	--test-- "subtract-106"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{00}
		z: to-i256 #{46ca311ec9ac6057}
		--assert z  = sub256 x  y

	--test-- "subtract-107"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{01}
		z: to-i256 #{46ca311ec9ac6056}
		--assert z  = sub256 x  y

	--test-- "subtract-108"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{02}
		z: to-i256 #{46ca311ec9ac6055}
		--assert z  = sub256 x  y

	--test-- "subtract-109"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{1ce6069170a8335a}
		--assert z  = sub256 x  y

	--test-- "subtract-110"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{158ba4ee78a8819b}
		--assert z  = sub256 x  y

	--test-- "subtract-111"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{0468835f2336f01c}
		--assert z  = sub256 x  y

	--test-- "subtract-112"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{2e60bc12141082c9}
		--assert z  = sub256 x  y

	--test-- "subtract-113"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{00}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		--assert z  = sub256 x  y

	--test-- "subtract-114"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{00}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		--assert z  = sub256 x  y

	--test-- "subtract-115"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{01}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6b}
		--assert z  = sub256 x  y

	--test-- "subtract-116"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{02}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6a}
		--assert z  = sub256 x  y

	--test-- "subtract-117"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f72623c0bd0aa82d7e6f}
		--assert z  = sub256 x  y

	--test-- "subtract-118"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7261c665b67b02dccb0}
		--assert z  = sub256 x  y

	--test-- "subtract-119"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f72605d5be4142fe2d54}
		--assert z  = sub256 x  y

	--test-- "subtract-120"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7260b4339d85abc3b31}
		--assert z  = sub256 x  y

	--test-- "subtract-121"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f725c2f63eb3ed8c0089}
		--assert z  = sub256 x  y

	--test-- "subtract-122"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7257db64ad78ea237e1}
		--assert z  = sub256 x  y

	--test-- "subtract-123"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7259415a3906abed0fb}
		--assert z  = sub256 x  y

	--test-- "subtract-124"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f725594e3bed06df7584}
		--assert z  = sub256 x  y

	--test-- "subtract-125"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f726353b728b4b95cdde}
		--assert z  = sub256 x  y

	--test-- "subtract-126"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f72606dab67937854b15}
		--assert z  = sub256 x  y

	--test-- "subtract-127"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{2ae1d5e07a48a88be2b056f6ce7202e1990e636942aa6cc086ce8c04da7abf62}
		--assert z  = sub256 x  y

	--test-- "subtract-128"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{5cc743f1cc5326dd778265b2e894bd35a8542b876112be376c50984ab2c1fe89}
		--assert z  = sub256 x  y

	--test-- "subtract-129"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{4088a38de17a8bc3d4e97cda90bb4e9a8a058dc1aec5607d0551fa9cae61c95a}
		--assert z  = sub256 x  y

	--test-- "subtract-130"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{2883b998148f088b97bc279636324a180b198e00eeaf097afd4249275df8014e}
		--assert z  = sub256 x  y

	--test-- "subtract-131"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{43e9c6c163ff45d1c4e543551d02a57f69f3081cf3b386e391e9167996be7774}
		--assert z  = sub256 x  y

	--test-- "subtract-132"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{00}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		--assert z  = sub256 x  y

	--test-- "subtract-133"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{00}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		--assert z  = sub256 x  y

	--test-- "subtract-134"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{01}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec09}
		--assert z  = sub256 x  y

	--test-- "subtract-135"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{02}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec08}
		--assert z  = sub256 x  y

	--test-- "subtract-136"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a659cf23105cdb2bf0d}
		--assert z  = sub256 x  y

	--test-- "subtract-137"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a659597cf62d5b30d4e}
		--assert z  = sub256 x  y

	--test-- "subtract-138"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a657f07323c68836df2}
		--assert z  = sub256 x  y

	--test-- "subtract-139"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a658474add380417bcf}
		--assert z  = sub256 x  y

	--test-- "subtract-140"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a653c27b2af13114127}
		--assert z  = sub256 x  y

	--test-- "subtract-141"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a64f6e7bed2b427787f}
		--assert z  = sub256 x  y

	--test-- "subtract-142"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a650d47178b90441199}
		--assert z  = sub256 x  y

	--test-- "subtract-143"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a64d27fafe82c64b622}
		--assert z  = sub256 x  y

	--test-- "subtract-144"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65ae6ce686711b0e7c}
		--assert z  = sub256 x  y

	--test-- "subtract-145"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65800c2a745d0a8bb3}
		--assert z  = sub256 x  y

	--test-- "subtract-146"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{31e56e11520a7e5194d20ebc1a22ba540f45c81e1e685176e5820c45d8473f27}
		--assert z  = sub256 x  y

	--test-- "subtract-147"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{15a6cdad6731e337f23925e3c2494bb8f0f72a586c1af3bc7e836e97d3e709f8}
		--assert z  = sub256 x  y

	--test-- "subtract-148"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{1907f0e0e9b69d45e234ec5e4e90a29dd0e4a4b3b1091a230b1a8a74bc43b812}
		--assert z  = sub256 x  y

	--test-- "subtract-149"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{00}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		--assert z  = sub256 x  y

	--test-- "subtract-150"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{00}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		--assert z  = sub256 x  y

	--test-- "subtract-151"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{01}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face2}
		--assert z  = sub256 x  y

	--test-- "subtract-152"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{02}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face1}
		--assert z  = sub256 x  y

	--test-- "subtract-153"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eeb77024bff56b7fe6}
		--assert z  = sub256 x  y

	--test-- "subtract-154"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eeb015c31cfd6bce27}
		--assert z  = sub256 x  y

	--test-- "subtract-155"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38ee998525f6903c2ecb}
		--assert z  = sub256 x  y

	--test-- "subtract-156"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38ee9ef2a18da7fa3ca8}
		--assert z  = sub256 x  y

	--test-- "subtract-157"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38ee56a5a6693aca0200}
		--assert z  = sub256 x  y

	--test-- "subtract-158"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38ee1165b28cdbe03958}
		--assert z  = sub256 x  y

	--test-- "subtract-159"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38ee27c50b45b7fcd272}
		--assert z  = sub256 x  y

	--test-- "subtract-160"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38edecfda3a2541d76fb}
		--assert z  = sub256 x  y

	--test-- "subtract-161"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eec8eada4098d3cf55}
		--assert z  = sub256 x  y

	--test-- "subtract-162"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38ee9a8a1e2e84c34c8c}
		--assert z  = sub256 x  y

	--test-- "subtract-163"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{00}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		--assert z  = sub256 x  y

	--test-- "subtract-164"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{00}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		--assert z  = sub256 x  y

	--test-- "subtract-165"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{01}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4122}
		--assert z  = sub256 x  y

	--test-- "subtract-166"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{02}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4121}
		--assert z  = sub256 x  y

	--test-- "subtract-167"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bafe9f33cbf1e71426}
		--assert z  = sub256 x  y

	--test-- "subtract-168"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157baf744d228f9e76267}
		--assert z  = sub256 x  y

	--test-- "subtract-169"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bae0b435028cb7c30b}
		--assert z  = sub256 x  y

	--test-- "subtract-170"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bae621b099a475d0e8}
		--assert z  = sub256 x  y

	--test-- "subtract-171"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157ba9dd4b57537459640}
		--assert z  = sub256 x  y

	--test-- "subtract-172"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157ba5894c198d85bcd98}
		--assert z  = sub256 x  y

	--test-- "subtract-173"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157ba6ef41a51b47866b2}
		--assert z  = sub256 x  y

	--test-- "subtract-174"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157ba342cb2ae50990b3b}
		--assert z  = sub256 x  y

	--test-- "subtract-175"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb1019e94c954f6395}
		--assert z  = sub256 x  y

	--test-- "subtract-176"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bae1b92d3a813ee0cc}
		--assert z  = sub256 x  y

	--test-- "subtract-177"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{1fba913b634e1aed41b14f6f19684bd501feb573e0a06094dade76c149b995b7}
		--assert z  = sub256 x  y

	--test-- "subtract-178"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{4a9c671bdd96c3792461a665e7da4eb69b0d18dd234acd5561ad02c624345519}
		--assert z  = sub256 x  y

	--test-- "subtract-179"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{7c81d52d2fa141cab933b52201fd090aaa52e0fb41b31ecc472f0f0bfc7b9440}
		--assert z  = sub256 x  y

	--test-- "subtract-180"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{604334c944c8a6b1169acc49aa239a6f8c0443358f65c111e030715df81b5f11}
		--assert z  = sub256 x  y

	--test-- "subtract-181"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{483e4ad377dd2378d96d77054f9a95ed0d184374cf4f6a0fd820bfe8a7b19705}
		--assert z  = sub256 x  y

	--test-- "subtract-182"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{63a457fcc74d60bf069692c4366af1546bf1bd90d453e7786cc78d3ae0780d2b}
		--assert z  = sub256 x  y

	--test-- "subtract-183"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{00}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		--assert z  = sub256 x  y

	--test-- "subtract-184"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{00}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		--assert z  = sub256 x  y

	--test-- "subtract-185"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{01}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b3}
		--assert z  = sub256 x  y

	--test-- "subtract-186"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{02}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b2}
		--assert z  = sub256 x  y

	--test-- "subtract-187"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c4f21db32034e4cb7}
		--assert z  = sub256 x  y

	--test-- "subtract-188"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c47c7798f0b4e9af8}
		--assert z  = sub256 x  y

	--test-- "subtract-189"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c3136dc689e1efb9c}
		--assert z  = sub256 x  y

	--test-- "subtract-190"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c36a457ffb5dd0979}
		--assert z  = sub256 x  y

	--test-- "subtract-191"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5bee575cdb48acced1}
		--assert z  = sub256 x  y

	--test-- "subtract-192"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5ba91768fee9c30629}
		--assert z  = sub256 x  y

	--test-- "subtract-193"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5bbf76c1b7c5df9f43}
		--assert z  = sub256 x  y

	--test-- "subtract-194"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5b84af5a14620043cc}
		--assert z  = sub256 x  y

	--test-- "subtract-195"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c609c90b2a6b69c26}
		--assert z  = sub256 x  y

	--test-- "subtract-196"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c323bd4a092a6195d}
		--assert z  = sub256 x  y

	--test-- "subtract-197"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{22e370b24e6c1c6cc3b9ce27aab4f06baf5ed4aa96ec77362b611e275b20ce48}
		--assert z  = sub256 x  y

	--test-- "subtract-198"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{4dc54692c8b4c4f8a66a251e7926f34d486d3813d996e3f6b22faa2c359b8daa}
		--assert z  = sub256 x  y

	--test-- "subtract-199"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{7faab4a41abf434a3b3c33da9349ada157b30031f7ff356d97b1b6720de2ccd1}
		--assert z  = sub256 x  y

	--test-- "subtract-200"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{0328df76eb1e017f82087eb8914ca496ad601f36b64c16a15082a76611673891}
		--assert z  = sub256 x  y

	--test-- "subtract-201"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{636c14402fe6a83098a34b023b703f063964626c45b1d7b330b318c4098297a2}
		--assert z  = sub256 x  y

	--test-- "subtract-202"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{4b672a4a62fb24f85b75f5bde0e73a83ba7862ab859b80b128a3674eb918cf96}
		--assert z  = sub256 x  y

	--test-- "subtract-203"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{66cd3773b26b623e889f117cc7b795eb1951dcc78a9ffe19bd4a34a0f1df45bc}
		--assert z  = sub256 x  y

	--test-- "subtract-204"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{00}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		--assert z  = sub256 x  y

	--test-- "subtract-205"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{00}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		--assert z  = sub256 x  y

	--test-- "subtract-206"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{01}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe211}
		--assert z  = sub256 x  y

	--test-- "subtract-207"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{02}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe210}
		--assert z  = sub256 x  y

	--test-- "subtract-208"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a91e6ec26df9cbb515}
		--assert z  = sub256 x  y

	--test-- "subtract-209"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a9171460cb01cc0356}
		--assert z  = sub256 x  y

	--test-- "subtract-210"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a90083c3a4949c63fa}
		--assert z  = sub256 x  y

	--test-- "subtract-211"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a905f13f3bac5a71d7}
		--assert z  = sub256 x  y

	--test-- "subtract-212"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a8bda444173f2a372f}
		--assert z  = sub256 x  y

	--test-- "subtract-213"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a87864503ae0406e87}
		--assert z  = sub256 x  y

	--test-- "subtract-214"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a88ec3a8f3bc5d07a1}
		--assert z  = sub256 x  y

	--test-- "subtract-215"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a853fc4150587dac2a}
		--assert z  = sub256 x  y

	--test-- "subtract-216"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a92fe977ee9d340484}
		--assert z  = sub256 x  y

	--test-- "subtract-217"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a90188bbdc892381bb}
		--assert z  = sub256 x  y

	--test-- "subtract-218"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{1c3ea063ead89b19a298e8d857d96e9b1e4e9dc5b24d5dba66fe9dae0460352f}
		--assert z  = sub256 x  y

	--test-- "subtract-219"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{036123338284ba0deffbc67a8c4756e4dfed7a5b44ee26668c971bdce85cae1a}
		--assert z  = sub256 x  y

	--test-- "subtract-220"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{00}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		--assert z  = sub256 x  y

	--test-- "subtract-221"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{00}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		--assert z  = sub256 x  y

	--test-- "subtract-222"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{01}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1d}
		--assert z  = sub256 x  y

	--test-- "subtract-223"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{02}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1c}
		--assert z  = sub256 x  y

	--test-- "subtract-224"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab267e73e34a357d21}
		--assert z  = sub256 x  y

	--test-- "subtract-225"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab1f2412405235cb62}
		--assert z  = sub256 x  y

	--test-- "subtract-226"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab08937519e5062c06}
		--assert z  = sub256 x  y

	--test-- "subtract-227"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab0e00f0b0fcc439e3}
		--assert z  = sub256 x  y

	--test-- "subtract-228"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edaac5b3f58c8f93ff3b}
		--assert z  = sub256 x  y

	--test-- "subtract-229"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edaa807401b030aa3693}
		--assert z  = sub256 x  y

	--test-- "subtract-230"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edaa96d35a690cc6cfad}
		--assert z  = sub256 x  y

	--test-- "subtract-231"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edaa5c0bf2c5a8e77436}
		--assert z  = sub256 x  y

	--test-- "subtract-232"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab37f92963ed9dcc90}
		--assert z  = sub256 x  y

	--test-- "subtract-233"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab09986d51d98d49c7}
		--assert z  = sub256 x  y

	--test-- "subtract-234"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{025e1c4865b9a0004af42f60983fb8c98df4d56853fb6345898c42dd7c82be14}
		--assert z  = sub256 x  y

	--test-- "subtract-235"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{34438a59b7c41e51dfc63e1cb262731d9d3a9d867263b4bc6f0e4f2354c9fd3b}
		--assert z  = sub256 x  y

	--test-- "subtract-236"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{1804e9f5cceb83383d2d55445a8904827eebffc0c0165702080fb1755069c80c}
		--assert z  = sub256 x  y

	--test-- "subtract-237"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{1b660d294f703d462d291bbee6d05b675ed97a1c05047d6894a6cd5238c67626}
		--assert z  = sub256 x  y

	--test-- "subtract-238"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{00}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		--assert z  = sub256 x  y

	--test-- "subtract-239"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{00}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		--assert z  = sub256 x  y

	--test-- "subtract-240"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{01}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f7}
		--assert z  = sub256 x  y

	--test-- "subtract-241"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{02}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f6}
		--assert z  = sub256 x  y

	--test-- "subtract-242"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d704291d7a691116f06fb}
		--assert z  = sub256 x  y

	--test-- "subtract-243"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d70428a7d44ee196f553c}
		--assert z  = sub256 x  y

	--test-- "subtract-244"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d704273eca7c7ac3fb5e0}
		--assert z  = sub256 x  y

	--test-- "subtract-245"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042795a235ec3fdc3bd}
		--assert z  = sub256 x  y

	--test-- "subtract-246"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042310d283a56cd8915}
		--assert z  = sub256 x  y

	--test-- "subtract-247"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7041ebcd345df7e3c06d}
		--assert z  = sub256 x  y

	--test-- "subtract-248"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042022c8d16d4005987}
		--assert z  = sub256 x  y

	--test-- "subtract-249"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7041c76525737020fe10}
		--assert z  = sub256 x  y

	--test-- "subtract-250"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042a3525c11b4d7566a}
		--assert z  = sub256 x  y

	--test-- "subtract-251"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d704274f19fffa0c6d3a1}
		--assert z  = sub256 x  y

	--test-- "subtract-252"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{18dd7d306853e10bb29d225dcb9217b63e61236a6d5f3753da6781d11c038715}
		--assert z  = sub256 x  y

	--test-- "subtract-253"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{00}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		--assert z  = sub256 x  y

	--test-- "subtract-254"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{00}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		--assert z  = sub256 x  y

	--test-- "subtract-255"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{01}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649430}
		--assert z  = sub256 x  y

	--test-- "subtract-256"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{02}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee5264942f}
		--assert z  = sub256 x  y

	--test-- "subtract-257"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab2f7068d60f9606734}
		--assert z  = sub256 x  y

	--test-- "subtract-258"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab2efac2bbe0160b575}
		--assert z  = sub256 x  y

	--test-- "subtract-259"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab2d91b8e9794311619}
		--assert z  = sub256 x  y

	--test-- "subtract-260"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab2de890a2eabef23f6}
		--assert z  = sub256 x  y

	--test-- "subtract-261"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab2963c0f0a3ebee94e}
		--assert z  = sub256 x  y

	--test-- "subtract-262"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab250fc1b2ddfd520a6}
		--assert z  = sub256 x  y

	--test-- "subtract-263"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab2675b73e6bbf1b9c0}
		--assert z  = sub256 x  y

	--test-- "subtract-264"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab22c940c4358125e49}
		--assert z  = sub256 x  y

	--test-- "subtract-265"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab3088142e19cc8b6a3}
		--assert z  = sub256 x  y

	--test-- "subtract-266"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab2da2086cf88b833da}
		--assert z  = sub256 x  y

	--test-- "subtract-267"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{69377494a1821edcdf4ef1f2bac3006d04cc8dbf1e98038cd345d0565132e8c5}
		--assert z  = sub256 x  y

	--test-- "subtract-268"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{94194a751bcac768c1ff48e98935034e9ddaf1286142704d5a145c5b2bada827}
		--assert z  = sub256 x  y

	--test-- "subtract-269"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{c5feb8866dd545ba56d157a5a357bda2ad20b9467faac1c43f9668a103f4e74e}
		--assert z  = sub256 x  y

	--test-- "subtract-270"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{497ce3593e3403ef9d9da283a15ab49802cdd84b3df7a2f7f86759950779530e}
		--assert z  = sub256 x  y

	--test-- "subtract-271"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{465403e2531602701b9523cb100e1001556db91487ab8c56a7e4b22ef6121a7d}
		--assert z  = sub256 x  y

	--test-- "subtract-272"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{a9c0182282fcaaa0b4386ecd4b7e4f078ed21b80cd5d6409d897caf2ff94b21f}
		--assert z  = sub256 x  y

	--test-- "subtract-273"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{91bb2e2cb6112768770b1988f0f54a850fe61bc00d470d07d088197daf2aea13}
		--assert z  = sub256 x  y

	--test-- "subtract-274"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{ad213b56058164aea4343547d7c5a5ec6ebf95dc124b8a70652ee6cfe7f16039}
		--assert z  = sub256 x  y

	--test-- "subtract-275"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{026ad39eb14163f9b93a035ca02834160ac5e5b061c4a5ea0a1df2ee7b82da72}
		--assert z  = sub256 x  y

	--test-- "subtract-276"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{00}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		--assert z  = sub256 x  y

	--test-- "subtract-277"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{00}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		--assert z  = sub256 x  y

	--test-- "subtract-278"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{01}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9be}
		--assert z  = sub256 x  y

	--test-- "subtract-279"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{02}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bd}
		--assert z  = sub256 x  y

	--test-- "subtract-280"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c8ece89a727ddd8cc2}
		--assert z  = sub256 x  y

	--test-- "subtract-281"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c8e58e38cf85dddb03}
		--assert z  = sub256 x  y

	--test-- "subtract-282"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c8cefd9ba918ae3ba7}
		--assert z  = sub256 x  y

	--test-- "subtract-283"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c8d46b1740306c4984}
		--assert z  = sub256 x  y

	--test-- "subtract-284"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c88c1e1c1bc33c0edc}
		--assert z  = sub256 x  y

	--test-- "subtract-285"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c846de283f64524634}
		--assert z  = sub256 x  y

	--test-- "subtract-286"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c85d3d80f8406edf4e}
		--assert z  = sub256 x  y

	--test-- "subtract-287"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c822761954dc8f83d7}
		--assert z  = sub256 x  y

	--test-- "subtract-288"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c8fe634ff32145dc31}
		--assert z  = sub256 x  y

	--test-- "subtract-289"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c8d00293e10d355968}
		--assert z  = sub256 x  y

	--test-- "subtract-290"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{66cca0f5f040bae32614ee961a9acc56fa06a80ebcd35da2c927dd67d5b00e53}
		--assert z  = sub256 x  y

	--test-- "subtract-291"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{91ae76d66a89636f08c5458ce90ccf3893150b77ff7dca634ff6696cb02acdb5}
		--assert z  = sub256 x  y

	--test-- "subtract-292"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{c393e4e7bc93e1c09d975449032f898ca25ad3961de61bda357875b288720cdc}
		--assert z  = sub256 x  y

	--test-- "subtract-293"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{47120fba8cf29ff5e4639f2701328081f807f29adc32fd0dee4966a68bf6789c}
		--assert z  = sub256 x  y

	--test-- "subtract-294"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{43e93043a1d49e76625b206e6fe5dbeb4aa7d36425e6e66c9dc6bf407a8f400b}
		--assert z  = sub256 x  y

	--test-- "subtract-295"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{a7554483d1bb46a6fafe6b70ab561af1840c35d06b98be1fce79d8048411d7ad}
		--assert z  = sub256 x  y

	--test-- "subtract-296"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{8f505a8e04cfc36ebdd1162c50cd166f0520360fab82671dc66a268f33a80fa1}
		--assert z  = sub256 x  y

	--test-- "subtract-297"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{aab667b7544000b4eafa31eb379d71d663f9b02bb086e4865b10f3e16c6e85c7}
		--assert z  = sub256 x  y

===end-group===

===start-group=== "multiply"
	--test-- "multiply-1"
		x: to-i256 #{01}
		y: to-i256 #{02}
		z: to-i256 #{02}
		--assert z  = mul256 x  y

	--test-- "multiply-2"
		x: to-i256 #{01}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{29e42a8d59042cfd}
		--assert z  = mul256 x  y

	--test-- "multiply-3"
		x: to-i256 #{01}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{313e8c305103debc}
		--assert z  = mul256 x  y

	--test-- "multiply-4"
		x: to-i256 #{01}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{47cf2956be337e18}
		--assert z  = mul256 x  y

	--test-- "multiply-5"
		x: to-i256 #{01}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{4261adbfa675703b}
		--assert z  = mul256 x  y

	--test-- "multiply-6"
		x: to-i256 #{01}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{8aaea8e413a5aae3}
		--assert z  = mul256 x  y

	--test-- "multiply-7"
		x: to-i256 #{01}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{cfee9cc0728f738b}
		--assert z  = mul256 x  y

	--test-- "multiply-8"
		x: to-i256 #{01}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{b98f44079672da71}
		--assert z  = mul256 x  y

	--test-- "multiply-9"
		x: to-i256 #{01}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{f456abaafa5235e8}
		--assert z  = mul256 x  y

	--test-- "multiply-10"
		x: to-i256 #{01}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{1869750cb59bdd8e}
		--assert z  = mul256 x  y

	--test-- "multiply-11"
		x: to-i256 #{01}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{46ca311ec9ac6057}
		--assert z  = mul256 x  y

	--test-- "multiply-12"
		x: to-i256 #{01}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		--assert z  = mul256 x  y

	--test-- "multiply-13"
		x: to-i256 #{01}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		--assert z  = mul256 x  y

	--test-- "multiply-14"
		x: to-i256 #{01}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		--assert z  = mul256 x  y

	--test-- "multiply-15"
		x: to-i256 #{01}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		--assert z  = mul256 x  y

	--test-- "multiply-16"
		x: to-i256 #{01}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		--assert z  = mul256 x  y

	--test-- "multiply-17"
		x: to-i256 #{01}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		--assert z  = mul256 x  y

	--test-- "multiply-18"
		x: to-i256 #{01}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		--assert z  = mul256 x  y

	--test-- "multiply-19"
		x: to-i256 #{01}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		--assert z  = mul256 x  y

	--test-- "multiply-20"
		x: to-i256 #{01}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		--assert z  = mul256 x  y

	--test-- "multiply-21"
		x: to-i256 #{01}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		--assert z  = mul256 x  y

	--test-- "multiply-22"
		x: to-i256 #{02}
		y: to-i256 #{01}
		z: to-i256 #{02}
		--assert z  = mul256 x  y

	--test-- "multiply-23"
		x: to-i256 #{02}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{53c8551ab20859fa}
		--assert z  = mul256 x  y

	--test-- "multiply-24"
		x: to-i256 #{02}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{627d1860a207bd78}
		--assert z  = mul256 x  y

	--test-- "multiply-25"
		x: to-i256 #{02}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{8f9e52ad7c66fc30}
		--assert z  = mul256 x  y

	--test-- "multiply-26"
		x: to-i256 #{02}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{84c35b7f4ceae076}
		--assert z  = mul256 x  y

	--test-- "multiply-27"
		x: to-i256 #{02}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{01155d51c8274b55c6}
		--assert z  = mul256 x  y

	--test-- "multiply-28"
		x: to-i256 #{02}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{019fdd3980e51ee716}
		--assert z  = mul256 x  y

	--test-- "multiply-29"
		x: to-i256 #{02}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{01731e880f2ce5b4e2}
		--assert z  = mul256 x  y

	--test-- "multiply-30"
		x: to-i256 #{02}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{01e8ad5755f4a46bd0}
		--assert z  = mul256 x  y

	--test-- "multiply-31"
		x: to-i256 #{02}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{30d2ea196b37bb1c}
		--assert z  = mul256 x  y

	--test-- "multiply-32"
		x: to-i256 #{02}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{8d94623d9358c0ae}
		--assert z  = mul256 x  y

	--test-- "multiply-33"
		x: to-i256 #{02}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{e98cef5131e2077fa45b9798dba28c5360a216dfa981ee4c9b49cf30026356d8}
		--assert z  = mul256 x  y

	--test-- "multiply-34"
		x: to-i256 #{02}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{93c943903d50b667defae9ab3ebe86902e85500d242d14cb8dacb7264d6dd814}
		--assert z  = mul256 x  y

	--test-- "multiply-35"
		x: to-i256 #{02}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{2ffe676d993bb9c4b556cc330a7911e80ff9bfd0e75c71ddc2a89e9a9cdf59c6}
		--assert z  = mul256 x  y

	--test-- "multiply-36"
		x: to-i256 #{02}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{687ba8356eeceff7fa889de3ba2bef1e4c96fb5c4bf72d5290a5d9f6a59fc424}
		--assert z  = mul256 x  y

	--test-- "multiply-37"
		x: to-i256 #{02}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{98857c2108c3f66874e3486c6f3df8234a6efaddcc23db56a0c53ce14673543c}
		--assert z  = mul256 x  y

	--test-- "multiply-38"
		x: to-i256 #{02}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{61b961ce69e37bdc1a9110eea19d41548cbc06a5c21ae0857777a23cd4e667f0}
		--assert z  = mul256 x  y

	--test-- "multiply-39"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{01}
		z: to-i256 #{29e42a8d59042cfd}
		--assert z  = mul256 x  y

	--test-- "multiply-40"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{02}
		z: to-i256 #{53c8551ab20859fa}
		--assert z  = mul256 x  y

	--test-- "multiply-41"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{080ee8580b94766424f0fbb7920b6fcc}
		--assert z  = mul256 x  y

	--test-- "multiply-42"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{0bc02e0f5891d643babe064722efbdb8}
		--assert z  = mul256 x  y

	--test-- "multiply-43"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{0adccedb1dbc3e0816e7935cf5460e4f}
		--assert z  = mul256 x  y

	--test-- "multiply-44"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{16b193a82c6874938f7d60ce7aa4e657}
		--assert z  = mul256 x  y

	--test-- "multiply-45"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{22068a2e623042d2a95b18da00cd145f}
		--assert z  = mul256 x  y

	--test-- "multiply-46"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{1e5d5455c371efa31070ab551fd14dad}
		--assert z  = mul256 x  y

	--test-- "multiply-47"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{27fba74c673ad411059b49ce04232648}
		--assert z  = mul256 x  y

	--test-- "multiply-48"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{03fea5ba102e52ba2957367219565d56}
		--assert z  = mul256 x  y

	--test-- "multiply-49"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{0b9579b5efc1c6ac47174031b04629fb}
		--assert z  = mul256 x  y

	--test-- "multiply-50"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{01}
		z: to-i256 #{313e8c305103debc}
		--assert z  = mul256 x  y

	--test-- "multiply-51"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{02}
		z: to-i256 #{627d1860a207bd78}
		--assert z  = mul256 x  y

	--test-- "multiply-52"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{080ee8580b94766424f0fbb7920b6fcc}
		--assert z  = mul256 x  y

	--test-- "multiply-53"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{0dd032687596bddf449adea4677169a0}
		--assert z  = mul256 x  y

	--test-- "multiply-54"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{0cc4ea43b59e16c40a01360b11429554}
		--assert z  = mul256 x  y

	--test-- "multiply-55"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{1aad50923fff397c921ba51aeb8358b4}
		--assert z  = mul256 x  y

	--test-- "multiply-56"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{27ff79a888cd7ae5de6a69f9dd2c6414}
		--assert z  = mul256 x  y

	--test-- "multiply-57"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{23b1c2554c6c75fa424265b0661968fc}
		--assert z  = mul256 x  y

	--test-- "multiply-58"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{2f0049a6d0c72b1a0fce442828d6c660}
		--assert z  = mul256 x  y

	--test-- "multiply-59"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{04b226500f59735de6569f600f41d848}
		--assert z  = mul256 x  y

	--test-- "multiply-60"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{0d9dff22b93bedc0b55451503e2731e4}
		--assert z  = mul256 x  y

	--test-- "multiply-61"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{01}
		z: to-i256 #{47cf2956be337e18}
		--assert z  = mul256 x  y

	--test-- "multiply-62"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{02}
		z: to-i256 #{8f9e52ad7c66fc30}
		--assert z  = mul256 x  y

	--test-- "multiply-63"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{0bc02e0f5891d643babe064722efbdb8}
		--assert z  = mul256 x  y

	--test-- "multiply-64"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{0dd032687596bddf449adea4677169a0}
		--assert z  = mul256 x  y

	--test-- "multiply-65"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{129ecee3c818143cfe8817688e008f88}
		--assert z  = mul256 x  y

	--test-- "multiply-66"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{26e6aa76c8a19f922817b924e6dcbf48}
		--assert z  = mul256 x  y

	--test-- "multiply-67"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{3a5370fdcb22d1546ef9c87487023f08}
		--assert z  = mul256 x  y

	--test-- "multiply-68"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{340ce4aceec03a870006ceba04cb1898}
		--assert z  = mul256 x  y

	--test-- "multiply-69"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{4489c325e6d2bbfada4f658edb753dc0}
		--assert z  = mul256 x  y

	--test-- "multiply-70"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{06d900ad54f49cbd727b42c444f2a950}
		--assert z  = mul256 x  y

	--test-- "multiply-71"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{13db5c8ba0369d592ca12b3782e8da28}
		--assert z  = mul256 x  y

	--test-- "multiply-72"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{01}
		z: to-i256 #{4261adbfa675703b}
		--assert z  = mul256 x  y

	--test-- "multiply-73"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{02}
		z: to-i256 #{84c35b7f4ceae076}
		--assert z  = mul256 x  y

	--test-- "multiply-74"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{0adccedb1dbc3e0816e7935cf5460e4f}
		--assert z  = mul256 x  y

	--test-- "multiply-75"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{0cc4ea43b59e16c40a01360b11429554}
		--assert z  = mul256 x  y

	--test-- "multiply-76"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{129ecee3c818143cfe8817688e008f88}
		--assert z  = mul256 x  y

	--test-- "multiply-77"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{23f5f1d8a61b2b695838030c4db0b251}
		--assert z  = mul256 x  y

	--test-- "multiply-78"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{35eadaf2ec9d81ffc696d6aa1a237109}
		--assert z  = mul256 x  y

	--test-- "multiply-79"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{301dbcc3772e861b38ee930407aec80b}
		--assert z  = mul256 x  y

	--test-- "multiply-80"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{3f5b92ee9ddef4d21d36148abb8fec78}
		--assert z  = mul256 x  y

	--test-- "multiply-81"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{065480b42b4a7f2fe2e6de3a61c02fba}
		--assert z  = mul256 x  y

	--test-- "multiply-82"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{125b23522ebce4b4139c687d56a3440d}
		--assert z  = mul256 x  y

	--test-- "multiply-83"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{01}
		z: to-i256 #{8aaea8e413a5aae3}
		--assert z  = mul256 x  y

	--test-- "multiply-84"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{02}
		z: to-i256 #{01155d51c8274b55c6}
		--assert z  = mul256 x  y

	--test-- "multiply-85"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{16b193a82c6874938f7d60ce7aa4e657}
		--assert z  = mul256 x  y

	--test-- "multiply-86"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{1aad50923fff397c921ba51aeb8358b4}
		--assert z  = mul256 x  y

	--test-- "multiply-87"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{26e6aa76c8a19f922817b924e6dcbf48}
		--assert z  = mul256 x  y

	--test-- "multiply-88"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{23f5f1d8a61b2b695838030c4db0b251}
		--assert z  = mul256 x  y

	--test-- "multiply-89"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{70a47ddc1fe65d97c747668da184c241}
		--assert z  = mul256 x  y

	--test-- "multiply-90"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{6485d477aabd748fd6b78f83dabbbc33}
		--assert z  = mul256 x  y

	--test-- "multiply-91"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{845d6ca569c01b3124e976738539dcb8}
		--assert z  = mul256 x  y

	--test-- "multiply-92"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{0d3980e15d25abd33aa35c3de0dbc0ea}
		--assert z  = mul256 x  y

	--test-- "multiply-93"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{26594a9bbd62c4151998acf5d8e63325}
		--assert z  = mul256 x  y

	--test-- "multiply-94"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{01}
		z: to-i256 #{cfee9cc0728f738b}
		--assert z  = mul256 x  y

	--test-- "multiply-95"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{02}
		z: to-i256 #{019fdd3980e51ee716}
		--assert z  = mul256 x  y

	--test-- "multiply-96"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{22068a2e623042d2a95b18da00cd145f}
		--assert z  = mul256 x  y

	--test-- "multiply-97"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{27ff79a888cd7ae5de6a69f9dd2c6414}
		--assert z  = mul256 x  y

	--test-- "multiply-98"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{3a5370fdcb22d1546ef9c87487023f08}
		--assert z  = mul256 x  y

	--test-- "multiply-99"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{35eadaf2ec9d81ffc696d6aa1a237109}
		--assert z  = mul256 x  y

	--test-- "multiply-100"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{70a47ddc1fe65d97c747668da184c241}
		--assert z  = mul256 x  y

	--test-- "multiply-101"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{96b7ccd22da629d9c4e438e29f9c5e5b}
		--assert z  = mul256 x  y

	--test-- "multiply-102"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{c675d2ff5851a5ee2e59423645727cf8}
		--assert z  = mul256 x  y

	--test-- "multiply-103"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{13d406a2b6020b4da7bcd0b59e7a161a}
		--assert z  = mul256 x  y

	--test-- "multiply-104"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{397f7909fcf32ee89fba2fc07e78643d}
		--assert z  = mul256 x  y

	--test-- "multiply-105"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{01}
		z: to-i256 #{b98f44079672da71}
		--assert z  = mul256 x  y

	--test-- "multiply-106"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{02}
		z: to-i256 #{01731e880f2ce5b4e2}
		--assert z  = mul256 x  y

	--test-- "multiply-107"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{1e5d5455c371efa31070ab551fd14dad}
		--assert z  = mul256 x  y

	--test-- "multiply-108"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{23b1c2554c6c75fa424265b0661968fc}
		--assert z  = mul256 x  y

	--test-- "multiply-109"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{340ce4aceec03a870006ceba04cb1898}
		--assert z  = mul256 x  y

	--test-- "multiply-110"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{301dbcc3772e861b38ee930407aec80b}
		--assert z  = mul256 x  y

	--test-- "multiply-111"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{6485d477aabd748fd6b78f83dabbbc33}
		--assert z  = mul256 x  y

	--test-- "multiply-112"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{96b7ccd22da629d9c4e438e29f9c5e5b}
		--assert z  = mul256 x  y

	--test-- "multiply-113"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{b11b5f66b6f7c0b7bc6a1d2c71815b68}
		--assert z  = mul256 x  y

	--test-- "multiply-114"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{11b1defb4da96722e4ba775ec1b3b7ae}
		--assert z  = mul256 x  y

	--test-- "multiply-115"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{334fbb407e1df98b53db73eaafde9c67}
		--assert z  = mul256 x  y

	--test-- "multiply-116"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{01}
		z: to-i256 #{f456abaafa5235e8}
		--assert z  = mul256 x  y

	--test-- "multiply-117"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{02}
		z: to-i256 #{01e8ad5755f4a46bd0}
		--assert z  = mul256 x  y

	--test-- "multiply-118"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{27fba74c673ad411059b49ce04232648}
		--assert z  = mul256 x  y

	--test-- "multiply-119"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{2f0049a6d0c72b1a0fce442828d6c660}
		--assert z  = mul256 x  y

	--test-- "multiply-120"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{4489c325e6d2bbfada4f658edb753dc0}
		--assert z  = mul256 x  y

	--test-- "multiply-121"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{3f5b92ee9ddef4d21d36148abb8fec78}
		--assert z  = mul256 x  y

	--test-- "multiply-122"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{845d6ca569c01b3124e976738539dcb8}
		--assert z  = mul256 x  y

	--test-- "multiply-123"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{c675d2ff5851a5ee2e59423645727cf8}
		--assert z  = mul256 x  y

	--test-- "multiply-124"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{b11b5f66b6f7c0b7bc6a1d2c71815b68}
		--assert z  = mul256 x  y

	--test-- "multiply-125"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{174cc75c2e739c81586d11b37d9b2eb0}
		--assert z  = mul256 x  y

	--test-- "multiply-126"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{4390ae362edc6a872a42e9b9460751d8}
		--assert z  = mul256 x  y

	--test-- "multiply-127"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{01}
		z: to-i256 #{1869750cb59bdd8e}
		--assert z  = mul256 x  y

	--test-- "multiply-128"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{02}
		z: to-i256 #{30d2ea196b37bb1c}
		--assert z  = mul256 x  y

	--test-- "multiply-129"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{03fea5ba102e52ba2957367219565d56}
		--assert z  = mul256 x  y

	--test-- "multiply-130"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{04b226500f59735de6569f600f41d848}
		--assert z  = mul256 x  y

	--test-- "multiply-131"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{06d900ad54f49cbd727b42c444f2a950}
		--assert z  = mul256 x  y

	--test-- "multiply-132"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{065480b42b4a7f2fe2e6de3a61c02fba}
		--assert z  = mul256 x  y

	--test-- "multiply-133"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{0d3980e15d25abd33aa35c3de0dbc0ea}
		--assert z  = mul256 x  y

	--test-- "multiply-134"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{13d406a2b6020b4da7bcd0b59e7a161a}
		--assert z  = mul256 x  y

	--test-- "multiply-135"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{11b1defb4da96722e4ba775ec1b3b7ae}
		--assert z  = mul256 x  y

	--test-- "multiply-136"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{174cc75c2e739c81586d11b37d9b2eb0}
		--assert z  = mul256 x  y

	--test-- "multiply-137"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{06c01de6f4ae4ec33a9515bd84758b42}
		--assert z  = mul256 x  y

	--test-- "multiply-138"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{01}
		z: to-i256 #{46ca311ec9ac6057}
		--assert z  = mul256 x  y

	--test-- "multiply-139"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{02}
		z: to-i256 #{8d94623d9358c0ae}
		--assert z  = mul256 x  y

	--test-- "multiply-140"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{0b9579b5efc1c6ac47174031b04629fb}
		--assert z  = mul256 x  y

	--test-- "multiply-141"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{0d9dff22b93bedc0b55451503e2731e4}
		--assert z  = mul256 x  y

	--test-- "multiply-142"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{13db5c8ba0369d592ca12b3782e8da28}
		--assert z  = mul256 x  y

	--test-- "multiply-143"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{125b23522ebce4b4139c687d56a3440d}
		--assert z  = mul256 x  y

	--test-- "multiply-144"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{26594a9bbd62c4151998acf5d8e63325}
		--assert z  = mul256 x  y

	--test-- "multiply-145"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{397f7909fcf32ee89fba2fc07e78643d}
		--assert z  = mul256 x  y

	--test-- "multiply-146"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{334fbb407e1df98b53db73eaafde9c67}
		--assert z  = mul256 x  y

	--test-- "multiply-147"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{4390ae362edc6a872a42e9b9460751d8}
		--assert z  = mul256 x  y

	--test-- "multiply-148"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{06c01de6f4ae4ec33a9515bd84758b42}
		--assert z  = mul256 x  y

	--test-- "multiply-149"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{01}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		--assert z  = mul256 x  y

	--test-- "multiply-150"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{02}
		z: to-i256 #{e98cef5131e2077fa45b9798dba28c5360a216dfa981ee4c9b49cf30026356d8}
		--assert z  = mul256 x  y

	--test-- "multiply-151"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{01}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		--assert z  = mul256 x  y

	--test-- "multiply-152"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{02}
		z: to-i256 #{93c943903d50b667defae9ab3ebe86902e85500d242d14cb8dacb7264d6dd814}
		--assert z  = mul256 x  y

	--test-- "multiply-153"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{01}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		--assert z  = mul256 x  y

	--test-- "multiply-154"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{02}
		z: to-i256 #{2ffe676d993bb9c4b556cc330a7911e80ff9bfd0e75c71ddc2a89e9a9cdf59c6}
		--assert z  = mul256 x  y

	--test-- "multiply-155"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{01}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		--assert z  = mul256 x  y

	--test-- "multiply-156"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{01}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		--assert z  = mul256 x  y

	--test-- "multiply-157"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{01}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		--assert z  = mul256 x  y

	--test-- "multiply-158"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{02}
		z: to-i256 #{687ba8356eeceff7fa889de3ba2bef1e4c96fb5c4bf72d5290a5d9f6a59fc424}
		--assert z  = mul256 x  y

	--test-- "multiply-159"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{01}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		--assert z  = mul256 x  y

	--test-- "multiply-160"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{02}
		z: to-i256 #{98857c2108c3f66874e3486c6f3df8234a6efaddcc23db56a0c53ce14673543c}
		--assert z  = mul256 x  y

	--test-- "multiply-161"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{01}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		--assert z  = mul256 x  y

	--test-- "multiply-162"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{02}
		z: to-i256 #{61b961ce69e37bdc1a9110eea19d41548cbc06a5c21ae0857777a23cd4e667f0}
		--assert z  = mul256 x  y

	--test-- "multiply-163"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{01}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		--assert z  = mul256 x  y

	--test-- "multiply-164"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{01}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		--assert z  = mul256 x  y

===end-group===

===start-group=== "divide"
	--test-- "divide-1"
		x: to-i256 #{02}
		y: to-i256 #{01}
		z: to-i256 #{02}
		--assert z  = div256 x  y

	--test-- "divide-2"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{02}
		z: to-i256 #{7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		--assert z  = div256 x  y

	--test-- "divide-3"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{061c6e4949fbfb19e116b0447b50304af0718ad96888d93bf8}
		--assert z  = div256 x  y

	--test-- "divide-4"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{0532d560deef98dbf136ea9cf56b57b0ef3ca8435c36996e52}
		--assert z  = div256 x  y

	--test-- "divide-5"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{0390a3f1cd76f6b38a92caa55ee915f79ee3d8f87a1ffd541e}
		--assert z  = div256 x  y

	--test-- "divide-6"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{03db431d21030d1edf345a1ef84e941ea2f19a30bffe6b8e7a}
		--assert z  = div256 x  y

	--test-- "divide-7"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{01d88fee35185ca8890562cbac87f460bdd2e9b195eaa6aab7}
		--assert z  = div256 x  y

	--test-- "divide-8"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{013b2e0a270b0f1598cff90eb7dde8b2a923da332bd179307c}
		--assert z  = div256 x  y

	--test-- "divide-9"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{01612e25def4583af6a8ea745e8cfefee948ecf7ec9b55eff1}
		--assert z  = div256 x  y

	--test-- "divide-10"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{010c37cf19312da10ab3652d4da913bd3dfe872f18897c160c}
		--assert z  = div256 x  y

	--test-- "divide-11"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{0a7c96738626f9a3e0d7a151cdc14d158026e9d9c63d9a4af9}
		--assert z  = div256 x  y

	--test-- "divide-12"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{039dc86e7cc402cc383a4d1366b74a1b1f3739e076f0537b69}
		--assert z  = div256 x  y

	--test-- "divide-13"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{02}
		--assert z  = div256 x  y

	--test-- "divide-14"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{03}
		--assert z  = div256 x  y

	--test-- "divide-15"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{0a}
		--assert z  = div256 x  y

	--test-- "divide-16"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-17"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-18"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{04}
		--assert z  = div256 x  y

	--test-- "divide-19"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{03}
		--assert z  = div256 x  y

	--test-- "divide-20"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{05}
		--assert z  = div256 x  y

	--test-- "divide-21"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-22"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-23"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{01}
		z: to-i256 #{29e42a8d59042cfd}
		--assert z  = div256 x  y

	--test-- "divide-24"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{02}
		z: to-i256 #{14f21546ac82167e}
		--assert z  = div256 x  y

	--test-- "divide-25"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-26"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{01}
		z: to-i256 #{313e8c305103debc}
		--assert z  = div256 x  y

	--test-- "divide-27"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{02}
		z: to-i256 #{189f46182881ef5e}
		--assert z  = div256 x  y

	--test-- "divide-28"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-29"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{02}
		--assert z  = div256 x  y

	--test-- "divide-30"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{01}
		z: to-i256 #{47cf2956be337e18}
		--assert z  = div256 x  y

	--test-- "divide-31"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{02}
		z: to-i256 #{23e794ab5f19bf0c}
		--assert z  = div256 x  y

	--test-- "divide-32"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-33"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-34"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-35"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{02}
		--assert z  = div256 x  y

	--test-- "divide-36"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-37"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{01}
		z: to-i256 #{4261adbfa675703b}
		--assert z  = div256 x  y

	--test-- "divide-38"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{02}
		z: to-i256 #{2130d6dfd33ab81d}
		--assert z  = div256 x  y

	--test-- "divide-39"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-40"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-41"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{02}
		--assert z  = div256 x  y

	--test-- "divide-42"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{01}
		z: to-i256 #{8aaea8e413a5aae3}
		--assert z  = div256 x  y

	--test-- "divide-43"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{02}
		z: to-i256 #{4557547209d2d571}
		--assert z  = div256 x  y

	--test-- "divide-44"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{03}
		--assert z  = div256 x  y

	--test-- "divide-45"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{02}
		--assert z  = div256 x  y

	--test-- "divide-46"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-47"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{02}
		--assert z  = div256 x  y

	--test-- "divide-48"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{05}
		--assert z  = div256 x  y

	--test-- "divide-49"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-50"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{01}
		z: to-i256 #{cfee9cc0728f738b}
		--assert z  = div256 x  y

	--test-- "divide-51"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{02}
		z: to-i256 #{67f74e603947b9c5}
		--assert z  = div256 x  y

	--test-- "divide-52"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{04}
		--assert z  = div256 x  y

	--test-- "divide-53"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{04}
		--assert z  = div256 x  y

	--test-- "divide-54"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{02}
		--assert z  = div256 x  y

	--test-- "divide-55"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{03}
		--assert z  = div256 x  y

	--test-- "divide-56"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-57"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-58"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{08}
		--assert z  = div256 x  y

	--test-- "divide-59"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{02}
		--assert z  = div256 x  y

	--test-- "divide-60"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{01}
		z: to-i256 #{b98f44079672da71}
		--assert z  = div256 x  y

	--test-- "divide-61"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{02}
		z: to-i256 #{5cc7a203cb396d38}
		--assert z  = div256 x  y

	--test-- "divide-62"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{04}
		--assert z  = div256 x  y

	--test-- "divide-63"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{03}
		--assert z  = div256 x  y

	--test-- "divide-64"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{02}
		--assert z  = div256 x  y

	--test-- "divide-65"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{02}
		--assert z  = div256 x  y

	--test-- "divide-66"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-67"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{07}
		--assert z  = div256 x  y

	--test-- "divide-68"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{02}
		--assert z  = div256 x  y

	--test-- "divide-69"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{01}
		z: to-i256 #{f456abaafa5235e8}
		--assert z  = div256 x  y

	--test-- "divide-70"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{02}
		z: to-i256 #{7a2b55d57d291af4}
		--assert z  = div256 x  y

	--test-- "divide-71"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{05}
		--assert z  = div256 x  y

	--test-- "divide-72"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{04}
		--assert z  = div256 x  y

	--test-- "divide-73"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{03}
		--assert z  = div256 x  y

	--test-- "divide-74"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{03}
		--assert z  = div256 x  y

	--test-- "divide-75"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-76"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-77"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-78"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{0a}
		--assert z  = div256 x  y

	--test-- "divide-79"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{03}
		--assert z  = div256 x  y

	--test-- "divide-80"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{01}
		z: to-i256 #{1869750cb59bdd8e}
		--assert z  = div256 x  y

	--test-- "divide-81"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{02}
		z: to-i256 #{0c34ba865acdeec7}
		--assert z  = div256 x  y

	--test-- "divide-82"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{01}
		z: to-i256 #{46ca311ec9ac6057}
		--assert z  = div256 x  y

	--test-- "divide-83"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{02}
		z: to-i256 #{2365188f64d6302b}
		--assert z  = div256 x  y

	--test-- "divide-84"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-85"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-86"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-87"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{02}
		--assert z  = div256 x  y

	--test-- "divide-88"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{01}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		--assert z  = div256 x  y

	--test-- "divide-89"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{02}
		z: to-i256 #{3a633bd44c7881dfe916e5e636e8a314d82885b7ea607b9326d273cc0098d5b6}
		--assert z  = div256 x  y

	--test-- "divide-90"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{02c99ed1bfc87a7edf8a023875ed0c517605a0c4d6826ccef6}
		--assert z  = div256 x  y

	--test-- "divide-91"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{025f106efb98216772f6199078602c07c168ea69d23c096008}
		--assert z  = div256 x  y

	--test-- "divide-92"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{01a04dd2f3610b8c92cb8ca2183b3fba899e9a911daf7ab5b0}
		--assert z  = div256 x  y

	--test-- "divide-93"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{01c257cc91e1511627af2cca8988f3696df901b35e95434918}
		--assert z  = div256 x  y

	--test-- "divide-94"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{d78f94246c9c310e0d2c213a5e79a21d5155538a08acb95b}
		--assert z  = div256 x  y

	--test-- "divide-95"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{8fc5358784704433a8ec76df73c664f17c161c7f3f6d9d60}
		--assert z  = div256 x  y

	--test-- "divide-96"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{a11ab7ef5e0c5cf4f26f8e1328eeb10ac05dca7722ebbc2a}
		--assert z  = div256 x  y

	--test-- "divide-97"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{7a593a602de6fc16708f375caf2de34294a0fcd16975ba41}
		--assert z  = div256 x  y

	--test-- "divide-98"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{04c8956f8819b33509fcba47de372a29e0582fab27e249a246}
		--assert z  = div256 x  y

	--test-- "divide-99"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{01a64c8bcfdd4bf88a7e6c498c8a515f34d5cb2f562c81b0f6}
		--assert z  = div256 x  y

	--test-- "divide-100"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-101"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{04}
		--assert z  = div256 x  y

	--test-- "divide-102"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{02}
		--assert z  = div256 x  y

	--test-- "divide-103"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-104"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{02}
		--assert z  = div256 x  y

	--test-- "divide-105"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{01}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		--assert z  = div256 x  y

	--test-- "divide-106"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{02}
		z: to-i256 #{24f250e40f542d99f7beba6acfafa1a40ba15403490b4532e36b2dc9935b7605}
		--assert z  = div256 x  y

	--test-- "divide-107"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{01c390a1c7ac5991995d079204d85793deac3418dd569d3906}
		--assert z  = div256 x  y

	--test-- "divide-108"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{01802367b260e015378690705d8d09bee1260b3311fc8fed4f}
		--assert z  = div256 x  y

	--test-- "divide-109"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{01076dd2b77a5cd450b3196fafabf2fae1bee7f2dacb7ca214}
		--assert z  = div256 x  y

	--test-- "divide-110"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{011cf7dafd53411b60e8b95fd2f143fc75043da50df7e7b0fe}
		--assert z  = div256 x  y

	--test-- "divide-111"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{886715c13915411c0f15f1a2d22db0cddb31d801a1519aa4}
		--assert z  = div256 x  y

	--test-- "divide-112"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{5af99d1483064ebd7b52972292b6eb304d40520a72c0a36e}
		--assert z  = div256 x  y

	--test-- "divide-113"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{65f195186a6941cb44de2416ed61b8d6ee7c5d0d8c563c7e}
		--assert z  = div256 x  y

	--test-- "divide-114"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{4d6b7543666d619eb5908c88fac3badc1e1325e10b0ba7b0}
		--assert z  = div256 x  y

	--test-- "divide-115"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{0306e47d7d5a48a61229ee1866db5bde4e5265d23fc587a68c}
		--assert z  = div256 x  y

	--test-- "divide-116"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{010b38f712bbf479c60073f29a0622ddffdbd5f08e0bfea2d7}
		--assert z  = div256 x  y

	--test-- "divide-117"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{03}
		--assert z  = div256 x  y

	--test-- "divide-118"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-119"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-120"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{01}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		--assert z  = div256 x  y

	--test-- "divide-121"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{02}
		z: to-i256 #{0bff99db664eee712d55b30cc29e447a03fe6ff439d71c7770aa27a6a737d671}
		--assert z  = div256 x  y

	--test-- "divide-122"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{92a57677b7c3fe1e1c85ca1fe23995aa383c31e81189c9e9}
		--assert z  = div256 x  y

	--test-- "divide-123"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{7cbfdb16534d5f95b252194fef0b002bf77bad65732f4541}
		--assert z  = div256 x  y

	--test-- "divide-124"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{558c8663a888ed52e0f3eef799f2603dd899d99162dfe92e}
		--assert z  = div256 x  y

	--test-- "divide-125"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{5c8b36e750c6c8215e23a9e55277068b69252f3c26ec47a2}
		--assert z  = div256 x  y

	--test-- "divide-126"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{2c4c053b28919edee48a0c7ccfc9e7ad33a31448a04f3721}
		--assert z  = div256 x  y

	--test-- "divide-127"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{1d8b5570d98e6932b1aedbefaaf3216f441d77df7982ebda}
		--assert z  = div256 x  y

	--test-- "divide-128"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{211b39b723ae3895042a42e8bb64a0df3de65bc0fd63fbb7}
		--assert z  = div256 x  y

	--test-- "divide-129"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{1924656131d4354fa12d9b12e26073a377d7972936828e56}
		--assert z  = div256 x  y

	--test-- "divide-130"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{fba5bc8d0dda7431a0b6fc41ec7bd0e2651112729470646e}
		--assert z  = div256 x  y

	--test-- "divide-131"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{56c7e797425b81a4626ae31aab07badb7a4de72452255fc5}
		--assert z  = div256 x  y

	--test-- "divide-132"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{01}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		--assert z  = div256 x  y

	--test-- "divide-133"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{02}
		z: to-i256 #{4a408471fe1f8f5689ef8d9dc39cc8ff5927e071dab0abdd9441af2ca575a091}
		--assert z  = div256 x  y

	--test-- "divide-134"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{038b844c466188bbb7edcf4e6fd20cabbcaeb635209f611aef}
		--assert z  = div256 x  y

	--test-- "divide-135"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{03040227be906925b09148910f4c82b2d317107838ac5f17ce}
		--assert z  = div256 x  y

	--test-- "divide-136"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{02116aca19857fcebfc6b1ce42fbf6f5c93c50bd0b67c2fecb}
		--assert z  = div256 x  y

	--test-- "divide-137"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{023cb46bf2159b7851b6de70cdc8654d9a9f5fb1d375d428e2}
		--assert z  = div256 x  y

	--test-- "divide-138"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{01122166a7138aec7fe27f7bf76cde1487f0aa4ba6b19596dc}
		--assert z  = div256 x  y

	--test-- "divide-139"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{b6d57b03d0c48c24eb8cd10cc74c5d31ff64a2b9285719aa}
		--assert z  = div256 x  y

	--test-- "divide-140"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{cce0b269f3b730d6b675950db7bd1ee4769d8d8b739e7967}
		--assert z  = div256 x  y

	--test-- "divide-141"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{9b97752a885ea7b50302d8543bec658a82360ed83f18cf0f}
		--assert z  = div256 x  y

	--test-- "divide-142"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{0615501fd547609c250d6b30e1613435456252e5494c6c6293}
		--assert z  = div256 x  y

	--test-- "divide-143"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{02190a82068a93d240b5cfc30393d1e59b66323536846cf2c2}
		--assert z  = div256 x  y

	--test-- "divide-144"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-145"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{02}
		--assert z  = div256 x  y

	--test-- "divide-146"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{06}
		--assert z  = div256 x  y

	--test-- "divide-147"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{02}
		--assert z  = div256 x  y

	--test-- "divide-148"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-149"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{03}
		--assert z  = div256 x  y

	--test-- "divide-150"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{01}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		--assert z  = div256 x  y

	--test-- "divide-151"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{02}
		z: to-i256 #{4bd4f42d73ae90164af3ccfa0c431b4aafd7f00d35d6b72e3c8302dfae293cda}
		--assert z  = div256 x  y

	--test-- "divide-152"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{039ed35df87c89e236a226843aa8943f605476a9e443e80da8}
		--assert z  = div256 x  y

	--test-- "divide-153"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{03146f22ea641016570bf43d8dca623e2716d49e8ab5bffc5a}
		--assert z  = div256 x  y

	--test-- "divide-154"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{021cae6c3377643041574e4965eabc6247bde3e24ddabd9508}
		--assert z  = div256 x  y

	--test-- "divide-155"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{0248e3d59017d69bfcb3d92996bbfa7868d801dfabeb0ab10d}
		--assert z  = div256 x  y

	--test-- "divide-156"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{0117f6896fcffb60f25b719706bdf0fc733aa4d4f05c679490}
		--assert z  = div256 x  y

	--test-- "divide-157"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{bab957735f8858f18454785a7072fb0551a511a597aef56c}
		--assert z  = div256 x  y

	--test-- "divide-158"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{d13ca05cbe0bd52b7ee03469bee1a4e166c9967043a62fcf}
		--assert z  = div256 x  y

	--test-- "divide-159"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{9ee6ef716558f264ebee576b6d604834915ab5cc49d927f8}
		--assert z  = div256 x  y

	--test-- "divide-160"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{0636728218045f813f201a3828afb2c7e281c77095c8aec998}
		--assert z  = div256 x  y

	--test-- "divide-161"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{022477aac2e94397aa70203a148b10ffb5cb43a8e381d3b240}
		--assert z  = div256 x  y

	--test-- "divide-162"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-163"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{02}
		--assert z  = div256 x  y

	--test-- "divide-164"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{06}
		--assert z  = div256 x  y

	--test-- "divide-165"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-166"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{02}
		--assert z  = div256 x  y

	--test-- "divide-167"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-168"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{03}
		--assert z  = div256 x  y

	--test-- "divide-169"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{01}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		--assert z  = div256 x  y

	--test-- "divide-170"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{02}
		z: to-i256 #{1a1eea0d5bbb3bfdfea22778ee8afbc79325bed712fdcb54a429767da967f109}
		--assert z  = div256 x  y

	--test-- "divide-171"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{013f403d5916db90bb475590a27c6288f6dd9092a22c0f6498}
		--assert z  = div256 x  y

	--test-- "divide-172"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{010f94c328f56cff8183322337505f99f45bbacd58de36fac6}
		--assert z  = div256 x  y

	--test-- "divide-173"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{ba3db8555d0fb3cd315c734705f7db4cdb2580bc05c52b7c}
		--assert z  = div256 x  y

	--test-- "divide-174"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{c97812e341f289c0e32e34c132e81308651aa9d518b241c8}
		--assert z  = div256 x  y

	--test-- "divide-175"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{606f5e370e255cfd03f9fa3b98fee9fb0dde79cd37f64599}
		--assert z  = div256 x  y

	--test-- "divide-176"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{4051792b5e81d44e08a6785a5c3c19cf09e7edacced98634}
		--assert z  = div256 x  y

	--test-- "divide-177"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{4812ac4f62ea0dddf7927109796844956198a0d5ff310611}
		--assert z  = div256 x  y

	--test-- "divide-178"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{36bc1d97ac61e658c11849e133fb16a9a3e8886910455dbf}
		--assert z  = div256 x  y

	--test-- "divide-179"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{0223d6ef9589beb6d706470d53c09542ceebcd4770810349fb}
		--assert z  = div256 x  y

	--test-- "divide-180"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{bcec4e3e44dc8469df0ba2f06d986cd72c82230e35ae3c35}
		--assert z  = div256 x  y

	--test-- "divide-181"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{02}
		--assert z  = div256 x  y

	--test-- "divide-182"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-183"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{01}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		--assert z  = div256 x  y

	--test-- "divide-184"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{02}
		z: to-i256 #{26215f084230fd9a1d38d21b1bcf7e08d29bbeb77308f6d5a8314f38519cd50f}
		--assert z  = div256 x  y

	--test-- "divide-185"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{01d2089bafa62aa2c2d40ab00cd7ab79f07a4faf895998b748}
		--assert z  = div256 x  y

	--test-- "divide-186"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{018c724fd5640a0d2a1e718f3ef49c9a894aeb85b18512d733}
		--assert z  = div256 x  y

	--test-- "divide-187"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{010fde9ba1e5f15a6175e732f082d4e01c6ff86d909efeed9e}
		--assert z  = div256 x  y

	--test-- "divide-188"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{01261950eed1c379176e7b82538d0c08644f403964bc3292a7}
		--assert z  = div256 x  y

	--test-- "divide-189"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{8cc5eeac7d152a649627c8ce2988592ee01c0e33c3e8a797}
		--assert z  = div256 x  y

	--test-- "divide-190"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{5de3d6e2b6bf4fe73dddf9e7cf9531f08506e5df34482d6d}
		--assert z  = div256 x  y

	--test-- "divide-191"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{6935c75afda6001ccb9e82f7e50d20c61814a6d491e227f7}
		--assert z  = div256 x  y

	--test-- "divide-192"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{4fe67f0198fd4cc588eaee9cfbddb2db07c0ee1054bf17c0}
		--assert z  = div256 x  y

	--test-- "divide-193"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{031fb8923a7b8e0530dfd9e5236b0fc79aa02be27818b62dc3}
		--assert z  = div256 x  y

	--test-- "divide-194"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{0113c8ddd003a08cfa424944a6c7f689cd926c797b51643189}
		--assert z  = div256 x  y

	--test-- "divide-195"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-196"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{03}
		--assert z  = div256 x  y

	--test-- "divide-197"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-198"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-199"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{01}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		--assert z  = div256 x  y

	--test-- "divide-200"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{02}
		z: to-i256 #{186e58739a78def706a4443ba8675055232f01a97086b8215ddde88f353999fc}
		--assert z  = div256 x  y

	--test-- "divide-201"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{012a99559598465305a4b57b2d76d31c7d9c184cfcffa9cbc1}
		--assert z  = div256 x  y

	--test-- "divide-202"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{fe03492db0e24c681238a48d99f86c9cca6cd69cf44763b9}
		--assert z  = div256 x  y

	--test-- "divide-203"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{ae3180e349cc0c6a4a88ec917c90e03b3a5d50bd0a4a7e7b}
		--assert z  = div256 x  y

	--test-- "divide-204"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{bc6fad5d02b4f882e08551daf53a785830030d40bcffcd8d}
		--assert z  = div256 x  y

	--test-- "divide-205"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{5a325ee869923c5ef05e0bbb1e60ef1f9b0fb86a5ecd93f8}
		--assert z  = div256 x  y

	--test-- "divide-206"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{3c2857445a5550161f6e5930ff5e6a66aae946518e1ac538}
		--assert z  = div256 x  y

	--test-- "divide-207"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{43691ed10d22dd367d8213e35a7f4a71b27ae4ed22161d85}
		--assert z  = div256 x  y

	--test-- "divide-208"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{3331b0234f14a08cd82057054cec0e6a08a019208c4c559a}
		--assert z  = div256 x  y

	--test-- "divide-209"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{020066861474fc66f13d401f274cd46b27138ccdf184e39a04}
		--assert z  = div256 x  y

	--test-- "divide-210"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{b0b3acb4434161040b64e500dfcf3a6690729213196782e4}
		--assert z  = div256 x  y

	--test-- "divide-211"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{02}
		--assert z  = div256 x  y

	--test-- "divide-212"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{01}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		--assert z  = div256 x  y

	--test-- "divide-213"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{02}
		z: to-i256 #{6efef61e9d39914e58be5edf944a234b5a8ecc9779ac7d5990755bf729324a18}
		--assert z  = div256 x  y

	--test-- "divide-214"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{054c9af1ef23ae0d164fa062bad05d0cefd015f3a3f377a904}
		--assert z  = div256 x  y

	--test-- "divide-215"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{04820a3d9c332a3bac8dfb7f61754916de1dcc17349d509033}
		--assert z  = div256 x  y

	--test-- "divide-216"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{031766c3f5c21b2c4165fb90ec2ab7655f7f961e16fb58bf04}
		--assert z  = div256 x  y

	--test-- "divide-217"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{03581c30874883f086c9229b103ea72c110cbc190810377c21}
		--assert z  = div256 x  y

	--test-- "divide-218"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{0199c8faf7f64aeab178dc0327b78499f3aa9a92ddf4b4c234}
		--assert z  = div256 x  y

	--test-- "divide-219"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{01114f5e1d906c8ba53e07bad7bf627130aae7540d24e21f49}
		--assert z  = div256 x  y

	--test-- "divide-220"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{0132432737e9d3818a998038484b490c3b90f8b473531ddb6a}
		--assert z  = div256 x  y

	--test-- "divide-221"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{e896387404ced6b67fb521ebd87c2571568400f1c61225ae}
		--assert z  = div256 x  y

	--test-- "divide-222"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{0917f4afc7c284b2cef2491e2a6ed308fbb7c0ff04fb5c4dfc}
		--assert z  = div256 x  y

	--test-- "divide-223"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{0322cc4cc9188140bad3f3ec51231af3e2c8302473683b0ce3}
		--assert z  = div256 x  y

	--test-- "divide-224"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-225"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{03}
		--assert z  = div256 x  y

	--test-- "divide-226"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{09}
		--assert z  = div256 x  y

	--test-- "divide-227"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-228"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-229"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{04}
		--assert z  = div256 x  y

	--test-- "divide-230"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{02}
		--assert z  = div256 x  y

	--test-- "divide-231"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{04}
		--assert z  = div256 x  y

	--test-- "divide-232"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-233"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{01}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		--assert z  = div256 x  y

	--test-- "divide-234"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{02}
		z: to-i256 #{6dc98c4f4498df517c215d3144360940552bd9bf48ca2a648b66627feb70dcdf}
		--assert z  = div256 x  y

	--test-- "divide-235"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{053dd542798962aeeede646909694858dee9339c8898dfaca9}
		--assert z  = div256 x  y

	--test-- "divide-236"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{0475793a6180f8d3b446de9fab6da5e720556f426a00433b36}
		--assert z  = div256 x  y

	--test-- "divide-237"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{030ec8a5c32ab3ee9e187d75b66bed7d0177bf523e03b99083}
		--assert z  = div256 x  y

	--test-- "divide-238"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{034ec9b066a6cece3a546707693bb7bd17d3ecbd677d809a68}
		--assert z  = div256 x  y

	--test-- "divide-239"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{019552a8df58bf1a5e61a07a9337900588f9c14023628acd3b}
		--assert z  = div256 x  y

	--test-- "divide-240"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{010e557c6ebb28103904b57bf3c25f37bc32c7649c10461951}
		--assert z  = div256 x  y

	--test-- "divide-241"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{012eed69dc855c62b8985f44da8d4e8a899d5cb9aed0df5714}
		--assert z  = div256 x  y

	--test-- "divide-242"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{e60ddc01ce23705f8c2485edc647e4a218f9968b1b040fb4}
		--assert z  = div256 x  y

	--test-- "divide-243"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{08fe9b4164b7c5fcc17bec47292c44ba68ad903c2b6e8fcfa0}
		--assert z  = div256 x  y

	--test-- "divide-244"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{031a0e69a44986fd96a271bd04d1e01d389a90526b5a3cb765}
		--assert z  = div256 x  y

	--test-- "divide-245"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-246"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{02}
		--assert z  = div256 x  y

	--test-- "divide-247"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{09}
		--assert z  = div256 x  y

	--test-- "divide-248"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-249"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{01}
		--assert z  = div256 x  y

	--test-- "divide-250"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{04}
		--assert z  = div256 x  y

	--test-- "divide-251"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{02}
		--assert z  = div256 x  y

	--test-- "divide-252"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{04}
		--assert z  = div256 x  y

===end-group===

===start-group=== "modulo"
	--test-- "modulo-1"
		x: to-i256 #{01}
		y: to-i256 #{02}
		z: to-i256 #{01}
		--assert z  = mod256 x  y

	--test-- "modulo-2"
		x: to-i256 #{01}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: to-i256 #{01}
		--assert z  = mod256 x  y

	--test-- "modulo-3"
		x: to-i256 #{01}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{01}
		--assert z  = mod256 x  y

	--test-- "modulo-4"
		x: to-i256 #{01}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{01}
		--assert z  = mod256 x  y

	--test-- "modulo-5"
		x: to-i256 #{01}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{01}
		--assert z  = mod256 x  y

	--test-- "modulo-6"
		x: to-i256 #{01}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{01}
		--assert z  = mod256 x  y

	--test-- "modulo-7"
		x: to-i256 #{01}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{01}
		--assert z  = mod256 x  y

	--test-- "modulo-8"
		x: to-i256 #{01}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{01}
		--assert z  = mod256 x  y

	--test-- "modulo-9"
		x: to-i256 #{01}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{01}
		--assert z  = mod256 x  y

	--test-- "modulo-10"
		x: to-i256 #{01}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{01}
		--assert z  = mod256 x  y

	--test-- "modulo-11"
		x: to-i256 #{01}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{01}
		--assert z  = mod256 x  y

	--test-- "modulo-12"
		x: to-i256 #{01}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{01}
		--assert z  = mod256 x  y

	--test-- "modulo-13"
		x: to-i256 #{01}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{01}
		--assert z  = mod256 x  y

	--test-- "modulo-14"
		x: to-i256 #{01}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{01}
		--assert z  = mod256 x  y

	--test-- "modulo-15"
		x: to-i256 #{01}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{01}
		--assert z  = mod256 x  y

	--test-- "modulo-16"
		x: to-i256 #{01}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{01}
		--assert z  = mod256 x  y

	--test-- "modulo-17"
		x: to-i256 #{01}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{01}
		--assert z  = mod256 x  y

	--test-- "modulo-18"
		x: to-i256 #{01}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{01}
		--assert z  = mod256 x  y

	--test-- "modulo-19"
		x: to-i256 #{01}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{01}
		--assert z  = mod256 x  y

	--test-- "modulo-20"
		x: to-i256 #{01}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{01}
		--assert z  = mod256 x  y

	--test-- "modulo-21"
		x: to-i256 #{01}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{01}
		--assert z  = mod256 x  y

	--test-- "modulo-22"
		x: to-i256 #{01}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{01}
		--assert z  = mod256 x  y

	--test-- "modulo-23"
		x: to-i256 #{02}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: to-i256 #{02}
		--assert z  = mod256 x  y

	--test-- "modulo-24"
		x: to-i256 #{02}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{02}
		--assert z  = mod256 x  y

	--test-- "modulo-25"
		x: to-i256 #{02}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{02}
		--assert z  = mod256 x  y

	--test-- "modulo-26"
		x: to-i256 #{02}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{02}
		--assert z  = mod256 x  y

	--test-- "modulo-27"
		x: to-i256 #{02}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{02}
		--assert z  = mod256 x  y

	--test-- "modulo-28"
		x: to-i256 #{02}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{02}
		--assert z  = mod256 x  y

	--test-- "modulo-29"
		x: to-i256 #{02}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{02}
		--assert z  = mod256 x  y

	--test-- "modulo-30"
		x: to-i256 #{02}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{02}
		--assert z  = mod256 x  y

	--test-- "modulo-31"
		x: to-i256 #{02}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{02}
		--assert z  = mod256 x  y

	--test-- "modulo-32"
		x: to-i256 #{02}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{02}
		--assert z  = mod256 x  y

	--test-- "modulo-33"
		x: to-i256 #{02}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{02}
		--assert z  = mod256 x  y

	--test-- "modulo-34"
		x: to-i256 #{02}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{02}
		--assert z  = mod256 x  y

	--test-- "modulo-35"
		x: to-i256 #{02}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{02}
		--assert z  = mod256 x  y

	--test-- "modulo-36"
		x: to-i256 #{02}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{02}
		--assert z  = mod256 x  y

	--test-- "modulo-37"
		x: to-i256 #{02}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{02}
		--assert z  = mod256 x  y

	--test-- "modulo-38"
		x: to-i256 #{02}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{02}
		--assert z  = mod256 x  y

	--test-- "modulo-39"
		x: to-i256 #{02}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{02}
		--assert z  = mod256 x  y

	--test-- "modulo-40"
		x: to-i256 #{02}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{02}
		--assert z  = mod256 x  y

	--test-- "modulo-41"
		x: to-i256 #{02}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{02}
		--assert z  = mod256 x  y

	--test-- "modulo-42"
		x: to-i256 #{02}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{02}
		--assert z  = mod256 x  y

	--test-- "modulo-43"
		x: to-i256 #{02}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{02}
		--assert z  = mod256 x  y

	--test-- "modulo-44"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{02}
		z: to-i256 #{01}
		--assert z  = mod256 x  y

	--test-- "modulo-45"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{0ad6cb5543211be7}
		--assert z  = mod256 x  y

	--test-- "modulo-46"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{03b3d9da9cb1dfc7}
		--assert z  = mod256 x  y

	--test-- "modulo-47"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{0d7524d44adf592f}
		--assert z  = mod256 x  y

	--test-- "modulo-48"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{23a7ffe0151ec9e1}
		--assert z  = mod256 x  y

	--test-- "modulo-49"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{29f53b2aa3e619ba}
		--assert z  = mod256 x  y

	--test-- "modulo-50"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{1f0fa0d28526f8ab}
		--assert z  = mod256 x  y

	--test-- "modulo-51"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{b630f9d5316bdc9e}
		--assert z  = mod256 x  y

	--test-- "modulo-52"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{45755e0def23891f}
		--assert z  = mod256 x  y

	--test-- "modulo-53"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{05135cc22fee74e1}
		--assert z  = mod256 x  y

	--test-- "modulo-54"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{194b8a2aa9cdaf50}
		--assert z  = mod256 x  y

	--test-- "modulo-55"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{167310aece1df8805ba46867245d73ac9f5de920567e11b364b630cffd9ca927}
		--assert z  = mod256 x  y

	--test-- "modulo-56"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{22521aa7a406ee643187a17f21e23627ba3807ec49bc60ceab7ced468bdb3be1}
		--assert z  = mod256 x  y

	--test-- "modulo-57"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{1007fadc01d55f28754e0300cba2a677b01f40eb7b31c6ab32b4e6faefa33f21}
		--assert z  = mod256 x  y

	--test-- "modulo-58"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{6b7ef71c03c0e152ec20e4c478c66e014db03f1c4a9ea844d77ca1a6b514bedc}
		--assert z  = mod256 x  y

	--test-- "modulo-59"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{685617a518a2dfd36a18660be779c96aa0501fe5945291a386f9fa40a3ad864b}
		--assert z  = mod256 x  y

	--test-- "modulo-60"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{2f08af95222620100aeec4388ba821c366d209476811a55adeb44c12b4c077b7}
		--assert z  = mod256 x  y

	--test-- "modulo-61"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{1b37c5ce72da0e6350ab135d59230bcb105987b34dca36fe0ed824ae165301a5}
		--assert z  = mod256 x  y

	--test-- "modulo-62"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{0bb08b7bf7474a59bd9555ab6bf6dcaca029ef619abcceb25554ea67ebbffc27}
		--assert z  = mod256 x  y

	--test-- "modulo-63"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{220213c2c58cdd634e834240d76bb9694ae266d10ca7054cdf154811ad9b6bce}
		--assert z  = mod256 x  y

	--test-- "modulo-64"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{246ce76176ce415d07bd459d7793ed7f55a84c816e6bab36e9333b00291e4640}
		--assert z  = mod256 x  y

	--test-- "modulo-65"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{02}
		z: to-i256 #{01}
		--assert z  = mod256 x  y

	--test-- "modulo-66"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: to-i256 #{29e42a8d59042cfd}
		--assert z  = mod256 x  y

	--test-- "modulo-67"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{29e42a8d59042cfd}
		--assert z  = mod256 x  y

	--test-- "modulo-68"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{29e42a8d59042cfd}
		--assert z  = mod256 x  y

	--test-- "modulo-69"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{29e42a8d59042cfd}
		--assert z  = mod256 x  y

	--test-- "modulo-70"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{29e42a8d59042cfd}
		--assert z  = mod256 x  y

	--test-- "modulo-71"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{29e42a8d59042cfd}
		--assert z  = mod256 x  y

	--test-- "modulo-72"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{29e42a8d59042cfd}
		--assert z  = mod256 x  y

	--test-- "modulo-73"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{29e42a8d59042cfd}
		--assert z  = mod256 x  y

	--test-- "modulo-74"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{117ab580a3684f6f}
		--assert z  = mod256 x  y

	--test-- "modulo-75"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{29e42a8d59042cfd}
		--assert z  = mod256 x  y

	--test-- "modulo-76"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{29e42a8d59042cfd}
		--assert z  = mod256 x  y

	--test-- "modulo-77"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{29e42a8d59042cfd}
		--assert z  = mod256 x  y

	--test-- "modulo-78"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{29e42a8d59042cfd}
		--assert z  = mod256 x  y

	--test-- "modulo-79"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{29e42a8d59042cfd}
		--assert z  = mod256 x  y

	--test-- "modulo-80"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{29e42a8d59042cfd}
		--assert z  = mod256 x  y

	--test-- "modulo-81"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{29e42a8d59042cfd}
		--assert z  = mod256 x  y

	--test-- "modulo-82"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{29e42a8d59042cfd}
		--assert z  = mod256 x  y

	--test-- "modulo-83"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{29e42a8d59042cfd}
		--assert z  = mod256 x  y

	--test-- "modulo-84"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{29e42a8d59042cfd}
		--assert z  = mod256 x  y

	--test-- "modulo-85"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{29e42a8d59042cfd}
		--assert z  = mod256 x  y

	--test-- "modulo-86"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: to-i256 #{313e8c305103debc}
		--assert z  = mod256 x  y

	--test-- "modulo-87"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{075a61a2f7ffb1bf}
		--assert z  = mod256 x  y

	--test-- "modulo-88"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{313e8c305103debc}
		--assert z  = mod256 x  y

	--test-- "modulo-89"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{313e8c305103debc}
		--assert z  = mod256 x  y

	--test-- "modulo-90"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{313e8c305103debc}
		--assert z  = mod256 x  y

	--test-- "modulo-91"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{313e8c305103debc}
		--assert z  = mod256 x  y

	--test-- "modulo-92"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{313e8c305103debc}
		--assert z  = mod256 x  y

	--test-- "modulo-93"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{313e8c305103debc}
		--assert z  = mod256 x  y

	--test-- "modulo-94"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{6ba216e5cc23a0}
		--assert z  = mod256 x  y

	--test-- "modulo-95"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{313e8c305103debc}
		--assert z  = mod256 x  y

	--test-- "modulo-96"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{313e8c305103debc}
		--assert z  = mod256 x  y

	--test-- "modulo-97"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{313e8c305103debc}
		--assert z  = mod256 x  y

	--test-- "modulo-98"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{313e8c305103debc}
		--assert z  = mod256 x  y

	--test-- "modulo-99"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{313e8c305103debc}
		--assert z  = mod256 x  y

	--test-- "modulo-100"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{313e8c305103debc}
		--assert z  = mod256 x  y

	--test-- "modulo-101"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{313e8c305103debc}
		--assert z  = mod256 x  y

	--test-- "modulo-102"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{313e8c305103debc}
		--assert z  = mod256 x  y

	--test-- "modulo-103"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{313e8c305103debc}
		--assert z  = mod256 x  y

	--test-- "modulo-104"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{313e8c305103debc}
		--assert z  = mod256 x  y

	--test-- "modulo-105"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{313e8c305103debc}
		--assert z  = mod256 x  y

	--test-- "modulo-106"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: to-i256 #{47cf2956be337e18}
		--assert z  = mod256 x  y

	--test-- "modulo-107"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{1deafec9652f511b}
		--assert z  = mod256 x  y

	--test-- "modulo-108"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{16909d266d2f9f5c}
		--assert z  = mod256 x  y

	--test-- "modulo-109"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{056d7b9717be0ddd}
		--assert z  = mod256 x  y

	--test-- "modulo-110"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{47cf2956be337e18}
		--assert z  = mod256 x  y

	--test-- "modulo-111"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{47cf2956be337e18}
		--assert z  = mod256 x  y

	--test-- "modulo-112"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{47cf2956be337e18}
		--assert z  = mod256 x  y

	--test-- "modulo-113"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{47cf2956be337e18}
		--assert z  = mod256 x  y

	--test-- "modulo-114"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{16fc3f3d52fbc2fc}
		--assert z  = mod256 x  y

	--test-- "modulo-115"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{0104f837f4871dc1}
		--assert z  = mod256 x  y

	--test-- "modulo-116"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{47cf2956be337e18}
		--assert z  = mod256 x  y

	--test-- "modulo-117"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{47cf2956be337e18}
		--assert z  = mod256 x  y

	--test-- "modulo-118"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{47cf2956be337e18}
		--assert z  = mod256 x  y

	--test-- "modulo-119"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{47cf2956be337e18}
		--assert z  = mod256 x  y

	--test-- "modulo-120"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{47cf2956be337e18}
		--assert z  = mod256 x  y

	--test-- "modulo-121"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{47cf2956be337e18}
		--assert z  = mod256 x  y

	--test-- "modulo-122"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{47cf2956be337e18}
		--assert z  = mod256 x  y

	--test-- "modulo-123"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{47cf2956be337e18}
		--assert z  = mod256 x  y

	--test-- "modulo-124"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{47cf2956be337e18}
		--assert z  = mod256 x  y

	--test-- "modulo-125"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{47cf2956be337e18}
		--assert z  = mod256 x  y

	--test-- "modulo-126"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{02}
		z: to-i256 #{01}
		--assert z  = mod256 x  y

	--test-- "modulo-127"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: to-i256 #{4261adbfa675703b}
		--assert z  = mod256 x  y

	--test-- "modulo-128"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{187d83324d71433e}
		--assert z  = mod256 x  y

	--test-- "modulo-129"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{1123218f5571917f}
		--assert z  = mod256 x  y

	--test-- "modulo-130"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{4261adbfa675703b}
		--assert z  = mod256 x  y

	--test-- "modulo-131"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{4261adbfa675703b}
		--assert z  = mod256 x  y

	--test-- "modulo-132"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{4261adbfa675703b}
		--assert z  = mod256 x  y

	--test-- "modulo-133"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{4261adbfa675703b}
		--assert z  = mod256 x  y

	--test-- "modulo-134"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{4261adbfa675703b}
		--assert z  = mod256 x  y

	--test-- "modulo-135"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{118ec3a63b3db51f}
		--assert z  = mod256 x  y

	--test-- "modulo-136"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{4261adbfa675703b}
		--assert z  = mod256 x  y

	--test-- "modulo-137"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{4261adbfa675703b}
		--assert z  = mod256 x  y

	--test-- "modulo-138"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{4261adbfa675703b}
		--assert z  = mod256 x  y

	--test-- "modulo-139"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{4261adbfa675703b}
		--assert z  = mod256 x  y

	--test-- "modulo-140"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{4261adbfa675703b}
		--assert z  = mod256 x  y

	--test-- "modulo-141"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{4261adbfa675703b}
		--assert z  = mod256 x  y

	--test-- "modulo-142"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{4261adbfa675703b}
		--assert z  = mod256 x  y

	--test-- "modulo-143"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{4261adbfa675703b}
		--assert z  = mod256 x  y

	--test-- "modulo-144"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{4261adbfa675703b}
		--assert z  = mod256 x  y

	--test-- "modulo-145"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{4261adbfa675703b}
		--assert z  = mod256 x  y

	--test-- "modulo-146"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{4261adbfa675703b}
		--assert z  = mod256 x  y

	--test-- "modulo-147"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{02}
		z: to-i256 #{01}
		--assert z  = mod256 x  y

	--test-- "modulo-148"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: to-i256 #{8aaea8e413a5aae3}
		--assert z  = mod256 x  y

	--test-- "modulo-149"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{0d02293c089923ec}
		--assert z  = mod256 x  y

	--test-- "modulo-150"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{28319083719ded6b}
		--assert z  = mod256 x  y

	--test-- "modulo-151"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{42df7f8d55722ccb}
		--assert z  = mod256 x  y

	--test-- "modulo-152"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{05eb4d64c6baca6d}
		--assert z  = mod256 x  y

	--test-- "modulo-153"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{8aaea8e413a5aae3}
		--assert z  = mod256 x  y

	--test-- "modulo-154"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{8aaea8e413a5aae3}
		--assert z  = mod256 x  y

	--test-- "modulo-155"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{8aaea8e413a5aae3}
		--assert z  = mod256 x  y

	--test-- "modulo-156"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{109f5fa4879a571d}
		--assert z  = mod256 x  y

	--test-- "modulo-157"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{43e477c549f94a8c}
		--assert z  = mod256 x  y

	--test-- "modulo-158"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{8aaea8e413a5aae3}
		--assert z  = mod256 x  y

	--test-- "modulo-159"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{8aaea8e413a5aae3}
		--assert z  = mod256 x  y

	--test-- "modulo-160"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{8aaea8e413a5aae3}
		--assert z  = mod256 x  y

	--test-- "modulo-161"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{8aaea8e413a5aae3}
		--assert z  = mod256 x  y

	--test-- "modulo-162"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{8aaea8e413a5aae3}
		--assert z  = mod256 x  y

	--test-- "modulo-163"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{8aaea8e413a5aae3}
		--assert z  = mod256 x  y

	--test-- "modulo-164"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{8aaea8e413a5aae3}
		--assert z  = mod256 x  y

	--test-- "modulo-165"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{8aaea8e413a5aae3}
		--assert z  = mod256 x  y

	--test-- "modulo-166"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{8aaea8e413a5aae3}
		--assert z  = mod256 x  y

	--test-- "modulo-167"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{8aaea8e413a5aae3}
		--assert z  = mod256 x  y

	--test-- "modulo-168"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{02}
		z: to-i256 #{01}
		--assert z  = mod256 x  y

	--test-- "modulo-169"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: to-i256 #{cfee9cc0728f738b}
		--assert z  = mod256 x  y

	--test-- "modulo-170"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{285df28b0e7ebf97}
		--assert z  = mod256 x  y

	--test-- "modulo-171"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{0af46bff2e7ff89b}
		--assert z  = mod256 x  y

	--test-- "modulo-172"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{40504a12f628775b}
		--assert z  = mod256 x  y

	--test-- "modulo-173"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{08c993817f2f22da}
		--assert z  = mod256 x  y

	--test-- "modulo-174"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{453ff3dc5ee9c8a8}
		--assert z  = mod256 x  y

	--test-- "modulo-175"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{165f58b8dc1c991a}
		--assert z  = mod256 x  y

	--test-- "modulo-176"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{cfee9cc0728f738b}
		--assert z  = mod256 x  y

	--test-- "modulo-177"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{0ca2f45ac5b0871b}
		--assert z  = mod256 x  y

	--test-- "modulo-178"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{425a3a82df36b2dd}
		--assert z  = mod256 x  y

	--test-- "modulo-179"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{cfee9cc0728f738b}
		--assert z  = mod256 x  y

	--test-- "modulo-180"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{cfee9cc0728f738b}
		--assert z  = mod256 x  y

	--test-- "modulo-181"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{cfee9cc0728f738b}
		--assert z  = mod256 x  y

	--test-- "modulo-182"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{cfee9cc0728f738b}
		--assert z  = mod256 x  y

	--test-- "modulo-183"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{cfee9cc0728f738b}
		--assert z  = mod256 x  y

	--test-- "modulo-184"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{cfee9cc0728f738b}
		--assert z  = mod256 x  y

	--test-- "modulo-185"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{cfee9cc0728f738b}
		--assert z  = mod256 x  y

	--test-- "modulo-186"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{cfee9cc0728f738b}
		--assert z  = mod256 x  y

	--test-- "modulo-187"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{cfee9cc0728f738b}
		--assert z  = mod256 x  y

	--test-- "modulo-188"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{cfee9cc0728f738b}
		--assert z  = mod256 x  y

	--test-- "modulo-189"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{02}
		z: to-i256 #{01}
		--assert z  = mod256 x  y

	--test-- "modulo-190"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: to-i256 #{b98f44079672da71}
		--assert z  = mod256 x  y

	--test-- "modulo-191"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{11fe99d23262267d}
		--assert z  = mod256 x  y

	--test-- "modulo-192"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{25d39f76a3673e3d}
		--assert z  = mod256 x  y

	--test-- "modulo-193"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{29f0f15a1a0bde41}
		--assert z  = mod256 x  y

	--test-- "modulo-194"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{34cbe8884987f9fb}
		--assert z  = mod256 x  y

	--test-- "modulo-195"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{2ee09b2382cd2f8e}
		--assert z  = mod256 x  y

	--test-- "modulo-196"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{b98f44079672da71}
		--assert z  = mod256 x  y

	--test-- "modulo-197"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{b98f44079672da71}
		--assert z  = mod256 x  y

	--test-- "modulo-198"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{0ead10ae9f2fcb8f}
		--assert z  = mod256 x  y

	--test-- "modulo-199"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{2bfae1ca031a19c3}
		--assert z  = mod256 x  y

	--test-- "modulo-200"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{b98f44079672da71}
		--assert z  = mod256 x  y

	--test-- "modulo-201"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{b98f44079672da71}
		--assert z  = mod256 x  y

	--test-- "modulo-202"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{b98f44079672da71}
		--assert z  = mod256 x  y

	--test-- "modulo-203"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{b98f44079672da71}
		--assert z  = mod256 x  y

	--test-- "modulo-204"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{b98f44079672da71}
		--assert z  = mod256 x  y

	--test-- "modulo-205"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{b98f44079672da71}
		--assert z  = mod256 x  y

	--test-- "modulo-206"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{b98f44079672da71}
		--assert z  = mod256 x  y

	--test-- "modulo-207"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{b98f44079672da71}
		--assert z  = mod256 x  y

	--test-- "modulo-208"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{b98f44079672da71}
		--assert z  = mod256 x  y

	--test-- "modulo-209"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{b98f44079672da71}
		--assert z  = mod256 x  y

	--test-- "modulo-210"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: to-i256 #{f456abaafa5235e8}
		--assert z  = mod256 x  y

	--test-- "modulo-211"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{22e1d6e83d3d54f7}
		--assert z  = mod256 x  y

	--test-- "modulo-212"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{2f5c7ae9b642baf8}
		--assert z  = mod256 x  y

	--test-- "modulo-213"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{1ce92fa6bfb7bba0}
		--assert z  = mod256 x  y

	--test-- "modulo-214"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{2d31a26c06f1e537}
		--assert z  = mod256 x  y

	--test-- "modulo-215"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{69a802c6e6ac8b05}
		--assert z  = mod256 x  y

	--test-- "modulo-216"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{24680eea87c2c25d}
		--assert z  = mod256 x  y

	--test-- "modulo-217"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{3ac767a363df5b77}
		--assert z  = mod256 x  y

	--test-- "modulo-218"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{38192be23b8e5c}
		--assert z  = mod256 x  y

	--test-- "modulo-219"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{1ff8184e9d4d14e3}
		--assert z  = mod256 x  y

	--test-- "modulo-220"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{f456abaafa5235e8}
		--assert z  = mod256 x  y

	--test-- "modulo-221"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{f456abaafa5235e8}
		--assert z  = mod256 x  y

	--test-- "modulo-222"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{f456abaafa5235e8}
		--assert z  = mod256 x  y

	--test-- "modulo-223"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{f456abaafa5235e8}
		--assert z  = mod256 x  y

	--test-- "modulo-224"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{f456abaafa5235e8}
		--assert z  = mod256 x  y

	--test-- "modulo-225"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{f456abaafa5235e8}
		--assert z  = mod256 x  y

	--test-- "modulo-226"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{f456abaafa5235e8}
		--assert z  = mod256 x  y

	--test-- "modulo-227"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{f456abaafa5235e8}
		--assert z  = mod256 x  y

	--test-- "modulo-228"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{f456abaafa5235e8}
		--assert z  = mod256 x  y

	--test-- "modulo-229"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{f456abaafa5235e8}
		--assert z  = mod256 x  y

	--test-- "modulo-230"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: to-i256 #{1869750cb59bdd8e}
		--assert z  = mod256 x  y

	--test-- "modulo-231"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{1869750cb59bdd8e}
		--assert z  = mod256 x  y

	--test-- "modulo-232"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{1869750cb59bdd8e}
		--assert z  = mod256 x  y

	--test-- "modulo-233"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{1869750cb59bdd8e}
		--assert z  = mod256 x  y

	--test-- "modulo-234"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{1869750cb59bdd8e}
		--assert z  = mod256 x  y

	--test-- "modulo-235"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{1869750cb59bdd8e}
		--assert z  = mod256 x  y

	--test-- "modulo-236"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{1869750cb59bdd8e}
		--assert z  = mod256 x  y

	--test-- "modulo-237"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{1869750cb59bdd8e}
		--assert z  = mod256 x  y

	--test-- "modulo-238"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{1869750cb59bdd8e}
		--assert z  = mod256 x  y

	--test-- "modulo-239"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{1869750cb59bdd8e}
		--assert z  = mod256 x  y

	--test-- "modulo-240"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{1869750cb59bdd8e}
		--assert z  = mod256 x  y

	--test-- "modulo-241"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{1869750cb59bdd8e}
		--assert z  = mod256 x  y

	--test-- "modulo-242"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{1869750cb59bdd8e}
		--assert z  = mod256 x  y

	--test-- "modulo-243"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{1869750cb59bdd8e}
		--assert z  = mod256 x  y

	--test-- "modulo-244"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{1869750cb59bdd8e}
		--assert z  = mod256 x  y

	--test-- "modulo-245"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{1869750cb59bdd8e}
		--assert z  = mod256 x  y

	--test-- "modulo-246"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{1869750cb59bdd8e}
		--assert z  = mod256 x  y

	--test-- "modulo-247"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{1869750cb59bdd8e}
		--assert z  = mod256 x  y

	--test-- "modulo-248"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{1869750cb59bdd8e}
		--assert z  = mod256 x  y

	--test-- "modulo-249"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{1869750cb59bdd8e}
		--assert z  = mod256 x  y

	--test-- "modulo-250"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{02}
		z: to-i256 #{01}
		--assert z  = mod256 x  y

	--test-- "modulo-251"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: to-i256 #{46ca311ec9ac6057}
		--assert z  = mod256 x  y

	--test-- "modulo-252"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{1ce6069170a8335a}
		--assert z  = mod256 x  y

	--test-- "modulo-253"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{158ba4ee78a8819b}
		--assert z  = mod256 x  y

	--test-- "modulo-254"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{46ca311ec9ac6057}
		--assert z  = mod256 x  y

	--test-- "modulo-255"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{0468835f2336f01c}
		--assert z  = mod256 x  y

	--test-- "modulo-256"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{46ca311ec9ac6057}
		--assert z  = mod256 x  y

	--test-- "modulo-257"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{46ca311ec9ac6057}
		--assert z  = mod256 x  y

	--test-- "modulo-258"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{46ca311ec9ac6057}
		--assert z  = mod256 x  y

	--test-- "modulo-259"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{46ca311ec9ac6057}
		--assert z  = mod256 x  y

	--test-- "modulo-260"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{15f747055e74a53b}
		--assert z  = mod256 x  y

	--test-- "modulo-261"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{46ca311ec9ac6057}
		--assert z  = mod256 x  y

	--test-- "modulo-262"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{46ca311ec9ac6057}
		--assert z  = mod256 x  y

	--test-- "modulo-263"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{46ca311ec9ac6057}
		--assert z  = mod256 x  y

	--test-- "modulo-264"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{46ca311ec9ac6057}
		--assert z  = mod256 x  y

	--test-- "modulo-265"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{46ca311ec9ac6057}
		--assert z  = mod256 x  y

	--test-- "modulo-266"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{46ca311ec9ac6057}
		--assert z  = mod256 x  y

	--test-- "modulo-267"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{46ca311ec9ac6057}
		--assert z  = mod256 x  y

	--test-- "modulo-268"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{46ca311ec9ac6057}
		--assert z  = mod256 x  y

	--test-- "modulo-269"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{46ca311ec9ac6057}
		--assert z  = mod256 x  y

	--test-- "modulo-270"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{46ca311ec9ac6057}
		--assert z  = mod256 x  y

	--test-- "modulo-271"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		--assert z  = mod256 x  y

	--test-- "modulo-272"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{0c414a09a63eda4e}
		--assert z  = mod256 x  y

	--test-- "modulo-273"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{0b0ed42520f0358c}
		--assert z  = mod256 x  y

	--test-- "modulo-274"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{16f16f06563402ec}
		--assert z  = mod256 x  y

	--test-- "modulo-275"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{2512957032bd52e4}
		--assert z  = mod256 x  y

	--test-- "modulo-276"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{5192f44e644be1bb}
		--assert z  = mod256 x  y

	--test-- "modulo-277"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{1c267eb2aa5b184c}
		--assert z  = mod256 x  y

	--test-- "modulo-278"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{866e1ae47233d8e2}
		--assert z  = mod256 x  y

	--test-- "modulo-279"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{99ea9537ec1f6b84}
		--assert z  = mod256 x  y

	--test-- "modulo-280"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{06fadd862ce13a98}
		--assert z  = mod256 x  y

	--test-- "modulo-281"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{0cd1f2b6337a47d2}
		--assert z  = mod256 x  y

	--test-- "modulo-282"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{2ae1d5e07a48a88be2b056f6ce7202e1990e636942aa6cc086ce8c04da7abf62}
		--assert z  = mod256 x  y

	--test-- "modulo-283"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{14c9a8cd667990366780336658df2259905d8bce0608136ac853aa62c772f7e0}
		--assert z  = mod256 x  y

	--test-- "modulo-284"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		--assert z  = mod256 x  y

	--test-- "modulo-285"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		--assert z  = mod256 x  y

	--test-- "modulo-286"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{0c4acf732a0413c7d7a52de8b3a5570b63ba101388c9c9d3bcff0da15b91e748}
		--assert z  = mod256 x  y

	--test-- "modulo-287"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{2883b998148f088b97bc279636324a180b198e00eeaf097afd4249275df8014e}
		--assert z  = mod256 x  y

	--test-- "modulo-288"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{130d15da2f0d87e3b79cbaddcc3404d5239504ca12a616a0d62d455b2c4b437c}
		--assert z  = mod256 x  y

	--test-- "modulo-289"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		--assert z  = mod256 x  y

	--test-- "modulo-290"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		--assert z  = mod256 x  y

	--test-- "modulo-291"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		--assert z  = mod256 x  y

	--test-- "modulo-292"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{0d36565b8d70891c}
		--assert z  = mod256 x  y

	--test-- "modulo-293"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{2d4e0ec3164d2406}
		--assert z  = mod256 x  y

	--test-- "modulo-294"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{06f336119945e22a}
		--assert z  = mod256 x  y

	--test-- "modulo-295"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{4191f7bb0ecc0180}
		--assert z  = mod256 x  y

	--test-- "modulo-296"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{3a8b5ade12f5e49e}
		--assert z  = mod256 x  y

	--test-- "modulo-297"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{1ec9a1780841c550}
		--assert z  = mod256 x  y

	--test-- "modulo-298"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{a3a199cc0106ec6c}
		--assert z  = mod256 x  y

	--test-- "modulo-299"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{73e599fa240f848a}
		--assert z  = mod256 x  y

	--test-- "modulo-300"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{17af623aa7edae62}
		--assert z  = mod256 x  y

	--test-- "modulo-301"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{43691dab5ea8f4f9}
		--assert z  = mod256 x  y

	--test-- "modulo-302"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		--assert z  = mod256 x  y

	--test-- "modulo-303"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{01e706a3b8cec48cdf7b42890fa9a86bff4c084d370bdf9922d96dab3b67e561}
		--assert z  = mod256 x  y

	--test-- "modulo-304"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		--assert z  = mod256 x  y

	--test-- "modulo-305"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		--assert z  = mod256 x  y

	--test-- "modulo-306"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{15a6cdad6731e337f23925e3c2494bb8f0f72a586c1af3bc7e836e97d3e709f8}
		--assert z  = mod256 x  y

	--test-- "modulo-307"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		--assert z  = mod256 x  y

	--test-- "modulo-308"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{1907f0e0e9b69d45e234ec5e4e90a29dd0e4a4b3b1091a230b1a8a74bc43b812}
		--assert z  = mod256 x  y

	--test-- "modulo-309"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		--assert z  = mod256 x  y

	--test-- "modulo-310"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		--assert z  = mod256 x  y

	--test-- "modulo-311"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{02}
		z: to-i256 #{01}
		--assert z  = mod256 x  y

	--test-- "modulo-312"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		--assert z  = mod256 x  y

	--test-- "modulo-313"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{17017d4221eb159e}
		--assert z  = mod256 x  y

	--test-- "modulo-314"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{1706284258e77327}
		--assert z  = mod256 x  y

	--test-- "modulo-315"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{38b6c5e23c832c93}
		--assert z  = mod256 x  y

	--test-- "modulo-316"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{2a492f1b2d9a4a8d}
		--assert z  = mod256 x  y

	--test-- "modulo-317"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{506322e89250e0a0}
		--assert z  = mod256 x  y

	--test-- "modulo-318"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{b9f3ecb7b1a0af85}
		--assert z  = mod256 x  y

	--test-- "modulo-319"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{1d488d51ff75bb1c}
		--assert z  = mod256 x  y

	--test-- "modulo-320"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{c88eddbd4d1ae0f3}
		--assert z  = mod256 x  y

	--test-- "modulo-321"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{1252d7635ccb01df}
		--assert z  = mod256 x  y

	--test-- "modulo-322"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{121eabc35a7640f0}
		--assert z  = mod256 x  y

	--test-- "modulo-323"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		--assert z  = mod256 x  y

	--test-- "modulo-324"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		--assert z  = mod256 x  y

	--test-- "modulo-325"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		--assert z  = mod256 x  y

	--test-- "modulo-326"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		--assert z  = mod256 x  y

	--test-- "modulo-327"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		--assert z  = mod256 x  y

	--test-- "modulo-328"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		--assert z  = mod256 x  y

	--test-- "modulo-329"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		--assert z  = mod256 x  y

	--test-- "modulo-330"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		--assert z  = mod256 x  y

	--test-- "modulo-331"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		--assert z  = mod256 x  y

	--test-- "modulo-332"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{02}
		z: to-i256 #{01}
		--assert z  = mod256 x  y

	--test-- "modulo-333"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		--assert z  = mod256 x  y

	--test-- "modulo-334"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{06a0f63294968ef0}
		--assert z  = mod256 x  y

	--test-- "modulo-335"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{1438b4fac90721db}
		--assert z  = mod256 x  y

	--test-- "modulo-336"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{3a2888102aca741b}
		--assert z  = mod256 x  y

	--test-- "modulo-337"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{210f37f915d8f50d}
		--assert z  = mod256 x  y

	--test-- "modulo-338"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{13e44c0fed4c640f}
		--assert z  = mod256 x  y

	--test-- "modulo-339"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{475ead1c3922f3d5}
		--assert z  = mod256 x  y

	--test-- "modulo-340"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{63791dd0e4b7f4ac}
		--assert z  = mod256 x  y

	--test-- "modulo-341"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{b3be303300c3808b}
		--assert z  = mod256 x  y

	--test-- "modulo-342"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{13c13381b7b2ac99}
		--assert z  = mod256 x  y

	--test-- "modulo-343"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{1294bea002840135}
		--assert z  = mod256 x  y

	--test-- "modulo-344"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{1fba913b634e1aed41b14f6f19684bd501feb573e0a06094dade76c149b995b7}
		--assert z  = mod256 x  y

	--test-- "modulo-345"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{b7c553beee684534e43190487b0b6e83ca70d6913442ef9ad6a732fd7d690f}
		--assert z  = mod256 x  y

	--test-- "modulo-346"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{0485d29b308bf15ef3dab6a267ce5c4682628170ff4c0221e0898289744d33d1}
		--assert z  = mod256 x  y

	--test-- "modulo-347"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		--assert z  = mod256 x  y

	--test-- "modulo-348"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{2c0560ae8d522eb519567d57cd0da2e065b8c587696a2a6897dd8462a54b7cff}
		--assert z  = mod256 x  y

	--test-- "modulo-349"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{483e4ad377dd2378d96d77054f9a95ed0d184374cf4f6a0fd820bfe8a7b19705}
		--assert z  = mod256 x  y

	--test-- "modulo-350"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{01eaf62e5d69e4e2ec0581d594cdafffdf35b6eb123906f2f54feafe0b91a53b}
		--assert z  = mod256 x  y

	--test-- "modulo-351"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		--assert z  = mod256 x  y

	--test-- "modulo-352"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		--assert z  = mod256 x  y

	--test-- "modulo-353"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		--assert z  = mod256 x  y

	--test-- "modulo-354"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{0cb31194bf041aac}
		--assert z  = mod256 x  y

	--test-- "modulo-355"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{2a76e54cf7711b9c}
		--assert z  = mod256 x  y

	--test-- "modulo-356"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{1264dbb8ea9a90f4}
		--assert z  = mod256 x  y

	--test-- "modulo-357"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{243405e72a74fbb5}
		--assert z  = mod256 x  y

	--test-- "modulo-358"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{0e0f883733021e04}
		--assert z  = mod256 x  y

	--test-- "modulo-359"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{853e88ad38bfb410}
		--assert z  = mod256 x  y

	--test-- "modulo-360"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{606e39e867131955}
		--assert z  = mod256 x  y

	--test-- "modulo-361"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{56690e0b7ccfe8f4}
		--assert z  = mod256 x  y

	--test-- "modulo-362"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{04f442eea04e6f64}
		--assert z  = mod256 x  y

	--test-- "modulo-363"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{097abb0ed788e5f4}
		--assert z  = mod256 x  y

	--test-- "modulo-364"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{22e370b24e6c1c6cc3b9ce27aab4f06baf5ed4aa96ec77362b611e275b20ce48}
		--assert z  = mod256 x  y

	--test-- "modulo-365"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{03e0a4caaa0c69c4b6ecb048d9c7b005312a900d47805990eb594e990ee4a1a0}
		--assert z  = mod256 x  y

	--test-- "modulo-366"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{07aeb2121ba9f2de75e3355af91b00dd2fc2a0a7b59818c3310c29ef85b46c62}
		--assert z  = mod256 x  y

	--test-- "modulo-367"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{0328df76eb1e017f82087eb8914ca496ad601f36b64c16a15082a76611673891}
		--assert z  = mod256 x  y

	--test-- "modulo-368"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{2f2e4025787030349b5efc105e5a47771318e4be1fb64109e8602bc8b6b2b590}
		--assert z  = mod256 x  y

	--test-- "modulo-369"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{4b672a4a62fb24f85b75f5bde0e73a83ba7862ab859b80b128a3674eb918cf96}
		--assert z  = mod256 x  y

	--test-- "modulo-370"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{0513d5a54887e6626e0e008e261a54968c95d621c8851d9445d292641cf8ddcc}
		--assert z  = mod256 x  y

	--test-- "modulo-371"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		--assert z  = mod256 x  y

	--test-- "modulo-372"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		--assert z  = mod256 x  y

	--test-- "modulo-373"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		--assert z  = mod256 x  y

	--test-- "modulo-374"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{1108c134b7ef57da}
		--assert z  = mod256 x  y

	--test-- "modulo-375"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{094fc1e6dea604aa}
		--assert z  = mod256 x  y

	--test-- "modulo-376"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{043d5c4e0b38c672}
		--assert z  = mod256 x  y

	--test-- "modulo-377"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{243d71b8e48b38fa}
		--assert z  = mod256 x  y

	--test-- "modulo-378"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{45bde7aff29b9167}
		--assert z  = mod256 x  y

	--test-- "modulo-379"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{7eb77ef62c5ea7d6}
		--assert z  = mod256 x  y

	--test-- "modulo-380"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{8bb8a75c456fba91}
		--assert z  = mod256 x  y

	--test-- "modulo-381"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{9ff5c3cbaa5c61fa}
		--assert z  = mod256 x  y

	--test-- "modulo-382"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{0c898e23aa2629d8}
		--assert z  = mod256 x  y

	--test-- "modulo-383"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{017e9d79ad698c0f}
		--assert z  = mod256 x  y

	--test-- "modulo-384"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		--assert z  = mod256 x  y

	--test-- "modulo-385"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		--assert z  = mod256 x  y

	--test-- "modulo-386"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{043f6cad1e3abe3747ed82bed29ce5a71651bddd3e9f24cb85aa4e60b5f0884c}
		--assert z  = mod256 x  y

	--test-- "modulo-387"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		--assert z  = mod256 x  y

	--test-- "modulo-388"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		--assert z  = mod256 x  y

	--test-- "modulo-389"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		--assert z  = mod256 x  y

	--test-- "modulo-390"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{036123338284ba0deffbc67a8c4756e4dfed7a5b44ee26668c971bdce85cae1a}
		--assert z  = mod256 x  y

	--test-- "modulo-391"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		--assert z  = mod256 x  y

	--test-- "modulo-392"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		--assert z  = mod256 x  y

	--test-- "modulo-393"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		--assert z  = mod256 x  y

	--test-- "modulo-394"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{13dc4789f2ac27f6}
		--assert z  = mod256 x  y

	--test-- "modulo-395"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{2ebabbccea2c66aa}
		--assert z  = mod256 x  y

	--test-- "modulo-396"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{2ee62867a7e59f4e}
		--assert z  = mod256 x  y

	--test-- "modulo-397"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{30493e14d315cda1}
		--assert z  = mod256 x  y

	--test-- "modulo-398"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{7f59c291334fc939}
		--assert z  = mod256 x  y

	--test-- "modulo-399"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{9f43b376e9be08ef}
		--assert z  = mod256 x  y

	--test-- "modulo-400"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{5f4ac880225fb017}
		--assert z  = mod256 x  y

	--test-- "modulo-401"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{3e00b6312aa1641e}
		--assert z  = mod256 x  y

	--test-- "modulo-402"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{14ea49b11499f0f4}
		--assert z  = mod256 x  y

	--test-- "modulo-403"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{2ae1b5be8e8d748f}
		--assert z  = mod256 x  y

	--test-- "modulo-404"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		--assert z  = mod256 x  y

	--test-- "modulo-405"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{025e1c4865b9a0004af42f60983fb8c98df4d56853fb6345898c42dd7c82be14}
		--assert z  = mod256 x  y

	--test-- "modulo-406"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{044522ec1e88648d2a6f71e9a7e961358d40ddb58b0742deac65b088b7eaa375}
		--assert z  = mod256 x  y

	--test-- "modulo-407"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		--assert z  = mod256 x  y

	--test-- "modulo-408"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		--assert z  = mod256 x  y

	--test-- "modulo-409"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{1804e9f5cceb83383d2d55445a8904827eebffc0c0165702080fb1755069c80c}
		--assert z  = mod256 x  y

	--test-- "modulo-410"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{1b660d294f703d462d291bbee6d05b675ed97a1c05047d6894a6cd5238c67626}
		--assert z  = mod256 x  y

	--test-- "modulo-411"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		--assert z  = mod256 x  y

	--test-- "modulo-412"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		--assert z  = mod256 x  y

	--test-- "modulo-413"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		--assert z  = mod256 x  y

	--test-- "modulo-414"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{14cf555a489baa3b}
		--assert z  = mod256 x  y

	--test-- "modulo-415"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{1cd6c7f169608a1c}
		--assert z  = mod256 x  y

	--test-- "modulo-416"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{2c35ad4c4cb5ce70}
		--assert z  = mod256 x  y

	--test-- "modulo-417"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{2ee78b1d92202479}
		--assert z  = mod256 x  y

	--test-- "modulo-418"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{6ff9c27c0f0e4f10}
		--assert z  = mod256 x  y

	--test-- "modulo-419"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{0553a9392109f690}
		--assert z  = mod256 x  y

	--test-- "modulo-420"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{3b8fa37652ea43}
		--assert z  = mod256 x  y

	--test-- "modulo-421"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{3e671c43a838be68}
		--assert z  = mod256 x  y

	--test-- "modulo-422"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{15f4a78b23d251c0}
		--assert z  = mod256 x  y

	--test-- "modulo-423"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{2026b1110200387c}
		--assert z  = mod256 x  y

	--test-- "modulo-424"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		--assert z  = mod256 x  y

	--test-- "modulo-425"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		--assert z  = mod256 x  y

	--test-- "modulo-426"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{de49799bb6042957f1bc4446558ec236644381f9b0fe64f9133283cd93da32}
		--assert z  = mod256 x  y

	--test-- "modulo-427"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		--assert z  = mod256 x  y

	--test-- "modulo-428"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		--assert z  = mod256 x  y

	--test-- "modulo-429"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		--assert z  = mod256 x  y

	--test-- "modulo-430"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		--assert z  = mod256 x  y

	--test-- "modulo-431"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		--assert z  = mod256 x  y

	--test-- "modulo-432"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		--assert z  = mod256 x  y

	--test-- "modulo-433"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{02}
		z: to-i256 #{01}
		--assert z  = mod256 x  y

	--test-- "modulo-434"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		--assert z  = mod256 x  y

	--test-- "modulo-435"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{f19a391c05db3d}
		--assert z  = mod256 x  y

	--test-- "modulo-436"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{1a34c9bd1a9574bd}
		--assert z  = mod256 x  y

	--test-- "modulo-437"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{0444d6460e42b3d1}
		--assert z  = mod256 x  y

	--test-- "modulo-438"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{18a11e822e378896}
		--assert z  = mod256 x  y

	--test-- "modulo-439"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{7a53df6345a1d815}
		--assert z  = mod256 x  y

	--test-- "modulo-440"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{0b43ee3bbbc8cc8e}
		--assert z  = mod256 x  y

	--test-- "modulo-441"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{0d1b327d642a7667}
		--assert z  = mod256 x  y

	--test-- "modulo-442"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{d48c64a912696881}
		--assert z  = mod256 x  y

	--test-- "modulo-443"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{15a5ae55d24ac669}
		--assert z  = mod256 x  y

	--test-- "modulo-444"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{2f01b33addfa130c}
		--assert z  = mod256 x  y

	--test-- "modulo-445"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{69377494a1821edcdf4ef1f2bac3006d04cc8dbf1e98038cd345d0565132e8c5}
		--assert z  = mod256 x  y

	--test-- "modulo-446"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{5006e4de7a1100e3045f3e4a767cbe6f55a11b3d155b81cc67a534de3fd013}
		--assert z  = mod256 x  y

	--test-- "modulo-447"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{06051ad008e65ea7817626d9797376026d39ba02e238fa4d34f3ee3690778036}
		--assert z  = mod256 x  y

	--test-- "modulo-448"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{497ce3593e3403ef9d9da283a15ab49802cdd84b3df7a2f7f86759950779530e}
		--assert z  = mod256 x  y

	--test-- "modulo-449"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{465403e2531602701b9523cb100e1001556db91487ab8c56a7e4b22ef6121a7d}
		--assert z  = mod256 x  y

	--test-- "modulo-450"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{0d069bd25c9942acbc6b81f7b43c685a1befa2765b6aa00dff9f040107250be9}
		--assert z  = mod256 x  y

	--test-- "modulo-451"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{4578701c31af2c343c997552b9564e736aae9e5127351f5c80257b0d0bf13ff5}
		--assert z  = mod256 x  y

	--test-- "modulo-452"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{1a8b28a066ac2ae47c5a9be1e559c3ed9ba58be36f2339a831fb7374a897c451}
		--assert z  = mod256 x  y

	--test-- "modulo-453"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: to-i256 #{026ad39eb14163f9b93a035ca02834160ac5e5b061c4a5ea0a1df2ee7b82da72}
		--assert z  = mod256 x  y

	--test-- "modulo-454"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{02}
		z: to-i256 #{01}
		--assert z  = mod256 x  y

	--test-- "modulo-455"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		--assert z  = mod256 x  y

	--test-- "modulo-456"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{29e42a8d59042cfd}
		z: to-i256 #{13919e1fdc830aba}
		--assert z  = mod256 x  y

	--test-- "modulo-457"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{313e8c305103debc}
		z: to-i256 #{0e1c2a4790876a17}
		--assert z  = mod256 x  y

	--test-- "modulo-458"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{47cf2956be337e18}
		z: to-i256 #{21db8b1f2442b377}
		--assert z  = mod256 x  y

	--test-- "modulo-459"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{4261adbfa675703b}
		z: to-i256 #{23fe9bbfa528a3c7}
		--assert z  = mod256 x  y

	--test-- "modulo-460"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{8aaea8e413a5aae3}
		z: to-i256 #{2e5314f1a17d906e}
		--assert z  = mod256 x  y

	--test-- "modulo-461"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{cfee9cc0728f738b}
		z: to-i256 #{4b9c61c54d3397c4}
		--assert z  = mod256 x  y

	--test-- "modulo-462"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{b98f44079672da71}
		z: to-i256 #{6b1b5ef0f53d41eb}
		--assert z  = mod256 x  y

	--test-- "modulo-463"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{f456abaafa5235e8}
		z: to-i256 #{39d9422cb44b3a9f}
		--assert z  = mod256 x  y

	--test-- "modulo-464"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{1869750cb59bdd8e}
		z: to-i256 #{18206c1786ff6eff}
		--assert z  = mod256 x  y

	--test-- "modulo-465"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{46ca311ec9ac6057}
		z: to-i256 #{40f4610de29d866c}
		--assert z  = mod256 x  y

	--test-- "modulo-466"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: to-i256 #{66cca0f5f040bae32614ee961a9acc56fa06a80ebcd35da2c927dd67d5b00e53}
		--assert z  = mod256 x  y

	--test-- "modulo-467"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: to-i256 #{47c9d50e4be1083b1947d0b749ad8bf07bd263716d673ffd89200dd98973e1ab}
		--assert z  = mod256 x  y

	--test-- "modulo-468"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: to-i256 #{039a473157a4faadc83c237cd94b41ec6273d452807454632ad5fb4814f4a5c4}
		--assert z  = mod256 x  y

	--test-- "modulo-469"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: to-i256 #{47120fba8cf29ff5e4639f2701328081f807f29adc32fd0dee4966a68bf6789c}
		--assert z  = mod256 x  y

	--test-- "modulo-470"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: to-i256 #{43e93043a1d49e76625b206e6fe5dbeb4aa7d36425e6e66c9dc6bf407a8f400b}
		--assert z  = mod256 x  y

	--test-- "modulo-471"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: to-i256 #{0a9bc833ab57deb303317e9b141434441129bcc5f9a5fa23f58111128ba23177}
		--assert z  = mod256 x  y

	--test-- "modulo-472"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: to-i256 #{430d9c7d806dc83a835f71f6192e1a5d5fe8b8a0c57079727607881e906e6583}
		--assert z  = mod256 x  y

	--test-- "modulo-473"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: to-i256 #{18205501b56ac6eac320988545318fd790dfa6330d5e93be27dd80862d14e9df}
		--assert z  = mod256 x  y

	--test-- "modulo-474"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		--assert z  = mod256 x  y

===end-group===

===start-group=== "lesser or equal"
	--test-- "lesser or equal-1"
		x: to-i256 #{00}
		y: to-i256 #{00}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-2"
		x: to-i256 #{00}
		y: to-i256 #{01}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-3"
		x: to-i256 #{00}
		y: to-i256 #{02}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-4"
		x: to-i256 #{00}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-5"
		x: to-i256 #{00}
		y: to-i256 #{29e42a8d59042cfd}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-6"
		x: to-i256 #{00}
		y: to-i256 #{313e8c305103debc}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-7"
		x: to-i256 #{00}
		y: to-i256 #{47cf2956be337e18}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-8"
		x: to-i256 #{00}
		y: to-i256 #{4261adbfa675703b}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-9"
		x: to-i256 #{00}
		y: to-i256 #{8aaea8e413a5aae3}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-10"
		x: to-i256 #{00}
		y: to-i256 #{cfee9cc0728f738b}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-11"
		x: to-i256 #{00}
		y: to-i256 #{b98f44079672da71}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-12"
		x: to-i256 #{00}
		y: to-i256 #{f456abaafa5235e8}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-13"
		x: to-i256 #{00}
		y: to-i256 #{1869750cb59bdd8e}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-14"
		x: to-i256 #{00}
		y: to-i256 #{46ca311ec9ac6057}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-15"
		x: to-i256 #{00}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-16"
		x: to-i256 #{00}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-17"
		x: to-i256 #{00}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-18"
		x: to-i256 #{00}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-19"
		x: to-i256 #{00}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-20"
		x: to-i256 #{00}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-21"
		x: to-i256 #{00}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-22"
		x: to-i256 #{00}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-23"
		x: to-i256 #{00}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-24"
		x: to-i256 #{00}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-25"
		x: to-i256 #{00}
		y: to-i256 #{00}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-26"
		x: to-i256 #{00}
		y: to-i256 #{01}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-27"
		x: to-i256 #{00}
		y: to-i256 #{02}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-28"
		x: to-i256 #{00}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-29"
		x: to-i256 #{00}
		y: to-i256 #{29e42a8d59042cfd}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-30"
		x: to-i256 #{00}
		y: to-i256 #{313e8c305103debc}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-31"
		x: to-i256 #{00}
		y: to-i256 #{47cf2956be337e18}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-32"
		x: to-i256 #{00}
		y: to-i256 #{4261adbfa675703b}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-33"
		x: to-i256 #{00}
		y: to-i256 #{8aaea8e413a5aae3}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-34"
		x: to-i256 #{00}
		y: to-i256 #{cfee9cc0728f738b}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-35"
		x: to-i256 #{00}
		y: to-i256 #{b98f44079672da71}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-36"
		x: to-i256 #{00}
		y: to-i256 #{f456abaafa5235e8}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-37"
		x: to-i256 #{00}
		y: to-i256 #{1869750cb59bdd8e}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-38"
		x: to-i256 #{00}
		y: to-i256 #{46ca311ec9ac6057}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-39"
		x: to-i256 #{00}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-40"
		x: to-i256 #{00}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-41"
		x: to-i256 #{00}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-42"
		x: to-i256 #{00}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-43"
		x: to-i256 #{00}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-44"
		x: to-i256 #{00}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-45"
		x: to-i256 #{00}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-46"
		x: to-i256 #{00}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-47"
		x: to-i256 #{00}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-48"
		x: to-i256 #{00}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-49"
		x: to-i256 #{01}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-50"
		x: to-i256 #{01}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-51"
		x: to-i256 #{01}
		y: to-i256 #{02}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-52"
		x: to-i256 #{01}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-53"
		x: to-i256 #{01}
		y: to-i256 #{29e42a8d59042cfd}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-54"
		x: to-i256 #{01}
		y: to-i256 #{313e8c305103debc}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-55"
		x: to-i256 #{01}
		y: to-i256 #{47cf2956be337e18}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-56"
		x: to-i256 #{01}
		y: to-i256 #{4261adbfa675703b}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-57"
		x: to-i256 #{01}
		y: to-i256 #{8aaea8e413a5aae3}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-58"
		x: to-i256 #{01}
		y: to-i256 #{cfee9cc0728f738b}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-59"
		x: to-i256 #{01}
		y: to-i256 #{b98f44079672da71}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-60"
		x: to-i256 #{01}
		y: to-i256 #{f456abaafa5235e8}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-61"
		x: to-i256 #{01}
		y: to-i256 #{1869750cb59bdd8e}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-62"
		x: to-i256 #{01}
		y: to-i256 #{46ca311ec9ac6057}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-63"
		x: to-i256 #{01}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-64"
		x: to-i256 #{01}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-65"
		x: to-i256 #{01}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-66"
		x: to-i256 #{01}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-67"
		x: to-i256 #{01}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-68"
		x: to-i256 #{01}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-69"
		x: to-i256 #{01}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-70"
		x: to-i256 #{01}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-71"
		x: to-i256 #{01}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-72"
		x: to-i256 #{01}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-73"
		x: to-i256 #{02}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-74"
		x: to-i256 #{02}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-75"
		x: to-i256 #{02}
		y: to-i256 #{01}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-76"
		x: to-i256 #{02}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-77"
		x: to-i256 #{02}
		y: to-i256 #{29e42a8d59042cfd}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-78"
		x: to-i256 #{02}
		y: to-i256 #{313e8c305103debc}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-79"
		x: to-i256 #{02}
		y: to-i256 #{47cf2956be337e18}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-80"
		x: to-i256 #{02}
		y: to-i256 #{4261adbfa675703b}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-81"
		x: to-i256 #{02}
		y: to-i256 #{8aaea8e413a5aae3}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-82"
		x: to-i256 #{02}
		y: to-i256 #{cfee9cc0728f738b}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-83"
		x: to-i256 #{02}
		y: to-i256 #{b98f44079672da71}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-84"
		x: to-i256 #{02}
		y: to-i256 #{f456abaafa5235e8}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-85"
		x: to-i256 #{02}
		y: to-i256 #{1869750cb59bdd8e}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-86"
		x: to-i256 #{02}
		y: to-i256 #{46ca311ec9ac6057}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-87"
		x: to-i256 #{02}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-88"
		x: to-i256 #{02}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-89"
		x: to-i256 #{02}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-90"
		x: to-i256 #{02}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-91"
		x: to-i256 #{02}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-92"
		x: to-i256 #{02}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-93"
		x: to-i256 #{02}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-94"
		x: to-i256 #{02}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-95"
		x: to-i256 #{02}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-96"
		x: to-i256 #{02}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-97"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-98"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-99"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{01}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-100"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{02}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-101"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{29e42a8d59042cfd}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-102"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{313e8c305103debc}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-103"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{47cf2956be337e18}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-104"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{4261adbfa675703b}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-105"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{8aaea8e413a5aae3}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-106"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{cfee9cc0728f738b}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-107"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{b98f44079672da71}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-108"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{f456abaafa5235e8}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-109"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{1869750cb59bdd8e}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-110"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{46ca311ec9ac6057}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-111"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-112"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-113"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-114"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-115"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-116"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-117"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-118"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-119"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-120"
		x: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-121"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-122"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-123"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{01}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-124"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{02}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-125"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-126"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{313e8c305103debc}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-127"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{47cf2956be337e18}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-128"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{4261adbfa675703b}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-129"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{8aaea8e413a5aae3}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-130"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{cfee9cc0728f738b}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-131"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{b98f44079672da71}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-132"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{f456abaafa5235e8}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-133"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{1869750cb59bdd8e}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-134"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{46ca311ec9ac6057}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-135"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-136"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-137"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-138"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-139"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-140"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-141"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-142"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-143"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-144"
		x: to-i256 #{29e42a8d59042cfd}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-145"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-146"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-147"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{01}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-148"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{02}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-149"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-150"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{29e42a8d59042cfd}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-151"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{47cf2956be337e18}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-152"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{4261adbfa675703b}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-153"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{8aaea8e413a5aae3}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-154"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{cfee9cc0728f738b}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-155"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{b98f44079672da71}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-156"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{f456abaafa5235e8}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-157"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{1869750cb59bdd8e}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-158"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{46ca311ec9ac6057}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-159"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-160"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-161"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-162"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-163"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-164"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-165"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-166"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-167"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-168"
		x: to-i256 #{313e8c305103debc}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-169"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-170"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-171"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{01}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-172"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{02}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-173"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-174"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{29e42a8d59042cfd}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-175"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{313e8c305103debc}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-176"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{4261adbfa675703b}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-177"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{8aaea8e413a5aae3}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-178"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{cfee9cc0728f738b}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-179"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{b98f44079672da71}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-180"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{f456abaafa5235e8}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-181"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{1869750cb59bdd8e}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-182"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{46ca311ec9ac6057}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-183"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-184"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-185"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-186"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-187"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-188"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-189"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-190"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-191"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-192"
		x: to-i256 #{47cf2956be337e18}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-193"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-194"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-195"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{01}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-196"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{02}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-197"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-198"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{29e42a8d59042cfd}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-199"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{313e8c305103debc}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-200"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{47cf2956be337e18}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-201"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{8aaea8e413a5aae3}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-202"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{cfee9cc0728f738b}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-203"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{b98f44079672da71}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-204"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{f456abaafa5235e8}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-205"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{1869750cb59bdd8e}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-206"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{46ca311ec9ac6057}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-207"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-208"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-209"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-210"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-211"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-212"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-213"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-214"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-215"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-216"
		x: to-i256 #{4261adbfa675703b}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-217"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-218"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-219"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{01}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-220"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{02}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-221"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-222"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{29e42a8d59042cfd}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-223"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{313e8c305103debc}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-224"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{47cf2956be337e18}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-225"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{4261adbfa675703b}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-226"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{cfee9cc0728f738b}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-227"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{b98f44079672da71}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-228"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{f456abaafa5235e8}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-229"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{1869750cb59bdd8e}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-230"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{46ca311ec9ac6057}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-231"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-232"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-233"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-234"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-235"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-236"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-237"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-238"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-239"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-240"
		x: to-i256 #{8aaea8e413a5aae3}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-241"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-242"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-243"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{01}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-244"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{02}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-245"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-246"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{29e42a8d59042cfd}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-247"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{313e8c305103debc}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-248"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{47cf2956be337e18}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-249"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{4261adbfa675703b}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-250"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{8aaea8e413a5aae3}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-251"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{b98f44079672da71}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-252"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{f456abaafa5235e8}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-253"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{1869750cb59bdd8e}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-254"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{46ca311ec9ac6057}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-255"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-256"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-257"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-258"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-259"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-260"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-261"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-262"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-263"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-264"
		x: to-i256 #{cfee9cc0728f738b}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-265"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-266"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-267"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{01}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-268"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{02}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-269"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-270"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{29e42a8d59042cfd}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-271"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{313e8c305103debc}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-272"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{47cf2956be337e18}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-273"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{4261adbfa675703b}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-274"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{8aaea8e413a5aae3}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-275"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{cfee9cc0728f738b}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-276"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{f456abaafa5235e8}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-277"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{1869750cb59bdd8e}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-278"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{46ca311ec9ac6057}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-279"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-280"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-281"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-282"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-283"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-284"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-285"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-286"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-287"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-288"
		x: to-i256 #{b98f44079672da71}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-289"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-290"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-291"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{01}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-292"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{02}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-293"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-294"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{29e42a8d59042cfd}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-295"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{313e8c305103debc}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-296"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{47cf2956be337e18}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-297"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{4261adbfa675703b}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-298"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{8aaea8e413a5aae3}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-299"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{cfee9cc0728f738b}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-300"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{b98f44079672da71}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-301"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{1869750cb59bdd8e}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-302"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{46ca311ec9ac6057}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-303"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-304"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-305"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-306"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-307"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-308"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-309"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-310"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-311"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-312"
		x: to-i256 #{f456abaafa5235e8}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-313"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-314"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-315"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{01}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-316"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{02}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-317"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-318"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{29e42a8d59042cfd}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-319"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{313e8c305103debc}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-320"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{47cf2956be337e18}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-321"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{4261adbfa675703b}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-322"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{8aaea8e413a5aae3}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-323"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{cfee9cc0728f738b}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-324"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{b98f44079672da71}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-325"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{f456abaafa5235e8}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-326"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{46ca311ec9ac6057}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-327"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-328"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-329"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-330"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-331"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-332"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-333"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-334"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-335"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-336"
		x: to-i256 #{1869750cb59bdd8e}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-337"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-338"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-339"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{01}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-340"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{02}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-341"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-342"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{29e42a8d59042cfd}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-343"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{313e8c305103debc}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-344"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{47cf2956be337e18}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-345"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{4261adbfa675703b}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-346"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{8aaea8e413a5aae3}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-347"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{cfee9cc0728f738b}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-348"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{b98f44079672da71}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-349"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{f456abaafa5235e8}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-350"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{1869750cb59bdd8e}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-351"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-352"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-353"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-354"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-355"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-356"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-357"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-358"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-359"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-360"
		x: to-i256 #{46ca311ec9ac6057}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-361"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-362"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-363"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{01}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-364"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{02}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-365"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-366"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{29e42a8d59042cfd}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-367"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{313e8c305103debc}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-368"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{47cf2956be337e18}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-369"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{4261adbfa675703b}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-370"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{8aaea8e413a5aae3}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-371"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{cfee9cc0728f738b}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-372"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{b98f44079672da71}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-373"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{f456abaafa5235e8}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-374"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{1869750cb59bdd8e}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-375"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{46ca311ec9ac6057}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-376"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-377"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-378"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-379"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-380"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-381"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-382"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-383"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-384"
		x: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-385"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-386"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-387"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{01}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-388"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{02}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-389"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-390"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{29e42a8d59042cfd}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-391"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{313e8c305103debc}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-392"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{47cf2956be337e18}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-393"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{4261adbfa675703b}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-394"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{8aaea8e413a5aae3}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-395"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{cfee9cc0728f738b}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-396"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{b98f44079672da71}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-397"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{f456abaafa5235e8}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-398"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{1869750cb59bdd8e}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-399"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{46ca311ec9ac6057}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-400"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-401"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-402"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-403"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-404"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-405"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-406"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-407"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-408"
		x: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-409"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-410"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-411"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{01}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-412"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{02}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-413"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-414"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{29e42a8d59042cfd}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-415"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{313e8c305103debc}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-416"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{47cf2956be337e18}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-417"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{4261adbfa675703b}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-418"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{8aaea8e413a5aae3}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-419"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{cfee9cc0728f738b}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-420"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{b98f44079672da71}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-421"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{f456abaafa5235e8}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-422"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{1869750cb59bdd8e}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-423"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{46ca311ec9ac6057}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-424"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-425"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-426"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-427"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-428"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-429"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-430"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-431"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-432"
		x: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-433"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-434"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-435"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{01}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-436"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{02}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-437"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-438"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{29e42a8d59042cfd}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-439"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{313e8c305103debc}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-440"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{47cf2956be337e18}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-441"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{4261adbfa675703b}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-442"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{8aaea8e413a5aae3}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-443"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{cfee9cc0728f738b}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-444"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{b98f44079672da71}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-445"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{f456abaafa5235e8}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-446"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{1869750cb59bdd8e}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-447"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{46ca311ec9ac6057}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-448"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-449"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-450"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-451"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-452"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-453"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-454"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-455"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-456"
		x: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-457"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-458"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-459"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{01}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-460"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{02}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-461"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-462"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{29e42a8d59042cfd}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-463"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{313e8c305103debc}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-464"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{47cf2956be337e18}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-465"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{4261adbfa675703b}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-466"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{8aaea8e413a5aae3}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-467"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{cfee9cc0728f738b}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-468"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{b98f44079672da71}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-469"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{f456abaafa5235e8}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-470"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{1869750cb59bdd8e}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-471"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{46ca311ec9ac6057}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-472"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-473"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-474"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-475"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-476"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-477"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-478"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-479"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-480"
		x: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-481"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-482"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-483"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{01}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-484"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{02}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-485"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-486"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{29e42a8d59042cfd}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-487"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{313e8c305103debc}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-488"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{47cf2956be337e18}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-489"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{4261adbfa675703b}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-490"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{8aaea8e413a5aae3}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-491"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{cfee9cc0728f738b}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-492"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{b98f44079672da71}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-493"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{f456abaafa5235e8}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-494"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{1869750cb59bdd8e}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-495"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{46ca311ec9ac6057}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-496"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-497"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-498"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-499"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-500"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-501"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-502"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-503"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-504"
		x: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-505"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-506"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-507"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{01}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-508"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{02}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-509"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-510"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{29e42a8d59042cfd}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-511"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{313e8c305103debc}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-512"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{47cf2956be337e18}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-513"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{4261adbfa675703b}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-514"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{8aaea8e413a5aae3}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-515"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{cfee9cc0728f738b}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-516"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{b98f44079672da71}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-517"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{f456abaafa5235e8}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-518"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{1869750cb59bdd8e}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-519"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{46ca311ec9ac6057}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-520"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-521"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-522"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-523"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-524"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-525"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-526"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-527"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-528"
		x: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-529"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-530"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-531"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{01}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-532"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{02}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-533"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-534"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{29e42a8d59042cfd}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-535"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{313e8c305103debc}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-536"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{47cf2956be337e18}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-537"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{4261adbfa675703b}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-538"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{8aaea8e413a5aae3}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-539"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{cfee9cc0728f738b}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-540"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{b98f44079672da71}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-541"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{f456abaafa5235e8}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-542"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{1869750cb59bdd8e}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-543"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{46ca311ec9ac6057}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-544"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-545"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-546"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-547"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-548"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-549"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-550"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-551"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-552"
		x: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-553"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-554"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-555"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{01}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-556"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{02}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-557"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-558"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{29e42a8d59042cfd}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-559"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{313e8c305103debc}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-560"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{47cf2956be337e18}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-561"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{4261adbfa675703b}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-562"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{8aaea8e413a5aae3}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-563"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{cfee9cc0728f738b}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-564"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{b98f44079672da71}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-565"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{f456abaafa5235e8}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-566"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{1869750cb59bdd8e}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-567"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{46ca311ec9ac6057}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-568"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-569"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-570"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-571"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-572"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-573"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-574"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-575"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-576"
		x: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		y: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-577"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-578"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{00}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-579"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{01}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-580"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{02}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-581"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}
		z: true
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-582"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{29e42a8d59042cfd}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-583"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{313e8c305103debc}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-584"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{47cf2956be337e18}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-585"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{4261adbfa675703b}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-586"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{8aaea8e413a5aae3}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-587"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{cfee9cc0728f738b}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-588"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{b98f44079672da71}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-589"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{f456abaafa5235e8}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-590"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{1869750cb59bdd8e}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-591"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{46ca311ec9ac6057}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-592"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{74c677a898f103bfd22dcbcc6dd14629b0510b6fd4c0f7264da4e7980131ab6c}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-593"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{49e4a1c81ea85b33ef7d74d59f5f43481742a80692168a65c6d65b9326b6ec0a}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-594"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{17ff33b6cc9ddce25aab6619853c88f407fcdfe873ae38eee1544f4d4e6face3}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-595"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{948108e3fc3f1ead13df1b3b873991feb24fc0e3b56157bb28835e594aeb4123}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-596"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{97a9e85ae75d202c95e799f4188636955fafe01a6bad6e5c790605bf5c5279b4}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-597"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{343dd41ab77677fbfd444ef1dd15f78f264b7dae25fb96a94852ecfb52cfe212}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-598"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{4c42be108461fb343a71a436379efc11a5377d6ee611edab50629e70a339aa1e}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-599"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{30dcb0e734f1bdee0d48887750cea0aa465e0352e10d7042bbbbd11e6a7333f8}
		z: false
		--assert z  = lesser-or-equal256? x  y

	--test-- "lesser or equal-600"
		x: to-i256 #{db93189e8931bea2f842ba62886c1280aa57b37e919454c916ccc4ffd6e1b9bf}
		y: to-i256 #{ddfdec3d3a73229cb17cbdbf28944696b51d992ef358fab320eab7ee52649431}
		z: true
		--assert z  = lesser-or-equal256? x  y

===end-group===

~~~end-file~~~
