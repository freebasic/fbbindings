'' FreeBASIC binding for djdev204
''
'' based on the C header files:
''   /* Copyright (C) 2003 DJ Delorie, see COPYING.DJ for details */
''   /* Copyright (C) 2000 DJ Delorie, see COPYING.DJ for details */
''   /* Copyright (C) 1999 DJ Delorie, see COPYING.DJ for details */
''   /* Copyright (C) 1998 DJ Delorie, see COPYING.DJ for details */
''   /* Copyright (C) 1995 DJ Delorie, see COPYING.DJ for details */
''   Source code copyright DJ Delorie is distributed under the terms of the
''   GNU General Public Licence, with the following exceptions:
''
''   * Sources used to build crt0.o, gcrt0.o, libc.a, libdbg.a, and
''     libemu.a are distributed under the terms of the GNU Library General
''     Public License, rather than the GNU GPL.
''
''   * Any existing copyright or authorship information in any given source
''     file must remain intact.  If you modify a source file, a notice to that
''     effect must be added to the authorship information in the source file. 
''
''   * Runtime binaries, as provided by DJ in DJGPP, may be distributed
''     without sources ONLY if the recipient is given sufficient information
''     to obtain a copy of djgpp themselves.  This primarily applies to
''     go32-v2.exe, emu387.dxe, and stubedit.exe.
''
''   * Runtime objects and libraries, as provided by DJ in DJGPP, when
''     linked into an application, may be distributed without sources ONLY
''     if the recipient is given sufficient information to obtain a copy of
''
'' translated to FreeBASIC by:
''   Copyright © 2015 FreeBASIC development team

#pragma once

#include once "crt/long.bi"
#include once "crt/sys/types.bi"

extern "C"

const CLOCKS_PER_SEC = 91
type clock_t as long

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
	__tm_zone as zstring ptr
	__tm_gmtoff as long
end type

declare function asctime(byval _tptr as const tm ptr) as zstring ptr
declare function clock() as clock_t
declare function ctime(byval _cal as const time_t ptr) as zstring ptr
declare function difftime(byval _t1 as time_t, byval _t0 as time_t) as double
declare function gmtime(byval _tod as const time_t ptr) as tm ptr
declare function localtime(byval _tod as const time_t ptr) as tm ptr
declare function mktime(byval _tptr as tm ptr) as time_t
declare function strftime(byval _s as zstring ptr, byval _n as uinteger, byval _format as const zstring ptr, byval _tptr as const tm ptr) as uinteger
declare function time(byval _tod as time_t ptr) as time_t
#define CLK_TCK CLOCKS_PER_SEC
extern tzname(0 to 1) as zstring ptr
declare sub tzset()
#define tm_zone __tm_zone
#define tm_gmtoff __tm_gmtoff

type timeval
	tv_sec as time_t
	tv_usec as clong
end type

type timezone
	tz_minuteswest as long
	tz_dsttime as long
end type

type uclock_t as longint
const UCLOCKS_PER_SEC = 1193180
declare function gettimeofday(byval _tp as timeval ptr, byval _tzp as timezone ptr) as long
declare function rawclock() as culong
declare function select(byval _nfds as long, byval _readfds as fd_set ptr, byval _writefds as fd_set ptr, byval _exceptfds as fd_set ptr, byval _timeout as timeval ptr) as long
declare function settimeofday(byval _tp as timeval ptr, ...) as long
declare sub tzsetwall()
declare function uclock() as uclock_t
declare function _rdtsc() as ulongint

end extern
