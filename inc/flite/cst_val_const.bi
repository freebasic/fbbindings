'' FreeBASIC binding for flite-2.0.0-release
''
'' based on the C header files:
''                     Language Technologies Institute                      
''                        Carnegie Mellon University                        
''                         Copyright (c) 1999-2014                          
''                           All Rights Reserved.                           
''                                                                          
''     Permission is hereby granted, free of charge, to use and distribute  
''     this software and its documentation without restriction, including   
''     without limitation the rights to use, copy, modify, merge, publish,  
''     distribute, sublicense, and/or sell copies of this work, and to      
''     permit persons to whom this work is furnished to do so, subject to   
''     the following conditions:                                            
''      1. The code must retain the above copyright notice, this list of    
''         conditions and the following disclaimer.                         
''      2. Any modifications must be clearly marked as such.                
''      3. Original authors' names are not deleted.                         
''      4. The authors' names are not used to endorse or promote products   
''         derived from this software without specific prior written        
''         permission.                                                      
''                                                                          
''     CARNEGIE MELLON UNIVERSITY AND THE CONTRIBUTORS TO THIS WORK         
''     DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING      
''     ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT   
''     SHALL CARNEGIE MELLON UNIVERSITY NOR THE CONTRIBUTORS BE LIABLE      
''     FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES    
''     WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN   
''     AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,          
''     ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF       
''     THIS SOFTWARE.                                                       
''
'' translated to FreeBASIC by:
''   Copyright © 2015 FreeBASIC development team

#pragma once

#include once "cst_val_defs.bi"

extern "C"

#define _CST_VAL_CONSTS_H__
const CST_CONST_INT_MAX = 19
'' TODO: #define DEF_CONST_VAL_INT(N,V) const cst_val N = {{.a={.type=CST_VAL_TYPE_INT,.ref_count=-1,.v={.ival=V}}}}
'' TODO: #define DEF_CONST_VAL_STRING(N,S) const cst_val N = {{.a={.type=CST_VAL_TYPE_STRING,.ref_count=-1,.v={.vval= (void *)S}}}}
'' TODO: #define DEF_CONST_VAL_FLOAT(N,F) const cst_val N = {{.a={.type=CST_VAL_TYPE_FLOAT,.ref_count=-1,.v={.fval=F}}}}
'' TODO: #define DEF_CONST_VAL_CONS(N,A,D) const cst_val N = {{.cc={.car=A,.cdr=D }}}

extern val_int_0 as const cst_val
extern val_int_1 as const cst_val
extern val_int_2 as const cst_val
extern val_int_3 as const cst_val
extern val_int_4 as const cst_val
extern val_int_5 as const cst_val
extern val_int_6 as const cst_val
extern val_int_7 as const cst_val
extern val_int_8 as const cst_val
extern val_int_9 as const cst_val
extern val_int_10 as const cst_val
extern val_int_11 as const cst_val
extern val_int_12 as const cst_val
extern val_int_13 as const cst_val
extern val_int_14 as const cst_val
extern val_int_15 as const cst_val
extern val_int_16 as const cst_val
extern val_int_17 as const cst_val
extern val_int_18 as const cst_val
extern val_int_19 as const cst_val
extern val_int_20 as const cst_val
extern val_int_21 as const cst_val
extern val_int_22 as const cst_val
extern val_int_23 as const cst_val
extern val_int_24 as const cst_val
extern val_string_0 as const cst_val
extern val_string_1 as const cst_val
extern val_string_2 as const cst_val
extern val_string_3 as const cst_val
extern val_string_4 as const cst_val
extern val_string_5 as const cst_val
extern val_string_6 as const cst_val
extern val_string_7 as const cst_val
extern val_string_8 as const cst_val
extern val_string_9 as const cst_val
extern val_string_10 as const cst_val
extern val_string_11 as const cst_val
extern val_string_12 as const cst_val
extern val_string_13 as const cst_val
extern val_string_14 as const cst_val
extern val_string_15 as const cst_val
extern val_string_16 as const cst_val
extern val_string_17 as const cst_val
extern val_string_18 as const cst_val
extern val_string_19 as const cst_val
extern val_string_20 as const cst_val
extern val_string_21 as const cst_val
extern val_string_22 as const cst_val
extern val_string_23 as const cst_val
extern val_string_24 as const cst_val

