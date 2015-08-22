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

#include once "crt/bits/types.bi"
#include once "crt/time.bi"
#include once "crt/bits/time.bi"
#include once "sys/select.bi"

extern "C"

const _SYS_TIME_H = 1
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

type __timezone_ptr_t as timezone ptr
declare function gettimeofday(byval __tv as timeval ptr, byval __tz as __timezone_ptr_t) as long
declare function settimeofday(byval __tv as const timeval ptr, byval __tz as const timezone ptr) as long
declare function adjtime(byval __delta as const timeval ptr, byval __olddelta as timeval ptr) as long

type __itimer_which as long
enum
	ITIMER_REAL = 0
	ITIMER_VIRTUAL = 1
	ITIMER_PROF = 2
end enum

#define ITIMER_REAL ITIMER_REAL
#define ITIMER_VIRTUAL ITIMER_VIRTUAL
#define ITIMER_PROF ITIMER_PROF

type itimerval
	it_interval as timeval
	it_value as timeval
end type

type __itimer_which_t as __itimer_which
declare function getitimer(byval __which as __itimer_which_t, byval __value as itimerval ptr) as long
declare function setitimer(byval __which as __itimer_which_t, byval __new as const itimerval ptr, byval __old as itimerval ptr) as long
declare function utimes(byval __file as const zstring ptr, byval __tvp as const timeval ptr) as long
declare function lutimes(byval __file as const zstring ptr, byval __tvp as const timeval ptr) as long
declare function futimes(byval __fd as long, byval __tvp as const timeval ptr) as long
declare function futimesat(byval __fd as long, byval __file as const zstring ptr, byval __tvp as const timeval ptr) as long
#define timerisset(tvp) ((tvp)->tv_sec orelse (tvp)->tv_usec)
'' TODO: # define timerclear(tvp) ((tvp)->tv_sec = (tvp)->tv_usec = 0)
'' TODO: # define timercmp(a, b, CMP) (((a)->tv_sec == (b)->tv_sec) ? ((a)->tv_usec CMP (b)->tv_usec) : ((a)->tv_sec CMP (b)->tv_sec))
#macro timeradd(a, b, result)
	scope
		(result)->tv_sec = (a)->tv_sec + (b)->tv_sec
		(result)->tv_usec = (a)->tv_usec + (b)->tv_usec
		if (result)->tv_usec >= 1000000 then
			'' TODO: ++(result)->tv_sec;
			(result)->tv_usec -= 1000000
		end if
	end scope
#endmacro
#macro timersub(a, b, result)
	scope
		(result)->tv_sec = (a)->tv_sec - (b)->tv_sec
		(result)->tv_usec = (a)->tv_usec - (b)->tv_usec
		if (result)->tv_usec < 0 then
			'' TODO: --(result)->tv_sec;
			(result)->tv_usec += 1000000
		end if
	end scope
#endmacro

end extern
