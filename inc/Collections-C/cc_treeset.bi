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
#ifndef COLLECTIONS_C_CC_TREESET_H

#define COLLECTIONS_C_CC_TREESET_H
#include once "cc_common.bi"
#include once "cc_treetable.bi"

extern "C"

Type CC_TreeSet As cc_treeset_s
type CC_TreeSetConf as CC_TreeTableConf

type cc_treeset_iter_s
   i as CC_TreeTableIter
end type

type CC_TreeSetIter as cc_treeset_iter_s
declare sub cc_treeset_conf_init(byval conf as CC_TreeSetConf ptr)
declare function cc_treeset_new(byval cmp as function(byval as const any ptr, byval as const any ptr) as long, byval set as CC_TreeSet ptr ptr) as cc_stat
declare function cc_treeset_new_conf(byval conf as const CC_TreeSetConf const ptr, byval set as CC_TreeSet ptr ptr) as cc_stat
declare function cc_treeset_struct_size() as uinteger
declare sub cc_treeset_destroy(byval set as CC_TreeSet ptr)
declare function cc_treeset_add(byval set as CC_TreeSet ptr, byval element as any ptr) as cc_stat
declare function cc_treeset_remove(byval set as CC_TreeSet ptr, byval element as any ptr, byval out_ as any ptr ptr) as cc_stat
declare sub cc_treeset_remove_all(byval set as CC_TreeSet ptr)
declare function cc_treeset_get_first(byval set as CC_TreeSet ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_treeset_get_last(byval set as CC_TreeSet ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_treeset_get_greater_than(byval set as CC_TreeSet ptr, byval element as any ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_treeset_get_lesser_than(byval set as CC_TreeSet ptr, byval element as any ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_treeset_contains(byval set as CC_TreeSet ptr, byval element as any ptr) as bool
declare function cc_treeset_size(byval set as CC_TreeSet ptr) as uinteger
declare sub cc_treeset_foreach(byval set as CC_TreeSet ptr, byval op as sub(byval as const any ptr))
declare sub cc_treeset_iter_init(byval iter as CC_TreeSetIter ptr, byval set as CC_TreeSet ptr)
declare function cc_treeset_iter_next(byval iter as CC_TreeSetIter ptr, byval element as any ptr ptr) as cc_stat
declare function cc_treeset_iter_remove(byval iter as CC_TreeSetIter ptr, byval out_ as any ptr ptr) as cc_stat

end extern
#endif