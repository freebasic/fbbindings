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
#include once "crt/bits/types.bi"
#include once "crt/time.bi"
#include once "crt/bits/wordsize.bi"
#include once "crt/linux/asm/sigcontext.bi"
#include once "crt/stddef.bi"
#include once "crt/bits/pthreadtypes.bi"

extern "C"

const _SIGSET_H_types = 1
type __sig_atomic_t as long
#define _SIGSET_NWORDS (1024 / (8 * sizeof(culong)))

type __sigset_t
	__val(0 to (1024 / (8 * sizeof(culong))) - 1) as culong
end type

const _SIGSET_H_fns = 1
#define _EXTERN_INLINE __extern_inline
#define __sigmask(sig) (cast(culong, 1) shl (((sig) - 1) mod (8 * sizeof(culong))))
#define __sigword(sig) (((sig) - 1) / (8 * sizeof(culong)))

'' TODO: # define __sigemptyset(set) (__extension__ ({ int __cnt = _SIGSET_NWORDS; sigset_t *__set = (set); while (--__cnt >= 0) __set->__val[__cnt] = 0; 0; }))
'' TODO: # define __sigfillset(set) (__extension__ ({ int __cnt = _SIGSET_NWORDS; sigset_t *__set = (set); while (--__cnt >= 0) __set->__val[__cnt] = ~0UL; 0; }))
'' TODO: # define __sigisemptyset(set) (__extension__ ({ int __cnt = _SIGSET_NWORDS; const sigset_t *__set = (set); int __ret = __set->__val[--__cnt]; while (!__ret && --__cnt >= 0) __ret = __set->__val[__cnt]; __ret == 0; }))
'' TODO: # define __sigandset(dest, left, right) (__extension__ ({ int __cnt = _SIGSET_NWORDS; sigset_t *__dest = (dest); const sigset_t *__left = (left); const sigset_t *__right = (right); while (--__cnt >= 0) __dest->__val[__cnt] = (__left->__val[__cnt] & __right->__val[__cnt]); 0; }))
'' TODO: # define __sigorset(dest, left, right) (__extension__ ({ int __cnt = _SIGSET_NWORDS; sigset_t *__dest = (dest); const sigset_t *__left = (left); const sigset_t *__right = (right); while (--__cnt >= 0) __dest->__val[__cnt] = (__left->__val[__cnt] | __right->__val[__cnt]); 0; }))

declare function __sigismember(byval as const __sigset_t ptr, byval as long) as long
declare function __sigaddset(byval as __sigset_t ptr, byval as long) as long
declare function __sigdelset(byval as __sigset_t ptr, byval as long) as long
type sig_atomic_t as __sig_atomic_t

#define SIG_ERR cast(__sighandler_t, -1)
#define SIG_DFL cast(__sighandler_t, 0)
#define SIG_IGN cast(__sighandler_t, 1)
#define SIG_HOLD cast(__sighandler_t, 2)
const SIGHUP = 1
const SIGINT = 2
const SIGQUIT = 3
const SIGILL = 4
const SIGTRAP = 5
const SIGABRT = 6
const SIGIOT = 6
const SIGBUS = 7
const SIGFPE = 8
const SIGKILL = 9
const SIGUSR1 = 10
const SIGSEGV = 11
const SIGUSR2 = 12
const SIGPIPE = 13
const SIGALRM = 14
const SIGTERM = 15
const SIGSTKFLT = 16
#define SIGCLD SIGCHLD
const SIGCHLD = 17
const SIGCONT = 18
const SIGSTOP = 19
const SIGTSTP = 20
const SIGTTIN = 21
const SIGTTOU = 22
const SIGURG = 23
const SIGXCPU = 24
const SIGXFSZ = 25
const SIGVTALRM = 26
const SIGPROF = 27
const SIGWINCH = 28
#define SIGPOLL SIGIO
const SIGIO = 29
const SIGPWR = 30
const SIGSYS = 31
const SIGUNUSED = 31
const _NSIG = 65
#define SIGRTMIN __libc_current_sigrtmin()
#define SIGRTMAX __libc_current_sigrtmax()
const __SIGRTMIN = 32
#define __SIGRTMAX (_NSIG - 1)
const __have_sigval_t = 1

union sigval
	sival_int as long
	sival_ptr as any ptr
end union

type sigval_t as sigval
const __have_siginfo_t = 1
const __SI_MAX_SIZE = 128

#ifdef __FB_64BIT__
	#define __SI_PAD_SIZE ((__SI_MAX_SIZE / sizeof(long)) - 4)
