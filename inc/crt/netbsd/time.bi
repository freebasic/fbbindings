'' FreeBASIC binding for NetBSD-6.1.5
''
'' based on the C header files:
''    Copyright (c) 1989, 1993
''   	The Regents of the University of California.  All rights reserved.
''    (c) UNIX System Laboratories, Inc.
''    All or some portions of this file are derived from material licensed
''    to the University of California by American Telephone and Telegraph
''    Co. or Unix System Laboratories, Inc. and are reproduced herein with
''    the permission of UNIX System Laboratories, Inc.
''
''    Redistribution and use in source and binary forms, with or without
''    modification, are permitted provided that the following conditions
''    are met:
''    1. Redistributions of source code must retain the above copyright
''       notice, this list of conditions and the following disclaimer.
''    2. Redistributions in binary form must reproduce the above copyright
''       notice, this list of conditions and the following disclaimer in the
''       documentation and/or other materials provided with the distribution.
''    3. Neither the name of the University nor the names of its contributors
''       may be used to endorse or promote products derived from this software
''       without specific prior written permission.
''
''    THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
''    ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
''    IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
''    ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
''    FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
''    DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
''    OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
''    HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
''    LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
''    OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
''    SUCH DAMAGE.
''
''   	@(#)time.h	8.3 (Berkeley) 1/21/94
''
'' translated to FreeBASIC by:
''   Copyright © 2015 FreeBASIC development team

#pragma once

#include once "crt/long.bi"
#include once "crt/sys/time.bi"

'' The following symbols have been renamed:
''     procedure __time50 => time_

extern "C"

const CLOCKS_PER_SEC = 100

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
	tm_zone as zstring ptr
end type

declare function asctime(byval as const tm ptr) as zstring ptr
declare function clock() as clock_t
declare function ctime alias "__ctime50"(byval as const time_t ptr) as zstring ptr
declare function difftime alias "__difftime50"(byval as time_t, byval as time_t) as double
declare function gmtime alias "__gmtime50"(byval as const time_t ptr) as tm ptr
declare function localtime alias "__locatime50"(byval as const time_t ptr) as tm ptr
declare function time_ alias "__time50"(byval as time_t ptr) as time_t
declare function mktime alias "__mktime50"(byval as tm ptr) as time_t
declare function strftime(byval as zstring ptr, byval as uinteger, byval as const zstring ptr, byval as const tm ptr) as uinteger
declare function __sysconf(byval as long) as clong
#define CLK_TCK __sysconf(39)
extern tzname(0 to 1) as zstring ptr
declare sub tzset alias "__tzset50"()
extern daylight as long
extern timezone alias "__timezone13" as clong
declare function strptime(byval as const zstring ptr, byval as const zstring ptr, byval as tm ptr) as zstring ptr
declare function getdate(byval as const zstring ptr) as tm ptr
extern getdate_err as long
declare function clock_getres alias "__clock_getres50"(byval as clockid_t, byval as timespec ptr) as long
declare function clock_gettime alias "__clock_gettime50"(byval as clockid_t, byval as timespec ptr) as long
declare function clock_settime alias "__clock_settime50"(byval as clockid_t, byval as const timespec ptr) as long
declare function nanosleep alias "__nanosleep50"(byval as const timespec ptr, byval as timespec ptr) as long
declare function timer_gettime alias "__timer_gettime50"(byval as timer_t, byval as itimerspec ptr) as long
declare function timer_settime alias "__timer_settime50"(byval as timer_t, byval as long, byval as const itimerspec ptr, byval as itimerspec ptr) as long
declare function timer_create(byval as clockid_t, byval as sigevent ptr, byval as timer_t ptr) as long
declare function timer_delete(byval as timer_t) as long
declare function timer_getoverrun(byval as timer_t) as long
declare function asctime_r(byval as const tm ptr, byval as zstring ptr) as zstring ptr
declare function ctime_r alias "__ctime_r50"(byval as const time_t ptr, byval as zstring ptr) as zstring ptr
declare function gmtime_r alias "__gmtime_r50"(byval as const time_t ptr, byval as tm ptr) as tm ptr
declare function localtime_r alias "__localtime_r50"(byval as const time_t ptr, byval as tm ptr) as tm ptr
type timezone_t as __state ptr
declare function time2posix alias "__time2posix50"(byval as time_t) as time_t
declare function posix2time alias "__posix2time50"(byval as time_t) as time_t
declare function timegm alias "__timegm50"(byval as tm ptr) as time_t
declare function timeoff alias "__timeoff50"(byval as tm ptr, byval as clong) as time_t
declare function timelocal alias "__timelocal50"(byval as tm ptr) as time_t
declare function offtime alias "__offtime50"(byval as const time_t ptr, byval as clong) as tm ptr
declare sub tzsetwall alias "__tzsetwall50"()
declare function offtime_r alias "__offtime_r50"(byval as const time_t ptr, byval as clong, byval as tm ptr) as tm ptr
declare function localtime_rz alias "__localtime_rz50"(byval as const timezone_t, byval as const time_t ptr, byval as tm ptr) as tm ptr
declare function ctime_rz alias "__ctime_rz50"(byval as const timezone_t, byval as const time_t ptr, byval as zstring ptr) as zstring ptr
declare function mktime_z alias "__mktime_z50"(byval as const timezone_t, byval as tm ptr) as time_t
declare function timelocal_z alias "__timelocal_z50"(byval as const timezone_t, byval as tm ptr) as time_t
declare function time2posix_z alias "__time2posix_z50"(byval as const timezone_t, byval as time_t) as time_t
declare function posix2time_z alias "__posix2time_z50"(byval as const timezone_t, byval as time_t) as time_t
declare function tzalloc alias "__tzalloc50"(byval as const zstring ptr) as timezone_t
declare sub tzfree alias "__tzfree50"(byval as const timezone_t)
declare function tzgetname alias "__tzgetname50"(byval as const timezone_t, byval as long) as const zstring ptr
declare function strftime_z(byval as const timezone_t, byval as zstring ptr, byval as uinteger, byval as const zstring ptr, byval as const tm ptr) as uinteger

end extern
