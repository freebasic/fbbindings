#pragma once

#include once "SDL_types.bi"
#include once "SDL_rwops.bi"
#include once "SDL_audio.bi"
#include once "SDL_endian.bi"
#include once "SDL_version.bi"
#include once "begin_code.bi"
#include once "close_code.bi"

extern "C"

#define _SDL_MIXER_H
const SDL_MIXER_MAJOR_VERSION = 1
const SDL_MIXER_MINOR_VERSION = 2
const SDL_MIXER_PATCHLEVEL = 12
#macro SDL_MIXER_VERSION(X)
	scope
		(X)->major = SDL_MIXER_MAJOR_VERSION
		(X)->minor = SDL_MIXER_MINOR_VERSION
		(X)->patch = SDL_MIXER_PATCHLEVEL
	end scope
#endmacro
#define MIX_MAJOR_VERSION SDL_MIXER_MAJOR_VERSION
#define MIX_MINOR_VERSION SDL_MIXER_MINOR_VERSION
#define MIX_PATCHLEVEL SDL_MIXER_PATCHLEVEL
#define MIX_VERSION(X) SDL_MIXER_VERSION(X)
declare function Mix_Linked_Version() as const SDL_version_ ptr

type MIX_InitFlags as long
enum
	MIX_INIT_FLAC = &h00000001
	MIX_INIT_MOD = &h00000002
	MIX_INIT_MP3 = &h00000004
	MIX_INIT_OGG = &h00000008
	MIX_INIT_FLUIDSYNTH = &h00000010
end enum

declare function Mix_Init(byval flags as long) as long
declare sub Mix_Quit()
const MIX_CHANNELS = 8
const MIX_DEFAULT_FREQUENCY = 22050
#define MIX_DEFAULT_FORMAT AUDIO_S16LSB
const MIX_DEFAULT_CHANNELS = 2
const MIX_MAX_VOLUME = 128

type Mix_Chunk
	allocated as long
	abuf as Uint8 ptr
	alen as Uint32
	volume as Uint8
end type

type Mix_Fading as long
enum
	MIX_NO_FADING
	MIX_FADING_OUT
	MIX_FADING_IN
end enum

type Mix_MusicType as long
enum
	MUS_NONE
	MUS_CMD
	MUS_WAV
	MUS_MOD
	MUS_MID
	MUS_OGG
	MUS_MP3
	MUS_MP3_MAD
	MUS_FLAC
	MUS_MODPLUG
end enum

