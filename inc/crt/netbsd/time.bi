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
#include once "sys/cdefs.bi"
#include once "sys/featuretest.bi"
#include once "machine/ansi.bi"
#include once "sys/null.bi"
#include once "sys/time.bi"

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
'' TODO: char *ctime(const time_t *) __asm("__ctime50");
'' TODO: double difftime(time_t, time_t) __asm("__difftime50");
'' TODO: struct tm *gmtime(const time_t *) __asm("__gmtime50");
'' TODO: struct tm *localtime(const time_t *) __asm("__locatime50");
'' TODO: time_t time(time_t *) __asm("__time50");
'' TODO: time_t mktime(struct tm *) __asm("__mktime50");
declare function strftime(byval as zstring ptr, byval as uinteger, byval as const zstring ptr, byval as const tm ptr) as uinteger
declare function __sysconf(byval as long) as clong
#define CLK_TCK __sysconf(39)
extern tzname(0 to 1) as zstring ptr
'' TODO: void tzset(void) __asm("__tzset50");
extern daylight as long
'' TODO: extern long int timezone __asm("__timezone13");
declare function strptime(byval as const zstring ptr, byval as const zstring ptr, byval as tm ptr) as zstring ptr
declare function getdate(byval as const zstring ptr) as tm ptr
extern getdate_err as long
'' TODO: int clock_getres(clockid_t, struct timespec *) __asm("__clock_getres50");
'' TODO: int clock_gettime(clockid_t, struct timespec *) __asm("__clock_gettime50");
'' TODO: int clock_settime(clockid_t, const struct timespec *) __asm("__clock_settime50");
'' TODO: int nanosleep(const struct timespec *, struct timespec *) __asm("__nanosleep50");
'' TODO: int timer_gettime(timer_t, struct itimerspec *) __asm("__timer_gettime50");
'' TODO: int timer_settime(timer_t, int, const struct itimerspec * restrict, struct itimerspec * restrict) __asm("__timer_settime50");

declare function timer_create(byval as clockid_t, byval as sigevent ptr, byval as timer_t ptr) as long
declare function timer_delete(byval as timer_t) as long
declare function timer_getoverrun(byval as timer_t) as long
declare function asctime_r(byval as const tm ptr, byval as zstring ptr) as zstring ptr

'' TODO: char *ctime_r(const time_t *, char *) __asm("__ctime_r50");
'' TODO: struct tm *gmtime_r(const time_t * restrict, struct tm * restrict) __asm("__gmtime_r50");
'' TODO: struct tm *localtime_r(const time_t * restrict, struct tm * restrict) __asm("__localtime_r50");
type timezone_t as __state ptr
'' TODO: time_t time2posix(time_t) __asm("__time2posix50");
'' TODO: time_t posix2time(time_t) __asm("__posix2time50");
'' TODO: time_t timegm(struct tm *) __asm("__timegm50");
'' TODO: time_t timeoff(struct tm *, long) __asm("__timeoff50");
'' TODO: time_t timelocal(struct tm *) __asm("__timelocal50");
'' TODO: struct tm *offtime(const time_t *, long) __asm("__offtime50");
'' TODO: void tzsetwall(void) __asm("__tzsetwall50");
'' TODO: struct tm *offtime_r(const time_t *, long, struct tm *) __asm("__offtime_r50");
'' TODO: struct tm *localtime_rz(const timezone_t, const time_t * restrict, struct tm * restrict) __asm("__localtime_rz50");
'' TODO: char *ctime_rz(const timezone_t, const time_t *, char *) __asm("__ctime_rz50");
'' TODO: time_t mktime_z(const timezone_t, struct tm *) __asm("__mktime_z50");
'' TODO: time_t timelocal_z(const timezone_t, struct tm *) __asm("__timelocal_z50");
'' TODO: time_t time2posix_z(const timezone_t, time_t) __asm("__time2posix_z50");
'' TODO: time_t posix2time_z(const timezone_t, time_t) __asm("__posix2time_z50");
'' TODO: timezone_t tzalloc(const char *) __asm("__tzalloc50");
'' TODO: void tzfree(const timezone_t) __asm("__tzfree50");
'' TODO: const char *tzgetname(const timezone_t, int) __asm("__tzgetname50");
declare function strftime_z(byval as const timezone_t, byval as zstring ptr, byval as uinteger, byval as const zstring ptr, byval as const tm ptr) as uinteger

end extern
