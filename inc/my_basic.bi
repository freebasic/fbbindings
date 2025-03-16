'freebasic bindings for MY-BASIC
'my_basic is a lightweight BASIC interpreter written in standard C in dual files. 
'Aims to be embeddable, extendable and portable.
'** For the latest info, see https://github.com/paladin-t/my_basic/
'** Copyright (C) 2011 - 2024 Tony Wang
'** Permission is hereby granted, free of charge, to any person obtaining a copy of
'** this software and associated documentation files (the "Software"), to deal in
'** the Software without restriction, including without limitation the rights to
'** use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
'** the Software, and to permit persons to whom the Software is furnished to do so,
'** subject to the following conditions:
'**
'** The above copyright notice and this permission notice shall be included in all
'** copies or substantial portions of the Software.
'**
'** THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
'** IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
'** FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
'** COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
'** IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
'** CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
'' translated to FreeBASIC by:
''   FreeBASIC development team
#pragma once

#ifndef __MY_BASIC_H__
#define __MY_BASIC_H__
#include once "crt/long.bi"
#inclib "my_basic"
extern "C"

#define MB_CP_CLANG

#ifdef __FB_LINUX__
   #define MB_OS_LINUX
#elseif defined(__FB_CYGWIN__) or defined(__FB_FREEBSD__) or defined(__FB_OPENBSD__) or defined(__FB_NETBSD__)
   #define MB_OS_UNIX
#elseif defined(__FB_WIN32__)
   #define MB_OS_WIN
#endif

#if defined(__FB_WIN32__) and (not defined(__FB_64BIT__))
   #define MB_OS_WIN32
#elseif defined(__FB_WIN32__) and defined(__FB_64BIT__)
   #define MB_OS_WIN64
#elseif defined(__FB_DOS__)
   #define MB_OS_UNKNOWN
#endif

#define MBAPI
#define MBIMPL
#define MBCONST
#define MB_SIMPLE_ARRAY
#define MB_ENABLE_ARRAY_REF
const MB_MAX_DIMENSION_COUNT = 4
#define MB_ENABLE_COLLECTION_LIB
#define MB_ENABLE_USERTYPE_REF
#define MB_ENABLE_ALIVE_CHECKING_ON_USERTYPE_REF
#define MB_ENABLE_CLASS
#define MB_ENABLE_LAMBDA
#define MB_ENABLE_MODULE
#define MB_ENABLE_UNICODE
#define MB_ENABLE_UNICODE_ID
const MB_UNICODE_NEED_CONVERTING = 0
#define MB_ENABLE_FORK
const MB_GC_GARBAGE_THRESHOLD = 16
#define MB_ENABLE_ALLOC_STAT
#define MB_ENABLE_SOURCE_TRACE
#define MB_ENABLE_STACK_TRACE
#define MB_ENABLE_FULL_ERROR
const MB_CONVERT_TO_INT_LEVEL_NONE = 0
const MB_CONVERT_TO_INT_LEVEL_ALL = 1
const MB_CONVERT_TO_INT_LEVEL = MB_CONVERT_TO_INT_LEVEL_ALL
const MB_PRINT_INPUT_PROMPT = 1
const MB_PRINT_INPUT_CONTENT = 0
#define MB_PREFER_SPEED
#define MB_COMPACT_MODE

type bool_t as ubyte
type int_t as long
Type real_t As Single
Type mb_interpreter_t As Any Ptr
#ifndef NULL
#define NULL 0
#endif
#define mb_strtol(__s, __e, __r) strtol((__s), (__e), (__r))
#define mb_strtod(__s, __e) strtod((__s), (__e))
#define MB_INT_FMT "%d"
#define MB_REAL_FMT "%g"
const MB_FNAN = &h7FC00000
const MB_FINF = &h7F800000
#define MB_EOS asc(!"\n")
#define MB_NIL "NIL"
#define MB_TRUE "TRUE"
#define MB_FALSE "FALSE"
#define MB_NULL_STRING "(EMPTY)"
#define mb_min(a, b) iif((a) < (b), (a), (b))
#define mb_max(a, b) iif((a) > (b), (a), (b))
#define mb_stricmp strcasecmp
#macro mb_assert(__a)
   scope
      cast(any, (__a))
      assert(__a)
   end scope
