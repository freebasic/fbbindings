'' FreeBASIC binding for djdev204
''
'' based on the C header files:
''   /* Copyright (C) 2003 DJ Delorie, see COPYING.DJ for details */
''   /* Copyright (C) 2000 DJ Delorie, see COPYING.DJ for details */
''   /* Copyright (C) 1998 DJ Delorie, see COPYING.DJ for details */
''   /* Copyright (C) 1995 DJ Delorie, see COPYING.DJ for details */
''   Source code copyright DJ Delorie is distributed under the terms of the
''   GNU General Public Licence, with the following exceptions:
''
''   * Sources used to build crt0.o, gcrt0.o, libc.a, libdbg.a, and
''     libemu.a are distributed under the terms of the GNU Library General
''     Public License, rather than the GNU GPL.
''
''   * Any existing copyright or authorship information in any given source
''     file must remain intact.  If you modify a source file, a notice to that
''     effect must be added to the authorship information in the source file. 
''
''   * Runtime binaries, as provided by DJ in DJGPP, may be distributed
''     without sources ONLY if the recipient is given sufficient information
''     to obtain a copy of djgpp themselves.  This primarily applies to
''     go32-v2.exe, emu387.dxe, and stubedit.exe.
''
''   * Runtime objects and libraries, as provided by DJ in DJGPP, when
''     linked into an application, may be distributed without sources ONLY
''     if the recipient is given sufficient information to obtain a copy of
''
'' translated to FreeBASIC by:
''   Copyright © 2015 FreeBASIC development team

#pragma once

#include once "crt/long.bi"

extern "C"

const SIGABRT = 288
const SIGFPE = 289
const SIGILL = 290
const SIGSEGV = 291
const SIGTERM = 292
const SIGINT = 295
const SIG_DFL = cptr(sub(byval as long), 0)
const SIG_ERR = cptr(sub(byval as long), 1)
const SIG_IGN = cptr(sub(byval as long), -1)
type sig_atomic_t as long
declare function raise(byval _sig as long) as long
declare function signal(byval _sig as long, byval _func as sub(byval as long)) as sub(byval as long)
const SA_NOCLDSTOP = 1
const SIGALRM = 293
const SIGHUP = 294
const SIGKILL = 296
const SIGPIPE = 297
const SIGQUIT = 298
const SIGUSR1 = 299
const SIGUSR2 = 300
const SIG_BLOCK = 1
const SIG_SETMASK = 2
const SIG_UNBLOCK = 3

type sigset_t
	__bits(0 to 9) as culong
end type

type sigaction
	sa_flags as long
	sa_handler as sub(byval as long)
	sa_mask as sigset_t
end type

declare function kill(byval _pid as pid_t, byval _sig as long) as long
declare function sigaction(byval _sig as long, byval _act as const sigaction ptr, byval _oact as sigaction ptr) as long
declare function sigaddset(byval _set as sigset_t ptr, byval _signo as long) as long
declare function sigdelset(byval _set as sigset_t ptr, byval _signo as long) as long
declare function sigemptyset(byval _set as sigset_t ptr) as long
declare function sigfillset(byval _set as sigset_t ptr) as long
declare function sigismember(byval _set as const sigset_t ptr, byval _signo as long) as long
declare function sigpending(byval _set as sigset_t ptr) as long
declare function sigprocmask(byval _how as long, byval _set as const sigset_t ptr, byval _oset as sigset_t ptr) as long
declare function sigsuspend(byval _set as const sigset_t ptr) as long

const SIGNOFP = 301
const SIGTRAP = 302
const SIGTIMR = 303
const SIGPROF = 304
const SIGMAX = 320
declare sub __djgpp_traceback_exit(byval _sig as long)
#define NSIG SIGMAX
extern sys_siglist(0 to NSIG + 1 - 1) as zstring ptr
declare sub psignal(byval _sig as long, byval _msg as const zstring ptr)

end extern
