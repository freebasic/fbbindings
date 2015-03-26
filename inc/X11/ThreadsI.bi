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

#define INIT_APP_LOCK(app) '' TODO: if(_XtInitAppLock) (*_XtInitAppLock)(app)
#define FREE_APP_LOCK(app) '' TODO: if(app && app->free_lock)(*app->free_lock)(app)
#define LOCK_PROCESS '' TODO: if(_XtProcessLock)(*_XtProcessLock)()
#define UNLOCK_PROCESS '' TODO: if(_XtProcessUnlock)(*_XtProcessUnlock)()
#define LOCK_APP(app) '' TODO: if(app && app->lock)(*app->lock)(app)
#define UNLOCK_APP(app) '' TODO: if(app && app->unlock)(*app->unlock)(app)
#define YIELD_APP_LOCK(app, push, pushed, level) '' TODO: if(app && app->yield_lock) (*app->yield_lock)(app,push,pushed,level)
#define RESTORE_APP_LOCK(app, level, pushed) '' TODO: if(app && app->restore_lock) (*app->restore_lock)(app,level,pushed)
#define WIDGET_TO_APPCON(w) '' TODO: XtAppContext app = (w && _XtProcessLock ? XtWidgetToApplicationContext(w) : NULL)
#define DPY_TO_APPCON(d) '' TODO: XtAppContext app = (_XtProcessLock ? XtDisplayToApplicationContext(d): NULL)

end extern
