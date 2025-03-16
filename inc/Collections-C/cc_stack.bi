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
#ifndef COLLECTIONS_C_STACK_H

#define COLLECTIONS_C_STACK_H
#include once "cc_common.bi"
#include once "cc_array.bi"


extern "C"


type CC_Stack as cc_stack_s
type CC_StackConf as CC_ArrayConf

type cc_stack_iter_s
	i as CC_ArrayIter
end type

type CC_StackIter as cc_stack_iter_s

type cc_stack_zip_iter_s
	i as CC_ArrayZipIter
end type

type CC_StackZipIter as cc_stack_zip_iter_s
declare sub cc_stack_conf_init(byval conf as CC_StackConf ptr)
declare function cc_stack_new(byval out_ as CC_Stack ptr ptr) as cc_stat
declare function cc_stack_new_conf(byval conf as const CC_StackConf const ptr, byval out_ as CC_Stack ptr ptr) as cc_stat
declare sub cc_stack_destroy(byval stack as CC_Stack ptr)
declare sub cc_stack_destroy_cb(byval stack as CC_Stack ptr, byval cb as sub(byval as any ptr))
declare function cc_stack_struct_size() as uinteger
declare function cc_stack_push(byval stack as CC_Stack ptr, byval element as any ptr) as cc_stat
declare function cc_stack_peek(byval stack as CC_Stack ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_stack_pop(byval stack as CC_Stack ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_stack_size(byval stack as CC_Stack ptr) as uinteger
declare sub cc_stack_map(byval stack as CC_Stack ptr, byval fn as sub(byval as any ptr))
declare function cc_stack_filter_mut(byval stack as CC_Stack ptr, byval predicate as function(byval as const any ptr) as bool) as cc_stat
declare function cc_stack_filter(byval stack as CC_Stack ptr, byval predicate as function(byval as const any ptr) as bool, byval out_ as CC_Stack ptr ptr) as cc_stat
declare sub cc_stack_iter_init(byval iter as CC_StackIter ptr, byval s as CC_Stack ptr)
declare function cc_stack_iter_next(byval iter as CC_StackIter ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_stack_iter_replace(byval iter as CC_StackIter ptr, byval element as any ptr, byval out_ as any ptr ptr) as cc_stat
declare sub cc_stack_zip_iter_init(byval iter as CC_StackZipIter ptr, byval a1 as CC_Stack ptr, byval a2 as CC_Stack ptr)
declare function cc_stack_zip_iter_next(byval iter as CC_StackZipIter ptr, byval out1 as any ptr ptr, byval out2 as any ptr ptr) as cc_stat
declare function cc_stack_zip_iter_replace(byval iter as CC_StackZipIter ptr, byval e1 as any ptr, byval e2 as any ptr, byval out1 as any ptr ptr, byval out2 as any ptr ptr) as cc_stat
#macro CC_STACK_FOREACH(val, stack, body)
	scope
		dim stack_iter_53d46d2a04458e7b as CC_StackIter
		cc_stack_iter_init(@stack_iter_53d46d2a04458e7b, stack)
		dim val as any ptr
		while (cc_stack_iter_next(&stack_iter_53d46d2a04458e7b, &val) <> CC_ITER_END) 
            body
        wend
	end scope
#endmacro
#macro CC_STACK_FOREACH_ZIP(val1, val2, stack1, stack2, body)
	scope
		dim stack_zip_iter_ea08d3e52f25883b3 as CC_StackZipIter
		cc_stack_zip_iter_init(@stack_zip_iter_ea08d3e52f25883b, stack1, stack2)
		dim val1 as any ptr
		dim val2 as any ptr
		while (cc_stack_zip_iter_next(&stack_zip_iter_ea08d3e52f25883b3, &val1, &val2) <> CC_ITER_END) 
            body
        wend
	end scope
#endmacro

end extern
#endif
