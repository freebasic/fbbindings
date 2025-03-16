
#include once "lodepng.bi"
#include once "crt/stdio.bi"
#include once "crt/stdlib.bi"

private sub decodeOneStep(byval filename as const zstring ptr)
   Dim error_ As ULong
   dim image as ubyte ptr = 0
   Dim Width_ As ULong
   Dim height As ULong
   error_ = lodepng_decode32_file(@image, @Width_, @height, filename)
   if error_ then
      printf(!"error %u: %s\n", error_, lodepng_error_text(error_))
   end if
   free(image)
end sub

private sub decodeTwoSteps(byval filename as const zstring ptr)
   dim error_ as ulong
   dim image as ubyte ptr = 0
   Dim width_ As ULong
   dim height as ulong
   Dim png As UByte Ptr = 0
   dim pngsize as uinteger
   error_ = lodepng_load_file(@png, @pngsize, filename)
   if error_ = 0 then
      error_ = lodepng_decode32(@image, @width_, @height, png, pngsize)
   end if
   if error_ then
      printf(!"error %u: %s\n", error_, lodepng_error_text(error_))
   end if
   free(png)
   free(image)
end sub

Private Sub decodeWithState(ByVal filename As Const ZString Ptr)
   dim error_ as ulong
   Dim image As UByte Ptr = 0
   Dim width_ As ULong
   dim height as ulong
   Dim png As UByte Ptr = 0
   dim pngsize as uinteger
   Dim As  LodePNGState state
   lodepng_state_init(@state)
   error_ = lodepng_load_file(@png, @pngsize, filename)
   if error_ = 0 then
      error_ = lodepng_decode(@image, @width_, @height, @state, png, pngsize)
   end if
   if error_ then
      printf(!"error %u: %s\n", error_, lodepng_error_text(error_))
   end if
   free(png)
   lodepng_state_cleanup(@state)
   free(image)
End Sub


Dim argc As Long = __FB_ARGC__
 If argc <> 2 Then
      printf(!"wrong arguments\n")
      printf(!"usage:\n")
      End
   End If
 Dim pngFilename As String = Command(1)
  decodeWithState(pngFilename)
print "ok"