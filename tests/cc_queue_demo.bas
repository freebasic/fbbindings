#include once "collections-c/collectc.bi"

Dim As CC_Queue Ptr q1
cc_queue_new(@q1)
Dim As Long a, b, c
a = 1
b = 2
c=3
cc_queue_enqueue(q1, @a)
cc_queue_enqueue(q1, @b)
cc_queue_enqueue(q1, @c)
Dim As  CC_QueueIter iter
cc_queue_iter_init(@iter, q1)
Dim As Long Ptr e
While (cc_queue_iter_next(@iter,@e) <> CC_ITER_END)
   Print *e
Wend
cc_queue_destroy(q1)
sleep