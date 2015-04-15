'' FreeBASIC binding for mingw-w64-v4.0.1
''
'' based on the C header files:
''   DISCLAIMER
''   This file has no copyright assigned and is placed in the Public Domain.
''   This file is part of the mingw-w64 runtime package.
''
''   The mingw-w64 runtime package and its code is distributed in the hope that it 
''   will be useful but WITHOUT ANY WARRANTY.  ALL WARRANTIES, EXPRESSED OR 
''   IMPLIED ARE HEREBY DISCLAIMED.  This includes but is not limited to 
''   warranties of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
''
'' translated to FreeBASIC by:
''   Copyright © 2015 FreeBASIC development team

#pragma once

#include once "_mingw.bi"

#define _INC_CRTDEFS
const _CRT_PACKING = 8
'' TODO: #pragma pack(push,_CRT_PACKING)
#define _CRTNOALIAS
#define _CRTRESTRICT
#define _SIZE_T_DEFINED

#ifdef __FB_64BIT__
	type size_t as ulongint
#else
	type size_t as ulong
#endif

#define _SSIZE_T_DEFINED

#ifdef __FB_64BIT__
	type ssize_t as longint
#else
	type ssize_t as long
#endif

type rsize_t as uinteger
#define _RSIZE_T_DEFINED
#define _INTPTR_T_DEFINED
#define __intptr_t_defined

#ifdef __FB_64BIT__
	type intptr_t as longint
#else
	type intptr_t as long
#endif

#define _UINTPTR_T_DEFINED
#define __uintptr_t_defined

#ifdef __FB_64BIT__
	type uintptr_t as ulongint
#else
	type uintptr_t as ulong
#endif

#define _PTRDIFF_T_DEFINED
#define _PTRDIFF_T_

#ifdef __FB_64BIT__
	type ptrdiff_t as longint
#else
	type ptrdiff_t as long
#endif

#define _WCHAR_T_DEFINED
type wchar_t as ushort
#define _WCTYPE_T_DEFINED
#define _WINT_T
type wint_t as ushort
type wctype_t as ushort
#define _ERRCODE_DEFINED
type errno_t as long
#define _TIME32_T_DEFINED
type __time32_t as long
#define _TIME64_T_DEFINED
type __time64_t as longint
#define _TIME_T_DEFINED

#ifdef __FB_64BIT__
	type time_t as __time64_t
#else
	type time_t as __time32_t
#endif

