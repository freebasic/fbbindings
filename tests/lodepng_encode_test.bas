
#include once "lodepng.bi"
#include once "crt/stdio.bi"
#include once "crt/stdlib.bi"

Private Sub encodeOneStep(ByVal filename As Const ZString Ptr, ByVal image As Const UByte Ptr, ByVal width_ As ULong, ByVal height As ULong)
   Dim error_ As ULong = lodepng_encode32_file(filename, image, width_, height)
   if error_ then
      printf(!"error %u: %s\n", error_, lodepng_error_text(error_))
   end if
End Sub

Private Sub encodeTwoSteps(ByVal filename As Const ZString Ptr, ByVal image As Const UByte Ptr, ByVal width_ As ULong, ByVal height As ULong)
   dim png as ubyte ptr
   dim pngsize as uinteger
   Dim error_ As ULong = lodepng_encode32(@png, @pngsize, image, width_, height)
   If error_ = 0 Then
      lodepng_save_file(png, pngsize, filename)
   end if
   if error_ then
      printf(!"error %u: %s\n", error_, lodepng_error_text(error_))
   end if
   free(png)
end sub

Private Sub encodeWithState(ByVal filename As Const ZString Ptr, ByVal image As Const UByte Ptr, ByVal width_ As ULong, ByVal height As ULong)
   dim error_ as ulong
   Dim png As UByte Ptr
   Dim pngsize As UInteger
  Dim As  LodePNGState state
   lodepng_state_init(@state)
   error_ = lodepng_encode(@png, @pngsize, image, width_, height, @state)
   If error_ = 0 Then
      lodepng_save_file(png, pngsize, filename)
   end if
   if error_ then
      printf(!"error %u: %s\n", error_, lodepng_error_text(error_))
   end if
   lodepng_state_cleanup(@state)
   free(png)
end sub

Dim argc As Long = __FB_ARGC__
 If argc <> 2 Then
      printf(!"wrong arguments\n")
      printf(!"usage:\n")
      End
   End If
 Dim pngFilename As String = Command(1)
   Dim width_ As ULong = 512
   dim height as ulong = 512
   Dim image As UByte Ptr = malloc((width_ * height) * 4)
   Dim x As ULong
   Dim y As ULong
   For y = 0 To height -1
   For x = 0 To width_ -1
    image[4 * width_ * y + 4 * x + 0] = 255 * not (x And y)
    image[4 * width_ * y + 4 * x + 1] = x Xor y
    image[4 * width_ * y + 4 * x + 2] = x Or  y
    image[4 * width_ * y + 4 * x + 3] = 255
   Next
   Next
 encodeOneStep(pngFilename, image, width_, height)
 free(image)
 Print "done "