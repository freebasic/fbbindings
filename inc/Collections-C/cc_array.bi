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
#ifndef COLLECTIONS_C_ARRAY_H

#define COLLECTIONS_C_ARRAY_H
#include once "cc_common.bi"

extern "C"

type CC_Array as cc_array_s

type cc_array_conf_s
   capacity as uinteger
   exp_factor as single
   mem_alloc as function(byval size as uinteger) as any ptr
   mem_calloc as function(byval blocks as uinteger, byval size as uinteger) as any ptr
   mem_free as sub(byval block as any ptr)
end type

type CC_ArrayConf as cc_array_conf_s

type cc_array_iter_s
   ar as CC_Array ptr
   index as uinteger
   last_removed as bool
end type

type CC_ArrayIter as cc_array_iter_s

type array_zip_iter_s
   ar1 as CC_Array ptr
   ar2 as CC_Array ptr
   index as uinteger
   last_removed as bool
end type

type CC_ArrayZipIter as array_zip_iter_s
declare function cc_array_new(byval out_ as CC_Array ptr ptr) as cc_stat
declare function cc_array_new_conf(byval conf as const CC_ArrayConf const ptr, byval out_ as CC_Array ptr ptr) as cc_stat
declare sub cc_array_conf_init(byval conf as CC_ArrayConf ptr)
declare function cc_array_struct_size() as uinteger
Declare Sub cc_array_destroy(ByVal ar As CC_Array Ptr)
declare sub cc_array_destroy_cb(byval ar as CC_Array ptr, byval cb as sub(byval as any ptr))
declare function cc_array_add(byval ar as CC_Array ptr, byval element as any ptr) as cc_stat
declare function cc_array_add_at(byval ar as CC_Array ptr, byval element as any ptr, byval index as uinteger) as cc_stat
declare function cc_array_replace_at(byval ar as CC_Array ptr, byval element as any ptr, byval index as uinteger, byval out_ as any ptr ptr) as cc_stat
declare function cc_array_swap_at(byval ar as CC_Array ptr, byval index1 as uinteger, byval index2 as uinteger) as cc_stat
declare function cc_array_remove(byval ar as CC_Array ptr, byval element as any ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_array_remove_at(byval ar as CC_Array ptr, byval index as uinteger, byval out_ as any ptr ptr) as cc_stat
Declare Function cc_array_remove_last(ByVal ar As CC_Array Ptr, ByVal out_ As Any Ptr Ptr) As cc_stat
declare sub cc_array_remove_all(byval ar as CC_Array ptr)
declare sub cc_array_remove_all_free(byval ar as CC_Array ptr)
declare function cc_array_get_at(byval ar as CC_Array ptr, byval index as uinteger, byval out_ as any ptr ptr) as cc_stat
declare function cc_array_get_last(byval ar as CC_Array ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_array_subarray(byval ar as CC_Array ptr, byval from as uinteger, byval to as uinteger, byval out_ as CC_Array ptr ptr) as cc_stat
declare function cc_array_copy_shallow(byval ar as CC_Array ptr, byval out_ as CC_Array ptr ptr) as cc_stat
declare function cc_array_copy_deep(byval ar as CC_Array ptr, byval cp as function(byval as any ptr) as any ptr, byval out_ as CC_Array ptr ptr) as cc_stat
declare sub cc_array_reverse(byval ar as CC_Array ptr)
declare function cc_array_trim_capacity(byval ar as CC_Array ptr) as cc_stat
declare function cc_array_contains(byval ar as CC_Array ptr, byval element as any ptr) as uinteger
declare function cc_array_contains_value(byval ar as CC_Array ptr, byval element as any ptr, byval cmp as function(byval as const any ptr, byval as const any ptr) as long) as uinteger
declare function cc_array_size(byval ar as CC_Array ptr) as uinteger
declare function cc_array_capacity(byval ar as CC_Array ptr) as uinteger
declare function cc_array_index_of(byval ar as CC_Array ptr, byval element as any ptr, byval index as uinteger ptr) as cc_stat
declare sub cc_array_sort(byval ar as CC_Array ptr, byval cmp as function(byval as const any ptr, byval as const any ptr) as long)
declare sub cc_array_map(byval ar as CC_Array ptr, byval fn as sub(byval as any ptr))
declare sub cc_array_reduce(byval ar as CC_Array ptr, byval fn as sub(byval as any ptr, byval as any ptr, byval as any ptr), byval result as any ptr)
declare function cc_array_filter_mut(byval ar as CC_Array ptr, byval predicate as function(byval as const any ptr) as bool) as cc_stat
declare function cc_array_filter(byval ar as CC_Array ptr, byval predicate as function(byval as const any ptr) as bool, byval out_ as CC_Array ptr ptr) as cc_stat
declare sub cc_array_iter_init(byval iter as CC_ArrayIter ptr, byval ar as CC_Array ptr)
declare function cc_array_iter_next(byval iter as CC_ArrayIter ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_array_iter_remove(byval iter as CC_ArrayIter ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_array_iter_add(byval iter as CC_ArrayIter ptr, byval element as any ptr) as cc_stat
declare function cc_array_iter_replace(byval iter as CC_ArrayIter ptr, byval element as any ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_array_iter_index(byval iter as CC_ArrayIter ptr) as uinteger
declare sub cc_array_zip_iter_init(byval iter as CC_ArrayZipIter ptr, byval a1 as CC_Array ptr, byval a2 as CC_Array ptr)
declare function cc_array_zip_iter_next(byval iter as CC_ArrayZipIter ptr, byval out1 as any ptr ptr, byval out2 as any ptr ptr) as cc_stat
declare function cc_array_zip_iter_add(byval iter as CC_ArrayZipIter ptr, byval e1 as any ptr, byval e2 as any ptr) as cc_stat
declare function cc_array_zip_iter_remove(byval iter as CC_ArrayZipIter ptr, byval out1 as any ptr ptr, byval out2 as any ptr ptr) as cc_stat
declare function cc_array_zip_iter_replace(byval iter as CC_ArrayZipIter ptr, byval e1 as any ptr, byval e2 as any ptr, byval out1 as any ptr ptr, byval out2 as any ptr ptr) as cc_stat
declare function cc_array_zip_iter_index(byval iter as CC_ArrayZipIter ptr) as uinteger
declare function cc_array_get_buffer(byval ar as CC_Array ptr) as const any const ptr ptr
#macro CC_ARRAY_FOREACH(val, array, body)
   scope
      dim cc_array_iter_53d46d2a04458e7b as CC_ArrayIter
      cc_array_iter_init(@cc_array_iter_53d46d2a04458e7b, array)
      dim val as any ptr
       while (cc_array_iter_next(&cc_array_iter_53d46d2a04458e7b, &val) != CC_ITER_END) 
            body
        wend
   end scope
#endmacro
#macro CC_ARRAY_FOREACH_ZIP(val1, val2, array1, array2, body)
   scope
      dim cc_array_zip_iter_ea08d3e52f25883b3 as CC_ArrayZipIter
      cc_array_zip_iter_init(@cc_array_zip_iter_ea08d3e52f25883b3, array1, array2)
      dim val1 as any ptr
      dim val2 as any ptr
      while (cc_array_zip_iter_next(@cc_array_zip_iter_ea08d3e52f25883b3, @val1, @val2)<>CC_ITER_END) 
            body
        wend
   end scope
#endmacro

end extern
#endif
