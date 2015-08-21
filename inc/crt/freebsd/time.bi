'' FreeBASIC binding for FreeBSD-10.1-RELEASE
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
#include once "crt/sys/types.bi"

'' The following symbols have been renamed:
''     procedure time => time_

extern "C"

type timeval
	tv_sec as time_t
	tv_usec as suseconds_t
end type

type timespec
	tv_sec as time_t
	tv_nsec as clong
end type

#macro TIMEVAL_TO_TIMESPEC(tv, ts)
	scope
		(ts)->tv_sec = (tv)->tv_sec
		(ts)->tv_nsec = (tv)->tv_usec * 1000
	end scope
#endmacro
#macro TIMESPEC_TO_TIMEVAL(tv, ts)
	scope
		(tv)->tv_sec = (ts)->tv_sec
		(tv)->tv_usec = (ts)->tv_nsec / 1000
	end scope
#endmacro

type itimerspec
	it_interval as timespec
	it_value as timespec
end type

const CLK_TCK = 128
const CLOCKS_PER_SEC = 128
const CLOCK_REALTIME = 0
const CLOCK_VIRTUAL = 1
const CLOCK_PROF = 2
const CLOCK_MONOTONIC = 4
const CLOCK_UPTIME = 5
const CLOCK_UPTIME_PRECISE = 7
const CLOCK_UPTIME_FAST = 8
const CLOCK_REALTIME_PRECISE = 9
const CLOCK_REALTIME_FAST = 10
const CLOCK_MONOTONIC_PRECISE = 11
const CLOCK_MONOTONIC_FAST = 12
const CLOCK_SECOND = 13
const CLOCK_THREAD_CPUTIME_ID = 14
const CLOCK_PROCESS_CPUTIME_ID = 15
const TIMER_RELTIME = &h0
const TIMER_ABSTIME = &h1

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

extern tzname(0 to ...) as zstring ptr
declare function asctime(byval as const tm ptr) as zstring ptr
declare function clock() as clock_t
declare function ctime(byval as const time_t ptr) as zstring ptr
declare function difftime(byval as time_t, byval as time_t) as double
declare function gmtime(byval as const time_t ptr) as tm ptr
declare function localtime(byval as const time_t ptr) as tm ptr
declare function mktime(byval as tm ptr) as time_t
declare function strftime(byval as zstring ptr, byval as uinteger, byval as const zstring ptr, byval as const tm ptr) as uinteger
declare function time_ alias "time"(byval as time_t ptr) as time_t
declare function timer_create(byval as clockid_t, byval as sigevent ptr, byval as timer_t ptr) as long
declare function timer_delete(byval as timer_t) as long
declare function timer_gettime(byval as timer_t, byval as itimerspec ptr) as long
declare function timer_getoverrun(byval as timer_t) as long
declare function timer_settime(byval as timer_t, byval as long, byval as const itimerspec ptr, byval as itimerspec ptr) as long
declare sub tzset()
declare function clock_getres(byval as clockid_t, byval as timespec ptr) as long
declare function clock_gettime(byval as clockid_t, byval as timespec ptr) as long
declare function clock_settime(byval as clockid_t, byval as const timespec ptr) as long
declare function nanosleep(byval as const timespec ptr, byval as timespec ptr) as long
declare function clock_getcpuclockid(byval as pid_t, byval as clockid_t ptr) as long
declare function asctime_r(byval as const tm ptr, byval as zstring ptr) as zstring ptr
declare function ctime_r(byval as const time_t ptr, byval as zstring ptr) as zstring ptr
declare function gmtime_r(byval as const time_t ptr, byval as tm ptr) as tm ptr
declare function localtime_r(byval as const time_t ptr, byval as tm ptr) as tm ptr
declare function strptime(byval as const zstring ptr, byval as const zstring ptr, byval as tm ptr) as zstring ptr
declare function timezone(byval as long, byval as long) as zstring ptr
declare sub tzsetwall()
declare function timelocal(byval as tm const ptr) as time_t
declare function timegm(byval as tm const ptr) as time_t

end extern
