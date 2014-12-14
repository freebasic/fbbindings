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
#define GetExpandedName __MINGW_NAME_AW(GetExpandedName)
#define LZOpenFile __MINGW_NAME_AW(LZOpenFile)

declare function LZStart() as INT_
declare sub LZDone()
declare function CopyLZFile(byval as INT_, byval as INT_) as LONG
declare function LZCopy(byval as INT_, byval as INT_) as LONG
declare function LZInit(byval as INT_) as INT_
declare function GetExpandedNameA(byval as LPSTR, byval as LPSTR) as INT_
declare function GetExpandedNameW(byval as LPWSTR, byval as LPWSTR) as INT_
declare function LZOpenFileA(byval as LPSTR, byval as LPOFSTRUCT, byval as WORD) as INT_
declare function LZOpenFileW(byval as LPWSTR, byval as LPOFSTRUCT, byval as WORD) as INT_
declare function LZSeek(byval as INT_, byval as LONG, byval as INT_) as LONG
declare function LZRead(byval as INT_, byval as LPSTR, byval as INT_) as INT_
declare sub LZClose(byval as INT_)

end extern
