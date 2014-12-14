#pragma once

#include once "_mingw_unicode.bi"

#ifdef __FB_64BIT__
	extern "C"
#else
	extern "Windows"
#endif

#define _INC_CPL

type APPLET_PROC as function(byval hwndCpl as HWND, byval msg as UINT, byval lParam1 as LPARAM, byval lParam2 as LPARAM) as LONG

#define WM_CPL_LAUNCH (WM_USER + 1000)
#define WM_CPL_LAUNCHED (WM_USER + 1001)
#define CPL_DYNAMIC_RES 0
#define CPL_INIT 1
#define CPL_GETCOUNT 2
#define CPL_INQUIRE 3
#define CPL_SELECT 4
#define CPL_DBLCLK 5
#define CPL_STOP 6
#define CPL_EXIT 7
#define CPL_NEWINQUIRE 8
#define CPL_STARTWPARMSA 9
#define CPL_STARTWPARMSW 10

type tagCPLINFO field = 1
	idIcon as long
	idName as long
	idInfo as long
	lData as LONG_PTR
end type

type CPLINFO as tagCPLINFO
type LPCPLINFO as tagCPLINFO ptr

type tagNEWCPLINFOA field = 1
	dwSize as DWORD
	dwFlags as DWORD
	dwHelpContext as DWORD
	lData as LONG_PTR
	hIcon as HICON
	szName(0 to 31) as CHAR
	szInfo(0 to 63) as CHAR
	szHelpFile(0 to 127) as CHAR
end type

type NEWCPLINFOA as tagNEWCPLINFOA
type LPNEWCPLINFOA as tagNEWCPLINFOA ptr

type tagNEWCPLINFOW field = 1
	dwSize as DWORD
	dwFlags as DWORD
	dwHelpContext as DWORD
	lData as LONG_PTR
	hIcon as HICON
	szName(0 to 31) as WCHAR
	szInfo(0 to 63) as WCHAR
	szHelpFile(0 to 127) as WCHAR
end type

type NEWCPLINFOW as tagNEWCPLINFOW
type LPNEWCPLINFOW as tagNEWCPLINFOW ptr

#ifdef UNICODE
	type NEWCPLINFO as NEWCPLINFOW
	type LPNEWCPLINFO as LPNEWCPLINFOW
#else
	type NEWCPLINFO as NEWCPLINFOA
	type LPNEWCPLINFO as LPNEWCPLINFOA
#endif

#define CPL_STARTWPARMS __MINGW_NAME_AW(CPL_STARTWPARMS)
#define CPL_SETUP 200

end extern
