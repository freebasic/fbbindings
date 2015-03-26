#pragma once

#include once "windows.bi"

#ifdef __FB_WIN32__
	const PATH_MAX = 1024
#endif

#define sleep(x) Sleep((x) * 1000)
