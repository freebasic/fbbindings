#pragma once

#include once "SDL_stdinc.bi"
#include once "SDL_error.bi"
#include once "begin_code.bi"
#include once "close_code.bi"

extern "C"

#define _SDL_loadso_h
declare function SDL_LoadObject(byval sofile as const zstring ptr) as any ptr
declare function SDL_LoadFunction(byval handle as any ptr, byval name as const zstring ptr) as any ptr
declare sub SDL_UnloadObject(byval handle as any ptr)

end extern
