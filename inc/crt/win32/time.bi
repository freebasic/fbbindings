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

#include once "crtdefs.bi"
#include once "sec_api/sys/timeb_s.bi"
#include once "pthread_time.bi"

'' The following symbols have been renamed:
''     procedure time => time_
''     #define time => time_

extern "C"

'' TODO: #pragma pack(push,_CRT_PACKING)
type clock_t as long
#ifndef NULL
	const NULL = 0
#endif

type tm
	tm_sec as long
	tm_min as long
	tm_hour as long
	tm_mday as long
	tm_mon as long
	tm_year as long
	tm_wday as long
	tm_yday as long
	tm_isdst as long
end type

const CLOCKS_PER_SEC = 1000
extern import _daylight as long
extern import _dstbias as long
extern import _timezone as long
extern import _tzname(0 to 1) as zstring ptr

declare function _get_daylight(byval _Daylight as long ptr) as errno_t
declare function _get_dstbias(byval _Daylight_savings_bias as long ptr) as errno_t
declare function _get_timezone(byval _Timezone as long ptr) as errno_t
declare function _get_tzname(byval _ReturnValue as uinteger ptr, byval _Buffer as zstring ptr, byval _SizeInBytes as uinteger, byval _Index as long) as errno_t
declare function asctime(byval _Tm as const tm ptr) as zstring ptr
declare function asctime_s(byval _Buf as zstring ptr, byval _SizeInWords as uinteger, byval _Tm as const tm ptr) as errno_t
declare function _ctime32(byval _Time as const __time32_t ptr) as zstring ptr
declare function _ctime32_s(byval _Buf as zstring ptr, byval _SizeInBytes as uinteger, byval _Time as const __time32_t ptr) as errno_t
declare function clock() as clock_t
declare function _difftime32(byval _Time1 as __time32_t, byval _Time2 as __time32_t) as double
declare function _gmtime32(byval _Time as const __time32_t ptr) as tm ptr
declare function _gmtime32_s(byval _Tm as tm ptr, byval _Time as const __time32_t ptr) as errno_t
declare function _localtime32(byval _Time as const __time32_t ptr) as tm ptr
declare function _localtime32_s(byval _Tm as tm ptr, byval _Time as const __time32_t ptr) as errno_t
declare function strftime(byval _Buf as zstring ptr, byval _SizeInBytes as uinteger, byval _Format as const zstring ptr, byval _Tm as const tm ptr) as uinteger
declare function _strftime_l(byval _Buf as zstring ptr, byval _Max_size as uinteger, byval _Format as const zstring ptr, byval _Tm as const tm ptr, byval _Locale as _locale_t) as uinteger
declare function _strdate(byval _Buffer as zstring ptr) as zstring ptr
declare function _strdate_s(byval _Buf as zstring ptr, byval _SizeInBytes as uinteger) as errno_t
declare function _strtime(byval _Buffer as zstring ptr) as zstring ptr
declare function _strtime_s(byval _Buf as zstring ptr, byval _SizeInBytes as uinteger) as errno_t
declare function _time32(byval _Time as __time32_t ptr) as __time32_t
declare function _mktime32(byval _Tm as tm ptr) as __time32_t
declare function _mkgmtime32(byval _Tm as tm ptr) as __time32_t
declare sub tzset()
declare sub _tzset()
declare function _difftime64(byval _Time1 as __time64_t, byval _Time2 as __time64_t) as double
declare function _ctime64(byval _Time as const __time64_t ptr) as zstring ptr
declare function _ctime64_s(byval _Buf as zstring ptr, byval _SizeInBytes as uinteger, byval _Time as const __time64_t ptr) as errno_t
declare function _gmtime64(byval _Time as const __time64_t ptr) as tm ptr
declare function _gmtime64_s(byval _Tm as tm ptr, byval _Time as const __time64_t ptr) as errno_t
declare function _localtime64(byval _Time as const __time64_t ptr) as tm ptr
declare function _localtime64_s(byval _Tm as tm ptr, byval _Time as const __time64_t ptr) as errno_t
declare function _mktime64(byval _Tm as tm ptr) as __time64_t
declare function _mkgmtime64(byval _Tm as tm ptr) as __time64_t
declare function _time64(byval _Time as __time64_t ptr) as __time64_t
declare function _getsystime(byval _Tm as tm ptr) as ulong
declare function _setsystime(byval _Tm as tm ptr, byval _MilliSec as ulong) as ulong
declare function _wasctime(byval _Tm as const tm ptr) as wstring ptr
declare function _wasctime_s(byval _Buf as wstring ptr, byval _SizeInWords as uinteger, byval _Tm as const tm ptr) as errno_t
declare function _wctime32(byval _Time as const __time32_t ptr) as wstring ptr
declare function _wctime32_s(byval _Buf as wstring ptr, byval _SizeInWords as uinteger, byval _Time as const __time32_t ptr) as errno_t
declare function wcsftime(byval _Buf as wstring ptr, byval _SizeInWords as uinteger, byval _Format as const wstring ptr, byval _Tm as const tm ptr) as uinteger
declare function _wcsftime_l(byval _Buf as wstring ptr, byval _SizeInWords as uinteger, byval _Format as const wstring ptr, byval _Tm as const tm ptr, byval _Locale as _locale_t) as uinteger
declare function _wstrdate(byval _Buffer as wstring ptr) as wstring ptr
declare function _wstrdate_s(byval _Buf as wstring ptr, byval _SizeInWords as uinteger) as errno_t
declare function _wstrtime(byval _Buffer as wstring ptr) as wstring ptr
declare function _wstrtime_s(byval _Buf as wstring ptr, byval _SizeInWords as uinteger) as errno_t
declare function _wctime64(byval _Time as const __time64_t ptr) as wstring ptr
declare function _wctime64_s(byval _Buf as wstring ptr, byval _SizeInWords as uinteger, byval _Time as const __time64_t ptr) as errno_t
declare function _wctime(byval as const time_t ptr) as wstring ptr

