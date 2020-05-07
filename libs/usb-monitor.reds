Red/System [
	Title:	"USB HID device monitor"
	Author: "Xie Qingtian"
	File: 	%usb-monitor.red
	Tabs: 	4
	Rights:  "Copyright (C) 2018 Red Foundation. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

#switch OS [
	Windows [
		DEV_BROADCAST_DEVICEINTERFACE: alias struct! [
			dbcc_size		[integer!]
			dbcc_devicetype	[integer!]
			dbcc_reserved	[integer!]
			guid_data1		[integer!]
			guid_data2		[integer!]
			guid_data3		[integer!]
			guid_data4		[integer!]
			dbcc_name		[integer!]
		]

		#import [
			"user32.dll" stdcall [
				RegisterDeviceNotification: "RegisterDeviceNotificationW" [
					hRecipient	[handle!]
					Filter		[int-ptr!]
					Flags		[integer!]
					return:		[handle!]
				]
				UnregisterDeviceNotification: "UnregisterDeviceNotification" [
					handle		[handle!]
					return:		[logic!]
				]
			]
			LIBC-file cdecl [
				wcstol: "wcstol" [
					str		[byte-ptr!]
					end		[byte-ptr!]
					base	[integer!]
					return: [integer!]
				]
				wcsstr: "wcsstr" [
					str		[byte-ptr!]
					search	[c-string!]
					return: [byte-ptr!]
				]
			]
		]

		USBDevWndProc: func [
			[stdcall]
			hWnd	[handle!]
			msg		[integer!]
			wParam	[integer!]
			lParam	[integer!]
			return: [integer!]
			/local
				filter	[DEV_BROADCAST_DEVICEINTERFACE value]
				info	[DEV_BROADCAST_DEVICEINTERFACE]
				len		[integer!]
				data	[red-block!]
				val		[red-value!]
				evt		[integer!]
				str		[byte-ptr!]
				p		[byte-ptr!]
				p2		[byte-ptr!]
		][
			switch msg [
				WM_CREATE [
					zero-memory as byte-ptr! :filter size? DEV_BROADCAST_DEVICEINTERFACE
					filter/dbcc_size: size? DEV_BROADCAST_DEVICEINTERFACE
					filter/dbcc_devicetype: 5		;-- DBT_DEVTYP_DEVICEINTERFACE
					filter/guid_data1: 4D1E55B2h
					filter/guid_data2: 11CFF16Fh
					filter/guid_data3: 1100CB88h
					filter/guid_data4: 30000011h
					SetWindowLong hWnd wc-offset - 8 as-integer RegisterDeviceNotification hWnd as int-ptr! :filter 0
					return 0
				]
				0219h [						;-- WM_DEVICECHANGE
					if any [
						wParam = 8000h		;-- DBT_DEVICEARRIVAL
						wParam = 8004h		;-- DBT_DEVICEREMOVECOMPLETE
					][
						info: as DEV_BROADCAST_DEVICEINTERFACE lParam
						str: as byte-ptr! :info/dbcc_name
						data: as red-block! (get-face-values hWnd) + FACE_OBJ_DATA
						if TYPE_OF(data) <> TYPE_BLOCK [
							block/make-at data 2
							loop 2 [none/make-in data]
						]
						val: block/rs-head data
						p: wcsstr str #u16 "VID_"
						p2: wcsstr p + 16 #u16 "PID_"
						integer/make-at val wcstol p + 8 p + 16 16
						integer/make-at val + 1 wcstol p2 + 8 p2 + 16 16
						current-msg/hWnd: hWnd
						evt: either wParam = 8000h [EVT_LEFT_UP][EVT_LEFT_DOWN]
						make-event current-msg 0 evt
					]
				]
				WM_DESTROY [
					UnregisterDeviceNotification as handle! GetWindowLong hWnd wc-offset - 8
					return 0
				]
				default [0]
			]
			DefWindowProc hWnd msg wParam lParam
		]

		init-monitor: func [/local wcex [WNDCLASSEX value]][
			wcex/cbSize: 		size? WNDCLASSEX
			wcex/style:			CS_HREDRAW or CS_VREDRAW or CS_DBLCLKS
			wcex/lpfnWndProc:	:USBDevWndProc
			wcex/cbClsExtra:	0
			wcex/cbWndExtra:	wc-extra						;-- reserve extra memory for face! slot
			wcex/hInstance:		hInstance
			wcex/hIcon:			null
			wcex/hCursor:		LoadCursor null IDC_ARROW
			wcex/hbrBackground:	0
			wcex/lpszMenuName:	null
			wcex/lpszClassName: #u16 "RedUSBDev"
			wcex/hIconSm:		0

			RegisterClassEx wcex

			register-class [
				#u16 "RedUSBDev"								;-- widget original name
				null											;-- new internal name
				symbol/make "usb-device"						;-- Red-level style name
				WS_EX_TOOLWINDOW								;-- exStyle flags
				WS_POPUP										;-- style flags
				0												;-- base ID for instances
				null											;-- style custom event handler
				null											;-- parent custom event handler
			]
		]
	]
	macOS [
		#import [
			"/System/Library/Frameworks/IOKit.framework/IOKit" cdecl [
				IOHIDDeviceGetProperty: "IOHIDDeviceGetProperty" [
					key 			[int-ptr!]
					device 			[c-string!] 
					return: 		[int-ptr!]
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
				IOHIDManagerRegisterDeviceMatchingCallback: "IOHIDManagerRegisterDeviceMatchingCallback" [
					manager			[int-ptr!]
					callback 		[int-ptr!]
					context 		[int-ptr!]
				]
				IOHIDManagerRegisterDeviceRemovalCallback: "IOHIDManagerRegisterDeviceRemovalCallback" [
					manager			[int-ptr!]
					callback 		[int-ptr!]
					context 		[int-ptr!]
				]
			]
		]

		get-int-property: func [
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
					CFNumberGetValue ref 3 :value
				]
			]
			value
		]

		get-vendor-id: func [
			device 			[int-ptr!]
			return: 		[integer!]
		][
			get-int-property device as c-string! CFString("VendorID")
		]

		get-product-id: func [
			device 			[int-ptr!]
			return: 		[integer!]
		][
			get-int-property device as c-string! CFString("ProductID")
		]

		hid-device-get-info: func [
			hwnd		[int-ptr!]
			dev			[int-ptr!]
			/local
				data	[red-block!]
				val		[red-value!]
		][
			data: (as red-block! get-face-values as-integer hwnd) + FACE_OBJ_DATA
			if TYPE_OF(data) <> TYPE_BLOCK [
				block/make-at data 2
				loop 2 [none/make-in data]
			]
			val: block/rs-head data
			integer/make-at val get-vendor-id dev
			integer/make-at val + 1 get-product-id dev
		]

		hid-device-add-callback: func [
			[cdecl]
			hwnd 		[int-ptr!]
			result 		[integer!]
			sender 		[int-ptr!]
			dev			[int-ptr!]
		][
			hid-device-get-info hwnd dev
			make-event as-integer hwnd 0 EVT_LEFT_UP
		]

		hid-device-removal-callback: func [
			[cdecl]
			hwnd 		[int-ptr!]
			result 		[integer!]
			sender 		[int-ptr!]
			dev			[int-ptr!]
		][
			hid-device-get-info hwnd dev
			make-event as-integer hwnd 0 EVT_LEFT_DOWN
		]

		red-hid-mgr: as int-ptr! 0

		monitor-usb-devs: func [
			hwnd	[int-ptr!]
			value	[red-value!]
			return: [logic!]
		][
			red-hid-mgr: IOHIDManagerCreate null 0
			if red-hid-mgr <> null [
				IOHIDManagerSetDeviceMatching red-hid-mgr null
				IOHIDManagerRegisterDeviceMatchingCallback
					red-hid-mgr
					as int-ptr! :hid-device-add-callback
					hwnd
				IOHIDManagerRegisterDeviceRemovalCallback
					red-hid-mgr
					as int-ptr! :hid-device-removal-callback
					hwnd
				IOHIDManagerScheduleWithRunLoop
					red-hid-mgr 
					CFRunLoopGetCurrent 
					as int-ptr! kCFRunLoopDefaultMode	
			]
			yes
		]

		init-monitor: func [][
			register-class [
				"usb-device"
				"RedUSBDev"
				"NSView"
				0
				no
				:monitor-usb-devs
			]
		]
	]
	#default [
		init-monitor: func [][]
	]
]

init-monitor