Red [
	Title:	"protobuf messages define"
	Author: "bitbegin"
	File: 	%protobuf.red
	Tabs: 	4
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

protobuf: context [
	
	proto-buffer: make binary! 1000
	varint-buffer: make binary! 8

	;-- MessageType
	#define MessageType_Initialize 0
	#define MessageType_Ping 1
	#define MessageType_Success 2
	#define MessageType_Failure 3
	#define MessageType_ChangePin 4
	#define MessageType_WipeDevice 5
	#define MessageType_FirmwareErase 6
	#define MessageType_FirmwareUpload 7
	#define MessageType_FirmwareRequest 8
	#define MessageType_GetEntropy 9
	#define MessageType_Entropy 10
	#define MessageType_GetPublicKey 11
	#define MessageType_PublicKey 12
	#define MessageType_LoadDevice 13
	#define MessageType_ResetDevice 14
	#define MessageType_SignTx 15
	#define MessageType_SimpleSignTx 16
	#define MessageType_Features 17
	#define MessageType_PinMatrixRequest 18
	#define MessageType_PinMatrixAck 19
	#define MessageType_Cancel 20
	#define MessageType_TxRequest 21
	#define MessageType_TxAck 22
	#define MessageType_CipherKeyValue 23
	#define MessageType_ClearSession 24
	#define MessageType_ApplySettings 25
	#define MessageType_ButtonRequest 26
	#define MessageType_ButtonAck 27
	#define MessageType_ApplyFlags 28
	#define MessageType_GetAddress 29
	#define MessageType_Address 30
	#define MessageType_SelfTest 32
	#define MessageType_BackupDevice 34
	#define MessageType_EntropyRequest 35
	#define MessageType_EntropyAck 36
	#define MessageType_SignMessage 38
	#define MessageType_VerifyMessage 39
	#define MessageType_MessageSignature 40
	#define MessageType_PassphraseRequest 41
	#define MessageType_PassphraseAck 42
	#define MessageType_PassphraseStateRequest 77
	#define MessageType_PassphraseStateAck 78
	#define MessageType_EstimateTxSize 43
	#define MessageType_TxSize 44
	#define MessageType_RecoveryDevice 45
	#define MessageType_WordRequest 46
	#define MessageType_WordAck 47
	#define MessageType_CipheredKeyValue 48
	#define MessageType_EncryptMessage 49
	#define MessageType_EncryptedMessage 50
	#define MessageType_DecryptMessage 51
	#define MessageType_DecryptedMessage 52
	#define MessageType_SignIdentity 53
	#define MessageType_SignedIdentity 54
	#define MessageType_GetFeatures 55
	#define MessageType_EthereumGetAddress 56
	#define MessageType_EthereumAddress 57
	#define MessageType_EthereumSignTx 58
	#define MessageType_EthereumTxRequest 59
	#define MessageType_EthereumTxAck 60
	#define MessageType_GetECDHSessionKey 61
	#define MessageType_ECDHSessionKey 62
	#define MessageType_SetU2FCounter 63
	#define MessageType_EthereumSignMessage 64
	#define MessageType_EthereumVerifyMessage 65
	#define MessageType_EthereumMessageSignature 66
	#define MessageType_NEMGetAddress 67
	#define MessageType_NEMAddress 68
	#define MessageType_NEMSignTx 69
	#define MessageType_NEMSignedTx 70
	#define MessageType_CosiCommit 71
	#define MessageType_CosiCommitment 72
	#define MessageType_CosiSign 73
	#define MessageType_CosiSignature 74
	#define MessageType_NEMDecryptMessage 75
	#define MessageType_NEMDecryptedMessage 76
	#define MessageType_DebugLinkDecision 100
	#define MessageType_DebugLinkGetState 101
	#define MessageType_DebugLinkState 102
	#define MessageType_DebugLinkStop 103
	#define MessageType_DebugLinkLog 104
	#define MessageType_DebugLinkMemoryRead 110
	#define MessageType_DebugLinkMemory 111
	#define MessageType_DebugLinkMemoryWrite 112
	#define MessageType_DebugLinkFlashErase 113
	#define MessageType_LiskGetAddress 114
	#define MessageType_LiskAddress 115
	#define MessageType_LiskSignTx 116
	#define MessageType_LiskSignedTx 117
	#define MessageType_LiskSignMessage 118
	#define MessageType_LiskMessageSignature 119
	#define MessageType_LiskVerifyMessage 120
	#define MessageType_LiskGetPublicKey 121
	#define MessageType_LiskPublicKey 122
	#define MessageType_StellarGetPublicKey 200
	#define MessageType_StellarPublicKey 201
	#define MessageType_StellarSignTx 202
	#define MessageType_StellarTxOpRequest 203
	#define MessageType_StellarSignMessage 204
	#define MessageType_StellarMessageSignature 205
	#define MessageType_StellarVerifyMessage 206
	#define MessageType_StellarCreateAccountOp 210
	#define MessageType_StellarPaymentOp 211
	#define MessageType_StellarPathPaymentOp 212
	#define MessageType_StellarManageOfferOp 213
	#define MessageType_StellarCreatePassiveOfferOp 214
	#define MessageType_StellarSetOptionsOp 215
	#define MessageType_StellarChangeTrustOp 216
	#define MessageType_StellarAllowTrustOp 217
	#define MessageType_StellarAccountMergeOp 218
	#define MessageType_StellarManageDataOp 220
	#define MessageType_StellarBumpSequenceOp 221
	#define MessageType_StellarSignedTx 230

	;===================
	;-- basic messages
	;===================

	Initialize: [
		[1		bytes state optional]
	]

	GetFeatures: []

	Features: [
		[1		string vendor optional]
		[2 		uint32 major_version optional]
		[3		uint32 minor_version optional]
		[4		uint32 patch_version optional]
		[5		bool bootloader_mode optional]
		[6		string device_id optional]
		[7		bool pin_protection optional]
		[8		bool passphrase_protection optional]
		[9		string language optional]
		[10		string label optional]
		[11		CoinType coins repeated]
		[12		bool initialized optional]
		[13		bytes revision optional]
		[14		bytes bootloader_hash optional]
		[15		bool imported optional]
		[16		bool pin_cached optional]
		[17		bool passphrase_cached optional]
		[18		bool firmware_present optional]
		[19		bool needs_backup optional]
		[20		uint32 flags optional]
		[21		string model optional]
		[22		uint32 fw_major optional]
		[23		uint32 fw_minor optional]
		[24		uint32 fw_patch optional]
		[25		string fw_vendor optional]
		[26		bytes fw_vendor_keys optional]
		[27		bool unfinished_backup optional]
	]


	tabs: [
		[Initialize					MessageType_Initialize				wire_in]
		[GetFeatures				MessageType_GetFeatures				wire_in]
		[Features					MessageType_Features]
	]

	get-wire-type-id: [
		wire_type		[word!]
		return:			[integer!]
		/local
			ret			[integer!]
	][
		ret: switch wire_type [
			'int32 'int64 'uint32 'uint64 'sint32 'sint64 'bool 'enum [0]
			'fixed64 'sfixed64 'double [1]
			'string 'bytes 'repeated 'embedded [2]
			'fixed32 'sfixed32 'float [5]
			default [2]
		]
		ret
	]


	get-varint: func [
		int				[integer!]
		/local
			rest		[integer!]
			little		[integer!]
	][
		clear varint-buffer

		rest: int
		while [true][
			either rest < 128 [
				append varint-buffer to integer! rest
				exit
			][
				little: rest and 7Fh
				little: little or 80h
				append varint-buffer to integer! little
				rest: rest >> 7
			]
		]
	]

	encode-type: func [
		wire_type		[word!]
		field_number	[integer!]
		value			[integer! logic! string! binary!]
		data			[binary!]
		return:			[integer!]
		/local
			tag			[integer!]
			len			[integer!]
			ret			[integer!]
			v-type
	][
		v-type: type? value

		tag: field_number << 3 or get-wire-type-id wire_type
		get-varint tag

		ret: 0
		switch wire_type [
			'string 'bytes [
				if all [string! <> v-type binary! <> v-type] [return -1]
				append data varint-buffer
				ret: ret + length? varint-buffer
				len: length? value
				get-varint len
				append data varint-buffer
				ret: ret + length? varint-buffer
				append data value
				ret: ret + len
				return ret
			]
			'int32 'int64 'uint32 'uint64 'enum [
				if integer! <> v-type [return -1]
				append data varint-buffer
				ret: ret + length? varint-buffer
				get-varint to integer! value
				append data varint-buffer
				ret: ret + length? varint-buffer
				return ret
			]
			'bool [
				if logic! <> v-type [return -1]
				append data varint-buffer
				ret: ret + length? varint-buffer
				either value = true [append data #{01}][append data #{00}]
				ret: ret + 1
				return ret
			]
			default [return 0]
		]
	]

	encode: func [
		msg				[word!]
		name			[word!]
		value			[integer! logic! string! binary!]
		data			[binary!]
		return:			[integer!]
		/local
			tagid		[integer!]
			blk			[block!]
			sub			[block!]
			len			[integer!]
			ret			[integer!]
	][
		clear proto-buffer

		blk: get msg
		len: length? blk
		if len = 0 [return 0]

		foreach sub blk [
			if sub/3 = name [

			]
		]
	]

	initialize: func [
		/local

	][

	]
]

