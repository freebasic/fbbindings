#pragma once

#ifdef __FB_WIN32__
	#include once "X11/Xwinsock.bi"
#else
	#include once "X11/Xos.bi"
	#include once "crt/sys/select.bi"
	#include once "X11/Xmd.bi"
#endif

#define _XPOLL_H_
const XFD_SETSIZE = 256
#define FD_SETSIZE XFD_SETSIZE

#ifdef __FB_WIN32__
	#define Select(n, r, w, e, t) select(0, cptr(fd_set ptr, r), cptr(fd_set ptr, w), cptr(fd_set ptr, e), cptr(timeval ptr, t))
	#define XFD_SETCOUNT(p) '' TODO: (((fd_set FAR *)(p))->fd_count)
	#define XFD_FD(p, i) '' TODO: (((fd_set FAR *)(p))->fd_array[i])
	#define XFD_ANYSET(p) XFD_SETCOUNT(p)
	#macro XFD_COPYSET(src, dst)
		scope
			u_int __i
			FD_ZERO(dst)
			'' TODO: for (__i = 0; __i < XFD_SETCOUNT(src) ; __i++) { XFD_FD(dst,__i) = XFD_FD(src,__i); }
			'' TODO: XFD_SETCOUNT(dst) = XFD_SETCOUNT(src);
		end scope
	#endmacro
	#macro XFD_ANDSET(dst, b1, b2)
		scope
			u_int __i
			FD_ZERO(dst)
			'' TODO: for (__i = 0; __i < XFD_SETCOUNT(b1) ; __i++) { if (FD_ISSET(XFD_FD(b1,__i), b2)) FD_SET(XFD_FD(b1,__i), dst); }
		end scope
	#endmacro
	#macro XFD_ORSET(dst, b1, b2)
		scope
			u_int __i
			'' TODO: if (dst != b1) XFD_COPYSET(b1,dst);
			'' TODO: for (__i = 0; __i < XFD_SETCOUNT(b2) ; __i++) { if (!FD_ISSET(XFD_FD(b2,__i), dst)) FD_SET(XFD_FD(b2,__i), dst); }
		end scope
	#endmacro
	#macro XFD_UNSET(dst, b1)
		scope
			u_int __i
			'' TODO: for (__i = 0; __i < XFD_SETCOUNT(b1) ; __i++) { FD_CLR(XFD_FD(b1,__i), dst); }
		end scope
	#endmacro
	#define FD_SET(fd, set) '' TODO: do { if (XFD_SETCOUNT(set) < FD_SETSIZE && !FD_ISSET(fd,set)) XFD_FD(set,XFD_SETCOUNT(set)++)=(fd);} while(0)
	#define getdtablesize() FD_SETSIZE
#else
	const NBBY = 8
	#define NFDBITS (sizeof(fd_mask) * NBBY)
	#define howmany(x, y) (((x) + ((y) - 1)) / (y))
	#define Select(n, r, w, e, t) select(n, cptr(fd_set ptr, r), cptr(fd_set ptr, w), cptr(fd_set ptr, e), cptr(timeval ptr, t))
	#define __X_FDS_BITS __fds_bits
	#define __FDS_BITS(p) (p)->__X_FDS_BITS
	#define __XFDS_BITS(p, n) __FDS_BITS(p)[n]
	#define FD_SET(n, p) '' TODO: (__XFDS_BITS(p, ((n)/NFDBITS)) |= ((fd_mask)1 << ((n) % NFDBITS)))
	#define FD_CLR(n, p) '' TODO: (__XFDS_BITS((p), ((n)/NFDBITS)) &= ~((fd_mask)1 << ((n) % NFDBITS)))
	#define FD_ISSET(n, p) '' TODO: ((__XFDS_BITS((p), ((n)/NFDBITS))) & ((fd_mask)1 << ((n) % NFDBITS)))
	#define FD_ZERO(p) bzero(cptr(zstring ptr, (p)), sizeof(*(p)))
	#define XFD_ANYSET(p) (((((((((howmany(FD_SETSIZE, NFDBITS) > 0) andalso __XFDS_BITS(p, 0)) orelse ((howmany(FD_SETSIZE, NFDBITS) > 1) andalso __XFDS_BITS(p, 1))) orelse ((howmany(FD_SETSIZE, NFDBITS) > 2) andalso __XFDS_BITS(p, 2))) orelse ((howmany(FD_SETSIZE, NFDBITS) > 3) andalso __XFDS_BITS(p, 3))) orelse ((howmany(FD_SETSIZE, NFDBITS) > 4) andalso __XFDS_BITS(p, 4))) orelse ((howmany(FD_SETSIZE, NFDBITS) > 5) andalso __XFDS_BITS(p, 5))) orelse ((howmany(FD_SETSIZE, NFDBITS) > 6) andalso __XFDS_BITS(p, 6))) orelse ((howmany(FD_SETSIZE, NFDBITS) > 7) andalso __XFDS_BITS(p, 7)))
	#macro XFD_COPYSET(src, dst)
		scope
			dim __i__ as long
			'' TODO: for (__i__ = 0; __i__ < howmany(FD_SETSIZE, NFDBITS); __i__++) __XFDS_BITS((dst), __i__) = __XFDS_BITS((src), __i__);
		end scope
	#endmacro
	#macro XFD_ANDSET(dst, b1, b2)
		scope
			dim __i__ as long
			'' TODO: for (__i__ = 0; __i__ < howmany(FD_SETSIZE, NFDBITS); __i__++) __XFDS_BITS((dst), __i__) = ((__XFDS_BITS((b1), __i__)) & (__XFDS_BITS((b2), __i__)));
		end scope
	#endmacro
	#macro XFD_ORSET(dst, b1, b2)
		scope
			dim __i__ as long
			'' TODO: for (__i__ = 0; __i__ < howmany(FD_SETSIZE, NFDBITS); __i__++) __XFDS_BITS((dst), __i__) = ((__XFDS_BITS((b1), __i__)) | (__XFDS_BITS((b2), __i__)));
		end scope
	#endmacro
	#macro XFD_UNSET(dst, b1)
		scope
			dim __i__ as long
			'' TODO: for (__i__ = 0; __i__ < howmany(FD_SETSIZE, NFDBITS); __i__++) __XFDS_BITS((dst), __i__) &= ~(__XFDS_BITS((b1), __i__));
		end scope
	#endmacro
#endif
