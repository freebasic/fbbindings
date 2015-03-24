#pragma once

#include once "SDL_stdinc.bi"
#include once "SDL_error.bi"
#include once "SDL_version.bi"
#include once "begin_code.bi"

#ifdef __FB_WIN32__
	#include once "windows.bi"
#else
	#include once "X11/Xlib.bi"
	#include once "X11/Xatom.bi"
#endif

#include once "close_code.bi"

extern "C"

#define _SDL_syswm_h

#ifdef __FB_WIN32__
	#define WIN32_LEAN_AND_MEAN
#else
	type SDL_SYSWM_TYPE as long
	enum
		SDL_SYSWM_X11
	end enum

	union SDL_SysWMmsg_event
		xevent as XEvent
	end union
#endif

type SDL_SysWMmsg_
	version as SDL_version

	#ifdef __FB_WIN32__
		hwnd as HWND
		msg as UINT
		wParam as WPARAM
		lParam as LPARAM
	#else
		subsystem as SDL_SYSWM_TYPE
		event as SDL_SysWMmsg_event
	#endif
end type

#ifdef __FB_LINUX__
	type SDL_SysWMinfo_info_x11
		display as Display ptr
		window as Window
		lock_func as sub()
		unlock_func as sub()
		fswindow as Window
		wmwindow as Window
		gfxdisplay as Display ptr
	end type

	union SDL_SysWMinfo_info
		x11 as SDL_SysWMinfo_info_x11
	end union
#endif

type SDL_SysWMinfo
	version as SDL_version

	#ifdef __FB_WIN32__
		window as HWND
		hglrc as HGLRC
	#else
		subsystem as SDL_SYSWM_TYPE
		info as SDL_SysWMinfo_info
	#endif
end type

declare function SDL_GetWMInfo(byval info as SDL_SysWMinfo ptr) as long

end extern
