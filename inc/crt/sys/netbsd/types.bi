'' FreeBASIC binding for NetBSD-6.1.5
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
	type __intptr_t as long
	type __uintptr_t as ulong
	type paddr_t as __uint64_t
	type psize_t as __uint64_t

	#define PRIxPADDR "llx"
	#define PRIxPSIZE "llx"
	#define PRIuPSIZE "llu"
#elseif defined(__FB_64BIT__) and (not defined(__FB_ARM__))
	type __int64_t as clong
	type __uint64_t as culong
#endif

#if ((not defined(__FB_64BIT__)) and defined(__FB_ARM__)) or defined(__FB_64BIT__)
	type __intptr_t as clong
	type __uintptr_t as culong
#endif

#ifdef __FB_ARM__
	type vm_offset_t as culong
	type vm_size_t as culong
#endif

#if ((not defined(__FB_64BIT__)) and defined(__FB_ARM__)) or defined(__FB_64BIT__)
	type paddr_t as culong
	type psize_t as culong
#endif

type vaddr_t as culong
type vsize_t as culong

#if ((not defined(__FB_64BIT__)) and defined(__FB_ARM__)) or defined(__FB_64BIT__)
	#define PRIxPADDR "lx"
	#define PRIxPSIZE "lx"
	#define PRIuPSIZE "lu"
#endif

#define PRIxVADDR "lx"
#define PRIxVSIZE "lx"
#define PRIuVSIZE "lu"

#if (not defined(__FB_64BIT__)) and (not defined(__FB_ARM__))
	type pmc_evid_t as long
	type pmc_ctr_t as __uint64_t
#endif

#if defined(__FB_64BIT__) and (not defined(__FB_ARM__))
	type register_t as clong
	type register32_t as long
	#define PRIxREGISTER "lx"
	#define PRIxREGISTER32 "x"
#else
	type register_t as long
	#define PRIxREGISTER "x"
#endif

#ifdef __FB_ARM__
	type pmc_evid_t as culong
	const PMC_INVALID_EVID = -1
	type pmc_ctr_t as culong
	type __cpu_simple_lock_t as long
#else
	type __cpu_simple_lock_t as ubyte
#endif

const __SIMPLELOCK_LOCKED = 1
const __SIMPLELOCK_UNLOCKED = 0
type int8_t as __int8_t
#define int8_t __int8_t
type uint8_t as __uint8_t
#define uint8_t __uint8_t
type int16_t as __int16_t
#define int16_t __int16_t
type uint16_t as __uint16_t
#define uint16_t __uint16_t
type int32_t as __int32_t
#define int32_t __int32_t
type uint32_t as __uint32_t
#define uint32_t __uint32_t
type int64_t as __int64_t
#define int64_t __int64_t
type uint64_t as __uint64_t
#define uint64_t __uint64_t
type u_int8_t as __uint8_t
type u_int16_t as __uint16_t
type u_int32_t as __uint32_t
type u_int64_t as __uint64_t
type u_char as ubyte
type u_short as ushort
type u_int as ulong
type u_long as culong
type unchar as ubyte
type uint as ulong
type u_quad_t as __uint64_t
type quad_t as __int64_t
type qaddr_t as quad_t ptr
type longlong_t as __int64_t
type u_longlong_t as __uint64_t
type blkcnt_t as __int64_t
type blksize_t as __uint32_t
type fsblkcnt_t as __fsblkcnt_t
#define fsblkcnt_t __fsblkcnt_t
type fsfilcnt_t as __fsfilcnt_t
#define fsfilcnt_t __fsfilcnt_t
type caddr_t as __caddr_t
#define caddr_t __caddr_t
type daddr_t as __int64_t
type dev_t as __uint64_t
type fixpt_t as __uint32_t
type gid_t as __gid_t
#define gid_t __gid_t
type idtype_t as long
type id_t as __uint32_t
type ino_t as __uint64_t
type key_t as clong
type mode_t as __mode_t
#define mode_t __mode_t
type nlink_t as __uint32_t
type off_t as __off_t
#define off_t __off_t
type pid_t as __pid_t
#define pid_t __pid_t
type lwpid_t as __int32_t
type rlim_t as __uint64_t
type segsz_t as __int32_t
type swblk_t as __int32_t
type uid_t as __uid_t
#define uid_t __uid_t
type mqd_t as long
type cpuid_t as culong
type psetid_t as long

declare function lseek(byval as long, byval as __off_t, byval as long) as __off_t
declare function ftruncate(byval as long, byval as __off_t) as long
declare function truncate(byval as const zstring ptr, byval as __off_t) as long
type __devmajor_t as __int32_t
type __devminor_t as __int32_t

#define devmajor_t __devmajor_t
#define devminor_t __devminor_t
const NODEVMAJOR = -1
#define major(x) cast(devmajor_t, culng(culng(culng(x) and &h000fff00) shr 8))
#define minor(x) cast(devminor_t, culng(culng(culng(culng(x) and &hfff00000) shr 12) or culng(culng(culng(x) and &h000000ff) shr 0)))
#define makedev(x, y) cast(dev_t, ((((x) shl 8) and &h000fff00) or (((y) shl 12) and &hfff00000)) or (((y) shl 0) and &h000000ff))

#if (not defined(__FB_64BIT__)) and (not defined(__FB_ARM__))
	type clock_t as culong
#else
	type clock_t as ulong
#endif

#undef _BSD_CLOCK_T_

#if (not defined(__FB_64BIT__)) and (not defined(__FB_ARM__))
	type size_t as ulong
#else
	type size_t as culong
#endif

#undef _BSD_SIZE_T_

#if (not defined(__FB_64BIT__)) and (not defined(__FB_ARM__))
	type ssize_t as long
#else
	type ssize_t as clong
#endif

#undef _BSD_SSIZE_T_
type time_t as __int64_t
#undef _BSD_TIME_T_
type clockid_t as long
#undef _BSD_CLOCKID_T_
type timer_t as long
#undef _BSD_TIMER_T_
type suseconds_t as long
#undef _BSD_SUSECONDS_T_
type useconds_t as ulong
#undef _BSD_USECONDS_T_
const NBBY = 8
type kauth_cred_t as kauth_cred ptr
type pri_t as long

end extern
