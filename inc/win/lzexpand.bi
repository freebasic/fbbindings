#pragma once

#include once "_mingw_unicode.bi"

extern "C"

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

extern     WINAPI as INT
dim shared WINAPI as INT

'' TODO: INT WINAPI LZStart(VOID);
'' TODO: VOID WINAPI LZDone(VOID);
'' TODO: LONG WINAPI CopyLZFile(INT,INT);
'' TODO: LONG WINAPI LZCopy(INT,INT);
'' TODO: INT WINAPI LZInit(INT);
'' TODO: INT WINAPI GetExpandedNameA(LPSTR,LPSTR);
'' TODO: INT WINAPI GetExpandedNameW(LPWSTR,LPWSTR);
'' TODO: INT WINAPI LZOpenFileA(LPSTR,LPOFSTRUCT,WORD);
'' TODO: INT WINAPI LZOpenFileW(LPWSTR,LPOFSTRUCT,WORD);
'' TODO: LONG WINAPI LZSeek(INT,LONG,INT);
'' TODO: INT WINAPI LZRead(INT,LPSTR,INT);
'' TODO: VOID WINAPI LZClose(INT);

end extern
