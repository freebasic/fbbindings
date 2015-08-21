'' FreeBASIC binding for NetBSD-6.1.5
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

#include once "crt/long.bi"
#include once "crt/sys/types.bi"

extern "C"

type sigset_t
	__bits(0 to 3) as __uint32_t
end type

#define __sigmask(n) (1 shl culng(culng(culng(n) - 1) and 31))
#define __sigword(n) culng(culng(culng(n) - 1) shr 5)
#define __sigaddset(s, n) scope : (s)->__bits[__sigword(n)] or= __sigmask(n) : end scope
#define __sigdelset(s, n) scope : (s)->__bits[__sigword(n)] and= not __sigmask(n) : end scope
#define __sigismember(s, n) (((s)->__bits[__sigword(n)] and __sigmask(n)) <> 0)
#macro __sigemptyset(s)
	scope
		(s)->__bits[0] = &h00000000
		(s)->__bits[1] = &h00000000
		(s)->__bits[2] = &h00000000
		(s)->__bits[3] = &h00000000
	end scope
#endmacro
#define __sigsetequal(s1, s2) (((((s1)->__bits[0] = (s2)->__bits[0]) andalso ((s1)->__bits[1] = (s2)->__bits[1])) andalso ((s1)->__bits[2] = (s2)->__bits[2])) andalso ((s1)->__bits[3] = (s2)->__bits[3]))
#macro __sigfillset(s)
	scope
		(s)->__bits[0] = &hffffffff
		(s)->__bits[1] = &hffffffff
		(s)->__bits[2] = &hffffffff
		(s)->__bits[3] = &hffffffff
	end scope
#endmacro
#macro __sigplusset(s, t)
	scope
		(t)->__bits[0] or= (s)->__bits[0]
		(t)->__bits[1] or= (s)->__bits[1]
		(t)->__bits[2] or= (s)->__bits[2]
		(t)->__bits[3] or= (s)->__bits[3]
	end scope
#endmacro
#macro __sigminusset(s, t)
	scope
		(t)->__bits[0] and= not (s)->__bits[0]
		(t)->__bits[1] and= not (s)->__bits[1]
		(t)->__bits[2] and= not (s)->__bits[2]
		(t)->__bits[3] and= not (s)->__bits[3]
	end scope
#endmacro
#macro __sigandset(s, t)
	scope
		(t)->__bits[0] and= (s)->__bits[0]
		(t)->__bits[1] and= (s)->__bits[1]
		(t)->__bits[2] and= (s)->__bits[2]
		(t)->__bits[3] and= (s)->__bits[3]
	end scope
#endmacro

type sigaltstack
	ss_sp as any ptr
	ss_size as uinteger
	ss_flags as long
end type

type stack_t as sigaltstack
const _NSIG = 64
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
const SIGPWR = 32
const SIG_DFL = cptr(sub(byval as long), 0)
const SIG_IGN = cptr(sub(byval as long), 1)
const SIG_ERR = cptr(sub(byval as long), -1)
const SIG_HOLD = cptr(sub(byval as long), 3)
type sig_atomic_t as long

#ifdef __FB_ARM__
	type sigcontext
		sc_onstack as long
		__sc_mask13 as long
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
		sc_mask as sigset_t
	end type

	const SIG_CODE_FPE_CODE_MASK = &h00000f00
	const SIG_CODE_FPE_CODE_SHIFT = 8
	const SIG_CODE_FPE_TYPE_MASK = &h000000ff
	const SIG_CODE_BUS_ADDR_MASK = &hfffffff0
	const SIG_CODE_BUS_TYPE_MASK = &h0000000f
	#define SIG_CODE_SEGV_ADDR_MASK SIG_CODE_BUS_ADDR_MASK
	#define SIG_CODE_SEGV_TYPE_MASK SIG_CODE_BUS_TYPE_MASK
#endif

union sigval
	sival_int as long
	sival_ptr as any ptr
end union

type sigval_t as sigval

type _ksiginfo__reason__rt
	_pid as __pid_t
	_uid as __uid_t
	_value as sigval_t
end type

type _ksiginfo__reason__child
	_pid as __pid_t
	_uid as __uid_t
	_status as long
	_utime as clock_t
	_stime as clock_t
end type

type _ksiginfo__reason__fault
	_addr as any ptr
	_trap as long
end type

type _ksiginfo__reason__poll
	_band as clong
	_fd as long
