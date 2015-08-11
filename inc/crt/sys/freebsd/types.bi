'' FreeBASIC binding for FreeBSD-10.1-RELEASE
''
'' based on the C header files:
''   -
''    Copyright (c) 1982, 1986, 1991, 1993, 1994
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
''    4. Neither the name of the University nor the names of its contributors
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
''   	@(#)types.h	8.6 (Berkeley) 2/19/95
''    $FreeBSD: releng/10.1/sys/sys/types.h 255219 2013-09-05 00:09:56Z pjd $
''
'' translated to FreeBASIC by:
''   Copyright © 2015 FreeBASIC development team

#pragma once

#include once "crt/long.bi"

#if (not defined(__FB_64BIT__)) and (not defined(__FB_ARM__))
	#include once "crt/longdouble.bi"
#endif

extern "C"

type __int8_t as byte
type __uint8_t as ubyte
type __int16_t as short
type __uint16_t as ushort
type __int32_t as long
type __uint32_t as ulong

#if (defined(__FB_64BIT__) and defined(__FB_ARM__)) or (not defined(__FB_64BIT__))
	type __int64_t as longint
	type __uint64_t as ulongint
#endif

#if (not defined(__FB_64BIT__)) and (not defined(__FB_ARM__))
	type __clock_t as culong
#elseif defined(__FB_ARM__)
	type __clock_t as __uint32_t
#endif

#if (defined(__FB_64BIT__) and defined(__FB_ARM__)) or (not defined(__FB_64BIT__))
	type __critical_t as __int32_t
#endif

#if (not defined(__FB_64BIT__)) and (not defined(__FB_ARM__))
	type __double_t as clongdouble
	type __float_t as clongdouble
	type __intfptr_t as __int32_t
	type __intptr_t as __int32_t
#elseif defined(__FB_64BIT__) and (not defined(__FB_ARM__))
	type __int64_t as clong
	type __uint64_t as culong
	type __clock_t as __int32_t
	type __critical_t as __int64_t
#endif

#if ((not defined(__FB_64BIT__)) and defined(__FB_ARM__)) or defined(__FB_64BIT__)
	type __double_t as double
	type __float_t as single
#endif

#if defined(__FB_64BIT__) and (not defined(__FB_ARM__))
	type __intfptr_t as __int64_t
	type __intptr_t as __int64_t
#elseif defined(__FB_ARM__)
	type __intfptr_t as __int32_t
#endif

type __intmax_t as __int64_t

#ifdef __FB_ARM__
	type __intptr_t as __int32_t
#endif

type __int_fast8_t as __int32_t
type __int_fast16_t as __int32_t
type __int_fast32_t as __int32_t
type __int_fast64_t as __int64_t
type __int_least8_t as __int8_t
type __int_least16_t as __int16_t
type __int_least32_t as __int32_t
type __int_least64_t as __int64_t

#if (defined(__FB_64BIT__) and defined(__FB_ARM__)) or (not defined(__FB_64BIT__))
	type __ptrdiff_t as __int32_t
	type __register_t as __int32_t
	type __segsz_t as __int32_t
	type __size_t as __uint32_t
	type __ssize_t as __int32_t
#endif

#if (not defined(__FB_64BIT__)) and (not defined(__FB_ARM__))
	type __time_t as __int32_t
#elseif defined(__FB_ARM__)
	type __time_t as __int64_t
#endif

#if (defined(__FB_64BIT__) and defined(__FB_ARM__)) or (not defined(__FB_64BIT__))
	type __uintfptr_t as __uint32_t
#endif

#ifdef __FB_ARM__
	type __uintmax_t as __uint64_t
#endif

#if defined(__FB_64BIT__) and (not defined(__FB_ARM__))
	type __ptrdiff_t as __int64_t
	type __register_t as __int64_t
	type __segsz_t as __int64_t
	type __size_t as __uint64_t
	type __ssize_t as __int64_t
	type __time_t as __int64_t
	type __uintfptr_t as __uint64_t
	type __uintptr_t as __uint64_t
#else
	type __uintptr_t as __uint32_t
#endif

#ifndef __FB_ARM__
	type __uintmax_t as __uint64_t
#endif

type __uint_fast8_t as __uint32_t
type __uint_fast16_t as __uint32_t
type __uint_fast32_t as __uint32_t
type __uint_fast64_t as __uint64_t
type __uint_least8_t as __uint8_t
type __uint_least16_t as __uint16_t
type __uint_least32_t as __uint32_t
type __uint_least64_t as __uint64_t

#if (defined(__FB_64BIT__) and defined(__FB_ARM__)) or (not defined(__FB_64BIT__))
	type __u_register_t as __uint32_t
	type __vm_offset_t as __uint32_t
#endif

#ifdef __FB_ARM__
	type __vm_ooffset_t as __int64_t
#endif

#if (defined(__FB_64BIT__) and defined(__FB_ARM__)) or (not defined(__FB_64BIT__))
	type __vm_paddr_t as __uint32_t
#endif

#ifdef __FB_ARM__
	type __vm_pindex_t as __uint64_t
#endif

#if defined(__FB_64BIT__) and (not defined(__FB_ARM__))
	type __u_register_t as __uint64_t
	type __vm_offset_t as __uint64_t
	type __vm_paddr_t as __uint64_t
	type __vm_size_t as __uint64_t
#else
	type __vm_size_t as __uint32_t
#endif

#ifndef __FB_ARM__
	type __vm_ooffset_t as __int64_t
	type __vm_pindex_t as __uint64_t
#endif

#if (not defined(__FB_64BIT__)) and defined(__FB_ARM__)
	type ___wchar_t as ulong
	const __WCHAR_MIN = 0
	#define __WCHAR_MAX __UINT_MAX
#else
	type ___wchar_t as long
	#define __WCHAR_MIN __INT_MIN
	#define __WCHAR_MAX __INT_MAX
#endif

type __va_list as __builtin_va_list
type __gnuc_va_list as __va_list
type __blksize_t as __uint32_t
type __blkcnt_t as __int64_t
type __clockid_t as __int32_t
type __fflags_t as __uint32_t
type __fsblkcnt_t as __uint64_t
type __fsfilcnt_t as __uint64_t
type __gid_t as __uint32_t
type __id_t as __int64_t
type __ino_t as __uint32_t
type __key_t as clong
type __lwpid_t as __int32_t
type __mode_t as __uint16_t
type __accmode_t as long
type __nl_item as long
type __nlink_t as __uint16_t
type __off_t as __int64_t
type __pid_t as __int32_t
type __rlim_t as __int64_t
type __sa_family_t as __uint8_t
type __socklen_t as __uint32_t
type __suseconds_t as clong
type __timer_t as __timer ptr
type __mqd_t as __mq ptr
type __uid_t as __uint32_t
type __useconds_t as ulong
type __cpuwhich_t as long
type __cpulevel_t as long
type __cpusetid_t as long
type __ct_rune_t as long
type __rune_t as __ct_rune_t
type __wint_t as __ct_rune_t
type __char16_t as __uint_least16_t
type __char32_t as __uint_least32_t
type __dev_t as __uint32_t
type __fixpt_t as __uint32_t

union __mbstate_t
	__mbstate8 as zstring * 128
	_mbstateL as __int64_t
end union

type u_char as ubyte
type u_short as ushort
type u_int as ulong
type u_long as culong
type uint as ulong
type u_int8_t as __uint8_t
type u_int16_t as __uint16_t
type u_int32_t as __uint32_t
type u_int64_t as __uint64_t
type u_quad_t as __uint64_t
type quad_t as __int64_t
type qaddr_t as quad_t ptr
type caddr_t as zstring ptr
type c_caddr_t as const zstring ptr
type blksize_t as __blksize_t
type cpuwhich_t as __cpuwhich_t
type cpulevel_t as __cpulevel_t
type cpusetid_t as __cpusetid_t
type blkcnt_t as __blkcnt_t
type clock_t as __clock_t
type clockid_t as __clockid_t
type critical_t as __critical_t
type daddr_t as __int64_t
type dev_t as __dev_t
type fflags_t as __fflags_t
type fixpt_t as __fixpt_t
type fsblkcnt_t as __fsblkcnt_t
type fsfilcnt_t as __fsfilcnt_t
type gid_t as __gid_t
type in_addr_t as __uint32_t
type in_port_t as __uint16_t
type id_t as __id_t
type ino_t as __ino_t
type key_t as __key_t
type lwpid_t as __lwpid_t
type mode_t as __mode_t
type accmode_t as __accmode_t
type nlink_t as __nlink_t
type off_t as __off_t
type pid_t as __pid_t
type register_t as __register_t
type rlim_t as __rlim_t
type sbintime_t as __int64_t
type segsz_t as __segsz_t
type size_t as __size_t
type ssize_t as __ssize_t
type suseconds_t as __suseconds_t
type time_t as __time_t
type timer_t as __timer_t
type mqd_t as __mqd_t
type u_register_t as __u_register_t
type uid_t as __uid_t
type useconds_t as __useconds_t
type cap_rights_t as cap_rights
type vm_offset_t as __vm_offset_t
type vm_ooffset_t as __vm_ooffset_t
type vm_paddr_t as __vm_paddr_t
type vm_pindex_t as __vm_pindex_t
type vm_size_t as __vm_size_t

#define major(x) clng((cast(u_int, (x)) shr 8) and &hff)
#define minor(x) clng((x) and &hffff00ff)
#define makedev(x, y) cast(dev_t, ((x) shl 8) or (y))

declare function ftruncate(byval as long, byval as off_t) as long
declare function lseek(byval as long, byval as off_t, byval as long) as off_t
declare function mmap(byval as any ptr, byval as uinteger, byval as long, byval as long, byval as long, byval as off_t) as any ptr
declare function truncate(byval as const zstring ptr, byval as off_t) as long

end extern
