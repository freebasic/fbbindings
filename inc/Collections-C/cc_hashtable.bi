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
#ifndef COLLECTIONS_C_CC_HASHTABLE_H

#define COLLECTIONS_C_CC_HASHTABLE_H
#include "cc_array.bi"
#include "cc_common.bi"

Extern "C"

const KEY_LENGTH_VARIABLE = -1
#define KEY_LENGTH_POINTER sizeof(any ptr)
Type CC_HashTable As cc_hashtable_s

type table_entry_s
   key as any ptr
   value as any ptr
   hash as uinteger
   next_ as table_entry_s ptr
end type

type TableEntry as table_entry_s

type cc_hashtable_iter
   table as CC_HashTable ptr
   bucket_index as uinteger
   prev_entry as TableEntry ptr
   next_entry as TableEntry ptr
end type

type CC_HashTableIter as cc_hashtable_iter

type cc_hashtable_conf_s
   load_factor as single
   initial_capacity as uinteger
   key_length as long
   hash_seed as ulong
   hash as function(byval key as const any ptr, byval l as long, byval seed as ulong) as uinteger
   key_compare as function(byval key1 as const any ptr, byval key2 as const any ptr) as long
   mem_alloc as function(byval size as uinteger) as any ptr
   mem_calloc as function(byval blocks as uinteger, byval size as uinteger) as any ptr
   mem_free as sub(byval block as any ptr)
end type

type CC_HashTableConf as cc_hashtable_conf_s
declare sub cc_hashtable_conf_init(byval conf as CC_HashTableConf ptr)
declare function cc_hashtable_new(byval out_ as CC_HashTable ptr ptr) as cc_stat
declare function cc_hashtable_new_conf(byval conf as const CC_HashTableConf const ptr, byval out_ as CC_HashTable ptr ptr) as cc_stat
declare function cc_hashtable_struct_size() as uinteger
declare sub cc_hashtable_destroy(byval table as CC_HashTable ptr)
declare function cc_hashtable_add(byval table as CC_HashTable ptr, byval key as any ptr, byval val as any ptr) as cc_stat
Declare Function cc_hashtable_get(ByVal table As CC_HashTable Ptr, ByVal key As Any Ptr, ByVal out_ As Any Ptr Ptr) As cc_stat
declare function cc_hashtable_remove(byval table as CC_HashTable ptr, byval key as any ptr, byval out_ as any ptr ptr) as cc_stat
declare sub cc_hashtable_remove_all(byval table as CC_HashTable ptr)
declare function cc_hashtable_contains_key(byval table as CC_HashTable ptr, byval key as any ptr) as bool
Declare Function cc_hashtable_size(ByVal table As CC_HashTable Ptr) As UInteger
declare function cc_hashtable_capacity(byval table as CC_HashTable ptr) as uinteger
declare function cc_hashtable_get_keys(byval table as CC_HashTable ptr, byval out_ as CC_Array ptr ptr) as cc_stat
declare function cc_hashtable_get_values(byval table as CC_HashTable ptr, byval out_ as CC_Array ptr ptr) as cc_stat
declare function cc_hashtable_hash_string(byval key as const any ptr, byval len as long, byval seed as ulong) as uinteger
declare function cc_hashtable_hash(byval key as const any ptr, byval len as long, byval seed as ulong) as uinteger
declare function cc_hashtable_hash_ptr(byval key as const any ptr, byval len as long, byval seed as ulong) as uinteger
declare sub cc_hashtable_foreach_key(byval table as CC_HashTable ptr, byval op as sub(byval as const any ptr))
declare sub cc_hashtable_foreach_value(byval table as CC_HashTable ptr, byval op as sub(byval as any ptr))
declare sub cc_hashtable_iter_init(byval iter as CC_HashTableIter ptr, byval table as CC_HashTable ptr)
declare function cc_hashtable_iter_next(byval iter as CC_HashTableIter ptr, byval out_ as TableEntry ptr ptr) as cc_stat
declare function cc_hashtable_iter_remove(byval iter as CC_HashTableIter ptr, byval out_ as any ptr ptr) as cc_stat
#macro CC_HASHTABLE_FOREACH(hashtable, key_53d46d2a04458e7b, value_53d46d2a04458e7b, body)
   scope
      dim cc_hashtable_iter_53d46d2a04458e7b as CC_HashTableIter
      cc_hashtable_iter_init(@cc_hashtable_iter_53d46d2a04458e7b, hashtable)
      dim entry_53d46d2a04458e7b as TableEntry ptr
      while cc_hashtable_iter_next(@cc_hashtable_iter_53d46d2a04458e7b, @entry_53d46d2a04458e7b) <> CC_ITER_END
         key_53d46d2a04458e7b = entry_53d46d2a04458e7b->key
         value_53d46d2a04458e7b = entry_53d46d2a04458e7b->value
         body
      wend
   end scope
#endmacro
declare function GENERAL_HASH alias "cc_hashtable_hash"(byval key as const any ptr, byval len as long, byval seed as ulong) as uinteger
declare function STRING_HASH alias "cc_hashtable_hash_string"(byval key as const any ptr, byval len as long, byval seed as ulong) as uinteger
declare function POINTER_HASH alias "cc_hashtable_hash_ptr"(byval key as const any ptr, byval len as long, byval seed as ulong) as uinteger

end extern
#endif