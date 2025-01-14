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

#ifndef COLLECTIONS_C_H

#define COLLECTIONS_C_H
#include once "cc_array.bi"
#include once "cc_common.bi"
#include once "cc_deque.bi"
#include once "cc_hashset.bi"
#include once "cc_hashtable.bi"
#include once "cc_list.bi"
#include once "cc_pqueue.bi"
#include once "cc_queue.bi"
#include once "cc_ring_buffer.bi"
#include once "cc_slist.bi"
#include once "cc_stack.bi"
#include once "cc_treeset.bi"
#include once "cc_treetable.bi"
#include once "cc_tsttable.bi"
#inclib "collectc"
#endif