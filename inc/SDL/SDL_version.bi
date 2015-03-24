#pragma once

#include once "SDL_stdinc.bi"
#include once "begin_code.bi"
#include once "close_code.bi"

extern "C"

#define _SDL_version_h
const SDL_MAJOR_VERSION = 1
const SDL_MINOR_VERSION = 2
const SDL_PATCHLEVEL = 15

type SDL_version
	major as Uint8
	minor as Uint8
	patch as Uint8
end type

#macro SDL_VERSION(X)
	scope
		(X)->major = SDL_MAJOR_VERSION
		(X)->minor = SDL_MINOR_VERSION
		(X)->patch = SDL_PATCHLEVEL
	end scope
#endmacro
#define SDL_VERSIONNUM(X, Y, Z) ((((X) * 1000) + ((Y) * 100)) + (Z))
#define SDL_COMPILEDVERSION SDL_VERSIONNUM(SDL_MAJOR_VERSION, SDL_MINOR_VERSION, SDL_PATCHLEVEL)
#define SDL_VERSION_ATLEAST(X, Y, Z) (SDL_COMPILEDVERSION >= SDL_VERSIONNUM(X, Y, Z))
declare function SDL_Linked_Version() as const SDL_version ptr

end extern