#else
	#define __SI_PAD_SIZE ((__SI_MAX_SIZE / sizeof(long)) - 3)
#endif

type siginfo_t__sifields__kill
	si_pid as __pid_t
	si_uid as __uid_t
end type

type siginfo_t__sifields__timer
	si_tid as long
	si_overrun as long
	si_sigval as sigval_t
end type

type siginfo_t__sifields__rt
	si_pid as __pid_t
	si_uid as __uid_t
	si_sigval as sigval_t
end type

type siginfo_t__sifields__sigchld
	si_pid as __pid_t
	si_uid as __uid_t
	si_status as long
	si_utime as __clock_t
	si_stime as __clock_t
end type

type siginfo_t__sifields__sigfault
	si_addr as any ptr
	si_addr_lsb as short
end type

type siginfo_t__sifields__sigpoll
	si_band as clong
	si_fd as long
end type

type siginfo_t__sifields__sigsys
	_call_addr as any ptr
	_syscall as long
	_arch as ulong
end type

union siginfo_t__sifields
	#ifdef __FB_64BIT__
		_pad(0 to ((128 / sizeof(long)) - 4) - 1) as long
	#else
		_pad(0 to ((128 / sizeof(long)) - 3) - 1) as long
	#endif

	_kill as siginfo_t__sifields__kill
	_timer as siginfo_t__sifields__timer
	_rt as siginfo_t__sifields__rt
	_sigchld as siginfo_t__sifields__sigchld
	_sigfault as siginfo_t__sifields__sigfault
	_sigpoll as siginfo_t__sifields__sigpoll
	_sigsys as siginfo_t__sifields__sigsys
end union

type siginfo_t
	si_signo as long
	si_errno as long
	si_code as long
	_sifields as siginfo_t__sifields
end type

#define si_pid _sifields._kill.si_pid
#define si_uid _sifields._kill.si_uid
#define si_timerid _sifields._timer.si_tid
#define si_overrun _sifields._timer.si_overrun
#define si_status _sifields._sigchld.si_status
#define si_utime _sifields._sigchld.si_utime
#define si_stime _sifields._sigchld.si_stime
#define si_value _sifields._rt.si_sigval
#define si_int _sifields._rt.si_sigval.sival_int
#define si_ptr _sifields._rt.si_sigval.sival_ptr
#define si_addr _sifields._sigfault.si_addr
#define si_addr_lsb _sifields._sigfault.si_addr_lsb
#define si_band _sifields._sigpoll.si_band
#define si_fd _sifields._sigpoll.si_fd
#define si_call_addr _sifields._sigsys._call_addr
#define si_syscall _sifields._sigsys._syscall
#define si_arch _sifields._sigsys._arch

enum
	SI_ASYNCNL = -60
	SI_TKILL = -6
	SI_SIGIO
	SI_ASYNCIO
	SI_MESGQ
	SI_TIMER
	SI_QUEUE
	SI_USER
	SI_KERNEL = &h80
end enum

#define SI_ASYNCNL SI_ASYNCNL
#define SI_TKILL SI_TKILL
#define SI_SIGIO SI_SIGIO
#define SI_ASYNCIO SI_ASYNCIO
#define SI_MESGQ SI_MESGQ
#define SI_TIMER SI_TIMER
#define SI_QUEUE SI_QUEUE
#define SI_USER SI_USER
#define SI_KERNEL SI_KERNEL

enum
	ILL_ILLOPC = 1
	ILL_ILLOPN
	ILL_ILLADR
	ILL_ILLTRP
	ILL_PRVOPC
	ILL_PRVREG
	ILL_COPROC
	ILL_BADSTK
end enum

#define ILL_ILLOPC ILL_ILLOPC
#define ILL_ILLOPN ILL_ILLOPN
#define ILL_ILLADR ILL_ILLADR
#define ILL_ILLTRP ILL_ILLTRP
#define ILL_PRVOPC ILL_PRVOPC
#define ILL_PRVREG ILL_PRVREG
#define ILL_COPROC ILL_COPROC
#define ILL_BADSTK ILL_BADSTK

enum
	FPE_INTDIV = 1
	FPE_INTOVF
	FPE_FLTDIV
	FPE_FLTOVF
	FPE_FLTUND
	FPE_FLTRES
	FPE_FLTINV
	FPE_FLTSUB
end enum

#define FPE_INTDIV FPE_INTDIV
#define FPE_INTOVF FPE_INTOVF
#define FPE_FLTDIV FPE_FLTDIV
#define FPE_FLTOVF FPE_FLTOVF
#define FPE_FLTUND FPE_FLTUND
#define FPE_FLTRES FPE_FLTRES
#define FPE_FLTINV FPE_FLTINV
#define FPE_FLTSUB FPE_FLTSUB

