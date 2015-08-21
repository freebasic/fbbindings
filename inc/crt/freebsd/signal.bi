'' FreeBASIC binding for FreeBSD-10.1-RELEASE
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
''    $FreeBSD: releng/10.1/include/signal.h 228468 2011-12-13 13:32:56Z ed $
''
'' translated to FreeBASIC by:
''   Copyright © 2015 FreeBASIC development team

#pragma once

#include once "crt/long.bi"
#include once "crt/sys/types.bi"

extern "C"

const _SIG_WORDS = 4
const _SIG_MAXSIG = 128
#define _SIG_IDX(sig) ((sig) - 1)
#define _SIG_WORD(sig) (_SIG_IDX(sig) shr 5)
#define _SIG_BIT(sig) (1 shl (_SIG_IDX(sig) and 31))
#define _SIG_VALID(sig) (((sig) <= _SIG_MAXSIG) andalso ((sig) > 0))

type __sigset
	__bits(0 to 3) as __uint32_t
end type

type __sigset_t as __sigset

#ifndef __FB_ARM__
	const _X86_SIGNAL_H = 1
#endif

#if (not defined(__FB_64BIT__)) and (not defined(__FB_ARM__))
	type sig_atomic_t as long
#else
	type sig_atomic_t as clong
#endif

type sigcontext
	#ifndef __FB_ARM__
		sc_mask as __sigset
	#endif

	#if (not defined(__FB_64BIT__)) and (not defined(__FB_ARM__))
		sc_onstack as long
		sc_gs as long
		sc_fs as long
		sc_es as long
		sc_ds as long
		sc_edi as long
		sc_esi as long
		sc_ebp as long
		sc_isp as long
		sc_ebx as long
		sc_edx as long
		sc_ecx as long
		sc_eax as long
	#elseif defined(__FB_64BIT__) and (not defined(__FB_ARM__))
		sc_onstack as clong
		sc_rdi as clong
		sc_rsi as clong
		sc_rdx as clong
		sc_rcx as clong
		sc_r8 as clong
		sc_r9 as clong
		sc_rax as clong
		sc_rbx as clong
		sc_rbp as clong
		sc_r10 as clong
		sc_r11 as clong
		sc_r12 as clong
		sc_r13 as clong
		sc_r14 as clong
		sc_r15 as clong
	#endif

	#ifndef __FB_ARM__
		sc_trapno as long
	#endif

	#if (not defined(__FB_64BIT__)) and (not defined(__FB_ARM__))
		sc_err as long
		sc_eip as long
		sc_cs as long
		sc_efl as long
		sc_esp as long
		sc_ss as long
		sc_len as long
		sc_fpformat as long
		sc_ownedfp as long
	#elseif defined(__FB_64BIT__) and (not defined(__FB_ARM__))
		sc_fs as short
		sc_gs as short
		sc_addr as clong
	#endif

	#ifndef __FB_ARM__
		sc_flags as long
	#endif

	#if (not defined(__FB_64BIT__)) and (not defined(__FB_ARM__))
		sc_fpstate(0 to 127) as long
		sc_fsbase as long
		sc_gsbase as long
		sc_xfpustate as long
		sc_xfpustate_len as long
		sc_spare2(0 to 3) as long
	#elseif defined(__FB_64BIT__) and (not defined(__FB_ARM__))
		sc_es as short
		sc_ds as short
		sc_err as clong
		sc_rip as clong
		sc_cs as clong
		sc_rflags as clong
		sc_rsp as clong
		sc_ss as clong
		sc_len as clong
		sc_fpformat as clong
		sc_ownedfp as clong
		sc_fpstate(0 to 63) as clong
		sc_fsbase as clong
		sc_gsbase as clong
		sc_xfpustate as clong
		sc_xfpustate_len as clong
		sc_spare(0 to 3) as clong
	#else
		_dummy as long
	#endif
end type

#if (not defined(__FB_64BIT__)) and (not defined(__FB_ARM__))
	#define sc_sp sc_esp
	#define sc_fp sc_ebp
	#define sc_pc sc_eip
	#define sc_ps sc_efl
	#define sc_eflags sc_efl
