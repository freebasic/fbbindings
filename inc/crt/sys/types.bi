#pragma once

#include once "crt/stddef.bi"

#if defined(__FB_DOS__)
	#include once "crt/sys/dos/types.bi"
#elseif defined(__FB_LINUX__)
	#include once "crt/sys/linux/types.bi"
#elseif defined(__FB_OPENBSD__)
	#include once "crt/sys/openbsd/types.bi"
#elseif defined(__FB_FREEBSD__)
	#include once "crt/sys/freebsd/types.bi"
#elseif defined(__FB_NETBSD__)
	#include once "crt/sys/netbsd/types.bi"
#elseif defined(__FB_WIN32__)
	#include once "crt/sys/win32/types.bi"
#endif
