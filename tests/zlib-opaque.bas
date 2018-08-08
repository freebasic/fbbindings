'' win/wingdi.bi has an OPAQUE constant which commonly causes/caused conflicts
'' with zlib.bi which uses "opaque" as identifier -- if win/wingdi.bi implements
'' it as a #define.

#include "windows.bi"
#include "zlib.bi"
