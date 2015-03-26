#pragma once

#include once "X11/Xos.bi"
#include once "X11/Xfuncs.bi"

#if defined(__FB_DOS__) or defined(__FB_LINUX__)
	#include once "crt/limits.bi"
#endif

#define _XOS_R_H_

#if defined(__FB_DOS__) or defined(__FB_LINUX__)
	const X_LINE_MAX = 2048
#endif
