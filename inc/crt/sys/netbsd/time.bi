'' FreeBASIC binding for NetBSD-6.1.5
''
'' based on the C header files:
''    Copyright (c) 1982, 1986, 1993
''   	The Regents of the University of California.  All rights reserved.
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
''   	@(#)time.h	8.5 (Berkeley) 5/4/95
''
'' translated to FreeBASIC by:
''   Copyright © 2015 FreeBASIC development team

#pragma once

#include once "crt/long.bi"
#include once "crt/sys/types.bi"
#include once "sys/select.bi"
#include once "crt/time.bi"

extern "C"

type timeval
	tv_sec as time_t
	tv_usec as suseconds_t
end type

type timespec_
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
		(tv)->tv_usec = cast(suseconds_t, (ts)->tv_nsec) / 1000
	end scope
#endmacro

type timezone
	tz_minuteswest as long
	tz_dsttime as long
end type

'' TODO: #define timerclear(tvp) (tvp)->tv_sec = (tvp)->tv_usec = 0L
#define timerisset(tvp) ((tvp)->tv_sec orelse (tvp)->tv_usec)
'' TODO: #define timercmp(tvp, uvp, cmp) (((tvp)->tv_sec == (uvp)->tv_sec) ? ((tvp)->tv_usec cmp (uvp)->tv_usec) : ((tvp)->tv_sec cmp (uvp)->tv_sec))
#macro timeradd(tvp, uvp, vvp)
	scope
		(vvp)->tv_sec = (tvp)->tv_sec + (uvp)->tv_sec
		(vvp)->tv_usec = (tvp)->tv_usec + (uvp)->tv_usec
		if (vvp)->tv_usec >= 1000000 then
			'' TODO: (vvp)->tv_sec++;
			(vvp)->tv_usec -= 1000000
		end if
	end scope
#endmacro
#macro timersub(tvp, uvp, vvp)
	scope
		(vvp)->tv_sec = (tvp)->tv_sec - (uvp)->tv_sec
		(vvp)->tv_usec = (tvp)->tv_usec - (uvp)->tv_usec
		if (vvp)->tv_usec < 0 then
			'' TODO: (vvp)->tv_sec--;
			(vvp)->tv_usec += 1000000
		end if
	end scope
#endmacro

type bintime
	sec as time_t
	frac as __uint64_t
end type

private sub bintime_addx(byval bt as bintime ptr, byval x as __uint64_t)
	dim u as __uint64_t
	u = bt->frac
	bt->frac += x
	'' TODO: if (u > bt->frac) bt->sec++;
end sub

private sub bintime_add(byval bt as bintime ptr, byval bt2 as const bintime ptr)
	dim u as __uint64_t
	u = bt->frac
	bt->frac += bt2->frac
	'' TODO: if (u > bt->frac) bt->sec++;
	bt->sec += bt2->sec
end sub

private sub bintime_sub(byval bt as bintime ptr, byval bt2 as const bintime ptr)
	dim u as __uint64_t
	u = bt->frac
	bt->frac -= bt2->frac
	'' TODO: if (u < bt->frac) bt->sec--;
	bt->sec -= bt2->sec
end sub

private sub bintime2timespec(byval bt as const bintime ptr, byval ts as timespec ptr)
	ts->tv_sec = bt->sec
	ts->tv_nsec = cast(clong, (cast(__uint64_t, 1000000000) * cast(__uint32_t, bt->frac shr 32)) shr 32)
end sub

private sub timespec2bintime(byval ts as const timespec ptr, byval bt as bintime ptr)
	bt->sec = ts->tv_sec
	bt->frac = ts->tv_nsec * cast(__uint64_t, 18446744073ll)
end sub

private sub bintime2timeval(byval bt as const bintime ptr, byval tv as timeval ptr)
	tv->tv_sec = bt->sec
	tv->tv_usec = cast(suseconds_t, (cast(__uint64_t, 1000000) * cast(__uint32_t, bt->frac shr 32)) shr 32)
end sub

private sub timeval2bintime(byval tv as const timeval ptr, byval bt as bintime ptr)
	bt->sec = tv->tv_sec
	bt->frac = tv->tv_usec * cast(__uint64_t, 18446744073709ll)
end sub

'' TODO: #define timespecclear(tsp) (tsp)->tv_sec = (time_t)((tsp)->tv_nsec = 0L)
#define timespecisset(tsp) ((tsp)->tv_sec orelse (tsp)->tv_nsec)
'' TODO: #define timespeccmp(tsp, usp, cmp) (((tsp)->tv_sec == (usp)->tv_sec) ? ((tsp)->tv_nsec cmp (usp)->tv_nsec) : ((tsp)->tv_sec cmp (usp)->tv_sec))
#macro timespecadd(tsp, usp, vsp)
	scope
		(vsp)->tv_sec = (tsp)->tv_sec + (usp)->tv_sec
		(vsp)->tv_nsec = (tsp)->tv_nsec + (usp)->tv_nsec
		if (vsp)->tv_nsec >= cast(clong, 1000000000) then
			'' TODO: (vsp)->tv_sec++;
			(vsp)->tv_nsec -= cast(clong, 1000000000)
		end if
	end scope
#endmacro
#macro timespecsub(tsp, usp, vsp)
	scope
		(vsp)->tv_sec = (tsp)->tv_sec - (usp)->tv_sec
		(vsp)->tv_nsec = (tsp)->tv_nsec - (usp)->tv_nsec
		if (vsp)->tv_nsec < 0 then
			'' TODO: (vsp)->tv_sec--;
			(vsp)->tv_nsec += cast(clong, 1000000000)
		end if
	end scope
#endmacro
#define timespec2ns(x) ((culngint((x)->tv_sec) * cast(clong, 1000000000)) + (x)->tv_nsec)
const ITIMER_REAL = 0
const ITIMER_VIRTUAL = 1
const ITIMER_PROF = 2
const ITIMER_MONOTONIC = 3

type itimerval
	it_interval as timeval
	it_value as timeval
end type

type itimerspec
	it_interval as timespec
	it_value as timespec
end type

const CLOCK_REALTIME = 0
const CLOCK_VIRTUAL = 1
const CLOCK_PROF = 2
const CLOCK_MONOTONIC = 3
const TIMER_RELTIME = &h0
const TIMER_ABSTIME = &h1

declare function getitimer alias "__getitimer50"(byval as long, byval as itimerval ptr) as long
declare function gettimeofday alias "__gettimeofday50"(byval as timeval ptr, byval as any ptr) as long
declare function setitimer alias "__setitimer50"(byval as long, byval as const itimerval ptr, byval as itimerval ptr) as long
declare function utimes alias "__utimes50"(byval as const zstring ptr, byval as const timeval ptr) as long
declare function adjtime alias "__adjtime50"(byval as const timeval ptr, byval as timeval ptr) as long
declare function futimes alias "__futimes50"(byval as long, byval as const timeval ptr) as long
declare function lutimes alias "__lutimes50"(byval as const zstring ptr, byval as const timeval ptr) as long
declare function settimeofday alias "__settimeofday50"(byval as const timeval ptr, byval as const any ptr) as long

end extern
