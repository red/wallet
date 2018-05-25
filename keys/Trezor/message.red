Red [
	Title:	"protobuf messages define for trezor"
	Author: "bitbegin"
	File: 	%message.red
	Tabs: 	4
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]
message: context [
	;-- MessageType
	MessageType_Initialize: 0
	MessageType_Ping: 1
	MessageType_Success: 2
	MessageType_Failure: 3
	MessageType_ChangePin: 4
	MessageType_WipeDevice: 5
	MessageType_FirmwareErase: 6
	MessageType_FirmwareUpload: 7
	MessageType_FirmwareRequest: 8
	MessageType_GetEntropy: 9
	MessageType_Entropy: 10
	MessageType_GetPublicKey: 11
	MessageType_PublicKey: 12
	MessageType_LoadDevice: 13
	MessageType_ResetDevice: 14
	MessageType_SignTx: 15
	MessageType_SimpleSignTx: 16
	MessageType_Features: 17
	MessageType_PinMatrixRequest: 18
	MessageType_PinMatrixAck: 19
	MessageType_Cancel: 20
	MessageType_TxRequest: 21
	MessageType_TxAck: 22
	MessageType_CipherKeyValue: 23
	MessageType_ClearSession: 24
	MessageType_ApplySettings: 25
	MessageType_ButtonRequest: 26
	MessageType_ButtonAck: 27
	MessageType_ApplyFlags: 28
	MessageType_GetAddress: 29
	MessageType_Address: 30
	MessageType_SelfTest: 32
	MessageType_BackupDevice: 34
	MessageType_EntropyRequest: 35
	MessageType_EntropyAck: 36
	MessageType_SignMessage: 38
	MessageType_VerifyMessage: 39
	MessageType_MessageSignature: 40
	MessageType_PassphraseRequest: 41
	MessageType_PassphraseAck: 42
	MessageType_PassphraseStateRequest: 77
	MessageType_PassphraseStateAck: 78
	MessageType_EstimateTxSize: 43
	MessageType_TxSize: 44
	MessageType_RecoveryDevice: 45
	MessageType_WordRequest: 46
	MessageType_WordAck: 47
	MessageType_CipheredKeyValue: 48
	MessageType_EncryptMessage: 49
	MessageType_EncryptedMessage: 50
	MessageType_DecryptMessage: 51
	MessageType_DecryptedMessage: 52
	MessageType_SignIdentity: 53
	MessageType_SignedIdentity: 54
	MessageType_GetFeatures: 55
	MessageType_EthereumGetAddress: 56
	MessageType_EthereumAddress: 57
	MessageType_EthereumSignTx: 58
	MessageType_EthereumTxRequest: 59
	MessageType_EthereumTxAck: 60
	MessageType_GetECDHSessionKey: 61
	MessageType_ECDHSessionKey: 62
	MessageType_SetU2FCounter: 63
	MessageType_EthereumSignMessage: 64
	MessageType_EthereumVerifyMessage: 65
	MessageType_EthereumMessageSignature: 66
	MessageType_NEMGetAddress: 67
	MessageType_NEMAddress: 68
	MessageType_NEMSignTx: 69
	MessageType_NEMSignedTx: 70
	MessageType_CosiCommit: 71
	MessageType_CosiCommitment: 72
	MessageType_CosiSign: 73
	MessageType_CosiSignature: 74
	MessageType_NEMDecryptMessage: 75
	MessageType_NEMDecryptedMessage: 76
	MessageType_DebugLinkDecision: 100
	MessageType_DebugLinkGetState: 101
	MessageType_DebugLinkState: 102
	MessageType_DebugLinkStop: 103
	MessageType_DebugLinkLog: 104
	MessageType_DebugLinkMemoryRead: 110
	MessageType_DebugLinkMemory: 111
	MessageType_DebugLinkMemoryWrite: 112
	MessageType_DebugLinkFlashErase: 113
	MessageType_LiskGetAddress: 114
	MessageType_LiskAddress: 115
	MessageType_LiskSignTx: 116
	MessageType_LiskSignedTx: 117
	MessageType_LiskSignMessage: 118
	MessageType_LiskMessageSignature: 119
	MessageType_LiskVerifyMessage: 120
	MessageType_LiskGetPublicKey: 121
	MessageType_LiskPublicKey: 122
	MessageType_StellarGetPublicKey: 200
	MessageType_StellarPublicKey: 201
	MessageType_StellarSignTx: 202
	MessageType_StellarTxOpRequest: 203
	MessageType_StellarSignMessage: 204
	MessageType_StellarMessageSignature: 205
	MessageType_StellarVerifyMessage: 206
	MessageType_StellarCreateAccountOp: 210
	MessageType_StellarPaymentOp: 211
	MessageType_StellarPathPaymentOp: 212
	MessageType_StellarManageOfferOp: 213
	MessageType_StellarCreatePassiveOfferOp: 214
	MessageType_StellarSetOptionsOp: 215
	MessageType_StellarChangeTrustOp: 216
	MessageType_StellarAllowTrustOp: 217
	MessageType_StellarAccountMergeOp: 218
	MessageType_StellarManageDataOp: 220
	MessageType_StellarBumpSequenceOp: 221
	MessageType_StellarSignedTx: 230

	;===================
	;-- basic messages
	;===================

	Initialize: [
		[1		bytes state optional]
	]

	Failure: [
		[1		enum code optional]
		[2		string message optional]
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

	GetPublicKey: [
		[1		uint32 address_n repeated]
		[2		string ecdsa_curve_name optional]
		[3		bool show_display optional]
		[4		string coin_name optional]
	]

	PinMatrixRequest: [
		;[1		PinMatrixRequestType type optional]			;-- TBC
		[1		enum type optional]
	]

	PinMatrixAck: [
		[1		string pin required]
	]

	PublicKey: [
		[1		HDNodeType node required]
		[2		string xpub optional]
	]

	EthereumGetAddress: [
		[1		uint32 address_n required]
		[2		bool show_display required]
	]

	EthereumAddress: [
		[1		bytes address required]
	]

	CoinType: [
		[1		string coin_name optional]
		[2		string coin_shortcut optional]
		[3		uint32 address_type optional]
		[4		uint64 maxfee_kb optional]
		[5		uint32 address_type_p2sh optional]
		[8		string signed_message_header optional]
		[9		uint32 xpub_magic optional]
		[10		uint32 xprv_magic optional]
		[11		bool segwit optional]
		[12		uint32 forkid optional]
		[13		bool force_bip143 optional]
	]

	HDNodeType: [
		[1		uint32 depth required]
		[2		uint32 fingerprint required]
		[3		uint32 child_num required]
		[4		bytes chain_code required]
		[5		bytes private_key optional]
		[6		bytes public_key optional]
	]

	tabs: [
		[Initialize					MessageType_Initialize				wire_in]
		[Failure					MessageType_Failure					wire_out]
		[GetFeatures				MessageType_GetFeatures				wire_in]
		[Features					MessageType_Features]
		[GetPublicKey				MessageType_GetPublicKey]
		[PinMatrixRequest			MessageType_PinMatrixRequest]
		[PinMatrixAck				MessageType_PinMatrixAck]
		[PublicKey					MessageType_PublicKey]
		[EthereumGetAddress			MessageType_EthereumGetAddress]
		[EthereumAddress			MessageType_EthereumAddress]
	]

	get-msg-id: func [
		msg				[word!]
		return:			[integer!]
		/local
			sub			[block!]
	][
		foreach sub tabs [
			if sub/1 = msg [
				return get sub/2
			]
		]
		-1
	]
]
