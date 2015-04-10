'' FreeBASIC binding for libXext-1.3.3

#pragma once

#include once "X11/extensions/Xext.bi"

extern "C"

#define _EXTUTIL_H_

type _XExtDisplayInfo
	next as _XExtDisplayInfo ptr
	display as Display ptr
	codes as XExtCodes ptr
	data as XPointer
end type

type XExtDisplayInfo as _XExtDisplayInfo

type _XExtensionInfo
	head as XExtDisplayInfo ptr
	cur as XExtDisplayInfo ptr
	ndisplays as long
end type

type XExtensionInfo as _XExtensionInfo

type _XExtensionHooks
	create_gc as function(byval as Display ptr, byval as GC, byval as XExtCodes ptr) as long
	copy_gc as function(byval as Display ptr, byval as GC, byval as XExtCodes ptr) as long
	flush_gc as function(byval as Display ptr, byval as GC, byval as XExtCodes ptr) as long
	free_gc as function(byval as Display ptr, byval as GC, byval as XExtCodes ptr) as long
	create_font as function(byval as Display ptr, byval as XFontStruct ptr, byval as XExtCodes ptr) as long
	free_font as function(byval as Display ptr, byval as XFontStruct ptr, byval as XExtCodes ptr) as long
	close_display as function(byval as Display ptr, byval as XExtCodes ptr) as long
	wire_to_event as function(byval as Display ptr, byval as XEvent ptr, byval as xEvent_ ptr) as long
	event_to_wire as function(byval as Display ptr, byval as XEvent ptr, byval as xEvent_ ptr) as long
	error as function(byval as Display ptr, byval as xError ptr, byval as XExtCodes ptr, byval as long ptr) as long
	error_string as function(byval as Display ptr, byval as long, byval as XExtCodes ptr, byval as zstring ptr, byval as long) as zstring ptr
end type

type XExtensionHooks as _XExtensionHooks
declare function XextCreateExtension() as XExtensionInfo ptr
declare sub XextDestroyExtension(byval as XExtensionInfo ptr)
declare function XextAddDisplay(byval as XExtensionInfo ptr, byval as Display ptr, byval as const zstring ptr, byval as XExtensionHooks ptr, byval as long, byval as XPointer) as XExtDisplayInfo ptr
declare function XextRemoveDisplay(byval as XExtensionInfo ptr, byval as Display ptr) as long
declare function XextFindDisplay(byval as XExtensionInfo ptr, byval as Display ptr) as XExtDisplayInfo ptr
#define XextHasExtension(i) ((i) andalso (i)->codes)

'' TODO: #define XextCheckExtension(dpy,i,name,val) if (!XextHasExtension(i)) { XMissingExtension (dpy, name); return val; }
'' TODO: #define XextSimpleCheckExtension(dpy,i,name) if (!XextHasExtension(i)) { XMissingExtension (dpy, name); return; }
'' TODO: #define XEXT_GENERATE_FIND_DISPLAY(proc,extinfo,extname,hooks,nev,data)XExtDisplayInfo *proc (Display *dpy){ XExtDisplayInfo *dpyinfo; if (!extinfo) { if (!(extinfo = XextCreateExtension())) return NULL; } if (!(dpyinfo = XextFindDisplay (extinfo, dpy))) dpyinfo = XextAddDisplay (extinfo,dpy,extname,hooks,nev,data); return dpyinfo;}
'' TODO: #define XEXT_FIND_DISPLAY_PROTO(proc) XExtDisplayInfo *proc(Display *dpy)
'' TODO: #define XEXT_GENERATE_CLOSE_DISPLAY(proc,extinfo)int proc (Display *dpy, XExtCodes *codes){ return XextRemoveDisplay (extinfo, dpy);}
'' TODO: #define XEXT_CLOSE_DISPLAY_PROTO(proc) int proc(Display *dpy, XExtCodes *codes)
'' TODO: #define XEXT_GENERATE_ERROR_STRING(proc,extname,nerr,errl)char *proc (Display *dpy, int code, XExtCodes *codes, char *buf, int n){ code -= codes->first_error; if (code >= 0 && code < nerr) { char tmp[256]; snprintf (tmp, sizeof(tmp), "%s.%d", extname, code); XGetErrorDatabaseText (dpy, "XProtoError", tmp, errl[code], buf, n); return buf; } return (char *)0;}
'' TODO: #define XEXT_ERROR_STRING_PROTO(proc) char *proc(Display *dpy, int code, XExtCodes *codes, char *buf, int n)

end extern
