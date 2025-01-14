
#include once "collections-c/cc_array.bi"
#include once "crt/stdio.bi"
#inclib "collectc"
Dim ar As CC_Array Ptr
    cc_array_new(@ar)
    cc_array_add(ar, @!"Hello World!\n")
    cc_array_add(ar, @"ÄãºÃ") 
    cc_array_add(ar, @"Ôªµ©")
    Print "count of elements:" & cc_array_size(ar)
    Dim str_ As Any Ptr
    cc_array_get_at(ar, 1, @str_)
    printf("element value with index 1:%s", str_)
    Print
    'É¾³ýÔªËØ
    Dim out_ As Any Ptr
    cc_array_remove_at(ar, 1, @out_)
    printf("removed value with index 1:%s", out_)
     Print
    Print "now array size:" & cc_array_size(ar)
    Dim str1_ As Any Ptr
    cc_array_get_at(ar, 1, @str1_)
    printf("value with index 1:%s", str1_)
    cc_array_destroy(ar)    
sleep