type Mix_Music as _Mix_Music
declare function Mix_OpenAudio(byval frequency as long, byval format as Uint16, byval channels as long, byval chunksize as long) as long
declare function Mix_AllocateChannels(byval numchans as long) as long
declare function Mix_QuerySpec(byval frequency as long ptr, byval format as Uint16 ptr, byval channels as long ptr) as long
declare function Mix_LoadWAV_RW(byval src as SDL_RWops ptr, byval freesrc as long) as Mix_Chunk ptr
#define Mix_LoadWAV(file) Mix_LoadWAV_RW(SDL_RWFromFile(file, "rb"), 1)
declare function Mix_LoadMUS(byval file as const zstring ptr) as Mix_Music ptr
declare function Mix_LoadMUS_RW(byval rw as SDL_RWops ptr) as Mix_Music ptr
declare function Mix_LoadMUSType_RW(byval rw as SDL_RWops ptr, byval type as Mix_MusicType, byval freesrc as long) as Mix_Music ptr
declare function Mix_QuickLoad_WAV(byval mem as Uint8 ptr) as Mix_Chunk ptr
declare function Mix_QuickLoad_RAW(byval mem as Uint8 ptr, byval len as Uint32) as Mix_Chunk ptr
declare sub Mix_FreeChunk(byval chunk as Mix_Chunk ptr)
declare sub Mix_FreeMusic(byval music as Mix_Music ptr)
declare function Mix_GetNumChunkDecoders() as long
declare function Mix_GetChunkDecoder(byval index as long) as const zstring ptr
declare function Mix_GetNumMusicDecoders() as long
declare function Mix_GetMusicDecoder(byval index as long) as const zstring ptr
declare function Mix_GetMusicType(byval music as const Mix_Music ptr) as Mix_MusicType
declare sub Mix_SetPostMix(byval mix_func as sub(byval udata as any ptr, byval stream as Uint8 ptr, byval len as long), byval arg as any ptr)
declare sub Mix_HookMusic(byval mix_func as sub(byval udata as any ptr, byval stream as Uint8 ptr, byval len as long), byval arg as any ptr)
declare sub Mix_HookMusicFinished(byval music_finished as sub())
declare function Mix_GetMusicHookData() as any ptr
declare sub Mix_ChannelFinished(byval channel_finished as sub(byval channel as long))
const MIX_CHANNEL_POST = -2
type Mix_EffectFunc_t as sub(byval chan as long, byval stream as any ptr, byval len as long, byval udata as any ptr)
type Mix_EffectDone_t as sub(byval chan as long, byval udata as any ptr)
declare function Mix_RegisterEffect(byval chan as long, byval f as Mix_EffectFunc_t, byval d as Mix_EffectDone_t, byval arg as any ptr) as long
declare function Mix_UnregisterEffect(byval channel as long, byval f as Mix_EffectFunc_t) as long
declare function Mix_UnregisterAllEffects(byval channel as long) as long
#define MIX_EFFECTSMAXSPEED "MIX_EFFECTSMAXSPEED"
declare function Mix_SetPanning(byval channel as long, byval left as Uint8, byval right as Uint8) as long
declare function Mix_SetPosition(byval channel as long, byval angle as Sint16, byval distance as Uint8) as long
declare function Mix_SetDistance(byval channel as long, byval distance as Uint8) as long
declare function Mix_SetReverseStereo(byval channel as long, byval flip as long) as long
declare function Mix_ReserveChannels(byval num as long) as long
declare function Mix_GroupChannel(byval which as long, byval tag as long) as long
declare function Mix_GroupChannels(byval from as long, byval to as long, byval tag as long) as long
declare function Mix_GroupAvailable(byval tag as long) as long
declare function Mix_GroupCount(byval tag as long) as long
declare function Mix_GroupOldest(byval tag as long) as long
declare function Mix_GroupNewer(byval tag as long) as long
#define Mix_PlayChannel(channel, chunk, loops) Mix_PlayChannelTimed(channel, chunk, loops, -1)
declare function Mix_PlayChannelTimed(byval channel as long, byval chunk as Mix_Chunk ptr, byval loops as long, byval ticks as long) as long
declare function Mix_PlayMusic(byval music as Mix_Music ptr, byval loops as long) as long
declare function Mix_FadeInMusic(byval music as Mix_Music ptr, byval loops as long, byval ms as long) as long
declare function Mix_FadeInMusicPos(byval music as Mix_Music ptr, byval loops as long, byval ms as long, byval position as double) as long
#define Mix_FadeInChannel(channel, chunk, loops, ms) Mix_FadeInChannelTimed(channel, chunk, loops, ms, -1)
declare function Mix_FadeInChannelTimed(byval channel as long, byval chunk as Mix_Chunk ptr, byval loops as long, byval ms as long, byval ticks as long) as long
declare function Mix_Volume(byval channel as long, byval volume as long) as long
declare function Mix_VolumeChunk(byval chunk as Mix_Chunk ptr, byval volume as long) as long
declare function Mix_VolumeMusic(byval volume as long) as long
declare function Mix_HaltChannel(byval channel as long) as long
declare function Mix_HaltGroup(byval tag as long) as long
declare function Mix_HaltMusic() as long
declare function Mix_ExpireChannel(byval channel as long, byval ticks as long) as long
declare function Mix_FadeOutChannel(byval which as long, byval ms as long) as long
declare function Mix_FadeOutGroup(byval tag as long, byval ms as long) as long
declare function Mix_FadeOutMusic(byval ms as long) as long
declare function Mix_FadingMusic() as Mix_Fading
declare function Mix_FadingChannel(byval which as long) as Mix_Fading
declare sub Mix_Pause(byval channel as long)
declare sub Mix_Resume(byval channel as long)
declare function Mix_Paused(byval channel as long) as long
declare sub Mix_PauseMusic()
declare sub Mix_ResumeMusic()
declare sub Mix_RewindMusic()
declare function Mix_PausedMusic() as long
declare function Mix_SetMusicPosition(byval position as double) as long
declare function Mix_Playing(byval channel as long) as long
declare function Mix_PlayingMusic() as long
declare function Mix_SetMusicCMD(byval command as const zstring ptr) as long
declare function Mix_SetSynchroValue(byval value as long) as long
declare function Mix_GetSynchroValue() as long
declare function Mix_SetSoundFonts(byval paths as const zstring ptr) as long
declare function Mix_GetSoundFonts() as const zstring ptr
declare function Mix_EachSoundFont(byval function as function(byval as const zstring ptr, byval as any ptr) as long, byval data as any ptr) as long
declare function Mix_GetChunk(byval channel as long) as Mix_Chunk ptr
declare sub Mix_CloseAudio()
#define Mix_SetError SDL_SetError
#define Mix_GetError SDL_GetError

end extern
