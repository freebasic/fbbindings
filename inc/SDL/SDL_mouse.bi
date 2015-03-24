#pragma once

#include once "SDL_stdinc.bi"
#include once "SDL_error.bi"
#include once "SDL_video.bi"
#include once "begin_code.bi"
#include once "close_code.bi"

extern "C"

#define _SDL_mouse_h

type SDL_Cursor
	area as SDL_Rect
	hot_x as Sint16
	hot_y as Sint16
	data as Uint8 ptr
	mask as Uint8 ptr
	save(0 to 1) as Uint8 ptr
	wm_cursor as WMcursor ptr
end type

declare function SDL_GetMouseState(byval x as long ptr, byval y as long ptr) as Uint8
declare function SDL_GetRelativeMouseState(byval x as long ptr, byval y as long ptr) as Uint8
declare sub SDL_WarpMouse(byval x as Uint16, byval y as Uint16)
declare function SDL_CreateCursor(byval data as Uint8 ptr, byval mask as Uint8 ptr, byval w as long, byval h as long, byval hot_x as long, byval hot_y as long) as SDL_Cursor ptr
declare sub SDL_SetCursor(byval cursor as SDL_Cursor ptr)
declare function SDL_GetCursor() as SDL_Cursor ptr
declare sub SDL_FreeCursor(byval cursor as SDL_Cursor ptr)
declare function SDL_ShowCursor(byval toggle as long) as long

#define SDL_BUTTON(X) (1 shl ((X) - 1))
const SDL_BUTTON_LEFT = 1
const SDL_BUTTON_MIDDLE = 2
const SDL_BUTTON_RIGHT = 3
const SDL_BUTTON_WHEELUP = 4
const SDL_BUTTON_WHEELDOWN = 5
const SDL_BUTTON_X1 = 6
const SDL_BUTTON_X2 = 7
#define SDL_BUTTON_LMASK SDL_BUTTON(SDL_BUTTON_LEFT)
#define SDL_BUTTON_MMASK SDL_BUTTON(SDL_BUTTON_MIDDLE)
#define SDL_BUTTON_RMASK SDL_BUTTON(SDL_BUTTON_RIGHT)
#define SDL_BUTTON_X1MASK SDL_BUTTON(SDL_BUTTON_X1)
#define SDL_BUTTON_X2MASK SDL_BUTTON(SDL_BUTTON_X2)

end extern
