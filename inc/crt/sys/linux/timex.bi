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
#include once "sys/time.bi"
#include once "bits/timex.bi"

extern "C"

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
