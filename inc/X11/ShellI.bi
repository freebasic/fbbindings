'' FreeBASIC binding for libXt-1.1.4
''
'' based on the C header files:
''   TODO
''
'' translated to FreeBASIC by:
''   Copyright © 2015 FreeBASIC development team

#pragma once

#include once "X11/Xfuncproto.bi"

extern "C"

#define _XtShellInternal_h
declare sub _XtShellGetCoordinates(byval widget as Widget, byval x as Position ptr, byval y as Position ptr)

end extern
