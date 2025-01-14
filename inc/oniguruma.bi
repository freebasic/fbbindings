' FreeBASIC binding for oniguruma-6.9.10
'
'based on the C header files:
'Oniguruma is a modern and flexible regular expressions library. 
'It encompasses features from different regular expression 
'implementations that traditionally exist in different languages.
'Copyright (c) 2002-2021  K.Kosako  <kkosako0@gmail.com>
'All rights reserved.
'
'Redistribution and use in source and binary forms, with or without
'modification, are permitted provided that the following conditions
'are met:
'1. Redistributions of source code must retain the above copyright
'   notice, this list of conditions and the following disclaimer.
'2. Redistributions in binary form must reproduce the above copyright
'   notice, this list of conditions and the following disclaimer in the
'   documentation and/or other materials provided with the distribution.
'THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
'ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
'IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
'ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
'FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
'DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
'OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
'HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
'LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
'OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
'SUCH DAMAGE.
'
'translated to FreeBASIC by:
' FreeBASIC development team

#pragma once
#ifndef ONIGURUMA_H
#define ONIGURUMA_H
#include once "crt/long.bi"
#inclib "onig"
extern "C"


#define ONIGURUMA
const ONIGURUMA_VERSION_MAJOR = 6
const ONIGURUMA_VERSION_MINOR = 9
const ONIGURUMA_VERSION_TEENY = 9
const ONIGURUMA_VERSION_INT = 60909
#define P_(args) args
#define PV_(args) args
#define ONIG_VARIADIC_FUNC_ATTR

type UChar as OnigUChar
type OnigCodePoint as ulong
type OnigUChar as ubyte
type OnigCtype as ulong
type OnigLen as ulong
const ONIG_INFINITE_DISTANCE = not cast(OnigLen, 0)
type OnigCaseFoldType as ulong
extern OnigDefaultCaseFoldFlag as OnigCaseFoldType

const ONIGENC_CASE_FOLD_ASCII_ONLY = 1
const ONIGENC_CASE_FOLD_TURKISH_AZERI = 1 shl 20
const INTERNAL_ONIGENC_CASE_FOLD_MULTI_CHAR = 1 shl 30
const ONIGENC_CASE_FOLD_MIN = INTERNAL_ONIGENC_CASE_FOLD_MULTI_CHAR
extern ONIGENC_CASE_FOLD_DEFAULT alias "OnigDefaultCaseFoldFlag" as OnigCaseFoldType
const ONIGENC_MAX_COMP_CASE_FOLD_CODE_LEN = 3
const ONIGENC_GET_CASE_FOLD_CODES_MAX_NUM = 13
#define ONIGENC_CODE_RANGE_NUM(range) clng(range[0])
#define ONIGENC_CODE_RANGE_FROM(range, i) range[(((i) * 2) + 1)]
#define ONIGENC_CODE_RANGE_TO(range, i) range[(((i) * 2) + 2)]

type OnigCaseFoldCodeItem
   byte_len as long
   code_len as long
   code(0 to 2) as OnigCodePoint
end type

type OnigMetaCharTableType
   esc as OnigCodePoint
   anychar as OnigCodePoint
   anytime as OnigCodePoint
   zero_or_one_time as OnigCodePoint
   one_or_more_time as OnigCodePoint
   anychar_anytime as OnigCodePoint
end type

type OnigApplyAllCaseFoldFunc as function(byval from as OnigCodePoint, byval to as OnigCodePoint ptr, byval to_len as long, byval arg as any ptr) as long

Type OnigEncodingTypeST
   mbc_enc_len as function(byval p as const OnigUChar ptr) as long
   name_ as const zstring ptr
   max_enc_len as long
   min_enc_len as long
   is_mbc_newline as function(byval p as const OnigUChar ptr, byval end_ as const OnigUChar ptr) as long
   mbc_to_code as function(byval p as const OnigUChar ptr, byval end_ as const OnigUChar ptr) as OnigCodePoint
   code_to_mbclen as function(byval code as OnigCodePoint) as long
   code_to_mbc as function(byval code as OnigCodePoint, byval buf as OnigUChar ptr) as long
   mbc_case_fold as function(byval flag as OnigCaseFoldType, byval pp as const OnigUChar ptr ptr, byval end_ as const OnigUChar ptr, byval to as OnigUChar ptr) as long
   apply_all_case_fold as function(byval flag as OnigCaseFoldType, byval f as OnigApplyAllCaseFoldFunc, byval arg as any ptr) as long
   get_case_fold_codes_by_str as function(byval flag as OnigCaseFoldType, byval p as const OnigUChar ptr, byval end_ as const OnigUChar ptr, byval acs as OnigCaseFoldCodeItem ptr) as long
   property_name_to_ctype As Function(ByVal enc As OnigEncodingTypeST Ptr, ByVal p As OnigUChar Ptr, ByVal end_ As OnigUChar Ptr) As Long
   is_code_ctype as function(byval code as OnigCodePoint, byval ctype as OnigCtype) as long
   get_ctype_code_range as function(byval ctype as OnigCtype, byval sb_out as OnigCodePoint ptr, byval ranges as const OnigCodePoint ptr ptr) as long
   left_adjust_char_head as function(byval start as const OnigUChar ptr, byval p as const OnigUChar ptr) as OnigUChar ptr
   is_allowed_reverse_match as function(byval p as const OnigUChar ptr, byval end_ as const OnigUChar ptr) as long
   init as function() as long
   is_initialized as function() as long
   is_valid_mbc_string as function(byval s as const OnigUChar ptr, byval end_ as const OnigUChar ptr) as long
   flag as ulong
   sb_range as OnigCodePoint
   index as long
end type

Type OnigEncodingType As OnigEncodingTypeST
Type OnigEncoding As OnigEncodingType Ptr
extern OnigEncodingASCII as OnigEncodingType
extern OnigEncodingISO_8859_1 as OnigEncodingType
extern OnigEncodingISO_8859_2 as OnigEncodingType
extern OnigEncodingISO_8859_3 as OnigEncodingType
extern OnigEncodingISO_8859_4 as OnigEncodingType
extern OnigEncodingISO_8859_5 as OnigEncodingType
extern OnigEncodingISO_8859_6 as OnigEncodingType
extern OnigEncodingISO_8859_7 as OnigEncodingType
extern OnigEncodingISO_8859_8 as OnigEncodingType
extern OnigEncodingISO_8859_9 as OnigEncodingType
extern OnigEncodingISO_8859_10 as OnigEncodingType
extern OnigEncodingISO_8859_11 as OnigEncodingType
extern OnigEncodingISO_8859_13 as OnigEncodingType
extern OnigEncodingISO_8859_14 as OnigEncodingType
extern OnigEncodingISO_8859_15 as OnigEncodingType
extern OnigEncodingISO_8859_16 as OnigEncodingType
extern OnigEncodingUTF8 as OnigEncodingType
extern OnigEncodingUTF16_BE as OnigEncodingType
extern OnigEncodingUTF16_LE as OnigEncodingType
extern OnigEncodingUTF32_BE as OnigEncodingType
extern OnigEncodingUTF32_LE as OnigEncodingType
extern OnigEncodingEUC_JP as OnigEncodingType
extern OnigEncodingEUC_TW as OnigEncodingType
extern OnigEncodingEUC_KR as OnigEncodingType
extern OnigEncodingEUC_CN as OnigEncodingType
extern OnigEncodingSJIS as OnigEncodingType
extern OnigEncodingKOI8 as OnigEncodingType
extern OnigEncodingKOI8_R as OnigEncodingType
extern OnigEncodingCP1251 as OnigEncodingType
extern OnigEncodingBIG5 as OnigEncodingType
extern OnigEncodingGB18030 as OnigEncodingType

