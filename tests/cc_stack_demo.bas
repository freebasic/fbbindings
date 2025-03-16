
#include once "collections-c/collectc.bi"

Dim As  CC_Stack Ptr s
cc_stack_new(@s)
Dim As Long a, b, c
a = 1
b = 2
c = 3
cc_stack_push(s, cast(any ptr,@a))
cc_stack_push(s, cast(any ptr,@b))
cc_stack_push(s, cast(any ptr, @c))

print "stack size:", cc_stack_size(s)
Dim As Long Ptr peek_
cc_stack_peek(s, cast(any ptr, @peek_))
print *peek_
cc_stack_destroy(s)
sleep