#endif

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
#define SIGLWP SIGTHR
const SIGLIBRT = 33
const SIGRTMIN = 65
const SIGRTMAX = 126
#define SIG_DFL cptr(__sighandler_t ptr, 0)
#define SIG_IGN cptr(__sighandler_t ptr, 1)
#define SIG_ERR cptr(__sighandler_t ptr, -1)
#define SIG_HOLD cptr(__sighandler_t ptr, 3)

union sigval
	sival_int as long
	sival_ptr as any ptr
	sigval_int as long
	sigval_ptr as any ptr
end union

type sigevent__sigev_un__sigev_thread
	_function as sub(byval as sigval)
	_attribute as any ptr
end type

union sigevent__sigev_un
	_threadid as __lwpid_t
	_sigev_thread as sigevent__sigev_un__sigev_thread
	_kevent_flags as ushort
	__spare__(0 to 7) as clong
end union

type sigevent
	sigev_notify as long
	sigev_signo as long
	sigev_value as sigval
	_sigev_un as sigevent__sigev_un
end type

#define sigev_notify_kqueue sigev_signo
#define sigev_notify_kevent_flags _sigev_un._kevent_flags
#define sigev_notify_thread_id _sigev_un._threadid
#define sigev_notify_function _sigev_un._sigev_thread._function
#define sigev_notify_attributes _sigev_un._sigev_thread._attribute
const SIGEV_NONE = 0
const SIGEV_SIGNAL = 1
const SIGEV_THREAD = 2
const SIGEV_KEVENT = 3
const SIGEV_THREAD_ID = 4

type __siginfo__reason__fault
	_trapno as long
end type

type __siginfo__reason__timer
	_timerid as long
	_overrun as long
end type

type __siginfo__reason__mesgq
	_mqd as long
end type

type __siginfo__reason__poll
	_band as clong
end type

type __siginfo__reason___spare__
	__spare1__ as clong
	__spare2__(0 to 6) as long
end type

union __siginfo__reason
	_fault as __siginfo__reason__fault
	_timer as __siginfo__reason__timer
	_mesgq as __siginfo__reason__mesgq
	_poll as __siginfo__reason__poll
	__spare__ as __siginfo__reason___spare__
end union

type __siginfo
	si_signo as long
	si_errno as long
	si_code as long
	si_pid as __pid_t
	si_uid as __uid_t
	si_status as long
	si_addr as any ptr
	si_value as sigval
	_reason as __siginfo__reason
end type

type siginfo_t as __siginfo
#define si_trapno _reason._fault._trapno
#define si_timerid _reason._timer._timerid
#define si_overrun _reason._timer._overrun
#define si_mqd _reason._mesgq._mqd
#define si_band _reason._poll._band
const ILL_ILLOPC = 1
const ILL_ILLOPN = 2
const ILL_ILLADR = 3
const ILL_ILLTRP = 4
const ILL_PRVOPC = 5
const ILL_PRVREG = 6
const ILL_COPROC = 7
const ILL_BADSTK = 8
const BUS_ADRALN = 1
const BUS_ADRERR = 2
const BUS_OBJERR = 3
const SEGV_MAPERR = 1
const SEGV_ACCERR = 2
const FPE_INTOVF = 1
const FPE_INTDIV = 2
const FPE_FLTDIV = 3
const FPE_FLTOVF = 4
const FPE_FLTUND = 5
const FPE_FLTRES = 6
const FPE_FLTINV = 7
const FPE_FLTSUB = 8
const TRAP_BRKPT = 1
const TRAP_TRACE = 2
const TRAP_DTRACE = 3
const CLD_EXITED = 1
const CLD_KILLED = 2
const CLD_DUMPED = 3
const CLD_TRAPPED = 4
const CLD_STOPPED = 5
const CLD_CONTINUED = 6
const POLL_IN = 1
const POLL_OUT = 2
const POLL_MSG = 3
const POLL_ERR = 4
const POLL_PRI = 5
const POLL_HUP = 6

union sigaction___sigaction_u
	__sa_handler as sub(byval as long)
	__sa_sigaction as sub(byval as long, byval as __siginfo ptr, byval as any ptr)
end union

type sigaction
	__sigaction_u as sigaction___sigaction_u
	sa_flags as long
	sa_mask as sigset_t
end type

