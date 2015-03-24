#pragma once

#include once "SDL_stdinc.bi"
#include once "begin_code.bi"
#include once "close_code.bi"

extern "C"

#define _SDL_cpuinfo_h
declare function SDL_HasRDTSC() as SDL_bool
declare function SDL_HasMMX() as SDL_bool
declare function SDL_HasMMXExt() as SDL_bool
declare function SDL_Has3DNow() as SDL_bool
declare function SDL_Has3DNowExt() as SDL_bool
declare function SDL_HasSSE() as SDL_bool
declare function SDL_HasSSE2() as SDL_bool
declare function SDL_HasAltiVec() as SDL_bool

end extern
