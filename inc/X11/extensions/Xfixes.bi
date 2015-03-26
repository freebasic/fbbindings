#pragma once

#include once "crt/long.bi"
#include once "X11/extensions/xfixeswire.bi"
#include once "X11/Xfuncproto.bi"
#include once "X11/Xlib.bi"

extern "C"

#define _XFIXES_H_
const XFIXES_REVISION = 1
#define XFIXES_VERSION (((XFIXES_MAJOR * 10000) + (XFIXES_MINOR * 100)) + XFIXES_REVISION)

type XFixesSelectionNotifyEvent
	as long type
	serial as culong
	send_event as long
	display as Display ptr
	window as Window
	subtype as long
	owner as Window
	selection as Atom
	timestamp as Time
	selection_timestamp as Time
end type

type XFixesCursorNotifyEvent
	as long type
	serial as culong
	send_event as long
	display as Display ptr
	window as Window
	subtype as long
	cursor_serial as culong
	timestamp as Time
	cursor_name as Atom
end type

type XFixesCursorImage
	x as short
	y as short
	width as ushort
	height as ushort
	xhot as ushort
	yhot as ushort
	cursor_serial as culong
	pixels as culong ptr
end type

declare function XFixesQueryExtension(byval dpy as Display ptr, byval event_base_return as long ptr, byval error_base_return as long ptr) as long
declare function XFixesQueryVersion(byval dpy as Display ptr, byval major_version_return as long ptr, byval minor_version_return as long ptr) as long
declare function XFixesVersion() as long
declare sub XFixesChangeSaveSet(byval dpy as Display ptr, byval win as Window, byval mode as long, byval target as long, byval map as long)
declare sub XFixesSelectSelectionInput(byval dpy as Display ptr, byval win as Window, byval selection as Atom, byval eventMask as culong)
declare sub XFixesSelectCursorInput(byval dpy as Display ptr, byval win as Window, byval eventMask as culong)
declare function XFixesGetCursorImage(byval dpy as Display ptr) as XFixesCursorImage ptr

end extern
