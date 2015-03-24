#pragma once

#include once "SDL_stdinc.bi"
#include once "SDL_error.bi"
#include once "SDL_keysym.bi"
#include once "begin_code.bi"
#include once "close_code.bi"

extern "C"

#define _SDL_keyboard_h

type SDL_keysym
	scancode as Uint8
	sym as SDLKey
	mod as SDLMod
	unicode as Uint16
end type

const SDL_ALL_HOTKEYS = &hFFFFFFFF
declare function SDL_EnableUNICODE(byval enable as long) as long
const SDL_DEFAULT_REPEAT_DELAY = 500
const SDL_DEFAULT_REPEAT_INTERVAL = 30
declare function SDL_EnableKeyRepeat(byval delay as long, byval interval as long) as long
declare sub SDL_GetKeyRepeat(byval delay as long ptr, byval interval as long ptr)
declare function SDL_GetKeyState(byval numkeys as long ptr) as Uint8 ptr
declare function SDL_GetModState() as SDLMod
declare sub SDL_SetModState(byval modstate as SDLMod)
declare function SDL_GetKeyName(byval key as SDLKey) as zstring ptr

end extern