end type

union _ksiginfo__reason
	_rt as _ksiginfo__reason__rt
	_child as _ksiginfo__reason__child
	_fault as _ksiginfo__reason__fault
	_poll as _ksiginfo__reason__poll
end union

type _ksiginfo
	_signo as long
	_code as long
	_errno as long

	#ifdef __FB_64BIT__
		_pad as long
	#endif

	_reason as _ksiginfo__reason
end type

union siginfo
	si_pad as zstring * 128
	_info as _ksiginfo
end union

type siginfo_t as siginfo
#define si_signo _info._signo
#define si_code _info._code
#define si_errno _info._errno
#define si_value _info._reason._rt._value
#define si_pid _info._reason._child._pid
#define si_uid _info._reason._child._uid
#define si_status _info._reason._child._status
#define si_utime _info._reason._child._utime
#define si_stime _info._reason._child._stime
#define si_addr _info._reason._fault._addr
#define si_trap _info._reason._fault._trap
#define si_band _info._reason._poll._band
#define si_fd _info._reason._poll._fd
const ILL_ILLOPC = 1
const ILL_ILLOPN = 2
const ILL_ILLADR = 3
const ILL_ILLTRP = 4
const ILL_PRVOPC = 5
const ILL_PRVREG = 6
const ILL_COPROC = 7
const ILL_BADSTK = 8
const FPE_INTDIV = 1
const FPE_INTOVF = 2
const FPE_FLTDIV = 3
const FPE_FLTOVF = 4
const FPE_FLTUND = 5
const FPE_FLTRES = 6
const FPE_FLTINV = 7
const FPE_FLTSUB = 8
const SEGV_MAPERR = 1
const SEGV_ACCERR = 2
const BUS_ADRALN = 1
const BUS_ADRERR = 2
const BUS_OBJERR = 3
const TRAP_BRKPT = 1
const TRAP_TRACE = 2
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
const SI_USER = 0
const SI_QUEUE = -1
const SI_TIMER = -2
const SI_ASYNCIO = -3
const SI_MESGQ = -4
const SI_LWP = -5
const SI_NOINFO = 32767

union sigaction__sa_u
	_sa_handler as sub(byval as long)
	_sa_sigaction as sub(byval as long, byval as siginfo_t ptr, byval as any ptr)
end union

type sigaction
	_sa_u as sigaction__sa_u
	sa_mask as sigset_t
	sa_flags as long
end type

#define sa_handler _sa_u._sa_handler
#define sa_sigaction _sa_u._sa_sigaction
const SA_ONSTACK = &h0001
const SA_RESTART = &h0002
const SA_RESETHAND = &h0004
const SA_NODEFER = &h0010
const SA_NOCLDSTOP = &h0008
const SA_NOCLDWAIT = &h0020
const SA_SIGINFO = &h0040
const SA_NOKERNINFO = &h0080
const SIG_BLOCK = 1
const SIG_UNBLOCK = 2
const SIG_SETMASK = 3
type sig_t as sub(byval as long)
const SS_ONSTACK = &h0001
const SS_DISABLE = &h0004
const MINSIGSTKSZ = 8192
#define SIGSTKSZ (MINSIGSTKSZ + 32768)

type sigstack
	ss_sp as any ptr
	ss_onstack as long
end type

#define sigmask(n) __sigmask(n)
#define BADSIG SIG_ERR

type sigevent
	sigev_notify as long
	sigev_signo as long
	sigev_value as sigval
	sigev_notify_function as sub(byval as sigval)
	sigev_notify_attributes as any ptr
end type

const SIGEV_NONE = 0
const SIGEV_SIGNAL = 1
const SIGEV_THREAD = 2
const SIGEV_SA = 3

declare function signal(byval as long, byval as sub(byval as long)) as sub(byval as long)
declare function sigqueue(byval as __pid_t, byval as long, byval as const sigval) as long
declare function sigqueueinfo(byval as __pid_t, byval as const siginfo_t ptr) as long

extern sys_signame alias "__sys_signame14" as const zstring const ptr ptr
extern sys_siglist alias "__sys_siglist14" as const zstring const ptr ptr
extern sys_nsig alias "__sys_nsig14" as const long

