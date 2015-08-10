'' FreeBASIC binding for djdev204
''
'' based on the C header files:
''   /* Copyright (C) 2003 DJ Delorie, see COPYING.DJ for details */
''   /* Copyright (C) 1999 DJ Delorie, see COPYING.DJ for details */
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
#include once "crt/time.bi"

extern "C"

const ITIMER_REAL = 0
const ITIMER_PROF = 1

type itimerval
	it_interval as timeval
	it_value as timeval
end type

extern __djgpp_clock_tick_interval as clong
declare function getitimer(byval _which as long, byval _value as itimerval ptr) as long
declare function setitimer(byval _which as long, byval _value as itimerval ptr, byval _ovalue as itimerval ptr) as long
declare function utimes(byval _file as const zstring ptr, byval _tvp as timeval ptr) as long

end extern
