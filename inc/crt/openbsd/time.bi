'' FreeBASIC binding for OpenBSD-5.7
''
'' based on the C header files:
''    Copyright (c) 1989 The Regents of the University of California.
''    All rights reserved.
''
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
''   	@(#)time.h	5.12 (Berkeley) 3/9/91
''
'' translated to FreeBASIC by:
''   Copyright © 2015 FreeBASIC development team

#pragma once

#include once "crt/long.bi"
#include once "sys/_types.bi"
#include once "sys/_time.bi"

extern "C"

const NULL = cptr(any ptr, 0)
const CLK_TCK = 100
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
declare function ctime(byval as const time_t ptr) as zstring ptr
declare function difftime(byval as time_t, byval as time_t) as double
declare function gmtime(byval as const time_t ptr) as tm ptr
declare function localtime(byval as const time_t ptr) as tm ptr
declare function mktime(byval as tm ptr) as time_t
'' TODO: size_t strftime(char *__restrict, size_t, const char *__restrict, const struct tm *__restrict) __attribute__ ((__bounded__(__string__,1,2)));
declare function time(byval as time_t ptr) as time_t
declare function strptime(byval as const zstring ptr, byval as const zstring ptr, byval as tm ptr) as zstring ptr
'' TODO: char *asctime_r(const struct tm *__restrict, char *__restrict) __attribute__ ((__bounded__(__minbytes__,2,26)));
'' TODO: char *ctime_r(const time_t *, char *) __attribute__ ((__bounded__(__minbytes__,2,26)));
declare function gmtime_r(byval as const time_t ptr, byval as tm ptr) as tm ptr
declare function localtime_r(byval as const time_t ptr, byval as tm ptr) as tm ptr
extern tzname(0 to 1) as zstring ptr
declare sub tzset()
declare function clock_getres(byval as clockid_t, byval as timespec ptr) as long
declare function clock_gettime(byval as clockid_t, byval as timespec ptr) as long
declare function clock_settime(byval as clockid_t, byval as const timespec ptr) as long
declare function nanosleep(byval as const timespec ptr, byval as timespec ptr) as long
declare function clock_getcpuclockid(byval as pid_t, byval as clockid_t ptr) as long
declare function timezone(byval as long, byval as long) as zstring ptr
declare sub tzsetwall()
declare function timelocal(byval as tm ptr) as time_t
declare function timegm(byval as tm ptr) as time_t
declare function timeoff(byval as tm ptr, byval as const clong) as time_t

end extern
