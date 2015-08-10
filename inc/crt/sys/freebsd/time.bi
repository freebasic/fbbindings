'' FreeBASIC binding for FreeBSD-10.1-RELEASE
''
'' based on the C header files:
''   -
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
''    4. Neither the name of the University nor the names of its contributors
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
''    $FreeBSD: releng/10.1/sys/sys/time.h 270240 2014-08-20 18:40:29Z davide $
''
'' translated to FreeBASIC by:
''   Copyright © 2015 FreeBASIC development team

#pragma once

#include once "sys/_timeval.bi"
#include once "crt/sys/types.bi"
#include once "sys/timespec.bi"
#include once "crt/time.bi"
#include once "sys/select.bi"

extern "C"

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

type bintime
	sec as time_t
	frac as ulongint
end type

private sub bintime_addx(byval _bt as bintime ptr, byval _x as ulongint)
	dim _u as ulongint
	_u = _bt->frac
	_bt->frac += _x
	'' TODO: if (_u > _bt->frac) _bt->sec++;
end sub

private sub bintime_add(byval _bt as bintime ptr, byval _bt2 as const bintime ptr)
	dim _u as ulongint
	_u = _bt->frac
	_bt->frac += _bt2->frac
	'' TODO: if (_u > _bt->frac) _bt->sec++;
	_bt->sec += _bt2->sec
end sub

private sub bintime_sub(byval _bt as bintime ptr, byval _bt2 as const bintime ptr)
	dim _u as ulongint
	_u = _bt->frac
	_bt->frac -= _bt2->frac
	'' TODO: if (_u < _bt->frac) _bt->sec--;
	_bt->sec -= _bt2->sec
end sub

private sub bintime_mul(byval _bt as bintime ptr, byval _x as u_int)
	dim _p1 as ulongint
	dim _p2 as ulongint
	_p1 = (_bt->frac and &hffffffffull) * _x
	_p2 = ((_bt->frac shr 32) * _x) + (_p1 shr 32)
	_bt->sec *= _x
	_bt->sec += _p2 shr 32
	_bt->frac = (_p2 shl 32) or (_p1 and &hffffffffull)
end sub

private sub bintime_shift(byval _bt as bintime ptr, byval _exp as long)
	if _exp > 0 then
		_bt->sec shl= _exp
		_bt->sec or= _bt->frac shr (64 - _exp)
		_bt->frac shl= _exp
	elseif _exp < 0 then
		_bt->frac shr= -_exp
		_bt->frac or= culngint(_bt->sec) shl (64 + _exp)
		_bt->sec shr= -_exp
	end if
end sub

'' TODO: #define bintime_clear(a) ((a)->sec = (a)->frac = 0)
#define bintime_isset(a) ((a)->sec orelse (a)->frac)
'' TODO: #define bintime_cmp(a, b, cmp) (((a)->sec == (b)->sec) ? ((a)->frac cmp (b)->frac) : ((a)->sec cmp (b)->sec))
#define SBT_1S (cast(sbintime_t, 1) shl 32)
#define SBT_1M (SBT_1S * 60)
#define SBT_1MS (SBT_1S / 1000)
#define SBT_1US (SBT_1S / 1000000)
#define SBT_1NS (SBT_1S / 1000000000)
const SBT_MAX = &h7fffffffffffffff
#define sbintime_getsec(_sbt) clng((_sbt) shr 32)

private function bttosbt(byval _bt as const bintime) as sbintime_t
	return (cast(sbintime_t, _bt.sec) shl 32) + (_bt.frac shr 32)
end function

private function sbttobt(byval _sbt as sbintime_t) as bintime
	dim _bt as bintime
	_bt.sec = _sbt shr 32
	_bt.frac = _sbt shl 32
	return _bt
end function

private sub bintime2timespec(byval _bt as const bintime ptr, byval _ts as timespec ptr)
	_ts->tv_sec = _bt->sec
	_ts->tv_nsec = (culngint(1000000000) * culng(_bt->frac shr 32)) shr 32
end sub

private sub timespec2bintime(byval _ts as const timespec ptr, byval _bt as bintime ptr)
	_bt->sec = _ts->tv_sec
	_bt->frac = _ts->tv_nsec * culngint(18446744073ll)
end sub

private sub bintime2timeval(byval _bt as const bintime ptr, byval _tv as timeval ptr)
	_tv->tv_sec = _bt->sec
	_tv->tv_usec = (culngint(1000000) * culng(_bt->frac shr 32)) shr 32
end sub

private sub timeval2bintime(byval _tv as const timeval ptr, byval _bt as bintime ptr)
	_bt->sec = _tv->tv_sec
	_bt->frac = _tv->tv_usec * culngint(18446744073709ll)
end sub

private function sbttots(byval _sbt as sbintime_t) as timespec
	dim _ts as timespec
	_ts.tv_sec = _sbt shr 32
	_ts.tv_nsec = (culngint(1000000000) * culng(_sbt)) shr 32
	return _ts
end function

private function tstosbt(byval _ts as timespec) as sbintime_t
	return (cast(sbintime_t, _ts.tv_sec) shl 32) + ((_ts.tv_nsec * ((culngint(1) shl 63) / 500000000)) shr 32)
end function

private function sbttotv(byval _sbt as sbintime_t) as timeval
	dim _tv as timeval
	_tv.tv_sec = _sbt shr 32
	_tv.tv_usec = (culngint(1000000) * culng(_sbt)) shr 32
	return _tv
end function

private function tvtosbt(byval _tv as timeval) as sbintime_t
	return (cast(sbintime_t, _tv.tv_sec) shl 32) + ((_tv.tv_usec * ((culngint(1) shl 63) / 500000)) shr 32)
end function

'' TODO: #define timerclear(tvp) ((tvp)->tv_sec = (tvp)->tv_usec = 0)
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
	spare as long
	stathz as long
	profhz as long
end type

const CPUCLOCK_WHICH_PID = 0
const CPUCLOCK_WHICH_TID = 1
declare function setitimer(byval as long, byval as const itimerval ptr, byval as itimerval ptr) as long
declare function utimes(byval as const zstring ptr, byval as const timeval ptr) as long
declare function adjtime(byval as const timeval ptr, byval as timeval ptr) as long
declare function clock_getcpuclockid2(byval as id_t, byval as long, byval as clockid_t ptr) as long
declare function futimes(byval as long, byval as const timeval ptr) as long
declare function futimesat(byval as long, byval as const zstring ptr, byval as const timeval ptr) as long
declare function lutimes(byval as const zstring ptr, byval as const timeval ptr) as long
declare function settimeofday(byval as const timeval ptr, byval as const timezone ptr) as long
declare function getitimer(byval as long, byval as itimerval ptr) as long
declare function gettimeofday(byval as timeval ptr, byval as timezone ptr) as long

end extern