#ifdef __FB_64BIT__
	#define _wctime(_Time) cptr(wstring ptr, _wctime64((_Time)))
#else
	#define _wctime(_Time) cptr(wstring ptr, _wctime32((_Time)))
#endif

declare function _wctime_s(byval as wstring ptr, byval as uinteger, byval as const time_t ptr) as errno_t

#ifdef __FB_64BIT__
	#define _wctime_s(_Buffer, _SizeInWords, _Time) cast(errno_t, _wctime64_s((_Buffer), (_SizeInWords), (_Time)))
#else
	#define _wctime_s(_Buffer, _SizeInWords, _Time) cast(errno_t, _wctime32_s((_Buffer), (_SizeInWords), (_Time)))
#endif

declare function difftime(byval _Time1 as time_t, byval _Time2 as time_t) as double
declare function ctime(byval _Time as const time_t ptr) as zstring ptr
declare function gmtime(byval _Time as const time_t ptr) as tm ptr
declare function localtime(byval _Time as const time_t ptr) as tm ptr
declare function mktime(byval _Tm as tm ptr) as time_t
declare function _mkgmtime(byval _Tm as tm ptr) as time_t
declare function time_ alias "time"(byval _Time as time_t ptr) as time_t

#ifdef __FB_64BIT__
	#define difftime(_Time1, _Time2) cdbl(_difftime64((_Time1), (_Time2)))
	#define ctime(_Time) cptr(zstring ptr, _ctime64((_Time)))
	#define gmtime(_Time) cptr(tm ptr, _gmtime64((_Time)))
	#define localtime(_Time) cptr(tm ptr, _localtime64((_Time)))
	#define mktime(_Tm) cast(time_t, _mktime64((_Tm)))
	#define _mkgmtime(_Tm) cast(time_t, _mkgmtime64((_Tm)))
	#define time_(_Time) cast(time_t, _time64((_Time)))
	#define localtime_s(_Tm, _Time) cast(errno_t, _localtime64_s((_Tm), (_Time)))
	#define gmtime_s(_Tm, _Time) cast(errno_t, _gmtime64_s((_Tm), (_Time)))
	#define ctime_s(_Buf, _SizeInBytes, _Time) cast(errno_t, _ctime64_s((_Buf), (_SizeInBytes), (_Time)))
#else
	#define difftime(_Time1, _Time2) cdbl(_difftime32((_Time1), (_Time2)))
	#define ctime(_Time) cptr(zstring ptr, _ctime32((_Time)))
	#define localtime(_Time) cptr(tm ptr, _localtime32((_Time)))
	#define mktime(_Tm) cast(time_t, _mktime32((_Tm)))
	#define gmtime(_Time) cptr(tm ptr, _gmtime32((_Time)))
	#define _mkgmtime(_Tm) cast(time_t, _mkgmtime32((_Tm)))
	#define time_(_Time) cast(time_t, _time32((_Time)))
	#define localtime_s(_Tm, _Time) cast(errno_t, _localtime32_s((_Tm), (_Time)))
	#define gmtime_s(_Tm, _Time) cast(errno_t, _gmtime32_s((_Tm), (_Time)))
	#define ctime_s(_Buf, _SizeInBytes, _Time) cast(errno_t, _ctime32_s((_Buf), (_SizeInBytes), (_Time)))
#endif

#define CLK_TCK CLOCKS_PER_SEC
extern import daylight as long
extern import timezone as long
extern import tzname(0 to 1) as zstring ptr
declare sub tzset()

type timeval
	tv_sec as long
	tv_usec as long
end type

#define timerisset(tvp) ((tvp)->tv_sec orelse (tvp)->tv_usec)
'' TODO: #define timercmp(tvp,uvp,cmp) ((tvp)->tv_sec cmp (uvp)->tv_sec || ((tvp)->tv_sec == (uvp)->tv_sec && (tvp)->tv_usec cmp (uvp)->tv_usec))
'' TODO: #define timerclear(tvp) (tvp)->tv_sec = (tvp)->tv_usec = 0

type timezone
	tz_minuteswest as long
	tz_dsttime as long
end type

declare function mingw_gettimeofday(byval p as timeval ptr, byval z as timezone ptr) as long
'' TODO: #pragma pack(push,_CRT_PACKING)

type __timeb32
	time as __time32_t
	millitm as ushort
	timezone as short
	dstflag as short
end type

type timeb
	time as time_t
	millitm as ushort
	timezone as short
	dstflag as short
end type

type __timeb64
	time as __time64_t
	millitm as ushort
	timezone as short
	dstflag as short
end type

declare sub _ftime64(byval _Time as __timeb64 ptr)

#ifdef __FB_64BIT__
	#define _timeb __timeb64
	declare sub _ftime(byval as __timeb64 ptr)
	#define ftime(_Tmb) _ftime64(cptr(__timeb64 ptr, _Tmb))
#else
	#define _timeb __timeb32
	declare sub _ftime(byval as __timeb32 ptr)
	#define ftime(_Tmb) _ftime(cptr(__timeb32 ptr, _Tmb))
#endif

end extern
