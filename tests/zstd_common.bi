#pragma once
#ifndef COMMON_H
#define COMMON_H
'it's only an helper file with functions easy to use in zstd test
#include once "crt/stdlib.bi"
#include once "crt/stdio.bi"
#include once "crt/string.bi"
#include once "crt/errno.bi"
#include once "crt/sys/stat.bi"
#include once "zstd/zstd.bi"

extern "C"

type COMMON_ErrorCode as long
enum
   ERROR_fsize = 1
   ERROR_fopen = 2
   ERROR_fclose = 3
   ERROR_fread = 4
   ERROR_fwrite = 5
   ERROR_loadFile = 6
   ERROR_saveFile = 7
   ERROR_malloc = 8
   ERROR_largeFile = 9
end enum

#macro CHECK(cond, __VA_ARGS__...)
   if (cond) = 0 then
      fprintf(stderr, "%s:%d CHECK(%s) failed: ", __FILE__, __LINE__, #cond)
      fprintf(stderr, "" __VA_ARGS__)
      fprintf(stderr, !"\n")
      exit(1)
   end if
#endmacro
#macro CHECK_ZSTD(fn)
   scope
      dim err as const uinteger = (fn)
      CHECK(-(ZSTD_isError(err) = 0), "%s", ZSTD_getErrorName(err))
   End Scope
   #endmacro

Private Function fsize_orDie(ByVal filename As Const ZString Ptr) As UInteger 
   dim st as stat
   if stat(filename, @st) <> 0 then
      perror(filename)
      Print "errcode:" & ERROR_fsize
      Exit Function
   End If
   dim fileSize as const off_t= st.st_size
   dim size as const uinteger = cuint(fileSize)
   If ((fileSize < 0) Or (fileSize <> CInt(size)))  Then
        fprintf(stderr, "%s : filesize too large \n", filename)
        Print "errcode:" & ERROR_largeFile
        Exit Function
    end if
   return size
end function

Private Function fopen_orDie(ByVal filename As Const ZString Ptr, ByVal instruction As Const ZString Ptr) As FILE Ptr  
   Dim inFile As  FILE Const Ptr= fopen(filename, instruction)
   If inFile Then
      Return inFile
   End If
   perror(filename)
   Print "errcode:" & ERROR_fopen
   Exit Function
End Function

private sub fclose_orDie(byval file as FILE ptr) 
   if fclose(file) = 0 then
      return
   end if
   perror("fclose")
   Print "errcode:" & ERROR_fclose
end sub

Private Function fread_orDie(ByVal buffer As Any Ptr, ByVal sizeToRead As UInteger, ByVal file As FILE Ptr) As UInteger  
   dim readSize as const uinteger = fread(buffer, 1, sizeToRead, file)
   if readSize = sizeToRead then
      return readSize
   end if
   if feof(file) then
      Return readSize
   end if
   perror("fread")
   Print "errcode:" & ERROR_fread
end function

Private Function fwrite_orDie(ByVal buffer As Const Any Ptr, ByVal sizeToWrite As UInteger, ByVal file As FILE Ptr) As UInteger 
   Dim writtenSize As Const UInteger = fwrite(buffer, 1, sizeToWrite, file)
   if writtenSize = sizeToWrite then
      return sizeToWrite
   End If
   perror("fwrite")
   Print "errcode:" &ERROR_fwrite
End Function

private function malloc_orDie(byval size as uinteger) as any ptr
   dim buff as any const ptr = malloc(size)
   if buff then
      Return buff
   end if
   perror("malloc")
   Print "errcode:" &ERROR_malloc
end function

Private Function loadFile_orDie(ByVal fileName As Const ZString Ptr, ByVal buffer As Any Ptr, ByVal bufferSize As UInteger) As UInteger
   dim fileSize as uinteger = fsize_orDie(fileName)
   scope
      if (fileSize <= bufferSize) = 0 then
         fprintf(stderr, "%s:%d CHECK(%s) failed: ", __FILE__, __LINE__, "fileSize <= bufferSize")
         fprintf(stderr, "" "File too large!")
         fprintf(stderr, !"\n")
         Print 1
         Exit Function
      end if
   end scope
   dim  inFile  as  FILE const ptr= fopen_orDie(fileName, "rb")
   Dim readSize As  UInteger = fread(buffer, 1, fileSize, inFile)
   If readSize <> CUInt(fileSize) Then
      fprintf(stderr, !"fread: %s : %s \n", fileName, strerror(errno))
      Print "errcode:" & ERROR_fread
      Exit Function
   end if
   fclose(inFile)
   return fileSize
end function

Private Function mallocAndLoadFile_orDie(ByVal fileName As Const ZString Ptr, ByVal bufferSize As UInteger Ptr) As Any Ptr
   dim fileSize as const uinteger = fsize_orDie(fileName)
   (*bufferSize) = fileSize
   dim buffer as any const ptr = malloc_orDie(*bufferSize)
   loadFile_orDie(fileName, buffer, *bufferSize)
   return buffer
end function

Private Sub saveFile_orDie(ByVal fileName As Const ZString Ptr, ByVal buff As Const Any Ptr, ByVal buffSize As UInteger) 
   Dim oFile As  FILE Const Ptr= fopen_orDie(fileName, "wb")
   Dim wSize As Const UInteger = fwrite(buff, 1, buffSize, oFile)
   If wSize <> CUInt(buffSize) Then
      fprintf(stderr, !"fwrite: %s : %s \n", fileName, strerror(errno))
      Print "errcode:" & ERROR_fwrite
      Exit sub
   end if
   If fclose(oFile) Then
      perror(fileName)
      Print "errcode:" & ERROR_fclose
   End If
end sub

end extern
#endif