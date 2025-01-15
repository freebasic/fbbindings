#include once "my_basic.bi"
   Dim As mb_interpreter_t Ptr bas = NULL
    mb_init()
    mb_open(@bas)
    mb_load_string(bas, "print 22 / 7;", True)
    mb_run(bas, True)
    mb_close(@bas)
    mb_dispose()
   Sleep