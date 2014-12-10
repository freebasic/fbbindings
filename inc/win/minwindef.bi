#pragma once

#include once "crt/long.bi"
#include once "_mingw.bi"
#include once "winapifamily.bi"
#include once "specstrings.bi"
#include once "winnt.bi"

'' The following symbols have been renamed:
''     typedef ULONG => ULONG_
''     typedef USHORT => USHORT_
''     typedef BYTE => BYTE_
''     typedef INT => INT_
''     #define min => min_
''     #define LOWORD => LOWORD_
''     #define HIWORD => HIWORD_
''     #define LOBYTE => LOBYTE_
''     #define HIBYTE => HIBYTE_

#ifdef __FB_64BIT__
	extern "C"
#else
	extern "Windows"
#endif

type ULONG_ as culong

#define _MINWINDEF_
#define STRICT 1
#define BASETYPES

type PULONG as ULONG_ ptr
type USHORT_ as ushort
type PUSHORT as USHORT_ ptr
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
type BYTE_ as ubyte
type WORD as ushort
type DWORD as culong
type FLOAT as single
type PFLOAT as FLOAT ptr
type PBYTE as BYTE_ ptr
type LPBYTE as BYTE_ ptr
type PINT as long ptr
type LPINT as long ptr
type PWORD as WORD ptr
type LPWORD as WORD ptr
type LPLONG as clong ptr
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
#define min_(a, b) iif((a) < (b), (a), (b))
#define MAKEWORD(a, b) cast(WORD, cast(BYTE_, cast(DWORD_PTR, (a)) and &hff) or (cast(WORD, cast(BYTE_, cast(DWORD_PTR, (b)) and &hff)) shl 8))
#define MAKELONG(a, b) cast(LONG_, cast(WORD, cast(DWORD_PTR, (a)) and &hffff) or (cast(DWORD, cast(WORD, cast(DWORD_PTR, (b)) and &hffff)) shl 16))
#define LOWORD_(l) cast(WORD, cast(DWORD_PTR, (l)) and &hffff)
#define HIWORD_(l) cast(WORD, (cast(DWORD_PTR, (l)) shr 16) and &hffff)
#define LOBYTE_(w) cast(BYTE_, cast(DWORD_PTR, (w)) and &hff)
#define HIBYTE_(w) cast(BYTE_, (cast(DWORD_PTR, (w)) shr 8) and &hff)

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
