'下面内容由 VisualFreeBasic 5.9.4 自动产生，请勿自己修改
'[VFB_PROJECT_SETUP_START]
'NumObjects=1
'ProjectName=cjson_test
'CompilationMode=0
'CompilationDebug=0
'ProjectType=GUI
'UseGDIPlus=0
'ShowConsole=-1
'MultiLanguage=0
'OmitInformation=0
'StartupIcon=
'UseWinXPthemes=-1
'StrUnicode=0
'UseAdminPriv=0
'DeleteGeneratedCode=-1
'Namespace=0
'AutoAdd64=0
'AddCompOps=-p D:\GitHub\fbc\lib\win64 -gen gas64
'LastRunFilename=cjson_test.exe
'Major=0
'Minor=0
'Revision=0
'Build=4
'FileMajor=0
'FileMinor=0
'FileRevision=0
'FileBuild=5
'AutoIncrement=3
'DefaultCompiler=64
'Comments=
'CompanyName=
'FileDescription=
'LegalCopyrights=
'LegalTrademarks=
'ProductName=

'Module=.\cjson_test.bas|8|634||Yes|
'TopTab=.\cjson_test.bas|True|8|678
'[VFB_PROJECT_SETUP_END]

#include "crt/stdio.bi"
#include "cJSON.bi"

Print *cJSON_Version

Dim As cJSON Ptr json, json1,name_, sex, age,element 
Dim As ZString Ptr out_=@!"{\"Name\":\"测试\",\"sex\":\"man\",\"age\":19}"
json = cJSON_Parse(out_)
name_ = cJSON_GetObjectItem(json, "name")'  //get keyvalue 
sex = cJSON_GetObjectItem(json, "sex")
age = cJSON_GetObjectItem(json, "age")
cJSON_SetIntValue(age, 33) 'set a new agevalue.
printf(!"name:%s,sex:%s,age:%d\n", name_->valuestring, sex->valuestring, age->valueint)

Dim As ZString Ptr out1 = @"[1,2,3]"
json1 = cJSON_Parse(out1) 

cJSON_ArrayForEach(element, json1) 'loop in an array
print element->valueint
cJSON_nextForEach

cJSON_Delete(json)
cJSON_Delete(json1)
Sleep

