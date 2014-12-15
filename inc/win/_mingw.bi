#pragma once

#include once "crt/long.bi"
#include once "_mingw_mac.bi"
#include once "sdks/_mingw_directx.bi"
#include once "sdks/_mingw_ddk.bi"

extern "C"

#define _INC__MINGW_H
#define MINGW_HAS_SECURE_API 1
#define __LONG32 long
#define __USE_CRTIMP 1
#define USE___UUIDOF 0
#define __MSVCRT_VERSION__ &h0700
#define WINVER &h0502
#define _WIN32_WINNT &h502
#define _INT128_DEFINED
#define __int8 byte
#define __int16 short
#define __int32 long
#define __int64 longint
#define _CRT_PACKING 8

'' TODO: #pragma pack(push,_CRT_PACKING)

#ifdef __FB_64BIT__
	type size_t as ulongint
#else
	type size_t as ulong
#endif

#define _DLL
#define _MT
#define _PGLOBAL
#define _AGLOBAL
#define _SECURECRT_FILL_BUFFER_PATTERN &hFD
#define _CRT_INSECURE_DEPRECATE_MEMORY(_Replacement)
#define _CRT_INSECURE_DEPRECATE_GLOBALS(_Replacement)
#define _CRT_MANAGED_HEAP_DEPRECATE
#define _CRT_OBSOLETE(_NewItem)
#define _SIZE_T_DEFINED
#define _SSIZE_T_DEFINED

#ifdef __FB_64BIT__
	type ssize_t as longint
#else
	type ssize_t as long
#endif

#define _INTPTR_T_DEFINED
#define __intptr_t_defined

#ifdef __FB_64BIT__
	type intptr_t as longint
#else
	type intptr_t as long
#endif

#define _UINTPTR_T_DEFINED
#define __uintptr_t_defined

#ifdef __FB_64BIT__
	type uintptr_t as ulongint
#else
	type uintptr_t as ulong
#endif

#define _PTRDIFF_T_DEFINED
#define _PTRDIFF_T_

#ifdef __FB_64BIT__
	type ptrdiff_t as longint
#else
	type ptrdiff_t as long
#endif

#define _WCHAR_T_DEFINED

type wchar_t as ushort

#define _WCTYPE_T_DEFINED
#define _WINT_T

type wint_t as ushort
type wctype_t as ushort

#ifndef __FB_64BIT__
	#define _USE_32BIT_TIME_T
#endif

#define _ERRCODE_DEFINED

type errno_t as long

#define _TIME32_T_DEFINED

type __time32_t as long

#define _TIME64_T_DEFINED

type __time64_t as longint

#define _TIME_T_DEFINED

#ifdef __FB_64BIT__
	type time_t as __time64_t
#else
	type time_t as __time32_t
#endif

#define _ARGMAX 100
#define _TRUNCATE cuint(-1)
#define _CRT_glob _dowildcard
#define __ANONYMOUS_DEFINED

declare function __mingw_get_crt_info() as const zstring ptr

#define MINGW_SDK_INIT
#define __STDC_SECURE_LIB__ cast(clong, 200411)
#define __GOT_SECURE_LIB__ __STDC_SECURE_LIB__

end extern
