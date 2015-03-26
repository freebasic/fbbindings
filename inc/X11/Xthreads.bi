#pragma once

#ifdef __FB_WIN32__
	#include once "X11/Xwindows.bi"

	extern "C"
#else
	#include once "pthread.bi"
#endif

#define _XTHREADS_H_
#define xmalloc malloc
#define xfree free

#ifdef __FB_WIN32__
	type xthread_t as DWORD
	type xthread_key_t as DWORD

	type _xthread_waiter
		sem as HANDLE
		next as _xthread_waiter ptr
	end type

	type xcondition_rec
		cs as CRITICAL_SECTION
		waiters as _xthread_waiter ptr
	end type

	type xmutex_rec as CRITICAL_SECTION
	declare sub _Xthread_init()
	#define xthread_init() _Xthread_init()
	#define xthread_self GetCurrentThreadId
	#macro xthread_fork(func, closure)
		scope
			DWORD _tmptid
			'' TODO: CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE)func, (LPVOID)closure, 0, &_tmptid);
		end scope
	#endmacro
	#define xthread_yield() Sleep(0)
	#define xthread_exit(v) '' TODO: ExitThread((DWORD)(v))
	#define xthread_key_create(kp, d) '' TODO: *(kp) = TlsAlloc()
	#define xthread_key_delete(k) TlsFree(k)
	#define xthread_set_specific(k, v) TlsSetValue(k, v)
	#define xthread_get_specific(k, vp) TlsGetValue(k)
	#define xmutex_init(m) InitializeCriticalSection(m)
	#define xmutex_clear(m) DeleteCriticalSection(m)
	#define _XMUTEX_NESTS
	#define xmutex_lock(m) EnterCriticalSection(m)
	#define xmutex_unlock(m) LeaveCriticalSection(m)
	#macro xcondition_init(cv)
		scope
			InitializeCriticalSection(@(cv)->cs)
			'' TODO: (cv)->waiters = NULL;
		end scope
	#endmacro
	#define xcondition_clear(cv) DeleteCriticalSection(@(cv)->cs)
	declare function _Xthread_waiter() as _xthread_waiter ptr
	#macro xcondition_wait(cv, m)
		scope
			dim _tmpthr as _xthread_waiter ptr = _Xthread_waiter()
			EnterCriticalSection(@(cv)->cs)
			'' TODO: _tmpthr->next = (cv)->waiters;
			'' TODO: (cv)->waiters = _tmpthr;
			LeaveCriticalSection(@(cv)->cs)
			LeaveCriticalSection(m)
			WaitForSingleObject(_tmpthr->sem, INFINITE)
			EnterCriticalSection(m)
		end scope
	#endmacro
	#macro xcondition_signal(cv)
		scope
			EnterCriticalSection(@(cv)->cs)
			'' TODO: if ((cv)->waiters) { ReleaseSemaphore((cv)->waiters->sem, 1, NULL); (cv)->waiters = (cv)->waiters->next; }
			LeaveCriticalSection(@(cv)->cs)
		end scope
	#endmacro
	#macro xcondition_broadcast(cv)
		scope
			dim _tmpthr as _xthread_waiter ptr
			EnterCriticalSection(@(cv)->cs)
			'' TODO: for (_tmpthr = (cv)->waiters; _tmpthr; _tmpthr = _tmpthr->next) ReleaseSemaphore(_tmpthr->sem, 1, NULL);
			'' TODO: (cv)->waiters = NULL;
			LeaveCriticalSection(@(cv)->cs)
		end scope
	#endmacro
#else
	type xthread_t as pthread_t
	type xthread_key_t as pthread_key_t
	type xcondition_rec as pthread_cond_t
	type xmutex_rec as pthread_mutex_t

	#define xthread_self pthread_self
	#define xthread_yield() pthread_yield()
	#define xthread_exit(v) pthread_exit(v)
	#define xthread_set_specific(k, v) pthread_setspecific(k, v)
	#define xmutex_clear(m) pthread_mutex_destroy(m)
	#define xmutex_lock(m) pthread_mutex_lock(m)
	#define xmutex_unlock(m) pthread_mutex_unlock(m)
	#define xthread_key_create(kp, d) pthread_key_create(kp, d)
	#define xthread_key_delete(k) pthread_key_delete(k)
	#define xthread_get_specific(k, vp) '' TODO: *(vp) = pthread_getspecific(k)
	#macro xthread_fork(func, closure)
		scope
			pthread_t _tmpxthr
			pthread_create(@_tmpxthr, NULL, func, closure)
		end scope
	#endmacro
	#define XMUTEX_INITIALIZER PTHREAD_MUTEX_INITIALIZER
	#define xmutex_init(m) pthread_mutex_init(m, NULL)
	#define xcondition_init(c) pthread_cond_init(c, NULL)
	#define xcondition_clear(c) pthread_cond_destroy(c)
	#define xcondition_wait(c, m) pthread_cond_wait(c, m)
	#define xcondition_signal(c) pthread_cond_signal(c)
	#define xcondition_broadcast(c) pthread_cond_broadcast(c)
	#define xthread_have_id(id) (pthread_equal(id, 0) = 0)
	#define xthread_clear_id(id) '' TODO: id = 0
	#define xthread_equal(id1, id2) pthread_equal(id1, id2)
#endif

type xcondition_t as xcondition_rec ptr
type xmutex_t as xmutex_rec ptr
#define xcondition_malloc() cast(xcondition_t, xmalloc(sizeof(xcondition_rec)))
#define xcondition_free(c) xfree(cptr(zstring ptr, c))
#define xmutex_malloc() cast(xmutex_t, xmalloc(sizeof(xmutex_rec)))
#define xmutex_free(m) xfree(cptr(zstring ptr, m))

#ifdef __FB_WIN32__
	#define xthread_have_id(id) id
	#define xthread_clear_id(id) '' TODO: id = 0
	#define xthread_equal(id1, id2) ((id1) = (id2))
#endif

#define xthread_set_name(t, str)
#define xmutex_set_name(m, str)
#define xcondition_set_name(cv, str)

#ifdef __FB_WIN32__
	end extern
#endif
