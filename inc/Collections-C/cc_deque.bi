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
#ifndef COLLECTIONS_C_CC_DEQUE_H

#define COLLECTIONS_C_CC_DEQUE_H
#include once "crt/stdlib.bi"
#include once "crt/stdint.bi"
#include once "crt/string.bi"
#include once "cc_common.bi"

extern "C"

Type CC_Deque As cc_deque_s

type cc_deque_conf_s
   capacity as uinteger
   mem_alloc as function(byval size as uinteger) as any ptr
   mem_calloc as function(byval blocks as uinteger, byval size as uinteger) as any ptr
   mem_free as sub(byval block as any ptr)
end type

type CC_DequeConf as cc_deque_conf_s

type cc_deque_iter_s
   deque as CC_Deque ptr
   index as uinteger
   last_removed as bool
end type

type CC_DequeIter as cc_deque_iter_s

type cc_deque_zip_iter_s
   d1 as CC_Deque ptr
   d2 as CC_Deque ptr
   index as uinteger
   last_removed as bool
end type

type CC_DequeZipIter as cc_deque_zip_iter_s
declare function cc_deque_new(byval deque as CC_Deque ptr ptr) as cc_stat
declare function cc_deque_new_conf(byval conf as const CC_DequeConf const ptr, byval deque as CC_Deque ptr ptr) as cc_stat
declare sub cc_deque_conf_init(byval conf as CC_DequeConf ptr)
declare function cc_deque_struct_size() as uinteger
declare sub cc_deque_destroy(byval deque as CC_Deque ptr)
declare sub cc_deque_destroy_cb(byval deque as CC_Deque ptr, byval cb as sub(byval as any ptr))
declare function cc_deque_add(byval deque as CC_Deque ptr, byval element as any ptr) as cc_stat
declare function cc_deque_add_first(byval deque as CC_Deque ptr, byval element as any ptr) as cc_stat
declare function cc_deque_add_last(byval deque as CC_Deque ptr, byval element as any ptr) as cc_stat
declare function cc_deque_add_at(byval deque as CC_Deque ptr, byval element as any ptr, byval index as uinteger) as cc_stat
declare function cc_deque_replace_at(byval deque as CC_Deque ptr, byval element as any ptr, byval index as uinteger, byval out_ as any ptr ptr) as cc_stat
declare function cc_deque_remove(byval deque as CC_Deque ptr, byval element as any ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_deque_remove_at(byval deque as CC_Deque ptr, byval index as uinteger, byval out_ as any ptr ptr) as cc_stat
declare function cc_deque_remove_first(byval deque as CC_Deque ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_deque_remove_last(byval deque as CC_Deque ptr, byval out_ as any ptr ptr) as cc_stat
declare sub cc_deque_remove_all(byval deque as CC_Deque ptr)
declare sub cc_deque_remove_all_cb(byval deque as CC_Deque ptr, byval cb as sub(byval as any ptr))
declare function cc_deque_get_at(byval deque as const CC_Deque const ptr, byval index as uinteger, byval out_ as any ptr ptr) as cc_stat
declare function cc_deque_get_first(byval deque as const CC_Deque const ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_deque_get_last(byval deque as const CC_Deque const ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_deque_copy_shallow(byval deque as const CC_Deque const ptr, byval out_ as CC_Deque ptr ptr) as cc_stat
declare function cc_deque_copy_deep(byval deque as const CC_Deque const ptr, byval cp as function(byval as any ptr) as any ptr, byval out_ as CC_Deque ptr ptr) as cc_stat
declare sub cc_deque_reverse(byval deque as CC_Deque ptr)
declare function cc_deque_trim_capacity(byval deque as CC_Deque ptr) as cc_stat
declare function cc_deque_contains(byval deque as const CC_Deque const ptr, byval element as const any ptr) as uinteger
declare function cc_deque_contains_value(byval deque as const CC_Deque const ptr, byval element as const any ptr, byval cmp as function(byval as const any ptr, byval as const any ptr) as long) as uinteger
declare function cc_deque_size(byval deque as const CC_Deque const ptr) as uinteger
declare function cc_deque_capacity(byval deque as const CC_Deque const ptr) as uinteger
declare function cc_deque_index_of(byval deque as const CC_Deque const ptr, byval element as const any ptr, byval i as uinteger ptr) as cc_stat
declare sub cc_deque_foreach(byval deque as CC_Deque ptr, byval fn as sub(byval as any ptr))
declare function cc_deque_filter_mut(byval deque as CC_Deque ptr, byval predicate as function(byval as const any ptr) as bool) as cc_stat
declare function cc_deque_filter(byval deque as CC_Deque ptr, byval predicate as function(byval as const any ptr) as bool, byval out_ as CC_Deque ptr ptr) as cc_stat
declare sub cc_deque_iter_init(byval iter as CC_DequeIter ptr, byval deque as CC_Deque ptr)
declare function cc_deque_iter_next(byval iter as CC_DequeIter ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_deque_iter_remove(byval iter as CC_DequeIter ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_deque_iter_add(byval iter as CC_DequeIter ptr, byval element as any ptr) as cc_stat
declare function cc_deque_iter_replace(byval iter as CC_DequeIter ptr, byval replacement as any ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_deque_iter_index(byval iter as CC_DequeIter ptr) as uinteger
declare sub cc_deque_zip_iter_init(byval iter as CC_DequeZipIter ptr, byval d1 as CC_Deque ptr, byval d2 as CC_Deque ptr)
declare function cc_deque_zip_iter_next(byval iter as CC_DequeZipIter ptr, byval out1 as any ptr ptr, byval out2 as any ptr ptr) as cc_stat
declare function cc_deque_zip_iter_add(byval iter as CC_DequeZipIter ptr, byval e1 as any ptr, byval e2 as any ptr) as cc_stat
declare function cc_deque_zip_iter_remove(byval iter as CC_DequeZipIter ptr, byval out1 as any ptr ptr, byval out2 as any ptr ptr) as cc_stat
declare function cc_deque_zip_iter_replace(byval iter as CC_DequeZipIter ptr, byval e1 as any ptr, byval e2 as any ptr, byval out1 as any ptr ptr, byval out2 as any ptr ptr) as cc_stat
declare function cc_deque_zip_iter_index(byval iter as CC_DequeZipIter ptr) as uinteger
declare function cc_deque_get_buffer(byval deque as const CC_Deque const ptr) as const any const ptr ptr

#macro CC_DEQUE_FOREACH_ZIP(val1, val2, deque1, deque2, body)
   scope
      dim cc_deque_zip_iter_ea08d3e52f25883b3 as CC_DequeZipIter
      cc_deque_zip_iter_init(@cc_deque_zip_iter_ea08d3e52f25883b, deque1, deque2)
      dim val1 as any ptr
      dim val2 as any ptr
      while (cc_deque_zip_iter_next(@cc_deque_zip_iter_ea08d3e52f25883b3, @val1, @val2) <> CC_ITER_END) 
            body
        Wend
   end scope
#endmacro

end extern
#endif