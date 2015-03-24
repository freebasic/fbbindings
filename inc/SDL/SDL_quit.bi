#pragma once

#include once "SDL_stdinc.bi"
#include once "SDL_error.bi"

#define _SDL_quit_h
private function SDL_QuitRequested() as SDL_bool
	SDL_PumpEvents()
	function = SDL_PeepEvents(NULL, 0, SDL_PEEKEVENT, SDL_QUITMASK)
end function
