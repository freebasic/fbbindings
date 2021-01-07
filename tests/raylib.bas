#include "raylib.bi"
'Check for conflicts
#include "raymath.bi"

dim c as Color = WHITE

'A couple raylib 3.0.0 struct sizes documented at
'https://github.com/raysan5/raylib/wiki/raylib-data-structures/d4e51f13e23eeebf1fc694a4fc26d7c6240da8f1
#ifdef __FB_64BIT__
        #assert sizeof(Font) = 48
        #assert sizeof(Mesh) = 112
#else
        #assert sizeof(Font) = 36
        #assert sizeof(Mesh) = 60
#endif
