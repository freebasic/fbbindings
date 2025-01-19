#include once "crt/stdio.bi"
#include once "mujs/mujs.bi"
'test for mujs library--MuJS is a lightweight Javascript interpreter designed for embedding in other software to extend them with scripting capabilities.

Private Sub hello(ByVal J As js_State Ptr)
   Dim name_ As Const ZString Ptr = js_tostring(J, 1)
   printf(!"Hello, %s!\n", name_)
   js_pushundefined(J)
End Sub

   Dim As js_State Ptr  J = js_newstate(NULL, NULL, JS_STRICT)
   js_newcfunction(J, Cast(Any Ptr, @hello), "hello", 1)
   js_setglobal(J, "hello")
   js_dostring(J, "hello('world');")
   js_freestate(J)
  Sleep
