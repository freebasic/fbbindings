'' FreeBASIC binding for mingw-w64-v4.0.1
''
'' based on the C header files:
''   DISCLAIMER
''   This file has no copyright assigned and is placed in the Public Domain.
''   This file is part of the mingw-w64 runtime package.
''
''   The mingw-w64 runtime package and its code is distributed in the hope that it 
''   will be useful but WITHOUT ANY WARRANTY.  ALL WARRANTIES, EXPRESSED OR 
''   IMPLIED ARE HEREBY DISCLAIMED.  This includes but is not limited to 
''   warranties of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
''
'' translated to FreeBASIC by:
''   Copyright © 2015 FreeBASIC development team

#pragma once

#include once "_mingw_unicode.bi"
#include once "crt/stdio.bi"
#include once "crt/string.bi"
#include once "crt/stdarg.bi"
#include once "specstrings.bi"

#ifdef __FB_64BIT__
	extern "C"
#else
	extern "Windows"
#endif

#define _STRSAFE_H_INCLUDED_
const STRSAFE_MAX_CCH = 2147483647
const STRSAFE_IGNORE_NULLS = &h00000100
const STRSAFE_FILL_BEHIND_NULL = &h00000200
const STRSAFE_FILL_ON_FAILURE = &h00000400
const STRSAFE_NULL_ON_FAILURE = &h00000800
const STRSAFE_NO_TRUNCATION = &h00001000
const STRSAFE_IGNORE_NULL_UNICODE_STRINGS = &h00010000
const STRSAFE_UNICODE_STRING_DEST_NULL_TERMINATED = &h00020000
#define STRSAFE_VALID_FLAGS (((((&h000000FF or STRSAFE_IGNORE_NULLS) or STRSAFE_FILL_BEHIND_NULL) or STRSAFE_FILL_ON_FAILURE) or STRSAFE_NULL_ON_FAILURE) or STRSAFE_NO_TRUNCATION)
#define STRSAFE_UNICODE_STRING_VALID_FLAGS ((STRSAFE_VALID_FLAGS or STRSAFE_IGNORE_NULL_UNICODE_STRINGS) or STRSAFE_UNICODE_STRING_DEST_NULL_TERMINATED)
#define STRSAFE_FILL_BYTE(x) culng((x and &h000000FF) or STRSAFE_FILL_BEHIND_NULL)
#define STRSAFE_FAILURE_BYTE(x) culng((x and &h000000FF) or STRSAFE_FILL_ON_FAILURE)
#define STRSAFE_GET_FILL_PATTERN(dwFlags) clng(dwFlags and &h000000FF)
#define STRSAFE_E_INSUFFICIENT_BUFFER cast(HRESULT, &h8007007A)
#define STRSAFE_E_INVALID_PARAMETER cast(HRESULT, &h80070057)
#define STRSAFE_E_END_OF_FILE cast(HRESULT, &h80070026)

type STRSAFE_LPSTR as zstring ptr
type STRSAFE_LPCSTR as const zstring ptr
type STRSAFE_LPWSTR as wstring ptr
type STRSAFE_LPCWSTR as const wstring ptr

