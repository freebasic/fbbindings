'' FreeBASIC binding for glibc-2.21
''
'' based on the C header files:
''   Definition of locale datatype.
''   Copyright (C) 1997-2015 Free Software Foundation, Inc.
''   This file is part of the GNU C Library.
''   Contributed by Ulrich Drepper <drepper@cygnus.com>, 1997.
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

const _XLOCALE_H = 1
type __locale_data as __locale_data_

type __locale_struct
	__locales(0 to 12) as __locale_data ptr
	__ctype_b as const ushort ptr
	__ctype_tolower as const long ptr
	__ctype_toupper as const long ptr
	__names(0 to 12) as const zstring ptr
end type

type __locale_t as __locale_struct ptr
type locale_t as __locale_t