declare function raise(byval as long) as long
declare function kill(byval as __pid_t, byval as long) as long
declare function __libc_sigaction14(byval as long, byval as const sigaction ptr, byval as sigaction ptr) as long
declare function pthread_sigmask(byval as long, byval as const sigset_t ptr, byval as sigset_t ptr) as long
declare function pthread_kill(byval as pthread_t, byval as long) as long
declare function __libc_thr_sigsetmask(byval as long, byval as const sigset_t ptr, byval as sigset_t ptr) as long
#define pthread_sigmask __libc_thr_sigsetmask
declare function sigaction alias "__sigaction14"(byval as long, byval as const sigaction ptr, byval as sigaction ptr) as long
declare function sigaddset alias "__sigaddset14"(byval as sigset_t ptr, byval as long) as long
declare function sigdelset alias "__sigdelset14"(byval as sigset_t ptr, byval as long) as long
declare function sigemptyset alias "__sigemptyset14"(byval as sigset_t ptr) as long
declare function sigfillset alias "__sigfillset14"(byval as sigset_t ptr) as long
declare function sigismember alias "__sigismember14"(byval as const sigset_t ptr, byval as long) as long
declare function sigpending alias "__sigpending14"(byval as sigset_t ptr) as long
declare function sigprocmask alias "__sigprocmask14"(byval as long, byval as const sigset_t ptr, byval as sigset_t ptr) as long
declare function sigsuspend alias "__sigsuspend14"(byval as const sigset_t ptr) as long
declare function __errno() as long ptr
#define __errno __errno
#define ___errno (*__errno())

private function sigaddset(byval set as sigset_t ptr, byval signo as long) as long
	if (signo <= 0) orelse (signo >= 64) then
		(*__errno()) = 22
		return -1
	end if
	set->__bits[culng(culng(culng(signo) - 1) shr 5)] or= 1 shl culng(culng(culng(signo) - 1) and 31)
	return 0
end function

private function sigdelset(byval set as sigset_t ptr, byval signo as long) as long
	if (signo <= 0) orelse (signo >= 64) then
		(*__errno()) = 22
		return -1
	end if
	set->__bits[culng(culng(culng(signo) - 1) shr 5)] and= not (1 shl culng(culng(culng(signo) - 1) and 31))
	return 0
end function

private function sigismember(byval set as const sigset_t ptr, byval signo as long) as long
	if (signo <= 0) orelse (signo >= 64) then
		(*__errno()) = 22
		return -1
	end if
	return -((set->__bits[culng(culng(culng(signo) - 1) shr 5)] and (1 shl culng(culng(culng(signo) - 1) and 31))) <> 0)
end function

private function sigemptyset(byval set as sigset_t ptr) as long
	set->__bits[0] = &h00000000
	set->__bits[1] = &h00000000
	set->__bits[2] = &h00000000
	set->__bits[3] = &h00000000
	return 0
end function

private function sigfillset(byval set as sigset_t ptr) as long
	set->__bits[0] = &hffffffff
	set->__bits[1] = &hffffffff
	set->__bits[2] = &hffffffff
	set->__bits[3] = &hffffffff
	return 0
end function

declare function killpg(byval as __pid_t, byval as long) as long
declare function siginterrupt(byval as long, byval as long) as long
declare function sigstack(byval as const sigstack ptr, byval as sigstack ptr) as long
declare function sigaltstack alias "__sigaltstack14"(byval as const stack_t ptr, byval as stack_t ptr) as long
declare function sighold(byval as long) as long
declare function sigignore(byval as long) as long
declare function sigpause(byval as long) as long
declare function sigrelse(byval as long) as long
declare function sigset(byval as long, byval as sub(byval as long)) as sub(byval as long)
declare function sigwait(byval as const sigset_t ptr, byval as long ptr) as long
declare function sigwaitinfo(byval as const sigset_t ptr, byval as siginfo_t ptr) as long
declare sub psiginfo(byval as const siginfo_t ptr, byval as const zstring ptr)
type timespec as timespec_
declare function sigtimedwait alias "__sigtimedwait50"(byval as const sigset_t ptr, byval as siginfo_t ptr, byval as const timespec ptr) as long
declare function __sigtimedwait alias "____sigtimedwait50"(byval as const sigset_t ptr, byval as siginfo_t ptr, byval as timespec ptr) as long
declare sub psignal(byval as long, byval as const zstring ptr)
declare function sigblock(byval as long) as long
declare function sigsetmask(byval as long) as long

end extern
