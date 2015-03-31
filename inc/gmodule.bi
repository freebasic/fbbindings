#pragma once

#include once "glib.bi"

extern "C"

#define __GMODULE_H__

type GModuleFlags as long
enum
	G_MODULE_BIND_LAZY = 1 shl 0
	G_MODULE_BIND_LOCAL = 1 shl 1
	G_MODULE_BIND_MASK = &h03
end enum

type GModule as _GModule
type GModuleCheckInit as function(byval module as GModule ptr) as const zstring ptr
type GModuleUnload as sub(byval module as GModule ptr)

declare function g_module_supported() as gboolean
declare function g_module_open(byval file_name as const zstring ptr, byval flags as GModuleFlags) as GModule ptr
declare function g_module_close(byval module as GModule ptr) as gboolean
declare sub g_module_make_resident(byval module as GModule ptr)
declare function g_module_error() as const zstring ptr
declare function g_module_symbol(byval module as GModule ptr, byval symbol_name as const zstring ptr, byval symbol as gpointer ptr) as gboolean
declare function g_module_name(byval module as GModule ptr) as const zstring ptr
declare function g_module_build_path(byval directory as const zstring ptr, byval module_name as const zstring ptr) as zstring ptr

#ifdef __FB_WIN32__
	#define g_module_open g_module_open_utf8
	#define g_module_name g_module_name_utf8
	declare function g_module_open_utf8(byval file_name as const zstring ptr, byval flags as GModuleFlags) as GModule ptr
	declare function g_module_name_utf8(byval module as GModule ptr) as const zstring ptr
#endif

end extern
