#pragma once

#include once "SDL_stdinc.bi"
#include once "SDL_error.bi"
#include once "begin_code.bi"
#include once "close_code.bi"

extern "C"

#define _SDL_active_h
const SDL_APPMOUSEFOCUS = &h01
const SDL_APPINPUTFOCUS = &h02
const SDL_APPACTIVE = &h04
declare function SDL_GetAppState() as Uint8

end extern
