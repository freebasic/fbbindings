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
#ifndef mujs_h
#define mujs_h
#include once "crt/setjmp.bi"
#include once "regexp.bi"
#include once "utf.bi"
#inclib "mujs"

Extern "C"

#define mujs_h
Const JS_VERSION_MAJOR = 1
Const JS_VERSION_MINOR = 3
Const JS_VERSION_PATCH = 5
Const JS_VERSION = ((JS_VERSION_MAJOR * 10000) + (JS_VERSION_MINOR * 100)) + JS_VERSION_PATCH
#define JS_CHECKVERSION(x, y, z) (JS_VERSION >= ((((x) * 10000) + ((y) * 100)) + (z)))
Type js_State As Any Ptr
Type js_Alloc As Function(ByVal memctx As Any Ptr, ByVal ptr_ As Any Ptr, ByVal size As Long) As Any Ptr
Type js_Panic As Sub(ByVal J As js_State Ptr)
Type js_CFunction As Sub(ByVal J As js_State Ptr)
Type js_Finalize As Sub(ByVal J As js_State Ptr, ByVal p As Any Ptr)
Type js_HasProperty As Function(ByVal J As js_State Ptr, ByVal p As Any Ptr, ByVal name_ As Const ZString Ptr) As Long
Type js_Put As Function(ByVal J As js_State Ptr, ByVal p As Any Ptr, ByVal name_ As Const ZString Ptr) As Long
Type js_Delete As Function(ByVal J As js_State Ptr, ByVal p As Any Ptr, ByVal name_ As Const ZString Ptr) As Long
Type js_Report As Sub(ByVal J As js_State Ptr, ByVal message As Const ZString Ptr)

Declare Function js_newstate(ByVal alloc As js_Alloc, ByVal actx As Any Ptr, ByVal flags As Long) As js_State Ptr
Declare Sub js_setcontext(ByVal J As js_State Ptr, ByVal uctx As Any Ptr)
Declare Function js_getcontext(ByVal J As js_State Ptr) As Any Ptr
Declare Sub js_setreport(ByVal J As js_State Ptr, ByVal report As js_Report)
Declare Function js_atpanic(ByVal J As js_State Ptr, ByVal panic As js_Panic) As js_Panic
Declare Sub js_freestate(ByVal J As js_State Ptr)
Declare Sub js_gc(ByVal J As js_State Ptr, ByVal report As Long)
Declare Function js_dostring(ByVal J As js_State Ptr, ByVal source As Const ZString Ptr) As Long
Declare Function js_dofile(ByVal J As js_State Ptr, ByVal filename As Const ZString Ptr) As Long
Declare Function js_ploadstring(ByVal J As js_State Ptr, ByVal filename As Const ZString Ptr, ByVal source As Const ZString Ptr) As Long
Declare Function js_ploadfile(ByVal J As js_State Ptr, ByVal filename As Const ZString Ptr) As Long
Declare Function js_pcall(ByVal J As js_State Ptr, ByVal n As Long) As Long
Declare Function js_pconstruct(ByVal J As js_State Ptr, ByVal n As Long) As Long
Declare Function js_savetry(ByVal J As js_State Ptr) As Any Ptr
#define js_try(J) setjmp(js_savetry(J))
Declare Sub js_endtry(ByVal J As js_State Ptr)

Enum
	JS_STRICT = 1
End Enum

Enum
	JS_REGEXP_G = 1
	JS_REGEXP_I = 2
	JS_REGEXP_M = 4
End Enum

Enum
	JS_READONLY = 1
	JS_DONTENUM = 2
	JS_DONTCONF = 4
End Enum

Enum
	JS_IS_UNDEFINED
	JS_IS_NULL
	JS_IS_BOOLEAN
	JS_IS_NUMBER
	JS_IS_STRING
	JS_IS_FUNCTION
	JS_IS_OBJECT
End Enum

