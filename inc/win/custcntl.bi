#pragma once

#include once "crt/wchar.bi"
#include once "_mingw_unicode.bi"

#ifdef __FB_64BIT__
	extern "C"
#else
	extern "Windows"
#endif

#define _INC_CUSTCNTL
#define CCHCCCLASS 32
#define CCHCCDESC 32
#define CCHCCTEXT 256

type tagCCSTYLEA
	flStyle as DWORD
	flExtStyle as DWORD
	szText(0 to 255) as CHAR
	lgid as LANGID
	wReserved1 as WORD
end type

type CCSTYLEA as tagCCSTYLEA
type LPCCSTYLEA as tagCCSTYLEA ptr

type tagCCSTYLEW
	flStyle as DWORD
	flExtStyle as DWORD
	szText(0 to 255) as WCHAR
	lgid as LANGID
	wReserved1 as WORD
end type

type CCSTYLEW as tagCCSTYLEW
type LPCCSTYLEW as tagCCSTYLEW ptr

#define CCSTYLE __MINGW_NAME_AW(CCSTYLE)
#define LPCCSTYLE __MINGW_NAME_AW(LPCCSTYLE)
#define LPFNCCSTYLE __MINGW_NAME_AW(LPFNCCSTYLE)
#define LPFNCCSIZETOTEXT __MINGW_NAME_AW(LPFNCCSIZETOTEXT)
#define CCSTYLEFLAG __MINGW_NAME_AW(CCSTYLEFLAG)
#define LPCCSTYLEFLAG __MINGW_NAME_AW(LPCCSTYLEFLAG)
#define CCINFO __MINGW_NAME_AW(CCINFO)
#define LPCCINFO __MINGW_NAME_AW(LPCCINFO)
#define LPFNCCINFO __MINGW_NAME_AW(LPFNCCINFO)

type LPFNCCSTYLEA as function(byval hwndParent as HWND, byval pccs as LPCCSTYLEA) as WINBOOL
type LPFNCCSTYLEW as function(byval hwndParent as HWND, byval pccs as LPCCSTYLEW) as WINBOOL
type LPFNCCSIZETOTEXTA as function(byval flStyle as DWORD, byval flExtStyle as DWORD, byval hfont as HFONT, byval pszText as LPSTR) as INT_
type LPFNCCSIZETOTEXTW as function(byval flStyle as DWORD, byval flExtStyle as DWORD, byval hfont as HFONT, byval pszText as LPWSTR) as INT_

type tagCCSTYLEFLAGA
	flStyle as DWORD
	flStyleMask as DWORD
	pszStyle as LPSTR
end type

type CCSTYLEFLAGA as tagCCSTYLEFLAGA
type LPCCSTYLEFLAGA as tagCCSTYLEFLAGA ptr

type tagCCSTYLEFLAGW
	flStyle as DWORD
	flStyleMask as DWORD
	pszStyle as LPWSTR
end type

type CCSTYLEFLAGW as tagCCSTYLEFLAGW
type LPCCSTYLEFLAGW as tagCCSTYLEFLAGW ptr

#define CCF_NOTEXT &h00000001

type tagCCINFOA
	szClass(0 to 31) as CHAR
	flOptions as DWORD
	szDesc(0 to 31) as CHAR
	cxDefault as UINT
	cyDefault as UINT
	flStyleDefault as DWORD
	flExtStyleDefault as DWORD
	flCtrlTypeMask as DWORD
	szTextDefault(0 to 255) as CHAR
	cStyleFlags as INT_
	aStyleFlags as LPCCSTYLEFLAGA
	lpfnStyle as LPFNCCSTYLEA
	lpfnSizeToText as LPFNCCSIZETOTEXTA
	dwReserved1 as DWORD
	dwReserved2 as DWORD
end type

type CCINFOA as tagCCINFOA
type LPCCINFOA as tagCCINFOA ptr

type tagCCINFOW
	szClass(0 to 31) as WCHAR
	flOptions as DWORD
	szDesc(0 to 31) as WCHAR
	cxDefault as UINT
	cyDefault as UINT
	flStyleDefault as DWORD
	flExtStyleDefault as DWORD
	flCtrlTypeMask as DWORD
	cStyleFlags as INT_
	aStyleFlags as LPCCSTYLEFLAGW
	szTextDefault(0 to 255) as WCHAR
	lpfnStyle as LPFNCCSTYLEW
	lpfnSizeToText as LPFNCCSIZETOTEXTW
	dwReserved1 as DWORD
	dwReserved2 as DWORD
end type

type CCINFOW as tagCCINFOW
type LPCCINFOW as tagCCINFOW ptr
type LPFNCCINFOA as function(byval acci as LPCCINFOA) as UINT
type LPFNCCINFOW as function(byval acci as LPCCINFOW) as UINT

end extern
