#pragma once

#include once "_mingw_unicode.bi"
#include once "vfwmsgs.bi"

extern "C"

#define __ERRORS__
#define AMOVIEAPI
#define VFW_FIRST_CODE &h200
#define MAX_ERROR_TEXT_LEN 160

'' TODO: typedef WINBOOL (WINAPI* AMGETERRORTEXTPROCA)(HRESULT,char*,DWORD);
'' TODO: typedef WINBOOL (WINAPI* AMGETERRORTEXTPROCW)(HRESULT,WCHAR*,DWORD);

#ifdef UNICODE
	type AMGETERRORTEXTPROC as AMGETERRORTEXTPROCW
#else
	type AMGETERRORTEXTPROC as AMGETERRORTEXTPROCA
#endif

extern     WINAPI as DWORD
dim shared WINAPI as DWORD

'' TODO: DWORD WINAPI AMGetErrorTextA(HRESULT,LPSTR,DWORD);
'' TODO: DWORD WINAPI AMGetErrorTextW(HRESULT,LPWSTR,DWORD);

#define AMGetErrorText __MINGW_NAME_AW(AMGetErrorText)

end extern
