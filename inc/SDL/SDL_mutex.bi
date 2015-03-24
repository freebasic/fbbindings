#pragma once

#include once "SDL_stdinc.bi"
#include once "SDL_error.bi"
#include once "begin_code.bi"
#include once "close_code.bi"

extern "C"

#define _SDL_mutex_h
const SDL_MUTEX_TIMEDOUT = 1
#define SDL_MUTEX_MAXWAIT (not cast(Uint32, 0))
declare function SDL_CreateMutex() as SDL_mutex ptr
#define SDL_LockMutex(m) SDL_mutexP(m)
declare function SDL_mutexP(byval mutex as SDL_mutex ptr) as long
#define SDL_UnlockMutex(m) SDL_mutexV(m)
declare function SDL_mutexV(byval mutex as SDL_mutex ptr) as long
declare sub SDL_DestroyMutex(byval mutex as SDL_mutex ptr)
type SDL_sem as SDL_semaphore

declare function SDL_CreateSemaphore(byval initial_value as Uint32) as SDL_sem ptr
declare sub SDL_DestroySemaphore(byval sem as SDL_sem ptr)
declare function SDL_SemWait(byval sem as SDL_sem ptr) as long
declare function SDL_SemTryWait(byval sem as SDL_sem ptr) as long
declare function SDL_SemWaitTimeout(byval sem as SDL_sem ptr, byval ms as Uint32) as long
declare function SDL_SemPost(byval sem as SDL_sem ptr) as long
declare function SDL_SemValue(byval sem as SDL_sem ptr) as Uint32
declare function SDL_CreateCond() as SDL_cond ptr
declare sub SDL_DestroyCond(byval cond as SDL_cond ptr)
declare function SDL_CondSignal(byval cond as SDL_cond ptr) as long
declare function SDL_CondBroadcast(byval cond as SDL_cond ptr) as long
declare function SDL_CondWait(byval cond as SDL_cond ptr, byval mut as SDL_mutex ptr) as long
declare function SDL_CondWaitTimeout(byval cond as SDL_cond ptr, byval mutex as SDL_mutex ptr, byval ms as Uint32) as long

end extern
