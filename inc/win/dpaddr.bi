#pragma once

#include once "ole2.bi"
#include once "dplay8.bi"

#ifdef __FB_64BIT__
	extern "C"
#else
	extern "Windows"
#endif

type IDirectPlay8AddressVtbl as IDirectPlay8AddressVtbl_
type IDirectPlay8AddressIPVtbl as IDirectPlay8AddressIPVtbl_

#define __WINE_DPLAY8_DPADDR_H

type DPNAREFIID as const IID const ptr

#define DPNA_DATATYPE_STRING &h00000001
#define DPNA_DATATYPE_DWORD &h00000002
#define DPNA_DATATYPE_GUID &h00000003
#define DPNA_DATATYPE_BINARY &h00000004
#define DPNA_DATATYPE_STRING_ANSI &h00000005
#define DPNA_DPNSVR_PORT 6073
#define DPNA_INDEX_INVALID &hFFFFFFFF
#define DPNA_SEPARATOR_KEYVALUE asc(wstr("="))
#define DPNA_SEPARATOR_KEYVALUE_A asc("=")
#define DPNA_SEPARATOR_USERDATA asc(wstr("#"))
#define DPNA_SEPARATOR_USERDATA_A asc("#")
#define DPNA_SEPARATOR_COMPONENT asc(wstr(";"))
#define DPNA_SEPARATOR_COMPONENT_A asc(";")
#define DPNA_ESCAPECHAR asc(wstr("%"))
#define DPNA_ESCAPECHAR_A asc("%")
#define DPNA_HEADER_A "x-directplay:/"
#define DPNA_KEY_APPLICATION_INSTANCE_A "applicationinstance"
#define DPNA_KEY_BAUD_A "baud"
#define DPNA_KEY_DEVICE_A "device"
#define DPNA_KEY_FLOWCONTROL_A "flowcontrol"
#define DPNA_KEY_HOSTNAME_A "hostname"
#define DPNA_KEY_NAMEINFO_A "nameinfo"
#define DPNA_KEY_PARITY_A "parity"
#define DPNA_KEY_PHONENUMBER_A "phonenumber"
#define DPNA_KEY_PORT_A "port"
#define DPNA_KEY_PROCESSOR_A "processor"
#define DPNA_KEY_PROGRAM_A "program"
#define DPNA_KEY_PROVIDER_A "provider"
#define DPNA_KEY_SCOPE_A "scope"
#define DPNA_KEY_STOPBITS_A "stopbits"
#define DPNA_KEY_TRAVERSALMODE_A "traversalmode"
#define DPNA_STOP_BITS_ONE_A "1"
#define DPNA_STOP_BITS_ONE_FIVE_A "1.5"
#define DPNA_STOP_BITS_TWO_A "2"
#define DPNA_PARITY_NONE_A "NONE"
#define DPNA_PARITY_EVEN_A "EVEN"
#define DPNA_PARITY_ODD_A "ODD"
#define DPNA_PARITY_MARK_A "MARK"
#define DPNA_PARITY_SPACE_A "SPACE"
#define DPNA_FLOW_CONTROL_NONE_A "NONE"
#define DPNA_FLOW_CONTROL_XONXOFF_A "XONXOFF"
#define DPNA_FLOW_CONTROL_RTS_A "RTS"
#define DPNA_FLOW_CONTROL_DTR_A "DTR"
#define DPNA_FLOW_CONTROL_RTSDTR_A "RTSDTR"
#define DPNA_VALUE_TCPIPPROVIDER_A "IP"
#define DPNA_VALUE_IPXPROVIDER_A "IPX"
#define DPNA_VALUE_MODEMPROVIDER_A "MODEM"
#define DPNA_VALUE_SERIALPROVIDER_A "SERIAL"

