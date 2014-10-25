#pragma once

#include once "curses.bi"

'' The following symbols have been renamed:
''     typedef PANELOBS => PANELOBS_
''     typedef PANEL => PANEL__

extern "C"

type panel as panel_

#define __PDCURSES_PANEL_H__ 1

type panelobs
	above as panelobs ptr
	pan as panel ptr
end type

type PANELOBS_ as panelobs

type panel_
	win as WINDOW_ ptr
	wstarty as long
	wendy as long
	wstartx as long
	wendx as long
	below as panel ptr
	above as panel ptr
	user as const any ptr
	obscure as panelobs ptr
end type

type PANEL__ as panel

declare function bottom_panel(byval pan as PANEL__ ptr) as long
declare function del_panel(byval pan as PANEL__ ptr) as long
declare function hide_panel(byval pan as PANEL__ ptr) as long
declare function move_panel(byval pan as PANEL__ ptr, byval starty as long, byval startx as long) as long
declare function new_panel(byval win as WINDOW_ ptr) as PANEL__ ptr
declare function panel_above(byval pan as const PANEL__ ptr) as PANEL__ ptr
declare function panel_below(byval pan as const PANEL__ ptr) as PANEL__ ptr
declare function panel_hidden(byval pan as const PANEL__ ptr) as long
declare function panel_userptr(byval pan as const PANEL__ ptr) as const any ptr
declare function panel_window(byval pan as const PANEL__ ptr) as WINDOW_ ptr
declare function replace_panel(byval pan as PANEL__ ptr, byval win as WINDOW_ ptr) as long
declare function set_panel_userptr(byval pan as PANEL__ ptr, byval uptr as const any ptr) as long
declare function show_panel(byval pan as PANEL__ ptr) as long
declare function top_panel(byval pan as PANEL__ ptr) as long
declare sub update_panels()

end extern
