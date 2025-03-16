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
#ifndef _CC_DYNAMIC_POOL_H_

#define _CC_DYNAMIC_POOL_H_
#include once "cc_common.bi"

extern "C"

type CC_DynamicPool as cc_dynamic_pool_s


type cc_dynamic_pool_conf_s
	exp_factor as single
	is_fixed as bool
	is_packed as bool
	alignment_boundary as uinteger
	mem_alloc as function(byval size as uinteger) as any ptr
	mem_calloc as function(byval blocks as uinteger, byval size as uinteger) as any ptr
	mem_free as sub(byval block as any ptr)
end type

type CC_DynamicPoolConf as cc_dynamic_pool_conf_s
declare function cc_dynamic_pool_new(byval initial_size as uinteger, byval out_ as CC_DynamicPool ptr ptr) as cc_stat
declare function cc_dynamic_pool_new_conf(byval initial_size as uinteger, byval conf as const CC_DynamicPoolConf const ptr, byval out_ as CC_DynamicPool ptr ptr) as cc_stat
declare sub cc_dynamic_pool_conf_init(byval conf as CC_DynamicPoolConf ptr)
declare sub cc_dynamic_pool_destroy(byval pool as CC_DynamicPool ptr)
declare sub cc_dynamic_pool_reset(byval pool as CC_DynamicPool ptr)
declare function cc_dynamic_pool_used_bytes(byval pool as CC_DynamicPool ptr) as uinteger
declare function cc_dynamic_pool_free_bytes(byval pool as CC_DynamicPool ptr) as uinteger
declare function cc_dynamic_pool_malloc(byval size as uinteger, byval pool as CC_DynamicPool ptr) as any ptr
declare function cc_dynamic_pool_calloc(byval count as uinteger, byval size as uinteger, byval pool as CC_DynamicPool ptr) as any ptr
declare sub cc_dynamic_pool_free(byval ptr as any ptr, byval pool as CC_DynamicPool ptr)
declare function cc_dynamic_pool_struct_size() as uinteger

end extern
#endif