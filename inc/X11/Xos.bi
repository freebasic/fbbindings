'' FreeBASIC binding for xproto-7.0.27

#pragma once

#ifdef __FB_WIN32__
	#include once "crt/long.bi"
#endif

#include once "X11/Xosdefs.bi"
#include once "crt/sys/types.bi"
#include once "crt/string.bi"
#include once "fcntl.bi"

#ifdef __FB_WIN32__
	#include once "X11/Xw32defs.bi"
#else
	#include once "unistd.bi"
	#include once "sys/time.bi"
#endif

#include once "crt/time.bi"

#ifdef __FB_WIN32__
	#include once "sys/timeb.bi"
#endif

#include once "X11/Xarch.bi"

#define _XOS_H_
#define index(s, c) strchr((s), (c))
#define rindex(s, c) strrchr((s), (c))

#ifdef __FB_WIN32__
	type timeval
		tv_sec as clong
		tv_usec as clong
	end type

	#define _TIMEVAL_DEFINED
	#macro gettimeofday(t)
		scope
			dim _gtodtmp as _timeb
			_ftime(@_gtodtmp)
			'' TODO: (t)->tv_sec = _gtodtmp.time;
			'' TODO: (t)->tv_usec = _gtodtmp.millitm * 1000;
		end scope
	#endmacro
	#define X_GETTIMEOFDAY(t) gettimeofday(t)
#else
	#define X_GETTIMEOFDAY(t) gettimeofday(t, cptr(timezone ptr, 0))
#endif
