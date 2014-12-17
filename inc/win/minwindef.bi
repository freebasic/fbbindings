#pragma once

#include once "_mingw.bi"
#include once "winapifamily.bi"

'' The following symbols have been renamed:
''     #define CONST => CONST_
''     typedef INT => INT_

#ifdef __FB_64BIT__
	extern "C"
#else
	extern "Windows"
#endif

#define _MINWINDEF_
#define STRICT 1
#define BASETYPES

type PULONG as ULONG ptr
type PUSHORT as USHORT ptr
type UCHAR as ubyte
type PUCHAR as UCHAR ptr
type PSZ as zstring ptr

#define MAX_PATH 260
#define NULL cptr(any ptr, 0)
#define FALSE 0
#define TRUE 1
#define _DEF_WINBOOL_

type WINBOOL as long
type BOOL as long
type PBOOL as WINBOOL ptr
type LPBOOL as WINBOOL ptr
type WORD as ushort
type DWORD as ulong
type FLOAT as single
type PFLOAT as FLOAT ptr
type PBYTE as UBYTE ptr
type LPBYTE as UBYTE ptr
type PINT as long ptr
type LPINT as long ptr
type PWORD as WORD ptr
type LPWORD as WORD ptr
type LPLONG as long ptr
type PDWORD as DWORD ptr
type LPDWORD as DWORD ptr
type LPVOID as any ptr

#define _LPCVOID_DEFINED

type LPCVOID as const any ptr
type INT_ as long
type UINT as ulong
type PUINT as ulong ptr
type WPARAM as UINT_PTR
type LPARAM as LONG_PTR
type LRESULT as LONG_PTR

#define max(a, b) iif((a) > (b), (a), (b))
#define min(a, b) iif((a) < (b), (a), (b))
#define MAKEWORD(a, b) cast(WORD, cast(UBYTE, cast(DWORD_PTR, (a)) and &hff) or (cast(WORD, cast(UBYTE, cast(DWORD_PTR, (b)) and &hff)) shl 8))
#define MAKELONG(a, b) cast(LONG, cast(WORD, cast(DWORD_PTR, (a)) and &hffff) or (cast(DWORD, cast(WORD, cast(DWORD_PTR, (b)) and &hffff)) shl 16))

type SPHANDLE as HANDLE ptr
type LPHANDLE as HANDLE ptr
type HGLOBAL as HANDLE
type HLOCAL as HANDLE
type GLOBALHANDLE as HANDLE
type LOCALHANDLE as HANDLE

#ifdef __FB_64BIT__
	type FARPROC as function() as INT_PTR
	type NEARPROC as function() as INT_PTR
	type PROC as function() as INT_PTR
#else
	type FARPROC as function() as long
	type NEARPROC as function() as long
	type PROC as function() as long
#endif

type ATOM as WORD
type HFILE as long

type HINSTANCE__
	unused as long
end type

type HINSTANCE as HINSTANCE__ ptr

type HKEY__
	unused as long
end type

type HKEY as HKEY__ ptr
type PHKEY as HKEY ptr

type HKL__
	unused as long
end type

type HKL as HKL__ ptr

type HLSURF__
	unused as long
end type

type HLSURF as HLSURF__ ptr

type HMETAFILE__
	unused as long
end type

type HMETAFILE as HMETAFILE__ ptr
type HMODULE as HINSTANCE

type HRGN__
	unused as long
end type

type HRGN as HRGN__ ptr

type HRSRC__
	unused as long
end type

type HRSRC as HRSRC__ ptr

type HSPRITE__
	unused as long
end type

type HSPRITE as HSPRITE__ ptr

type HSTR__
	unused as long
end type

type HSTR as HSTR__ ptr

type HTASK__
	unused as long
end type

type HTASK as HTASK__ ptr

type HWINSTA__
	unused as long
end type

type HWINSTA as HWINSTA__ ptr

type _FILETIME
	dwLowDateTime as DWORD
	dwHighDateTime as DWORD
end type

type FILETIME as _FILETIME
type PFILETIME as _FILETIME ptr
type LPFILETIME as _FILETIME ptr

#define _FILETIME_

end extern

#include once "winnt.bi"
