#include once "iniparser.bi"

Private Sub create_empty_ini_file()
   Dim As FILE Ptr  ini= fopen("example.ini", "w")
   If (ini = NULL) Then 
      fprintf(stderr, "iniparser: cannot create example.ini\n")
      Exit Sub
   End If
   fclose(ini)
End Sub

Private Function write_to_ini(ByVal ini_name As Const ZString Ptr) As Long
   Dim dictionary As Any Ptr
   Dim As FILE Ptr  ini_file
   Dim ret As Long = 0
   If ini_name = 0 Then
      fprintf(stderr, !"Invalid argurment\n")
      Return -1
   End If
    dictionary = iniparser_load(ini_name)
   If dictionary = 0 Then
      fprintf(stderr, !"cannot parse file: %s\n", ini_name)
      Return -1
   End If
   ret = iniparser_set(dictionary, "Pizza", NULL)
   If ret < 0 Then
      fprintf(stderr, !"cannot set section in: %s\n", ini_name)
      ret = -1
      Goto free_dict
   End If
   ret = iniparser_set(dictionary, "Pizza:Cheese", "TRUE")
   If ret < 0 Then
      fprintf(stderr, !"cannot set key/value in: %s\n", ini_name)
      ret = -1
      Goto free_dict
   End If
   ini_file = fopen(ini_name, "w+")
   If ini_file = 0 Then
      fprintf(stderr, !"iniparser: cannot create example.ini\n")
      ret = -1
     Goto free_dict
   End If
   iniparser_dump_ini(dictionary, ini_file)
   fclose(ini_file)
 free_dict: iniparser_freedict(dictionary)
   Return ret
End Function

   Dim ret As Long
      create_empty_ini_file()
      ret = write_to_ini("example.ini") 'generate the ini file
      Print "done,please chck the ini file."
Sleep
