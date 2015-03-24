#pragma once

#include once "SDL_stdinc.bi"
#include once "begin_code.bi"
#include once "close_code.bi"

extern "C"

#define _SDL_endian_h
const SDL_LIL_ENDIAN = 1234
const SDL_BIG_ENDIAN = 4321

#ifdef __FB_WIN32__
	#define SDL_BYTEORDER SDL_LIL_ENDIAN
#endif

#ifdef __FB_64BIT__
	private function SDL_Swap16(byval x as Uint16) as Uint16
		'' TODO: __asm__("xchgb %b0,%h0" : "=Q" (x) : "0" (x));
		return x
	end function

	private function SDL_Swap32(byval x as Uint32) as Uint32
		'' TODO: __asm__("bswapl %0" : "=r" (x) : "0" (x));
		return x
	end function

	private function SDL_Swap64(byval x as Uint64) as Uint64
		'' TODO: __asm__("bswapq %0" : "=r" (x) : "0" (x));
		return x
	end function
#else
	private function SDL_Swap16(byval x as Uint16) as Uint16
		'' TODO: __asm__("xchgb %b0,%h0" : "=q" (x) : "0" (x));
		return x
	end function

	private function SDL_Swap32(byval x as Uint32) as Uint32
		'' TODO: __asm__("bswap %0" : "=r" (x) : "0" (x));
		return x
	end function

	private function SDL_Swap64(byval x as Uint64) as Uint64
		type v_s
			a as Uint32
			b as Uint32
		end type
		union v
			s as v_s
			u as Uint64
		end union
		dim v as v
		'' TODO: v.u = x;
		'' TODO: __asm__("bswapl %0 ; bswapl %1 ; xchgl %0,%1" : "=r" (v.s.a), "=r" (v.s.b) : "0" (v.s.a), "1" (v.s.b));
		return v.u
	end function
#endif

#define SDL_SwapLE16(X) (X)
#define SDL_SwapLE32(X) (X)
#define SDL_SwapLE64(X) (X)
#define SDL_SwapBE16(X) SDL_Swap16(X)
#define SDL_SwapBE32(X) SDL_Swap32(X)
#define SDL_SwapBE64(X) SDL_Swap64(X)

end extern