declare function StringCopyWorkerA(byval pszDest as STRSAFE_LPSTR, byval cchDest as uinteger, byval pszSrc as STRSAFE_LPCSTR) as HRESULT
declare function StringCopyWorkerW(byval pszDest as STRSAFE_LPWSTR, byval cchDest as uinteger, byval pszSrc as STRSAFE_LPCWSTR) as HRESULT
declare function StringCopyExWorkerA(byval pszDest as STRSAFE_LPSTR, byval cchDest as uinteger, byval cbDest as uinteger, byval pszSrc as STRSAFE_LPCSTR, byval ppszDestEnd as STRSAFE_LPSTR ptr, byval pcchRemaining as uinteger ptr, byval dwFlags as ulong) as HRESULT
declare function StringCopyExWorkerW(byval pszDest as STRSAFE_LPWSTR, byval cchDest as uinteger, byval cbDest as uinteger, byval pszSrc as STRSAFE_LPCWSTR, byval ppszDestEnd as STRSAFE_LPWSTR ptr, byval pcchRemaining as uinteger ptr, byval dwFlags as ulong) as HRESULT
declare function StringCopyNWorkerA(byval pszDest as STRSAFE_LPSTR, byval cchDest as uinteger, byval pszSrc as STRSAFE_LPCSTR, byval cchToCopy as uinteger) as HRESULT
declare function StringCopyNWorkerW(byval pszDest as STRSAFE_LPWSTR, byval cchDest as uinteger, byval pszSrc as STRSAFE_LPCWSTR, byval cchToCopy as uinteger) as HRESULT
declare function StringCopyNExWorkerA(byval pszDest as STRSAFE_LPSTR, byval cchDest as uinteger, byval cbDest as uinteger, byval pszSrc as STRSAFE_LPCSTR, byval cchToCopy as uinteger, byval ppszDestEnd as STRSAFE_LPSTR ptr, byval pcchRemaining as uinteger ptr, byval dwFlags as ulong) as HRESULT
declare function StringCopyNExWorkerW(byval pszDest as STRSAFE_LPWSTR, byval cchDest as uinteger, byval cbDest as uinteger, byval pszSrc as STRSAFE_LPCWSTR, byval cchToCopy as uinteger, byval ppszDestEnd as STRSAFE_LPWSTR ptr, byval pcchRemaining as uinteger ptr, byval dwFlags as ulong) as HRESULT
declare function StringCatWorkerA(byval pszDest as STRSAFE_LPSTR, byval cchDest as uinteger, byval pszSrc as STRSAFE_LPCSTR) as HRESULT
declare function StringCatWorkerW(byval pszDest as STRSAFE_LPWSTR, byval cchDest as uinteger, byval pszSrc as STRSAFE_LPCWSTR) as HRESULT
declare function StringCatExWorkerA(byval pszDest as STRSAFE_LPSTR, byval cchDest as uinteger, byval cbDest as uinteger, byval pszSrc as STRSAFE_LPCSTR, byval ppszDestEnd as STRSAFE_LPSTR ptr, byval pcchRemaining as uinteger ptr, byval dwFlags as ulong) as HRESULT
declare function StringCatExWorkerW(byval pszDest as STRSAFE_LPWSTR, byval cchDest as uinteger, byval cbDest as uinteger, byval pszSrc as STRSAFE_LPCWSTR, byval ppszDestEnd as STRSAFE_LPWSTR ptr, byval pcchRemaining as uinteger ptr, byval dwFlags as ulong) as HRESULT
declare function StringCatNWorkerA(byval pszDest as STRSAFE_LPSTR, byval cchDest as uinteger, byval pszSrc as STRSAFE_LPCSTR, byval cchToAppend as uinteger) as HRESULT
declare function StringCatNWorkerW(byval pszDest as STRSAFE_LPWSTR, byval cchDest as uinteger, byval pszSrc as STRSAFE_LPCWSTR, byval cchToAppend as uinteger) as HRESULT
declare function StringCatNExWorkerA(byval pszDest as STRSAFE_LPSTR, byval cchDest as uinteger, byval cbDest as uinteger, byval pszSrc as STRSAFE_LPCSTR, byval cchToAppend as uinteger, byval ppszDestEnd as STRSAFE_LPSTR ptr, byval pcchRemaining as uinteger ptr, byval dwFlags as ulong) as HRESULT
declare function StringCatNExWorkerW(byval pszDest as STRSAFE_LPWSTR, byval cchDest as uinteger, byval cbDest as uinteger, byval pszSrc as STRSAFE_LPCWSTR, byval cchToAppend as uinteger, byval ppszDestEnd as STRSAFE_LPWSTR ptr, byval pcchRemaining as uinteger ptr, byval dwFlags as ulong) as HRESULT
declare function StringVPrintfWorkerA(byval pszDest as STRSAFE_LPSTR, byval cchDest as uinteger, byval pszFormat as STRSAFE_LPCSTR, byval argList as va_list) as HRESULT
declare function StringVPrintfWorkerW(byval pszDest as STRSAFE_LPWSTR, byval cchDest as uinteger, byval pszFormat as STRSAFE_LPCWSTR, byval argList as va_list) as HRESULT
declare function StringVPrintfExWorkerA(byval pszDest as STRSAFE_LPSTR, byval cchDest as uinteger, byval cbDest as uinteger, byval ppszDestEnd as STRSAFE_LPSTR ptr, byval pcchRemaining as uinteger ptr, byval dwFlags as ulong, byval pszFormat as STRSAFE_LPCSTR, byval argList as va_list) as HRESULT
declare function StringVPrintfExWorkerW(byval pszDest as STRSAFE_LPWSTR, byval cchDest as uinteger, byval cbDest as uinteger, byval ppszDestEnd as STRSAFE_LPWSTR ptr, byval pcchRemaining as uinteger ptr, byval dwFlags as ulong, byval pszFormat as STRSAFE_LPCWSTR, byval argList as va_list) as HRESULT
declare function StringLengthWorkerA(byval psz as STRSAFE_LPCSTR, byval cchMax as uinteger, byval pcchLength as uinteger ptr) as HRESULT
declare function StringLengthWorkerW(byval psz as STRSAFE_LPCWSTR, byval cchMax as uinteger, byval pcchLength as uinteger ptr) as HRESULT
declare function StringGetsExWorkerA(byval pszDest as STRSAFE_LPSTR, byval cchDest as uinteger, byval cbDest as uinteger, byval ppszDestEnd as STRSAFE_LPSTR ptr, byval pcchRemaining as uinteger ptr, byval dwFlags as ulong) as HRESULT
declare function StringGetsExWorkerW(byval pszDest as STRSAFE_LPWSTR, byval cchDest as uinteger, byval cbDest as uinteger, byval ppszDestEnd as STRSAFE_LPWSTR ptr, byval pcchRemaining as uinteger ptr, byval dwFlags as ulong) as HRESULT

