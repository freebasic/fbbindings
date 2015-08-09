'' FreeBASIC binding for OpenBSD-5.7
''
'' based on the C header files:
''   -
''    Copyright (c) 1982, 1986, 1991, 1993
''   	The Regents of the University of California.  All rights reserved.
''    (c) UNIX System Laboratories, Inc.
''    All or some portions of this file are derived from material licensed
''    to the University of California by American Telephone and Telegraph
''    Co. or Unix System Laboratories, Inc. and are reproduced herein with
''    the permission of UNIX System Laboratories, Inc.
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
''   	@(#)types.h	8.4 (Berkeley) 1/21/94
''
'' translated to FreeBASIC by:
''   Copyright © 2015 FreeBASIC development team

#pragma once

#include once "crt/long.bi"

#if (not defined(__FB_64BIT__)) and (not defined(__FB_ARM__))
	#include once "crt/longdouble.bi"
#endif

#include once "sys/cdefs.bi"
#include once "sys/endian.bi"
#include once "sys/select.bi"

extern "C"

#if defined(__FB_64BIT__) and (not defined(__FB_ARM__))
	#define _ALIGNBYTES (sizeof(clong) - 1)
#else
	#define _ALIGNBYTES (sizeof(long) - 1)
#endif

#ifdef __FB_ARM__
	const _STACKALIGNBYTES = 7
#else
	const _STACKALIGNBYTES = 15
#endif

#define _ALIGN(p) ((cast(culong, (p)) + _ALIGNBYTES) and (not _ALIGNBYTES))

#ifdef __FB_ARM__
	#define _ALIGNED_POINTER(p, t) ((cast(culong, (p)) and (sizeof(t) - 1)) = 0)
#else
	#define _ALIGNED_POINTER(p, t) 1
#endif

type __int8_t as byte
type __uint8_t as ubyte
type __int16_t as short
type __uint16_t as ushort
type __int32_t as long
type __uint32_t as ulong
type __int64_t as longint
type __uint64_t as ulongint
type __int_least8_t as __int8_t
type __uint_least8_t as __uint8_t
type __int_least16_t as __int16_t
type __uint_least16_t as __uint16_t
type __int_least32_t as __int32_t
type __uint_least32_t as __uint32_t
type __int_least64_t as __int64_t
type __uint_least64_t as __uint64_t
type __int_fast8_t as __int32_t
type __uint_fast8_t as __uint32_t
type __int_fast16_t as __int32_t
type __uint_fast16_t as __uint32_t
type __int_fast32_t as __int32_t
type __uint_fast32_t as __uint32_t
type __int_fast64_t as __int64_t
type __uint_fast64_t as __uint64_t

#define __INT_FAST8_MIN INT32_MIN
#define __INT_FAST16_MIN INT32_MIN
#define __INT_FAST32_MIN INT32_MIN
#define __INT_FAST64_MIN INT64_MIN
#define __INT_FAST8_MAX INT32_MAX
#define __INT_FAST16_MAX INT32_MAX
#define __INT_FAST32_MAX INT32_MAX
#define __INT_FAST64_MAX INT64_MAX
#define __UINT_FAST8_MAX UINT32_MAX
#define __UINT_FAST16_MAX UINT32_MAX
#define __UINT_FAST32_MAX UINT32_MAX
#define __UINT_FAST64_MAX UINT64_MAX

type __intptr_t as clong
type __uintptr_t as culong
type __intmax_t as __int64_t
type __uintmax_t as __uint64_t
type __register_t as clong
type __vaddr_t as culong
type __paddr_t as culong
type __vsize_t as culong
type __psize_t as culong

#if (not defined(__FB_64BIT__)) and (not defined(__FB_ARM__))
	type __double_t as clongdouble
	type __float_t as clongdouble
#else
	type __double_t as double
	type __float_t as single
#endif

type __ptrdiff_t as clong
type __size_t as culong
type __ssize_t as clong
type __va_list as __builtin_va_list
type __wchar_t as long
type __wint_t as long
type __rune_t as long
type __wctrans_t as any ptr
type __wctype_t as any ptr
type __blkcnt_t as __int64_t
type __blksize_t as __int32_t
type __clock_t as __int64_t
type __clockid_t as __int32_t
type __cpuid_t as culong
type __dev_t as __int32_t
type __fixpt_t as __uint32_t
type __fsblkcnt_t as __uint64_t
type __fsfilcnt_t as __uint64_t
type __gid_t as __uint32_t
type __id_t as __uint32_t
type __in_addr_t as __uint32_t
type __in_port_t as __uint16_t
type __ino_t as __uint64_t
type __key_t as clong
type __mode_t as __uint32_t
type __nlink_t as __uint32_t
type __off_t as __int64_t
type __pid_t as __int32_t
type __rlim_t as __uint64_t
type __sa_family_t as __uint8_t
type __segsz_t as __int32_t
type __socklen_t as __uint32_t
type __suseconds_t as clong
type __swblk_t as __int32_t
type __time_t as __int64_t
type __timer_t as __int32_t
type __uid_t as __uint32_t
type __useconds_t as __uint32_t

union __mbstate_t
	__mbstate8 as zstring * 128
	__mbstateL as __int64_t
end union

type u_char as ubyte
type u_short as ushort
type u_int as ulong
type u_long as culong
type unchar as ubyte
type ushort as ushort
type uint as ulong
type ulong as culong
type cpuid_t as __cpuid_t
type register_t as __register_t
type int8_t as __int8_t
type uint8_t as __uint8_t
type int16_t as __int16_t
type uint16_t as __uint16_t
type int32_t as __int32_t
type uint32_t as __uint32_t
type int64_t as __int64_t
type uint64_t as __uint64_t
type u_int8_t as __uint8_t
type u_int16_t as __uint16_t
type u_int32_t as __uint32_t
type u_int64_t as __uint64_t
type quad_t as __int64_t
type u_quad_t as __uint64_t
type qaddr_t as quad_t ptr
type vaddr_t as __vaddr_t
type paddr_t as __paddr_t
type vsize_t as __vsize_t
type psize_t as __psize_t
type blkcnt_t as __blkcnt_t
type blksize_t as __blksize_t
type caddr_t as zstring ptr
type daddr32_t as __int32_t
type daddr_t as __int64_t
type dev_t as __dev_t
type fixpt_t as __fixpt_t
type gid_t as __gid_t
type id_t as __id_t
type ino_t as __ino_t
type key_t as __key_t
type mode_t as __mode_t
type nlink_t as __nlink_t
type rlim_t as __rlim_t
type segsz_t as __segsz_t
type swblk_t as __swblk_t
type uid_t as __uid_t
type useconds_t as __useconds_t
type suseconds_t as __suseconds_t
type fsblkcnt_t as __fsblkcnt_t
type fsfilcnt_t as __fsfilcnt_t
type in_addr_t as __in_addr_t
type in_port_t as __in_port_t
type clock_t as __clock_t
type clockid_t as __clockid_t
type pid_t as __pid_t
type size_t as __size_t
type ssize_t as __ssize_t
type time_t as __time_t
type timer_t as __timer_t
type off_t as __off_t

declare function lseek(byval as long, byval as off_t, byval as long) as off_t
declare function ftruncate(byval as long, byval as off_t) as long
declare function truncate(byval as const zstring ptr, byval as off_t) as long

#define major(x) clng((cast(u_int32_t, (x)) shr 8) and &hff)
#define minor(x) (clng((x) and &hff) or (((x) and &hffff0000) shr 8))
#define makedev(x, y) cast(dev_t, ((((x) and &hff) shl 8) or ((y) and &hff)) or (((y) and &hffff00) shl 8))

end extern
