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

#include once "crt/bits/types.bi"
#include once "crt/time.bi"
#include once "crt/stddef.bi"
#include once "crt/bits/pthreadtypes.bi"

const _SYS_TYPES_H = 1
type u_char as __u_char
type u_short as __u_short
type u_int as __u_int
type u_long as __u_long
type quad_t as __quad_t
type u_quad_t as __u_quad_t
type fsid_t as __fsid_t
type loff_t as __loff_t
type ino_t as __ino_t
type ino64_t as __ino64_t
type dev_t as __dev_t
type gid_t as __gid_t
type mode_t as __mode_t
type nlink_t as __nlink_t
type uid_t as __uid_t
type off_t as __off_t
type off64_t as __off64_t
type pid_t as __pid_t
type id_t as __id_t
#ifndef ssize_t
	type ssize_t as __ssize_t
#endif
type daddr_t as __daddr_t
type caddr_t as __caddr_t
type key_t as __key_t
type useconds_t as __useconds_t
type suseconds_t as __suseconds_t
type uint as ulong
#ifndef int8_t
	type int8_t as byte
#endif
#ifndef int16_t
	type int16_t as short
#endif
#ifndef int32_t
	type int32_t as long
#endif
#ifndef int64_t
	type int64_t as longint
#endif
#ifndef u_int8_t
	type u_int8_t as ubyte
#endif
#ifndef u_int16_t
	type u_int16_t as ushort
#endif
#ifndef u_int32_t
	type u_int32_t as ulong
#endif
#ifndef u_int64_t
	type u_int64_t as ulongint
#endif
type register_t as uinteger
type blksize_t as __blksize_t
type blkcnt_t as __blkcnt_t
type fsblkcnt_t as __fsblkcnt_t
type fsfilcnt_t as __fsfilcnt_t
type blkcnt64_t as __blkcnt64_t
type fsblkcnt64_t as __fsblkcnt64_t
type fsfilcnt64_t as __fsfilcnt64_t
