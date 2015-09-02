#pragma once

#include once "win/ole2.bi"
#include once "win/objbase.bi"
#include once "crt/time.bi"

extern "C"

#define CONVERT_H_INCLUDED
declare function ConvertFileTimeToVariantTime(byval pft as FILETIME ptr, byval pDate as DATE_ ptr) as HRESULT
declare function ConvertVariantTimeToFileTime(byval date as DATE_, byval pft as FILETIME ptr) as HRESULT
declare function ConvertVariantTimeToSystemTime(byval date as DATE_, byval pSystemTime as SYSTEMTIME ptr) as HRESULT
declare function ConvertSystemTimeToVariantTime(byval pSystemTime as SYSTEMTIME ptr, byval pDate as DATE_ ptr) as HRESULT
declare function ConvertTimeTToVariantTime(byval timeT as time_t, byval pDate as DATE_ ptr) as HRESULT
declare function ConvertVariantTimeToTimeT(byval date as DATE_, byval pTimeT as time_t ptr) as HRESULT
declare function ConvertAnsiStrToBStr(byval szAnsiIn as LPCSTR, byval lpBstrOut as BSTR ptr) as HRESULT
declare function ConvertBStrToAnsiStr(byval bstrIn as BSTR, byval lpszOut as LPSTR ptr) as HRESULT

end extern
