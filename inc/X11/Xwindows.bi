'' FreeBASIC binding for xproto-7.0.27
''
'' based on the C header files:
''
''   Copyright 1996, 1998  The Open Group
''
''   Permission to use, copy, modify, distribute, and sell this software and its
''   documentation for any purpose is hereby granted without fee, provided that
''   the above copyright notice appear in all copies and that both that
''   copyright notice and this permission notice appear in supporting
''   documentation.
''
''   The above copyright notice and this permission notice shall be included
''   in all copies or substantial portions of the Software.
''
''   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
''   OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABIL-
''   ITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT
''   SHALL THE OPEN GROUP BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABIL-
''   ITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
''   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
''   IN THE SOFTWARE.
''
''   Except as contained in this notice, the name of The Open Group shall
''   not be used in advertising or otherwise to promote the sale, use or
''   other dealings in this Software without prior written authorization from
''   The Open Group.
''
''
'' translated to FreeBASIC by:
''   Copyright © 2015 FreeBASIC development team

#pragma once

#ifdef __FB_WIN32__
	#include once "windows.bi"

	#undef _XFree86Server
	#define NOMINMAX
	#define _NO_BOOL_TYPEDEF
	#define BOOL WINBOOL
	#define INT32 wINT32
#endif

#if defined(__FB_WIN32__) and defined(__FB_64BIT__)
	#define INT64 wINT64
#endif

#ifdef __FB_WIN32__
	#define ATOM wATOM
	#define BYTE wBYTE
	#define FreeResource wFreeResource

	#undef NOMINMAX
	#undef BYTE
	#undef BOOL
	#undef INT32
	#undef INT64
	#undef ATOM
	#undef FreeResource
	#undef CreateWindowA
	#define wBOOL WINBOOL
	#undef _XFree86Server

	#define NOMINMAX
	#define _NO_BOOL_TYPEDEF
	#define BOOL WINBOOL
	#define INT32 wINT32
#endif

#if defined(__FB_WIN32__) and defined(__FB_64BIT__)
	#define INT64 wINT64
#endif

#ifdef __FB_WIN32__
	#define ATOM wATOM
	#define BYTE wBYTE
	#define FreeResource wFreeResource

	#undef NOMINMAX
	#undef BYTE
	#undef BOOL
	#undef INT32
	#undef INT64
	#undef ATOM
	#undef FreeResource
	#undef CreateWindowA
	#define wBOOL WINBOOL
#endif
