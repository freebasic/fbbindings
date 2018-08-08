'' crt/regex.bi currently is Linux-only
#ifdef __FB_LINUX__
	#define TRE_USE_SYSTEM_REGEX_H
	#include "tre/tre.bi"
	#include "tre/regex.bi"
#endif
