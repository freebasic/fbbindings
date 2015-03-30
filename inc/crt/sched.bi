#pragma once

#include once "features.bi"
#include once "bits/types.bi"
#include once "crt/stddef.bi"
#include once "crt/time.bi"
#include once "bits/sched.bi"

extern "C"

const _SCHED_H = 1
#define sched_priority __sched_priority
declare function sched_setparam(byval __pid as __pid_t, byval __param as const sched_param ptr) as long
declare function sched_getparam(byval __pid as __pid_t, byval __param as sched_param ptr) as long
declare function sched_setscheduler(byval __pid as __pid_t, byval __policy as long, byval __param as const sched_param ptr) as long
declare function sched_getscheduler(byval __pid as __pid_t) as long
declare function sched_yield() as long
declare function sched_get_priority_max(byval __algorithm as long) as long
declare function sched_get_priority_min(byval __algorithm as long) as long
declare function sched_rr_get_interval(byval __pid as __pid_t, byval __t as timespec ptr) as long

#define CPU_SETSIZE __CPU_SETSIZE
#define CPU_SET(cpu, cpusetp) __CPU_SET_S(cpu, sizeof(cpu_set_t), cpusetp)
#define CPU_CLR(cpu, cpusetp) __CPU_CLR_S(cpu, sizeof(cpu_set_t), cpusetp)
#define CPU_ISSET(cpu, cpusetp) __CPU_ISSET_S(cpu, sizeof(cpu_set_t), cpusetp)
#define CPU_ZERO(cpusetp) __CPU_ZERO_S(sizeof(cpu_set_t), cpusetp)
#define CPU_COUNT(cpusetp) __CPU_COUNT_S(sizeof(cpu_set_t), cpusetp)
#define CPU_SET_S(cpu, setsize, cpusetp) __CPU_SET_S(cpu, setsize, cpusetp)
#define CPU_CLR_S(cpu, setsize, cpusetp) __CPU_CLR_S(cpu, setsize, cpusetp)
#define CPU_ISSET_S(cpu, setsize, cpusetp) __CPU_ISSET_S(cpu, setsize, cpusetp)
#define CPU_ZERO_S(setsize, cpusetp) __CPU_ZERO_S(setsize, cpusetp)
#define CPU_COUNT_S(setsize, cpusetp) __CPU_COUNT_S(setsize, cpusetp)
#define CPU_EQUAL(cpusetp1, cpusetp2) __CPU_EQUAL_S(sizeof(cpu_set_t), cpusetp1, cpusetp2)
#define CPU_EQUAL_S(setsize, cpusetp1, cpusetp2) __CPU_EQUAL_S(setsize, cpusetp1, cpusetp2)
#define CPU_AND(destset, srcset1, srcset2) '' TODO: __CPU_OP_S (sizeof (cpu_set_t), destset, srcset1, srcset2, &)
#define CPU_OR(destset, srcset1, srcset2) '' TODO: __CPU_OP_S (sizeof (cpu_set_t), destset, srcset1, srcset2, |)
#define CPU_XOR(destset, srcset1, srcset2) '' TODO: __CPU_OP_S (sizeof (cpu_set_t), destset, srcset1, srcset2, ^)
#define CPU_AND_S(setsize, destset, srcset1, srcset2) '' TODO: __CPU_OP_S (setsize, destset, srcset1, srcset2, &)
#define CPU_OR_S(setsize, destset, srcset1, srcset2) '' TODO: __CPU_OP_S (setsize, destset, srcset1, srcset2, |)
#define CPU_XOR_S(setsize, destset, srcset1, srcset2) '' TODO: __CPU_OP_S (setsize, destset, srcset1, srcset2, ^)
#define CPU_ALLOC_SIZE(count) __CPU_ALLOC_SIZE(count)
#define CPU_ALLOC(count) __CPU_ALLOC(count)
#define CPU_FREE(cpuset) __CPU_FREE(cpuset)

declare function sched_setaffinity(byval __pid as __pid_t, byval __cpusetsize as uinteger, byval __cpuset as const cpu_set_t ptr) as long
declare function sched_getaffinity(byval __pid as __pid_t, byval __cpusetsize as uinteger, byval __cpuset as cpu_set_t ptr) as long
declare function __sched_setparam(byval __pid as __pid_t, byval __param as const sched_param ptr) as long
declare function __sched_getparam(byval __pid as __pid_t, byval __param as sched_param ptr) as long
declare function __sched_setscheduler(byval __pid as __pid_t, byval __policy as long, byval __param as const sched_param ptr) as long
declare function __sched_getscheduler(byval __pid as __pid_t) as long
declare function __sched_yield() as long
declare function __sched_get_priority_max(byval __algorithm as long) as long
declare function __sched_get_priority_min(byval __algorithm as long) as long
declare function __sched_rr_get_interval(byval __pid as __pid_t, byval __t as timespec ptr) as long
declare function __clone(byval __fn as function(byval __arg as any ptr) as long, byval __child_stack as any ptr, byval __flags as long, byval __arg as any ptr, ...) as long
declare function __clone2(byval __fn as function(byval __arg as any ptr) as long, byval __child_stack_base as any ptr, byval __child_stack_size as uinteger, byval __flags as long, byval __arg as any ptr, ...) as long

end extern
