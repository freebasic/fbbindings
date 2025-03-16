'' FreeBASIC binding for cjson-1.7.18
''
'' based on the C header files:
'' Ultralightweight JSON parser in ANSI C.
'Copyright (c) 2009-2017 Dave Gamble and cJSON contributors
  'Permission Is hereby granted, free of charge, To Any person obtaining a copy
  'of this software and associated documentation files (the "Software"), to deal
  'in the Software without restriction, including without limitation the rights
  'to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  'copies of the Software, and to permit persons to whom the Software is
  'furnished to do so, subject to the following conditions:
  'The above copyright notice and this permission notice shall be included in
  'all copies or substantial portions of the Software.
  'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  'IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  'AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  'LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  'OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  'THE SOFTWARE.
'' translated to FreeBASIC by:
''  FreeBASIC development team

#pragma once

#ifndef cJSON__h
#define cJSON__h
#include once "crt/stddef.bi"
#inclib "cjson"
#ifdef __FB_WIN32__
   extern "Windows"
#else
   extern "C"
#endif

#define cJSON__h

#ifdef __FB_WIN32__
   #define __WINDOWS__
   #define CJSON_CDECL __cdecl
   #define CJSON_STDCALL __stdcall
   #define CJSON_EXPORT_SYMBOLS
   #define CJSON_PUBLIC(type) type __attribute__((visibility("default"))) __attribute__((stdcall))
#else
   #define CJSON_CDECL
   #define CJSON_STDCALL
   #define CJSON_PUBLIC(type) type
#endif

const CJSON_VERSION_MAJOR = 1
const CJSON_VERSION_MINOR = 7
const CJSON_VERSION_PATCH = 18
const cJSON_Invalid = 0
const cJSON_False = 1 shl 0
const cJSON_True = 1 shl 1
const cJSON_NULL = 1 shl 2
const cJSON_Number = 1 shl 3
const cJSON_String = 1 shl 4
const cJSON_Array = 1 shl 5
const cJSON_Object = 1 shl 6
const cJSON_Raw = 1 shl 7
const cJSON_IsReference = 256
const cJSON_StringIsConst = 512

type cJSON
   Next As cJSON Ptr
   prev as cJSON ptr
   child as cJSON ptr
   as long type
   valuestring As ZString Ptr
   valueint As Long
   valuedouble As Double
   String As ZString Ptr
end type

type cJSON_Hooks
   malloc_fn as function cdecl(byval sz as uinteger) as any ptr
   free_fn As Sub cdecl(ByVal Ptr As Any Ptr)
End Type