'' TODO: # define DPNA_HEADER (const WCHAR []){ 'x','-','d','i','r','e','c','t','p','l','a','y',':','/',0 }
'' TODO: # define DPNA_KEY_APPLICATION_INSTANCE (const WCHAR []){ 'a','p','p','l','i','c','a','t','i','o','n','i','n','s','t','a','n','c','e',0 }
'' TODO: # define DPNA_KEY_BAUD (const WCHAR []){ 'b','a','u','d',0 }
'' TODO: # define DPNA_KEY_DEVICE (const WCHAR []){ 'd','e','v','i','c','e',0 }
'' TODO: # define DPNA_KEY_FLOWCONTROL (const WCHAR []){ 'f','l','o','w','c','o','n','t','r','o','l',0 }
'' TODO: # define DPNA_KEY_HOSTNAME (const WCHAR []){ 'h','o','s','t','n','a','m','e',0 }
'' TODO: # define DPNA_KEY_NAMEINFO (const WCHAR []){ 'n','a','m','e','i','n','f','o',0 }
'' TODO: # define DPNA_KEY_PARITY (const WCHAR []){ 'p','a','r','i','t','y',0 }
'' TODO: # define DPNA_KEY_PHONENUMBER (const WCHAR []){ 'p','h','o','n','e','n','u','m','b','e','r',0 }
'' TODO: # define DPNA_KEY_PORT (const WCHAR []){ 'p','o','r','t',0 }
'' TODO: # define DPNA_KEY_PROCESSOR (const WCHAR []){ 'p','r','o','c','e','s','s','o','r',0 }
'' TODO: # define DPNA_KEY_PROGRAM (const WCHAR []){ 'p','r','o','g','r','a','m',0 }
'' TODO: # define DPNA_KEY_PROVIDER (const WCHAR []){ 'p','r','o','v','i','d','e','r',0 }
'' TODO: # define DPNA_KEY_SCOPE (const WCHAR []){ 's','c','o','p','e',0 }
'' TODO: # define DPNA_KEY_STOPBITS (const WCHAR []){ 's','t','o','p','b','i','t','s',0 }
'' TODO: # define DPNA_KEY_TRAVERSALMODE (const WCHAR []){ 't','r','a','v','e','r','s','a','l','m','o','d','e',0 }
'' TODO: # define DPNA_STOP_BITS_ONE (const WCHAR []){ '1',0 }
'' TODO: # define DPNA_STOP_BITS_ONE_FIVE (const WCHAR []){ '1','.','5',0 }
'' TODO: # define DPNA_STOP_BITS_TWO (const WCHAR []){ '2',0 }
'' TODO: # define DPNA_PARITY_NONE (const WCHAR []){ 'N','O','N','E',0 }
'' TODO: # define DPNA_PARITY_EVEN (const WCHAR []){ 'E','V','E','N',0 }
'' TODO: # define DPNA_PARITY_ODD (const WCHAR []){ 'O','D','D',0 }
'' TODO: # define DPNA_PARITY_MARK (const WCHAR []){ 'M','A','R','K',0 }
'' TODO: # define DPNA_PARITY_SPACE (const WCHAR []){ 'S','P','A','C','E',0 }
'' TODO: # define DPNA_FLOW_CONTROL_NONE (const WCHAR []){ 'N','O','N','E',0 }
'' TODO: # define DPNA_FLOW_CONTROL_XONXOFF (const WCHAR []){ 'X','O','N','X','O','F','F',0 }
'' TODO: # define DPNA_FLOW_CONTROL_RTS (const WCHAR []){ 'R','T','S',0 }
'' TODO: # define DPNA_FLOW_CONTROL_DTR (const WCHAR []){ 'D','T','R',0 }
'' TODO: # define DPNA_FLOW_CONTROL_RTSDTR (const WCHAR []){ 'R','T','S','D','T','R',0 }
'' TODO: # define DPNA_VALUE_TCPIPPROVIDER (const WCHAR []){ 'I','P',0 }
'' TODO: # define DPNA_VALUE_IPXPROVIDER (const WCHAR []){ 'I','P','X',0 }
'' TODO: # define DPNA_VALUE_MODEMPROVIDER (const WCHAR []){ 'M','O','D','E','M',0 }
'' TODO: # define DPNA_VALUE_SERIALPROVIDER (const WCHAR []){ 'S','E','R','I','A','L',0 }

#define DPNA_BAUD_RATE_9600 9600
#define DPNA_BAUD_RATE_14400 14400
#define DPNA_BAUD_RATE_19200 19200
#define DPNA_BAUD_RATE_38400 38400
#define DPNA_BAUD_RATE_56000 56000
#define DPNA_BAUD_RATE_57600 57600
#define DPNA_BAUD_RATE_115200 115200

extern CLSID_DirectPlay8Address as const GUID
extern IID_IDirectPlay8Address as const GUID

type PDIRECTPLAY8ADDRESS as IDirectPlay8Address ptr
type LPDIRECTPLAY8ADDRESS as IDirectPlay8Address ptr

extern IID_IDirectPlay8AddressIP as const GUID

type PDIRECTPLAY8ADDRESSIP as IDirectPlay8AddressIP ptr
type LPDIRECTPLAY8ADDRESSIP as IDirectPlay8AddressIP ptr

type IDirectPlay8Address
	lpVtbl as IDirectPlay8AddressVtbl ptr
end type

