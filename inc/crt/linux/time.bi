'' FreeBASIC binding for glibc-2.21
''
'' based on the C header files:
''   Copyright (C) 1991-2015 Free Software Foundation, Inc.
''   This file is part of the GNU C Library.
''
''   The GNU C Library is free software; you can redistribute it and/or
''   modify it under the terms of the GNU Lesser General Public
''   License as published by the Free Software Foundation; either
''   version 2.1 of the License, or (at your option) any later version.
''
''   The GNU C Library is distributed in the hope that it will be useful,
''   but WITHOUT ANY WARRANTY; without even the implied warranty of
''   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
''   Lesser General Public License for more details.
''
''   You should have received a copy of the GNU Lesser General Public
''   License along with the GNU C Library; if not, see
''   <http://www.gnu.org/licenses/>.  
''
'' translated to FreeBASIC by:
''   Copyright © 2015 FreeBASIC development team

#pragma once

#include once "crt/long.bi"
#include once "crt/bits/types.bi"
#include once "crt/stddef.bi"
#include once "crt/bits/time.bi"
#include once "crt/xlocale.bi"

'' The following symbols have been renamed:
''     procedure time => time_

extern "C"

const __clock_t_defined = 1
type clock_t as __clock_t
const __time_t_defined = 1
type time_t as __time_t
const __clockid_t_defined = 1
type clockid_t as __clockid_t
#undef __clockid_time_t
const __timer_t_defined = 1
type timer_t as __timer_t
#undef __clockid_time_t
const __timespec_defined = 1

type timespec
	tv_sec as __time_t
	tv_nsec as __syscall_slong_t
end type

#undef __clockid_time_t
#undef __clockid_time_t
const _TIME_H = 1
#undef __clockid_time_t

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
	tm_gmtoff as clong
	tm_zone as const zstring ptr
end type

type itimerspec
	it_interval as timespec
	it_value as timespec
end type

const TIME_UTC = 1
declare function clock() as clock_t
declare function time_ alias "time"(byval __timer as time_t ptr) as time_t
declare function difftime(byval __time1 as time_t, byval __time0 as time_t) as double
declare function mktime(byval __tp as tm ptr) as time_t
declare function strftime(byval __s as zstring ptr, byval __maxsize as uinteger, byval __format as const zstring ptr, byval __tp as const tm ptr) as uinteger
declare function strptime(byval __s as const zstring ptr, byval __fmt as const zstring ptr, byval __tp as tm ptr) as zstring ptr
declare function strftime_l(byval __s as zstring ptr, byval __maxsize as uinteger, byval __format as const zstring ptr, byval __tp as const tm ptr, byval __loc as __locale_t) as uinteger
declare function strptime_l(byval __s as const zstring ptr, byval __fmt as const zstring ptr, byval __tp as tm ptr, byval __loc as __locale_t) as zstring ptr
declare function gmtime(byval __timer as const time_t ptr) as tm ptr
declare function localtime(byval __timer as const time_t ptr) as tm ptr
declare function gmtime_r(byval __timer as const time_t ptr, byval __tp as tm ptr) as tm ptr
declare function localtime_r(byval __timer as const time_t ptr, byval __tp as tm ptr) as tm ptr
declare function asctime(byval __tp as const tm ptr) as zstring ptr
declare function ctime(byval __timer as const time_t ptr) as zstring ptr
declare function asctime_r(byval __tp as const tm ptr, byval __buf as zstring ptr) as zstring ptr
declare function ctime_r(byval __timer as const time_t ptr, byval __buf as zstring ptr) as zstring ptr

extern __tzname(0 to 1) as zstring ptr
extern __daylight as long
extern __timezone as clong
extern tzname(0 to 1) as zstring ptr
declare sub tzset()
extern daylight as long
extern timezone as clong
declare function stime(byval __when as const time_t ptr) as long
#define __isleap(year) ((((year) mod 4) = 0) andalso ((((year) mod 100) <> 0) orelse (((year) mod 400) = 0)))

declare function timegm(byval __tp as tm ptr) as time_t
declare function timelocal(byval __tp as tm ptr) as time_t
declare function dysize(byval __year as long) as long
declare function nanosleep(byval __requested_time as const timespec ptr, byval __remaining as timespec ptr) as long
declare function clock_getres(byval __clock_id as clockid_t, byval __res as timespec ptr) as long
declare function clock_gettime(byval __clock_id as clockid_t, byval __tp as timespec ptr) as long
declare function clock_settime(byval __clock_id as clockid_t, byval __tp as const timespec ptr) as long
declare function clock_nanosleep(byval __clock_id as clockid_t, byval __flags as long, byval __req as const timespec ptr, byval __rem as timespec ptr) as long
declare function clock_getcpuclockid(byval __pid as pid_t, byval __clock_id as clockid_t ptr) as long
declare function timer_create(byval __clock_id as clockid_t, byval __evp as sigevent ptr, byval __timerid as timer_t ptr) as long
declare function timer_delete(byval __timerid as timer_t) as long
declare function timer_settime(byval __timerid as timer_t, byval __flags as long, byval __value as const itimerspec ptr, byval __ovalue as itimerspec ptr) as long
declare function timer_gettime(byval __timerid as timer_t, byval __value as itimerspec ptr) as long
declare function timer_getoverrun(byval __timerid as timer_t) as long
declare function timespec_get(byval __ts as timespec ptr, byval __base as long) as long
extern getdate_err as long
declare function getdate(byval __string as const zstring ptr) as tm ptr
declare function getdate_r(byval __string as const zstring ptr, byval __resbufp as tm ptr) as long

end extern
