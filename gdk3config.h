#include <glib.h>

#ifdef _WIN32
	#define GDK_WINDOWING_WIN32
#else
	#define GDK_WINDOWING_X11
	#define GDK_WINDOWING_WAYLAND
	#define GDK_WINDOWING_MIR
#endif