#endmacro

#define _static_assert_impl(cond, msg) static_assertion_##msg(IIf(cond, 1, 0) * 2 - 2) as ubyte
#define _compile_time_assert3(x, l) _static_assert_impl(x, static_assertion_at_line_##l)
#define _compile_time_assert2(x, l) _compile_time_assert3(x, l)
#define mb_static_assert(x) _compile_time_assert2(x, __LINE__)
#define mb_unrefvar(__v) (__v)
type mb_mem_tag_t as ushort
#define mb_bytes_size mb_max(mb_max(mb_max(sizeof(any ptr), sizeof(culong)), sizeof(int_t)), sizeof(real_t))
#macro mb_make_nil(__v)
   scope
      memset(@(__v).value.bytes, 0, sizeof(ubyte))
      (__v).type_ = MB_DT_NIL
   end scope
#endmacro
#macro mb_make_type(__v, __d)
   scope
      (__v).value.type_ = (__d)
      (__v).type_ = MB_DT_TYPE
   end scope
#endmacro
#macro mb_make_bool(__v, __d)
   scope
      (__v).value.integer = iif(((__d) = 0) = 0, true, false)
      (__v).type_ = MB_DT_INT
   end scope
#endmacro
#macro mb_make_int(__v, __d)
   scope
      (__v).value.integer = (__d)
      (__v).type_ = MB_DT_INT
   end scope
#endmacro
#macro mb_make_real(__v, __d)
   scope
      (__v).value.float_point = (__d)
      (__v).type_ = MB_DT_REAL
   end scope
#endmacro
#macro mb_make_string(__v, __d)
   scope
      (__v).value.string = (__d)
      (__v).type_ = MB_DT_STRING
   end scope
#endmacro
#macro mb_make_usertype(__v, __d)
   scope
      memset(@(__v).value.bytes, 0, sizeof(ubyte))
      (__v).value.usertype = (__d)
      (__v).type_ = MB_DT_USERTYPE
   end scope
#endmacro
#macro mb_make_usertype_bytes(__v, __d)
   scope
      mb_static_assert(-(sizeof(ubyte) >= sizeof(*__d)))
      memcpy(@(__v).value.bytes, (__d), mb_min(sizeof(ubyte), sizeof(*__d)))
      (__v).type_ = MB_DT_USERTYPE
   end scope
#endmacro
#macro mb_make_array(__v, __d)
   scope
      (__v).value.array = (__d)
      (__v).type_ = MB_DT_ARRAY
   end scope
#endmacro
#macro mb_make_list(__v, __d)
   scope
      (__v).value.list = (__d)
      (__v).type_ = MB_DT_LIST
   end scope
#endmacro
#macro mb_make_dict(__v, __d)
   scope
      (__v).value.dict = (__d)
      (__v).type_ = MB_DT_DICT
   end scope
#endmacro

#macro mb_int_val(__v, __d)
do 
 if((__v).type = MB_DT_INT) then 
    (__d) = (__v).value.integer
 else if((__v).type = MB_DT_REAL) then
    (__d) = cint((__v).value.float_point) 
else 
    (__d) = not (cint(0))
end if
loop while false
#endmacro
#define MB_CODES
const MB_FUNC_OK = 0
const MB_FUNC_IGNORE = 1
const MB_FUNC_WARNING = 2
const MB_FUNC_ERR = 3
const MB_FUNC_BYE = 4
const MB_FUNC_SUSPEND = 5
const MB_FUNC_END = 6
const MB_LOOP_BREAK = 101
const MB_LOOP_CONTINUE = 102
const MB_SUB_RETURN = 103
const MB_EXTENDED_ABORT = 201
#macro mb_check(__expr)
   scope
      dim __hr as long = (__expr)
      if __hr <> MB_FUNC_OK then
         return __hr
      end if
   end scope
