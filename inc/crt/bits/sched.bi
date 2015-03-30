#pragma once

#include once "crt/long.bi"

extern "C"

const SCHED_OTHER = 0
const SCHED_FIFO = 1
const SCHED_RR = 2

type sched_param
	__sched_priority as long
end type

const __defined_schedparam = 1

type __sched_param
	__sched_priority as long
end type

#define __cpu_set_t_defined
const __CPU_SETSIZE = 1024
#define __NCPUBITS (8 * sizeof(__cpu_mask))
type __cpu_mask as culong
#define __CPUELT(cpu) ((cpu) / __NCPUBITS)
#define __CPUMASK(cpu) (cast(__cpu_mask, 1) shl ((cpu) mod __NCPUBITS))

type cpu_set_t
	__bits(0 to (1024 / (8 * sizeof(__cpu_mask))) - 1) as __cpu_mask
end type

#define __CPU_ZERO_S(setsize, cpusetp) '' TODO: do __builtin_memset (cpusetp, '\0', setsize); while (0)
#define __CPU_SET_S(cpu, setsize, cpusetp) '' TODO: (__extension__ ({ size_t __cpu = (cpu); __cpu < 8 * (setsize) ? (((__cpu_mask *) ((cpusetp)->__bits))[__CPUELT (__cpu)] |= __CPUMASK (__cpu)) : 0; }))
#define __CPU_CLR_S(cpu, setsize, cpusetp) '' TODO: (__extension__ ({ size_t __cpu = (cpu); __cpu < 8 * (setsize) ? (((__cpu_mask *) ((cpusetp)->__bits))[__CPUELT (__cpu)] &= ~__CPUMASK (__cpu)) : 0; }))
#define __CPU_ISSET_S(cpu, setsize, cpusetp) '' TODO: (__extension__ ({ size_t __cpu = (cpu); __cpu < 8 * (setsize) ? ((((const __cpu_mask *) ((cpusetp)->__bits))[__CPUELT (__cpu)] & __CPUMASK (__cpu))) != 0 : 0; }))
#define __CPU_COUNT_S(setsize, cpusetp) __sched_cpucount(setsize, cpusetp)
#define __CPU_EQUAL_S(setsize, cpusetp1, cpusetp2) (__builtin_memcmp(cpusetp1, cpusetp2, setsize) = 0)
#define __CPU_OP_S(setsize, destset, srcset1, srcset2, op) '' TODO: (__extension__ ({ cpu_set_t *__dest = (destset); const __cpu_mask *__arr1 = (srcset1)->__bits; const __cpu_mask *__arr2 = (srcset2)->__bits; size_t __imax = (setsize) / sizeof (__cpu_mask); size_t __i; for (__i = 0; __i < __imax; ++__i) ((__cpu_mask *) __dest->__bits)[__i] = __arr1[__i] op __arr2[__i]; __dest; }))
#define __CPU_ALLOC_SIZE(count) (((((count) + __NCPUBITS) - 1) / __NCPUBITS) * sizeof(__cpu_mask))
#define __CPU_ALLOC(count) __sched_cpualloc(count)
#define __CPU_FREE(cpuset) __sched_cpufree(cpuset)

declare function __sched_cpucount(byval __setsize as uinteger, byval __setp as const cpu_set_t ptr) as long
declare function __sched_cpualloc(byval __count as uinteger) as cpu_set_t ptr
declare sub __sched_cpufree(byval __set as cpu_set_t ptr)

end extern
