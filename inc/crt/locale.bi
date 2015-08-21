#pragma once

#if defined(__FB_DOS__)
	#include once "crt/dos/locale.bi"
#elseif defined(__FB_LINUX__)
	#include once "crt/linux/locale.bi"
#elseif defined(__FB_OPENBSD__)
	#include once "crt/openbsd/locale.bi"
#elseif defined(__FB_FREEBSD__)
	#include once "crt/freebsd/locale.bi"
#elseif defined(__FB_NETBSD__)
	#include once "crt/netbsd/locale.bi"
#endif