#ifdef UNICODE
	#define StringCchCopy StringCchCopyW
#else
	#define StringCchCopy StringCchCopyA
#endif

declare function StringCchCopyA(byval pszDest as STRSAFE_LPSTR, byval cchDest as uinteger, byval pszSrc as STRSAFE_LPCSTR) as HRESULT
declare function StringCchCopyW(byval pszDest as STRSAFE_LPWSTR, byval cchDest as uinteger, byval pszSrc as STRSAFE_LPCWSTR) as HRESULT

#ifdef UNICODE
	#define StringCbCopy StringCbCopyW
#else
	#define StringCbCopy StringCbCopyA
#endif

declare function StringCbCopyA(byval pszDest as STRSAFE_LPSTR, byval cbDest as uinteger, byval pszSrc as STRSAFE_LPCSTR) as HRESULT
declare function StringCbCopyW(byval pszDest as STRSAFE_LPWSTR, byval cbDest as uinteger, byval pszSrc as STRSAFE_LPCWSTR) as HRESULT

#ifdef UNICODE
	#define StringCchCopyEx StringCchCopyExW
#else
	#define StringCchCopyEx StringCchCopyExA
#endif

declare function StringCchCopyExA(byval pszDest as STRSAFE_LPSTR, byval cchDest as uinteger, byval pszSrc as STRSAFE_LPCSTR, byval ppszDestEnd as STRSAFE_LPSTR ptr, byval pcchRemaining as uinteger ptr, byval dwFlags as ulong) as HRESULT
declare function StringCchCopyExW(byval pszDest as STRSAFE_LPWSTR, byval cchDest as uinteger, byval pszSrc as STRSAFE_LPCWSTR, byval ppszDestEnd as STRSAFE_LPWSTR ptr, byval pcchRemaining as uinteger ptr, byval dwFlags as ulong) as HRESULT

#ifdef UNICODE
	#define StringCbCopyEx StringCbCopyExW
#else
	#define StringCbCopyEx StringCbCopyExA
#endif

declare function StringCbCopyExA(byval pszDest as STRSAFE_LPSTR, byval cbDest as uinteger, byval pszSrc as STRSAFE_LPCSTR, byval ppszDestEnd as STRSAFE_LPSTR ptr, byval pcbRemaining as uinteger ptr, byval dwFlags as ulong) as HRESULT
declare function StringCbCopyExW(byval pszDest as STRSAFE_LPWSTR, byval cbDest as uinteger, byval pszSrc as STRSAFE_LPCWSTR, byval ppszDestEnd as STRSAFE_LPWSTR ptr, byval pcbRemaining as uinteger ptr, byval dwFlags as ulong) as HRESULT
declare function StringCchCopyNA(byval pszDest as STRSAFE_LPSTR, byval cchDest as uinteger, byval pszSrc as STRSAFE_LPCSTR, byval cchToCopy as uinteger) as HRESULT
declare function StringCchCopyNW(byval pszDest as STRSAFE_LPWSTR, byval cchDest as uinteger, byval pszSrc as STRSAFE_LPCWSTR, byval cchToCopy as uinteger) as HRESULT

#ifdef UNICODE
	#define StringCchCopyN StringCchCopyNW
#else
	#define StringCchCopyN StringCchCopyNA
#endif

declare function StringCbCopyNA(byval pszDest as STRSAFE_LPSTR, byval cbDest as uinteger, byval pszSrc as STRSAFE_LPCSTR, byval cbToCopy as uinteger) as HRESULT
declare function StringCbCopyNW(byval pszDest as STRSAFE_LPWSTR, byval cbDest as uinteger, byval pszSrc as STRSAFE_LPCWSTR, byval cbToCopy as uinteger) as HRESULT

#ifdef UNICODE
	#define StringCbCopyN StringCbCopyNW
#else
	#define StringCbCopyN StringCbCopyNA
#endif

declare function StringCchCopyNExA(byval pszDest as STRSAFE_LPSTR, byval cchDest as uinteger, byval pszSrc as STRSAFE_LPCSTR, byval cchToCopy as uinteger, byval ppszDestEnd as STRSAFE_LPSTR ptr, byval pcchRemaining as uinteger ptr, byval dwFlags as ulong) as HRESULT
declare function StringCchCopyNExW(byval pszDest as STRSAFE_LPWSTR, byval cchDest as uinteger, byval pszSrc as STRSAFE_LPCWSTR, byval cchToCopy as uinteger, byval ppszDestEnd as STRSAFE_LPWSTR ptr, byval pcchRemaining as uinteger ptr, byval dwFlags as ulong) as HRESULT

#ifdef UNICODE
	#define StringCchCopyNEx StringCchCopyNExW
#else
	#define StringCchCopyNEx StringCchCopyNExA
#endif

