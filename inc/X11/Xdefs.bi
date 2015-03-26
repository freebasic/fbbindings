#pragma once

#include once "crt/long.bi"

extern "C"

#define _XDEFS_H
#define _XTYPEDEF_POINTER
type pointer as any ptr
type ClientPtr as _Client ptr
#define _XTYPEDEF_CLIENTPTR
#define _XTYPEDEF_FONTPTR
type FontPtr as _Font ptr
type FSID as culong
type AccContext as FSID
type OSTimePtr as timeval ptr ptr
type BlockHandlerProcPtr as sub(byval as any ptr, byval as OSTimePtr, byval as any ptr)

end extern
