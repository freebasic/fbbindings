
#include once "collections-c/collectc.bi"

Dim As CC_HashSet Ptr set
cc_hashset_new(@set)
dim as zstring ptr a = @"foo"
dim as zstring ptr b = @"bar"
dim as zstring ptr c = @"baz"
Dim As ZString Ptr d = @"ะกร๗"
    cc_hashset_add(set, a)
    cc_hashset_add(set, b)
    cc_hashset_add(set, c)
    cc_hashset_add(set, d)
    print "hashset size:",cc_hashset_size(set)
    Print "contains 'bar'?",cc_hashset_contains(set, @"bar")
    dim as CC_HashSetIter iter
    cc_hashset_iter_init(@iter, set)
    Dim e As Any Ptr
     While (cc_hashset_iter_next(@iter, @e) <> CC_ITER_END)
      Print *Cast(ZString Ptr,e)
     wend
     cc_hashset_destroy(set)
sleep