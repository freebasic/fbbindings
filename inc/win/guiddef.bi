#pragma once

#include once "_mingw.bi"
#include once "crt/string.bi"

#define GUID_DEFINED

type _GUID
	Data1 as ulong
	Data2 as ushort
	Data3 as ushort
	Data4(0 to 7) as ubyte
end type

type GUID as _GUID

#define DEFINE_GUID(name, l, w1, w2, b1, b2, b3, b4, b5, b6, b7, b8) '' TODO: EXTERN_C const GUID name
#define DEFINE_OLEGUID(name, l, w1, w2) DEFINE_GUID(name, l, w1, w2, &hc0, 0, 0, 0, 0, 0, 0, &h46)
#define _GUIDDEF_H_
#define __LPGUID_DEFINED__

type LPGUID as GUID ptr

#define __LPCGUID_DEFINED__

type LPCGUID as const GUID ptr

#define __IID_DEFINED__

type IID as GUID
type LPIID as IID ptr

#define IID_NULL GUID_NULL
#define CLSID_DEFINED

type CLSID as GUID
type LPCLSID as CLSID ptr

#define CLSID_NULL GUID_NULL

type FMTID as GUID
type LPFMTID as FMTID ptr

#define FMTID_NULL GUID_NULL
#define IsEqualFMTID(rfmtid1, rfmtid2) IsEqualGUID(rfmtid1, rfmtid2)
#define _REFGUID_DEFINED
#define REFGUID '' TODO: const GUID *__MIDL_CONST
#define _REFIID_DEFINED
#define REFIID '' TODO: const IID *__MIDL_CONST
#define _REFCLSID_DEFINED
#define REFCLSID '' TODO: const IID *__MIDL_CONST
#define _REFFMTID_DEFINED
#define REFFMTID '' TODO: const IID *__MIDL_CONST
#define _SYS_GUID_OPERATORS_
#define InlineIsEqualGUID(rguid1, rguid2) (((((@(rguid1)->Data1)[0] = (@(rguid2)->Data1)[0]) andalso ((@(rguid1)->Data1)[1] = (@(rguid2)->Data1)[1])) andalso ((@(rguid1)->Data1)[2] = (@(rguid2)->Data1)[2])) andalso ((@(rguid1)->Data1)[3] = (@(rguid2)->Data1)[3]))
#define IsEqualGUID(rguid1, rguid2) (memcmp(rguid1, rguid2, sizeof(GUID)) = 0)
#define IsEqualIID(riid1, riid2) IsEqualGUID(riid1, riid2)
#define IsEqualCLSID(rclsid1, rclsid2) IsEqualGUID(rclsid1, rclsid2)
#define _SYS_GUID_OPERATOR_EQ_