Declare Sub js_report(ByVal J As js_State Ptr, ByVal message As Const ZString Ptr)
Declare Sub js_newerror(ByVal J As js_State Ptr, ByVal message As Const ZString Ptr)
Declare Sub js_newevalerror(ByVal J As js_State Ptr, ByVal message As Const ZString Ptr)
Declare Sub js_newrangeerror(ByVal J As js_State Ptr, ByVal message As Const ZString Ptr)
Declare Sub js_newreferenceerror(ByVal J As js_State Ptr, ByVal message As Const ZString Ptr)
Declare Sub js_newsyntaxerror(ByVal J As js_State Ptr, ByVal message As Const ZString Ptr)
Declare Sub js_newtypeerror(ByVal J As js_State Ptr, ByVal message As Const ZString Ptr)
Declare Sub js_newurierror(ByVal J As js_State Ptr, ByVal message As Const ZString Ptr)
Declare Sub js_error(ByVal J As js_State Ptr, ByVal fmt As Const ZString Ptr, ...)
Declare Sub js_evalerror(ByVal J As js_State Ptr, ByVal fmt As Const ZString Ptr, ...)
Declare Sub js_rangeerror(ByVal J As js_State Ptr, ByVal fmt As Const ZString Ptr, ...)
Declare Sub js_referenceerror(ByVal J As js_State Ptr, ByVal fmt As Const ZString Ptr, ...)
Declare Sub js_syntaxerror(ByVal J As js_State Ptr, ByVal fmt As Const ZString Ptr, ...)
Declare Sub js_typeerror(ByVal J As js_State Ptr, ByVal fmt As Const ZString Ptr, ...)
Declare Sub js_urierror(ByVal J As js_State Ptr, ByVal fmt As Const ZString Ptr, ...)
Declare Sub js_throw(ByVal J As js_State Ptr)
Declare Sub js_loadstring(ByVal J As js_State Ptr, ByVal filename As Const ZString Ptr, ByVal source As Const ZString Ptr)
Declare Sub js_loadfile(ByVal J As js_State Ptr, ByVal filename As Const ZString Ptr)
Declare Sub js_eval(ByVal J As js_State Ptr)
Declare Sub js_call(ByVal J As js_State Ptr, ByVal n As Long)
Declare Sub js_construct(ByVal J As js_State Ptr, ByVal n As Long)
Declare Function js_ref(ByVal J As js_State Ptr) As Const ZString Ptr
Declare Sub js_unref(ByVal J As js_State Ptr, ByVal ref As Const ZString Ptr)
Declare Sub js_getregistry(ByVal J As js_State Ptr, ByVal name_ As Const ZString Ptr)
Declare Sub js_setregistry(ByVal J As js_State Ptr, ByVal name_ As Const ZString Ptr)
Declare Sub js_delregistry(ByVal J As js_State Ptr, ByVal name_ As Const ZString Ptr)
Declare Sub js_getglobal(ByVal J As js_State Ptr, ByVal name_ As Const ZString Ptr)
Declare Sub js_setglobal(ByVal J As js_State Ptr, ByVal name_ As Const ZString Ptr)
Declare Sub js_defglobal(ByVal J As js_State Ptr, ByVal name_ As Const ZString Ptr, ByVal atts As Long)
Declare Sub js_delglobal(ByVal J As js_State Ptr, ByVal name_ As Const ZString Ptr)
Declare Function js_hasproperty(ByVal J As js_State Ptr, ByVal idx As Long, ByVal name_ As Const ZString Ptr) As Long
Declare Sub js_getproperty(ByVal J As js_State Ptr, ByVal idx As Long, ByVal name_ As Const ZString Ptr)
Declare Sub js_setproperty(ByVal J As js_State Ptr, ByVal idx As Long, ByVal name_ As Const ZString Ptr)
Declare Sub js_defproperty(ByVal J As js_State Ptr, ByVal idx As Long, ByVal name_ As Const ZString Ptr, ByVal atts As Long)
Declare Sub js_delproperty(ByVal J As js_State Ptr, ByVal idx As Long, ByVal name_ As Const ZString Ptr)
Declare Sub js_defaccessor(ByVal J As js_State Ptr, ByVal idx As Long, ByVal name_ As Const ZString Ptr, ByVal atts As Long)
Declare Function js_getlength(ByVal J As js_State Ptr, ByVal idx As Long) As Long
Declare Sub js_setlength(ByVal J As js_State Ptr, ByVal idx As Long, ByVal len_ As Long)
Declare Function js_hasindex(ByVal J As js_State Ptr, ByVal idx As Long, ByVal i As Long) As Long
Declare Sub js_getindex(ByVal J As js_State Ptr, ByVal idx As Long, ByVal i As Long)
Declare Sub js_setindex(ByVal J As js_State Ptr, ByVal idx As Long, ByVal i As Long)
Declare Sub js_delindex(ByVal J As js_State Ptr, ByVal idx As Long, ByVal i As Long)
Declare Sub js_currentfunction(ByVal J As js_State Ptr)
Declare Function js_currentfunctiondata(ByVal J As js_State Ptr) As Any Ptr
Declare Sub js_pushglobal(ByVal J As js_State Ptr)
Declare Sub js_pushundefined(ByVal J As js_State Ptr)
Declare Sub js_pushnull(ByVal J As js_State Ptr)
Declare Sub js_pushboolean(ByVal J As js_State Ptr, ByVal v As Long)
Declare Sub js_pushnumber(ByVal J As js_State Ptr, ByVal v As Double)
Declare Sub js_pushstring(ByVal J As js_State Ptr, ByVal v As Const ZString Ptr)
Declare Sub js_pushlstring(ByVal J As js_State Ptr, ByVal v As Const ZString Ptr, ByVal n As Long)
Declare Sub js_pushliteral(ByVal J As js_State Ptr, ByVal v As Const ZString Ptr)
Declare Sub js_newobjectx(ByVal J As js_State Ptr)
Declare Sub js_newobject(ByVal J As js_State Ptr)
Declare Sub js_newarray(ByVal J As js_State Ptr)
Declare Sub js_newboolean(ByVal J As js_State Ptr, ByVal v As Long)
Declare Sub js_newnumber(ByVal J As js_State Ptr, ByVal v As Double)
Declare Sub js_newstring(ByVal J As js_State Ptr, ByVal v As Const ZString Ptr)
Declare Sub js_newcfunction(ByVal J As js_State Ptr, ByVal fun As js_CFunction, ByVal name_ As Const ZString Ptr, ByVal length As Long)
Declare Sub js_newcfunctionx(ByVal J As js_State Ptr, ByVal fun As js_CFunction, ByVal name_ As Const ZString Ptr, ByVal length As Long, ByVal data_ As Any Ptr, ByVal finalize As js_Finalize)
Declare Sub js_newcconstructor(ByVal J As js_State Ptr, ByVal fun As js_CFunction, ByVal con As js_CFunction, ByVal name_ As Const ZString Ptr, ByVal length As Long)
Declare Sub js_newuserdata(ByVal J As js_State Ptr, ByVal tag As Const ZString Ptr, ByVal data_ As Any Ptr, ByVal finalize As js_Finalize)
Declare Sub js_newuserdatax(ByVal J As js_State Ptr, ByVal tag As Const ZString Ptr, ByVal data_ As Any Ptr, ByVal has As js_hasproperty, ByVal put_ As js_Put, ByVal del As js_Delete, ByVal finalize As js_Finalize)
Declare Sub js_newregexp(ByVal J As js_State Ptr, ByVal pattern As Const ZString Ptr, ByVal flags As Long)
Declare Sub js_pushiterator(ByVal J As js_State Ptr, ByVal idx As Long, ByVal own As Long)
Declare Function js_nextiterator(ByVal J As js_State Ptr, ByVal idx As Long) As Const ZString Ptr
Declare Function js_isdefined(ByVal J As js_State Ptr, ByVal idx As Long) As Long
declare function js_isundefined(byval J as js_State ptr, byval idx as long) as long
Declare Function JS_ISNULL(ByVal J As js_State Ptr, ByVal idx As Long) As Long
Declare Function JS_ISBOOLEAN(ByVal J As js_State Ptr, ByVal idx As Long) As Long
Declare Function JS_ISNUMBER(ByVal J As js_State Ptr, ByVal idx As Long) As Long
Declare Function JS_ISSTRING(ByVal J As js_State Ptr, ByVal idx As Long) As Long
Declare Function js_isprimitive(ByVal J As js_State Ptr, ByVal idx As Long) As Long
Declare Function JS_ISOBJECT(ByVal J As js_State Ptr, ByVal idx As Long) As Long
Declare Function js_isarray(ByVal J As js_State Ptr, ByVal idx As Long) As Long
Declare Function js_isregexp(ByVal J As js_State Ptr, ByVal idx As Long) As Long
Declare Function js_iscoercible(ByVal J As js_State Ptr, ByVal idx As Long) As Long
Declare Function js_iscallable(ByVal J As js_State Ptr, ByVal idx As Long) As Long
Declare Function js_isuserdata(ByVal J As js_State Ptr, ByVal idx As Long, ByVal tag As Const ZString Ptr) As Long
Declare Function js_iserror(ByVal J As js_State Ptr, ByVal idx As Long) As Long
Declare Function js_isnumberobject(ByVal J As js_State Ptr, ByVal idx As Long) As Long
Declare Function js_isstringobject(ByVal J As js_State Ptr, ByVal idx As Long) As Long
Declare Function js_isbooleanobject(ByVal J As js_State Ptr, ByVal idx As Long) As Long
declare function js_isdateobject(byval J as js_State ptr, byval idx as long) as long
declare function js_toboolean(byval J as js_State ptr, byval idx as long) as long
declare function js_tonumber(byval J as js_State ptr, byval idx as long) as double
declare function js_tostring(byval J as js_State ptr, byval idx as long) as const zstring ptr
declare function js_touserdata(byval J as js_State ptr, byval idx as long, byval tag as const zstring ptr) as any ptr
declare function js_trystring(byval J as js_State ptr, byval idx as long, byval error_ as const zstring ptr) as const zstring ptr
declare function js_trynumber(byval J as js_State ptr, byval idx as long, byval error_ as double) as double
declare function js_tryinteger(byval J as js_State ptr, byval idx as long, byval error_ as long) as long
declare function js_tryboolean(byval J as js_State ptr, byval idx as long, byval error_ as long) as long
declare function js_tointeger(byval J as js_State ptr, byval idx as long) as long
declare function js_toint32(byval J as js_State ptr, byval idx as long) as long
declare function js_touint32(byval J as js_State ptr, byval idx as long) as ulong
declare function js_toint16(byval J as js_State ptr, byval idx as long) as short
declare function js_touint16(byval J as js_State ptr, byval idx as long) as ushort
declare function js_gettop(byval J as js_State ptr) as long
declare sub js_pop(byval J as js_State ptr, byval n as long)
declare sub js_rot(byval J as js_State ptr, byval n as long)
declare sub js_copy(byval J as js_State ptr, byval idx as long)
declare sub js_remove(byval J as js_State ptr, byval idx as long)
declare sub js_insert(byval J as js_State ptr, byval idx as long)
declare sub js_replace(byval J as js_State ptr, byval idx as long)
declare sub js_dup(byval J as js_State ptr)
declare sub js_dup2(byval J as js_State ptr)
declare sub js_rot2(byval J as js_State ptr)
declare sub js_rot3(byval J as js_State ptr)
declare sub js_rot4(byval J as js_State ptr)
declare sub js_rot2pop1(byval J as js_State ptr)
declare sub js_rot3pop2(byval J as js_State ptr)
declare sub js_concat(byval J as js_State ptr)
declare function js_compare(byval J as js_State ptr, byval okay as long ptr) as long
declare function js_equal(byval J as js_State ptr) as long
declare function js_strictequal(byval J as js_State ptr) as long
declare function js_instanceof(byval J as js_State ptr) as long
declare function js_typeof(byval J as js_State ptr, byval idx as long) as const zstring ptr
declare function js_type(byval J as js_State ptr, byval idx as long) as long
declare sub js_repr(byval J as js_State ptr, byval idx as long)
declare function js_torepr(byval J as js_State ptr, byval idx as long) as const zstring ptr
declare function js_tryrepr(byval J as js_State ptr, byval idx as long, byval error_ as const zstring ptr) as const zstring ptr

end extern
#endif