#define ONIG_ENCODING_ASCII (@OnigEncodingASCII)
#define ONIG_ENCODING_ISO_8859_1 (@OnigEncodingISO_8859_1)
#define ONIG_ENCODING_ISO_8859_2 (@OnigEncodingISO_8859_2)
#define ONIG_ENCODING_ISO_8859_3 (@OnigEncodingISO_8859_3)
#define ONIG_ENCODING_ISO_8859_4 (@OnigEncodingISO_8859_4)
#define ONIG_ENCODING_ISO_8859_5 (@OnigEncodingISO_8859_5)
#define ONIG_ENCODING_ISO_8859_6 (@OnigEncodingISO_8859_6)
#define ONIG_ENCODING_ISO_8859_7 (@OnigEncodingISO_8859_7)
#define ONIG_ENCODING_ISO_8859_8 (@OnigEncodingISO_8859_8)
#define ONIG_ENCODING_ISO_8859_9 (@OnigEncodingISO_8859_9)
#define ONIG_ENCODING_ISO_8859_10 (@OnigEncodingISO_8859_10)
#define ONIG_ENCODING_ISO_8859_11 (@OnigEncodingISO_8859_11)
#define ONIG_ENCODING_ISO_8859_13 (@OnigEncodingISO_8859_13)
#define ONIG_ENCODING_ISO_8859_14 (@OnigEncodingISO_8859_14)
#define ONIG_ENCODING_ISO_8859_15 (@OnigEncodingISO_8859_15)
#define ONIG_ENCODING_ISO_8859_16 (@OnigEncodingISO_8859_16)
#define ONIG_ENCODING_UTF8 (@OnigEncodingUTF8)
#define ONIG_ENCODING_UTF16_BE (@OnigEncodingUTF16_BE)
#define ONIG_ENCODING_UTF16_LE (@OnigEncodingUTF16_LE)
#define ONIG_ENCODING_UTF32_BE (@OnigEncodingUTF32_BE)
#define ONIG_ENCODING_UTF32_LE (@OnigEncodingUTF32_LE)
#define ONIG_ENCODING_EUC_JP (@OnigEncodingEUC_JP)
#define ONIG_ENCODING_EUC_TW (@OnigEncodingEUC_TW)
#define ONIG_ENCODING_EUC_KR (@OnigEncodingEUC_KR)
#define ONIG_ENCODING_EUC_CN (@OnigEncodingEUC_CN)
#define ONIG_ENCODING_SJIS (@OnigEncodingSJIS)
#define ONIG_ENCODING_KOI8 (@OnigEncodingKOI8)
#define ONIG_ENCODING_KOI8_R (@OnigEncodingKOI8_R)
#define ONIG_ENCODING_CP1251 (@OnigEncodingCP1251)
#define ONIG_ENCODING_BIG5 (@OnigEncodingBIG5)
#define ONIG_ENCODING_GB18030 (@OnigEncodingGB18030)
const ONIG_ENCODING_UNDEF = cast(OnigEncoding, 0)
const ONIGENC_CODE_TO_MBC_MAXLEN = 7
const ONIGENC_MBC_CASE_FOLD_MAXLEN = 18

type OnigEncCtype as long
enum
   ONIGENC_CTYPE_NEWLINE = 0
   ONIGENC_CTYPE_ALPHA = 1
   ONIGENC_CTYPE_BLANK = 2
   ONIGENC_CTYPE_CNTRL = 3
   ONIGENC_CTYPE_DIGIT = 4
   ONIGENC_CTYPE_GRAPH = 5
   ONIGENC_CTYPE_LOWER = 6
   ONIGENC_CTYPE_PRINT = 7
   ONIGENC_CTYPE_PUNCT = 8
   ONIGENC_CTYPE_SPACE = 9
   ONIGENC_CTYPE_UPPER = 10
   ONIGENC_CTYPE_XDIGIT = 11
   ONIGENC_CTYPE_WORD = 12
   ONIGENC_CTYPE_ALNUM = 13
   ONIGENC_CTYPE_ASCII = 14
end enum

const ONIGENC_MAX_STD_CTYPE = ONIGENC_CTYPE_ASCII
#define onig_enc_len(enc, p, end_) ONIGENC_MBC_ENC_LEN(enc, p)
#define ONIGENC_IS_UNDEF(enc) ((enc) = ONIG_ENCODING_UNDEF)
#define ONIGENC_IS_SINGLEBYTE(enc) (ONIGENC_MBC_MAXLEN(enc) = 1)
#define ONIGENC_IS_MBC_HEAD(enc, p) (ONIGENC_MBC_ENC_LEN(enc, p) <> 1)
#define ONIGENC_IS_MBC_ASCII(p) ((*(p)) < 128)
#define ONIGENC_IS_CODE_ASCII(code) ((code) < 128)
#define ONIGENC_IS_MBC_WORD(enc, s, end_) ONIGENC_IS_CODE_WORD(enc, ONIGENC_MBC_TO_CODE(enc, s, end_))
#define ONIGENC_IS_MBC_WORD_ASCII(enc, s, end_) onigenc_is_mbc_word_ascii(enc, s, end_)
#define ONIGENC_NAME(enc) (enc)->name_
#define ONIGENC_MBC_CASE_FOLD(enc, flag, pp, end_, buf) (enc)->mbc_case_fold(flag, cptr(const OnigUChar ptr ptr, pp), end_, buf)
#define ONIGENC_IS_ALLOWED_REVERSE_MATCH(enc, s, end_) (enc)->is_allowed_reverse_match(s, end_)
#define ONIGENC_LEFT_ADJUST_CHAR_HEAD(enc, start, s) (enc)->left_adjust_char_head(start, s)
#define ONIGENC_IS_VALID_MBC_STRING(enc, s, end_) (enc)->is_valid_mbc_string(s, end_)
#define ONIGENC_APPLY_ALL_CASE_FOLD(enc, case_fold_flag, f, arg) (enc)->apply_all_case_fold(case_fold_flag, f, arg)
#define ONIGENC_GET_CASE_FOLD_CODES_BY_STR(enc, case_fold_flag, p, end_, acs) (enc)->get_case_fold_codes_by_str(case_fold_flag, p, end_, acs)
'#define ONIGENC_STEP_BACK(enc, start, s, n) onigenc_step_back((enc), (start), (s), (n))
#define ONIGENC_MBC_ENC_LEN(enc, p) (enc)->mbc_enc_len(p)
#define ONIGENC_MBC_MAXLEN(enc) (enc)->max_enc_len
#define ONIGENC_MBC_MAXLEN_DIST(enc) ONIGENC_MBC_MAXLEN(enc)
#define ONIGENC_MBC_MINLEN(enc) (enc)->min_enc_len
#define ONIGENC_IS_MBC_NEWLINE(enc, p, end_) (enc)->is_mbc_newline((p), (end_))
#define ONIGENC_MBC_TO_CODE(enc, p, end_) (enc)->mbc_to_code((p), (end_))
#define ONIGENC_CODE_TO_MBCLEN(enc, code) (enc)->code_to_mbclen(code)
#define ONIGENC_CODE_TO_MBC(enc, code, buf) (enc)->code_to_mbc(code, buf)
#define ONIGENC_PROPERTY_NAME_TO_CTYPE(enc, p, end_) (enc)->property_name_to_ctype(enc, p, end_)
#define ONIGENC_IS_CODE_CTYPE(enc, code, ctype) (enc)->is_code_ctype(code, ctype)
#define ONIGENC_IS_CODE_NEWLINE(enc, code) ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_NEWLINE)
#define ONIGENC_IS_CODE_GRAPH(enc, code) ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_GRAPH)
#define ONIGENC_IS_CODE_PRINT(enc, code) ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_PRINT)
#define ONIGENC_IS_CODE_ALNUM(enc, code) ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_ALNUM)
#define ONIGENC_IS_CODE_ALPHA(enc, code) ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_ALPHA)
#define ONIGENC_IS_CODE_LOWER(enc, code) ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_LOWER)
#define ONIGENC_IS_CODE_UPPER(enc, code) ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_UPPER)
#define ONIGENC_IS_CODE_CNTRL(enc, code) ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_CNTRL)
#define ONIGENC_IS_CODE_PUNCT(enc, code) ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_PUNCT)
#define ONIGENC_IS_CODE_SPACE(enc, code) ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_SPACE)
#define ONIGENC_IS_CODE_BLANK(enc, code) ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_BLANK)
#define ONIGENC_IS_CODE_DIGIT(enc, code) ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_DIGIT)
#define ONIGENC_IS_CODE_XDIGIT(enc, code) ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_XDIGIT)
#define ONIGENC_IS_CODE_WORD(enc, code) ONIGENC_IS_CODE_CTYPE(enc, code, ONIGENC_CTYPE_WORD)
#define ONIGENC_GET_CTYPE_CODE_RANGE(enc, ctype, sbout, ranges) (enc)->get_ctype_code_range(ctype, sbout, ranges)

