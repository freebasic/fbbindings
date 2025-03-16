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
#ifndef _COLLECTIONS_C_ARRAY_SIZED_H_
#define _COLLECTIONS_C_ARRAY_SIZED_H_

#include once "cc_common.bi"

extern "C"

#define _COLLECTIONS_C_ARRAY_SIZED_H_
type CC_ArraySized as cc_array_sized_s

type cc_array_sized_conf_s
	capacity as uinteger
	exp_factor as single
	mem_alloc as function(byval size as uinteger) as any ptr
	mem_calloc as function(byval blocks as uinteger, byval size as uinteger) as any ptr
	mem_free as sub(byval block as any ptr)
end type

type CC_ArraySizedConf as cc_array_sized_conf_s

type cc_array_sized_iter_s
	ar as CC_ArraySized ptr
	index as uinteger
	last_removed as bool
end type

type CC_ArraySizedIter as cc_array_sized_iter_s

type array_sized_zip_iter_s
	ar1 as CC_ArraySized ptr
	ar2 as CC_ArraySized ptr
	index as uinteger
	last_removed as bool
end type

type CC_ArraySizedZipIter as array_sized_zip_iter_s
declare function cc_array_sized_new(byval element_size as uinteger, byval out_ as CC_ArraySized ptr ptr) as cc_stat
declare function cc_array_sized_new_reserved(byval element_size as uinteger, byval n_reserved as uinteger, byval out_ as CC_ArraySized ptr ptr) as cc_stat
declare function cc_array_sized_new_conf(byval element_size as uinteger, byval conf as const CC_ArraySizedConf const ptr, byval out_ as CC_ArraySized ptr ptr) as cc_stat
declare sub cc_array_sized_conf_init(byval conf as CC_ArraySizedConf ptr)
declare function cc_array_sized_struct_size() as uinteger
declare sub cc_array_sized_destroy(byval ar as CC_ArraySized ptr)
declare function cc_array_sized_add(byval ar as CC_ArraySized ptr, byval element as ubyte ptr) as cc_stat
declare function cc_array_sized_add_at(byval ar as CC_ArraySized ptr, byval element as ubyte ptr, byval index as uinteger) as cc_stat
declare function cc_array_sized_replace_at(byval ar as CC_ArraySized ptr, byval element as ubyte ptr, byval index as uinteger, byval out_ as ubyte ptr) as cc_stat
declare function cc_array_sized_swap_at(byval ar as CC_ArraySized ptr, byval index1 as uinteger, byval index2 as uinteger) as cc_stat
declare function cc_array_sized_remove(byval ar as CC_ArraySized ptr, byval element as ubyte ptr) as cc_stat
declare function cc_array_sized_remove_at(byval ar as CC_ArraySized ptr, byval index as uinteger, byval out_ as ubyte ptr) as cc_stat
declare function cc_array_sized_remove_last(byval ar as CC_ArraySized ptr, byval out_ as ubyte ptr) as cc_stat
declare sub cc_array_sized_remove_all(byval ar as CC_ArraySized ptr)
declare function cc_array_sized_peek(byval ar as CC_ArraySized ptr, byval index as uinteger, byval out_ as ubyte ptr ptr) as cc_stat
declare function cc_array_sized_get_at(byval ar as CC_ArraySized ptr, byval index as uinteger, byval out_ as ubyte ptr) as cc_stat
declare function cc_array_sized_get_last(byval ar as CC_ArraySized ptr, byval out_ as ubyte ptr) as cc_stat
declare function cc_array_sized_subarray(byval ar as CC_ArraySized ptr, byval from as uinteger, byval to as uinteger, byval out_ as CC_ArraySized ptr ptr) as cc_stat
declare function cc_array_sized_copy(byval ar as CC_ArraySized ptr, byval out_ as CC_ArraySized ptr ptr) as cc_stat
declare sub cc_array_sized_reverse(byval ar as CC_ArraySized ptr, byval tmp as ubyte ptr)
declare function cc_array_sized_trim_capacity(byval ar as CC_ArraySized ptr) as cc_stat
declare function cc_array_sized_contains(byval ar as CC_ArraySized ptr, byval element as ubyte ptr) as uinteger
declare function cc_array_sized_size(byval ar as CC_ArraySized ptr) as uinteger
declare function cc_array_sized_capacity(byval ar as CC_ArraySized ptr) as uinteger
declare function cc_array_sized_index_of(byval ar as CC_ArraySized ptr, byval element as ubyte ptr, byval index as uinteger ptr) as cc_stat
declare sub cc_array_sized_sort(byval ar as CC_ArraySized ptr, byval cmp as function(byval as const any ptr, byval as const any ptr) as long)
declare sub cc_array_sized_map(byval ar as CC_ArraySized ptr, byval fn as sub(byval as ubyte ptr))
declare sub cc_array_sized_reduce(byval ar as CC_ArraySized ptr, byval fn as sub(byval as ubyte ptr, byval as ubyte ptr, byval as ubyte ptr), byval result as ubyte ptr)
declare function cc_array_sized_filter_mut(byval ar as CC_ArraySized ptr, byval predicate as function(byval as const ubyte ptr) as bool) as cc_stat
declare function cc_array_sized_filter(byval ar as CC_ArraySized ptr, byval predicate as function(byval as const ubyte ptr) as bool, byval out_ as CC_ArraySized ptr ptr) as cc_stat
declare sub cc_array_sized_iter_init(byval iter as CC_ArraySizedIter ptr, byval ar as CC_ArraySized ptr)
declare function cc_array_sized_iter_next(byval iter as CC_ArraySizedIter ptr, byval out_ as ubyte ptr ptr) as cc_stat
declare function cc_array_sized_iter_remove(byval iter as CC_ArraySizedIter ptr, byval out_ as ubyte ptr) as cc_stat
declare function cc_array_sized_iter_add(byval iter as CC_ArraySizedIter ptr, byval element as ubyte ptr) as cc_stat
declare function cc_array_sized_iter_replace(byval iter as CC_ArraySizedIter ptr, byval element as ubyte ptr, byval out_ as ubyte ptr) as cc_stat
declare function cc_array_sized_iter_index(byval iter as CC_ArraySizedIter ptr) as uinteger
declare sub cc_array_sized_zip_iter_init(byval iter as CC_ArraySizedZipIter ptr, byval a1 as CC_ArraySized ptr, byval a2 as CC_ArraySized ptr)
declare function cc_array_sized_zip_iter_next(byval iter as CC_ArraySizedZipIter ptr, byval out1 as ubyte ptr ptr, byval out2 as ubyte ptr ptr) as cc_stat
declare function cc_array_sized_zip_iter_add(byval iter as CC_ArraySizedZipIter ptr, byval e1 as ubyte ptr, byval e2 as ubyte ptr) as cc_stat
declare function cc_array_sized_zip_iter_remove(byval iter as CC_ArraySizedZipIter ptr, byval out1 as ubyte ptr, byval out2 as ubyte ptr) as cc_stat
declare function cc_array_sized_zip_iter_replace(byval iter as CC_ArraySizedZipIter ptr, byval e1 as ubyte ptr, byval e2 as ubyte ptr, byval out1 as ubyte ptr, byval out2 as ubyte ptr) as cc_stat
declare function cc_array_sized_zip_iter_index(byval iter as CC_ArraySizedZipIter ptr) as uinteger
declare function cc_array_sized_get_buffer(byval ar as CC_ArraySized ptr) as const ubyte const ptr ptr
#macro CC_ARRAY_SIZED_FOREACH(val_, array_, body)
	scope
		dim cc_array_sized_iter_53d46d2a04458e7b as CC_ArraySizedIter
		cc_array_sized_iter_init(@cc_array_sized_iter_53d46d2a04458e7b, array_)
		dim val_ as ubyte ptr
		while (cc_array_sized_iter_next(@cc_array_sized_iter_53d46d2a04458e7b, @val_) <> CC_ITER_END) 
            body
        wend
	end scope
#endmacro
#macro CC_ARRAY_SIZED_FOREACH_ZIP(val1, val2, array1, array2, body)
	scope
		dim cc_array_sized_zip_iter_ea08d3e52f25883b3 as CC_ArraySizedZipIter
		cc_array_sized_zip_iter_init(@cc_array_sized_zip_iter_ea08d3e52f25883b3, array1, array2)
		dim val1 as ubyte ptr
		dim val2 as ubyte ptr
		while (cc_array_sized_zip_iter_next(@cc_array_sized_zip_iter_ea08d3e52f25883b3, @val1, @val2)<> CC_ITER_END) 
            body
        wend 
	end scope
#endmacro

end extern
#endif