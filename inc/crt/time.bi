#pragma once

#if defined(__FB_DOS__)
	#include once "crt/dos/time.bi"
#elseif defined(__FB_LINUX__)
	#include once "crt/linux/time.bi"
#elseif defined(__FB_OPENBSD__)
	#include once "crt/openbsd/time.bi"
#elseif defined(__FB_FREEBSD__)
	#include once "crt/freebsd/time.bi"
#elseif defined(__FB_NETBSD__)
	#include once "crt/netbsd/time.bi"
#elseif defined(__FB_WIN32__)
	#include once "crt/win32/time.bi"
#endif
