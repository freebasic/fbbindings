'' FreeBASIC binding for OpenBSD-5.7
''
'' based on the C header files:
''   -
''    Copyright (c) 1991, 1993
''   	The Regents of the University of California.  All rights reserved.
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
''   	@(#)signal.h	8.3 (Berkeley) 3/30/94
''
'' translated to FreeBASIC by:
''   Copyright © 2015 FreeBASIC development team

#pragma once

#if defined(__FB_64BIT__) and (not defined(__FB_ARM__))
	#include once "crt/long.bi"
#endif

#include once "sys/time.bi"
#include once "crt/sys/types.bi"

extern "C"

type sig_atomic_t as long

type sigcontext
	#if (not defined(__FB_64BIT__)) and (not defined(__FB_ARM__))
		sc_gs as long
		sc_fs as long
		sc_es as long
		sc_ds as long
		sc_edi as long
		sc_esi as long
		sc_ebp as long
		sc_ebx as long
		sc_edx as long
		sc_ecx as long
		sc_eax as long
		sc_eip as long
		sc_cs as long
		sc_eflags as long
		sc_esp as long
		sc_ss as long
	#elseif defined(__FB_64BIT__) and (not defined(__FB_ARM__))
		sc_rdi as clong
		sc_rsi as clong
		sc_rdx as clong
		sc_rcx as clong
		sc_r8 as clong
		sc_r9 as clong
		sc_r10 as clong
		sc_r11 as clong
		sc_r12 as clong
		sc_r13 as clong
		sc_r14 as clong
		sc_r15 as clong
		sc_rbp as clong
		sc_rbx as clong
		sc_rax as clong
		sc_gs as clong
		sc_fs as clong
		sc_es as clong
		sc_ds as clong
		sc_trapno as clong
		sc_err as clong
		sc_rip as clong
		sc_cs as clong
		sc_rflags as clong
		sc_rsp as clong
		sc_ss as clong
		sc_fpstate as fxsave64 ptr
	#endif

	__sc_unused as long
	sc_mask as long

	#if (not defined(__FB_64BIT__)) and (not defined(__FB_ARM__))
		sc_trapno as long
		sc_err as long
		sc_fpstate as savefpu ptr
	#elseif defined(__FB_ARM__)
		sc_spsr as ulong
		sc_r0 as ulong
		sc_r1 as ulong
		sc_r2 as ulong
		sc_r3 as ulong
		sc_r4 as ulong
		sc_r5 as ulong
		sc_r6 as ulong
		sc_r7 as ulong
		sc_r8 as ulong
		sc_r9 as ulong
		sc_r10 as ulong
		sc_r11 as ulong
		sc_r12 as ulong
		sc_usr_sp as ulong
		sc_usr_lr as ulong
		sc_svc_lr as ulong
		sc_pc as ulong
	#endif
end type

#if (not defined(__FB_64BIT__)) and (not defined(__FB_ARM__))
	#define sc_sp sc_esp
	#define sc_fp sc_ebp
	#define sc_pc sc_eip
	#define sc_ps sc_eflags
#endif

const _NSIG = 33
#define NSIG _NSIG
const SIGHUP = 1
const SIGINT = 2
const SIGQUIT = 3
const SIGILL = 4
const SIGTRAP = 5
const SIGABRT = 6
#define SIGIOT SIGABRT
const SIGEMT = 7
const SIGFPE = 8
const SIGKILL = 9
const SIGBUS = 10
const SIGSEGV = 11
const SIGSYS = 12
const SIGPIPE = 13
const SIGALRM = 14
const SIGTERM = 15
const SIGURG = 16
const SIGSTOP = 17
const SIGTSTP = 18
const SIGCONT = 19
const SIGCHLD = 20
const SIGTTIN = 21
const SIGTTOU = 22
const SIGIO = 23
const SIGXCPU = 24
const SIGXFSZ = 25
const SIGVTALRM = 26
const SIGPROF = 27
const SIGWINCH = 28
const SIGINFO = 29
const SIGUSR1 = 30
const SIGUSR2 = 31
const SIGTHR = 32
const SIG_DFL = cptr(sub(byval as long), 0)
const SIG_IGN = cptr(sub(byval as long), 1)
const SIG_ERR = cptr(sub(byval as long), -1)

union sigval
	sival_int as long
	sival_ptr as any ptr
end union

#define SI_FROMUSER(sip) ((sip)->si_code <= 0)
#define SI_FROMKERNEL(sip) ((sip)->si_code > 0)
const SI_NOINFO = 32767
const SI_USER = 0
const SI_LWP = -1
const SI_QUEUE = -2
const SI_TIMER = -3
const ILL_ILLOPC = 1
const ILL_ILLOPN = 2
const ILL_ILLADR = 3
const ILL_ILLTRP = 4
const ILL_PRVOPC = 5
const ILL_PRVREG = 6
const ILL_COPROC = 7
const ILL_BADSTK = 8
const NSIGILL = 8
const EMT_TAGOVF = 1
const NSIGEMT = 1
const FPE_INTDIV = 1
const FPE_INTOVF = 2
const FPE_FLTDIV = 3
const FPE_FLTOVF = 4
const FPE_FLTUND = 5
const FPE_FLTRES = 6
const FPE_FLTINV = 7
const FPE_FLTSUB = 8
const NSIGFPE = 8
const SEGV_MAPERR = 1
const SEGV_ACCERR = 2
const NSIGSEGV = 2
const BUS_ADRALN = 1
const BUS_ADRERR = 2
const BUS_OBJERR = 3
const NSIGBUS = 3
const TRAP_BRKPT = 1
const TRAP_TRACE = 2
const NSIGTRAP = 2
const CLD_EXITED = 1
const CLD_KILLED = 2
const CLD_DUMPED = 3
const CLD_TRAPPED = 4
const CLD_STOPPED = 5
const CLD_CONTINUED = 6
const NSIGCLD = 6
const SI_MAXSZ = 128
#define SI_PAD ((SI_MAXSZ / sizeof(long)) - 3)

type siginfo_t__data__proc__pdata__kill
	_uid as uid_t
	_value as sigval
end type

type siginfo_t__data__proc__pdata__cld
	_utime as clock_t
	_stime as clock_t
	_status as long
end type

union siginfo_t__data__proc__pdata
	_kill as siginfo_t__data__proc__pdata__kill
	_cld as siginfo_t__data__proc__pdata__cld
end union

type siginfo_t__data__proc
	_pid as pid_t
	_pdata as siginfo_t__data__proc__pdata
end type

type siginfo_t__data__fault
	_addr as caddr_t
	_trapno as long
end type

union siginfo_t__data
	_pad(0 to ((128 / sizeof(long)) - 3) - 1) as long
	_proc as siginfo_t__data__proc
	_fault as siginfo_t__data__fault
end union

type siginfo_t
	si_signo as long
	si_code as long
	si_errno as long
	_data as siginfo_t__data
end type

#define si_pid _data._proc._pid
#define si_status _data._proc._pdata._cld._status
#define si_stime _data._proc._pdata._cld._stime
#define si_utime _data._proc._pdata._cld._utime
#define si_uid _data._proc._pdata._kill._uid
#define si_value _data._proc._pdata._kill._value
#define si_addr _data._fault._addr
#define si_trapno _data._fault._trapno
#define si_fd _data._file._fd
#define si_band _data._file._band
#define si_tstamp _data._prof._tstamp
#define si_syscall _data._prof._syscall
#define si_nsysarg _data._prof._nsysarg
#define si_sysarg _data._prof._sysarg
#define si_fault _data._prof._fault
#define si_faddr _data._prof._faddr
#define si_mstate _data._prof._mstate

union sigaction___sigaction_u
	__sa_handler as sub(byval as long)
	__sa_sigaction as sub(byval as long, byval as siginfo_t ptr, byval as any ptr)
end union

type sigaction
	__sigaction_u as sigaction___sigaction_u
	sa_mask as sigset_t
	sa_flags as long
end type

#define sa_handler __sigaction_u.__sa_handler
#define sa_sigaction __sigaction_u.__sa_sigaction
const SA_ONSTACK = &h0001
const SA_RESTART = &h0002
const SA_RESETHAND = &h0004
const SA_NODEFER = &h0010
const SA_NOCLDWAIT = &h0020
const SA_NOCLDSTOP = &h0008
const SA_SIGINFO = &h0040
const SIG_BLOCK = 1
const SIG_UNBLOCK = 2
const SIG_SETMASK = 3
type sig_t as sub(byval as long)

type sigvec
	sv_handler as sub(byval as long)
	sv_mask as long
	sv_flags as long
end type

#define SV_ONSTACK SA_ONSTACK
#define SV_INTERRUPT SA_RESTART
#define SV_RESETHAND SA_RESETHAND
#define sv_onstack sv_flags
#define sigmask(m) culng(1u shl ((m) - 1))
#define BADSIG SIG_ERR

type sigaltstack
	ss_sp as any ptr
	ss_size as uinteger
	ss_flags as long
end type

type stack_t as sigaltstack
const SS_ONSTACK = &h0001
const SS_DISABLE = &h0004
const MINSIGSTKSZ = 8192
#define SIGSTKSZ (MINSIGSTKSZ + 32768)
type ucontext_t as sigcontext
declare function signal(byval as long, byval as sub(byval as long)) as sub(byval as long)
extern sys_signame(0 to 32) as const zstring const ptr
extern sys_siglist(0 to 32) as const zstring const ptr

declare function raise(byval as long) as long
declare function bsd_signal(byval as long, byval as sub(byval as long)) as sub(byval as long)
declare function kill(byval as pid_t, byval as long) as long
declare function sigaction(byval as long, byval as const sigaction ptr, byval as sigaction ptr) as long
declare function sigaddset(byval as sigset_t ptr, byval as long) as long
declare function sigdelset(byval as sigset_t ptr, byval as long) as long
declare function sigemptyset(byval as sigset_t ptr) as long
declare function sigfillset(byval as sigset_t ptr) as long
declare function sigismember(byval as const sigset_t ptr, byval as long) as long
declare function sigpending(byval as sigset_t ptr) as long
declare function sigprocmask(byval as long, byval as const sigset_t ptr, byval as sigset_t ptr) as long
declare function pthread_sigmask(byval as long, byval as const sigset_t ptr, byval as sigset_t ptr) as long
declare function sigsuspend(byval as const sigset_t ptr) as long
declare function __errno() as long ptr

private function sigaddset(byval __set as sigset_t ptr, byval __signo as long) as long
	if (__signo <= 0) orelse (__signo >= 33) then
		(*__errno()) = 22
		return -1
	end if
	(*__set) or= culng(1u shl (__signo - 1))
	return 0
end function

private function sigdelset(byval __set as sigset_t ptr, byval __signo as long) as long
	if (__signo <= 0) orelse (__signo >= 33) then
		(*__errno()) = 22
		return -1
	end if
	(*__set) and= culng(not culng(1u shl (__signo - 1)))
	return 0
end function

private function sigismember(byval __set as const sigset_t ptr, byval __signo as long) as long
	if (__signo <= 0) orelse (__signo >= 33) then
		(*__errno()) = 22
		return -1
	end if
	return -(((*__set) and culng(1u shl (__signo - 1))) <> 0)
end function

#macro sigemptyset(set)
	scope
		(*(set)) = 0
		0
	end scope
#endmacro
#macro sigfillset(set)
	scope
		(*(set)) = not cast(sigset_t, 0)
		0
	end scope
#endmacro
declare function killpg(byval as pid_t, byval as long) as long
declare function siginterrupt(byval as long, byval as long) as long
declare function sigpause(byval as long) as long
declare function sigaltstack(byval as const sigaltstack ptr, byval as sigaltstack ptr) as long
declare function sigblock(byval as long) as long
declare function sigreturn(byval as sigcontext ptr) as long
declare function sigsetmask(byval as long) as long
declare function sigvec(byval as long, byval as sigvec ptr, byval as sigvec ptr) as long
declare function sigwait(byval as const sigset_t ptr, byval as long ptr) as long
declare sub psignal(byval as ulong, byval as const zstring ptr)

end extern
