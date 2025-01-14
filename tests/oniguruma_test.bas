#include once "crt/stdio.bi"
#include once "crt/string.bi"
#include once "oniguruma.bi"
   Dim r As Long
   Dim As UByte Ptr start ,range, end_ 
   Dim As regex_t Ptr reg
   Dim As  OnigErrorInfo einfo
   Dim As OnigRegion Ptr region
   Dim As  OnigEncoding use_encs(0)
   Static pattern As UChar Ptr = CPtr(UChar Ptr, @"a(.*)b|[e-f]+")
   Static str_ As UChar Ptr = CPtr(UChar Ptr, @"zzzzaffffffffb")
   use_encs(0)=ONIG_ENCODING_EUC_CN' ONIG_ENCODING_ASCII
   onig_initialize(@use_encs(0), SizeOf(use_encs) / SizeOf(use_encs(0)))
   r = onig_new(@reg, pattern, pattern + strlen(CPtr(ZString Ptr, pattern)), ONIG_OPTION_WORD_IS_ASCII, ONIG_ENCODING_EUC_CN, ONIG_SYNTAX_default , @einfo)
   If r <> ONIG_NORMAL Then
      Dim s As ZString * ONIG_MAX_ERROR_MESSAGE_LEN
      onig_error_code_to_str(CPtr(UChar Ptr, @s), r, @einfo)
      fprintf(stderr, !"ERROR: %s\n", s)
      Sleep
        End
   End If
   region = onig_region_new()
   end_ = str_ + strlen(CPtr(ZString Ptr, str_))
   start = str_
   range = end_
   r = onig_search(reg, str_, end_, start, range, region, ONIG_OPTION_NONE)
   if r >= 0 then
      Dim i As Long
      fprintf(stderr, !"match at %d\n", r)
        For i=0 To region->num_regs-1
           fprintf(stderr, !"%d: (%d-%d)\n", i, region->beg[i], region->end_[i])
           Print "matched value:", Mid(*Cast(ZString Ptr,str_), region->beg[i]+1,region->end_[i]-region->beg[i])
        Next
   ElseIf r = ONIG_MISMATCH Then
      fprintf(stderr, !"search fail\n")
   Else
      Dim s As ZString * ONIG_MAX_ERROR_MESSAGE_LEN
      onig_error_code_to_str(cptr(UChar ptr, @s), r)
      fprintf(stderr, !"ERROR: %s\n", s)
      onig_region_free(region, 1)
      onig_free(reg)
      onig_end()
      Sleep
        End
   end if
   onig_region_free(region, 1)
   onig_free(reg)
   onig_end()
 Sleep
