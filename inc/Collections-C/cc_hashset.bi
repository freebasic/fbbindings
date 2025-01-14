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
#ifndef COLLECTIONS_C_CC_HASHSET_H

#define COLLECTIONS_C_CC_HASHSET_H
#include once "cc_hashtable.bi"
#include once "cc_common.bi"
extern "C"

type BOOL As long
Type CC_HashSet As cc_hashset_s
type CC_HashSetConf as CC_HashTableConf

type cc_hashset_iter_s
   iter as CC_HashTableIter
end type

type CC_HashSetIter as cc_hashset_iter_s
declare sub cc_hashset_conf_init(byval conf as CC_HashSetConf ptr)
declare function cc_hashset_new(byval hs as CC_HashSet ptr ptr) as cc_stat
declare function cc_hashset_new_conf(byval conf as const CC_HashSetConf const ptr, byval hs as CC_HashSet ptr ptr) as cc_stat
declare sub cc_hashset_destroy(byval set as CC_HashSet ptr)
declare function cc_hashset_struct_size() as uinteger
declare function cc_hashset_add(byval set as CC_HashSet ptr, byval element as any ptr) as cc_stat
declare function cc_hashset_remove(byval set as CC_HashSet ptr, byval element as any ptr, byval out_ as any ptr ptr) as cc_stat
declare sub cc_hashset_remove_all(byval set as CC_HashSet ptr)
Declare Function cc_hashset_contains(ByVal set As CC_HashSet Ptr, ByVal element As Any Ptr) As BOOL
declare function cc_hashset_size(byval set as CC_HashSet ptr) as uinteger
declare function cc_hashset_capacity(byval set as CC_HashSet ptr) as uinteger
declare sub cc_hashset_foreach(byval set as CC_HashSet ptr, byval op as sub(byval as const any ptr))
declare sub cc_hashset_iter_init(byval iter as CC_HashSetIter ptr, byval set as CC_HashSet ptr)
declare function cc_hashset_iter_next(byval iter as CC_HashSetIter ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_hashset_iter_remove(byval iter as CC_HashSetIter ptr, byval out_ as any ptr ptr) as cc_stat
'#macro CC_HASHSET_FOREACH(val_, hashset_, body)
'   scope
'      dim cc_hashset_iter_53d46d2a04458e7b as CC_HashSetIter
'      cc_hashset_iter_init(@cc_hashset_iter_53d46d2a04458e7b, hashset_)
'      dim val_ as any ptr
'       while (cc_hashset_iter_next(@cc_hashset_iter_53d46d2a04458e7b, @val) <> CC_ITER_END) 
'            body
'        wend
'   End Scope
'#endmacro

end extern
#endif