type cJSON_bool as long
const CJSON_NESTING_LIMIT = 1000
const CJSON_CIRCULAR_LIMIT = 10000
declare function cJSON_Version() as const zstring ptr
declare sub cJSON_InitHooks(byval hooks as cJSON_Hooks ptr)
declare function cJSON_Parse(byval value as const zstring ptr) as cJSON ptr
declare function cJSON_ParseWithLength(byval value as const zstring ptr, byval buffer_length as uinteger) as cJSON ptr
declare function cJSON_ParseWithOpts(byval value as const zstring ptr, byval return_parse_end as const zstring ptr ptr, byval require_null_terminated as cJSON_bool) as cJSON ptr
declare function cJSON_ParseWithLengthOpts(byval value as const zstring ptr, byval buffer_length as uinteger, byval return_parse_end as const zstring ptr ptr, byval require_null_terminated as cJSON_bool) as cJSON ptr
Declare Function cJSON_Print(ByVal item As Const cJSON Ptr) As ZString Ptr
declare function cJSON_PrintUnformatted(byval item as const cJSON ptr) as zstring ptr
declare function cJSON_PrintBuffered(byval item as const cJSON ptr, byval prebuffer as long, byval fmt as cJSON_bool) as zstring ptr
declare function cJSON_PrintPreallocated(byval item as cJSON ptr, byval buffer as zstring ptr, byval length as const long, byval format as const cJSON_bool) as cJSON_bool
Declare Sub cJSON_Delete(ByVal item As cJSON Ptr)
Declare Function cJSON_GetArraySize(ByVal array As Const cJSON Ptr) As Long
Declare Function cJSON_GetArrayItem(ByVal array As Const cJSON Ptr, ByVal index As Long) As cJSON Ptr
declare function cJSON_GetObjectItem(byval object as const cJSON const ptr, byval string as const zstring const ptr) as cJSON ptr
declare function cJSON_GetObjectItemCaseSensitive(byval object as const cJSON const ptr, byval string as const zstring const ptr) as cJSON ptr
declare function cJSON_HasObjectItem(byval object as const cJSON ptr, byval string as const zstring ptr) as cJSON_bool
declare function cJSON_GetErrorPtr() as const zstring ptr
declare function cJSON_GetStringValue(byval item as const cJSON const ptr) as zstring ptr
declare function cJSON_GetNumberValue(byval item as const cJSON const ptr) as double
Declare Function cJSON_IsInvalid(ByVal item As Const cJSON Const Ptr) As cJSON_bool
Declare Function cJSON_IsFalse(ByVal item As Const cJSON Const Ptr) As cJSON_bool
Declare Function cJSON_IsTrue(ByVal item As Const cJSON Const Ptr) As cJSON_bool
Declare Function cJSON_IsBool(ByVal item As Const cJSON Const Ptr) As cJSON_bool
Declare Function cJSON_IsNull(ByVal item As Const cJSON Const Ptr) As cJSON_bool
Declare Function cJSON_IsNumber(ByVal item As Const cJSON Const Ptr) As cJSON_bool
declare function cJSON_IsString(byval item as const cJSON const ptr) as cJSON_bool
declare function cJSON_IsArray(byval item as const cJSON const ptr) as cJSON_bool
declare function cJSON_IsObject(byval item as const cJSON const ptr) as cJSON_bool
declare function cJSON_IsRaw(byval item as const cJSON const ptr) as cJSON_bool
Declare Function cJSON_CreateNull() As cJSON Ptr
Declare Function cJSON_CreateTrue() As cJSON Ptr
declare function cJSON_CreateFalse() as cJSON ptr
Declare Function cJSON_CreateBool(ByVal BOOLEAN As cJSON_bool) As cJSON Ptr
Declare Function cJSON_CreateNumber(ByVal num As Double) As cJSON Ptr
Declare Function cJSON_CreateString(ByVal String As Const ZString Ptr) As cJSON Ptr
Declare Function cJSON_CreateRaw(ByVal raw As Const ZString Ptr) As cJSON Ptr
Declare Function cJSON_CreateArray() As cJSON Ptr
Declare Function cJSON_CreateObject() As cJSON Ptr
Declare Function cJSON_CreateStringReference(ByVal String As Const ZString Ptr) As cJSON Ptr
declare function cJSON_CreateObjectReference(byval child as const cJSON ptr) as cJSON ptr
declare function cJSON_CreateArrayReference(byval child as const cJSON ptr) as cJSON ptr
Declare Function cJSON_CreateIntArray(ByVal numbers As Const Long Ptr, ByVal count As Long) As cJSON Ptr
Declare Function cJSON_CreateFloatArray(ByVal numbers As Const Single Ptr, ByVal count As Long) As cJSON Ptr
Declare Function cJSON_CreateDoubleArray(ByVal numbers As Const Double Ptr, ByVal count As Long) As cJSON Ptr
Declare Function cJSON_CreateStringArray(ByVal strings As Const ZString Const Ptr Ptr, ByVal count As Long) As cJSON Ptr
Declare Function cJSON_AddItemToArray(ByVal array As cJSON Ptr, ByVal item As cJSON Ptr) As cJSON_bool
Declare Function cJSON_AddItemToObject(ByVal Object As cJSON Ptr, ByVal String As Const ZString Ptr, ByVal item As cJSON Ptr) As cJSON_bool
Declare Function cJSON_AddItemToObjectCS(ByVal Object As cJSON Ptr, ByVal String As Const ZString Ptr, ByVal item As cJSON Ptr) As cJSON_bool
declare function cJSON_AddItemReferenceToArray(byval array as cJSON ptr, byval item as cJSON ptr) as cJSON_bool
declare function cJSON_AddItemReferenceToObject(byval object as cJSON ptr, byval string as const zstring ptr, byval item as cJSON ptr) as cJSON_bool
Declare Function cJSON_DetachItemViaPointer(ByVal parent As cJSON Ptr, ByVal item As cJSON Const Ptr) As cJSON Ptr
Declare Function cJSON_DetachItemFromArray(ByVal array As cJSON Ptr, ByVal which As Long) As cJSON Ptr
Declare Sub cJSON_DeleteItemFromArray(ByVal array As cJSON Ptr, ByVal which As Long)
Declare Function cJSON_DetachItemFromObject(ByVal Object As cJSON Ptr, ByVal String As Const ZString Ptr) As cJSON Ptr
Declare Function cJSON_DetachItemFromObjectCaseSensitive(ByVal Object As cJSON Ptr, ByVal String As Const ZString Ptr) As cJSON Ptr
Declare Sub cJSON_DeleteItemFromObject(ByVal Object As cJSON Ptr, ByVal String As Const ZString Ptr)
Declare Sub cJSON_DeleteItemFromObjectCaseSensitive(ByVal Object As cJSON Ptr, ByVal String As Const ZString Ptr)
declare function cJSON_InsertItemInArray(byval array as cJSON ptr, byval which as long, byval newitem as cJSON ptr) as cJSON_bool
declare function cJSON_ReplaceItemViaPointer(byval parent as cJSON const ptr, byval item as cJSON const ptr, byval replacement as cJSON ptr) as cJSON_bool
Declare Function cJSON_ReplaceItemInArray(ByVal array As cJSON Ptr, ByVal which As Long, ByVal newitem As cJSON Ptr) As cJSON_bool
Declare Function cJSON_ReplaceItemInObject(ByVal Object As cJSON Ptr, ByVal String As Const ZString Ptr, ByVal newitem As cJSON Ptr) As cJSON_bool
declare function cJSON_ReplaceItemInObjectCaseSensitive(byval object as cJSON ptr, byval string as const zstring ptr, byval newitem as cJSON ptr) as cJSON_bool
declare function cJSON_Duplicate(byval item as const cJSON ptr, byval recurse as cJSON_bool) as cJSON ptr
declare function cJSON_Compare(byval a as const cJSON const ptr, byval b as const cJSON const ptr, byval case_sensitive as const cJSON_bool) as cJSON_bool
declare sub cJSON_Minify(byval json as zstring ptr)
declare function cJSON_AddNullToObject(byval object as cJSON const ptr, byval name as const zstring const ptr) as cJSON ptr
declare function cJSON_AddTrueToObject(byval object as cJSON const ptr, byval name as const zstring const ptr) as cJSON ptr
Declare Function cJSON_AddFalseToObject(ByVal Object As cJSON Const Ptr, ByVal Name As Const ZString Const Ptr) As cJSON Ptr
Declare Function cJSON_AddBoolToObject(ByVal Object As cJSON Const Ptr, ByVal Name As Const ZString Const Ptr, ByVal BOOLEAN As Const cJSON_bool) As cJSON Ptr
declare function cJSON_AddNumberToObject(byval object as cJSON const ptr, byval name as const zstring const ptr, byval number as const double) as cJSON ptr
Declare Function cJSON_AddStringToObject(ByVal Object As cJSON Const Ptr, ByVal Name As Const ZString Const Ptr, ByVal String As Const ZString Const Ptr) As cJSON Ptr
declare function cJSON_AddRawToObject(byval object as cJSON const ptr, byval name as const zstring const ptr, byval raw as const zstring const ptr) as cJSON ptr
Declare Function cJSON_AddObjectToObject(ByVal Object As cJSON Const Ptr, ByVal Name As Const ZString Const Ptr) As cJSON Ptr
Declare Function cJSON_AddArrayToObject(ByVal Object As cJSON Const Ptr, ByVal Name As Const ZString Const Ptr) As cJSON Ptr

#Macro cJSON_SetIntValue(object, number)
    If object Then
        object->valueint = number
        object->valuedouble = number
    EndIf
#EndMacro

declare function cJSON_SetNumberHelper(byval object as cJSON ptr, byval number as double) as double
#define cJSON_SetNumberValue(object, number) iif(object <> NULL, cJSON_SetNumberHelper(object, cdbl(number)), (number))
declare function cJSON_SetValuestring(byval object as cJSON ptr, byval valuestring as const zstring ptr) as zstring ptr

#Macro cJSON_SetBoolValue(object, boolValue)
    If object <> NULL AndAlso (object->type And (cJSON_False Or cJSON_True)) Then
        object->type = (object->type And Not (cJSON_False Or cJSON_True)) Or IIf(boolValue, cJSON_True, cJSON_False)
    EndIf
#EndMacro

#Macro cJSON_ArrayForEach(element, array)
    #define cJSON_NextForEach element = element->next:loop
    element = IIf(array <> NULL, array->child, NULL)
    Do While element <> NULL
#EndMacro
declare function cJSON_malloc(byval size as uinteger) as any ptr
Declare Sub cJSON_free(ByVal Object As Any Ptr)

end extern
#endif