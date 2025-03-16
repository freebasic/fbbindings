'下面内容由 VisualFreeBasic 5.9.4 自动产生，请勿自己修改
'[VFB_PROJECT_SETUP_START]
'NumObjects=1
'ProjectName=libcalg-test
'CompilationMode=0
'CompilationDebug=0
'ProjectType=GUI
'UseGDIPlus=0
'ShowConsole=1
'MultiLanguage=0
'OmitInformation=0
'StartupIcon=
'UseWinXPthemes=1
'StrUnicode=0
'UseAdminPriv=0
'DeleteGeneratedCode=1
'Namespace=0
'AutoAdd64=0
'AddCompOps=
'LastRunFilename=libcalg-test
'Major=0
'Minor=0
'Revision=0
'Build=0
'FileMajor=0
'FileMinor=0
'FileRevision=0
'FileBuild=1
'AutoIncrement=3
'DefaultCompiler=32
'Comments=
'CompanyName=
'FileDescription=
'LegalCopyrights=
'LegalTrademarks=
'ProductName=

'Module=.\libcalg-test.bas|0|0||Yes|
'TopTab=.\libcalg-test.bas|True|43|1531
'[VFB_PROJECT_SETUP_END]
#include once "libcalg.bi"
#ifdef __fb_64bit__
#libpath "win64"
#else
#libpath "win32"
#endif
'test  arraylist
scope
   Dim arraylist As ArrayList Ptr
   Dim st As ArrayListValue
   ArrayList = arraylist_new(0)
   Dim As Long v1, v2, v3, v4
   v1=1:v2=3:v3=7:v4=10
   arraylist_append(arraylist, Cast(Any Ptr,@v1))
   arraylist_append(arraylist, Cast(Any Ptr,@v2))
   arraylist_append(arraylist, Cast(Any Ptr,@v3))
   arraylist_append(ArrayList, Cast(Any Ptr,@v4))
   Print "SIZE of arraylist:",ArrayList->length
   For i As Integer = 0 To ArrayList->length -1
         Print  "element(" & i &") value:";*Cast(Long Ptr,ArrayList->Data_[i])
   Next
   arraylist_free(ArrayList)
End Scope

Scope 
 print "------------set test-----------------"
   Dim numbers1(0 To ...) As Long = {1, 2, 3, 4, 5, 6, 7}
   dim numbers2(0 to ...) as long = {5, 6, 7, 8, 9, 10, 11}
   Dim i As Long
   Dim As Set Ptr set1 ,set2,result_set
  
   set1 = set_new(@int_hash, @int_equal)
   For i = 0 To 6
      set_insert(set1, @numbers1(i))
   Next

   set2 = set_new(@int_hash, @int_equal)
    For i = 0 To 6
      set_insert(set2, @numbers2(i))
   Next
   
   result_set = set_intersection(set1, set2)
   Print "size of set",set_num_entries(result_set) 
   Dim iterator As SetIterator
   Dim value As Any Ptr
   set_iterate(result_set, @iterator)
    Print "intersection of numbers1 and numbers2:"
  While set_iter_has_more(@iterator)
     value = set_iter_next(@iterator)
     Print *Cast(Long Ptr,value)
   Wend
   set_free(set1)
   set_free(set2)
   set_free(result_set)
   End Scope
sleep
