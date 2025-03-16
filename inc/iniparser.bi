'' FreeBASIC binding for iniparser-4.2.5
''
'' based on the C header files:
''Copyright (c) 2000-2024 by Nicolas Devillard And many contributors
''MIT License
''
''Permission Is hereby granted, free of charge, To Any person obtaining a
''copy of This software And associated documentation files (the "Software"),
''To deal in the Software without restriction, including without limitation
''the rights To use, copy, modify, merge, publish, distribute, sublicense,
''And/Or sell copies of the Software, And To permit persons To whom the
''Software Is furnished To Do so, subject To the following conditions:
''The above copyright notice And This permission notice shall be included in
''all copies Or substantial portions of the Software.
''
''THE SOFTWARE Is PROVIDED "AS IS", WITHOUT WARRANTY OF Any KIND, EXPRESS Or
''IMPLIED, INCLUDING BUT Not LIMITED To THE WARRANTIES OF MERCHANTABILITY,
''FITNESS For A PARTICULAR PURPOSE And NONINFRINGEMENT. IN NO Event SHALL THE
''AUTHORS Or COPYRIGHT HOLDERS BE LIABLE For Any CLAIM, DAMAGES Or OTHER
''LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT Or OTHERWISE, ARISING
''FROM, Out OF Or IN CONNECTION With THE SOFTWARE Or THE USE Or OTHER
''DEALINGS IN THE SOFTWARE.
'' translated to FreeBASIC by:
''  FreeBASIC development team

#pragma once
#ifndef _INIPARSER_H_

#define _INIPARSER_H_
#include once "crt/long.bi"
#include once "crt/stdio.bi"
#include once "crt/stdint.bi"
#inclib "iniparser"
extern "C"


type _dictionary_
	n as ulong
	size as uinteger
	val_ as zstring ptr ptr
	key as zstring ptr ptr
	hash as ulong ptr
end type

type dictionary as _dictionary_
declare function dictionary_hash(byval key as const zstring ptr) as ulong
declare function dictionary_new(byval size as uinteger) as dictionary ptr
declare sub dictionary_del(byval vd as dictionary ptr)
declare function dictionary_get(byval d as const dictionary ptr, byval key as const zstring ptr, byval def as const zstring ptr) as const zstring ptr
declare function dictionary_set(byval vd as dictionary ptr, byval key as const zstring ptr, byval val_ as const zstring ptr) as long
declare sub dictionary_unset(byval d as dictionary ptr, byval key as const zstring ptr)
declare sub dictionary_dump(byval d as const dictionary ptr, byval out_ as FILE ptr)
declare sub iniparser_set_error_callback(byval errback as function(byval as const zstring ptr, ...) as long)
declare function iniparser_getnsec(byval d as const dictionary ptr) as long
declare function iniparser_getsecname(byval d as const dictionary ptr, byval n as long) as const zstring ptr
declare sub iniparser_dump_ini(byval d as const dictionary ptr, byval f as FILE ptr)
declare sub iniparser_dumpsection_ini(byval d as const dictionary ptr, byval s as const zstring ptr, byval f as FILE ptr)
declare sub iniparser_dump(byval d as const dictionary ptr, byval f as FILE ptr)
declare function iniparser_getsecnkeys(byval d as const dictionary ptr, byval s as const zstring ptr) as long
declare function iniparser_getseckeys(byval d as const dictionary ptr, byval s as const zstring ptr, byval keys as const zstring ptr ptr) as const zstring ptr ptr
declare function iniparser_getstring(byval d as const dictionary ptr, byval key as const zstring ptr, byval def as const zstring ptr) as const zstring ptr
declare function iniparser_getint(byval d as const dictionary ptr, byval key as const zstring ptr, byval notfound as long) as long
declare function iniparser_getlongint(byval d as const dictionary ptr, byval key as const zstring ptr, byval notfound as clong) as clong
declare function iniparser_getint64(byval d as const dictionary ptr, byval key as const zstring ptr, byval notfound as longint) as longint
declare function iniparser_getuint64(byval d as const dictionary ptr, byval key as const zstring ptr, byval notfound as ulongint) as ulongint
declare function iniparser_getdouble(byval d as const dictionary ptr, byval key as const zstring ptr, byval notfound as double) as double
declare function iniparser_getboolean(byval d as const dictionary ptr, byval key as const zstring ptr, byval notfound as long) as long
declare function iniparser_set(byval ini as dictionary ptr, byval entry as const zstring ptr, byval val_ as const zstring ptr) as long
declare sub iniparser_unset(byval ini as dictionary ptr, byval entry as const zstring ptr)
declare function iniparser_find_entry(byval ini as const dictionary ptr, byval entry as const zstring ptr) as long
declare function iniparser_load(byval ininame as const zstring ptr) as dictionary ptr
declare function iniparser_load_file(byval in as FILE ptr, byval ininame as const zstring ptr) as dictionary ptr
declare sub iniparser_freedict(byval d as dictionary ptr)

end extern
#endif
