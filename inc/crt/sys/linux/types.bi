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
#include once "bits/wordsize.bi"
#include once "crt/time.bi"
#include once "crt/stddef.bi"
#include once "endian.bi"
#include once "sys/select.bi"
#include once "sys/sysmacros.bi"
#include once "bits/pthreadtypes.bi"

const _SYS_TYPES_H = 1
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