Declare Function onigenc_step_back(ByVal enc As OnigEncoding, ByVal start As Const OnigUChar Ptr, ByVal s As Const OnigUChar Ptr, ByVal n As Long) As OnigUChar Ptr
declare function onigenc_init() as long
Declare Function onig_initialize_encoding(ByVal enc As OnigEncoding) As Long
Declare Function onigenc_set_default_encoding(ByVal enc As OnigEncoding) As Long
Declare Function onigenc_get_default_encoding() As OnigEncoding
declare sub onigenc_set_default_caseconv_table(byval table as const OnigUChar ptr)
declare function onigenc_get_right_adjust_char_head_with_prev(byval enc as OnigEncoding, byval start as const OnigUChar ptr, byval s as const OnigUChar ptr, byval prev as const OnigUChar ptr ptr) as OnigUChar ptr
declare function onigenc_get_prev_char_head(byval enc as OnigEncoding, byval start as const OnigUChar ptr, byval s as const OnigUChar ptr) as OnigUChar ptr
declare function onigenc_get_left_adjust_char_head(byval enc as OnigEncoding, byval start as const OnigUChar ptr, byval s as const OnigUChar ptr) as OnigUChar ptr
Declare Function onigenc_get_right_adjust_char_head(ByVal enc As OnigEncoding, ByVal start As Const OnigUChar Ptr, ByVal s As Const OnigUChar Ptr) As OnigUChar Ptr
declare function onigenc_strlen(byval enc as OnigEncoding, byval p as const OnigUChar ptr, byval end_ as const OnigUChar ptr) as long
declare function onigenc_strlen_null(byval enc as OnigEncoding, byval p as const OnigUChar ptr) as long
Declare Function onigenc_str_bytelen_null(ByVal enc As OnigEncoding, ByVal p As Const OnigUChar Ptr) As Long
'Declare Function onigenc_is_valid_mbc_string(ByVal enc As OnigEncoding , ByVal s As Const OnigUChar Ptr, ByVal end_ As Const OnigUChar Ptr) As Long
Declare Function onigenc_strdup(ByVal enc As OnigEncoding, ByVal s As Const OnigUChar Ptr, ByVal end_ As Const OnigUChar Ptr) As OnigUChar Ptr

const ONIG_NREGION = 10
const ONIG_MAX_CAPTURE_NUM = 2147483647
const ONIG_MAX_BACKREF_NUM = 1000
const ONIG_MAX_REPEAT_NUM = 100000
const ONIG_MAX_MULTI_BYTE_RANGES_NUM = 10000
const ONIG_MAX_ERROR_MESSAGE_LEN = 90
Type OnigOptionType As ULong
const ONIG_OPTION_NONE = 0u
const ONIG_OPTION_DEFAULT = ONIG_OPTION_NONE
const ONIG_OPTION_IGNORECASE = 1u
const ONIG_OPTION_EXTEND = culng(ONIG_OPTION_IGNORECASE shl 1)
const ONIG_OPTION_MULTILINE = culng(ONIG_OPTION_EXTEND shl 1)
const ONIG_OPTION_SINGLELINE = culng(ONIG_OPTION_MULTILINE shl 1)
const ONIG_OPTION_FIND_LONGEST = culng(ONIG_OPTION_SINGLELINE shl 1)
const ONIG_OPTION_FIND_NOT_EMPTY = culng(ONIG_OPTION_FIND_LONGEST shl 1)
const ONIG_OPTION_NEGATE_SINGLELINE = culng(ONIG_OPTION_FIND_NOT_EMPTY shl 1)
const ONIG_OPTION_DONT_CAPTURE_GROUP = culng(ONIG_OPTION_NEGATE_SINGLELINE shl 1)
const ONIG_OPTION_CAPTURE_GROUP = culng(ONIG_OPTION_DONT_CAPTURE_GROUP shl 1)
const ONIG_OPTION_NOTBOL = culng(ONIG_OPTION_CAPTURE_GROUP shl 1)
const ONIG_OPTION_NOTEOL = culng(ONIG_OPTION_NOTBOL shl 1)
const ONIG_OPTION_POSIX_REGION = culng(ONIG_OPTION_NOTEOL shl 1)
const ONIG_OPTION_CHECK_VALIDITY_OF_STRING = culng(ONIG_OPTION_POSIX_REGION shl 1)
const ONIG_OPTION_IGNORECASE_IS_ASCII = culng(ONIG_OPTION_CHECK_VALIDITY_OF_STRING shl 3)
const ONIG_OPTION_WORD_IS_ASCII = culng(ONIG_OPTION_IGNORECASE_IS_ASCII shl 1)
const ONIG_OPTION_DIGIT_IS_ASCII = culng(ONIG_OPTION_WORD_IS_ASCII shl 1)
const ONIG_OPTION_SPACE_IS_ASCII = culng(ONIG_OPTION_DIGIT_IS_ASCII shl 1)
const ONIG_OPTION_POSIX_IS_ASCII = culng(ONIG_OPTION_SPACE_IS_ASCII shl 1)
const ONIG_OPTION_TEXT_SEGMENT_EXTENDED_GRAPHEME_CLUSTER = culng(ONIG_OPTION_POSIX_IS_ASCII shl 1)
const ONIG_OPTION_TEXT_SEGMENT_WORD = culng(ONIG_OPTION_TEXT_SEGMENT_EXTENDED_GRAPHEME_CLUSTER shl 1)
const ONIG_OPTION_NOT_BEGIN_STRING = culng(ONIG_OPTION_TEXT_SEGMENT_WORD shl 1)
const ONIG_OPTION_NOT_END_STRING = culng(ONIG_OPTION_NOT_BEGIN_STRING shl 1)
const ONIG_OPTION_NOT_BEGIN_POSITION = culng(ONIG_OPTION_NOT_END_STRING shl 1)
const ONIG_OPTION_CALLBACK_EACH_MATCH = culng(ONIG_OPTION_NOT_BEGIN_POSITION shl 1)
const ONIG_OPTION_MATCH_WHOLE_STRING = culng(ONIG_OPTION_CALLBACK_EACH_MATCH shl 1)
const ONIG_OPTION_MAXBIT = ONIG_OPTION_MATCH_WHOLE_STRING
#define ONIG_OPTION_ON(options, regopt) scope : (options) or= (regopt) : end scope
#define ONIG_OPTION_OFF(options, regopt) scope : (options) and= not (regopt) : end scope
#define ONIG_IS_OPTION_ON(options, option) ((options) and (option))

type OnigSyntaxType
   op as ulong
   op2 as ulong
   behavior as ulong
   options As OnigOptionType
   meta_char_table as OnigMetaCharTableType
end type

extern OnigSyntaxASIS as OnigSyntaxType
extern OnigSyntaxPosixBasic as OnigSyntaxType
extern OnigSyntaxPosixExtended as OnigSyntaxType
extern OnigSyntaxEmacs as OnigSyntaxType
extern OnigSyntaxGrep as OnigSyntaxType
extern OnigSyntaxGnuRegex as OnigSyntaxType
extern OnigSyntaxJava as OnigSyntaxType
extern OnigSyntaxPerl as OnigSyntaxType
extern OnigSyntaxPerl_NG as OnigSyntaxType
extern OnigSyntaxRuby as OnigSyntaxType
extern OnigSyntaxPython as OnigSyntaxType
extern OnigSyntaxOniguruma as OnigSyntaxType