declare function StringCbCopyNExA(byval pszDest as STRSAFE_LPSTR, byval cbDest as uinteger, byval pszSrc as STRSAFE_LPCSTR, byval cbToCopy as uinteger, byval ppszDestEnd as STRSAFE_LPSTR ptr, byval pcbRemaining as uinteger ptr, byval dwFlags as ulong) as HRESULT
declare function StringCbCopyNExW(byval pszDest as STRSAFE_LPWSTR, byval cbDest as uinteger, byval pszSrc as STRSAFE_LPCWSTR, byval cbToCopy as uinteger, byval ppszDestEnd as STRSAFE_LPWSTR ptr, byval pcbRemaining as uinteger ptr, byval dwFlags as ulong) as HRESULT

#ifdef UNICODE
	#define StringCbCopyNEx StringCbCopyNExW
#else
	#define StringCbCopyNEx StringCbCopyNExA
#endif

declare function StringCchCatA(byval pszDest as STRSAFE_LPSTR, byval cchDest as uinteger, byval pszSrc as STRSAFE_LPCSTR) as HRESULT
declare function StringCchCatW(byval pszDest as STRSAFE_LPWSTR, byval cchDest as uinteger, byval pszSrc as STRSAFE_LPCWSTR) as HRESULT

#ifdef UNICODE
	#define StringCchCat StringCchCatW
#else
	#define StringCchCat StringCchCatA
#endif

declare function StringCbCatA(byval pszDest as STRSAFE_LPSTR, byval cbDest as uinteger, byval pszSrc as STRSAFE_LPCSTR) as HRESULT
declare function StringCbCatW(byval pszDest as STRSAFE_LPWSTR, byval cbDest as uinteger, byval pszSrc as STRSAFE_LPCWSTR) as HRESULT

#ifdef UNICODE
	#define StringCbCat StringCbCatW
#else
	#define StringCbCat StringCbCatA
#endif

declare function StringCchCatExA(byval pszDest as STRSAFE_LPSTR, byval cchDest as uinteger, byval pszSrc as STRSAFE_LPCSTR, byval ppszDestEnd as STRSAFE_LPSTR ptr, byval pcchRemaining as uinteger ptr, byval dwFlags as ulong) as HRESULT
declare function StringCchCatExW(byval pszDest as STRSAFE_LPWSTR, byval cchDest as uinteger, byval pszSrc as STRSAFE_LPCWSTR, byval ppszDestEnd as STRSAFE_LPWSTR ptr, byval pcchRemaining as uinteger ptr, byval dwFlags as ulong) as HRESULT

#ifdef UNICODE
	#define StringCchCatEx StringCchCatExW
#else
	#define StringCchCatEx StringCchCatExA
#endif

declare function StringCbCatExA(byval pszDest as STRSAFE_LPSTR, byval cbDest as uinteger, byval pszSrc as STRSAFE_LPCSTR, byval ppszDestEnd as STRSAFE_LPSTR ptr, byval pcbRemaining as uinteger ptr, byval dwFlags as ulong) as HRESULT
declare function StringCbCatExW(byval pszDest as STRSAFE_LPWSTR, byval cbDest as uinteger, byval pszSrc as STRSAFE_LPCWSTR, byval ppszDestEnd as STRSAFE_LPWSTR ptr, byval pcbRemaining as uinteger ptr, byval dwFlags as ulong) as HRESULT

#ifdef UNICODE
	#define StringCbCatEx StringCbCatExW
#else
	#define StringCbCatEx StringCbCatExA
#endif

declare function StringCchCatNA(byval pszDest as STRSAFE_LPSTR, byval cchDest as uinteger, byval pszSrc as STRSAFE_LPCSTR, byval cchToAppend as uinteger) as HRESULT
declare function StringCchCatNW(byval pszDest as STRSAFE_LPWSTR, byval cchDest as uinteger, byval pszSrc as STRSAFE_LPCWSTR, byval cchToAppend as uinteger) as HRESULT

#ifdef UNICODE
	#define StringCchCatN StringCchCatNW
#else
	#define StringCchCatN StringCchCatNA
#endif

declare function StringCbCatNA(byval pszDest as STRSAFE_LPSTR, byval cbDest as uinteger, byval pszSrc as STRSAFE_LPCSTR, byval cbToAppend as uinteger) as HRESULT
declare function StringCbCatNW(byval pszDest as STRSAFE_LPWSTR, byval cbDest as uinteger, byval pszSrc as STRSAFE_LPCWSTR, byval cbToAppend as uinteger) as HRESULT

#ifdef UNICODE
	#define StringCbCatN StringCbCatNW
#else
	#define StringCbCatN StringCbCatNA
#endif

declare function StringCchCatNExA(byval pszDest as STRSAFE_LPSTR, byval cchDest as uinteger, byval pszSrc as STRSAFE_LPCSTR, byval cchToAppend as uinteger, byval ppszDestEnd as STRSAFE_LPSTR ptr, byval pcchRemaining as uinteger ptr, byval dwFlags as ulong) as HRESULT
declare function StringCchCatNExW(byval pszDest as STRSAFE_LPWSTR, byval cchDest as uinteger, byval pszSrc as STRSAFE_LPCWSTR, byval cchToAppend as uinteger, byval ppszDestEnd as STRSAFE_LPWSTR ptr, byval pcchRemaining as uinteger ptr, byval dwFlags as ulong) as HRESULT

