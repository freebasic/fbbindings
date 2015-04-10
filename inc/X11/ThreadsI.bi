'' FreeBASIC binding for libXt-1.1.4

#pragma once

#include once "X11/XlibConf.bi"

extern "C"

#define _XtThreadsI_h
type LockPtr as _LockRec ptr
type ThreadAppProc as sub(byval as XtAppContext)
type ThreadAppYieldLockProc as sub(byval as XtAppContext, byval as zstring ptr, byval as zstring ptr, byval as long ptr)
type ThreadAppRestoreLockProc as sub(byval as XtAppContext, byval as long, byval as zstring ptr)

extern _XtProcessLock as sub()
extern _XtProcessUnlock as sub()
extern _XtInitAppLock as sub(byval as XtAppContext)

'' TODO: #define INIT_APP_LOCK(app) if(_XtInitAppLock) (*_XtInitAppLock)(app)
'' TODO: #define FREE_APP_LOCK(app) if(app && app->free_lock)(*app->free_lock)(app)
'' TODO: #define LOCK_PROCESS if(_XtProcessLock)(*_XtProcessLock)()
'' TODO: #define UNLOCK_PROCESS if(_XtProcessUnlock)(*_XtProcessUnlock)()
'' TODO: #define LOCK_APP(app) if(app && app->lock)(*app->lock)(app)
'' TODO: #define UNLOCK_APP(app) if(app && app->unlock)(*app->unlock)(app)
'' TODO: #define YIELD_APP_LOCK(app,push,pushed,level) if(app && app->yield_lock) (*app->yield_lock)(app,push,pushed,level)
'' TODO: #define RESTORE_APP_LOCK(app,level,pushed) if(app && app->restore_lock) (*app->restore_lock)(app,level,pushed)
'' TODO: #define WIDGET_TO_APPCON(w) XtAppContext app = (w && _XtProcessLock ? XtWidgetToApplicationContext(w) : NULL)
'' TODO: #define DPY_TO_APPCON(d) XtAppContext app = (_XtProcessLock ? XtDisplayToApplicationContext(d): NULL)

end extern
