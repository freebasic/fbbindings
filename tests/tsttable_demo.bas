#include once "collections-c/collectc.bi"
#include once "crt/stdio.bi"
    ' create TSTTable
    Dim tstTable As CC_TSTTable Ptr
    
    If (cc_tsttable_new(@tstTable) <> CC_OK) Then 
       Print "failed to create tstTable "
       Sleep:End 
    End If

    '  add
    Dim key1 As ZString Ptr = @"hello"
    Dim value1 As  ZString Ptr = @"world"
    If (cc_tsttable_add(tstTable, key1, value1) <> CC_OK) Then 
        Print "Add key pair error",*key1,*value1
    End If

    Dim key2 As  ZString Ptr =  @"foo"
    Dim value2 As  ZString Ptr = @"bar"
    If (cc_tsttable_add(tstTable, key2, value2) <> CC_OK) Then 
        Print "Add key pair error",*key2,*value2
    End If

    ' search value
    Dim searchKey As  ZString Ptr = @"hello"
    Dim foundValue As ZString Ptr 
   Dim ret As cc_stat= cc_tsttable_get(tstTable, searchKey,@foundValue)
    If (ret=cc_ok) Then 
        printf(!"Found value for key '%s': %s\n", searchKey, foundValue)
      Else 
        printf(!"Key not found.\n")
    End If

    '  delete
    If (cc_tsttable_remove(tstTable, key1,@value1) <> CC_OK) Then  'remove Add key pair
         printf("Key1 remove failed.\n")
    End If

    '   clear TSTTable 
    cc_tsttable_destroy(tstTable)

   Sleep