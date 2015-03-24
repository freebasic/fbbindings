#pragma once

#include once "SDL_stdinc.bi"
#include once "SDL_error.bi"
#include once "begin_code.bi"
#include once "close_code.bi"

extern "C"

#define _SDL_cdrom_h
const SDL_MAX_TRACKS = 99
const SDL_AUDIO_TRACK = &h00
const SDL_DATA_TRACK = &h04

type CDstatus as long
enum
	CD_TRAYEMPTY
	CD_STOPPED
	CD_PLAYING
	CD_PAUSED
	CD_ERROR = -1
end enum

#define CD_INDRIVE(status) (clng((status)) > 0)

type SDL_CDtrack
	id as Uint8
	as Uint8 type
	unused as Uint16
	length as Uint32
	offset as Uint32
end type

type SDL_CD
	id as long
	status as CDstatus
	numtracks as long
	cur_track as long
	cur_frame as long
	track(0 to (99 + 1) - 1) as SDL_CDtrack
end type

const CD_FPS = 75
#macro FRAMES_TO_MSF(f_, M, S, F)
	scope
		dim value as long = f_
		*(F) = value mod CD_FPS
		value \= CD_FPS
		*(S) = value mod 60
		value \= 60
		*(M) = value
	end scope
#endmacro
#define MSF_TO_FRAMES(M, S, F) (((((M) * 60) * CD_FPS) + ((S) * CD_FPS)) + (F))

declare function SDL_CDNumDrives() as long
declare function SDL_CDName(byval drive as long) as const zstring ptr
declare function SDL_CDOpen(byval drive as long) as SDL_CD ptr
declare function SDL_CDStatus(byval cdrom as SDL_CD ptr) as CDstatus
declare function SDL_CDPlayTracks(byval cdrom as SDL_CD ptr, byval start_track as long, byval start_frame as long, byval ntracks as long, byval nframes as long) as long
declare function SDL_CDPlay(byval cdrom as SDL_CD ptr, byval start as long, byval length as long) as long
declare function SDL_CDPause(byval cdrom as SDL_CD ptr) as long
declare function SDL_CDResume(byval cdrom as SDL_CD ptr) as long
declare function SDL_CDStop(byval cdrom as SDL_CD ptr) as long
declare function SDL_CDEject(byval cdrom as SDL_CD ptr) as long
declare sub SDL_CDClose(byval cdrom as SDL_CD ptr)

end extern