#define ONIG_SYNTAX_ASIS (@OnigSyntaxASIS)
#define ONIG_SYNTAX_POSIX_BASIC (@OnigSyntaxPosixBasic)
#define ONIG_SYNTAX_POSIX_EXTENDED (@OnigSyntaxPosixExtended)
#define ONIG_SYNTAX_EMACS (@OnigSyntaxEmacs)
#define ONIG_SYNTAX_GREP (@OnigSyntaxGrep)
#define ONIG_SYNTAX_GNU_REGEX (@OnigSyntaxGnuRegex)
#define ONIG_SYNTAX_JAVA (@OnigSyntaxJava)
#define ONIG_SYNTAX_PERL (@OnigSyntaxPerl)
#define ONIG_SYNTAX_PERL_NG (@OnigSyntaxPerl_NG)
#define ONIG_SYNTAX_RUBY (@OnigSyntaxRuby)
#define ONIG_SYNTAX_PYTHON (@OnigSyntaxPython)
#define ONIG_SYNTAX_ONIGURUMA (@OnigSyntaxOniguruma)
extern OnigDefaultSyntax as OnigSyntaxType ptr
extern ONIG_SYNTAX_DEFAULT alias "OnigDefaultSyntax" as OnigSyntaxType ptr
const ONIG_SYN_OP_VARIABLE_META_CHARACTERS = culng(1u shl 0)
const ONIG_SYN_OP_DOT_ANYCHAR = culng(1u shl 1)
const ONIG_SYN_OP_ASTERISK_ZERO_INF = culng(1u shl 2)
const ONIG_SYN_OP_ESC_ASTERISK_ZERO_INF = culng(1u shl 3)
const ONIG_SYN_OP_PLUS_ONE_INF = culng(1u shl 4)
const ONIG_SYN_OP_ESC_PLUS_ONE_INF = culng(1u shl 5)
const ONIG_SYN_OP_QMARK_ZERO_ONE = culng(1u shl 6)
const ONIG_SYN_OP_ESC_QMARK_ZERO_ONE = culng(1u shl 7)
const ONIG_SYN_OP_BRACE_INTERVAL = culng(1u shl 8)
const ONIG_SYN_OP_ESC_BRACE_INTERVAL = culng(1u shl 9)
const ONIG_SYN_OP_VBAR_ALT = culng(1u shl 10)
const ONIG_SYN_OP_ESC_VBAR_ALT = culng(1u shl 11)
const ONIG_SYN_OP_LPAREN_SUBEXP = culng(1u shl 12)
const ONIG_SYN_OP_ESC_LPAREN_SUBEXP = culng(1u shl 13)
const ONIG_SYN_OP_ESC_AZ_BUF_ANCHOR = culng(1u shl 14)
const ONIG_SYN_OP_ESC_CAPITAL_G_BEGIN_ANCHOR = culng(1u shl 15)
const ONIG_SYN_OP_DECIMAL_BACKREF = culng(1u shl 16)
const ONIG_SYN_OP_BRACKET_CC = culng(1u shl 17)
const ONIG_SYN_OP_ESC_W_WORD = culng(1u shl 18)
const ONIG_SYN_OP_ESC_LTGT_WORD_BEGIN_END = culng(1u shl 19)
const ONIG_SYN_OP_ESC_B_WORD_BOUND = culng(1u shl 20)
const ONIG_SYN_OP_ESC_S_WHITE_SPACE = culng(1u shl 21)
const ONIG_SYN_OP_ESC_D_DIGIT = culng(1u shl 22)
const ONIG_SYN_OP_LINE_ANCHOR = culng(1u shl 23)
const ONIG_SYN_OP_POSIX_BRACKET = culng(1u shl 24)
const ONIG_SYN_OP_QMARK_NON_GREEDY = culng(1u shl 25)
const ONIG_SYN_OP_ESC_CONTROL_CHARS = culng(1u shl 26)
const ONIG_SYN_OP_ESC_C_CONTROL = culng(1u shl 27)
const ONIG_SYN_OP_ESC_OCTAL3 = culng(1u shl 28)
const ONIG_SYN_OP_ESC_X_HEX2 = culng(1u shl 29)
const ONIG_SYN_OP_ESC_X_BRACE_HEX8 = culng(1u shl 30)
const ONIG_SYN_OP_ESC_O_BRACE_OCTAL = culng(1u shl 31)
const ONIG_SYN_OP2_ESC_CAPITAL_Q_QUOTE = culng(1u shl 0)
const ONIG_SYN_OP2_QMARK_GROUP_EFFECT = culng(1u shl 1)
const ONIG_SYN_OP2_OPTION_PERL = culng(1u shl 2)
const ONIG_SYN_OP2_OPTION_RUBY = culng(1u shl 3)
const ONIG_SYN_OP2_PLUS_POSSESSIVE_REPEAT = culng(1u shl 4)
const ONIG_SYN_OP2_PLUS_POSSESSIVE_INTERVAL = culng(1u shl 5)
const ONIG_SYN_OP2_CCLASS_SET_OP = culng(1u shl 6)
const ONIG_SYN_OP2_QMARK_LT_NAMED_GROUP = culng(1u shl 7)
const ONIG_SYN_OP2_ESC_K_NAMED_BACKREF = culng(1u shl 8)
const ONIG_SYN_OP2_ESC_G_SUBEXP_CALL = culng(1u shl 9)
const ONIG_SYN_OP2_ATMARK_CAPTURE_HISTORY = culng(1u shl 10)
const ONIG_SYN_OP2_ESC_CAPITAL_C_BAR_CONTROL = culng(1u shl 11)
const ONIG_SYN_OP2_ESC_CAPITAL_M_BAR_META = culng(1u shl 12)
const ONIG_SYN_OP2_ESC_V_VTAB = culng(1u shl 13)
const ONIG_SYN_OP2_ESC_U_HEX4 = culng(1u shl 14)
const ONIG_SYN_OP2_ESC_GNU_BUF_ANCHOR = culng(1u shl 15)
const ONIG_SYN_OP2_ESC_P_BRACE_CHAR_PROPERTY = culng(1u shl 16)
const ONIG_SYN_OP2_ESC_P_BRACE_CIRCUMFLEX_NOT = culng(1u shl 17)
const ONIG_SYN_OP2_ESC_H_XDIGIT = culng(1u shl 19)
const ONIG_SYN_OP2_INEFFECTIVE_ESCAPE = culng(1u shl 20)
const ONIG_SYN_OP2_QMARK_LPAREN_IF_ELSE = culng(1u shl 21)
const ONIG_SYN_OP2_ESC_CAPITAL_K_KEEP = culng(1u shl 22)
const ONIG_SYN_OP2_ESC_CAPITAL_R_GENERAL_NEWLINE = culng(1u shl 23)
const ONIG_SYN_OP2_ESC_CAPITAL_N_O_SUPER_DOT = culng(1u shl 24)
const ONIG_SYN_OP2_QMARK_TILDE_ABSENT_GROUP = culng(1u shl 25)
const ONIG_SYN_OP2_ESC_X_Y_GRAPHEME_CLUSTER = culng(1u shl 26)
const ONIG_SYN_OP2_ESC_X_Y_TEXT_SEGMENT = culng(1u shl 26)
const ONIG_SYN_OP2_QMARK_PERL_SUBEXP_CALL = culng(1u shl 27)
const ONIG_SYN_OP2_QMARK_BRACE_CALLOUT_CONTENTS = culng(1u shl 28)
const ONIG_SYN_OP2_ASTERISK_CALLOUT_NAME = culng(1u shl 29)
const ONIG_SYN_OP2_OPTION_ONIGURUMA = culng(1u shl 30)
const ONIG_SYN_OP2_QMARK_CAPITAL_P_NAME = culng(1u shl 31)
const ONIG_SYN_CONTEXT_INDEP_ANCHORS = culng(1u shl 31)
const ONIG_SYN_CONTEXT_INDEP_REPEAT_OPS = culng(1u shl 0)
const ONIG_SYN_CONTEXT_INVALID_REPEAT_OPS = culng(1u shl 1)
const ONIG_SYN_ALLOW_UNMATCHED_CLOSE_SUBEXP = culng(1u shl 2)
const ONIG_SYN_ALLOW_INVALID_INTERVAL = culng(1u shl 3)
const ONIG_SYN_ALLOW_INTERVAL_LOW_ABBREV = culng(1u shl 4)
const ONIG_SYN_STRICT_CHECK_BACKREF = culng(1u shl 5)
const ONIG_SYN_DIFFERENT_LEN_ALT_LOOK_BEHIND = culng(1u shl 6)
const ONIG_SYN_CAPTURE_ONLY_NAMED_GROUP = culng(1u shl 7)
const ONIG_SYN_ALLOW_MULTIPLEX_DEFINITION_NAME = culng(1u shl 8)
const ONIG_SYN_FIXED_INTERVAL_IS_GREEDY_ONLY = culng(1u shl 9)
const ONIG_SYN_ISOLATED_OPTION_CONTINUE_BRANCH = culng(1u shl 10)
const ONIG_SYN_VARIABLE_LEN_LOOK_BEHIND = culng(1u shl 11)
const ONIG_SYN_PYTHON = culng(1u shl 12)
const ONIG_SYN_WHOLE_OPTIONS = culng(1u shl 13)
const ONIG_SYN_BRE_ANCHOR_AT_EDGE_OF_SUBEXP = culng(1u shl 14)
const ONIG_SYN_NOT_NEWLINE_IN_NEGATIVE_CC = culng(1u shl 20)
const ONIG_SYN_BACKSLASH_ESCAPE_IN_CC = culng(1u shl 21)
const ONIG_SYN_ALLOW_EMPTY_RANGE_IN_CC = culng(1u shl 22)
const ONIG_SYN_ALLOW_DOUBLE_RANGE_OP_IN_CC = culng(1u shl 23)
const ONIG_SYN_ALLOW_INVALID_CODE_END_OF_RANGE_IN_CC = culng(1u shl 26)
const ONIG_SYN_WARN_CC_OP_NOT_ESCAPED = culng(1u shl 24)
const ONIG_SYN_WARN_REDUNDANT_NESTED_REPEAT = culng(1u shl 25)
const ONIG_META_CHAR_ESCAPE = 0
const ONIG_META_CHAR_ANYCHAR = 1
const ONIG_META_CHAR_ANYTIME = 2
const ONIG_META_CHAR_ZERO_OR_ONE_TIME = 3
const ONIG_META_CHAR_ONE_OR_MORE_TIME = 4
const ONIG_META_CHAR_ANYCHAR_ANYTIME = 5
const ONIG_INEFFECTIVE_META_CHAR = 0
#define ONIG_IS_PATTERN_ERROR(ecode) (((ecode) <= (-100)) andalso ((ecode) > (-1000)))
const ONIG_NORMAL = 0
const ONIG_VALUE_IS_NOT_SET = 1
const ONIG_MISMATCH = -1
const ONIG_NO_SUPPORT_CONFIG = -2
const ONIG_ABORT = -3
const ONIGERR_MEMORY = -5
const ONIGERR_TYPE_BUG = -6
const ONIGERR_PARSER_BUG = -11
const ONIGERR_STACK_BUG = -12
const ONIGERR_UNDEFINED_BYTECODE = -13
const ONIGERR_UNEXPECTED_BYTECODE = -14
const ONIGERR_MATCH_STACK_LIMIT_OVER = -15
const ONIGERR_PARSE_DEPTH_LIMIT_OVER = -16
const ONIGERR_RETRY_LIMIT_IN_MATCH_OVER = -17
const ONIGERR_RETRY_LIMIT_IN_SEARCH_OVER = -18
const ONIGERR_SUBEXP_CALL_LIMIT_IN_SEARCH_OVER = -19
const ONIGERR_DEFAULT_ENCODING_IS_NOT_SETTED = -21
const ONIGERR_DEFAULT_ENCODING_IS_NOT_SET = -21
const ONIGERR_SPECIFIED_ENCODING_CANT_CONVERT_TO_WIDE_CHAR = -22
const ONIGERR_FAIL_TO_INITIALIZE = -23
const ONIGERR_INVALID_ARGUMENT = -30
const ONIGERR_END_PATTERN_AT_LEFT_BRACE = -100
const ONIGERR_END_PATTERN_AT_LEFT_BRACKET = -101
const ONIGERR_EMPTY_CHAR_CLASS = -102
const ONIGERR_PREMATURE_END_OF_CHAR_CLASS = -103
const ONIGERR_END_PATTERN_AT_ESCAPE = -104
const ONIGERR_END_PATTERN_AT_META = -105
const ONIGERR_END_PATTERN_AT_CONTROL = -106
const ONIGERR_META_CODE_SYNTAX = -108
const ONIGERR_CONTROL_CODE_SYNTAX = -109
const ONIGERR_CHAR_CLASS_VALUE_AT_END_OF_RANGE = -110
const ONIGERR_CHAR_CLASS_VALUE_AT_START_OF_RANGE = -111
const ONIGERR_UNMATCHED_RANGE_SPECIFIER_IN_CHAR_CLASS = -112
const ONIGERR_TARGET_OF_REPEAT_OPERATOR_NOT_SPECIFIED = -113
const ONIGERR_TARGET_OF_REPEAT_OPERATOR_INVALID = -114
const ONIGERR_NESTED_REPEAT_OPERATOR = -115
const ONIGERR_UNMATCHED_CLOSE_PARENTHESIS = -116
const ONIGERR_END_PATTERN_WITH_UNMATCHED_PARENTHESIS = -117
const ONIGERR_END_PATTERN_IN_GROUP = -118
const ONIGERR_UNDEFINED_GROUP_OPTION = -119
const ONIGERR_INVALID_GROUP_OPTION = -120
const ONIGERR_INVALID_POSIX_BRACKET_TYPE = -121
const ONIGERR_INVALID_LOOK_BEHIND_PATTERN = -122
const ONIGERR_INVALID_REPEAT_RANGE_PATTERN = -123
const ONIGERR_TOO_BIG_NUMBER = -200
const ONIGERR_TOO_BIG_NUMBER_FOR_REPEAT_RANGE = -201
const ONIGERR_UPPER_SMALLER_THAN_LOWER_IN_REPEAT_RANGE = -202
const ONIGERR_EMPTY_RANGE_IN_CHAR_CLASS = -203
const ONIGERR_MISMATCH_CODE_LENGTH_IN_CLASS_RANGE = -204
const ONIGERR_TOO_MANY_MULTI_BYTE_RANGES = -205
const ONIGERR_TOO_SHORT_MULTI_BYTE_STRING = -206
const ONIGERR_TOO_BIG_BACKREF_NUMBER = -207
const ONIGERR_INVALID_BACKREF = -208
const ONIGERR_NUMBERED_BACKREF_OR_CALL_NOT_ALLOWED = -209
const ONIGERR_TOO_MANY_CAPTURES = -210
const ONIGERR_TOO_LONG_WIDE_CHAR_VALUE = -212
const ONIGERR_UNDEFINED_OPERATOR = -213
const ONIGERR_EMPTY_GROUP_NAME = -214
const ONIGERR_INVALID_GROUP_NAME = -215
const ONIGERR_INVALID_CHAR_IN_GROUP_NAME = -216
const ONIGERR_UNDEFINED_NAME_REFERENCE = -217
const ONIGERR_UNDEFINED_GROUP_REFERENCE = -218
const ONIGERR_MULTIPLEX_DEFINED_NAME = -219
const ONIGERR_MULTIPLEX_DEFINITION_NAME_CALL = -220
const ONIGERR_NEVER_ENDING_RECURSION = -221
const ONIGERR_GROUP_NUMBER_OVER_FOR_CAPTURE_HISTORY = -222
const ONIGERR_INVALID_CHAR_PROPERTY_NAME = -223
const ONIGERR_INVALID_IF_ELSE_SYNTAX = -224
const ONIGERR_INVALID_ABSENT_GROUP_PATTERN = -225
const ONIGERR_INVALID_ABSENT_GROUP_GENERATOR_PATTERN = -226
const ONIGERR_INVALID_CALLOUT_PATTERN = -227
const ONIGERR_INVALID_CALLOUT_NAME = -228
const ONIGERR_UNDEFINED_CALLOUT_NAME = -229
const ONIGERR_INVALID_CALLOUT_BODY = -230
const ONIGERR_INVALID_CALLOUT_TAG_NAME = -231
const ONIGERR_INVALID_CALLOUT_ARG = -232
const ONIGERR_INVALID_CODE_POINT_VALUE = -400
const ONIGERR_INVALID_WIDE_CHAR_VALUE = -400
const ONIGERR_TOO_BIG_WIDE_CHAR_VALUE = -401
const ONIGERR_NOT_SUPPORTED_ENCODING_COMBINATION = -402
const ONIGERR_INVALID_COMBINATION_OF_OPTIONS = -403
const ONIGERR_TOO_MANY_USER_DEFINED_OBJECTS = -404
const ONIGERR_TOO_LONG_PROPERTY_NAME = -405
const ONIGERR_VERY_INEFFICIENT_PATTERN = -406
const ONIGERR_LIBRARY_IS_NOT_INITIALIZED = -500
const ONIG_MAX_CAPTURE_HISTORY_GROUP = 31
#define ONIG_IS_CAPTURE_HISTORY_GROUP(r, i) ((((i) <= ONIG_MAX_CAPTURE_HISTORY_GROUP) andalso (r)->list) andalso (r)->list[i])

