'' FreeBASIC binding for glibc-2.21
''
'' based on the C header files:
''   System-dependent timing definitions.  Linux version.
''   Copyright (C) 1996-2015 Free Software Foundation, Inc.
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
#include once "crt/bits/timex.bi"

extern "C"

const _STRUCT_TIMEVAL = 1

type timeval
	tv_sec as __time_t
	tv_usec as __suseconds_t
end type

const _BITS_TIME_H = 1
#define CLOCKS_PER_SEC cast(clock_t, 1000000)
const CLOCK_REALTIME = 0
const CLOCK_MONOTONIC = 1
const CLOCK_PROCESS_CPUTIME_ID = 2
const CLOCK_THREAD_CPUTIME_ID = 3
const CLOCK_MONOTONIC_RAW = 4
const CLOCK_REALTIME_COARSE = 5
const CLOCK_MONOTONIC_COARSE = 6
const CLOCK_BOOTTIME = 7
const CLOCK_REALTIME_ALARM = 8
const CLOCK_BOOTTIME_ALARM = 9
const CLOCK_TAI = 11
const TIMER_ABSTIME = 1
declare function clock_adjtime(byval __clock_id as __clockid_t, byval __utx as timex ptr) as long

end extern