#endmacro
#define mb_reg_fun(__s, __f) mb_register_func(__s, #__f, __f)
#define mb_rem_fun(__s, __f) mb_remove_func(__s, #__f)
#define mb_rem_res_fun(__s, __f) mb_remove_reserved_func(__s, #__f)

#macro mb_convert_to_int_if_posible(__v)
   If (__v).type = MB_DT_REAL AndAlso (Cdbl(Cint((__v).value.float_point)) = (__v).value.float_point) Then
        (__v).type = MB_DT_INT
        (__v).value.integer = Cint((__v).value.float_point)
    End If
#endmacro

type mb_error_e as long
enum
   SE_NO_ERR = 0
   SE_CM_FUNC_EXISTS
   SE_CM_FUNC_DOES_NOT_EXIST
   SE_CM_NOT_SUPPORTED
   SE_PS_FAILED_TO_OPEN_FILE
   SE_PS_SYMBOL_TOO_LONG
   SE_PS_INVALID_CHAR
   SE_PS_INVALID_MODULE
   SE_PS_DUPLICATE_IMPORT
   SE_RN_EMPTY_PROGRAM
   SE_RN_PROGRAM_TOO_LONG
   SE_RN_SYNTAX_ERROR
   SE_RN_OUT_OF_MEMORY
   SE_RN_OVERFLOW
   SE_RN_UNEXPECTED_TYPE
   SE_RN_INVALID_STRING
   SE_RN_INTEGER_EXPECTED
   SE_RN_NUMBER_EXPECTED
   SE_RN_STRING_EXPECTED
   SE_RN_VAR_EXPECTED
   SE_RN_INDEX_OUT_OF_BOUND
   SE_RN_CANNOT_FIND_WITH_THE_SPECIFIC_INDEX
   SE_RN_TOO_MANY_DIMENSIONS
   SE_RN_RANK_OUT_OF_BOUND
   SE_RN_INVALID_ID_USAGE
   SE_RN_CANNOT_ASSIGN_TO_RESERVED_WORD
   SE_RN_DUPLICATE_ID
   SE_RN_INCOMPLETE_STRUCTURE
   SE_RN_LABEL_DOES_NOT_EXIST
   SE_RN_NO_RETURN_POINT
   SE_RN_COLON_EXPECTED
   SE_RN_COMMA_EXPECTED
   SE_RN_COMMA_OR_SEMICOLON_EXPECTED
   SE_RN_OPEN_BRACKET_EXPECTED
   SE_RN_CLOSE_BRACKET_EXPECTED
   SE_RN_TOO_MANY_NESTED
   SE_RN_FAILED_TO_OPERATE
   SE_RN_OPERATOR_EXPECTED
   SE_RN_ASSIGN_OPERATOR_EXPECTED
   SE_RN_THEN_EXPECTED
   SE_RN_ELSE_EXPECTED
   SE_RN_ENDIF_EXPECTED
   SE_RN_TO_EXPECTED
   SE_RN_NEXT_EXPECTED
   SE_RN_UNTIL_EXPECTED
   SE_RN_LOOP_VAR_EXPECTED
   SE_RN_JUMP_LABEL_EXPECTED
   SE_RN_CALCULATION_ERROR
   SE_RN_INVALID_EXPRESSION
   SE_RN_DIVIDE_BY_ZERO
   SE_RN_REACHED_TO_WRONG_FUNCTION
   SE_RN_CANNOT_SUSPEND_HERE
   SE_RN_CANNOT_MIX_INSTRUCTIONAL_AND_STRUCTURED
   SE_RN_INVALID_ROUTINE
   SE_RN_ROUTINE_EXPECTED
   SE_RN_DUPLICATE_ROUTINE
   SE_RN_INVALID_CLASS
   SE_RN_CLASS_EXPECTED
   SE_RN_DUPLICATE_CLASS
   SE_RN_HASH_AND_COMPARE_MUST_BE_PROVIDED_TOGETHER
   SE_RN_INVALID_LAMBDA
   SE_RN_EMPTY_COLLECTION
   SE_RN_LIST_EXPECTED
   SE_RN_INVALID_ITERATOR
   SE_RN_ITERABLE_EXPECTED
   SE_RN_COLLECTION_EXPECTED
   SE_RN_COLLECTION_OR_ITERATOR_EXPECTED
   SE_RN_REFERENCED_TYPE_EXPECTED
   SE_EA_EXTENDED_ABORT
   SE_COUNT