type OnigCaptureTreeNodeStruct
   group as long
   beg as long
   end_ as long
   allocated as long
   num_childs as long
   childs as OnigCaptureTreeNodeStruct ptr ptr
end type

type OnigCaptureTreeNode as OnigCaptureTreeNodeStruct

type re_registers
   allocated as long
   num_regs as long
   beg as long ptr
   end_ as long ptr
   history_root as OnigCaptureTreeNode ptr
end type

const ONIG_TRAVERSE_CALLBACK_AT_FIRST = 1
const ONIG_TRAVERSE_CALLBACK_AT_LAST = 2
const ONIG_TRAVERSE_CALLBACK_AT_BOTH = ONIG_TRAVERSE_CALLBACK_AT_FIRST or ONIG_TRAVERSE_CALLBACK_AT_LAST
const ONIG_REGION_NOTPOS = -1
type OnigRegion as re_registers

type OnigErrorInfo
   enc as OnigEncoding
   par as OnigUChar ptr
   par_end as OnigUChar ptr
end type

type OnigRepeatRange
   lower as long
   upper as long
end type

type OnigWarnFunc as sub(byval s as const zstring ptr)
Declare Sub onig_null_warn(ByVal s As Const ZString Ptr)
const ONIG_CHAR_TABLE_SIZE = 256
type OnigRegexType as re_pattern_buffer
type OnigRegex as OnigRegexType ptr
type regex_t as OnigRegexType
type OnigRegSet as OnigRegSetStruct

