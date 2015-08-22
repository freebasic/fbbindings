'' FreeBASIC binding for glibc-2.21
''
'' based on the C header files:
''   Copyright (C) 1995-2015 Free Software Foundation, Inc.
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
#include once "crt/sys/types.bi"
#include once "crt/sys/time.bi"

extern "C"

const _BITS_TIMEX_H = 1

type timex
	modes as ulong
	offset as __syscall_slong_t
	freq as __syscall_slong_t
	maxerror as __syscall_slong_t
	esterror as __syscall_slong_t
	status as long
	constant as __syscall_slong_t
	precision as __syscall_slong_t
	tolerance as __syscall_slong_t
	time as timeval
	tick as __syscall_slong_t
	ppsfreq as __syscall_slong_t
	jitter as __syscall_slong_t
	shift as long
	stabil as __syscall_slong_t
	jitcnt as __syscall_slong_t
	calcnt as __syscall_slong_t
	errcnt as __syscall_slong_t
	stbcnt as __syscall_slong_t
	tai as long

	'' TODO: int :32;
	'' TODO: int :32;
	'' TODO: int :32;
	'' TODO: int :32;
	'' TODO: int :32;
	'' TODO: int :32;
	'' TODO: int :32;
	'' TODO: int :32;
	'' TODO: int :32;
	'' TODO: int :32;
	'' TODO: int :32;
end type

const ADJ_OFFSET = &h0001
const ADJ_FREQUENCY = &h0002
const ADJ_MAXERROR = &h0004
const ADJ_ESTERROR = &h0008
const ADJ_STATUS = &h0010
const ADJ_TIMECONST = &h0020
const ADJ_TAI = &h0080
const ADJ_MICRO = &h1000
const ADJ_NANO = &h2000
const ADJ_TICK = &h4000
const ADJ_OFFSET_SINGLESHOT = &h8001
const ADJ_OFFSET_SS_READ = &ha001
#define MOD_OFFSET ADJ_OFFSET
#define MOD_FREQUENCY ADJ_FREQUENCY
#define MOD_MAXERROR ADJ_MAXERROR
#define MOD_ESTERROR ADJ_ESTERROR
#define MOD_STATUS ADJ_STATUS
#define MOD_TIMECONST ADJ_TIMECONST
#define MOD_CLKB ADJ_TICK
#define MOD_CLKA ADJ_OFFSET_SINGLESHOT
#define MOD_TAI ADJ_TAI
#define MOD_MICRO ADJ_MICRO
#define MOD_NANO ADJ_NANO
const STA_PLL = &h0001
const STA_PPSFREQ = &h0002
const STA_PPSTIME = &h0004
const STA_FLL = &h0008
const STA_INS = &h0010
const STA_DEL = &h0020
const STA_UNSYNC = &h0040
const STA_FREQHOLD = &h0080
const STA_PPSSIGNAL = &h0100
const STA_PPSJITTER = &h0200
const STA_PPSWANDER = &h0400
const STA_PPSERROR = &h0800
const STA_CLOCKERR = &h1000
const STA_NANO = &h2000
const STA_MODE = &h4000
const STA_CLK = &h8000
#define STA_RONLY (((((((STA_PPSSIGNAL or STA_PPSJITTER) or STA_PPSWANDER) or STA_PPSERROR) or STA_CLOCKERR) or STA_NANO) or STA_MODE) or STA_CLK)
const _SYS_TIMEX_H = 1
const NTP_API = 4

type ntptimeval
	time as timeval
	maxerror as clong
	esterror as clong
	tai as clong
	__glibc_reserved1 as clong
	__glibc_reserved2 as clong
	__glibc_reserved3 as clong
	__glibc_reserved4 as clong
end type

const TIME_OK = 0
const TIME_INS = 1
const TIME_DEL = 2
const TIME_OOP = 3
const TIME_WAIT = 4
const TIME_ERROR = 5
#define TIME_BAD TIME_ERROR
const MAXTC = 6
declare function __adjtimex(byval __ntx as timex ptr) as long
declare function adjtimex(byval __ntx as timex ptr) as long
'' TODO: extern int ntp_gettime (struct ntptimeval *__ntv) __asm__ ("" "") __attribute__ ((__nothrow__));
declare function ntp_adjtime(byval __tntx as timex ptr) as long

end extern
