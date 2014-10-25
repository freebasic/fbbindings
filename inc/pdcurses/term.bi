#pragma once

#include once "crt/long.bi"
#include once "curses.bi"

extern "C"

#define __PDCURSES_TERM_H__ 1

type TERMINAL
	_termname as const zstring ptr
end type

#if defined(__FB_WIN32__) and defined(PDC_DLL_BUILD)
	extern     cur_term as TERMINAL ptr
	dim shared cur_term as TERMINAL ptr
#else
	extern cur_term as TERMINAL ptr
#endif

declare function del_curterm(byval as TERMINAL ptr) as long
declare function putp(byval as const zstring ptr) as long
declare function restartterm(byval as const zstring ptr, byval as long, byval as long ptr) as long
declare function set_curterm(byval as TERMINAL ptr) as TERMINAL ptr
declare function setterm(byval as const zstring ptr) as long
declare function setupterm(byval as const zstring ptr, byval as long, byval as long ptr) as long
declare function tgetent(byval as zstring ptr, byval as const zstring ptr) as long
declare function tgetflag(byval as const zstring ptr) as long
declare function tgetnum(byval as const zstring ptr) as long
declare function tgetstr(byval as const zstring ptr, byval as zstring ptr ptr) as zstring ptr
declare function tgoto(byval as const zstring ptr, byval as long, byval as long) as zstring ptr
declare function tigetflag(byval as const zstring ptr) as long
declare function tigetnum(byval as const zstring ptr) as long
declare function tigetstr(byval as const zstring ptr) as zstring ptr
declare function tparm(byval as const zstring ptr, byval as clong, byval as clong, byval as clong, byval as clong, byval as clong, byval as clong, byval as clong, byval as clong, byval as clong) as zstring ptr
declare function tputs(byval as const zstring ptr, byval as long, byval as function(byval as long) as long) as long

end extern
