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

#include once "_mingw.bi"
#include once "sdkddkver.bi"
#include once "excpt.bi"
#include once "crt/stdarg.bi"
#include once "windef.bi"
#include once "winbase.bi"
#include once "wingdi.bi"
#include once "winuser.bi"
#include once "winnls.bi"
#include once "wincon.bi"
#include once "winver.bi"
#include once "winreg.bi"
#include once "winnetwk.bi"
#include once "virtdisk.bi"

#ifndef WIN32_LEAN_AND_MEAN
	#include once "cderr.bi"
	#include once "dde.bi"
	#include once "ddeml.bi"
	#include once "dlgs.bi"
	#include once "lzexpand.bi"
	#include once "mmsystem.bi"
	#include once "nb30.bi"
	#include once "rpc.bi"
	#include once "shellapi.bi"
	#include once "winperf.bi"
	#include once "winsock.bi"
	#include once "wincrypt.bi"
	#include once "winefs.bi"
	#include once "winscard.bi"
	#include once "winspool.bi"
	#include once "ole2.bi"
	#include once "commdlg.bi"
#endif

#include once "stralign.bi"
#include once "winsvc.bi"
#include once "mcx.bi"
#include once "imm.bi"

#define _WINDOWS_
#define _INC_WINDOWS

#ifdef __FB_64BIT__
	#define _AMD64_
#endif