type IDirectPlay8AddressVtbl_
	QueryInterface as function(byval This as IDirectPlay8Address ptr, byval riid as const IID const ptr, byval ppvObject as any ptr ptr) as HRESULT
	AddRef as function(byval This as IDirectPlay8Address ptr) as ULONG_
	Release as function(byval This as IDirectPlay8Address ptr) as ULONG_
	BuildFromURLW as function(byval This as IDirectPlay8Address ptr, byval pwszSourceURL as WCHAR ptr) as HRESULT
	BuildFromURLA as function(byval This as IDirectPlay8Address ptr, byval pszSourceURL as CHAR ptr) as HRESULT
	Duplicate as function(byval This as IDirectPlay8Address ptr, byval ppdpaNewAddress as PDIRECTPLAY8ADDRESS ptr) as HRESULT
	SetEqual as function(byval This as IDirectPlay8Address ptr, byval pdpaAddress as PDIRECTPLAY8ADDRESS) as HRESULT
	IsEqual as function(byval This as IDirectPlay8Address ptr, byval pdpaAddress as PDIRECTPLAY8ADDRESS) as HRESULT
	Clear as function(byval This as IDirectPlay8Address ptr) as HRESULT
	GetURLW as function(byval This as IDirectPlay8Address ptr, byval pwszURL as WCHAR ptr, byval pdwNumChars as PDWORD) as HRESULT
	GetURLA as function(byval This as IDirectPlay8Address ptr, byval pszURL as CHAR ptr, byval pdwNumChars as PDWORD) as HRESULT
	GetSP as function(byval This as IDirectPlay8Address ptr, byval pguidSP as GUID ptr) as HRESULT
	GetUserData as function(byval This as IDirectPlay8Address ptr, byval pvUserData as LPVOID, byval pdwBufferSize as PDWORD) as HRESULT
	SetSP as function(byval This as IDirectPlay8Address ptr, byval pguidSP as const GUID const ptr) as HRESULT
	SetUserData as function(byval This as IDirectPlay8Address ptr, byval pvUserData as const any const ptr, byval dwDataSize as const DWORD) as HRESULT
	GetNumComponents as function(byval This as IDirectPlay8Address ptr, byval pdwNumComponents as PDWORD) as HRESULT
	GetComponentByName as function(byval This as IDirectPlay8Address ptr, byval pwszName as const WCHAR const ptr, byval pvBuffer as LPVOID, byval pdwBufferSize as PDWORD, byval pdwDataType as PDWORD) as HRESULT
	GetComponentByIndex as function(byval This as IDirectPlay8Address ptr, byval dwComponentID as const DWORD, byval pwszName as WCHAR ptr, byval pdwNameLen as PDWORD, byval pvBuffer as any ptr, byval pdwBufferSize as PDWORD, byval pdwDataType as PDWORD) as HRESULT
	AddComponent as function(byval This as IDirectPlay8Address ptr, byval pwszName as const WCHAR const ptr, byval lpvData as const any const ptr, byval dwDataSize as const DWORD, byval dwDataType as const DWORD) as HRESULT
	GetDevice as function(byval This as IDirectPlay8Address ptr, byval pDevGuid as GUID ptr) as HRESULT
	SetDevice as function(byval This as IDirectPlay8Address ptr, byval devGuid as const GUID const ptr) as HRESULT
	BuildFromDirectPlay4Address as function(byval This as IDirectPlay8Address ptr, byval pvAddress as LPVOID, byval dwDataSize as DWORD) as HRESULT
end type

