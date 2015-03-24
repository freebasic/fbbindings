#pragma once

#include once "SDL_stdinc.bi"
#include once "SDL_error.bi"
#include once "begin_code.bi"
#include once "close_code.bi"

extern "C"

#define _SDL_rwops_h

#ifdef __FB_WIN32__
	type SDL_RWops_hidden_win32io_buffer
		data as any ptr
		size as long
		left as long
	end type

	type SDL_RWops_hidden_win32io
		append as long
		h as any ptr
		buffer as SDL_RWops_hidden_win32io_buffer
	end type
#endif

type SDL_RWops_hidden_stdio
	autoclose as long
	fp as FILE ptr
end type

type SDL_RWops_hidden_mem
	base as Uint8 ptr
	here as Uint8 ptr
	stop as Uint8 ptr
end type

type SDL_RWops_hidden_unknown
	data1 as any ptr
end type

union SDL_RWops_hidden
	#ifdef __FB_WIN32__
		win32io as SDL_RWops_hidden_win32io
	#endif

	stdio as SDL_RWops_hidden_stdio
	mem as SDL_RWops_hidden_mem
	unknown as SDL_RWops_hidden_unknown
end union

type SDL_RWops
	seek as function(byval context as SDL_RWops ptr, byval offset as long, byval whence as long) as long
	read as function(byval context as SDL_RWops ptr, byval ptr as any ptr, byval size as long, byval maxnum as long) as long
	write as function(byval context as SDL_RWops ptr, byval ptr as const any ptr, byval size as long, byval num as long) as long
	close as function(byval context as SDL_RWops ptr) as long
	as Uint32 type
	hidden as SDL_RWops_hidden
end type

declare function SDL_RWFromFile(byval file as const zstring ptr, byval mode as const zstring ptr) as SDL_RWops ptr
declare function SDL_RWFromFP(byval fp as FILE ptr, byval autoclose as long) as SDL_RWops ptr
declare function SDL_RWFromMem(byval mem as any ptr, byval size as long) as SDL_RWops ptr
declare function SDL_RWFromConstMem(byval mem as const any ptr, byval size as long) as SDL_RWops ptr
declare function SDL_AllocRW() as SDL_RWops ptr
declare sub SDL_FreeRW(byval area as SDL_RWops ptr)

const RW_SEEK_SET = 0
const RW_SEEK_CUR = 1
const RW_SEEK_END = 2
#define SDL_RWseek(ctx, offset, whence) (ctx)->seek(ctx, offset, whence)
#define SDL_RWtell(ctx) (ctx)->seek(ctx, 0, RW_SEEK_CUR)
#define SDL_RWread(ctx, ptr, size, n) (ctx)->read(ctx, ptr, size, n)
#define SDL_RWwrite(ctx, ptr, size, n) (ctx)->write(ctx, ptr, size, n)
#define SDL_RWclose(ctx) (ctx)->close(ctx)

declare function SDL_ReadLE16(byval src as SDL_RWops ptr) as Uint16
declare function SDL_ReadBE16(byval src as SDL_RWops ptr) as Uint16
declare function SDL_ReadLE32(byval src as SDL_RWops ptr) as Uint32
declare function SDL_ReadBE32(byval src as SDL_RWops ptr) as Uint32
declare function SDL_ReadLE64(byval src as SDL_RWops ptr) as Uint64
declare function SDL_ReadBE64(byval src as SDL_RWops ptr) as Uint64
declare function SDL_WriteLE16(byval dst as SDL_RWops ptr, byval value as Uint16) as long
declare function SDL_WriteBE16(byval dst as SDL_RWops ptr, byval value as Uint16) as long
declare function SDL_WriteLE32(byval dst as SDL_RWops ptr, byval value as Uint32) as long
declare function SDL_WriteBE32(byval dst as SDL_RWops ptr, byval value as Uint32) as long
declare function SDL_WriteLE64(byval dst as SDL_RWops ptr, byval value as Uint64) as long
declare function SDL_WriteBE64(byval dst as SDL_RWops ptr, byval value as Uint64) as long

end extern
