#pragma once

#ifdef __FB_WIN32__
	#include once "windows.bi"

	#define sleep(x) Sleep((x) * 1000)
#endif
