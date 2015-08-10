'' FreeBASIC binding for djdev204
''
'' based on the C header files:
''   /* Copyright (C) 2003 DJ Delorie, see COPYING.DJ for details */
''   /* Copyright (C) 2002 DJ Delorie, see COPYING.DJ for details */
''   /* Copyright (C) 2001 DJ Delorie, see COPYING.DJ for details */
''   /* Copyright (C) 2000 DJ Delorie, see COPYING.DJ for details */
''   /* Copyright (C) 1999 DJ Delorie, see COPYING.DJ for details */
''   /* Copyright (C) 1997 DJ Delorie, see COPYING.DJ for details */
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

type blkcnt_t as long
type blksize_t as long
type dev_t as long
type fsblkcnt_t as culong
type fsfilcnt_t as culong
type ino_t as long
type mode_t as long
type nlink_t as long
type gid_t as long
type off_t as long
type offset_t as longint
type pid_t as long
type size_t as culong
type ssize_t as clong
type uid_t as long
const FD_SETSIZE = 256

type fd_set
	fd_bits(0 to ((256 + 7) / 8) - 1) as ubyte
end type

#define FD_SET(n, p) scope : (p)->fd_bits[((n) / 8)] or= 1 shl ((n) and 7) : end scope
#define FD_CLR(n, p) scope : (p)->fd_bits[((n) / 8)] and= not (1 shl ((n) and 7)) : end scope
#define FD_ISSET(n, p) ((p)->fd_bits[((n) / 8)] and (1 shl ((n) and 7)))
#define FD_ZERO(p) memset(cptr(any ptr, (p)), 0, sizeof(*(p)))
type time_t as ulong
