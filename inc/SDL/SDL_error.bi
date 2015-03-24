#pragma once

#include once "SDL_stdinc.bi"
#include once "begin_code.bi"
#include once "close_code.bi"

extern "C"

#define _SDL_error_h
declare sub SDL_SetError(byval fmt as const zstring ptr, ...)
declare function SDL_GetError() as zstring ptr
declare sub SDL_ClearError()
#define SDL_OutOfMemory() SDL_Error(SDL_ENOMEM)
#define SDL_Unsupported() SDL_Error(SDL_UNSUPPORTED)

type SDL_errorcode as long
enum
	SDL_ENOMEM
	SDL_EFREAD
	SDL_EFWRITE
	SDL_EFSEEK
	SDL_UNSUPPORTED
	SDL_LASTERROR
end enum

declare sub SDL_Error(byval code as SDL_errorcode)

end extern
