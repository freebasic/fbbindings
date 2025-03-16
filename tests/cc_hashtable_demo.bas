
#include once "collections-c/collectc.bi"
#include once "crt/stdio.bi"
 Dim As CC_HashTable Ptr table
 cc_hashtable_new(@table)
 Dim arr(1, 1) As ZString*10 = {{"1", "one"}, {"hello", "world"}}
 For i  As Integer= 0 To UBound(arr)
    cc_hashtable_add(table, CPtr(Any Ptr, @arr(i,0)), CPtr(Any Ptr, @arr(i,1)))
 Next
      Print cc_hashtable_size(table) 'keys count
      Dim out_ As Any Ptr 
      Dim ret As cc_stat = cc_hashtable_get(table, @"hello", @out_)'get value  via key
      If ret=cc_ok Then printf("%s",out_)
    
   cc_hashtable_destroy(table)
sleep
