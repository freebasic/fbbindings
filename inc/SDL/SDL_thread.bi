#pragma once

#include once "SDL_stdinc.bi"
#include once "SDL_error.bi"
#include once "SDL_mutex.bi"
#include once "begin_code.bi"
#include once "close_code.bi"

extern "C"

#define _SDL_thread_h
declare function SDL_CreateThread(byval fn as function(byval as any ptr) as long, byval data as any ptr) as SDL_Thread ptr
declare function SDL_ThreadID() as Uint32
declare function SDL_GetThreadID(byval thread as SDL_Thread ptr) as Uint32
declare sub SDL_WaitThread(byval thread as SDL_Thread ptr, byval status as long ptr)
declare sub SDL_KillThread(byval thread as SDL_Thread ptr)

end extern
