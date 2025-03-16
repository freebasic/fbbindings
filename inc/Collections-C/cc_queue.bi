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
#ifndef COLLECTIONS_C_QUEUE_H

#define COLLECTIONS_C_QUEUE_H
#include once "cc_common.bi"
#include once "cc_deque.bi"

extern "C"

Type CC_Queue As cc_queue_s
type CC_QueueConf as CC_DequeConf

type cc_queue_iter_s
   i as CC_DequeIter
end type

type CC_QueueIter as cc_queue_iter_s

type queue_zip_iter_s
   i as CC_DequeZipIter
end type

type QueueZipIter as queue_zip_iter_s
declare sub cc_queue_conf_init(byval conf as CC_QueueConf ptr)
declare function cc_queue_new(byval q as CC_Queue ptr ptr) as cc_stat
declare function cc_queue_new_conf(byval conf as const CC_QueueConf const ptr, byval q as CC_Queue ptr ptr) as cc_stat
declare sub cc_queue_destroy(byval queue as CC_Queue ptr)
declare sub cc_queue_destroy_cb(byval queue as CC_Queue ptr, byval cb as sub(byval as any ptr))
declare function cc_queue_struct_size() as uinteger
declare function cc_queue_peek(byval queue as const CC_Queue const ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_queue_poll(byval queue as CC_Queue ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_queue_enqueue(byval queue as CC_Queue ptr, byval element as any ptr) as cc_stat
declare function cc_queue_size(byval queue as const CC_Queue const ptr) as uinteger
declare sub cc_queue_foreach(byval queue as CC_Queue ptr, byval op as sub(byval as any ptr))
declare sub cc_queue_iter_init(byval iter as CC_QueueIter ptr, byval queue as CC_Queue ptr)
declare function cc_queue_iter_next(byval iter as CC_QueueIter ptr, byval out_ as any ptr ptr) as cc_stat
declare function cc_queue_iter_replace(byval iter as CC_QueueIter ptr, byval replacement as any ptr, byval out_ as any ptr ptr) as cc_stat
declare sub cc_queue_zip_iter_init(byval iter as QueueZipIter ptr, byval q1 as CC_Queue ptr, byval q2 as CC_Queue ptr)
declare function cc_queue_zip_iter_next(byval iter as QueueZipIter ptr, byval out1 as any ptr ptr, byval out2 as any ptr ptr) as cc_stat
declare function cc_queue_zip_iter_replace(byval iter as QueueZipIter ptr, byval e1 as any ptr, byval e2 as any ptr, byval out1 as any ptr ptr, byval out2 as any ptr ptr) as cc_stat

end extern
#endif