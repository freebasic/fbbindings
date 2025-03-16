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

