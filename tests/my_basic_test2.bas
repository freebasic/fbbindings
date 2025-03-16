#include once "my_basic.bi" 
'execute my_basic script in freebasic
Dim bas  As mb_interpreter_t Ptr = NULL
   Dim bVal1 As mb_value_t
Dim As WString *255 StrTemp ="RetStr1 = """""& Chr(13, 10) _
   &"def myAdd(a, b)"& Chr(13,10) _
   &" Return a+b" & Chr(13,10) _
   & "enddef "& Chr(13, 10) _
   & "RetStr1 = Str(myAdd(2222, 3333)) "
   mb_init()
   mb_open(@bas)
   mb_load_string(bas ,StrTemp ,True)
   mb_run(bas ,True)
   mb_debug_get(bas ,UCase("RetStr1") ,@bVal1)
   mb_close(@bas)
   mb_dispose()
   Print "result of myAdd(2222,3333):",*bVal1.value.String
   Sleep