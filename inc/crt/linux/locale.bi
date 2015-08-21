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

#include once "crt/long.bi"
#include once "crt/stddef.bi"
#include once "xlocale.bi"

extern "C"

const _LOCALE_H = 1
const _BITS_LOCALE_H = 1
const __LC_CTYPE = 0
const __LC_NUMERIC = 1
const __LC_TIME = 2
const __LC_COLLATE = 3
const __LC_MONETARY = 4
const __LC_MESSAGES = 5
const __LC_ALL = 6
const __LC_PAPER = 7
const __LC_NAME = 8
const __LC_ADDRESS = 9
const __LC_TELEPHONE = 10
const __LC_MEASUREMENT = 11
const __LC_IDENTIFICATION = 12
#define LC_CTYPE __LC_CTYPE
#define LC_NUMERIC __LC_NUMERIC
#define LC_TIME __LC_TIME
#define LC_COLLATE __LC_COLLATE
#define LC_MONETARY __LC_MONETARY
#define LC_MESSAGES __LC_MESSAGES
#define LC_ALL __LC_ALL
#define LC_PAPER __LC_PAPER
#define LC_NAME __LC_NAME
#define LC_ADDRESS __LC_ADDRESS
#define LC_TELEPHONE __LC_TELEPHONE
#define LC_MEASUREMENT __LC_MEASUREMENT
#define LC_IDENTIFICATION __LC_IDENTIFICATION

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
	int_p_sep_by_space as byte
	int_n_cs_precedes as byte
	int_n_sep_by_space as byte
	int_p_sign_posn as byte
	int_n_sign_posn as byte
end type

declare function setlocale(byval __category as long, byval __locale as const zstring ptr) as zstring ptr
declare function localeconv() as lconv ptr
declare function newlocale(byval __category_mask as long, byval __locale as const zstring ptr, byval __base as __locale_t) as __locale_t

#define LC_CTYPE_MASK (1 shl __LC_CTYPE)
#define LC_NUMERIC_MASK (1 shl __LC_NUMERIC)
#define LC_TIME_MASK (1 shl __LC_TIME)
#define LC_COLLATE_MASK (1 shl __LC_COLLATE)
#define LC_MONETARY_MASK (1 shl __LC_MONETARY)
#define LC_MESSAGES_MASK (1 shl __LC_MESSAGES)
#define LC_PAPER_MASK (1 shl __LC_PAPER)
#define LC_NAME_MASK (1 shl __LC_NAME)
#define LC_ADDRESS_MASK (1 shl __LC_ADDRESS)
#define LC_TELEPHONE_MASK (1 shl __LC_TELEPHONE)
#define LC_MEASUREMENT_MASK (1 shl __LC_MEASUREMENT)
#define LC_IDENTIFICATION_MASK (1 shl __LC_IDENTIFICATION)
#define LC_ALL_MASK (((((((((((LC_CTYPE_MASK or LC_NUMERIC_MASK) or LC_TIME_MASK) or LC_COLLATE_MASK) or LC_MONETARY_MASK) or LC_MESSAGES_MASK) or LC_PAPER_MASK) or LC_NAME_MASK) or LC_ADDRESS_MASK) or LC_TELEPHONE_MASK) or LC_MEASUREMENT_MASK) or LC_IDENTIFICATION_MASK)

declare function duplocale(byval __dataset as __locale_t) as __locale_t
declare sub freelocale(byval __dataset as __locale_t)
declare function uselocale(byval __dataset as __locale_t) as __locale_t
#define LC_GLOBAL_LOCALE cast(__locale_t, -cast(clong, 1))
declare function __uselocale(byval __dataset as __locale_t) as __locale_t
const __LC_LAST = 13
extern _nl_locale_file_list(0 to ...) as loaded_l10nfile ptr
extern _nl_C_locobj as const __locale_struct
#define _nl_C_locobj_ptr cptr(__locale_struct ptr, @_nl_C_locobj)
declare function __localeconv() as lconv ptr
declare function __current_locale_name(byval category as long) as const zstring ptr

end extern
