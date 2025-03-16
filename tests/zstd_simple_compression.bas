#include once "crt/stdio.bi"
#include once "crt/stdlib.bi"
#include once "crt/string.bi"
#include once "zstd/zstd.bi"
#include once "crt/errno.bi"
#include once "crt/sys/stat.bi"
#include once "zstd_common.bi"

private sub compress_orDie(byval fname as const zstring ptr, byval oname as const zstring ptr)
   dim fSize as uinteger
   Dim fBuff As Any Const Ptr = mallocAndLoadFile_orDie(fname, @fSize)
   dim cBuffSize as const uinteger = ZSTD_compressBound(fSize)
   Dim cBuff As Any Const Ptr = malloc_orDie(cBuffSize)
   dim cSize as const uinteger = ZSTD_compress(cBuff, cBuffSize, fBuff, fSize, 1)
   Scope
      Dim err_ As Const UInteger = cSize
      scope
         If (ZSTD_isError(err_) = 0) = 0 Then
            fprintf(stderr, "%s:%d CHECK(%s) failed: ", __FILE__, __LINE__, "!ZSTD_isError(err)")
            fprintf(stderr, "" "%s", ZSTD_getErrorName(err_))
            fprintf(stderr, !"\n")
            Print 1
            Exit Sub
         end if
      end scope
   end scope
   saveFile_orDie(oname, cBuff, cSize)
   printf(!"%25s : %6u -> %7u - %s \n", fname, culng(fSize), culng(cSize), oname)
   free(fBuff)
   free(cBuff)
end sub

private function createOutFilename_orDie(byval filename as const zstring ptr) as zstring ptr
   dim inL as const uinteger = strlen(filename)
   dim outL as const uinteger = inL + 5
   dim outSpace as any const ptr = malloc_orDie(outL)
   memset(outSpace, 0, outL)
   strcat(outSpace, filename)
   strcat(outSpace, ".zst")
   return cptr(zstring ptr, outSpace)
End Function

Dim exeName As  String = Command(0)
Dim argc As Long =__FB_ARGC__
   If argc <> 2 Then
      printf(!"wrong arguments\n")
      printf(!"usage:\n")
      Print exeName
      End
   End If
   Dim inFilename As String = Command(1)
   Dim outFilename As ZString Const Ptr = createOutFilename_orDie(inFilename)
   compress_orDie(inFilename, outFilename)
   free(outFilename)
   Print "ok"
 
