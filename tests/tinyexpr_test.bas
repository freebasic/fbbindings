#include once "crt/stdio.bi"
#include once "tinyexpr.bi"

   Dim  As Double x,y
   Dim vars(1) As te_variable 
   vars(0).name_ = StrPtr("x") : vars(0).ADDRESS_ = @x
   vars(1).name_ = StrPtr("y") : vars(1).ADDRESS_ = @y
   Dim err_ As Long
   Dim expr As te_expr Ptr = te_compile("sqrt(x^2+y^2)", @vars(0), 2, @err_)
   If expr Then
      x = 3:y = 4
      Dim h1 As  Double = te_eval(expr)
      Print "sqrt(3^2+4^2)=",h1
      x = 5:y = 12
      Dim h2 As Double = te_eval(expr)
      Print "sqrt(5^2+12^2)=",h2
      te_free(expr)
   else
      printf(!"Parse error at %d\n", err_)
   end if
sleep