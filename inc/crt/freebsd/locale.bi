'' FreeBASIC binding for FreeBSD-10.1-RELEASE
''
'' based on the C header files:
''    Copyright (c) 1991, 1993
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
''   	@(#)locale.h	8.1 (Berkeley) 6/2/93
''    $FreeBSD: releng/10.1/include/locale.h 232498 2012-03-04 15:31:13Z theraven $
''
'' translated to FreeBASIC by:
''   Copyright © 2015 FreeBASIC development team

#pragma once

extern "C"

type lconv
	decimal_point as zstring ptr
	thousands_sep as zstring ptr
	grouping as zstring ptr
	int_curr_symbol as zstring ptr
	currency_symbol as zstring ptr
	mon_decimal_point as zstring ptr
	mon_thousands_sep as zstring ptr
	mon_grouping as zstring ptr
	positive_sign as zstring ptr
	negative_sign as zstring ptr
	int_frac_digits as byte
	frac_digits as byte
	p_cs_precedes as byte
	p_sep_by_space as byte
	n_cs_precedes as byte
	n_sep_by_space as byte
	p_sign_posn as byte
	n_sign_posn as byte
	int_p_cs_precedes as byte
	int_n_cs_precedes as byte
	int_p_sep_by_space as byte
	int_n_sep_by_space as byte
	int_p_sign_posn as byte
	int_n_sign_posn as byte
end type

const LC_ALL = 0
const LC_COLLATE = 1
const LC_CTYPE = 2
const LC_MONETARY = 3
const LC_NUMERIC = 4
const LC_TIME = 5
const LC_MESSAGES = 6
const _LC_LAST = 7
declare function localeconv() as lconv ptr
declare function setlocale(byval as long, byval as const zstring ptr) as zstring ptr
const LC_COLLATE_MASK = 1 shl 0
const LC_CTYPE_MASK = 1 shl 1
const LC_MESSAGES_MASK = 1 shl 2
const LC_MONETARY_MASK = 1 shl 3
const LC_NUMERIC_MASK = 1 shl 4
const LC_TIME_MASK = 1 shl 5
#define LC_ALL_MASK (((((LC_COLLATE_MASK or LC_CTYPE_MASK) or LC_MESSAGES_MASK) or LC_MONETARY_MASK) or LC_NUMERIC_MASK) or LC_TIME_MASK)
#define LC_GLOBAL_LOCALE cast(locale_t, -1)

declare function duplocale(byval base as locale_t) as locale_t
declare function freelocale(byval loc as locale_t) as long
declare function newlocale(byval mask as long, byval locale as const zstring ptr, byval base as locale_t) as locale_t
declare function querylocale(byval mask as long, byval loc as locale_t) as const zstring ptr
declare function uselocale(byval loc as locale_t) as locale_t

end extern