'' TODO: #define DEF_STATIC_CONST_VAL_INT(N,V) static DEF_CONST_VAL_INT(N,V)
'' TODO: #define DEF_STATIC_CONST_VAL_STRING(N,S) static DEF_CONST_VAL_STRING(N,S)
'' TODO: #define DEF_STATIC_CONST_VAL_FLOAT(N,F) static DEF_CONST_VAL_FLOAT(N,F)
'' TODO: #define DEF_STATIC_CONST_VAL_CONS(N,A,D) static DEF_CONST_VAL_CONS(N,A,D)

#define VAL_INT_0 cptr(cst_val ptr, @val_int_0)
#define VAL_INT_1 cptr(cst_val ptr, @val_int_1)
#define VAL_INT_2 cptr(cst_val ptr, @val_int_2)
#define VAL_INT_3 cptr(cst_val ptr, @val_int_3)
#define VAL_INT_4 cptr(cst_val ptr, @val_int_4)
#define VAL_INT_5 cptr(cst_val ptr, @val_int_5)
#define VAL_INT_6 cptr(cst_val ptr, @val_int_6)
#define VAL_INT_7 cptr(cst_val ptr, @val_int_7)
#define VAL_INT_8 cptr(cst_val ptr, @val_int_8)
#define VAL_INT_9 cptr(cst_val ptr, @val_int_9)
#define VAL_INT_10 cptr(cst_val ptr, @val_int_10)
#define VAL_INT_11 cptr(cst_val ptr, @val_int_11)
#define VAL_INT_12 cptr(cst_val ptr, @val_int_12)
#define VAL_INT_13 cptr(cst_val ptr, @val_int_13)
#define VAL_INT_14 cptr(cst_val ptr, @val_int_14)
#define VAL_INT_15 cptr(cst_val ptr, @val_int_15)
#define VAL_INT_16 cptr(cst_val ptr, @val_int_16)
#define VAL_INT_17 cptr(cst_val ptr, @val_int_17)
#define VAL_INT_18 cptr(cst_val ptr, @val_int_18)
#define VAL_INT_19 cptr(cst_val ptr, @val_int_19)
#define VAL_INT_20 cptr(cst_val ptr, @val_int_20)
#define VAL_INT_21 cptr(cst_val ptr, @val_int_21)
#define VAL_INT_22 cptr(cst_val ptr, @val_int_22)
#define VAL_INT_23 cptr(cst_val ptr, @val_int_23)
#define VAL_INT_24 cptr(cst_val ptr, @val_int_24)
declare function val_int_n(byval n as long) as const cst_val ptr
#define VAL_STRING_0 cptr(cst_val ptr, @val_string_0)
#define VAL_STRING_1 cptr(cst_val ptr, @val_string_1)
#define VAL_STRING_2 cptr(cst_val ptr, @val_string_2)
#define VAL_STRING_3 cptr(cst_val ptr, @val_string_3)
#define VAL_STRING_4 cptr(cst_val ptr, @val_string_4)
#define VAL_STRING_5 cptr(cst_val ptr, @val_string_5)
#define VAL_STRING_6 cptr(cst_val ptr, @val_string_6)
#define VAL_STRING_7 cptr(cst_val ptr, @val_string_7)
#define VAL_STRING_8 cptr(cst_val ptr, @val_string_8)
#define VAL_STRING_9 cptr(cst_val ptr, @val_string_9)
#define VAL_STRING_10 cptr(cst_val ptr, @val_string_10)
#define VAL_STRING_11 cptr(cst_val ptr, @val_string_11)
#define VAL_STRING_12 cptr(cst_val ptr, @val_string_12)
#define VAL_STRING_13 cptr(cst_val ptr, @val_string_13)
#define VAL_STRING_14 cptr(cst_val ptr, @val_string_14)
#define VAL_STRING_15 cptr(cst_val ptr, @val_string_15)
#define VAL_STRING_16 cptr(cst_val ptr, @val_string_16)
#define VAL_STRING_17 cptr(cst_val ptr, @val_string_17)
#define VAL_STRING_18 cptr(cst_val ptr, @val_string_18)
#define VAL_STRING_19 cptr(cst_val ptr, @val_string_19)
#define VAL_STRING_20 cptr(cst_val ptr, @val_string_20)
#define VAL_STRING_21 cptr(cst_val ptr, @val_string_21)
#define VAL_STRING_22 cptr(cst_val ptr, @val_string_22)
#define VAL_STRING_23 cptr(cst_val ptr, @val_string_23)
#define VAL_STRING_24 cptr(cst_val ptr, @val_string_24)
declare function val_string_n(byval n as long) as const cst_val ptr

end extern
