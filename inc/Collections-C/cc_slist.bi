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
#ifndef COLLECTIONS_C_CC_SLIST_H

#define COLLECTIONS_C_CC_SLIST_H
#include once "cc_common.bi"

extern "C"

type CC_SList as cc_slist_s

type snode_s
   data_ as any ptr
   next_ as snode_s ptr
end type

type SNode as snode_s

type cc_slist_iter_s
   index as uinteger
   list as CC_SList ptr
   next_ as SNode ptr
   current as SNode ptr
   prev as SNode ptr
end type

type CC_SListIter as cc_slist_iter_s

type cc_slist_zip_iter_s
   index as uinteger
   l1 As CC_SList Ptr
   l2 as CC_SList ptr
   l1_next as SNode ptr
   l2_next as SNode ptr
   l1_current as SNode ptr
   l2_current as SNode ptr
   l1_prev as SNode ptr
   l2_prev as SNode ptr
end type

type CC_SListZipIter as cc_slist_zip_iter_s

type cc_slist_conf_s
   mem_alloc as function(byval size as uinteger) as any ptr
   mem_calloc as function(byval blocks as uinteger, byval size as uinteger) as any ptr
   mem_free as sub(byval block as any ptr)
end type

type CC_SListConf as cc_slist_conf_s
declare sub cc_slist_conf_init(byval conf as CC_SListConf ptr)
declare function cc_slist_new(byval list as CC_SList ptr ptr) as cc_stat
declare function cc_slist_new_conf(byval conf as const CC_SListConf const ptr, byval list as CC_SList ptr ptr) as cc_stat
declare sub cc_slist_destroy(byval list as CC_SList ptr)
declare sub cc_slist_destroy_cb(byval list as CC_SList ptr, byval cb as sub(byval as any ptr))
declare function cc_slist_struct_size() as uinteger
declare function cc_slist_splice(byval list1 as CC_SList ptr, byval list2 as CC_SList ptr) as cc_stat
declare function cc_slist_splice_at(byval list1 as CC_SList ptr, byval list2 as CC_SList ptr, byval index as uinteger) as cc_stat
declare function cc_slist_add(byval list as CC_SList ptr, byval element as any ptr) as cc_stat
declare function cc_slist_add_at(byval list as CC_SList ptr, byval element as any ptr, byval index as uinteger) as cc_stat
declare function cc_slist_add_all(byval list1 as CC_SList ptr, byval list2 as CC_SList ptr) as cc_stat
declare function cc_slist_add_all_at(byval list1 as CC_SList ptr, byval list2 as CC_SList ptr, byval index as uinteger) as cc_stat
declare function cc_slist_add_first(byval list as CC_SList ptr, byval element as any ptr) as cc_stat
declare function cc_slist_add_last(byval list as CC_SList ptr, byval element as any ptr) as cc_stat
declare function cc_slist_remove(byval list as CC_SList ptr, byval element as any ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_slist_remove_first(byval list as CC_SList ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_slist_remove_last(byval list as CC_SList ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_slist_remove_at(byval list as CC_SList ptr, byval index as uinteger, byval out_ as any ptr ptr) as cc_stat
declare function cc_slist_remove_all(byval list as CC_SList ptr) as cc_stat
declare function cc_slist_remove_all_cb(byval list as CC_SList ptr, byval cb as sub(byval as any ptr)) as cc_stat
declare function cc_slist_get_at(byval list as CC_SList ptr, byval index as uinteger, byval out_ as any ptr ptr) as cc_stat
declare function cc_slist_get_first(byval list as CC_SList ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_slist_get_last(byval list as CC_SList ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_slist_sublist(byval list as CC_SList ptr, byval from as uinteger, byval to as uinteger, byval out_ as CC_SList ptr ptr) as cc_stat
declare function cc_slist_copy_shallow(byval list as CC_SList ptr, byval out_ as CC_SList ptr ptr) as cc_stat
declare function cc_slist_copy_deep(byval list as CC_SList ptr, byval cp as function(byval as any ptr) as any ptr, byval out_ as CC_SList ptr ptr) as cc_stat
declare function cc_slist_replace_at(byval list as CC_SList ptr, byval element as any ptr, byval index as uinteger, byval out_ as any ptr ptr) as cc_stat
declare function cc_slist_contains(byval list as CC_SList ptr, byval element as any ptr) as uinteger
declare function cc_slist_contains_value(byval list as CC_SList ptr, byval element as any ptr, byval cmp as function(byval as const any ptr, byval as const any ptr) as long) as uinteger
declare function cc_slist_index_of(byval list as CC_SList ptr, byval element as any ptr, byval index as uinteger ptr) as cc_stat
declare function cc_slist_to_array(byval list as CC_SList ptr, byval out_ as any ptr ptr ptr) as cc_stat
declare sub cc_slist_reverse(byval list as CC_SList ptr)
declare function cc_slist_sort(byval list as CC_SList ptr, byval cmp as function(byval as const any ptr, byval as const any ptr) as long) as cc_stat
declare function cc_slist_size(byval list as CC_SList ptr) as uinteger
declare sub cc_slist_foreach(byval list as CC_SList ptr, byval op as sub(byval as any ptr))
declare function cc_slist_filter(byval list as CC_SList ptr, byval predicate as function(byval as const any ptr) as bool, byval out_ as CC_SList ptr ptr) as cc_stat
declare function cc_slist_filter_mut(byval list as CC_SList ptr, byval predicate as function(byval as const any ptr) as bool) as cc_stat
declare sub cc_slist_iter_init(byval iter as CC_SListIter ptr, byval list as CC_SList ptr)
declare function cc_slist_iter_remove(byval iter as CC_SListIter ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_slist_iter_add(byval iter as CC_SListIter ptr, byval element as any ptr) as cc_stat
declare function cc_slist_iter_replace(byval iter as CC_SListIter ptr, byval element as any ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_slist_iter_next(byval iter as CC_SListIter ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_slist_iter_index(byval iter as CC_SListIter ptr) as uinteger
declare sub cc_slist_zip_iter_init(byval iter as CC_SListZipIter ptr, byval l1 as CC_SList ptr, byval l2 as CC_SList ptr)
declare function cc_slist_zip_iter_next(byval iter as CC_SListZipIter ptr, byval out1 as any ptr ptr, byval out2 as any ptr ptr) as cc_stat
declare function cc_slist_zip_iter_add(byval iter as CC_SListZipIter ptr, byval e1 as any ptr, byval e2 as any ptr) as cc_stat
declare function cc_slist_zip_iter_remove(byval iter as CC_SListZipIter ptr, byval out1 as any ptr ptr, byval out2 as any ptr ptr) as cc_stat
declare function cc_slist_zip_iter_replace(byval iter as CC_SListZipIter ptr, byval e1 as any ptr, byval e2 as any ptr, byval out1 as any ptr ptr, byval out2 as any ptr ptr) as cc_stat
declare function cc_slist_zip_iter_index(byval iter as CC_SListZipIter ptr) as uinteger

end extern
#endif