#ifdef UNICODE
	#define StringCchCatNEx StringCchCatNExW
#else
	#define StringCchCatNEx StringCchCatNExA
#endif

declare function StringCbCatNExA(byval pszDest as STRSAFE_LPSTR, byval cbDest as uinteger, byval pszSrc as STRSAFE_LPCSTR, byval cbToAppend as uinteger, byval ppszDestEnd as STRSAFE_LPSTR ptr, byval pcbRemaining as uinteger ptr, byval dwFlags as ulong) as HRESULT
declare function StringCbCatNExW(byval pszDest as STRSAFE_LPWSTR, byval cbDest as uinteger, byval pszSrc as STRSAFE_LPCWSTR, byval cbToAppend as uinteger, byval ppszDestEnd as STRSAFE_LPWSTR ptr, byval pcbRemaining as uinteger ptr, byval dwFlags as ulong) as HRESULT

#ifdef UNICODE
	#define StringCbCatNEx StringCbCatNExW
#else
	#define StringCbCatNEx StringCbCatNExA
#endif

declare function StringCchVPrintfA(byval pszDest as STRSAFE_LPSTR, byval cchDest as uinteger, byval pszFormat as STRSAFE_LPCSTR, byval argList as va_list) as HRESULT
declare function StringCchVPrintfW(byval pszDest as STRSAFE_LPWSTR, byval cchDest as uinteger, byval pszFormat as STRSAFE_LPCWSTR, byval argList as va_list) as HRESULT

#ifdef UNICODE
	#define StringCchVPrintf StringCchVPrintfW
#else
	#define StringCchVPrintf StringCchVPrintfA
#endif

declare function StringCbVPrintfA(byval pszDest as STRSAFE_LPSTR, byval cbDest as uinteger, byval pszFormat as STRSAFE_LPCSTR, byval argList as va_list) as HRESULT
declare function StringCbVPrintfW(byval pszDest as STRSAFE_LPWSTR, byval cbDest as uinteger, byval pszFormat as STRSAFE_LPCWSTR, byval argList as va_list) as HRESULT

#ifdef UNICODE
	#define StringCbVPrintf StringCbVPrintfW
#else
	#define StringCbVPrintf StringCbVPrintfA
#endif

declare function StringCchPrintfA cdecl(byval pszDest as STRSAFE_LPSTR, byval cchDest as uinteger, byval pszFormat as STRSAFE_LPCSTR, ...) as HRESULT
declare function StringCchPrintfW cdecl(byval pszDest as STRSAFE_LPWSTR, byval cchDest as uinteger, byval pszFormat as STRSAFE_LPCWSTR, ...) as HRESULT

#ifdef UNICODE
	#define StringCchPrintf StringCchPrintfW
#else
	#define StringCchPrintf StringCchPrintfA
#endif

declare function StringCbPrintfA cdecl(byval pszDest as STRSAFE_LPSTR, byval cbDest as uinteger, byval pszFormat as STRSAFE_LPCSTR, ...) as HRESULT
declare function StringCbPrintfW cdecl(byval pszDest as STRSAFE_LPWSTR, byval cbDest as uinteger, byval pszFormat as STRSAFE_LPCWSTR, ...) as HRESULT

#ifdef UNICODE
	#define StringCbPrintf StringCbPrintfW
#else
	#define StringCbPrintf StringCbPrintfA
#endif

declare function StringCchPrintfExA cdecl(byval pszDest as STRSAFE_LPSTR, byval cchDest as uinteger, byval ppszDestEnd as STRSAFE_LPSTR ptr, byval pcchRemaining as uinteger ptr, byval dwFlags as ulong, byval pszFormat as STRSAFE_LPCSTR, ...) as HRESULT
declare function StringCchPrintfExW cdecl(byval pszDest as STRSAFE_LPWSTR, byval cchDest as uinteger, byval ppszDestEnd as STRSAFE_LPWSTR ptr, byval pcchRemaining as uinteger ptr, byval dwFlags as ulong, byval pszFormat as STRSAFE_LPCWSTR, ...) as HRESULT

#ifdef UNICODE
	#define StringCchPrintfEx StringCchPrintfExW
#else
	#define StringCchPrintfEx StringCchPrintfExA
#endif

declare function StringCbPrintfExA cdecl(byval pszDest as STRSAFE_LPSTR, byval cbDest as uinteger, byval ppszDestEnd as STRSAFE_LPSTR ptr, byval pcbRemaining as uinteger ptr, byval dwFlags as ulong, byval pszFormat as STRSAFE_LPCSTR, ...) as HRESULT
declare function StringCbPrintfExW cdecl(byval pszDest as STRSAFE_LPWSTR, byval cbDest as uinteger, byval ppszDestEnd as STRSAFE_LPWSTR ptr, byval pcbRemaining as uinteger ptr, byval dwFlags as ulong, byval pszFormat as STRSAFE_LPCWSTR, ...) as HRESULT

