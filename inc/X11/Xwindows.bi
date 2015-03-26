#pragma once

#ifdef __FB_WIN32__
	#include once "windows.bi"

	const PATH_MAX = 1024
	#define sleep(x) Sleep((x) * 1000)
#endif
