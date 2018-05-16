Red [
	Title:	"Driver for Multiple devices"
	Author: "bitbegin"
	File: 	%keys.red
	Tabs: 	4
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

#include %keys/Ledger/ledger.red

key: context [
    none-dev: ["<No Device>" []]
    devs: copy none-dev

    ledger-dev: "Ledger Nano S"

    get-devs: func[][
        if devs <> none-dev [
            clear devs
            devs: copy none-dev
        ]
        devs: append devs reduce [ledger-dev ledger/get-devs]
    ]

	connect: func [dev [string!] serial-num [string!]][
        case dev [
            ledger-dev [
                ledger/connect serial-num
            ]
            true [stack/set-last none-value]
        ]
    ]
]
