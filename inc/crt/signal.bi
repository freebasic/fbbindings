#pragma once

#if defined(__FB_DOS__)
	#include once "crt/dos/signal.bi"
#elseif defined(__FB_LINUX__)
	#include once "crt/linux/signal.bi"
#elseif defined(__FB_OPENBSD__)
	#include once "crt/openbsd/signal.bi"
#elseif defined(__FB_FREEBSD__)
	#include once "crt/freebsd/signal.bi"
#elseif defined(__FB_NETBSD__)
	#include once "crt/netbsd/signal.bi"
#endif
