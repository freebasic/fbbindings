'' FreeBASIC binding for glibc-2.21
''
'' based on the C header files:
''   bits/types.h -- definitions of __*_t types underlying *_t types.
''   Copyright (C) 2002-2015 Free Software Foundation, Inc.
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
#include once "crt/bits/wordsize.bi"

const _BITS_TYPES_H = 1
type __u_char as ubyte
type __u_short as ushort
type __u_int as ulong
type __u_long as culong
type __int8_t as byte
type __uint8_t as ubyte
type __int16_t as short
type __uint16_t as ushort
type __int32_t as long
type __uint32_t as ulong

#ifdef __FB_64BIT__
	type __int64_t as clong
	type __uint64_t as culong
	type __quad_t as clong
	type __u_quad_t as culong
#else
	type __int64_t as longint
	type __uint64_t as ulongint
	type __quad_t as longint
	type __u_quad_t as ulongint
#endif

const _BITS_TYPESIZES_H = 1

#ifdef __FB_64BIT__
	const __OFF_T_MATCHES_OFF64_T = 1
	const __INO_T_MATCHES_INO64_T = 1
#endif

const __FD_SETSIZE = 1024

#ifdef __FB_64BIT__
	type __dev_t as culong
#else
	type __dev_t as __u_quad_t
#endif

type __uid_t as ulong
type __gid_t as ulong
type __ino_t as culong

#ifdef __FB_64BIT__
	type __ino64_t as culong
#else
	type __ino64_t as __u_quad_t
#endif

type __mode_t as ulong

#ifdef __FB_64BIT__
	type __nlink_t as culong
#else
	type __nlink_t as ulong
#endif

type __off_t as clong

#ifdef __FB_64BIT__
	type __off64_t as clong
#else
	type __off64_t as __quad_t
#endif

type __pid_t as long

type __fsid_t
	__val(0 to 1) as long
end type

type __clock_t as clong
type __rlim_t as culong

#ifdef __FB_64BIT__
	type __rlim64_t as culong
#else
	type __rlim64_t as __u_quad_t
#endif

type __id_t as ulong
type __time_t as clong
type __useconds_t as ulong
type __suseconds_t as clong
type __daddr_t as long
type __key_t as long
type __clockid_t as long
type __timer_t as any ptr
type __blksize_t as clong
type __blkcnt_t as clong

#ifdef __FB_64BIT__
	type __blkcnt64_t as clong
#else
	type __blkcnt64_t as __quad_t
#endif

type __fsblkcnt_t as culong

#ifdef __FB_64BIT__
	type __fsblkcnt64_t as culong
#else
	type __fsblkcnt64_t as __u_quad_t
#endif

type __fsfilcnt_t as culong

#ifdef __FB_64BIT__
	type __fsfilcnt64_t as culong
	type __fsword_t as clong
	type __ssize_t as clong
#else
	type __fsfilcnt64_t as __u_quad_t
	type __fsword_t as long
	type __ssize_t as long
#endif

type __syscall_slong_t as clong
type __syscall_ulong_t as culong
type __loff_t as __off64_t
type __qaddr_t as __quad_t ptr
type __caddr_t as zstring ptr

#ifdef __FB_64BIT__
	type __intptr_t as clong
#else
	type __intptr_t as long
#endif

type __socklen_t as ulong