#define sa_handler __sigaction_u.__sa_handler
#define sa_sigaction __sigaction_u.__sa_sigaction
const SA_NOCLDSTOP = &h0008
const SA_ONSTACK = &h0001
const SA_RESTART = &h0002
const SA_RESETHAND = &h0004
const SA_NODEFER = &h0010
const SA_NOCLDWAIT = &h0020
const SA_SIGINFO = &h0040
const NSIG = 32
const SI_NOINFO = 0
const SI_USER = &h10001
const SI_QUEUE = &h10002
const SI_TIMER = &h10003
const SI_ASYNCIO = &h10004
const SI_MESGQ = &h10005
const SI_KERNEL = &h10006
const SI_LWP = &h10007
const SI_UNDEFINED = 0
type sig_t as sub(byval as long)

type sigaltstack
	ss_sp as zstring ptr
	ss_size as __size_t
	ss_flags as long
end type

type stack_t as sigaltstack
const SS_ONSTACK = &h0001
const SS_DISABLE = &h0004
#define MINSIGSTKSZ __MINSIGSTKSZ
#define SIGSTKSZ (MINSIGSTKSZ + 32768)

type sigvec
	sv_handler as sub(byval as long)
	sv_mask as long
	sv_flags as long
end type

#define SV_ONSTACK SA_ONSTACK
#define SV_INTERRUPT SA_RESTART
#define SV_RESETHAND SA_RESETHAND
#define SV_NODEFER SA_NODEFER
#define SV_NOCLDSTOP SA_NOCLDSTOP
#define SV_SIGINFO SA_SIGINFO
#define sv_onstack sv_flags

type sigstack
	ss_sp as zstring ptr
	ss_onstack as long
end type

#define sigmask(m) (1 shl ((m) - 1))
#define BADSIG SIG_ERR
const SIG_BLOCK = 1
const SIG_UNBLOCK = 2
const SIG_SETMASK = 3
declare function signal(byval as long, byval as sub(byval as long)) as sub(byval as long)

extern sys_signame(0 to 31) as const zstring const ptr
extern sys_siglist(0 to 31) as const zstring const ptr
extern sys_nsig as const long
type __pthread_t as pthread ptr

declare function raise(byval as long) as long
declare function kill(byval as __pid_t, byval as long) as long
declare function pthread_kill(byval as __pthread_t, byval as long) as long
declare function pthread_sigmask(byval as long, byval as const __sigset_t ptr, byval as __sigset_t ptr) as long
declare function sigaction(byval as long, byval as const sigaction ptr, byval as sigaction ptr) as long
declare function sigaddset(byval as sigset_t ptr, byval as long) as long
declare function sigdelset(byval as sigset_t ptr, byval as long) as long
declare function sigemptyset(byval as sigset_t ptr) as long
declare function sigfillset(byval as sigset_t ptr) as long
declare function sigismember(byval as const sigset_t ptr, byval as long) as long
declare function sigpending(byval as sigset_t ptr) as long
declare function sigprocmask(byval as long, byval as const sigset_t ptr, byval as sigset_t ptr) as long
declare function sigsuspend(byval as const sigset_t ptr) as long
declare function sigwait(byval as const sigset_t ptr, byval as long ptr) as long
declare function sigqueue(byval as __pid_t, byval as long, byval as const sigval) as long
declare function sigtimedwait(byval as const sigset_t ptr, byval as siginfo_t ptr, byval as const timespec ptr) as long
declare function sigwaitinfo(byval as const sigset_t ptr, byval as siginfo_t ptr) as long
declare function killpg(byval as __pid_t, byval as long) as long
declare function sigaltstack(byval as const stack_t ptr, byval as stack_t ptr) as long
declare function sighold(byval as long) as long
declare function sigignore(byval as long) as long
declare function sigpause(byval as long) as long
declare function sigrelse(byval as long) as long
declare function sigset(byval as long, byval as sub(byval as long)) as sub(byval as long)
declare function xsi_sigpause(byval as long) as long
declare function siginterrupt(byval as long, byval as long) as long
declare sub psignal(byval as ulong, byval as const zstring ptr)
declare function sigblock(byval as long) as long
declare function sigreturn(byval as const __ucontext ptr) as long
declare function sigsetmask(byval as long) as long
declare function sigstack(byval as const sigstack ptr, byval as sigstack ptr) as long
declare function sigvec(byval as long, byval as sigvec ptr, byval as sigvec ptr) as long

end extern
