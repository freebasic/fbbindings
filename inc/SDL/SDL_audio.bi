#pragma once

#include once "SDL_stdinc.bi"
#include once "SDL_error.bi"
#include once "SDL_endian.bi"
#include once "SDL_mutex.bi"
#include once "SDL_thread.bi"
#include once "SDL_rwops.bi"
#include once "begin_code.bi"
#include once "close_code.bi"

extern "C"

#define _SDL_audio_h

type SDL_AudioSpec
	freq as long
	format as Uint16
	channels as Uint8
	silence as Uint8
	samples as Uint16
	padding as Uint16
	size as Uint32
	callback as sub(byval userdata as any ptr, byval stream as Uint8 ptr, byval len as long)
	userdata as any ptr
end type

const AUDIO_U8 = &h0008
const AUDIO_S8 = &h8008
const AUDIO_U16LSB = &h0010
const AUDIO_S16LSB = &h8010
const AUDIO_U16MSB = &h1010
const AUDIO_S16MSB = &h9010
#define AUDIO_U16 AUDIO_U16LSB
#define AUDIO_S16 AUDIO_S16LSB
#define AUDIO_U16SYS AUDIO_U16LSB
#define AUDIO_S16SYS AUDIO_S16LSB

type SDL_AudioCVT
	needed as long
	src_format as Uint16
	dst_format as Uint16
	rate_incr as double
	buf as Uint8 ptr
	len as long
	len_cvt as long
	len_mult as long
	len_ratio as double
	filters(0 to 9) as sub(byval cvt as SDL_AudioCVT ptr, byval format as Uint16)
	filter_index as long
end type

declare function SDL_AudioInit(byval driver_name as const zstring ptr) as long
declare sub SDL_AudioQuit()
declare function SDL_AudioDriverName(byval namebuf as zstring ptr, byval maxlen as long) as zstring ptr
declare function SDL_OpenAudio(byval desired as SDL_AudioSpec ptr, byval obtained as SDL_AudioSpec ptr) as long

type SDL_audiostatus as long
enum
	SDL_AUDIO_STOPPED = 0
	SDL_AUDIO_PLAYING
	SDL_AUDIO_PAUSED
end enum

declare function SDL_GetAudioStatus() as SDL_audiostatus
declare sub SDL_PauseAudio(byval pause_on as long)
declare function SDL_LoadWAV_RW(byval src as SDL_RWops ptr, byval freesrc as long, byval spec as SDL_AudioSpec ptr, byval audio_buf as Uint8 ptr ptr, byval audio_len as Uint32 ptr) as SDL_AudioSpec ptr
#define SDL_LoadWAV(file, spec, audio_buf, audio_len) SDL_LoadWAV_RW(SDL_RWFromFile(file, "rb"), 1, spec, audio_buf, audio_len)
declare sub SDL_FreeWAV(byval audio_buf as Uint8 ptr)
declare function SDL_BuildAudioCVT(byval cvt as SDL_AudioCVT ptr, byval src_format as Uint16, byval src_channels as Uint8, byval src_rate as long, byval dst_format as Uint16, byval dst_channels as Uint8, byval dst_rate as long) as long
declare function SDL_ConvertAudio(byval cvt as SDL_AudioCVT ptr) as long
const SDL_MIX_MAXVOLUME = 128
declare sub SDL_MixAudio(byval dst as Uint8 ptr, byval src as const Uint8 ptr, byval len as Uint32, byval volume as long)
declare sub SDL_LockAudio()
declare sub SDL_UnlockAudio()
declare sub SDL_CloseAudio()

end extern
