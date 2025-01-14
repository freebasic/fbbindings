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
#ifndef COLLECTIONS_C_CC_PQUEUE_H

#define COLLECTIONS_C_CC_PQUEUE_H
#include once "cc_common.bi"
#include once "cc_array.bi"

extern "C"

Type CC_PQueue As cc_pqueue_s

type cc_pqueue_conf_s
   capacity as uinteger
   exp_factor as single
   cmp as function(byval a as const any ptr, byval b as const any ptr) as long
   mem_alloc as function(byval size as uinteger) as any ptr
   mem_calloc as function(byval blocks as uinteger, byval size as uinteger) as any ptr
   mem_free as sub(byval block as any ptr)
end type

type CC_PQueueConf as cc_pqueue_conf_s
declare sub cc_pqueue_conf_init(byval conf as CC_PQueueConf ptr, byval as function(byval as const any ptr, byval as const any ptr) as long)
declare function cc_pqueue_new(byval out_ as CC_PQueue ptr ptr, byval as function(byval as const any ptr, byval as const any ptr) as long) as cc_stat
declare function cc_pqueue_new_conf(byval conf as const CC_PQueueConf const ptr, byval out_ as CC_PQueue ptr ptr) as cc_stat
declare sub cc_pqueue_destroy(byval pqueue as CC_PQueue ptr)
declare sub cc_pqueue_destroy_cb(byval pqueue as CC_PQueue ptr, byval cb as sub(byval as any ptr))
declare function cc_pqueue_struct_size() as uinteger
declare function cc_pqueue_push(byval pqueue as CC_PQueue ptr, byval element as any ptr) as cc_stat
declare function cc_pqueue_top(byval pqueue as CC_PQueue ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_pqueue_pop(byval pqueue as CC_PQueue ptr, byval out_ as any ptr ptr) as cc_stat

end extern
#endif