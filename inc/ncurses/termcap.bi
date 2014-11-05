#pragma once

#include once "crt/sys/types.bi"

extern "C"

#define NCURSES_TERMCAP_H_incl 1
#define NCURSES_VERSION "5.9"
#define NCURSES_DLL_H_incl 1
#define NCURSES_OSPEED short

extern PC as byte
extern UP as zstring ptr
extern BC as zstring ptr
extern ospeed as short

declare function tgetstr(byval as zstring ptr, byval as zstring ptr ptr) as zstring ptr
declare function tgoto(byval as const zstring ptr, byval as long, byval as long) as zstring ptr
declare function tgetent(byval as zstring ptr, byval as const zstring ptr) as long
declare function tgetflag(byval as zstring ptr) as long
declare function tgetnum(byval as zstring ptr) as long
declare function tputs(byval as const zstring ptr, byval as long, byval as function(byval as long) as long) as long

end extern