#ifdef UNICODE
	#define StringCbPrintfEx StringCbPrintfExW
#else
	#define StringCbPrintfEx StringCbPrintfExA
#endif

declare function StringCchVPrintfExA(byval pszDest as STRSAFE_LPSTR, byval cchDest as uinteger, byval ppszDestEnd as STRSAFE_LPSTR ptr, byval pcchRemaining as uinteger ptr, byval dwFlags as ulong, byval pszFormat as STRSAFE_LPCSTR, byval argList as va_list) as HRESULT
declare function StringCchVPrintfExW(byval pszDest as STRSAFE_LPWSTR, byval cchDest as uinteger, byval ppszDestEnd as STRSAFE_LPWSTR ptr, byval pcchRemaining as uinteger ptr, byval dwFlags as ulong, byval pszFormat as STRSAFE_LPCWSTR, byval argList as va_list) as HRESULT

#ifdef UNICODE
	#define StringCchVPrintfEx StringCchVPrintfExW
#else
	#define StringCchVPrintfEx StringCchVPrintfExA
#endif

declare function StringCbVPrintfExA(byval pszDest as STRSAFE_LPSTR, byval cbDest as uinteger, byval ppszDestEnd as STRSAFE_LPSTR ptr, byval pcbRemaining as uinteger ptr, byval dwFlags as ulong, byval pszFormat as STRSAFE_LPCSTR, byval argList as va_list) as HRESULT
declare function StringCbVPrintfExW(byval pszDest as STRSAFE_LPWSTR, byval cbDest as uinteger, byval ppszDestEnd as STRSAFE_LPWSTR ptr, byval pcbRemaining as uinteger ptr, byval dwFlags as ulong, byval pszFormat as STRSAFE_LPCWSTR, byval argList as va_list) as HRESULT

#ifdef UNICODE
	#define StringCbVPrintfEx StringCbVPrintfExW
#else
	#define StringCbVPrintfEx StringCbVPrintfExA
#endif

declare function StringCchGetsA(byval pszDest as STRSAFE_LPSTR, byval cchDest as uinteger) as HRESULT
declare function StringCchGetsW(byval pszDest as STRSAFE_LPWSTR, byval cchDest as uinteger) as HRESULT

#ifdef UNICODE
	#define StringCchGets StringCchGetsW
#else
	#define StringCchGets StringCchGetsA
#endif

declare function StringCbGetsA(byval pszDest as STRSAFE_LPSTR, byval cbDest as uinteger) as HRESULT
declare function StringCbGetsW(byval pszDest as STRSAFE_LPWSTR, byval cbDest as uinteger) as HRESULT

#ifdef UNICODE
	#define StringCbGets StringCbGetsW
#else
	#define StringCbGets StringCbGetsA
#endif

declare function StringCchGetsExA(byval pszDest as STRSAFE_LPSTR, byval cchDest as uinteger, byval ppszDestEnd as STRSAFE_LPSTR ptr, byval pcchRemaining as uinteger ptr, byval dwFlags as ulong) as HRESULT
declare function StringCchGetsExW(byval pszDest as STRSAFE_LPWSTR, byval cchDest as uinteger, byval ppszDestEnd as STRSAFE_LPWSTR ptr, byval pcchRemaining as uinteger ptr, byval dwFlags as ulong) as HRESULT

#ifdef UNICODE
	#define StringCchGetsEx StringCchGetsExW
#else
	#define StringCchGetsEx StringCchGetsExA
#endif

declare function StringCbGetsExA(byval pszDest as STRSAFE_LPSTR, byval cbDest as uinteger, byval ppszDestEnd as STRSAFE_LPSTR ptr, byval pcbRemaining as uinteger ptr, byval dwFlags as ulong) as HRESULT
declare function StringCbGetsExW(byval pszDest as STRSAFE_LPWSTR, byval cbDest as uinteger, byval ppszDestEnd as STRSAFE_LPWSTR ptr, byval pcbRemaining as uinteger ptr, byval dwFlags as ulong) as HRESULT

#ifdef UNICODE
	#define StringCbGetsEx StringCbGetsExW
#else
	#define StringCbGetsEx StringCbGetsExA
#endif

declare function StringCchLengthA(byval psz as STRSAFE_LPCSTR, byval cchMax as uinteger, byval pcchLength as uinteger ptr) as HRESULT
declare function StringCchLengthW(byval psz as STRSAFE_LPCWSTR, byval cchMax as uinteger, byval pcchLength as uinteger ptr) as HRESULT

#ifdef UNICODE
	#define StringCchLength StringCchLengthW
#else
	#define StringCchLength StringCchLengthA
#endif

