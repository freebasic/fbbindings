''freebasic bindings for TINYEXPR
' * TINYEXPR - Tiny recursive descent parser And evaluation engine in C
' *And Is released under zlib license.
' * Copyright (c) 2015-2020 Lewis Van Winkle
' * http://CodePlea.com
' * This software is provided 'as-is', without any express or implied
' * warranty. In no event will the authors be held liable for any damages
' * arising from the use of this software.
' *
' * Permission is granted to anyone to use this software for any purpose,
' * including commercial applications, and to alter it and redistribute it
' * freely, subject to the following restrictions:
' *
' * 1. The origin of this software must not be misrepresented; you must not
' * claim that you wrote the original software. If you use this software
' * in a product, an acknowledgement in the product documentation would be
' * appreciated but is not required.
' * 2. Altered source versions must be plainly marked as such, and must not be
' * misrepresented as being the original software.
' * 3. This notice may not be removed or altered from any source distribution.
'' translated to FreeBASIC by:
''   FreeBASIC development team

#pragma once

#ifndef TINYEXPR_H
#define TINYEXPR_H
#inclib "tinyexpr"

extern "C"

Type te_expr
   type_ as long

   Union
      value as double
      bound as const double ptr
      function_ as const any ptr
   end union

   parameters(0 to 0) as any ptr
end type

enum
   te_variable_ = 0
   TE_FUNCTION0 = 8
   TE_FUNCTION1
   TE_FUNCTION2
   TE_FUNCTION3
   TE_FUNCTION4
   TE_FUNCTION5
   TE_FUNCTION6
   TE_FUNCTION7
   TE_CLOSURE0 = 16
   TE_CLOSURE1
   TE_CLOSURE2
   TE_CLOSURE3
   TE_CLOSURE4
   TE_CLOSURE5
   TE_CLOSURE6
   TE_CLOSURE7
   TE_FLAG_PURE = 32
end enum

Type te_variable
   name_ As Const ZString Ptr
   ADDRESS_ As Const Any Ptr
   type_ as long
   context as any ptr
end type

declare function te_interp(byval expression as const zstring ptr, byval error_ as long ptr) as double
declare function te_compile(byval expression as const zstring ptr, byval variables as const te_variable ptr, byval var_count as long, byval error_ as long ptr) as te_expr ptr
declare function te_eval(byval n as const te_expr ptr) as double
declare sub te_print(byval n as const te_expr ptr)
declare sub te_free(byval n as te_expr ptr)

end extern
#endif
