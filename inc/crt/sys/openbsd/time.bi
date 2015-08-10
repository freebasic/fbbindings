'' FreeBASIC binding for OpenBSD-5.7
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
''   	@(#)time.h	8.2 (Berkeley) 7/10/94
''
'' translated to FreeBASIC by:
''   Copyright © 2015 FreeBASIC development team

#pragma once

#include once "crt/long.bi"
#include once "crt/sys/types.bi"
#include once "crt/time.bi"

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

type timezone
	tz_minuteswest as long
	tz_dsttime as long
end type

const DST_NONE = 0
const DST_USA = 1
const DST_AUST = 2
const DST_WET = 3
const DST_MET = 4
const DST_EET = 5
const DST_CAN = 6
'' TODO: #define timerclear(tvp) (tvp)->tv_sec = (tvp)->tv_usec = 0
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
'' TODO: #define timespecclear(tsp) (tsp)->tv_sec = (tsp)->tv_nsec = 0
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
const ITIMER_REAL = 0
const ITIMER_VIRTUAL = 1
const ITIMER_PROF = 2

type itimerval
	it_interval as timeval
	it_value as timeval
end type

type clockinfo
	hz as long
	tick as long
	tickadj as long
	stathz as long
	profhz as long
end type

const CLOCK_REALTIME = 0
const CLOCK_PROCESS_CPUTIME_ID = 2
const CLOCK_MONOTONIC = 3
const CLOCK_THREAD_CPUTIME_ID = 4
const CLOCK_UPTIME = 5
const __CLOCK_USE_TICKET_LOCKS = 8
#define __CLOCK_ENCODE(type, id) ((type) or ((id) shl 12))
#define __CLOCK_TYPE(c) ((c) and &hfff)
#define __CLOCK_PTID(c) (((c) shr 12) and &hfffff)

type itimerspec
	it_interval as timespec
	it_value as timespec
end type

const TIMER_RELTIME = &h0
const TIMER_ABSTIME = &h1
declare function adjtime(byval as const timeval ptr, byval as timeval ptr) as long
declare function adjfreq(byval as const longint ptr, byval as longint ptr) as long
declare function futimes(byval as long, byval as const timeval ptr) as long
declare function getitimer(byval as long, byval as itimerval ptr) as long
declare function gettimeofday(byval as timeval ptr, byval as timezone ptr) as long
declare function setitimer(byval as long, byval as const itimerval ptr, byval as itimerval ptr) as long
declare function settimeofday(byval as const timeval ptr, byval as const timezone ptr) as long
declare function utimes(byval as const zstring ptr, byval as const timeval ptr) as long

end extern
