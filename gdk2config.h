#define GSEAL(id) id

#ifdef _WIN32
	#define GDK_NATIVE_WINDOW_POINTER 1
	#define GDK_WINDOWING_WIN32 1
#else
	#define GDK_WINDOWING_X11 1
#endif
#define GDK_HAVE_WCHAR_H 1
#define GDK_HAVE_WCTYPE_H 1
