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
#ifndef COLLECTIONS_C_CC_LIST_H

#define COLLECTIONS_C_CC_LIST_H
#include once "crt/stdlib.bi"
#include once "crt/stdint.bi"
#include once "crt/string.bi"
#include once "cc_common.bi"
extern "C"

Type CC_List As cc_list_s

type node_s
   data_ as any ptr
   next_ As node_s Ptr
   prev as node_s ptr
end type

Type Node As node_s

type cc_list_iter_s
   index as uinteger
   list as CC_List ptr
   last as Node ptr
   next_ as Node ptr
end type

type CC_ListIter as cc_list_iter_s

type cc_list_zip_iter_s
   l1 as CC_List ptr
   l2 as CC_List ptr
   l1_last as Node ptr
   l2_last as Node ptr
   l1_next as Node ptr
   l2_next as Node ptr
   index as uinteger
end type

type CC_ListZipIter as cc_list_zip_iter_s

type cc_list_conf_s
   mem_alloc as function(byval size as uinteger) as any ptr
   mem_calloc as function(byval blocks as uinteger, byval size as uinteger) as any ptr
   mem_free as sub(byval block as any ptr)
end type

type CC_ListConf as cc_list_conf_s
declare sub cc_list_conf_init(byval conf as CC_ListConf ptr)
declare function cc_list_new(byval list as CC_List ptr ptr) as cc_stat
declare function cc_list_new_conf(byval conf as const CC_ListConf const ptr, byval list as CC_List ptr ptr) as cc_stat
Declare Sub cc_list_destroy(ByVal list As CC_List Ptr)
declare sub cc_list_destroy_cb(byval list as CC_List ptr, byval cb as sub(byval as any ptr))
declare function cc_list_struct_size() as uinteger
declare function cc_list_splice(byval list1 as CC_List ptr, byval list2 as CC_List ptr) as cc_stat
declare function cc_list_splice_at(byval list as CC_List ptr, byval list2 as CC_List ptr, byval index as uinteger) as cc_stat
Declare Function cc_list_add(ByVal list As CC_List Ptr, ByVal element As Any Ptr) As cc_stat
declare function cc_list_add_at(byval list as CC_List ptr, byval element as any ptr, byval index as uinteger) as cc_stat
declare function cc_list_add_all(byval list1 as CC_List ptr, byval list2 as CC_List ptr) as cc_stat
declare function cc_list_add_all_at(byval list as CC_List ptr, byval list2 as CC_List ptr, byval index as uinteger) as cc_stat
declare function cc_list_add_first(byval list as CC_List ptr, byval element as any ptr) as cc_stat
declare function cc_list_add_last(byval list as CC_List ptr, byval element as any ptr) as cc_stat
declare function cc_list_remove(byval list as CC_List ptr, byval element as any ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_list_remove_first(byval list as CC_List ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_list_remove_last(byval list as CC_List ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_list_remove_at(byval list as CC_List ptr, byval index as uinteger, byval out_ as any ptr ptr) as cc_stat
declare function cc_list_remove_all(byval list as CC_List ptr) as cc_stat
declare function cc_list_remove_all_cb(byval list as CC_List ptr, byval cb as sub(byval as any ptr)) as cc_stat
Declare Function cc_list_get_at(ByVal list As CC_List Ptr, ByVal index As UInteger, ByVal out_ As Any Ptr Ptr) As cc_stat
Declare Function cc_list_get_first(ByVal list As CC_List Ptr, ByVal out_ As Any Ptr Ptr) As cc_stat
declare function cc_list_get_last(byval list as CC_List ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_list_sublist(byval list as CC_List ptr, byval from as uinteger, byval to as uinteger, byval out_ as CC_List ptr ptr) as cc_stat
Declare Function cc_list_copy_shallow(ByVal list As CC_List Ptr, ByVal out_ As CC_List Ptr Ptr) As cc_stat
declare function cc_list_copy_deep(byval list as CC_List ptr, byval cp as function(byval as any ptr) as any ptr, byval out_ as CC_List ptr ptr) as cc_stat
declare function cc_list_replace_at(byval list as CC_List ptr, byval element as any ptr, byval index as uinteger, byval out_ as any ptr ptr) as cc_stat
declare function cc_list_contains(byval list as CC_List ptr, byval element as any ptr) as uinteger
declare function cc_list_contains_value(byval list as CC_List ptr, byval element as any ptr, byval cmp as function(byval as const any ptr, byval as const any ptr) as long) as uinteger
declare function cc_list_index_of(byval list as CC_List ptr, byval element as any ptr, byval cmp as function(byval as const any ptr, byval as const any ptr) as long, byval index as uinteger ptr) as cc_stat
declare function cc_list_to_array(byval list as CC_List ptr, byval out_ as any ptr ptr ptr) as cc_stat
declare sub cc_list_reverse(byval list as CC_List ptr)
declare function cc_list_sort(byval list as CC_List ptr, byval cmp as function(byval as const any ptr, byval as const any ptr) as long) as cc_stat
declare sub cc_list_sort_in_place(byval list as CC_List ptr, byval cmp as function(byval as const any ptr, byval as const any ptr) as long)
declare function cc_list_size(byval list as CC_List ptr) as uinteger
declare sub cc_list_foreach(byval list as CC_List ptr, byval op as sub(byval as any ptr))
declare function cc_list_reduce(byval list as CC_List ptr, byval fn as sub(byval as any ptr, byval as any ptr, byval as any ptr), byval result as any ptr) as cc_stat
declare function cc_list_filter_mut(byval list as CC_List ptr, byval predicate as function(byval as const any ptr) as bool) as cc_stat
declare function cc_list_filter(byval list as CC_List ptr, byval predicate as function(byval as const any ptr) as bool, byval out_ as CC_List ptr ptr) as cc_stat
declare sub cc_list_iter_init(byval iter as CC_ListIter ptr, byval list as CC_List ptr)
declare function cc_list_iter_remove(byval iter as CC_ListIter ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_list_iter_add(byval iter as CC_ListIter ptr, byval element as any ptr) as cc_stat
declare function cc_list_iter_replace(byval iter as CC_ListIter ptr, byval element as any ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_list_iter_index(byval iter as CC_ListIter ptr) as uinteger
declare function cc_list_iter_next(byval iter as CC_ListIter ptr, byval out_ as any ptr ptr) as cc_stat
declare sub cc_list_diter_init(byval iter as CC_ListIter ptr, byval list as CC_List ptr)
declare function cc_list_diter_remove(byval iter as CC_ListIter ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_list_diter_add(byval iter as CC_ListIter ptr, byval element as any ptr) as cc_stat
declare function cc_list_diter_replace(byval iter as CC_ListIter ptr, byval element as any ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_list_diter_index(byval iter as CC_ListIter ptr) as uinteger
declare function cc_list_diter_next(byval iter as CC_ListIter ptr, byval out_ as any ptr ptr) as cc_stat
declare sub cc_list_zip_iter_init(byval iter as CC_ListZipIter ptr, byval l1 as CC_List ptr, byval l2 as CC_List ptr)
declare function cc_list_zip_iter_next(byval iter as CC_ListZipIter ptr, byval out1 as any ptr ptr, byval out2 as any ptr ptr) as cc_stat
declare function cc_list_zip_iter_add(byval iter as CC_ListZipIter ptr, byval e1 as any ptr, byval e2 as any ptr) as cc_stat
declare function cc_list_zip_iter_remove(byval iter as CC_ListZipIter ptr, byval out1 as any ptr ptr, byval out2 as any ptr ptr) as cc_stat
declare function cc_list_zip_iter_replace(byval iter as CC_ListZipIter ptr, byval e1 as any ptr, byval e2 as any ptr, byval out1 as any ptr ptr, byval out2 as any ptr ptr) as cc_stat
declare function cc_list_zip_iter_index(byval iter as CC_ListZipIter ptr) as uinteger
'#macro CC_LIST_FOREACH(val_, list_, body)
'   Scope
'      Dim cc_list_iter_53d46d2a04458e7b As CC_ListIter
'      cc_list_iter_init(@cc_list_iter_53d46d2a04458e7b, list_)
'      dim val_ as any ptr
'      while (cc_list_iter_next(@cc_list_iter_53d46d2a04458e7b, @val) != CC_ITER_END) 
'            body
'        wend
'   End Scope
'#endmacro
#macro CC_LIST_FOREACH_ZIP(val1, val2, list1, list2, body)
   scope
      dim cc_list_zip_iter_ea08d3e52f25883b3 as CC_ListZipIter
      cc_list_zip_iter_init(@cc_list_zip_iter_ea08d3e52f25883b, list1, list2)
      dim val1 as any ptr
      dim val2 as any ptr
      while (cc_list_zip_iter_next(@cc_list_zip_iter_ea08d3e52f25883b3, @val1, @val2) <> CC_ITER_END)
            body
        wend
   end scope
#endmacro

end extern
#endif