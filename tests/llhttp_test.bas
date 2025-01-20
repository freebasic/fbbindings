#include once "crt/stdio.bi"
#include once "llhttp.bi"
#include once "crt/string.bi"

Private Function handle_on_message_complete cdecl (ByVal parser As llhttp_t Ptr) As Long
   fprintf(stdout, !"Message completed!\n")
  Return 0
End Function

  Dim As  llhttp_t parser
  Dim As  llhttp_settings_t  settings
   llhttp_settings_init(@settings)
   settings.on_message_complete = CPtr(Any Ptr,@handle_on_message_complete)
   llhttp_init(@parser, HTTP_BOTH, @settings)
   Dim request As  String= !"GET / HTTP/1.1\r\n\r\n"
   Dim request_len As UInteger = strlen(request)
   
   Dim err_ As  llhttp_errno= llhttp_execute(@parser, request, request_len)

   If err_ = HPE_OK Then
      fprintf(stdout, !"Successfully parsed!\n")
   else
     fprintf(stderr, !"Parse error: %s %s\n", llhttp_errno_name(err_), parser.reason)
   end if
sleep