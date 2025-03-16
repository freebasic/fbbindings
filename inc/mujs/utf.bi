'freebasic bindings for mujs-1.3.5.
'MuJS Is a lightweight Javascript interpreter designed For embedding in 
'other software To extend them With scripting capabilities.
'MuJS Is free Open source software distributed under the ISC license.
'Copyright <Artifex Software>
'Permission To use, copy, modify, And/Or distribute This software For 
'Any purpose With Or without fee Is hereby granted, provided that the 
'above copyright notice And This permission notice appear in all copies.
'THE SOFTWARE Is PROVIDED "AS IS” AND THE AUTHOR DISCLAIMS ALL WARRANTIES 
'With REGARD To This SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF 
'MERCHANTABILITY And FITNESS. IN NO Event SHALL THE AUTHOR BE LIABLE For 
'Any SPECIAL, DIRECT, INDIRECT, Or CONSEQUENTIAL DAMAGES Or Any DAMAGES 
'WHATSOEVER RESULTING FROM LOSS OF USE, Data Or PROFITS, WHETHER IN AN 
'ACTION OF CONTRACT, NEGLIGENCE Or OTHER TORTIOUS ACTION, ARISING Out OF 
'Or IN CONNECTION With THE USE Or PERFORMANCE OF This SOFTWARE.

'' translated to FreeBASIC by:
''   FreeBASIC development team
#pragma once
#ifndef js_utf_h
#define js_utf_h
extern "C"

#define js_utf_h
type Rune as long

enum
	UTFmax = 4
	Runesync = &h80
	Runeself = &h80
	Runeerror = &hFFFD
	Runemax = &h10FFFF
end enum

declare function jsU_chartorune(byval rune as Rune ptr, byval str_ as const zstring ptr) as long
declare function chartorune alias "jsU_chartorune"(byval rune as Rune ptr, byval str_ as const zstring ptr) as long
declare function jsU_runetochar(byval str_ as zstring ptr, byval rune as const Rune ptr) as long
declare function runetochar alias "jsU_runetochar"(byval str_ as zstring ptr, byval rune as const Rune ptr) as long
declare function jsU_runelen(byval c as long) as long
declare function runelen alias "jsU_runelen"(byval c as long) as long
declare function jsU_isalpharune(byval c as Rune) as long
declare function isalpharune alias "jsU_isalpharune"(byval c as Rune) as long
declare function jsU_islowerrune(byval c as Rune) as long
declare function islowerrune alias "jsU_islowerrune"(byval c as Rune) as long
declare function jsU_isupperrune(byval c as Rune) as long
declare function isupperrune alias "jsU_isupperrune"(byval c as Rune) as long
declare function jsU_tolowerrune(byval c as Rune) as Rune
declare function tolowerrune alias "jsU_tolowerrune"(byval c as Rune) as Rune
declare function jsU_toupperrune(byval c as Rune) as Rune
declare function toupperrune alias "jsU_toupperrune"(byval c as Rune) as Rune

end extern
#endif