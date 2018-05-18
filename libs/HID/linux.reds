Red/System [
    Title:	"Hidapi"
	Author: "Huang Yongzhao"
	File: 	%linux.reds
	Needs:	View
	Tabs: 	4
	Rights:  "Copyright (C) 2018 Red Foundation. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

hid: context [
	;--symbolic names for the properties above
	#define DEVICE_STRING_MANUFACTURER  0
	#define DEVICE_STRING_PRODUCT       1
	#define DEVICE_STRING_SERIAL		2
	#define DEVICE_STRING_COUNT			3
	#define LOWORD(param) (param and FFFFh << 16 >> 16)   
	#define HIWORD(param) (param >> 16)

	;--usb hid device property names
	device_string_names: ["manufacturer" "product"	"serial"]
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
	pollfd: alias struct! [
		fd 			[integer!]
		events 		[integer!]  ;--events and revents
	]

	#import [
		LIBC-file cdecl [
			mbstowcs: "mbstowcs" [
				src 	[c-string!]
				dst 	[c-string!]
				len 	[integer!]
				return: [integer!]
			]
			wcsdup: "wcsdup" [
				s1 		[c-string!]
				return: [c-string!]
			]
			setlocale: "setlocale" [
				category 	[integer!]
				locale		[c-string!]
				return:		[byte-ptr!]
			]
			udev_new: "udev_new" [
				return: 	[int-ptr!]
			]
			udev_enumerate_new: "udev_enumerate_new" [
				udev		[int-ptr!]
				return: 	[int-ptr!]
			]
			udev_enumerate_add_match_subsystem: "udev_enumerate_add_match_subsystem" [
				udev_enumerate 	[int-ptr!]
				subsystem		[c-string!]
				return: 		[integer!]
			]
			udev_enumerate_scan_devices: "udev_enumerate_scan_devices" [
				udev_enumerate	[int-ptr!]
				return:			[integer!]
			]
			udev_enumerate_get_list_entry: "udev_enumerate_get_list_entry" [
				udev_enumerate 	[int-ptr!]
				return:			[int-ptr!]
			]
			udev_list_entry_get_next: "udev_list_entry_get_next" [
				list_entry		[int-ptr!]
				return: 		[int-ptr!]
			]
			udev_list_entry_get_name: "udev_list_entry_get_name" [
				list_entry		[int-ptr!]
				return:			[c-string!]
			]
			udev_device_new_from_syspath: "udev_device_new_from_syspath" [
				udev 			[int-ptr!]
				syspath 		[c-string!]
				return: 		[int-ptr!]
			]
			udev_device_get_devnode: "udev_device_get_devnode" [
				udev_device 	[int-ptr!]
				return: 		[c-string!]
			]
			udev_device_get_parent_with_subsystem_devtype: "udev_device_get_parent_with_subsystem_devtype" [
				udev_device 	[int-ptr!]
				subsystem 		[c-string!]
				devtype 		[c-string!]
				return: 		[int-ptr!]
			]
			udev_device_unref: "udev_device_unref" [
				udev_device 	[int-ptr!]
				return:			[int-ptr!]
			]
			strdup: "strdup" [
				src 		[c-string!]
				return: 	[c-string!]
			]
			strtok_r: "strtok_r" [
				s 			[c-string!]
				sep 		[c-string!]
				nextp 		[int-ptr!]
				return: 	[c-string!]
			]
			strchr: "strchr" [
				s 			[c-string!]
				n 			[integer!]
				return: 	[c-string!]
			]
			strcmp: "strcmp" [
				s1 			[c-string!]
				s2 			[c-string!]
				return: 	[integer!]
			]
			sscanf: "sscanf" [
				[variadic]
				return: 	[integer!]
			]
			strtol: "strtol" [
				str 		[c-string!]
				endptr 		[int-ptr!]
				base 		[integer!]
				return: 	[integer!]
			]
			udev_enumerate_unref: "udev_enumerate_unref" [
				udev_enumerate 	[int-ptr!]
				return:			[int-ptr!]
			]
			udev_unref: "udev_unref" [
				udev 			[int-ptr!]
				return: 		[int-ptr!]
			]
			wprintf: "wprintf" [
					[variadic]
					return: 	[integer!]
			]
			wcscmp: "wcscmp" [
				str1 		[c-string!]
				str2 		[c-string!]
				return: 	[integer!]
			]
			wcslen: "wcslen" [
				wcs   		[c-string!]
				return: 	[integer!]
			]
			linux-open: "open" [
				str 		[c-string!]
				int 		[integer!]
				return: 	[integer!]
			]
			ioctl: "ioctl" [
				s1 			[integer!]
				s2 			[integer!]
				s3 			[int-ptr!]
				return: 	[integer!]
			]
			perror: "perror" [
				s 			[c-string!]
			]
			linux-write: "write" [
				fd 			[integer!]
				buf 		[c-string!]
				count 		[integer!]
				return: 	[integer!]
			]
			poll: "poll" [
				fds 		[pollfd]
				nfds 		[integer!]
				timeout 	[integer!]
				return: 	[integer!]
			]
			linux-read: "read" [
				fd 			[integer!]
				buf 		[c-string!]
				nbytes 		[integer!]
				return:		[integer!]
			]
			get-errno-ptr: "__errno_location" [
					return: [int-ptr!]
				]
			linux-close: "close" [
				handle 		[int-ptr!]
			]
		]
		"libudev.so.1" cdecl[
			udev_device_get_sysattr_value: "udev_device_get_sysattr_value" [
				dev 	[int-ptr!]
				sysattr [c-string!]
				return: [c-string!]
			]
		]
	]


	hid_device: alias struct! [
		device_handle 			[integer!]
		blocking 				[integer!]
		uses_numbered_reports	[integer!]
	]

	new_hid_device: func [
		return: 	[hid_device]
		/local
			dev 		[hid_device]
	][
		dev: as hid_device allocate size? hid_device
		dev/device_handle: -1
		dev/blocking: 1
		dev/uses_numbered_reports: 0
		dev 
	]

	utf8_to_wchar_t: func [
		utf8 		[c-string!]
		return: 	[c-string!]
		/local
			ret 	[c-string!]
			wlen 	[integer!]
			a 		[integer!]
	][
		ret: null

		if utf8 <> null [
			wlen: mbstowcs null utf8 0 
			if -1 = wlen [
				return wcsdup ""
			]
			ret: as c-string! allocate (wlen + 1) * 4   ;--sizeof widechar
			set-memory as byte-ptr! ret null-byte (wlen + 1) * 4
			mbstowcs ret utf8 (wlen + 1) 
			a: 4 * wlen + 1
			ret/a: null-byte
			a: a + 1
			ret/a: null-byte
			a: a + 1
			ret/a: null-byte
			a: a + 1
			ret/a: null-byte
		]
		ret 
	]

	;--get an atrribute value from a udev_device and return it as wchar_t
	;--string the returned string must be freed with free（） when done
	copy_udev_string: func [
		dev 		[int-ptr!] ;--udev_device
		udev_name 	[c-string!] 
		return: 	[c-string!]
	][
		utf8_to_wchar_t (udev_device_get_sysattr_value dev udev_name)	
	]

	;--uses_numered_reports return 1 if report_descriptor describes a device 
	;--which contains numbered reports
	uses_numbered_reports: func [
		report_descriptor 	[byte-ptr!]
		size				[integer!]
		return: 			[integer!]
		/local
			i 				[integer!]
			size_code 		[integer!]
			data_len 		[integer!]
			key_size		[integer!]
			key 			[integer!]
			a 				[integer!]
	][
		i: 0
		while [i < size] [
			a: i + 1
			key: as integer! report_descriptor/a
			;--check for the report id key
			if key = 00000085h [return 1]
			
			either (key and 000000F0h) = 000000F0h [
				either (i + 1) < size [
					a: i + 2
					data_len: as integer! report_descriptor/a 
				][
					data_len: 0
				]
				key_size: 3
			][
				size_code: key and 00000003h
				switch size_code [
					0 		[data_len: size_code]
					1 		[data_len: size_code]
					2 		[data_len: size_code]
					3 		[data_len: 4]
					default [data_len: 0]
				]
				key_size: 1
			]
			i: i + data_len + key_size	
		]
		0	
	]

	hid_init: func [
		return: 	[integer!]
		/local
			locale	[byte-ptr!]
	][
		;--set the locale if it's not set
		locale: setlocale 0 null
		if locale = null [setlocale 0 ""]
		0
	]

	parse_uevent_info: func [
		uevent 				[c-string!]
		bus_type			[int-ptr!]
		vendor_id			[int-ptr!]
		product_id			[int-ptr!]
		serial_number_utf8	[int-ptr!]
		product_name_utf8	[int-ptr!]
		return: 			[integer!]
		/local
			tmp				[c-string!]
			saveptr			[integer!]
			line 			[c-string!]
			key 			[c-string!]
			value			[c-string!]
			found_id 		[integer!]
			found_serial	[integer!]
			found_name 		[integer!]
			ret 			[integer!]
			skip? 			[logic!]
	][
		found_id: 0 
		found_serial: 0
		found_name: 0 
		saveptr: 0
		tmp: strdup uevent
		line: strtok_r tmp "^(0A)" :saveptr
		while [line <> null] [
			;--line: "key=value"
			skip?: no 
			key: line
			value: strchr line as integer! #"=" 
			if value = null [
				;--goto next_line 
				skip?: yes 
			]
			unless skip? [
				value/1: null-byte
				value: value + 1
				case [
					(strcmp key "HID_ID") = 0 [
						ret: sscanf [value "%x:%hx:%hx" bus_type vendor_id product_id]
						if ret = 3 [
							found_id: 1
						]	
					]
					(strcmp key "HID_NAME") = 0 [
						product_name_utf8/value: as integer! strdup value
						found_name: 1
					]
					(strcmp key "HID_UNIQ") = 0 [
						serial_number_utf8/value: as integer! strdup value
						found_serial: 1
					]
					true []
				]
			]
			line: strtok_r null "^(0A)" :saveptr
		]
		free as byte-ptr! tmp 
		as integer! (all [found_id <> 0 found_name <> 0 found_serial <> 0])
		
	]

	enumerate: func [
		ids 			[red-block!]
		return: 		[hid-device-info]
		/local 	
			udev 					[int-ptr!]
			enumerate 				[int-ptr!]
			devices 				[int-ptr!]
			dev_list_entry			[int-ptr!]
			cur_dev 				[hid-device-info]
			prev_dev				[hid-device-info]
			sysfs_path				[c-string!]
			dev_path				[c-string!]
			str						[c-string!]
			raw_dev					[int-ptr!]
			hid_dev 				[int-ptr!]
			usb_dev 				[int-ptr!]
			intf_dev 				[int-ptr!]
			dev_vid					[integer!]
			dev_pid 				[integer!]
			id						[integer!]
			serial_number_utf8		[c-string!]
			product_name_utf8		[c-string!]
			bus_type				[integer!]
			result					[integer!]
			tmp 					[hid-device-info]
			product_name_utf8_fake 	[integer!]
			serial_number_utf8_fake	[integer!]
			skip? 					[logic!]
			skip1?					[logic!]
	][
		root: null
		cur_dev: null
		prev_dev: null
		hid_init

		;--create the udev object
		udev: udev_new 
		if udev = null [
			probe "can not create udev"
			return null
		]
		;--create a list of the device in the 'hidraw' subsystem
		enumerate: udev_enumerate_new udev
		udev_enumerate_add_match_subsystem enumerate "hidraw"
		udev_enumerate_scan_devices enumerate
		devices: udev_enumerate_get_list_entry enumerate	
		;--fir each item, see if it matchs the vid/pid and 
		;--if so create a udev_device record for it
		dev_list_entry: devices 
		while [dev_list_entry <> null] [
			;--get the filename of the /sys entry for the device 
			;--and create a udev_device object(dev) representing it
			skip?: no
			serial_number_utf8: null
			product_name_utf8: null
			bus_type: 0
			dev_vid: 0
			dev_pid: 0
			serial_number_utf8_fake: 0
			product_name_utf8_fake: 0
			sysfs_path: udev_list_entry_get_name dev_list_entry
			raw_dev: udev_device_new_from_syspath udev sysfs_path
			dev_path: udev_device_get_devnode raw_dev

			hid_dev: 	udev_device_get_parent_with_subsystem_devtype 	
						raw_dev
						"hid"
						null
			if hid_dev = null [
				;--unable to find parent hid device 
				skip?: yes 
			]
			unless skip? [
				result: parse_uevent_info 	
						(udev_device_get_sysattr_value hid_dev "uevent")
						:bus_type
						:dev_vid
						:dev_pid
						:serial_number_utf8_fake
						:product_name_utf8_fake 
				serial_number_utf8: as c-string! serial_number_utf8_fake
				product_name_utf8: as c-string! product_name_utf8_fake 
				if result = 0 [
					;--go to next 
					free as byte-ptr! serial_number_utf8
					free as byte-ptr! product_name_utf8
					udev_device_unref raw_dev 
					;--go to next
				]
				if all [bus_type <> 3 bus_type <> 5] [
					;--go to next 
					free as byte-ptr! serial_number_utf8
					free as byte-ptr! product_name_utf8
					udev_device_unref raw_dev 
					;--go to next
				]
				id: dev_pid << 16 or dev_vid
				if id-filter? id ids [
					tmp: as hid-device-info allocate size? hid-device-info
					either cur_dev <> null [
						cur_dev/next: tmp
					][
						root: tmp
					]
					prev_dev: cur_dev
					cur_dev: tmp

					;--fill out the record 
					cur_dev/next: null
					cur_dev/path: either dev_path <> null [strdup dev_path][null]

					;--vid/pid
					cur_dev/id: id

					;--serial number
					cur_dev/serial-number: utf8_to_wchar_t serial_number_utf8

					;--release number
					cur_dev/release-number: 0

					;--interface number
					cur_dev/interface-number: -1
					skip1?: no 
					switch bus_type [
						3 [
							usb_dev: 	udev_device_get_parent_with_subsystem_devtype 	
										raw_dev
										"usb"
										"usb_device"
							if usb_dev = null [
								free as byte-ptr! cur_dev/serial-number
								free as byte-ptr! cur_dev/path
								free as byte-ptr! cur_dev

								either prev_dev <> null [
									prev_dev/next: null
									cur_dev: prev_dev
								][
									root: null
									cur_dev: root
								]
									skip1?: yes 
							]
							unless skip1?[
								;--manufacturer and product strings 
								cur_dev/manufacturer-string: 	copy_udev_string 	
																usb_dev
																as c-string! device_string_names/1

								cur_dev/product-string: copy_udev_string 	
														usb_dev 
														as c-string! device_string_names/2				 
								;--release number
								str: udev_device_get_sysattr_value usb_dev "bcdDevice"
								cur_dev/release-number: either str <> null [strtol str null 16][0]

								;--get a handle to the interface's udev node
								intf_dev: 	udev_device_get_parent_with_subsystem_devtype	
											raw_dev
											"usb"
											"usb_interface"
								if intf_dev <> null [
									str: udev_device_get_sysattr_value intf_dev "bInterfaceNumber"
									cur_dev/interface-number: either str <> null [strtol str null 16][-1]
								]
							]							
						]
						5 [
							cur_dev/manufacturer-string: wcsdup ""
							cur_dev/product-string: utf8_to_wchar_t product_name_utf8
					
						]
						default []
					]
				]
			]
			;--go to next 
			free as byte-ptr! serial_number_utf8
			free as byte-ptr! product_name_utf8
			udev_device_unref raw_dev 
			;--go to next		
			dev_list_entry: udev_list_entry_get_next dev_list_entry
		]
		udev_enumerate_unref enumerate
		udev_unref udev 
		root 
	]

	#include %common.reds

	open-path: func [
		path			[c-string!]
		return: 		[hid_device]
		/local
			dev 		[hid_device]
			res			[integer!]
			desc_size	[integer!]
			rpt_desc	[int-ptr!]
	][
		dev: null
		hid_init
		dev: new_hid_device
		res: 0 
		desc_size: 0
		;--open here
		dev/device_handle: linux-open path 2
		rpt_desc: system/stack/allocate 1025
		set-memory as byte-ptr! rpt_desc null-byte 4100
		;--if we have a good handle ,return it 
		either dev/device_handle > 0 [
			;--get the report descriptor
			set-memory as byte-ptr! rpt_desc null-byte 4100

			;--get report descriptor size 
			res: ioctl dev/device_handle -2147203071 :desc_size  
			if res < 0 [
				perror "HIDIOCGRDESCSIZE"
			]
			rpt_desc/1: desc_size
			res: ioctl dev/device_handle -1878767614 rpt_desc
			either res < 0 [
				perror "HIDIOCGRDESC"
			][
				dev/uses_numbered_reports: 	uses_numbered_reports 	
											as byte-ptr! (rpt_desc + 1)
											rpt_desc/1
			]
			return dev 
		][
			free as byte-ptr! dev 
			return null
		]
	]

	write: func [
		device 		[int-ptr!]
		data 		[byte-ptr!]
		length 		[integer!]
		return: 	[integer!]
		/local
			dev 			[hid_device]
			bytes_written	[integer!]
	][
		dev: as hid_device device
		bytes_written: linux-write dev/device_handle as c-string! data length
		bytes_written
	]

	read_timeout: func [
		device 			[int-ptr!]
		data 			[byte-ptr!]
		length 			[integer!]
		milliseconds	[integer!]
		return: 		[integer!]
		/local
			dev 		[hid_device]
			bytes_read	[integer!]
			ret 		[integer!]
			fds 		[pollfd value]
			errno 		[integer!]
	][
		dev: as hid_device device
		if milliseconds >= 0 [
			fds/fd: dev/device_handle
			fds/events: 1 
			ret: poll fds 1 milliseconds
			either any [ret = -1 ret = 0] [
				return ret 
			][
				if (LOWORD(fds/events) and (8 or 16 or 32)) <> 0 [
					return -1
				]
			]
		]
		bytes_read: linux-read dev/device_handle as c-string! data length
		errno: as integer! get-errno-ptr
		if all [
			bytes_read < 0
			any [errno = 11 errno = 115]
		][	
			bytes_read: 0
			]
		bytes_read
	]

	read: func [
		device 			[int-ptr!]
		data 			[byte-ptr!]
		length 			[integer!]	
		return: 		[integer!]
		/local
			dev 		[hid_device]
			block? 		[integer!]
	][	
		 dev: as hid_device device
		 block?: either dev/blocking <> 0 [-1][0]
?? block?
		 return read_timeout device data length block?
	]

	; set_nonblocking: func [
	; 	device		[int-ptr!]
	; 	nonblock 	[integer!]
	; 	return: 	[integer!]
	; 	/local
	; 		dev 	[hid_device]
	; ][
	; 	dev: as hid_device device
	; 	dev/blocking: either nonblock = 0 [1][0]
	; 	0
	; ]

	close: func [
		device 		[int-ptr!]
		/local
			dev 	[hid_device]
	][
		dev: as hid_device device
		either dev = null [
			probe "dev is null"
		][
			linux-close as int-ptr! dev/device_handle
			free as byte-ptr! dev 
		]
	]

]








