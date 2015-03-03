#pragma once

#include once "_mingw_unicode.bi"

#ifdef __FB_64BIT__
	extern "C"
#else
	extern "Windows"
#endif

#define _LZEXPAND_
#define LZERROR_BADINHANDLE (-1)
#define LZERROR_BADOUTHANDLE (-2)
#define LZERROR_READ (-3)
#define LZERROR_WRITE (-4)
#define LZERROR_GLOBALLOC (-5)
#define LZERROR_GLOBLOCK (-6)
#define LZERROR_BADVALUE (-7)
#define LZERROR_UNKNOWNALG (-8)

#ifdef UNICODE
	#define GetExpandedName GetExpandedNameW
	#define LZOpenFile LZOpenFileW
#else
	#define GetExpandedName GetExpandedNameA
	#define LZOpenFile LZOpenFileA
#endif

declare function LZStart() as INT
declare sub LZDone()
declare function CopyLZFile(byval as INT, byval as INT) as LONG
declare function LZCopy(byval as INT, byval as INT) as LONG
declare function LZInit(byval as INT) as INT
declare function GetExpandedNameA(byval as LPSTR, byval as LPSTR) as INT
declare function GetExpandedNameW(byval as LPWSTR, byval as LPWSTR) as INT
declare function LZOpenFileA(byval as LPSTR, byval as LPOFSTRUCT, byval as WORD) as INT
declare function LZOpenFileW(byval as LPWSTR, byval as LPOFSTRUCT, byval as WORD) as INT
declare function LZSeek(byval as INT, byval as LONG, byval as INT) as LONG
declare function LZRead(byval as INT, byval as LPSTR, byval as INT) as INT
declare sub LZClose(byval as INT)

end extern
