#pragma once

#include once "SDL_stdinc.bi"
#include once "SDL_error.bi"
#include once "begin_code.bi"
#include once "close_code.bi"

extern "C"

#define _SDL_timer_h
const SDL_TIMESLICE = 10
const TIMER_RESOLUTION = 10
declare function SDL_GetTicks() as Uint32
declare sub SDL_Delay(byval ms as Uint32)
type SDL_TimerCallback as function(byval interval as Uint32) as Uint32
declare function SDL_SetTimer(byval interval as Uint32, byval callback as SDL_TimerCallback) as long
type SDL_NewTimerCallback as function(byval interval as Uint32, byval param as any ptr) as Uint32
type SDL_TimerID as _SDL_TimerID ptr
declare function SDL_AddTimer(byval interval as Uint32, byval callback as SDL_NewTimerCallback, byval param as any ptr) as SDL_TimerID
declare function SDL_RemoveTimer(byval t as SDL_TimerID) as SDL_bool

end extern
