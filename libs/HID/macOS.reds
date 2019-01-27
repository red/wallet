Red/System [
	Title:	"Hidapi"
	Author: "Huang Yongzhao"
	File: 	%macOS.reds
	Tabs: 	4
	Rights:  "Copyright (C) 2018 Red Foundation. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

#define IUNKNOWN_C_GUTS [
    _reserved			[int-ptr!]
	QueryInterface		[QueryInterface!]
	AddRef				[AddRef!]
	Release				[Release!]
]

hid: context [
	#define	EINVAL		22		;/* Invalid argument */
	#define kIOHIDSerialNumberKey               "SerialNumber"
	#define kIOHIDManufacturerKey               "Manufacturer"
	#define kIOHIDProductKey                    "Product"
	#define kIOHIDPrimaryUsagePageKey           "PrimaryUsagePage"
	#define kIOHIDPrimaryUsageKey               "PrimaryUsage"
	#define kIOHIDVersionNumberKey              "VersionNumber"
	#define kIOServicePlane						"IOService"
	#define kIOHIDVendorIDKey                   "VendorID"
	#define kIOHIDProductIDKey                  "ProductID"
	#define kIOHIDMaxInputReportSizeKey         "MaxInputReportSize"
	#define BUF_LEN 							256
	#define kCFNumberSInt8Type					1
	#define kCFNumberSInt32Type  				3
	#define HID_CFSTR(cStr)						[CFStringCreateWithCString 0 cStr 08000100h]
	#define LOWORD(param) (param and FFFFh << 16 >> 16)
	#define HIWORD(param) (param >> 16)
	#define WIDE_CHAR_SIZE						4
	#define kIOHIDOptionsTypeSeizeDevice		1
	#define kCFStringEncodingASCII				00000600h
	#define kIOHIDReportTypeOutput 				1
	#define	ETIMEDOUT							60

	this!: alias struct! [vtbl [integer!]]

	UUID!: alias struct! [
		data1	[integer!]
		data2	[integer!]
		data3	[integer!]
		data4	[integer!]
	]

	QueryInterface!: alias function! [
		this		[this!]
		riid		[UUID! value]
		ppvObject	[int-ptr!]
		return:		[integer!]
	]

	AddRef!: alias function! [
		this		[this!]
		return:		[integer!]
	]

	Release!: alias function! [
		this		[this!]
		return:		[integer!]
	]

	IOUSBFindInterfaceRequest: alias struct! [
		class-subclass	 [integer!]
		protocol-setting [integer!]
	]

	hid_mgr: as int-ptr! 0
	kCFStringEncodingUTF32LE: 1C000100h

	timeval!: alias struct! [
		tv_sec	[integer!]
		tv_usec [integer!]
	]

	timespec!: alias struct! [
		sec    [integer!] ;Seconds
		nsec   [integer!] ;Nanoseconds
	]

	hid-device-info: alias struct! [
		path 				[c-string!]
		id 					[integer!] ;vendor-id and product-id
		serial-number 		[c-string!]
		manufacturer-string [c-string!]
		product-string 		[c-string!]
		usage 				[integer!] ;usage-page and usage
		release-number		[integer!]
		interface-number	[integer!]
		next				[hid-device-info]
	]

	CFRange: alias struct! [
		location 	[integer!]
		length 		[integer!]
	]

	pthread_cond_t: alias struct! [
		__sig       [integer!]
		opaque1     [integer!]	;opaque size =24
		opaque2		[integer!]
		opaque3     [integer!]
		opaque4		[integer!]
		opaque5     [integer!]
		opaque6		[integer!]
	]

	pthread_mutex_t: alias struct! [
		__sig 		[integer!]
		opaque1     [integer!]	;opaque size =40
		opaque2		[integer!]
		opaque3     [integer!]
		opaque4		[integer!]
		opaque5     [integer!]
		opaque6		[integer!]
		opaque7     [integer!]
		opaque8		[integer!]
		opaque9     [integer!]
		opaque10	[integer!]
	]
	pthread_barrier_t: alias struct! [
		mutex       [pthread_mutex_t value]
		cond        [pthread_cond_t value]
		count       [integer!]
		trip_count  [integer!]
	]

	input_report: alias struct! [
		data 		[byte-ptr!]
		len 	 	[integer!]
		next 		[input_report]
	]

	#define pthread_t int-ptr!

	hid-device: alias struct! [
		device_handle 			[int-ptr!]
		blocking 				[integer!]
		uses_numbered_reports	[integer!]
		disconnected			[integer!]
		run_loop_mode 			[int-ptr!]
		run_loop 				[int-ptr!]
		source 					[int-ptr!]
		input_report_buf		[c-string!]
		max_input_report_len 	[integer!]  ;CFIndex alias int
		input_reports 			[input_report]

		raw-usb?				[logic!]
		dev-ifc					[this!]
		pipe-ifc				[this!]
		read-id					[integer!]
		write-id				[integer!]
		read-sz					[integer!]
		ifc-source				[integer!]

		thread 					[pthread_t]
		mutex 					[pthread_mutex_t value]   ;pthread_mutex_t is int
		condition 				[pthread_cond_t value]
		barrier 				[pthread_barrier_t value]
		shutdown_barrier 		[pthread_barrier_t value]
		shutdown_thread 		[integer!]
	]

	CFRunLoopSourceContext: alias struct! [
		version 			[integer!]
		info 				[int-ptr!]
		retain				[int-ptr!]
		release 			[int-ptr!]
		copyDescription		[int-ptr!]
		equal				[int-ptr!]
		hash 				[int-ptr!]
		schedule 			[int-ptr!]
		cancel 				[int-ptr!]
		perform 			[int-ptr!]
	]

	IOUSBDeviceInterface: alias struct! [
		IUNKNOWN_C_GUTS
		CreateDeviceAsyncEventSource	[function! [this [this!] source [int-ptr!] return: [integer!]]]
		GetDeviceAsyncEventSource		[function! [this [this!] return: [int-ptr!]]]
		CreateDeviceAsyncPort			[function! [this [this!] port [int-ptr!] return: [integer!]]]
		GetDeviceAsyncPort				[function! [this [this!] return: [integer!]]]
		USBDeviceOpen					[function! [this [this!] return: [integer!]]]
		USBDeviceClose					[function! [this [this!] return: [int-ptr!]]]
		GetDeviceClass					[function! [this [this!] intfClass [c-string!] return: [integer!]]]
		GetDeviceSubClass				[function! [this [this!] intfClass [c-string!] return: [integer!]]]
		GetDeviceProtocol				[function! [this [this!] intfClass [c-string!] return: [integer!]]]
		GetDeviceVendor					[function! [this [this!] vender [int-ptr!] return: [integer!]]]
		GetDeviceProduct				[function! [this [this!] vender [int-ptr!] return: [integer!]]]
		GetDeviceReleaseNumber			[function! [this [this!] vender [int-ptr!] return: [integer!]]]
		GetDeviceAddress				[function! [this [this!] vender [int-ptr!] return: [integer!]]]
		GetDeviceBusPowerAvailable		[function! [this [this!] vender [int-ptr!] return: [integer!]]]
		GetDeviceSpeed					[function! [this [this!] vender [byte-ptr!] return: [integer!]]]
		GetNumberOfConfigurations		[function! [this [this!] vender [byte-ptr!] return: [integer!]]]
		GetLocationID					[function! [this [this!] vender [int-ptr!] return: [integer!]]]
		GetConfigurationDescriptorPtr	[integer!]
		GetConfiguration				[function! [this [this!] vender [byte-ptr!] return: [integer!]]]
		SetConfiguration				[function! [this [this!] vender [byte-ptr!] return: [integer!]]]
		GetBusFrameNumber				[integer!]
		ResetDevice						[function! [this [this!] return: [integer!]]]
		DeviceRequest					[function! [this [this!] req [int-ptr!] return: [integer!]]]
		DeviceRequestAsync				[integer!]
		CreateInterfaceIterator			[function! [this [this!] req [IOUSBFindInterfaceRequest] iter [int-ptr!] return: [integer!]]]
		USBDeviceOpenSeize				[function! [this [this!] return: [integer!]]]
		DeviceRequestTO					[integer!]
		DeviceRequestAsyncTO			[integer!]
		USBDeviceSuspend				[function! [this [this!] suspend [logic!] return: [integer!]]]
		USBDeviceAbortPipeZero			[integer!]
		USBGetManufacturerStringIndex	[function! [this [this!] req [byte-ptr!] return: [integer!]]]
		USBGetProductStringIndex		[function! [this [this!] req [byte-ptr!] return: [integer!]]]
		USBGetSerialNumberStringIndex	[function! [this [this!] req [byte-ptr!] return: [integer!]]]
		USBDeviceReEnumerate			[function! [this [this!] options [integer!] return: [integer!]]]
		GetBusMicroFrameNumber			[integer!]
		GetIOUSBLibVersion				[integer!]
		GetBusFrameNumberWithTime		[integer!]
		GetUSBDeviceInformation			[integer!]
		RequestExtraPower				[integer!]
		ReturnExtraPower				[integer!]
		GetExtraPowerAllocated			[integer!]
		GetBandwidthAvailableForDevice	[function! [this [this!] req [int-ptr!] return: [integer!]]]
	]

	IOUSBInterfaceInterface: alias struct! [	;IOUSBInterfaceInterface550
		IUNKNOWN_C_GUTS
		CreateInterfaceAsyncEventSource	[function! [this [this!] source [int-ptr!] return: [integer!]]]
		GetInterfaceAsyncEventSource	[int-ptr!]
		CreateInterfaceAsyncPort		[function! [this [this!] port [int-ptr!] return: [integer!]]]
		GetInterfaceAsyncPort			[function! [this [this!] return: [integer!]]]
		USBInterfaceOpen				[function! [this [this!] return: [integer!]]]
		USBInterfaceClose				[function! [this [this!] return: [integer!]]]
		GetInterfaceClass				[function! [this [this!] intfClass [c-string!] return: [integer!]]]
		GetInterfaceSubClass			[function! [this [this!] intfClass [c-string!] return: [integer!]]]
		GetInterfaceProtocol			[function! [this [this!] intfClass [c-string!] return: [integer!]]]
		GetDeviceVendor					[function! [this [this!] vender [int-ptr!] return: [integer!]]]
		GetDeviceProduct				[function! [this [this!] product [int-ptr!] return: [integer!]]]
		GetDeviceReleaseNumber			[function! [this [this!] relnum [int-ptr!] return: [integer!]]]
		GetConfigurationValue			[function! [this [this!] value [int-ptr!] return: [integer!]]]
		GetInterfaceNumber				[function! [this [this!] inum [int-ptr!] return: [integer!]]]
		GetAlternateSetting				[function! [this [this!] alt [int-ptr!] return: [integer!]]]
		GetNumEndpoints					[function! [this [this!] endpt [int-ptr!] return: [integer!]]]
		GetLocationID					[function! [this [this!] id [int-ptr!] return: [integer!]]]
		GetDevice						[function! [this [this!] device [int-ptr!] return: [integer!]]]
		SetAlternateInterface			[function! [this [this!] alt [byte!] return: [integer!]]]
		GetBusFrameNumber				[int-ptr!]
		ControlRequest					[function! [this [this!] pipeRef [integer!] req [int-ptr!] return: [integer!]]]
		ControlRequestAsync				[function! [this [this!] pipeRef [integer!] req [int-ptr!] callback [int-ptr!] refCon [int-ptr!] return: [integer!]]]
		GetPipeProperties				[function! [this [this!] pipeRef [integer!] dir [int-ptr!] num [int-ptr!] type [int-ptr!] size [int-ptr!] interval [int-ptr!] return: [integer!]]]
		GetPipeStatus					[function! [this [this!] pipeRef [integer!] return: [integer!]]]
		AbortPipe						[function! [this [this!] pipeRef [integer!] return: [integer!]]]
		ResetPipe						[function! [this [this!] pipeRef [integer!] return: [integer!]]]
		ClearPipeStall					[function! [this [this!] pipeRef [integer!] return: [integer!]]]
		ReadPipe						[function! [this [this!] pipeRef [integer!] buf [byte-ptr!] size [int-ptr!] return: [integer!]]]
		WritePipe						[function! [this [this!] pipeRef [integer!] buf [byte-ptr!] size [integer!] return: [integer!]]]
		ReadPipeAsync					[function! [this [this!] pipeRef [integer!] buf [byte-ptr!] size [integer!] callback [int-ptr!] refCon [int-ptr!] return: [integer!]]]
		WritePipeAsync					[function! [this [this!] pipeRef [integer!] buf [byte-ptr!] size [integer!] callback [int-ptr!] refCon [int-ptr!] return: [integer!]]]
		ReadIsochPipeAsync				[int-ptr!]
		WriteIsochPipeAsync				[int-ptr!]
		ControlRequestTO				[function! [this [this!] pipeRef [integer!] buf [byte-ptr!] req [int-ptr!] return: [integer!]]]
		ControlRequestAsyncTO			[function! [this [this!] pipeRef [integer!] buf [byte-ptr!] req [int-ptr!] callback [int-ptr!] refCon [int-ptr!] return: [integer!]]]
		ReadPipeTO						[function! [this [this!] pipeRef [integer!] buf [byte-ptr!] size [int-ptr!] dataTimeout [integer!] completionTimeout [integer!] return: [integer!]]]
		WritePipeTO						[function! [this [this!] pipeRef [integer!] buf [byte-ptr!] size [integer!] dataTimeout [integer!] completionTimeout [integer!] return: [integer!]]]
		ReadPipeAsyncTO					[function! [this [this!] pipeRef [integer!] buf [byte-ptr!] size [integer!] dataTimeout [integer!] completionTimeout [integer!] callback [int-ptr!] refCon [int-ptr!] return: [integer!]]]
		WritePipeAsyncTO				[function! [this [this!] pipeRef [integer!] buf [byte-ptr!] size [integer!] dataTimeout [integer!] completionTimeout [integer!] callback [int-ptr!] refCon [int-ptr!] return: [integer!]]]
		USBInterfaceGetStringIndex		[function! [this [this!] si [byte-ptr!] return: [integer!]]]
		USBInterfaceOpenSeize			[function! [this [this!] return: [integer!]]]
		ClearPipeStallBothEnds			[function! [this [this!] pipeRef [integer!] return: [integer!]]]
		SetPipePolicy					[function! [this [this!] pipeRef [integer!] size [integer!] interval [byte!] return: [integer!]]]
		GetBandwidthAvailable			[function! [this [this!] bandwidth [int-ptr!] return: [integer!]]]
		GetEndpointProperties			[function! [this [this!] alt [byte!] endpt [byte!] dir [byte!] type [byte-ptr!] size [int-ptr!] interval [byte-ptr!] return: [integer!]]]
		LowLatencyReadIsochPipeAsync	[int-ptr!]
		LowLatencyWriteIsochPipeAsync	[int-ptr!]
		LowLatencyCreateBuffer			[int-ptr!]
		LowLatencyDestroyBuffer			[int-ptr!]
		GetBusMicroFrameNumber			[int-ptr!]
		GetFrameListTime				[int-ptr!]
		GetIOUSBLibVersion				[function! [this [this!] libver [int-ptr!] familiyver [int-ptr!] return: [integer!]]]
		FindNextAssociatedDescriptor	[int-ptr!]
		FindNextAltInterface			[int-ptr!]
		GetBusFrameNumberWithTime		[int-ptr!]
		GetPipePropertiesV2				[int-ptr!]
		GetPipePropertiesV3				[int-ptr!]
		GetEndpointPropertiesV3			[int-ptr!]
		SupportsStreams					[int-ptr!]
		CreateStreams					[int-ptr!]
		GetConfiguredStreams			[int-ptr!]
		ReadStreamsPipeTO				[int-ptr!]
		WriteStreamsPipeTO				[int-ptr!]
		ReadStreamsPipeAsyncTO			[int-ptr!]
		WriteStreamsPipeAsyncTO			[int-ptr!]
		AbortStreamsPipe				[int-ptr!]
	]

	#import [
		LIBC-file cdecl [
				sleep: "sleep" [
					n		[integer!]
				]
				strdup: "strdup" [
					str1 		[c-string!]
					return: 	[c-string!]
				]
				wcscpy: "wcscpy" [
					str1 		[c-string!]
					str2 		[c-string!]
					return: 	[c-string!]
				]
				wcscmp: "wcscmp" [
				string1		[c-string!]
				string2 	[c-string!]
				return: 	[integer!]
				]
				pthread_mutex_init: "pthread_mutex_init" [
					mutex 		[int-ptr!]
					attr 		[int-ptr!]
					return: 	[integer!]
				]
				pthread_cond_init: "pthread_cond_init" [
					cond 		[int-ptr!]
					attr 		[int-ptr!]
					return: 	[integer!]
				]
				pthread_mutex_destroy: "pthread_mutex_destroy" [
					mutex 		[int-ptr!]
					return: 	[integer!]
				]
				pthread_cond_destroy: "pthread_cond_destroy" [
					cond 		[int-ptr!]
					return: 	[integer!]
				]
				pthread_mutex_lock: "pthread_mutex_lock" [
					mutex 		[int-ptr!]
					return: 	[integer!]
				]
				pthread_mutex_unlock: "pthread_mutex_unlock" [
					mutex 		[int-ptr!]
					return: 	[integer!]
				]
				pthread_cond_broadcast: "pthread_cond_broadcast" [
					cond 		[int-ptr!]
					return: 	[integer!]
				]
				pthread_cond_wait: "pthread_cond_wait" [
					cond		[int-ptr!]
					mutex		[int-ptr!]
					return: 	[integer!]
				]
				wcslen: "wcslen" [
					wcs   		[c-string!]
					return: 	[integer!]
				]
				wprintf: "wprintf" [
					[variadic]
					return: 	[integer!]
				]
				pthread_create: "pthread_create" [
					restrict 	[int-ptr!]
					restrict1 	[int-ptr!]
					restrict2 	[int-ptr!]
					restrict3 	[int-ptr!]
					return: 	[integer!]
				]
				memcpy: "memcpy" [
					destination 	[byte-ptr!]
					source 			[byte-ptr!]
					size 			[integer!]
				]
				pthread_cond_signal: "pthread_cond_signal" [
					pthread_cond 	[int-ptr!]
					return: 		[integer!]
				]
				gettimeofday: "gettimeofday" [
					tv		[timeval!]
					tz		[integer!]			;-- obsolete
					return: [integer!]			;-- 0: success -1: failure
				]
				pthread_cond_timedwait: "pthread_cond_timedwait" [
					restrict	[int-ptr!]
					restrict1 	[int-ptr!]
					restrict3 	[timespec!]
					return: 	[integer!]
				]
				pthread_join: "pthread_join" [
					thread 		[pthread_t]
					retval 		[int-ptr!]
					return: 	[integer!]
				]
		]
		"/System/Library/Frameworks/IOKit.framework/IOKit" cdecl [
			IOHIDDeviceGetProperty: "IOHIDDeviceGetProperty" [
				key 			[int-ptr!]
				device 			[c-string!]
				return: 		[int-ptr!]
			]
			IOHIDDeviceGetService: "IOHIDDeviceGetService" [
				device 			[int-ptr!]
				return: 		[int-ptr!]
			]
			IORegistryEntryGetPath: "IORegistryEntryGetPath" [
				entry			[int-ptr!]
				plane 			[c-string!]   ;--size is 128
				path 			[c-string!]   ;--size is 512
				return: 		[integer!]
			]
			IOHIDManagerCreate: "IOHIDManagerCreate" [
				allocator 		[int-ptr!]
				options			[integer!]
				return: 		[int-ptr!]
			]
			IOHIDManagerSetDeviceMatching: "IOHIDManagerSetDeviceMatching" [
				manager 		[int-ptr!]
				matching		[int-ptr!]
			]
			IOHIDManagerScheduleWithRunLoop: "IOHIDManagerScheduleWithRunLoop" [
				manager 		[int-ptr!]
				runloop 		[int-ptr!]
				runLoopMode		[int-ptr!]
			]
			IOHIDManagerClose: "IOHIDManagerClose" [
				manager 		[int-ptr!]
				options			[integer!]
				return: 		[integer!]
			]
			IOHIDManagerCopyDevices: "IOHIDManagerCopyDevices" [
				manager			[int-ptr!]
				return: 		[int-ptr!]
			]
			IORegistryEntryFromPath: "IORegistryEntryFromPath" [
				masterPort 		[int-ptr!]
				path 			[c-string!]
				return: 		[int-ptr!]
			]
			IOObjectRelease: "IOObjectRelease" [
				object 		[int-ptr!]
				return: 	[integer!]
			]
			IOHIDDeviceCreate: "IOHIDDeviceCreate" [
				allocator 	[int-ptr!]
				service 	[int-ptr!]
				return: 	[int-ptr!]
			]
			IOHIDDeviceOpen: "IOHIDDeviceOpen" [
				device 		[int-ptr!]
				options 	[integer!]
				return: 	[integer!]
			]
			IOHIDDeviceRegisterInputReportCallback: "IOHIDDeviceRegisterInputReportCallback" [
				device 			[int-ptr!]
				report 			[byte-ptr!]
				reportlength	[integer!]
				callback 		[int-ptr!]  ;--Pointer to a callback method of type IOHIDReportCallback.
				context 		[int-ptr!]
			]
			IOHIDDeviceRegisterRemovalCallback: "IOHIDDeviceRegisterRemovalCallback" [
				device 			[int-ptr!]
				callback 		[int-ptr!]
				context 		[int-ptr!]
			]
			IOHIDDeviceScheduleWithRunLoop: "IOHIDDeviceScheduleWithRunLoop" [
				device 			[int-ptr!]
				runloop 		[int-ptr!]
				runLoopMode		[int-ptr!]
			]
			IOHIDDeviceSetReport: "IOHIDDeviceSetReport" [
				device 			[int-ptr!]
				type 			[integer!]
				reportID      	[integer!]
				report			[byte-ptr!]
				reportLength	[integer!]
				return: 		[integer!]
			]
			IOHIDDeviceUnscheduleFromRunLoop: "IOHIDDeviceUnscheduleFromRunLoop" [
				device 			[int-ptr!]
				runloop			[int-ptr!]
				runLoopMode		[int-ptr!]
			]
			IOServiceMatching: "IOServiceMatching" [
				name			[c-string!]
				return:			[integer!]
			]
			IOServiceGetMatchingServices: "IOServiceGetMatchingServices" [
				masterPort		[integer!]
				matching		[integer!]
				existing		[int-ptr!]
				return:			[integer!]
			]
			IOIteratorNext: "IOIteratorNext" [
				iterate			[integer!]
				return:			[int-ptr!]
			]
			IORegistryEntryGetName: "IORegistryEntryGetName" [
				dev				[int-ptr!]
				name			[byte-ptr!]
				return:			[integer!]
			]
			IOCreatePlugInInterfaceForService: "IOCreatePlugInInterfaceForService" [
				dev				[int-ptr!]
				typeID			[int-ptr!]
				interfaceID		[int-ptr!]
				interface		[int-ptr!]
				score			[int-ptr!]
				return:			[integer!]
			]
			IORegistryEntryCreateCFProperty: "IORegistryEntryCreateCFProperty" [
				entry			[int-ptr!]
				key				[int-ptr!]
				allocator		[integer!]
				options			[integer!]
				return:			[int-ptr!]
			]
		]
		"/System/Library/Frameworks/CoreFoundation.framework/CoreFoundation" cdecl [
			kCFRunLoopDefaultMode: "kCFRunLoopDefaultMode" [integer!]
			kCFAllocatorDefault: "kCFAllocatorDefault" [integer!]
			kIOMasterPortDefault: "kIOMasterPortDefault" [integer!]
			CFStringCreateWithCString: "CFStringCreateWithCString" [
						allocator	[integer!]
						cStr		[c-string!]
						encoding	[integer!]
						return:		[int-ptr!]
					]
			CFRunLoopRunInMode: "CFRunLoopRunInMode" [
				mode 						[int-ptr!]
				seconds 					[float!]
				returnAfterSourceHandled	[logic!]
				return: 					[integer!]
			]
			CFSetGetCount: "CFSetGetCount" [
				theSet 			[int-ptr!]
				return: 		[integer!]
			]
			CFSetGetValues: "CFSetGetValues" [
				theSet 			[int-ptr!]
				values 			[int-ptr!]
			]
			CFGetTypeID: "CFGetTypeID" [
				cf 			[int-ptr!]
				return: 	[integer!]
			]
			CFNumberGetTypeID: "CFNumberGetTypeID" [
				return: 	[integer!]
			]
			CFNumberGetValue: "CFNumberGetValue" [
				number 		[int-ptr!]
				theType 	[integer!]
				valuePtr	[int-ptr!]
				return: 	[integer!]
			]
			CFRelease: "CFRelease" [
				cf 			[int-ptr!]
			]
			CFStringGetLength: "CFStringGetLength" [
				theString 	[int-ptr!]
				return: 	[integer!]
			]
			CFStringGetBytes: "CFStringGetBytes" [
				theString					[int-ptr!]
				range 						[CFRange value]
				encoding					[integer!]
				lossByte					[byte!]
				isExternalRepresentation	[logic!]
				buffer 						[byte-ptr!]
				maxBufLen					[integer!]
				usedBufLen 					[int-ptr!]
				return: 					[integer!]
			]
			CFRunLoopGetCurrent: "CFRunLoopGetCurrent" [
				return: 				[int-ptr!]
			]
			CFRunLoopGetMain: "CFRunLoopGetMain" [
				return: 				[int-ptr!]
			]
			CFRunLoopStop: "CFRunLoopStop" [
				rl   		[int-ptr!]
			]
			CFRunLoopSourceCreate: "CFRunLoopSourceCreate" [
				allocator 	[int-ptr!]
				order 		[integer!]
				context		[int-ptr!]
				return: 	[int-ptr!]
			]
			CFRunLoopAddSource: "CFRunLoopAddSource" [
				rl 			[int-ptr!]
				source 		[int-ptr!]
				mode 		[int-ptr!]
			]
			CFRunLoopSourceSignal: "CFRunLoopSourceSignal" [
				source 		[int-ptr!]
			]
			CFRunLoopWakeUp: "CFRunLoopWakeUp" [
				rl 			[int-ptr!]
			]
			CFUUIDGetConstantUUIDWithBytes: "CFUUIDGetConstantUUIDWithBytes" [
				allocator	[int-ptr!]
				byte0		[byte!]
				byte1		[byte!]
				byte2		[byte!]
				byte3		[byte!]
				byte4		[byte!]
				byte5		[byte!]
				byte6		[byte!]
				byte7		[byte!]
				byte8		[byte!]
				byte9		[byte!]
				byte10		[byte!]
				byte11		[byte!]
				byte12		[byte!]
				byte13		[byte!]
				byte14		[byte!]
				byte15		[byte!]
				return:		[int-ptr!]
			]
			CFUUIDGetUUIDBytes: "CFUUIDGetUUIDBytes" [
				guid		[int-ptr!]
				return:		[UUID! value]
			]
		]
	]

	TIMEVAL_TO_TIMESPEC: func [
		tv 			[timeval!]
		ts 			[timespec!]
	][
		ts/sec: tv/tv_sec
		ts/nsec: 1000 * tv/tv_usec
	]


	pthread_barrier_init: func [
		barrier 	[pthread_barrier_t]
		count 		[integer!]
		return: 	[integer!]
	][
		if count = 0 [
			return -1
		]
		if (pthread_mutex_init :barrier/mutex null) < 0 [
			return -1
		]
		if (pthread_cond_init :barrier/cond null) < 0 [
			pthread_mutex_destroy :barrier/mutex
			return -1
		]
		barrier/trip_count: count
		barrier/count: 0
		0
	]

	pthread_barrier_destroy: func [
		barrier 		[pthread_barrier_t]
		return: 		[integer!]
	][
		pthread_cond_destroy :barrier/cond
		pthread_mutex_destroy :barrier/mutex
		0
	]

	pthread_barrier_wait: function [
		barrier			[pthread_barrier_t]
		return: 		[integer!]
	][
		pthread_mutex_lock :barrier/mutex
		barrier/count: barrier/count + 1
		either barrier/count >= barrier/trip_count [
			barrier/count: 0
			pthread_cond_broadcast :barrier/cond
			pthread_mutex_unlock :barrier/mutex
			return 1
		][
			pthread_cond_wait :barrier/cond :barrier/mutex
			pthread_mutex_unlock :barrier/mutex
			return 0
		]
	]

	new-hid-device: func [
		return: 	[hid-device]
		/local
		dev 		[hid-device]
	][
		dev: as hid-device allocate size? hid-device
		set-memory as byte-ptr! dev null-byte size? hid-device
		dev/device_handle: null
		dev/blocking: 1
		dev/uses_numbered_reports: 0
		dev/disconnected: 0
		dev/run_loop_mode: null
		dev/run_loop: null
		dev/source: null
		dev/input_report_buf: null
		dev/input_reports: null
		dev/shutdown_thread: 0

		pthread_mutex_init :dev/mutex null
		pthread_cond_init :dev/condition null
		pthread_barrier_init as pthread_barrier_t :dev/barrier 2
		pthread_barrier_init as pthread_barrier_t :dev/shutdown_barrier 2
		dev
	]

	free-hid-device: func [
		dev 		[hid-device]
		/local
		rpt 		[input_report value]
		next 		[input_report]
	][
		if dev = null [
			exit
		]
		;--delete any input reports still left over
		rpt: dev/input_reports
		while [rpt <> null] [
			next: rpt/next
			free rpt/data
			free as byte-ptr! rpt
			rpt: next
		]

		;--free the string and report buffer.
		if dev/run_loop_mode <> null [
			CFRelease dev/run_loop_mode
		]
		if dev/source <> null [
			CFRelease dev/source
		]
		free as byte-ptr! dev/input_report_buf

		;--clean up the thread objects
		pthread_barrier_destroy as pthread_barrier_t :dev/shutdown_barrier
		pthread_barrier_destroy as pthread_barrier_t :dev/barrier
		pthread_cond_destroy :dev/condition
		pthread_mutex_destroy :dev/mutex

		;--free the structure itself
		free as byte-ptr! dev
	]

	hid-free-enumeration: func [
		devs 		[hid-device-info]
		/local
			d 		[hid-device-info]
			next 	[hid-device-info]
	][
		d: devs
		while [d <> null] [
			next: d/next
			free as byte-ptr! d/path
			free as byte-ptr! d/serial-number
			free as byte-ptr! d/manufacturer-string
			free as byte-ptr! d/product-string
			free as byte-ptr! d
			d: next
		]

	]

	get_int_property: func [
		device 			[int-ptr!]
		key				[c-string!]
		return: 		[integer!]
		/local
			ref 		[int-ptr!]
			value 		[integer!]
	][
		value: 0
		ref: IOHIDDeviceGetProperty device key
		if ref <> null [
			if (CFGetTypeID ref) = CFNumberGetTypeID [
				CFNumberGetValue 	ref
									kCFNumberSInt32Type
									:value
			return value
			]
		]
		return 0
	]

	get_vendor_id: func [
		device 			[int-ptr!]
		return: 		[integer!]
	][
		return get_int_property device as c-string! HID_CFSTR(kIOHIDVendorIDKey)
	]

	get_product_id: func [
		device 			[int-ptr!]
		return: 		[integer!]
	][
		return get_int_property device as c-string! HID_CFSTR(kIOHIDProductIDKey)
	]

	get_max_report_length: func [
		device 			[int-ptr!]
		return: 		[integer!]
	][
		return get_int_property device as c-string! HID_CFSTR(kIOHIDMaxInputReportSizeKey)
	]

	get_string_property: func [
		device 		[int-ptr!]
		prop 		[c-string!]
		buf 		[c-string!]
		len 		[integer!]
		return: 	[integer!]
		/local
			cf-str 			[int-ptr!]
			str_len 		[integer!]
			used_buf_len	[integer!]
			chars_copied	[integer!]
			range 			[CFRange value]
			len1 			[integer!]
	][
		used_buf_len: 0
		if len = 0 [
			return 0
		]
		cf-str: IOHIDDeviceGetProperty device prop
		buf/1: null-byte
		buf/2: null-byte
		buf/3: null-byte
		buf/4: null-byte
		either cf-str <> null [
			str_len: CFStringGetLength cf-str
			len: len - 1
			range/location: 0
			either str_len > len [
				range/length: len
			][
				range/length: str_len
			]
			chars_copied: CFStringGetBytes cf-str
											range
											kCFStringEncodingUTF32LE
											#"?"
											false
											as byte-ptr! buf
											len * WIDE_CHAR_SIZE
											:used_buf_len
			either chars_copied = len [
				len1: len * 4 + 1
				buf/len1: null-byte
				len1: len1 + 1
				buf/len1: null-byte
				len1: len1 + 1
				buf/len1: null-byte
				len1: len1 + 1
				buf/len1: null-byte
			][
				len1: chars_copied * 4 + 1
				buf/len1: null-byte
				len1: len1 + 1
				buf/len1: null-byte
				len1: len1 + 1
				buf/len1: null-byte
				len1: len1 + 1
				buf/len1: null-byte
			]
			return 0
		][
			return -1
		]
	]

	get_serial_number: func [
		device 		[int-ptr!]
		buf 		[c-string!]
		len 		[integer!]
		return: 	[integer!]
	][
		return get_string_property device (as c-string! HID_CFSTR(kIOHIDSerialNumberKey)) buf len
	]

	get_manufacturer_string: func [
		device 	 	[int-ptr!]
		buf 		[c-string!]
		len 		[integer!]
		return: 	[integer!]
	][
		return get_string_property device as c-string! HID_CFSTR(kIOHIDManufacturerKey) buf len
	]

	get_product_string: func [
		device 		[int-ptr!]
		buf 		[c-string!]
		len 		[integer!]
	][
		get_string_property device as c-string! HID_CFSTR(kIOHIDProductKey) buf len
	]

	;--implementation of wcsdup() for mac
	dup_wcs: func [
		s 			[c-string!]
		return: 	[c-string!]
		/local
			len		[integer!]
			ret  	[c-string!]
	][
		len: wcslen s
		ret: as c-string! allocate (len + 1) * WIDE_CHAR_SIZE
		wcscpy ret s
	]

	;--initialize the iohidmanager.return 0 for success and -1 for failure
	init_hid_manager: func [
		return: 	[integer!]
	][
		hid_mgr: IOHIDManagerCreate as int-ptr! kCFAllocatorDefault 0
		if hid_mgr <> null [
			IOHIDManagerSetDeviceMatching hid_mgr null
			IOHIDManagerScheduleWithRunLoop hid_mgr
											CFRunLoopGetCurrent
											as int-ptr! kCFRunLoopDefaultMode
			return 0
		]
		return -1
	]

	;--initialize the iohidmanager if necessary. this is the public function
	hid_init: func [
		return: 	[integer!]
	][
		if hid_mgr = null [
			return init_hid_manager
		]
		return 0
	]

	hid_exit: func [
		return: 	[integer!]
	][
		if hid_mgr <> null [
			IOHIDManagerClose hid_mgr 0
			CFRelease hid_mgr
			hid_mgr: null
		]
		0
	]

	process_pending_events: func [
		/local
			res  [integer!]
	][
		until [
			res: CFRunLoopRunInMode as int-ptr! kCFRunLoopDefaultMode 0.001 false
			any [res = 1  res = 3]
		]
	]


	;--hid_enumerate func
	enumerate: func [
		vendor-id	[integer!]
		product-id 	[integer!]
		return: 	[hid-device-info]
		/local
			root 			[hid-device-info]
			cur_dev 		[hid-device-info]
			num_devices		[integer!]
			i 				[integer!]
			device_set 		[int-ptr!]
			device_array	[int-ptr!]
			dev_vid			[integer!]
			dev_pid			[integer!]
			buf 			[c-string!]
			dev 			[int-ptr!]
			tmp 			[hid-device-info]
			iokit_dev 		[int-ptr!]
			res 			[integer!]  ;--kern_return_t is int
			path			[c-string!]
			x 				[integer!]
			y 				[integer!]
	][
		root: null
		cur_dev: null
		path: as c-string! system/stack/allocate 128
		buf: as c-string! system/stack/allocate 256
		;--set up the hid manager if it has not been done
		if hid_init < 0 [
			return null
		]
		;--give the iohidmanager a chance to updata itself
		process_pending_events

		;--get a list of the devices
		IOHIDManagerSetDeviceMatching hid_mgr null
		device_set: IOHIDManagerCopyDevices hid_mgr

		;--convert the list into a c array so we can iterate easily
		num_devices: CFSetGetCount device_set
		device_array: as int-ptr! allocate 4 * num_devices
		CFSetGetValues device_set device_array ;--typecasting (const void **)


		;--interate over each device, making an entry for it
		i: 1
		while [i < (num_devices + 1)] [
			dev: as int-ptr! device_array/i
			if dev = null [
				continue
			]
			dev_vid: get_vendor_id dev
			dev_pid: get_product_id dev

			;--check the vid/pid against the arguments

			if all [
				any [vendor-id = 0  vendor-id = dev_vid]
				any [product-id = 0  product-id = dev_pid]
			][
				;--vid/pid match create the record
				tmp: as hid-device-info allocate size? hid-device-info
				either cur_dev <> null [
					cur_dev/next: tmp
				][
					root: tmp
				]
				cur_dev: tmp

				;--get the usage page and usage for this device
				x: get_int_property dev as c-string! HID_CFSTR(kIOHIDPrimaryUsagePageKey)
				y: get_int_property dev as c-string! HID_CFSTR(kIOHIDPrimaryUsageKey)
				cur_dev/usage: x << 16 or y
				;--fill out the record
				cur_dev/next: null

				;--fill in the path (ioservice plane)
				iokit_dev: IOHIDDeviceGetService dev
				res: IORegistryEntryGetPath iokit_dev
											kIOServicePlane  ;--have not defined
											path
				cur_dev/path: either res = 0 [strdup path][strdup ""]

				;--serial number
				get_serial_number dev buf BUF_LEN
				cur_dev/serial-number: dup_wcs buf
				;--manufacturer and product strings
				get_manufacturer_string dev buf BUF_LEN
				cur_dev/manufacturer-string: dup_wcs buf
				get_product_string dev buf BUF_LEN
				cur_dev/product-string: dup_wcs buf

				;--vip/pid
				cur_dev/id: dev_vid << 16 or dev_pid
				;--release number
				cur_dev/release-number: get_int_property dev as c-string! HID_CFSTR(kIOHIDVersionNumberKey)
				;--interface number
				cur_dev/interface-number: -1
			]
			i: i + 1
		]

		free as byte-ptr! device_array
		CFRelease device_set

		return root
	]


	open: func [
		vendor-id 		[integer!]
		product-id		[integer!]
		serial-number 	[c-string!]
		type			[integer!]
		return: 		[int-ptr!]
		/local
			devs 			[hid-device-info]
			cur_dev 		[hid-device-info]
			path_to_open 	[c-string!]
			handle 			[hid-device]
			usage			[integer!]
	][
		if type and 1000h = 0 [						; 1000h: HID only
			handle: open-usb vendor-id product-id
			if handle <> null [return as int-ptr! handle]
		]

		path_to_open: null
		handle: null
		devs: enumerate 0 0
		cur_dev: devs
		while [cur_dev <> null] [
			usage: cur_dev/usage >>> 16
			if all [
				HIWORD(cur_dev/id) = vendor-id
				LOWORD(cur_dev/id) = product-id
				any [
					all [type and 1 <> 0 usage <> FF01h usage <> F1D0h]
					all [type and 2 <> 0 usage = F1D0h]		;-- fido integerface
					all [type and 4 <> 0 usage = FF01h]		;-- debug integerface
				]
			][
				either serial-number <> null [
					if 0 = wcscmp serial-number cur_dev/serial-number [
						path_to_open: cur_dev/path
						break
					]
				][
					path_to_open: cur_dev/path
					break
				]
			]
			cur_dev: cur_dev/next
		]
		if path_to_open <> null [
			handle: open_path path_to_open
		]
		hid-free-enumeration devs
		as int-ptr! handle
	]

	open_path: func [
		path		[c-string!]
		return: 	[hid-device]
		/local
			dev 	[hid-device]
			entry 	[int-ptr!]
			ret		[integer!]
			str 	[c-string!]
			b		[integer!]
			tmp 	[c-string!]
			tmp1 	[c-string!]
	][
		entry: null
		dev: new-hid-device
		str: as c-string! system/stack/allocate 8
		if hid_init < 0 [
			return null
		]
		entry: IORegistryEntryFromPath as int-ptr! kIOMasterPortDefault path
		if entry = null [
			;--path was not valid
			;--return_error
			if dev/device_handle <> null [
				CFRelease dev/device_handle
			]
			if entry <> null [
				IOObjectRelease entry
			]
			free-hid-device dev
			return null
			;--return_error
		]
		;--create and IOGIDDevice for entry
		dev/device_handle: IOHIDDeviceCreate as int-ptr! kCFAllocatorDefault entry
		if dev/device_handle = null [
			;--return_error
			if dev/device_handle <> null [
				CFRelease dev/device_handle
			]
			if entry <> null [
				IOObjectRelease entry
			]
			free-hid-device dev
			return null
			;--return_error
		]
		;--open the IOHIDDevice
		ret: IOHIDDeviceOpen dev/device_handle kIOHIDOptionsTypeSeizeDevice
		either ret = 0 	[ ;--return success
			;--create the buffers for receiving data
			dev/max_input_report_len: get_max_report_length dev/device_handle
			dev/input_report_buf:  as c-string! allocate dev/max_input_report_len
			set-memory as byte-ptr! dev/input_report_buf null-byte dev/max_input_report_len
			;--create the run loop mode for this device.
			;--printing the reference seems to work
			sprintf [str "HIDAPI_%p" dev/device_handle]
			dev/run_loop_mode: CFStringCreateWithCString 	0
															str
															kCFStringEncodingASCII
			;--attach the device to a run loop
			IOHIDDeviceRegisterInputReportCallback 	dev/device_handle
													as byte-ptr! dev/input_report_buf
													dev/max_input_report_len
													as int-ptr! :hid_report_callback
													as int-ptr! dev

			IOHIDDeviceRegisterRemovalCallback 	dev/device_handle
												as int-ptr! :hid_device_removal_callback
												as int-ptr! dev

			;--start the read thread
			b: pthread_create :dev/thread
										null
										as int-ptr! :read_thread
										as int-ptr! dev
			;--wait here for the read thread to be initialized
			pthread_barrier_wait as pthread_barrier_t :dev/barrier
			IOObjectRelease entry
			return dev
		][
			if dev/device_handle <> null [
				CFRelease dev/device_handle
			]
			if entry <> null [
				IOObjectRelease entry
			]
			free-hid-device dev
			return null
		]


	]

	hid_device_removal_callback: func [
		[cdecl]
		context 	[int-ptr!]
		result 		[integer!]
		sender 		[int-ptr!]
		/local
			d 		[hid-device]
	][
		d: as hid-device context
		d/disconnected: 1
		CFRunLoopStop d/run_loop
	]

	hid_report_callback: func [
		[cdecl]
		context 		[int-ptr!]
		result 			[integer!]
		sender 			[int-ptr!]
		report_type		[integer!]
		report_id 		[integer!]
		report 			[byte-ptr!]
		report_length 	[integer!]
		/local
			rpt 		[input_report]
			dev 		[hid-device]
			cur 		[input_report]
			num_queued	[integer!]
	][
		dev: as hid-device context
		;--make a new input report object
		rpt: as input_report allocate size? input_report
		rpt/data: allocate report_length
		memcpy rpt/data report report_length
		rpt/len: report_length
		rpt/next: null

		;--lock this section
		pthread_mutex_lock :dev/mutex
		;--attach the new report object to the end of the list
		either dev/input_reports = null [
			dev/input_reports: rpt
		][
			;--find the end of the list and attach
			cur: dev/input_reports
			num_queued: 0
			while [cur/next <> null] [
				cur: cur/next
				num_queued: num_queued + 1
			]
			cur/next: rpt

			if num_queued > 30 [
				return_data dev null 0
			]

		]
		pthread_cond_signal :dev/condition

		;--unclock
		pthread_mutex_unlock :dev/mutex

	]

	return_data: func [
		dev 		[hid-device]
		data 		[byte-ptr!]
		length		[integer!]
		return: 	[integer!]
		/local
			rpt		[input_report]
			len 	[integer!]
	][
		rpt: dev/input_reports
		len: either length < rpt/len [length][rpt/len]
		if zero? len [return 0]
		memcpy data rpt/data len
		dev/input_reports: rpt/next
		free rpt/data
		free as byte-ptr! rpt
		len
	]

	read_thread: func [
		[cdecl]
		param 		[int-ptr!]
		return: 	[int-ptr!]
		/local
			dev		[hid-device]
			code 	[integer!]
			ctx 	[CFRunLoopSourceContext value]
			a		[integer!]
	][
		code: 0
		dev: as hid-device param
		;--move the device's  run loop to this thread
		IOHIDDeviceScheduleWithRunLoop  dev/device_handle
										CFRunLoopGetCurrent
										dev/run_loop_mode
		;--create the runloopsource which is used to signal the event loop to\
		;--stop when hid_close is called
		set-memory as byte-ptr! ctx null-byte size? CFRunLoopSourceContext
		ctx/version: 0
		ctx/info: as int-ptr! dev
		ctx/perform: as int-ptr! :perform_signal_callback
		dev/source: CFRunLoopSourceCreate as int-ptr! kCFAllocatorDefault 0 as int-ptr! :ctx
		CFRunLoopAddSource  CFRunLoopGetCurrent dev/source dev/run_loop_mode

		;--stire off the run loop so it can be stopped from hid_close
		;--and on device disconnection
		dev/run_loop: CFRunLoopGetCurrent
		;--notify the main thread that the read thread is up and running
		a: pthread_barrier_wait as pthread_barrier_t :dev/barrier
		;--run the event loop so it can be stopped from hid_close
		;--and on device disconnection

		while [all [dev/shutdown_thread = 0 dev/disconnected = 0]] [
			code: CFRunLoopRunInMode dev/run_loop_mode 1000.0 false
			;--return if the device has been disconnected
			if code = 1 [
				dev/disconnected: 1
				break
			]
			;--break if the run loop returns finished or stopped
			if all [code <> 3  code <> 4] [
				dev/shutdown_thread: 1
				break
			]
		]
		pthread_mutex_lock :dev/mutex
		pthread_cond_broadcast :dev/condition
		pthread_mutex_unlock :dev/mutex
		pthread_barrier_wait as pthread_barrier_t  :dev/shutdown_barrier

		null
	]

	perform_signal_callback: func [
		[cdecl]
		context 	[int-ptr!]
		/local
			dev 	[hid-device]
	][
		dev: as hid-device context
		CFRunLoopStop dev/run_loop
	]

	write: func [
		device 		[int-ptr!]
		data 		[byte-ptr!]
		length 		[integer!]
		return: 	[integer!]
		/local
			dev 	[hid-device]
			this	[this!]
			ifc		[IOUSBInterfaceInterface]
			res		[integer!]
	][
		dev: as hid-device device
		either dev/raw-usb? [
			this: dev/pipe-ifc
			ifc: as IOUSBInterfaceInterface this/vtbl
			res: ifc/WritePipe this dev/write-id data length
			either zero? res [length][-1]
		][
			set_report dev kIOHIDReportTypeOutput data length
		]
	]

	set_report: func [
		dev 		[hid-device]
		type 		[integer!]
		data 		[byte-ptr!]
		length 		[integer!]
		return: 	[integer!]
		/local
			data_to_send 	[byte-ptr!]
			length_to_send 	[integer!]
			res 			[integer!]
	][
		if dev/disconnected <> 0 [
			return -1
		]

		either data/1 = null-byte [
			data_to_send: data + 1
			length_to_send: length - 1
		][
			data_to_send: data
			length_to_send: length
		]

		if dev/disconnected = 0 [
			res: IOHIDDeviceSetReport 	dev/device_handle
										type
										as integer! data/1
										data_to_send
										length_to_send

			either res = 0 [ ;--means success
				return length
			][
				return -1
			]
		]
		return -1
	]

	async-io-callback: func [
		[cdecl]
		refcon	[int-ptr!]
		result	[integer!]
		arg0	[integer!]
		/local
			dev [hid-device]
	][
		dev: as hid-device refcon
		dev/read-sz: arg0
		dev/input_reports: as input_report 1
		pthread_cond_signal :dev/condition
	]

	read: func [
		device 		[int-ptr!]
		data 		[byte-ptr!]
		length 		[integer!]
		return: 	[integer!]
		/local
			dev 	[hid-device]
			ms 		[integer!]
	][
		dev: as hid-device device
		ms: either dev/blocking <> 0 [-1][0]
		read-timeout device data length ms
	]

	read-timeout: func [
		device 			[int-ptr!]
		data 			[byte-ptr!]
		length			[integer!]
		milliseconds	[integer!]
		return: 		[integer!]
		/local
			dev 		[hid-device]
			bytes_read	[integer!]
			res 		[integer!]
			ts 			[timespec! value]
			tv 			[timeval! value]
			tm			[integer!]
			this		[this!]
			ifc			[IOUSBInterfaceInterface]
	][		
		dev: as hid-device device
		if dev/raw-usb? [
			this: dev/pipe-ifc
			ifc: as IOUSBInterfaceInterface this/vtbl
			ifc/ReadPipeAsync
				this
				dev/read-id
				data
				64
				as int-ptr! :async-io-callback
				device
		]

		bytes_read: -1
		pthread_mutex_lock :dev/mutex
		if dev/input_reports <> null [
			bytes_read: return_data dev data length
			;--unlock
			pthread_mutex_unlock :dev/mutex
			return bytes_read
			;--unlock section
		]
		if dev/disconnected <> 0 [
			bytes_read: -1
			;--unlock
			pthread_mutex_unlock :dev/mutex
			return bytes_read
			;--unlock section
		]
		if dev/shutdown_thread <> 0 [
			bytes_read: -1
			;--unlock
			pthread_mutex_unlock :dev/mutex
			return bytes_read
			;--unlock section
		]
		case [
			milliseconds = -1 [
				res: cond_wait dev :dev/condition :dev/mutex
				either res = 0 [
					bytes_read: return_data dev data length
				][
					bytes_read: -1
				]
			]
			milliseconds > 0 [
				tm: 0
				while [tm < milliseconds][
					gettimeofday  tv  0
					TIMEVAL_TO_TIMESPEC tv ts
					ts/nsec: ts/nsec + 100000000
					if ts/nsec >= 1000000000 [
						ts/sec: ts/sec + 1
						ts/nsec: ts/nsec - 1000000000
					]
					res: cond_timedwait dev :dev/condition :dev/mutex ts
					gui/do-events yes
					bytes_read: case [
						res = 0 [
							tm: milliseconds
							either dev/raw-usb? [
								dev/input_reports: null
								dev/read-sz
							][
								return_data dev data length
							]
						]
						res = ETIMEDOUT [0]
						true [-1]
					]
					tm: tm + 100
				]
			]
			true [bytes_read: 0]
		]
		;--unlock
		pthread_mutex_unlock :dev/mutex
		return bytes_read
		;--unlock section
	]

	cond_wait: func [
		dev 		[hid-device]
		cond 		[int-ptr!]
		mutex 		[int-ptr!]
		return: 	[integer!]
		/local
			res 	[integer!]
	][
		while [dev/input_reports = null] [
			res: pthread_cond_wait cond mutex
			if res <> 0 [return res ]
			if  any [dev/shutdown_thread <> 0 dev/disconnected <> 0][return -1]
		]
		0
	]

	cond_timedwait: func [
		dev 		[hid-device]
		cond 		[int-ptr!]
		mutex		[int-ptr!]
		abstime 	[timespec!]
		return: 	[integer!]
		/local
			res 	[integer!]
	][
		while [dev/input_reports = null] [
			res: pthread_cond_timedwait cond mutex abstime
			if res <> 0 [return res ]
			if any [dev/shutdown_thread <> 0 dev/disconnected <> 0][return -1]
		]
		0
	]

	close: func [
		device 	[int-ptr!]
		/local
			dev		[hid-device]
			this	[this!]
			pipe	[IOUSBInterfaceInterface]
			dev-ifc	[IOUSBDeviceInterface]
	][
		dev: as hid-device device

		if dev/raw-usb? [
			this: dev/pipe-ifc
			pipe: as IOUSBInterfaceInterface this/vtbl
			pipe/USBInterfaceClose this
			pipe/Release this

			this: dev/dev-ifc
			dev-ifc: as IOUSBDeviceInterface this/vtbl
			dev-ifc/USBDeviceClose this
			dev-ifc/Release this

			free_hid_device dev
			exit
		]

		;--disconnect the report callback before close
		if dev/disconnected = 0 [
			IOHIDDeviceRegisterInputReportCallback 	dev/device_handle
													as byte-ptr! dev/input_report_buf
													dev/max_input_report_len
													null
													as int-ptr! dev
			IOHIDDeviceRegisterRemovalCallback	dev/device_handle
												null
												as int-ptr! dev
			IOHIDDeviceUnscheduleFromRunLoop	dev/device_handle
												dev/run_loop
												dev/run_loop_mode
			IOHIDDeviceScheduleWithRunLoop		dev/device_handle
												CFRunLoopGetMain
												as int-ptr! kCFRunLoopDefaultMode
		]

		;--cause read_thread to stop
		dev/shutdown_thread: 1

		;--wake up the run thread's event loop so that the thread can exit
		CFRunLoopSourceSignal dev/source
		CFRunLoopWakeUp	dev/run_loop

		;--notify the read thread that it can shut down now
		pthread_barrier_wait  as pthread_barrier_t  :dev/shutdown_barrier

		;--wait for read_thread to end
		pthread_join dev/thread null

		;--close the os handle to the device, byt only if it's not been unplugged
		;--if it's been unplugged, then calling IOHIDDeviceClose will crash
		pthread_mutex_lock :dev/mutex
		while [dev/input_reports <> null] [
			return_data dev null 0
		]
		pthread_mutex_unlock :dev/mutex
		CFRelease dev/device_handle
		free_hid_device dev
	]

	free_hid_device: func [
		dev 	[hid-device]
		/local
			rpt		[input_report]
			next 	[input_report]
	][
		;--delete any input reports still left over
		unless dev/raw-usb? [
			rpt: dev/input_reports
			while [rpt <> null] [
				next: rpt/next
				free rpt/data
				free as byte-ptr! rpt
				rpt: next
			]

			;--free the string and report buffer. the check for null
			;--is necessary here as CFRelease doesn't handle null like
			;--free and others do
			if dev/run_loop_mode <> null [
				CFRelease dev/run_loop_mode
			]
			if dev/source <> null [
				CFRelease dev/source
			]
			free as byte-ptr! dev/input_report_buf
		]

		;--clean up the thread objects
		pthread_barrier_destroy as pthread_barrier_t :dev/shutdown_barrier
		pthread_barrier_destroy as pthread_barrier_t :dev/barrier
		pthread_cond_destroy :dev/condition
		pthread_mutex_destroy :dev/mutex

		;--free the structure itself
		free as byte-ptr! dev
	]

	kIOUSBDeviceUserClientTypeID: CFUUIDGetConstantUUIDWithBytes null
		#"^(9D)" #"^(C7)" #"^(B7)" #"^(80)" #"^(9E)" #"^(C0)" #"^(11)" #"^(D4)"
		#"^(A5)" #"^(4F)" #"^(00)" #"^(0A)" #"^(27)" #"^(05)" #"^(28)" #"^(61)"

	kIOCFPlugInInterfaceID: CFUUIDGetConstantUUIDWithBytes null
	    #"^(C2)" #"^(44)" #"^(E8)" #"^(58)" #"^(10)" #"^(9C)" #"^(11)" #"^(D4)"
		#"^(91)" #"^(D4)" #"^(00)" #"^(50)" #"^(E4)" #"^(C6)" #"^(42)" #"^(6F)"

	kIOUSBDeviceInterfaceID: CFUUIDGetConstantUUIDWithBytes null
		#"^(5C)" #"^(81)" #"^(87)" #"^(D0)" #"^(9E)" #"^(F3)" #"^(11)" #"^(D4)"
		#"^(8B)" #"^(45)" #"^(00)" #"^(0A)" #"^(27)" #"^(05)" #"^(28)" #"^(61)"

	kIOUSBInterfaceUserClientTypeID: CFUUIDGetConstantUUIDWithBytes null
		#"^(2D)" #"^(97)" #"^(86)" #"^(C6)" #"^(9E)" #"^(F3)" #"^(11)" #"^(D4)"
		#"^(AD)" #"^(51)" #"^(00)" #"^(0A)" #"^(27)" #"^(05)" #"^(28)" #"^(61)"

	kIOUSBInterfaceInterfaceID550: CFUUIDGetConstantUUIDWithBytes null
		#"^(6A)" #"^(E4)" #"^(4D)" #"^(3F)" #"^(EB)" #"^(45)" #"^(48)" #"^(7F)"
		#"^(8E)" #"^(8E)" #"^(B9)" #"^(3B)" #"^(99)" #"^(F8)" #"^(EA)" #"^(9E)"

	open-usb: func [
		vendor-id	[integer!]
		product-id 	[integer!]
		return: 	[hid-device]
		/local
			usb-dev			[hid-device]
			dev 			[int-ptr!]
			iter			[integer!]
			dict			[integer!]
			interface		[integer!]
			p-itf			[integer!]
			score			[integer!]
			vid				[integer!]
			pid				[integer!]
			this			[this!]
			itf				[IOUSBInterfaceInterface]
			dev-ifc			[IOUSBDeviceInterface]
			guid			[UUID! value]
			req				[IOUSBFindInterfaceRequest value]
			i				[integer!]
			dir				[integer!]
			num				[integer!]
			type			[integer!]
			size			[integer!]
			interval		[integer!]
			saved			[int-ptr!]
			buf				[byte-ptr!]
			kr				[integer!]
	][
		iter: 0
		dict: IOServiceMatching "IOUSBHostDevice"
		IOServiceGetMatchingServices kIOMasterPortDefault dict :iter

		while [
			dev: IOIteratorNext iter
			dev <> null
		][
			interface: 0
			p-itf: as-integer :interface
			score: 0
			kr: IOCreatePlugInInterfaceForService
					dev
					kIOUSBDeviceUserClientTypeID
					kIOCFPlugInInterfaceID
					:p-itf
					:score
			IOObjectRelease dev

			if any [kr <> 0 zero? p-itf][continue]

			this: as this! p-itf
			itf: as IOUSBInterfaceInterface this/vtbl
			guid: CFUUIDGetUUIDBytes kIOUSBDeviceInterfaceID
			itf/QueryInterface this guid :interface
			itf/Release this

			vid: 0 pid: 0
			this: as this! interface
			dev-ifc: as IOUSBDeviceInterface this/vtbl
			dev-ifc/GetDeviceVendor this :vid
			dev-ifc/GetDeviceProduct this :pid
			if all [vid = vendor-id pid = product-id][break]
		]
		IOObjectRelease as int-ptr! iter

		if null? dev [return null]

		usb-dev: new-hid-device
		usb-dev/raw-usb?: yes
		usb-dev/dev-ifc: this
		dev-ifc/USBDeviceOpen this
		dev-ifc/ResetDevice this

		req/class-subclass: FFFFFFFFh
		req/protocol-setting: FFFFFFFFh
		saved: system/stack/align
		push 0
		dev-ifc/CreateInterfaceIterator this :req :iter
		system/stack/top: saved
		while [
			dev: IOIteratorNext iter
			dev <> null
		][
			kr: IOCreatePlugInInterfaceForService
				dev
				kIOUSBInterfaceUserClientTypeID
				kIOCFPlugInInterfaceID
				:p-itf
				:score
			IOObjectRelease dev

			if any [kr <> 0 zero? p-itf][continue]

			this: as this! p-itf
			itf: as IOUSBInterfaceInterface this/vtbl
			guid: CFUUIDGetUUIDBytes kIOUSBInterfaceInterfaceID550
			itf/QueryInterface this guid :interface
			itf/Release this
			
			this: as this! interface
			itf: as IOUSBInterfaceInterface this/vtbl
			if 0 <> itf/USBInterfaceOpen this [continue]

			num: 0
			itf/GetNumEndpoints this :num

			dir: 0 type: 0 size: 0 interval: 0
			i: 1
			while [i <= num][
				saved: system/stack/align
				push 0
				itf/GetPipeProperties this i :dir :score :type :size :interval
				system/stack/top: saved
				if dir = 0 [usb-dev/write-id: i]
				if dir = 1 [usb-dev/read-id: i]

				itf/ClearPipeStall this i
				i: i + 1
			]
			break
		]

		saved: system/stack/align
		push 0 push 0
		itf/CreateInterfaceAsyncEventSource this :usb-dev/ifc-source
		system/stack/top: saved

		CFRunLoopAddSource
			CFRunLoopGetCurrent
			as int-ptr! usb-dev/ifc-source
			as int-ptr! kCFRunLoopDefaultMode

		IOObjectRelease as int-ptr! iter
		usb-dev/pipe-ifc: this
		usb-dev
	]
]
