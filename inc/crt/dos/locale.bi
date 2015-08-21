'' FreeBASIC binding for djdev204
''
'' based on the C header files:
''   /* Copyright (C) 2003 DJ Delorie, see COPYING.DJ for details */
''   /* Copyright (C) 2002 DJ Delorie, see COPYING.DJ for details */
''   /* Copyright (C) 2001 DJ Delorie, see COPYING.DJ for details */
''   /* Copyright (C) 1997 DJ Delorie, see COPYING.DJ for details */
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

extern "C"

const LC_ALL = &h1f
const LC_COLLATE = &h01
const LC_CTYPE = &h02
const LC_MONETARY = &h04
const LC_NUMERIC = &h08
const LC_TIME = &h10

type lconv
	currency_symbol as zstring ptr
	decimal_point as zstring ptr
	grouping as zstring ptr
	int_curr_symbol as zstring ptr
	mon_decimal_point as zstring ptr
	mon_grouping as zstring ptr
	mon_thousands_sep as zstring ptr
	negative_sign as zstring ptr
	positive_sign as zstring ptr
	thousands_sep as zstring ptr
	frac_digits as byte
	int_frac_digits as byte
	n_cs_precedes as byte
	n_sep_by_space as byte
	n_sign_posn as byte
	p_cs_precedes as byte
	p_sep_by_space as byte
	p_sign_posn as byte
	int_n_cs_precedes as byte
	int_n_sep_by_space as byte
	int_n_sign_posn as byte
	int_p_cs_precedes as byte
	int_p_sep_by_space as byte
	int_p_sign_posn as byte
end type

declare function localeconv() as lconv ptr
declare function setlocale(byval _category as long, byval _locale as const zstring ptr) as zstring ptr

end extern
