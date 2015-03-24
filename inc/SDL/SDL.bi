#pragma once

#inclib "SDL"

#ifdef __FB_WIN32__
	#inclib "gdi32"
	#inclib "user32"
	#inclib "winmm"
	#inclib "dxguid"
	#inclib "advapi32"
#endif

#include once "SDL_main.bi"
#include once "SDL_stdinc.bi"
#include once "SDL_audio.bi"
#include once "SDL_cdrom.bi"
#include once "SDL_cpuinfo.bi"
#include once "SDL_endian.bi"
#include once "SDL_error.bi"
#include once "SDL_events.bi"
#include once "SDL_loadso.bi"
#include once "SDL_mutex.bi"
#include once "SDL_rwops.bi"
#include once "SDL_thread.bi"
#include once "SDL_timer.bi"
#include once "SDL_video.bi"
#include once "SDL_version.bi"
#include once "begin_code.bi"
#include once "close_code.bi"

extern "C"

#define _SDL_H
const SDL_INIT_TIMER = &h00000001
const SDL_INIT_AUDIO = &h00000010
const SDL_INIT_VIDEO = &h00000020
const SDL_INIT_CDROM = &h00000100
const SDL_INIT_JOYSTICK = &h00000200
const SDL_INIT_NOPARACHUTE = &h00100000
const SDL_INIT_EVENTTHREAD = &h01000000
const SDL_INIT_EVERYTHING = &h0000FFFF

declare function SDL_Init(byval flags as Uint32) as long
declare function SDL_InitSubSystem(byval flags as Uint32) as long
declare sub SDL_QuitSubSystem(byval flags as Uint32)
declare function SDL_WasInit(byval flags as Uint32) as Uint32
declare sub SDL_Quit()

end extern
