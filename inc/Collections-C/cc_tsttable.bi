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
#ifndef COLLECTIONS_C_CC_TSTTABLE_H
#define COLLECTIONS_C_CC_TSTTABLE_H
#include once "crt/stdlib.bi"
#include once "crt/stdint.bi"
#include once "crt/string.bi"
#include once "cc_common.bi"
extern "C"

type CC_TSTTable as cc_tsttable_s

type cc_tsttable_conf_s
   char_cmp as function(byval c1 as byte, byval c2 as byte) as long
   mem_alloc as function(byval size as uinteger) as any ptr
   mem_calloc as function(byval blocks as uinteger, byval size as uinteger) as any ptr
   mem_free as sub(byval block as any ptr)
end type

type CC_TSTTableConf as cc_tsttable_conf_s

type cc_tsttable_data_s
   key as zstring ptr
   value as any ptr
end type

type CC_TSTTableEntry as cc_tsttable_data_s

type cc_tsttable_iter_s
   table as CC_TSTTable ptr
   previous_node as any ptr
   current_node as any ptr
   next_node as any ptr
   advanced_on_remove as bool
   next_stat as cc_stat
end type

type CC_TSTTableIter as cc_tsttable_iter_s
declare sub cc_tsttable_conf_init(byval conf as CC_TSTTableConf ptr)
Declare Function cc_tsttable_new(ByVal out_ As CC_TSTTable Ptr Ptr) As cc_stat
declare function cc_tsttable_new_conf(byval conf as const CC_TSTTableConf const ptr, byval out_ as CC_TSTTable ptr ptr) as cc_stat
Declare Function cc_tsttable_struct_size() As UInteger
declare sub cc_tsttable_destroy(byval table as CC_TSTTable ptr)
Declare Function cc_tsttable_add(ByVal table As CC_TSTTable Ptr, ByVal key As ZString Ptr, ByVal val_ As Any Ptr) As cc_stat
declare function cc_tsttable_get(byval table as CC_TSTTable ptr, byval key as zstring ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_tsttable_remove(byval table as CC_TSTTable ptr, byval key as zstring ptr, byval out_ as any ptr ptr) as cc_stat
Declare Sub cc_tsttable_remove_all(ByVal table As CC_TSTTable Ptr)
declare function cc_tsttable_contains_key(byval table as CC_TSTTable ptr, byval key as zstring ptr) as bool
declare function cc_tsttable_size(byval table as CC_TSTTable ptr) as uinteger
declare sub cc_tsttable_foreach_key(byval table as CC_TSTTable ptr, byval op as sub(byval as const any ptr))
declare sub cc_tsttable_foreach_value(byval table as CC_TSTTable ptr, byval op as sub(byval as any ptr))
declare sub cc_tsttable_iter_init(byval iter as CC_TSTTableIter ptr, byval table as CC_TSTTable ptr)
declare function cc_tsttable_iter_next(byval iter as CC_TSTTableIter ptr, byval out_ as CC_TSTTableEntry ptr ptr) as cc_stat
declare function cc_tsttable_iter_remove(byval iter as CC_TSTTableIter ptr, byval out_ as any ptr ptr) as cc_stat
#macro CC_TSTTABLE_FOREACH(tsttable, key_53d46d2a04458e7b, value_53d46d2a04458e7b, body)
   scope
      dim cc_tsttable_iter_53d46d2a04458e7b as CC_TSTTableIter
      cc_tsttable_iter_init(@cc_tsttable_iter_53d46d2a04458e7b, tsttable)
      dim entry_53d46d2a04458e7b as CC_TSTTableEntry ptr
      while cc_tsttable_iter_next(@cc_tsttable_iter_53d46d2a04458e7b, @entry_53d46d2a04458e7b) <> CC_ITER_END
         key_53d46d2a04458e7b = entry_53d46d2a04458e7b->key
         value_53d46d2a04458e7b = entry_53d46d2a04458e7b->value
          body
      wend
   end scope
#endmacro

end extern
#endif