enum
	SEGV_MAPERR = 1
	SEGV_ACCERR
end enum

#define SEGV_MAPERR SEGV_MAPERR
#define SEGV_ACCERR SEGV_ACCERR

enum
	BUS_ADRALN = 1
	BUS_ADRERR
	BUS_OBJERR
	BUS_MCEERR_AR
	BUS_MCEERR_AO
end enum

#define BUS_ADRALN BUS_ADRALN
#define BUS_ADRERR BUS_ADRERR
#define BUS_OBJERR BUS_OBJERR
#define BUS_MCEERR_AR BUS_MCEERR_AR
#define BUS_MCEERR_AO BUS_MCEERR_AO

enum
	TRAP_BRKPT = 1
	TRAP_TRACE
end enum

#define TRAP_BRKPT TRAP_BRKPT
#define TRAP_TRACE TRAP_TRACE

enum
	CLD_EXITED = 1
	CLD_KILLED
	CLD_DUMPED
	CLD_TRAPPED
	CLD_STOPPED
	CLD_CONTINUED
end enum

#define CLD_EXITED CLD_EXITED
#define CLD_KILLED CLD_KILLED
#define CLD_DUMPED CLD_DUMPED
#define CLD_TRAPPED CLD_TRAPPED
#define CLD_STOPPED CLD_STOPPED
#define CLD_CONTINUED CLD_CONTINUED

enum
	POLL_IN = 1
	POLL_OUT
	POLL_MSG
	POLL_ERR
	POLL_PRI
	POLL_HUP
end enum

#define POLL_IN POLL_IN
#define POLL_OUT POLL_OUT
#define POLL_MSG POLL_MSG
#define POLL_ERR POLL_ERR
#define POLL_PRI POLL_PRI
#define POLL_HUP POLL_HUP
const __have_sigevent_t = 1
const __SIGEV_MAX_SIZE = 64

#ifdef __FB_64BIT__
	#define __SIGEV_PAD_SIZE ((__SIGEV_MAX_SIZE / sizeof(long)) - 4)
#else
	#define __SIGEV_PAD_SIZE ((__SIGEV_MAX_SIZE / sizeof(long)) - 3)
#endif

#if defined(__FB_64BIT__) and defined(__FB_ARM__)
	const __have_pthread_attr_t = 1
#endif

type sigevent__sigev_un__sigev_thread
	_function as sub(byval as sigval_t)
	_attribute as pthread_attr_t ptr
end type

union sigevent__sigev_un
	#ifdef __FB_64BIT__
		_pad(0 to ((64 / sizeof(long)) - 4) - 1) as long
	#else
		_pad(0 to ((64 / sizeof(long)) - 3) - 1) as long
	#endif

	_tid as __pid_t
	_sigev_thread as sigevent__sigev_un__sigev_thread
end union

type sigevent
	sigev_value as sigval_t
	sigev_signo as long
	sigev_notify as long
	_sigev_un as sigevent__sigev_un
end type

type sigevent_t as sigevent
#define sigev_notify_function _sigev_un._sigev_thread._function
#define sigev_notify_attributes _sigev_un._sigev_thread._attribute

enum
	SIGEV_SIGNAL = 0
	SIGEV_NONE
	SIGEV_THREAD
	SIGEV_THREAD_ID = 4
end enum

#define SIGEV_SIGNAL SIGEV_SIGNAL
#define SIGEV_NONE SIGEV_NONE
#define SIGEV_THREAD SIGEV_THREAD
#define SIGEV_THREAD_ID SIGEV_THREAD_ID
type __sighandler_t as sub(byval as long)

