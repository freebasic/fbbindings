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
#ifndef COLLECTIONS_C_CC_RBUF_H

#define COLLECTIONS_C_CC_RBUF_H
#include once "crt/stdlib.bi"
#include once "crt/stdint.bi"
#include once "crt/string.bi"
#include once "cc_common.bi"
Extern "C"
#ifndef DEFAULT_CC_RBUF_CAPACITY
#define DEFAULT_CC_RBUF_CAPACITY 5
#endif
Type CC_RbufConf As ring_buffer_conf

Type ring_buffer_conf
     capacity As size_t
     mem_alloc As Function(ByVal Size_ As size_t) As Any Ptr
     mem_calloc As Function(ByVal blocks As size_t, ByVal size As size_t) As Any Ptr
      MEM_FREE As Sub(block As Any Ptr)
End Type

Type CC_Rbuf As ring_buffer

Type ring_buffer
      As size_t SIZE
      As size_t capacity
      As size_t head
      As size_t tail
      buf As uint64_t Ptr
     mem_alloc As Function(ByVal SIZE As size_t) As Any Ptr
     mem_calloc As Function(ByVal blocks As size_t, ByVal SIZE As size_t) As Any Ptr
     MEM_FREE As Sub(block As Any Ptr)
End Type

Declare Function cc_rbuf_new(ByVal rbuf As CC_Rbuf Ptr Ptr) As cc_stat
Declare Sub cc_rbuf_conf_init(ByVal rconf As CC_RbufConf Ptr)
Declare Function cc_rbuf_conf_new(ByVal rconf As CC_RbufConf Ptr, ByVal rbuf As CC_Rbuf Ptr Ptr) As cc_stat
Declare Function cc_rbuf_struct_size() As UInteger
Declare Sub cc_rbuf_enqueue(ByVal rbuf As CC_Rbuf Ptr, ByVal item As ULongInt)
Declare Function cc_rbuf_dequeue(ByVal rbuf As CC_Rbuf Ptr, ByVal out_ As ULongInt Ptr) As cc_stat
Declare Function cc_rbuf_is_empty(ByVal rbuf As CC_Rbuf Ptr) As bool
Declare Function cc_rbuf_size(ByVal rbuf As CC_Rbuf Ptr) As UInteger
Declare Sub cc_rbuf_destroy(ByVal rbuf As CC_Rbuf Ptr)
Declare Function cc_rbuf_peek(ByVal rbuf As CC_Rbuf Ptr, ByVal index As Long) As ULongInt

End Extern
#endif