#define _CRT_SECURE_CPP_NOTHROW throw()
#define __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_0(__ret, __func, __dsttype, __dst)
#define __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_1(__ret, __func, __dsttype, __dst, __type1, __arg1)
#define __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_2(__ret, __func, __dsttype, __dst, __type1, __arg1, __type2, __arg2)
#define __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_3(__ret, __func, __dsttype, __dst, __type1, __arg1, __type2, __arg2, __type3, __arg3)
#define __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_4(__ret, __func, __dsttype, __dst, __type1, __arg1, __type2, __arg2, __type3, __arg3, __type4, __arg4)
#define __DEFINE_CPP_OVERLOAD_SECURE_FUNC_1_1(__ret, __func, __type0, __arg0, __dsttype, __dst, __type1, __arg1)
#define __DEFINE_CPP_OVERLOAD_SECURE_FUNC_1_2(__ret, __func, __type0, __arg0, __dsttype, __dst, __type1, __arg1, __type2, __arg2)
#define __DEFINE_CPP_OVERLOAD_SECURE_FUNC_1_3(__ret, __func, __type0, __arg0, __dsttype, __dst, __type1, __arg1, __type2, __arg2, __type3, __arg3)
#define __DEFINE_CPP_OVERLOAD_SECURE_FUNC_2_0(__ret, __func, __type1, __arg1, __type2, __arg2, __dsttype, __dst)
#define __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_1_ARGLIST(__ret, __func, __vfunc, __dsttype, __dst, __type1, __arg1)
#define __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_2_ARGLIST(__ret, __func, __vfunc, __dsttype, __dst, __type1, __arg1, __type2, __arg2)
#define __DEFINE_CPP_OVERLOAD_SECURE_FUNC_SPLITPATH(__ret, __func, __dsttype, __src)
#define __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_0(__ret_type, __ret_policy, __decl_spec, __name, __dst_attr, __dst_type, __dst) __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_0_EX(__ret_type, __ret_policy, __decl_spec, __func_name, __func_name##_s, __dst_attr, __dst_type, __dst)
#define __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_1(__ret_type, __ret_policy, __decl_spec, __name, __dst_attr, __dst_type, __dst, __arg1_type, __arg1) __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_2_EX(__ret_type, __ret_policy, __decl_spec, __func_name, __func_name##_s, __dst_attr, __dst_type, __dst, __arg1_type, __arg1, __arg2_type, __arg2)
#define __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_2(__ret_type, __ret_policy, __decl_spec, __name, __dst_attr, __dst_type, __dst, __arg1_type, __arg1, __arg2_type, __arg2) __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_2_EX(__ret_type, __ret_policy, __decl_spec, __func_name, __func_name##_s, __dst_attr, __dst_type, __dst, __arg1_type, __arg1, __arg2_type, __arg2)
#define __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_3(__ret_type, __ret_policy, __decl_spec, __name, __dst_attr, __dst_type, __dst, __arg1_type, __arg1, __arg2_type, __arg2, __arg3_type, __arg3) __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_3_EX(__ret_type, __ret_policy, __decl_spec, __func_name, __func_name##_s, __dst_attr, __dst_type, __dst, __arg1_type, __arg1, __arg2_type, __arg2, __arg3_type, __arg3)
#define __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_4(__ret_type, __ret_policy, __decl_spec, __name, __dst_attr, __dst_type, __dst, __arg1_type, __arg1, __arg2_type, __arg2, __arg3_type, __arg3, __arg4_type, __arg4) __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_4_EX(__ret_type, __ret_policy, __decl_spec, __func_name, __func_name##_s, __dst_attr, __dst_type, __dst, __arg1_type, __arg1, __arg2_type, __arg2, __arg3_type, __arg3, __arg4_type, __arg4)
#define __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_0_EX(__ret_type, __ret_policy, __decl_spec, __name, __sec_name, __dst_attr, __dst_type, __dst)
#define __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_1_EX(__ret_type, __ret_policy, __decl_spec, __name, __sec_name, __dst_attr, __dst_type, __dst, __arg1_type, __arg1)
#define __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_2_EX(__ret_type, __ret_policy, __decl_spec, __name, __sec_name, __dst_attr, __dst_type, __dst, __arg1_type, __arg1, __arg2_type, __arg2)
#define __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_3_EX(__ret_type, __ret_policy, __decl_spec, __name, __sec_name, __dst_attr, __dst_type, __dst, __arg1_type, __arg1, __arg2_type, __arg2, __arg3_type, __arg3)
#define __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_4_EX(__ret_type, __ret_policy, __decl_spec, __name, __sec_name, __dst_attr, __dst_type, __dst, __arg1_type, __arg1, __arg2_type, __arg2, __arg3_type, __arg3, __arg4_type, __arg4)
type pthreadlocinfo as threadlocaleinfostruct ptr
type pthreadmbcinfo as threadmbcinfostruct ptr

type localeinfo_struct
	locinfo as pthreadlocinfo
	mbcinfo as pthreadmbcinfo
end type

type _locale_tstruct as localeinfo_struct
type _locale_t as localeinfo_struct ptr
#define _TAGLC_ID_DEFINED

type tagLC_ID
	wLanguage as ushort
	wCountry as ushort
	wCodePage as ushort
end type

type LC_ID as tagLC_ID
type LPLC_ID as tagLC_ID ptr
#define _THREADLOCALEINFO

type threadlocaleinfostruct_lc_category
	locale as zstring ptr
	wlocale as wstring ptr
	refcount as long ptr
	wrefcount as long ptr
end type

type __lc_time_data as __lc_time_data_

type threadlocaleinfostruct
	refcount as long
	lc_codepage as ulong
	lc_collate_cp as ulong
	lc_handle(0 to 5) as ulong
	lc_id(0 to 5) as LC_ID
	lc_category(0 to 5) as threadlocaleinfostruct_lc_category
	lc_clike as long
	mb_cur_max as long
	lconv_intl_refcount as long ptr
	lconv_num_refcount as long ptr
	lconv_mon_refcount as long ptr
	lconv as lconv ptr
	ctype1_refcount as long ptr
	ctype1 as ushort ptr
	pctype as const ushort ptr
	pclmap as const ubyte ptr
	pcumap as const ubyte ptr
	lc_time_curr as __lc_time_data ptr
end type

type threadlocinfo as threadlocaleinfostruct
#define __crt_typefix(ctype)
