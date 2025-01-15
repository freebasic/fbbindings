#include once "xxhash.bi"
#include once "crt/string.bi"
   Dim buffer As  ZString Ptr = @"Hello,World!"
   Dim size As UInteger = strlen(buffer)
   Dim seed As ULongInt = 0
   if size = 0 then
      Print  "Empty buffer"
      Sleep:End
   end if
  Dim As XXH64_hash_t hash = XXH64(buffer, size, seed)
   Print "Hash value: ", hash
   Sleep