declare function __sysv_signal(byval __sig as long, byval __handler as __sighandler_t) as __sighandler_t
declare function sysv_signal(byval __sig as long, byval __handler as __sighandler_t) as __sighandler_t
declare function signal(byval __sig as long, byval __handler as __sighandler_t) as __sighandler_t
declare function bsd_signal(byval __sig as long, byval __handler as __sighandler_t) as __sighandler_t
declare function kill(byval __pid as __pid_t, byval __sig as long) as long
declare function killpg(byval __pgrp as __pid_t, byval __sig as long) as long
declare function raise(byval __sig as long) as long
declare function ssignal(byval __sig as long, byval __handler as __sighandler_t) as __sighandler_t
declare function gsignal(byval __sig as long) as long
declare sub psignal(byval __sig as long, byval __s as const zstring ptr)
declare sub psiginfo(byval __pinfo as const siginfo_t ptr, byval __s as const zstring ptr)
declare function sigpause alias "__xpg_sigpause"(byval __sig as long) as long
#define sigmask(sig) __sigmask(sig)
declare function sigblock(byval __mask as long) as long
declare function sigsetmask(byval __mask as long) as long
declare function siggetmask() as long
#define NSIG _NSIG
type sighandler_t as __sighandler_t
type sig_t as __sighandler_t
declare function sigemptyset(byval __set as sigset_t ptr) as long
declare function sigfillset(byval __set as sigset_t ptr) as long
declare function sigaddset(byval __set as sigset_t ptr, byval __signo as long) as long
declare function sigdelset(byval __set as sigset_t ptr, byval __signo as long) as long
declare function sigismember(byval __set as const sigset_t ptr, byval __signo as long) as long
declare function sigisemptyset(byval __set as const sigset_t ptr) as long
declare function sigandset(byval __set as sigset_t ptr, byval __left as const sigset_t ptr, byval __right as const sigset_t ptr) as long
declare function sigorset(byval __set as sigset_t ptr, byval __left as const sigset_t ptr, byval __right as const sigset_t ptr) as long

union sigaction___sigaction_handler
	sa_handler as __sighandler_t
	sa_sigaction as sub(byval as long, byval as siginfo_t ptr, byval as any ptr)
end union

type sigaction
	__sigaction_handler as sigaction___sigaction_handler
	sa_mask as __sigset_t
	sa_flags as long
	sa_restorer as sub()
end type

#define sa_handler __sigaction_handler.sa_handler
#define sa_sigaction __sigaction_handler.sa_sigaction
const SA_NOCLDSTOP = 1
const SA_NOCLDWAIT = 2
const SA_SIGINFO = 4
const SA_ONSTACK = &h08000000
const SA_RESTART = &h10000000
const SA_NODEFER = &h40000000
const SA_RESETHAND = &h80000000
const SA_INTERRUPT = &h20000000
#define SA_NOMASK SA_NODEFER
#define SA_ONESHOT SA_RESETHAND
#define SA_STACK SA_ONSTACK
const SIG_BLOCK = 0
const SIG_UNBLOCK = 1
const SIG_SETMASK = 2

declare function sigprocmask(byval __how as long, byval __set as const sigset_t ptr, byval __oset as sigset_t ptr) as long
declare function sigsuspend(byval __set as const sigset_t ptr) as long
declare function sigaction(byval __sig as long, byval __act as const sigaction ptr, byval __oact as sigaction ptr) as long
declare function sigpending(byval __set as sigset_t ptr) as long
declare function sigwait(byval __set as const sigset_t ptr, byval __sig as long ptr) as long
declare function sigwaitinfo(byval __set as const sigset_t ptr, byval __info as siginfo_t ptr) as long
declare function sigtimedwait(byval __set as const sigset_t ptr, byval __info as siginfo_t ptr, byval __timeout as const timespec ptr) as long
declare function sigqueue(byval __pid as __pid_t, byval __sig as long, byval __val as const sigval) as long
extern _sys_siglist(0 to 64) as const zstring const ptr
extern sys_siglist(0 to 64) as const zstring const ptr
#define sigcontext_struct sigcontext
declare function sigreturn(byval __scp as sigcontext ptr) as long
declare function siginterrupt(byval __sig as long, byval __interrupt as long) as long

type sigstack
	ss_sp as any ptr
	ss_onstack as long
end type

enum
	SS_ONSTACK = 1
	SS_DISABLE
end enum

#define SS_ONSTACK SS_ONSTACK
#define SS_DISABLE SS_DISABLE
const MINSIGSTKSZ = 2048
const SIGSTKSZ = 8192

type sigaltstack
	ss_sp as any ptr
	ss_flags as long
	ss_size as uinteger
end type

type stack_t as sigaltstack
declare function sigstack(byval __ss as sigstack ptr, byval __oss as sigstack ptr) as long
declare function sigaltstack(byval __ss as const sigaltstack ptr, byval __oss as sigaltstack ptr) as long
declare function sighold(byval __sig as long) as long
declare function sigrelse(byval __sig as long) as long
declare function sigignore(byval __sig as long) as long
declare function sigset(byval __sig as long, byval __disp as __sighandler_t) as __sighandler_t
const _BITS_SIGTHREAD_H = 1
declare function pthread_sigmask(byval __how as long, byval __newmask as const __sigset_t ptr, byval __oldmask as __sigset_t ptr) as long
declare function __libc_current_sigrtmin() as long
declare function __libc_current_sigrtmax() as long

end extern
