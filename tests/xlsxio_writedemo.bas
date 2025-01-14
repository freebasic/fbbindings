#include "xlsxio/xlsxio_write.bi"
#include once "crt/stdio.bi"

'open .xlsx file for writing (will overwrite if it already exists)
Var filename="2.xlsx"
Dim handle As xlsxiowriter=xlsxiowrite_open(filename, "Sheet1")
If (handle = NULL) Then 
  fprintf(stderr, "Error creating .xlsx file\n")
  End
End If

' write column names
xlsxiowrite_add_column(handle, "Col1", 16)
xlsxiowrite_add_column(handle, "Col2", 0)
xlsxiowrite_next_row(handle)

'write data
Dim i As Long
For i = 0 To  999
  xlsxiowrite_add_cell_string(handle, "Test")
  xlsxiowrite_add_cell_int(handle, i)
  xlsxiowrite_next_row(handle)
Next

' close .xlsx file
xlsxiowrite_close(handle)
Print "create and write data to 2.xlsx"
Sleep

