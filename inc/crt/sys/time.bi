#pragma once

#if defined(__FB_DOS__)
	#include once "crt/sys/dos/time.bi"
#elseif defined(__FB_LINUX__)
	#include once "crt/sys/linux/time.bi"
#elseif defined(__FB_OPENBSD__)
	#include once "crt/sys/openbsd/time.bi"
#elseif defined(__FB_FREEBSD__)
	#include once "crt/sys/freebsd/time.bi"
#elseif defined(__FB_NETBSD__)
	#include once "crt/sys/netbsd/time.bi"
#elseif defined(__FB_WIN32__)
	#include once "crt/sys/win32/time.bi"
#endif
