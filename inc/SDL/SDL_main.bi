#pragma once

#include once "SDL_stdinc.bi"

#ifdef __FB_WIN32__
	#include once "begin_code.bi"
	#include once "close_code.bi"

	extern "C"
#endif

#define _SDL_main_h

#ifdef __FB_WIN32__
	declare function SDL_main(byval argc as long, byval argv as zstring ptr ptr) as long
	declare sub SDL_SetModuleHandle(byval hInst as any ptr)
	declare function SDL_RegisterApp(byval name as zstring ptr, byval style as Uint32, byval hInst as any ptr) as long
	declare sub SDL_UnregisterApp()

	end extern
#endif
