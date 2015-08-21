'' FreeBASIC binding for glibc-2.21
''
'' based on the C header files:
''   Definitions for POSIX 1003.1b-1993 (aka POSIX.4) scheduling interface.
''   Copyright (C) 1996-2015 Free Software Foundation, Inc.
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

extern "C"

const SCHED_OTHER = 0
const SCHED_FIFO = 1
const SCHED_RR = 2
const SCHED_BATCH = 3
const SCHED_IDLE = 5
const SCHED_RESET_ON_FORK = &h40000000
const CSIGNAL = &h000000ff
const CLONE_VM = &h00000100
const CLONE_FS = &h00000200
const CLONE_FILES = &h00000400
const CLONE_SIGHAND = &h00000800
const CLONE_PTRACE = &h00002000
const CLONE_VFORK = &h00004000
const CLONE_PARENT = &h00008000
const CLONE_THREAD = &h00010000
const CLONE_NEWNS = &h00020000
const CLONE_SYSVSEM = &h00040000
const CLONE_SETTLS = &h00080000
const CLONE_PARENT_SETTID = &h00100000
const CLONE_CHILD_CLEARTID = &h00200000
const CLONE_DETACHED = &h00400000
const CLONE_UNTRACED = &h00800000
const CLONE_CHILD_SETTID = &h01000000
const CLONE_NEWUTS = &h04000000
const CLONE_NEWIPC = &h08000000
const CLONE_NEWUSER = &h10000000
const CLONE_NEWPID = &h20000000
const CLONE_NEWNET = &h40000000
const CLONE_IO = &h80000000

type sched_param
	__sched_priority as long
end type

declare function clone(byval __fn as function(byval __arg as any ptr) as long, byval __child_stack as any ptr, byval __flags as long, byval __arg as any ptr, ...) as long
declare function unshare(byval __flags as long) as long
declare function sched_getcpu() as long
declare function setns(byval __fd as long, byval __nstype as long) as long
const __defined_schedparam = 1

type __sched_param
	__sched_priority as long
end type

const __CPU_SETSIZE = 1024
#define __NCPUBITS (8 * sizeof(__cpu_mask))
type __cpu_mask as culong
#define __CPUELT(cpu) ((cpu) / __NCPUBITS)
#define __CPUMASK(cpu) (cast(__cpu_mask, 1) shl ((cpu) mod __NCPUBITS))

type cpu_set_t
	__bits(0 to (1024 / (8 * sizeof(__cpu_mask))) - 1) as __cpu_mask
end type

#define __CPU_ALLOC_SIZE(count) (((((count) + __NCPUBITS) - 1) / __NCPUBITS) * sizeof(__cpu_mask))
#define __CPU_ALLOC(count) __sched_cpualloc(count)
#define __CPU_FREE(cpuset) __sched_cpufree(cpuset)

declare function __sched_cpucount(byval __setsize as uinteger, byval __setp as const cpu_set_t ptr) as long
declare function __sched_cpualloc(byval __count as uinteger) as cpu_set_t ptr
declare sub __sched_cpufree(byval __set as cpu_set_t ptr)

end extern
