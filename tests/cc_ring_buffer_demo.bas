
#include once "collections-c/collectc.bi"
#include once "crt/stdio.bi"

   Dim ring_buf As CC_Rbuf Ptr
      cc_rbuf_new(@ring_buf)
    ring_buf->SIZE = CUInt(100)
    For i As Long = 0 To  99
        cc_rbuf_enqueue(ring_buf, CULngInt(i))
    Next
    
    Print "size of ringbuffer" & cc_rbuf_size(ring_buf)
    
    Dim buf As ULongInt
    While (cc_rbuf_dequeue(ring_buf, @buf) = CC_OK)
        buf =  cc_rbuf_size(ring_buf)
        printf(!"Read: %d\n", buf)
    Wend
    
    printf(!"\n===============\n")
    Print  "is ringbuffer empty",cc_rbuf_is_empty(ring_buf)
   cc_rbuf_destroy(ring_buf)
   Sleep