end enum

type mb_data_e as long
enum
   MB_DT_NIL = 0
   MB_DT_UNKNOWN = 1 shl 0
   MB_DT_INT = 1 shl 1
   MB_DT_REAL = 1 shl 2
   MB_DT_NUM = MB_DT_INT or MB_DT_REAL
   MB_DT_STRING = 1 shl 3
   MB_DT_TYPE = 1 shl 4
   MB_DT_USERTYPE = 1 shl 5
   MB_DT_USERTYPE_REF = 1 shl 6
   MB_DT_ARRAY = 1 shl 7
   MB_DT_LIST = 1 shl 8
   MB_DT_LIST_IT = 1 shl 9
   MB_DT_DICT = 1 shl 10
   MB_DT_DICT_IT = 1 shl 11
   MB_DT_COLLECTION = MB_DT_LIST or MB_DT_DICT
   MB_DT_ITERATOR = MB_DT_LIST_IT or MB_DT_DICT_IT
   MB_DT_CLASS = 1 shl 12
   MB_DT_ROUTINE = 1 shl 13
end enum

type mb_meta_func_e as long
enum
   MB_MF_IS = 1 shl 0
   MB_MF_ADD = 1 shl 1
   MB_MF_SUB = 1 shl 2
   MB_MF_MUL = 1 shl 3
   MB_MF_DIV = 1 shl 4
   MB_MF_NEG = 1 shl 5
   MB_MF_CALC = ((((MB_MF_IS or MB_MF_ADD) or MB_MF_SUB) or MB_MF_MUL) or MB_MF_DIV) or MB_MF_NEG
   MB_MF_COLL = 1 shl 6
   MB_MF_FUNC = 1 shl 7
end enum

type mb_meta_status_e as long
enum
   MB_MS_NONE = 0
   MB_MS_DONE = 1 shl 0
   MB_MS_RETURNED = 1 shl 1
end enum

type mb_routine_type_e as long
enum
   MB_RT_NONE
   MB_RT_SCRIPT
   MB_RT_LAMBDA
   MB_RT_NATIVE
end enum

union mb_value_u field = 1
   integer as long
   float_point as single
   string as zstring ptr
   type_ as mb_data_e
   usertype as any ptr
   usertype_ref as any ptr
   array as any ptr
   list as any ptr
   list_it as any ptr
   dict as any ptr
   dict_it as any ptr
   instance as any ptr
   routine as any ptr
   bytes(0 to iif(iif(iif(sizeof(any ptr) > sizeof(culong), sizeof(any ptr), sizeof(culong)) > sizeof(long), iif(sizeof(any ptr) > sizeof(culong), sizeof(any ptr), sizeof(culong)), sizeof(long)) > sizeof(single), iif(iif(sizeof(any ptr) > sizeof(culong), sizeof(any ptr), sizeof(culong)) > sizeof(long), iif(sizeof(any ptr) > sizeof(culong), sizeof(any ptr), sizeof(culong)), sizeof(long)), sizeof(single)) - 1) as ubyte
end union

type mb_value_t field = 1
   type_ as mb_data_e
   value as mb_value_u
End Type

