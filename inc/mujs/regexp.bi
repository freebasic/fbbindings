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

#ifndef regexp_h
#define regexp_h
extern "C"

type Reprog as any ptr
declare function js_regcompx(byval alloc as function(byval ctx as any ptr, byval p as any ptr, byval n as long) as any ptr, byval ctx as any ptr, byval pattern as const zstring ptr, byval cflags as long, byval errorp as const zstring ptr ptr) as Reprog ptr
declare function regcompx alias "js_regcompx"(byval alloc as function(byval ctx as any ptr, byval p as any ptr, byval n as long) as any ptr, byval ctx as any ptr, byval pattern as const zstring ptr, byval cflags as long, byval errorp as const zstring ptr ptr) as Reprog ptr
declare sub js_regfreex(byval alloc as function(byval ctx as any ptr, byval p as any ptr, byval n as long) as any ptr, byval ctx as any ptr, byval prog as Reprog ptr)
declare sub regfreex alias "js_regfreex"(byval alloc as function(byval ctx as any ptr, byval p as any ptr, byval n as long) as any ptr, byval ctx as any ptr, byval prog as Reprog ptr)
declare function js_regcomp(byval pattern as const zstring ptr, byval cflags as long, byval errorp as const zstring ptr ptr) as Reprog ptr
declare function regcomp alias "js_regcomp"(byval pattern as const zstring ptr, byval cflags as long, byval errorp as const zstring ptr ptr) as Reprog ptr
type Resub as Resub_
declare function js_regexec(byval prog as Reprog ptr, byval string as const zstring ptr, byval sub_ as Resub ptr, byval eflags as long) as long
declare function regexec alias "js_regexec"(byval prog as Reprog ptr, byval string as const zstring ptr, byval sub_ as Resub ptr, byval eflags as long) as long
declare sub js_regfree(byval prog as Reprog ptr)
declare sub regfree alias "js_regfree"(byval prog as Reprog ptr)

enum
	REG_ICASE = 1
	REG_NEWLINE = 2
	REG_NOTBOL = 4
end enum

const REG_MAXSUB = 16

type Resub_sub
	sp as const zstring ptr
	ep as const zstring ptr
end type

type Resub_
	nsub as long
	sub_(0 to 15) as Resub_sub
end type

end extern
#endif