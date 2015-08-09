'' FreeBASIC binding for mingw-w64-v4.0.1
''
'' based on the C header files:
''   DISCLAIMER
''   This file has no copyright assigned and is placed in the Public Domain.
''   This file is part of the mingw-w64 runtime package.
''
''   The mingw-w64 runtime package and its code is distributed in the hope that it 
''   will be useful but WITHOUT ANY WARRANTY.  ALL WARRANTIES, EXPRESSED OR 
''   IMPLIED ARE HEREBY DISCLAIMED.  This includes but is not limited to 
''   warranties of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
''
'' translated to FreeBASIC by:
''   Copyright © 2015 FreeBASIC development team

#pragma once

#include once "crtdefs.bi"

type _ino_t as ushort
type ino_t as ushort
type _dev_t as ulong
type dev_t as ulong

#ifdef __FB_64BIT__
	type _pid_t as longint
#else
	type _pid_t as long
#endif

#undef pid_t
type pid_t as _pid_t
type _mode_t as ushort
type mode_t as _mode_t
type _off_t as long
type off32_t as long
type _off64_t as longint
type off64_t as longint
type off_t as off32_t
type useconds_t as ulong

type timespec
	tv_sec as time_t
	tv_nsec as long
end type

type itimerspec
	it_interval as timespec
	it_value as timespec
end type

#ifdef __FB_64BIT__
	type _sigset_t as ulongint
#else
	type _sigset_t as ulong
#endif