Type mb_func_t As Function(ByVal As mb_interpreter_t Ptr, ByVal As Any Ptr Ptr) As Long
type mb_has_routine_arg_func_t as function(byval as mb_interpreter_t ptr, byval as any ptr ptr, byval as mb_value_t ptr, byval as ulong, byval as ulong ptr, byval as any ptr) as long
type mb_pop_routine_arg_func_t as function(byval as mb_interpreter_t ptr, byval as any ptr ptr, byval as mb_value_t ptr, byval as ulong, byval as ulong ptr, byval as any ptr, byval as mb_value_t ptr) as long
type mb_routine_func_t as function(byval as mb_interpreter_t ptr, byval as any ptr ptr, byval as mb_value_t ptr, byval as ulong, byval as any ptr, byval as mb_has_routine_arg_func_t, byval as mb_pop_routine_arg_func_t) as long
type mb_var_retrieving_func_t as sub(byval as mb_interpreter_t ptr, byval as const zstring ptr, byval as mb_value_t)
type mb_debug_stepped_handler_t as function(byval as mb_interpreter_t ptr, byval as any ptr ptr, byval as const zstring ptr, byval as long, byval as ushort, byval as ushort) as long
type mb_error_handler_t as sub(byval as mb_interpreter_t ptr, byval as mb_error_e, byval as const zstring ptr, byval as const zstring ptr, byval as long, byval as ushort, byval as ushort, byval as long)
type mb_print_func_t as function(byval as mb_interpreter_t ptr, byval as const zstring ptr, ...) as long
type mb_input_func_t as function(byval as mb_interpreter_t ptr, byval as const zstring ptr, byval as zstring ptr, byval as long) as long
type mb_import_handler_t as function(byval as mb_interpreter_t ptr, byval as const zstring ptr) as long
type mb_dtor_func_t as sub(byval as mb_interpreter_t ptr, byval as any ptr)
type mb_clone_func_t as function(byval as mb_interpreter_t ptr, byval as any ptr) as any ptr
type mb_hash_func_t as function(byval as mb_interpreter_t ptr, byval as any ptr) as ulong
type mb_cmp_func_t as function(byval as mb_interpreter_t ptr, byval as any ptr, byval as any ptr) as long
type mb_fmt_func_t as function(byval as mb_interpreter_t ptr, byval as any ptr, byval as zstring ptr, byval as ulong) as long
type mb_alive_marker_t as sub(byval as mb_interpreter_t ptr, byval as any ptr, byval as mb_value_t)
type mb_alive_checker_t as sub(byval as mb_interpreter_t ptr, byval as any ptr, byval as mb_alive_marker_t)
type mb_alive_value_checker_t as sub(byval as mb_interpreter_t ptr, byval as any ptr, byval as mb_value_t, byval as mb_alive_marker_t)
type mb_meta_operator_t as function(byval as mb_interpreter_t ptr, byval as any ptr ptr, byval as mb_value_t ptr, byval as mb_value_t ptr, byval as mb_value_t ptr) as long
type mb_meta_func_t as function(byval as mb_interpreter_t ptr, byval as any ptr ptr, byval as mb_value_t ptr, byval as const zstring ptr) as mb_meta_status_e
type mb_memory_allocate_func_t as function(byval as ulong) as zstring ptr
type mb_memory_free_func_t as sub(byval as zstring ptr)