declare function StringCbLengthA(byval psz as STRSAFE_LPCSTR, byval cbMax as uinteger, byval pcbLength as uinteger ptr) as HRESULT
declare function StringCbLengthW(byval psz as STRSAFE_LPCWSTR, byval cbMax as uinteger, byval pcbLength as uinteger ptr) as HRESULT

#ifdef UNICODE
	#define StringCbLength StringCbLengthW
#else
	#define StringCbLength StringCbLengthA
#endif

'' TODO: #define StringCopyWorkerA StringCopyWorkerA_instead_use_StringCchCopyA_or_StringCchCopyExA;
'' TODO: #define StringCopyWorkerW StringCopyWorkerW_instead_use_StringCchCopyW_or_StringCchCopyExW;
'' TODO: #define StringCopyExWorkerA StringCopyExWorkerA_instead_use_StringCchCopyA_or_StringCchCopyExA;
'' TODO: #define StringCopyExWorkerW StringCopyExWorkerW_instead_use_StringCchCopyW_or_StringCchCopyExW;
'' TODO: #define StringCatWorkerA StringCatWorkerA_instead_use_StringCchCatA_or_StringCchCatExA;
'' TODO: #define StringCatWorkerW StringCatWorkerW_instead_use_StringCchCatW_or_StringCchCatExW;
'' TODO: #define StringCatExWorkerA StringCatExWorkerA_instead_use_StringCchCatA_or_StringCchCatExA;
'' TODO: #define StringCatExWorkerW StringCatExWorkerW_instead_use_StringCchCatW_or_StringCchCatExW;
'' TODO: #define StringCatNWorkerA StringCatNWorkerA_instead_use_StringCchCatNA_or_StrincCbCatNA;
'' TODO: #define StringCatNWorkerW StringCatNWorkerW_instead_use_StringCchCatNW_or_StringCbCatNW;
'' TODO: #define StringCatNExWorkerA StringCatNExWorkerA_instead_use_StringCchCatNExA_or_StringCbCatNExA;
'' TODO: #define StringCatNExWorkerW StringCatNExWorkerW_instead_use_StringCchCatNExW_or_StringCbCatNExW;
'' TODO: #define StringVPrintfWorkerA StringVPrintfWorkerA_instead_use_StringCchVPrintfA_or_StringCchVPrintfExA;
'' TODO: #define StringVPrintfWorkerW StringVPrintfWorkerW_instead_use_StringCchVPrintfW_or_StringCchVPrintfExW;
'' TODO: #define StringVPrintfExWorkerA StringVPrintfExWorkerA_instead_use_StringCchVPrintfA_or_StringCchVPrintfExA;
'' TODO: #define StringVPrintfExWorkerW StringVPrintfExWorkerW_instead_use_StringCchVPrintfW_or_StringCchVPrintfExW;
'' TODO: #define StringLengthWorkerA StringLengthWorkerA_instead_use_StringCchLengthA_or_StringCbLengthA;
'' TODO: #define StringLengthWorkerW StringLengthWorkerW_instead_use_StringCchLengthW_or_StringCbLengthW;
#define StringGetsExWorkerA StringGetsExWorkerA_instead_use_StringCchGetsA_or_StringCbGetsA
#define StringGetsExWorkerW StringGetsExWorkerW_instead_use_StringCchGetsW_or_StringCbGetsW
#undef strcpy
'' TODO: #define strcpy strcpy_instead_use_StringCbCopyA_or_StringCchCopyA;
#undef wcscpy
'' TODO: #define wcscpy wcscpy_instead_use_StringCbCopyW_or_StringCchCopyW;
#undef strcat
'' TODO: #define strcat strcat_instead_use_StringCbCatA_or_StringCchCatA;
#undef wcscat
'' TODO: #define wcscat wcscat_instead_use_StringCbCatW_or_StringCchCatW;
#undef sprintf
'' TODO: #define sprintf sprintf_instead_use_StringCbPrintfA_or_StringCchPrintfA;
#undef swprintf
'' TODO: #define swprintf swprintf_instead_use_StringCbPrintfW_or_StringCchPrintfW;
#undef vsprintf
'' TODO: #define vsprintf vsprintf_instead_use_StringCbVPrintfA_or_StringCchVPrintfA;
#undef vswprintf
'' TODO: #define vswprintf vswprintf_instead_use_StringCbVPrintfW_or_StringCchVPrintfW;
#undef _snprintf
'' TODO: #define _snprintf _snprintf_instead_use_StringCbPrintfA_or_StringCchPrintfA;
#undef _snwprintf
'' TODO: #define _snwprintf _snwprintf_instead_use_StringCbPrintfW_or_StringCchPrintfW;
#undef _vsnprintf
'' TODO: #define _vsnprintf _vsnprintf_instead_use_StringCbVPrintfA_or_StringCchVPrintfA;
#undef _vsnwprintf
'' TODO: #define _vsnwprintf _vsnwprintf_instead_use_StringCbVPrintfW_or_StringCchVPrintfW;
#undef strcpyA
'' TODO: #define strcpyA strcpyA_instead_use_StringCbCopyA_or_StringCchCopyA;
#undef strcpyW
'' TODO: #define strcpyW strcpyW_instead_use_StringCbCopyW_or_StringCchCopyW;
#undef lstrcpy
'' TODO: #define lstrcpy lstrcpy_instead_use_StringCbCopy_or_StringCchCopy;
#undef lstrcpyA
'' TODO: #define lstrcpyA lstrcpyA_instead_use_StringCbCopyA_or_StringCchCopyA;
#undef lstrcpyW
'' TODO: #define lstrcpyW lstrcpyW_instead_use_StringCbCopyW_or_StringCchCopyW;
#undef StrCpy
'' TODO: #define StrCpy StrCpy_instead_use_StringCbCopy_or_StringCchCopy;
#undef StrCpyA
'' TODO: #define StrCpyA StrCpyA_instead_use_StringCbCopyA_or_StringCchCopyA;
#undef StrCpyW
'' TODO: #define StrCpyW StrCpyW_instead_use_StringCbCopyW_or_StringCchCopyW;
#undef _tcscpy
'' TODO: #define _tcscpy _tcscpy_instead_use_StringCbCopy_or_StringCchCopy;
#undef _ftcscpy
'' TODO: #define _ftcscpy _ftcscpy_instead_use_StringCbCopy_or_StringCchCopy;
#undef lstrcat
'' TODO: #define lstrcat lstrcat_instead_use_StringCbCat_or_StringCchCat;
#undef lstrcatA
'' TODO: #define lstrcatA lstrcatA_instead_use_StringCbCatA_or_StringCchCatA;
#undef lstrcatW
'' TODO: #define lstrcatW lstrcatW_instead_use_StringCbCatW_or_StringCchCatW;
#undef StrCat
'' TODO: #define StrCat StrCat_instead_use_StringCbCat_or_StringCchCat;
#undef StrCatA
'' TODO: #define StrCatA StrCatA_instead_use_StringCbCatA_or_StringCchCatA;
#undef StrCatW
'' TODO: #define StrCatW StrCatW_instead_use_StringCbCatW_or_StringCchCatW;
#undef StrNCat
'' TODO: #define StrNCat StrNCat_instead_use_StringCbCatN_or_StringCchCatN;
#undef StrNCatA
'' TODO: #define StrNCatA StrNCatA_instead_use_StringCbCatNA_or_StringCchCatNA;
#undef StrNCatW
'' TODO: #define StrNCatW StrNCatW_instead_use_StringCbCatNW_or_StringCchCatNW;
#undef StrCatN
'' TODO: #define StrCatN StrCatN_instead_use_StringCbCatN_or_StringCchCatN;
#undef StrCatNA
'' TODO: #define StrCatNA StrCatNA_instead_use_StringCbCatNA_or_StringCchCatNA;
#undef StrCatNW
'' TODO: #define StrCatNW StrCatNW_instead_use_StringCbCatNW_or_StringCchCatNW;
#undef _tcscat
'' TODO: #define _tcscat _tcscat_instead_use_StringCbCat_or_StringCchCat;
#undef _ftcscat
'' TODO: #define _ftcscat _ftcscat_instead_use_StringCbCat_or_StringCchCat;
#undef wsprintf
'' TODO: #define wsprintf wsprintf_instead_use_StringCbPrintf_or_StringCchPrintf;
#undef wsprintfA
'' TODO: #define wsprintfA wsprintfA_instead_use_StringCbPrintfA_or_StringCchPrintfA;
#undef wsprintfW
'' TODO: #define wsprintfW wsprintfW_instead_use_StringCbPrintfW_or_StringCchPrintfW;
#undef wvsprintf
'' TODO: #define wvsprintf wvsprintf_instead_use_StringCbVPrintf_or_StringCchVPrintf;
#undef wvsprintfA
'' TODO: #define wvsprintfA wvsprintfA_instead_use_StringCbVPrintfA_or_StringCchVPrintfA;
#undef wvsprintfW
'' TODO: #define wvsprintfW wvsprintfW_instead_use_StringCbVPrintfW_or_StringCchVPrintfW;
#undef _vstprintf
'' TODO: #define _vstprintf _vstprintf_instead_use_StringCbVPrintf_or_StringCchVPrintf;
#undef _vsntprintf
'' TODO: #define _vsntprintf _vsntprintf_instead_use_StringCbVPrintf_or_StringCchVPrintf;
#undef _stprintf
'' TODO: #define _stprintf _stprintf_instead_use_StringCbPrintf_or_StringCchPrintf;
#undef _sntprintf
'' TODO: #define _sntprintf _sntprintf_instead_use_StringCbPrintf_or_StringCchPrintf;
#undef _getts
'' TODO: #define _getts _getts_instead_use_StringCbGets_or_StringCchGets;
#undef gets
'' TODO: #define gets _gets_instead_use_StringCbGetsA_or_StringCchGetsA;
#undef _getws
'' TODO: #define _getws _getws_instead_use_StringCbGetsW_or_StringCchGetsW;

end extern
