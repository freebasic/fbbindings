'' FreeBASIC binding for xproto-7.0.27

#pragma once

#ifdef __FB_WIN32__
	#define _XW32DEFS_H
	type caddr_t as zstring ptr
	#define lstat stat
#endif