declare function mb_ver() as culong
declare function mb_ver_string() as const zstring ptr
declare function mb_init() as long
declare function mb_dispose() as long
declare function mb_open(byval s as mb_interpreter_t ptr ptr) as long
declare function mb_close(byval s as mb_interpreter_t ptr ptr) as long
declare function mb_reset(byval s as mb_interpreter_t ptr ptr, byval clear_funcs as ubyte, byval clear_vars as ubyte) as long
declare function mb_fork(byval s as mb_interpreter_t ptr ptr, byval r as mb_interpreter_t ptr, byval clear_forked as ubyte) as long
declare function mb_join(byval s as mb_interpreter_t ptr ptr) as long
declare function mb_get_forked_from(byval s as mb_interpreter_t ptr, byval src as mb_interpreter_t ptr ptr) as long
declare function mb_register_func(byval s as mb_interpreter_t ptr, byval n as const zstring ptr, byval f as mb_func_t) as long
declare function mb_remove_func(byval s as mb_interpreter_t ptr, byval n as const zstring ptr) as long
declare function mb_remove_reserved_func(byval s as mb_interpreter_t ptr, byval n as const zstring ptr) as long
declare function mb_begin_module(byval s as mb_interpreter_t ptr, byval n as const zstring ptr) as long
declare function mb_end_module(byval s as mb_interpreter_t ptr) as long
declare function mb_attempt_func_begin(byval s as mb_interpreter_t ptr, byval l as any ptr ptr) as long
declare function mb_attempt_func_end(byval s as mb_interpreter_t ptr, byval l as any ptr ptr) as long
declare function mb_attempt_open_bracket(byval s as mb_interpreter_t ptr, byval l as any ptr ptr) as long
declare function mb_attempt_close_bracket(byval s as mb_interpreter_t ptr, byval l as any ptr ptr) as long
declare function mb_has_arg(byval s as mb_interpreter_t ptr, byval l as any ptr ptr) as long
declare function mb_pop_int(byval s as mb_interpreter_t ptr, byval l as any ptr ptr, byval val_ as long ptr) as long
declare function mb_pop_real(byval s as mb_interpreter_t ptr, byval l as any ptr ptr, byval val_ as single ptr) as long
declare function mb_pop_string(byval s as mb_interpreter_t ptr, byval l as any ptr ptr, byval val_ as zstring ptr ptr) as long
declare function mb_pop_usertype(byval s as mb_interpreter_t ptr, byval l as any ptr ptr, byval val_ as any ptr ptr) as long
declare function mb_pop_value(byval s as mb_interpreter_t ptr, byval l as any ptr ptr, byval val_ as mb_value_t ptr) as long
declare function mb_push_int(byval s as mb_interpreter_t ptr, byval l as any ptr ptr, byval val_ as long) as long
declare function mb_push_real(byval s as mb_interpreter_t ptr, byval l as any ptr ptr, byval val_ as single) as long
declare function mb_push_string(byval s as mb_interpreter_t ptr, byval l as any ptr ptr, byval val_ as zstring ptr) as long
declare function mb_push_usertype(byval s as mb_interpreter_t ptr, byval l as any ptr ptr, byval val_ as any ptr) as long
declare function mb_push_value(byval s as mb_interpreter_t ptr, byval l as any ptr ptr, byval val_ as mb_value_t) as long
declare function mb_begin_class(byval s as mb_interpreter_t ptr, byval l as any ptr ptr, byval n as const zstring ptr, byval meta as mb_value_t ptr ptr, byval c as long, byval out_ as mb_value_t ptr) as long
declare function mb_end_class(byval s as mb_interpreter_t ptr, byval l as any ptr ptr) as long
declare function mb_get_class_userdata(byval s as mb_interpreter_t ptr, byval l as any ptr ptr, byval d as any ptr ptr) as long
declare function mb_set_class_userdata(byval s as mb_interpreter_t ptr, byval l as any ptr ptr, byval d as any ptr) as long
declare function mb_get_value_by_name(byval s as mb_interpreter_t ptr, byval l as any ptr ptr, byval n as const zstring ptr, byval val_ as mb_value_t ptr) as long
declare function mb_get_vars(byval s as mb_interpreter_t ptr, byval l as any ptr ptr, byval r as mb_var_retrieving_func_t, byval stack_offset as long) as long
declare function mb_add_var(byval s as mb_interpreter_t ptr, byval l as any ptr ptr, byval n as const zstring ptr, byval val_ as mb_value_t, byval force as ubyte) as long
declare function mb_get_var(byval s as mb_interpreter_t ptr, byval l as any ptr ptr, byval v as any ptr ptr, byval redir as ubyte) as long
declare function mb_get_var_name(byval s as mb_interpreter_t ptr, byval v as any ptr, byval n as zstring ptr ptr) as long
declare function mb_get_var_value(byval s as mb_interpreter_t ptr, byval v as any ptr, byval val_ as mb_value_t ptr) as long
declare function mb_set_var_value(byval s as mb_interpreter_t ptr, byval v as any ptr, byval val_ as mb_value_t) as long
declare function mb_init_array(byval s as mb_interpreter_t ptr, byval l as any ptr ptr, byval t as mb_data_e, byval d as long ptr, byval c as long, byval a as any ptr ptr) as long
declare function mb_get_array_len(byval s as mb_interpreter_t ptr, byval l as any ptr ptr, byval a as any ptr, byval r as long, byval i as long ptr) as long
declare function mb_get_array_elem(byval s as mb_interpreter_t ptr, byval l as any ptr ptr, byval a as any ptr, byval d as long ptr, byval c as long, byval val_ as mb_value_t ptr) as long
declare function mb_set_array_elem(byval s as mb_interpreter_t ptr, byval l as any ptr ptr, byval a as any ptr, byval d as long ptr, byval c as long, byval val_ as mb_value_t) as long
declare function mb_init_coll(byval s as mb_interpreter_t ptr, byval l as any ptr ptr, byval coll as mb_value_t ptr) as long
declare function mb_get_coll(byval s as mb_interpreter_t ptr, byval l as any ptr ptr, byval coll as mb_value_t, byval idx as mb_value_t, byval val_ as mb_value_t ptr) as long
declare function mb_set_coll(byval s as mb_interpreter_t ptr, byval l as any ptr ptr, byval coll as mb_value_t, byval idx as mb_value_t, byval val_ as mb_value_t) as long
declare function mb_remove_coll(byval s as mb_interpreter_t ptr, byval l as any ptr ptr, byval coll as mb_value_t, byval idx as mb_value_t) as long
declare function mb_count_coll(byval s as mb_interpreter_t ptr, byval l as any ptr ptr, byval coll as mb_value_t, byval c as long ptr) as long
declare function mb_keys_of_coll(byval s as mb_interpreter_t ptr, byval l as any ptr ptr, byval coll as mb_value_t, byval keys as mb_value_t ptr, byval c as long) as long
declare function mb_make_ref_value(byval s as mb_interpreter_t ptr, byval val_ as any ptr, byval out_ as mb_value_t ptr, byval un as mb_dtor_func_t, byval cl as mb_clone_func_t, byval hs as mb_hash_func_t, byval cp as mb_cmp_func_t, byval ft as mb_fmt_func_t) as long
declare function mb_get_ref_value(byval s as mb_interpreter_t ptr, byval l as any ptr ptr, byval val_ as mb_value_t, byval out_ as any ptr ptr) as long
declare function mb_ref_value(byval s as mb_interpreter_t ptr, byval l as any ptr ptr, byval val_ as mb_value_t) as long
declare function mb_unref_value(byval s as mb_interpreter_t ptr, byval l as any ptr ptr, byval val_ as mb_value_t) as long
declare function mb_set_alive_checker(byval s as mb_interpreter_t ptr, byval f as mb_alive_checker_t) as long
declare function mb_set_alive_checker_of_value(byval s as mb_interpreter_t ptr, byval l as any ptr ptr, byval val_ as mb_value_t, byval f as mb_alive_value_checker_t) as long
declare function mb_override_value(byval s as mb_interpreter_t ptr, byval l as any ptr ptr, byval val_ as mb_value_t, byval m as mb_meta_func_e, byval f as any ptr) as long
declare function mb_dispose_value(byval s as mb_interpreter_t ptr, byval val_ as mb_value_t) as long
declare function mb_get_routine(byval s as mb_interpreter_t ptr, byval l as any ptr ptr, byval n as const zstring ptr, byval val_ as mb_value_t ptr) as long
declare function mb_set_routine(byval s as mb_interpreter_t ptr, byval l as any ptr ptr, byval n as const zstring ptr, byval f as mb_routine_func_t, byval force as ubyte) as long
declare function mb_eval_routine(byval s as mb_interpreter_t ptr, byval l as any ptr ptr, byval val_ as mb_value_t, byval args as mb_value_t ptr, byval argc as ulong, byval ret as mb_value_t ptr) as long
declare function mb_get_routine_type(byval s as mb_interpreter_t ptr, byval val_ as mb_value_t, byval y as mb_routine_type_e ptr) as long
declare function mb_load_string(byval s as mb_interpreter_t ptr, byval l as const zstring ptr, byval reset as ubyte) as long
declare function mb_load_file(byval s as mb_interpreter_t ptr, byval f as const zstring ptr) as long
declare function mb_run(byval s as mb_interpreter_t ptr, byval clear_parser as ubyte) as long
declare function mb_suspend(byval s as mb_interpreter_t ptr, byval l as any ptr ptr) as long
declare function mb_schedule_suspend(byval s as mb_interpreter_t ptr, byval t as long) as long
declare function mb_debug_get(byval s as mb_interpreter_t ptr, byval n as const zstring ptr, byval val_ as mb_value_t ptr) as long
declare function mb_debug_set(byval s as mb_interpreter_t ptr, byval n as const zstring ptr, byval val_ as mb_value_t) as long
declare function mb_debug_count_stack_frames(byval s as mb_interpreter_t ptr) as long
declare function mb_debug_get_stack_trace(byval s as mb_interpreter_t ptr, byval fs as zstring ptr ptr, byval fc as ulong) as long
declare function mb_debug_set_stepped_handler(byval s as mb_interpreter_t ptr, byval prev as mb_debug_stepped_handler_t, byval post as mb_debug_stepped_handler_t) as long
declare function mb_get_type_string(byval t as mb_data_e) as const zstring ptr
declare function mb_raise_error(byval s as mb_interpreter_t ptr, byval l as any ptr ptr, byval err_ as mb_error_e, byval ret as long) as long
declare function mb_get_last_error(byval s as mb_interpreter_t ptr, byval file as const zstring ptr ptr, byval pos_ as long ptr, byval row as ushort ptr, byval col as ushort ptr) as mb_error_e
declare function mb_get_error_desc(byval err_ as mb_error_e) as const zstring ptr
declare function mb_set_error_handler(byval s as mb_interpreter_t ptr, byval h as mb_error_handler_t) as long
declare function mb_set_printer(byval s as mb_interpreter_t ptr, byval p as mb_print_func_t) as long
declare function mb_set_inputer(byval s as mb_interpreter_t ptr, byval p as mb_input_func_t) as long
declare function mb_set_import_handler(byval s as mb_interpreter_t ptr, byval h as mb_import_handler_t) as long
declare function mb_set_memory_manager(byval a as mb_memory_allocate_func_t, byval f as mb_memory_free_func_t) as long
declare function mb_get_gc_enabled(byval s as mb_interpreter_t ptr) as ubyte
declare function mb_set_gc_enabled(byval s as mb_interpreter_t ptr, byval gc as ubyte) as long
declare function mb_gc(byval s as mb_interpreter_t ptr, byval collected as long ptr) as long
declare function mb_get_userdata(byval s as mb_interpreter_t ptr, byval d as any ptr ptr) as long
Declare Function mb_set_userdata(ByVal s As mb_interpreter_t Ptr, ByVal d As Any Ptr) As Long
Declare Function mb_gets(ByVal s As mb_interpreter_t Ptr, ByVal pmt As Const ZString Ptr, ByVal buf As ZString Ptr, ByVal n As Long) As Long
declare function mb_memdup(byval val_ as const zstring ptr, byval size as ulong) as zstring ptr

end extern
#endif