type OnigRegSetLead as long
enum
   ONIG_REGSET_POSITION_LEAD = 0
   ONIG_REGSET_REGEX_LEAD = 1
   ONIG_REGSET_PRIORITY_TO_REGEX_ORDER = 2
end enum

type OnigCompileInfo
   num_of_elements as long
   pattern_enc as OnigEncoding
   target_enc as OnigEncoding
   syntax as OnigSyntaxType ptr
   option As OnigOptionType
   case_fold_flag as OnigCaseFoldType
end type

type OnigCallbackEachMatchFunc as function(byval str_ as const OnigUChar ptr, byval end_ as const OnigUChar ptr, byval match_start as const OnigUChar ptr, byval region as OnigRegion ptr, byval user_data as any ptr) as long

type OnigCalloutIn as long
enum
   ONIG_CALLOUT_IN_PROGRESS = 1
   ONIG_CALLOUT_IN_RETRACTION = 2
end enum

const ONIG_CALLOUT_IN_BOTH = ONIG_CALLOUT_IN_PROGRESS or ONIG_CALLOUT_IN_RETRACTION

type OnigCalloutOf as long
enum
   ONIG_CALLOUT_OF_CONTENTS = 0
   ONIG_CALLOUT_OF_NAME = 1
end enum

type OnigCalloutType as long
enum
   ONIG_CALLOUT_TYPE_SINGLE = 0
   ONIG_CALLOUT_TYPE_START_CALL = 1
   ONIG_CALLOUT_TYPE_BOTH_CALL = 2
   ONIG_CALLOUT_TYPE_START_MARK_END_CALL = 3
end enum

const ONIG_NON_NAME_ID = -1
const ONIG_NON_CALLOUT_NUM = 0
const ONIG_CALLOUT_MAX_ARGS_NUM = 4
const ONIG_CALLOUT_DATA_SLOT_NUM = 5
type OnigCalloutArgs as OnigCalloutArgsStruct
type OnigCalloutFunc as function(byval args as OnigCalloutArgs ptr, byval user_data as any ptr) as long

type OnigCalloutResult as long
enum
   ONIG_CALLOUT_FAIL = 1
   ONIG_CALLOUT_SUCCESS = 0
end enum

type OnigType as long
enum
   ONIG_TYPE_VOID = 0
   ONIG_TYPE_LONG = 1 shl 0
   ONIG_TYPE_CHAR = 1 shl 1
   ONIG_TYPE_STRING = 1 shl 2
   ONIG_TYPE_POINTER = 1 shl 3
   ONIG_TYPE_TAG = 1 shl 4
end enum

type OnigValue_s
   start as OnigUChar ptr
   end_ as OnigUChar ptr
end type

union OnigValue
   l as clong
   c as OnigCodePoint
   s as OnigValue_s
   p As Any Ptr
   tag as long
end union

