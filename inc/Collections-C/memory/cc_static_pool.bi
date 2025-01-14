'freebasic bindings for Collections-C library.
'Collections-C is a library of generic data structures for the C language.
'GNU LESSER GENERAL PUBLIC LICENSE
'                       Version 3, 29 June 2007
'
' Copyright (C) 2007 free Software Foundation, Inc. <http://fsf.org/>
' Everyone is permitted to copy and distribute verbatim copies
' of this license document, but changing it is not allowed.
'
'  This version of the GNU Lesser General Public License incorporates
'the terms and conditions of version 3 of the GNU General Public
'License, supplemented by the additional permissions listed.
'  As used herein, "this License" refers to version 3 of the GNU Lesser
'General Public License, and the "GNU GPL" refers to version 3 of the GNU
'General Public License.
'' translated to FreeBASIC by:
''   FreeBASIC development team

#pragma once
#ifndef _CC_BLOCK_POOL_H_
#define _CC_BLOCK_POOL_H_
#include once "../cc_common.bi"

extern "C"

type CC_StaticPool as cc_static_pool_s 
#define _CC_BLOCK_POOL_H_
declare function cc_static_pool_new(byval size as uinteger, byval offset as uinteger, byval buf as ubyte ptr, byval pool_alloc as ubyte ptr, byval out_ as CC_StaticPool ptr ptr) as cc_stat
declare function cc_static_pool_struct_size() as uinteger
declare sub cc_static_pool_reset(byval pool as CC_StaticPool ptr)
declare function cc_static_pool_used_bytes(byval pool as CC_StaticPool ptr) as uinteger
declare function cc_static_pool_free_bytes(byval pool as CC_StaticPool ptr) as uinteger
declare function cc_static_pool_malloc(byval size as uinteger, byval pool as CC_StaticPool ptr) as any ptr
declare function cc_static_pool_calloc(byval count as uinteger, byval size as uinteger, byval pool as CC_StaticPool ptr) as any ptr
Declare Sub cc_static_pool_free(ByVal Ptr_ As Any Ptr, ByVal pool As CC_StaticPool Ptr)

end extern
#endif