#define IDirectPlay8Address_QueryInterface(p, a, b) (p)->lpVtbl->QueryInterface(p, a, b)
#define IDirectPlay8Address_AddRef(p) (p)->lpVtbl->AddRef(p)
#define IDirectPlay8Address_Release(p) (p)->lpVtbl->Release(p)
#define IDirectPlay8Address_BuildFromURLW(p, a) (p)->lpVtbl->BuildFromURLW(p, a)
#define IDirectPlay8Address_BuildFromURLA(p, a) (p)->lpVtbl->BuildFromURLA(p, a)
#define IDirectPlay8Address_Duplicate(p, a) (p)->lpVtbl->Duplicate(p, a)
#define IDirectPlay8Address_SetEqual(p, a) (p)->lpVtbl->SetEqual(p, a)
#define IDirectPlay8Address_IsEqual(p, a) (p)->lpVtbl->IsEqual(p, a)
#define IDirectPlay8Address_Clear(p) (p)->lpVtbl->Clear(p)
#define IDirectPlay8Address_GetURLW(p, a, b) (p)->lpVtbl->GetURLW(p, a, b)
#define IDirectPlay8Address_GetURLA(p, a, b) (p)->lpVtbl->GetURLA(p, a, b)
#define IDirectPlay8Address_GetSP(p, a) (p)->lpVtbl->GetSP(p, a)
#define IDirectPlay8Address_GetUserData(p, a, b) (p)->lpVtbl->GetUserData(p, a, b)
#define IDirectPlay8Address_SetSP(p, a) (p)->lpVtbl->SetSP(p, a)
#define IDirectPlay8Address_SetUserData(p, a, b) (p)->lpVtbl->SetUserData(p, a, b)
#define IDirectPlay8Address_GetNumComponents(p, a) (p)->lpVtbl->GetNumComponents(p, a)
#define IDirectPlay8Address_GetComponentByName(p, a, b, c, d) (p)->lpVtbl->GetComponentByName(p, a, b, c, d)
#define IDirectPlay8Address_GetComponentByIndex(p, a, b, c, d, e, f) (p)->lpVtbl->GetComponentByIndex(p, a, b, c, d, e, f)
#define IDirectPlay8Address_AddComponent(p, a, b, c, d) (p)->lpVtbl->AddComponent(p, a, b, c, d)
#define IDirectPlay8Address_SetDevice(p, a) (p)->lpVtbl->SetDevice(p, a)
#define IDirectPlay8Address_GetDevice(p, a) (p)->lpVtbl->GetDevice(p, a)
#define IDirectPlay8Address_BuildFromDirectPlay4Address(p, a, b) (p)->lpVtbl->BuildFromDirectPlay4Address(p, a, b)

type IDirectPlay8AddressIP
	lpVtbl as IDirectPlay8AddressIPVtbl ptr
end type

type IDirectPlay8AddressIPVtbl_
	QueryInterface as function(byval This as IDirectPlay8AddressIP ptr, byval riid as const IID const ptr, byval ppvObject as any ptr ptr) as HRESULT
	AddRef as function(byval This as IDirectPlay8AddressIP ptr) as ULONG_
	Release as function(byval This as IDirectPlay8AddressIP ptr) as ULONG_
	BuildFromSockAddr as function(byval This as IDirectPlay8AddressIP ptr, byval pSockAddr as const SOCKADDR_ const ptr) as HRESULT
	BuildAddress as function(byval This as IDirectPlay8AddressIP ptr, byval wszAddress as const WCHAR const ptr, byval usPort as const USHORT_) as HRESULT
	BuildLocalAddress as function(byval This as IDirectPlay8AddressIP ptr, byval pguidAdapter as const GUID const ptr, byval usPort as const USHORT_) as HRESULT
	GetSockAddress as function(byval This as IDirectPlay8AddressIP ptr, byval pSockAddr as SOCKADDR_ ptr, byval as PDWORD) as HRESULT
	GetLocalAddress as function(byval This as IDirectPlay8AddressIP ptr, byval pguidAdapter as GUID ptr, byval pusPort as USHORT_ ptr) as HRESULT
	GetAddress as function(byval This as IDirectPlay8AddressIP ptr, byval wszAddress as WCHAR ptr, byval pdwAddressLength as PDWORD, byval psPort as USHORT_ ptr) as HRESULT
end type

#define IDirectPlay8AddressIP_QueryInterface(p, a, b) (p)->lpVtbl->QueryInterface(a, b)
#define IDirectPlay8AddressIP_AddRef(p) (p)->lpVtbl->AddRef()
#define IDirectPlay8AddressIP_Release(p) (p)->lpVtbl->Release()
#define IDirectPlay8AddressIP_BuildFromSockAddr(p, a) (p)->lpVtbl->BuildFromSockAddr(a)
#define IDirectPlay8AddressIP_BuildAddress(p, a, b) (p)->lpVtbl->BuildAddress(a, b)
#define IDirectPlay8AddressIP_BuildLocalAddress(p, a, b) (p)->lpVtbl->BuildLocalAddress(a, b)
#define IDirectPlay8AddressIP_GetSockAddress(p, a, b) (p)->lpVtbl->GetSockAddress(a, b)
#define IDirectPlay8AddressIP_GetLocalAddress(p, a, b) (p)->lpVtbl->GetLocalAddress(a, b)
#define IDirectPlay8AddressIP_GetAddress(p, a, b, c) (p)->lpVtbl->GetAddress(a, b, c)

declare function DirectPlay8AddressCreate(byval pcIID as const GUID ptr, byval ppvInterface as LPVOID ptr, byval pUnknown as IUnknown ptr) as HRESULT

end extern
