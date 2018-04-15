Red []

context [

	headers: compose [
		Content-Type: "application/json"
		Accept: "application/json"
		User-Agent: (
			form reduce [
				{Red Wallet version}
				read %version.red
				{for} system/platform/OS
			]
		)
	]

	body: #(
		jsonrpc: "2.0"
		id: 1
		method: none
		params: none
	)

	set 'rpc func [network [url!] method [word!] params [none! block!] /local url][
		body/method: method
		body/params: params
		select json/decode write network compose/only [
			POST
			(headers)
			(to-binary json/encode body)
		] 'result
	]

]
