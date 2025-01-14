#include once "xlsxio/xlsxio_read.bi"
#include once "crt/stdio.bi"
#ifdef __FB_WIN32__
'switch Windows console to UTF-8
 #include Once "windows.bi"
  SetConsoleOutputCP(65001)
#endif

'open .xlsx file for reading
Dim xlsxioread As xlsxioreader
Dim filename As ZString Ptr = StrPtr("1.xlsx")
xlsxioread = xlsxioread_open(filename)
If xlsxioread= NULL Then 
   fprintf(stderr, "Error opening .xlsx file\n")
   Sleep: End
End If
' read values from first sheet
Dim value As ZString Ptr
Dim sheet As xlsxioreadersheet
Dim xrow As Long
Dim sheetname As  ZString Ptr = StrPtr("Sheet1")
Print "Contents of first sheet:"
sheet = xlsxioread_sheet_open(xlsxioread, sheetname,XLSXIOREAD_SKIP_EMPTY_ROWS) 
  'read all rows
  If sheet <> NULL Then
  xrow = xlsxioread_sheet_next_row(sheet)
  While xrow>0
   value = xlsxioread_sheet_next_cell(sheet)
    While  value <> NULL
      printf("%s\t", value)
      xlsxioread_free(value)
      value = xlsxioread_sheet_next_cell(sheet)
   Wend
   Print ""
    xrow = xlsxioread_sheet_next_row(sheet)
 Wend
 xlsxioread_sheet_close(sheet)
End If

' clean up
xlsxioread_close(xlsxioread)
Sleep

