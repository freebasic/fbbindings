#include once "crt/stdio.bi"
#include once "crt/stdlib.bi"
#include once "zstd/zstd.bi"
#include once "zstd_common.bi"


private sub decompress(byval fname as const zstring ptr)
   dim cSize as uinteger
   dim cBuff as any const ptr = mallocAndLoadFile_orDie(fname, @cSize)
   Dim rSize As Const ULongInt = ZSTD_getFrameContentSize(cBuff, cSize)
   scope
      if (rSize <> ZSTD_CONTENTSIZE_ERROR) = 0 then
         fprintf(stderr, "%s:%d CHECK(%s) failed: ", __FILE__, __LINE__, "rSize != ZSTD_CONTENTSIZE_ERROR")
         fprintf(stderr, "" "%s: not compressed by zstd!", fname)
         fprintf(stderr, !"\n")
         Exit Sub
      end if
   end scope
   Scope
      if (rSize <> ZSTD_CONTENTSIZE_UNKNOWN) = 0 then
         fprintf(stderr, "%s:%d CHECK(%s) failed: ", __FILE__, __LINE__, "rSize != ZSTD_CONTENTSIZE_UNKNOWN")
         fprintf(stderr, "" "%s: original size unknown!", fname)
         fprintf(stderr, !"\n")
         Exit Sub
      end if
   end scope
   dim rBuff as any const ptr = malloc_orDie(cuint(rSize))
   dim dSize as const uinteger = ZSTD_decompress(rBuff, rSize, cBuff, cSize)
   Scope
      Dim err_ As Const UInteger = dSize
      scope
         If (ZSTD_isError(err_) = 0) = 0 Then
            fprintf(stderr, "%s:%d CHECK(%s) failed: ", __FILE__, __LINE__, "!ZSTD_isError(err_)")
            fprintf(stderr, "" "%s", ZSTD_getErrorName(err_))
            fprintf(stderr, !"\n")
            Exit Sub
         end if
      End Scope
   end scope
   scope
      if (dSize = rSize) = 0 then
         fprintf(stderr, "%s:%d CHECK(%s) failed: ", __FILE__, __LINE__, "dSize == rSize")
         fprintf(stderr, "" "Impossible because zstd will check this condition!")
         fprintf(stderr, !"\n")
         Exit Sub
      end if
   end scope
   printf(!"%25s : %6u -> %7u \n", fname, culng(cSize), culng(rSize))
   free(rBuff)
   free(cBuff)
end sub

   Dim exeName As String = Command(0)
   If __FB_ARGC__ <> 2 Then
      printf(!"wrong arguments\n")
      printf(!"usage:\n")
      Print exeName
      End
   end if
   decompress(Command(1))
   printf(!"%s correctly decoded (in memory). \n", Command(1))