type OnigMatchParam as OnigMatchParamStruct
Declare Function onig_initialize(ByVal encodings As OnigEncoding Ptr, ByVal number_of_encodings As Long) As Long
Declare Function onig_init() As Long
declare function onig_error_code_to_str(byval s as OnigUChar ptr, byval err_code as long, ...) as long
declare function onig_is_error_code_needs_param(byval code as long) as long
Declare Sub onig_set_warn_func(ByVal f As OnigWarnFunc)
declare sub onig_set_verb_warn_func(byval f as OnigWarnFunc)
Declare Function onig_new(ByVal As OnigRegex Ptr, ByVal PATTERN As Const OnigUChar Ptr, ByVal pattern_end As Const OnigUChar Ptr, ByVal option As OnigOptionType, ByVal enc As OnigEncoding, ByVal syntax As OnigSyntaxType Ptr, ByVal einfo As OnigErrorInfo Ptr) As Long
Declare Function onig_reg_init(ByVal reg As OnigRegex, ByVal option As OnigOptionType, ByVal case_fold_flag As OnigCaseFoldType, ByVal enc As OnigEncoding, ByVal syntax As OnigSyntaxType Ptr) As Long
Declare Function onig_new_without_alloc(ByVal As OnigRegex, ByVal PATTERN As Const OnigUChar Ptr, ByVal pattern_end As Const OnigUChar Ptr, ByVal option As OnigOptionType, ByVal enc As OnigEncoding, ByVal syntax As OnigSyntaxType Ptr, ByVal einfo As OnigErrorInfo Ptr) As Long
Declare Function onig_new_deluxe(ByVal reg As OnigRegex Ptr, ByVal PATTERN As Const OnigUChar Ptr, ByVal pattern_end As Const OnigUChar Ptr, ByVal ci As OnigCompileInfo Ptr, ByVal einfo As OnigErrorInfo Ptr) As Long
Declare Sub onig_free(ByVal As OnigRegex)
declare sub onig_free_body(byval as OnigRegex)
declare function onig_scan(byval reg as OnigRegex, byval str_ as const OnigUChar ptr, byval end_ as const OnigUChar ptr, byval region as OnigRegion ptr, byval option as OnigOptionType, byval scan_callback as function(byval as long, byval as long, byval as OnigRegion ptr, byval as any ptr) as long, byval callback_arg as any ptr) as long
declare function onig_search(byval as OnigRegex, byval str_ as const OnigUChar ptr, byval end_ as const OnigUChar ptr, byval start as const OnigUChar ptr, byval range as const OnigUChar ptr, byval region as OnigRegion ptr, byval option as OnigOptionType) as long
declare function onig_search_with_param(byval as OnigRegex, byval str_ as const OnigUChar ptr, byval end_ as const OnigUChar ptr, byval start as const OnigUChar ptr, byval range as const OnigUChar ptr, byval region as OnigRegion ptr, byval option as OnigOptionType, byval mp as OnigMatchParam ptr) as long
declare function onig_match(byval as OnigRegex, byval str_ as const OnigUChar ptr, byval end_ as const OnigUChar ptr, byval at as const OnigUChar ptr, byval region as OnigRegion ptr, byval option as OnigOptionType) as long
declare function onig_match_with_param(byval as OnigRegex, byval str_ as const OnigUChar ptr, byval end_ as const OnigUChar ptr, byval at as const OnigUChar ptr, byval region as OnigRegion ptr, byval option as OnigOptionType, byval mp as OnigMatchParam ptr) as long
declare function onig_regset_new(byval rset as OnigRegSet ptr ptr, byval n as long, byval regs as OnigRegex ptr) as long
declare function onig_regset_add(byval set as OnigRegSet ptr, byval reg as OnigRegex) as long
declare function onig_regset_replace(byval set as OnigRegSet ptr, byval at as long, byval reg as OnigRegex) as long
declare sub onig_regset_free(byval set as OnigRegSet ptr)
declare function onig_regset_number_of_regex(byval set as OnigRegSet ptr) as long
declare function onig_regset_get_regex(byval set as OnigRegSet ptr, byval at as long) as OnigRegex
declare function onig_regset_get_region(byval set as OnigRegSet ptr, byval at as long) as OnigRegion ptr
declare function onig_regset_search(byval set as OnigRegSet ptr, byval str_ as const OnigUChar ptr, byval end_ as const OnigUChar ptr, byval start as const OnigUChar ptr, byval range as const OnigUChar ptr, byval lead as OnigRegSetLead, byval option as OnigOptionType, byval rmatch_pos as long ptr) as long
declare function onig_regset_search_with_param(byval set as OnigRegSet ptr, byval str_ as const OnigUChar ptr, byval end_ as const OnigUChar ptr, byval start as const OnigUChar ptr, byval range as const OnigUChar ptr, byval lead as OnigRegSetLead, byval option as OnigOptionType, byval mps as OnigMatchParam ptr ptr, byval rmatch_pos as long ptr) as long
Declare Function onig_region_new() As OnigRegion Ptr
declare sub onig_region_init(byval region as OnigRegion ptr)
declare sub onig_region_free(byval region as OnigRegion ptr, byval free_self as long)
declare sub onig_region_copy(byval to as OnigRegion ptr, byval from as OnigRegion ptr)
declare sub onig_region_clear(byval region as OnigRegion ptr)
declare function onig_region_resize(byval region as OnigRegion ptr, byval n as long) as long
declare function onig_region_set(byval region as OnigRegion ptr, byval at as long, byval beg as long, byval end_ as long) as long
declare function onig_name_to_group_numbers(byval reg as OnigRegex, byval name_ as const OnigUChar ptr, byval name_end as const OnigUChar ptr, byval nums as long ptr ptr) as long
declare function onig_name_to_backref_number(byval reg as OnigRegex, byval name_ as const OnigUChar ptr, byval name_end as const OnigUChar ptr, byval region as OnigRegion ptr) as long
declare function onig_foreach_name(byval reg as OnigRegex, byval func as function(byval as const OnigUChar ptr, byval as const OnigUChar ptr, byval as long, byval as long ptr, byval as OnigRegex, byval as any ptr) as long, byval arg as any ptr) as long
declare function onig_number_of_names(byval reg as OnigRegex) as long
declare function onig_number_of_captures(byval reg as OnigRegex) as long
declare function onig_number_of_capture_histories(byval reg as OnigRegex) as long
declare function onig_get_capture_tree(byval region as OnigRegion ptr) as OnigCaptureTreeNode ptr
declare function onig_capture_tree_traverse(byval region as OnigRegion ptr, byval at as long, byval callback_func as function(byval as long, byval as long, byval as long, byval as long, byval as long, byval as any ptr) as long, byval arg as any ptr) as long
declare function onig_noname_group_capture_is_active(byval reg as OnigRegex) as long
declare function onig_get_encoding(byval reg as OnigRegex) as OnigEncoding
declare function onig_get_options(byval reg as OnigRegex) as OnigOptionType
declare function onig_get_case_fold_flag(byval reg as OnigRegex) as OnigCaseFoldType
declare function onig_get_syntax(byval reg as OnigRegex) as OnigSyntaxType ptr
declare function onig_set_default_syntax(byval syntax as OnigSyntaxType ptr) as long
declare sub onig_copy_syntax(byval to as OnigSyntaxType ptr, byval from as OnigSyntaxType ptr)
declare function onig_get_syntax_op(byval syntax as OnigSyntaxType ptr) as ulong
declare function onig_get_syntax_op2(byval syntax as OnigSyntaxType ptr) as ulong
declare function onig_get_syntax_behavior(byval syntax as OnigSyntaxType ptr) as ulong
declare function onig_get_syntax_options(byval syntax as OnigSyntaxType ptr) as OnigOptionType
declare sub onig_set_syntax_op(byval syntax as OnigSyntaxType ptr, byval op as ulong)
declare sub onig_set_syntax_op2(byval syntax as OnigSyntaxType ptr, byval op2 as ulong)
declare sub onig_set_syntax_behavior(byval syntax as OnigSyntaxType ptr, byval behavior as ulong)
declare sub onig_set_syntax_options(byval syntax as OnigSyntaxType ptr, byval options as OnigOptionType)
declare function onig_set_meta_char(byval syntax as OnigSyntaxType ptr, byval what as ulong, byval code as OnigCodePoint) as long
declare sub onig_copy_encoding(byval to as OnigEncoding, byval from as OnigEncoding)
declare function onig_get_default_case_fold_flag() as OnigCaseFoldType
declare function onig_set_default_case_fold_flag(byval case_fold_flag as OnigCaseFoldType) as long
declare function onig_get_match_stack_limit_size() as ulong
declare function onig_set_match_stack_limit_size(byval size as ulong) as long
declare function onig_get_retry_limit_in_match() as culong
declare function onig_set_retry_limit_in_match(byval n as culong) as long
declare function onig_get_retry_limit_in_search() as culong
declare function onig_set_retry_limit_in_search(byval n as culong) as long
declare function onig_get_parse_depth_limit() as ulong
declare function onig_set_capture_num_limit(byval num as long) as long
declare function onig_set_parse_depth_limit(byval depth as ulong) as long
declare function onig_get_subexp_call_limit_in_search() as culong
declare function onig_set_subexp_call_limit_in_search(byval n as culong) as long
declare function onig_get_subexp_call_max_nest_level() as long
declare function onig_set_subexp_call_max_nest_level(byval level as long) as long
declare function onig_unicode_define_user_property(byval name_ as const zstring ptr, byval ranges as OnigCodePoint ptr) as long
declare function onig_end() as long
declare function onig_version() as const zstring ptr
declare function onig_copyright() as const zstring ptr
declare function onig_get_callback_each_match() as OnigCallbackEachMatchFunc
declare function onig_set_callback_each_match(byval f as OnigCallbackEachMatchFunc) as long
Declare Function onig_new_match_param() As OnigMatchParam Ptr
declare sub onig_free_match_param(byval p as OnigMatchParam ptr)
declare sub onig_free_match_param_content(byval p as OnigMatchParam ptr)
declare function onig_initialize_match_param(byval mp as OnigMatchParam ptr) as long
declare function onig_set_match_stack_limit_size_of_match_param(byval param as OnigMatchParam ptr, byval limit as ulong) as long
declare function onig_set_retry_limit_in_match_of_match_param(byval param as OnigMatchParam ptr, byval limit as culong) as long
declare function onig_set_retry_limit_in_search_of_match_param(byval param as OnigMatchParam ptr, byval limit as culong) as long
declare function onig_set_progress_callout_of_match_param(byval param as OnigMatchParam ptr, byval f as OnigCalloutFunc) as long
declare function onig_set_retraction_callout_of_match_param(byval param as OnigMatchParam ptr, byval f as OnigCalloutFunc) as long
declare function onig_set_callout_user_data_of_match_param(byval param as OnigMatchParam ptr, byval user_data as any ptr) as long
declare function onig_get_progress_callout() as OnigCalloutFunc
declare function onig_set_progress_callout(byval f as OnigCalloutFunc) as long
declare function onig_get_retraction_callout() as OnigCalloutFunc
declare function onig_set_retraction_callout(byval f as OnigCalloutFunc) as long
declare function onig_set_callout_of_name(byval enc as OnigEncoding, byval type_ as OnigCalloutType, byval name_ as OnigUChar ptr, byval name_end as OnigUChar ptr, byval callout_in as long, byval callout as OnigCalloutFunc, byval end_callout as OnigCalloutFunc, byval arg_num as long, byval arg_types as ulong ptr, byval optional_arg_num as long, byval opt_defaults as OnigValue ptr) as long
declare function onig_get_callout_name_by_name_id(byval id as long) as OnigUChar ptr
declare function onig_get_callout_num_by_tag(byval reg as OnigRegex, byval tag as const OnigUChar ptr, byval tag_end as const OnigUChar ptr) as long
declare function onig_get_callout_data_by_tag(byval reg as OnigRegex, byval mp as OnigMatchParam ptr, byval tag as const OnigUChar ptr, byval tag_end as const OnigUChar ptr, byval slot as long, byval type_ as OnigType ptr, byval val_ as OnigValue ptr) as long
declare function onig_set_callout_data_by_tag(byval reg as OnigRegex, byval mp as OnigMatchParam ptr, byval tag as const OnigUChar ptr, byval tag_end as const OnigUChar ptr, byval slot as long, byval type_ as OnigType, byval val_ as OnigValue ptr) as long
declare function onig_get_callout_data_by_tag_dont_clear_old(byval reg as OnigRegex, byval mp as OnigMatchParam ptr, byval tag as const OnigUChar ptr, byval tag_end as const OnigUChar ptr, byval slot as long, byval type_ as OnigType ptr, byval val_ as OnigValue ptr) as long
declare function onig_get_callout_num_by_callout_args(byval args as OnigCalloutArgs ptr) as long
declare function onig_get_callout_in_by_callout_args(byval args as OnigCalloutArgs ptr) as OnigCalloutIn
declare function onig_get_name_id_by_callout_args(byval args as OnigCalloutArgs ptr) as long
declare function onig_get_contents_by_callout_args(byval args as OnigCalloutArgs ptr) as const OnigUChar ptr
declare function onig_get_contents_end_by_callout_args(byval args as OnigCalloutArgs ptr) as const OnigUChar ptr
declare function onig_get_args_num_by_callout_args(byval args as OnigCalloutArgs ptr) as long
declare function onig_get_passed_args_num_by_callout_args(byval args as OnigCalloutArgs ptr) as long
declare function onig_get_arg_by_callout_args(byval args as OnigCalloutArgs ptr, byval index as long, byval type_ as OnigType ptr, byval val_ as OnigValue ptr) as long
declare function onig_get_string_by_callout_args(byval args as OnigCalloutArgs ptr) as const OnigUChar ptr
declare function onig_get_string_end_by_callout_args(byval args as OnigCalloutArgs ptr) as const OnigUChar ptr
declare function onig_get_start_by_callout_args(byval args as OnigCalloutArgs ptr) as const OnigUChar ptr
declare function onig_get_right_range_by_callout_args(byval args as OnigCalloutArgs ptr) as const OnigUChar ptr
declare function onig_get_current_by_callout_args(byval args as OnigCalloutArgs ptr) as const OnigUChar ptr
declare function onig_get_regex_by_callout_args(byval args as OnigCalloutArgs ptr) as OnigRegex
declare function onig_get_retry_counter_by_callout_args(byval args as OnigCalloutArgs ptr) as culong
declare function onig_callout_tag_is_exist_at_callout_num(byval reg as OnigRegex, byval callout_num as long) as long
declare function onig_get_callout_tag_start(byval reg as OnigRegex, byval callout_num as long) as const OnigUChar ptr
declare function onig_get_callout_tag_end(byval reg as OnigRegex, byval callout_num as long) as const OnigUChar ptr
declare function onig_get_callout_data_dont_clear_old(byval reg as OnigRegex, byval mp as OnigMatchParam ptr, byval callout_num as long, byval slot as long, byval type_ as OnigType ptr, byval val_ as OnigValue ptr) as long
declare function onig_get_callout_data_by_callout_args_self_dont_clear_old(byval args as OnigCalloutArgs ptr, byval slot as long, byval type_ as OnigType ptr, byval val_ as OnigValue ptr) as long
declare function onig_get_callout_data(byval reg as OnigRegex, byval mp as OnigMatchParam ptr, byval callout_num as long, byval slot as long, byval type_ as OnigType ptr, byval val_ as OnigValue ptr) as long
declare function onig_get_callout_data_by_callout_args(byval args as OnigCalloutArgs ptr, byval callout_num as long, byval slot as long, byval type_ as OnigType ptr, byval val_ as OnigValue ptr) as long
declare function onig_get_callout_data_by_callout_args_self(byval args as OnigCalloutArgs ptr, byval slot as long, byval type_ as OnigType ptr, byval val_ as OnigValue ptr) as long
declare function onig_set_callout_data(byval reg as OnigRegex, byval mp as OnigMatchParam ptr, byval callout_num as long, byval slot as long, byval type_ as OnigType, byval val_ as OnigValue ptr) as long
declare function onig_set_callout_data_by_callout_args(byval args as OnigCalloutArgs ptr, byval callout_num as long, byval slot as long, byval type_ as OnigType, byval val_ as OnigValue ptr) as long
declare function onig_set_callout_data_by_callout_args_self(byval args as OnigCalloutArgs ptr, byval slot as long, byval type_ as OnigType, byval val_ as OnigValue ptr) as long
declare function onig_get_capture_range_in_callout(byval args as OnigCalloutArgs ptr, byval mem_num as long, byval begin as long ptr, byval end_ as long ptr) as long
declare function onig_get_used_stack_size_in_callout(byval args as OnigCalloutArgs ptr, byval used_num as long ptr, byval used_bytes as long ptr) as long
declare function onig_builtin_fail(byval args as OnigCalloutArgs ptr, byval user_data as any ptr) as long
declare function onig_builtin_mismatch(byval args as OnigCalloutArgs ptr, byval user_data as any ptr) as long
declare function onig_builtin_error(byval args as OnigCalloutArgs ptr, byval user_data as any ptr) as long
declare function onig_builtin_count(byval args as OnigCalloutArgs ptr, byval user_data as any ptr) as long
declare function onig_builtin_total_count(byval args as OnigCalloutArgs ptr, byval user_data as any ptr) as long
declare function onig_builtin_max(byval args as OnigCalloutArgs ptr, byval user_data as any ptr) as long
declare function onig_builtin_cmp(byval args as OnigCalloutArgs ptr, byval user_data as any ptr) as long
declare function onig_setup_builtin_monitors_by_ascii_encoded_name(byval fp as any ptr) as long

end extern
#endif
