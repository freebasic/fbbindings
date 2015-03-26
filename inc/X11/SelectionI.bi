#pragma once

#include once "crt/long.bi"
#include once "Intrinsic.bi"

#define _XtselectionI_h
type Request as _RequestRec ptr
type Select as _SelectRec ptr

type _RequestRec
	ctx as Select
	widget as Widget
	requestor as Window
	property as Atom
	target as Atom
	as Atom type
	format as long
	value as XtPointer
	bytelength as culong
	offset as culong
	timeout as XtIntervalId
	event as XSelectionRequestEvent
	allSent as byte
end type

type RequestRec as _RequestRec

type SelectionPropRec
	prop as Atom
	avail as byte
end type

type SelectionProp as SelectionPropRec ptr

type PropListRec
	dpy as Display ptr
	incr_atom as Atom
	indirect_atom as Atom
	timestamp_atom as Atom
	propCount as long
	list as SelectionProp
end type

type PropList as PropListRec ptr

type _SelectRec
	selection as Atom
	dpy as Display ptr
	widget as Widget
	time as Time
	serial as culong
	convert as XtConvertSelectionProc
	loses as XtLoseSelectionProc
	notify as XtSelectionDoneProc
	owner_cancel as XtCancelConvertSelectionProc
	owner_closure as XtPointer
	prop_list as PropList
	req as Request
	ref_count as long
	incremental : 1 as ulong
	free_when_done : 1 as ulong
	was_disowned : 1 as ulong
end type

type SelectRec as _SelectRec

type _ParamRec
	selection as Atom
	param as Atom
end type

type ParamRec as _ParamRec
type Param as _ParamRec ptr

type _ParamInfoRec
	count as ulong
	paramlist as Param
end type

type ParamInfoRec as _ParamInfoRec
type ParamInfo as _ParamInfoRec ptr

type _QueuedRequestRec
	selection as Atom
	target as Atom
	param as Atom
	callback as XtSelectionCallbackProc
	closure as XtPointer
	time as Time
	incremental as byte
end type

type QueuedRequestRec as _QueuedRequestRec
type QueuedRequest as _QueuedRequestRec ptr

type _QueuedRequestInfoRec
	count as long
	selections as Atom ptr
	requests as QueuedRequest ptr
end type

type QueuedRequestInfoRec as _QueuedRequestInfoRec
type QueuedRequestInfo as _QueuedRequestInfoRec ptr

type CallBackInfoRec
	callbacks as XtSelectionCallbackProc ptr
	req_closure as XtPointer ptr
	property as Atom
	target as Atom ptr
	as Atom type
	format as long
	value as zstring ptr
	bytelength as long
	offset as long
	timeout as XtIntervalId
	proc as XtEventHandler
	widget as Widget
	time as Time
	ctx as Select
	incremental as zstring ptr
	current as long
end type

type CallBackInfo as CallBackInfoRec ptr

type IndirectPair
	target as Atom
	property as Atom
end type

const IndirectPairWordSize = 2

type RequestWindowRec
	active_transfer_count as long
end type

#define MAX_SELECTION_INCR(dpy) (iif(65536 < XMaxRequestSize(dpy), 65536 shl 2, XMaxRequestSize(dpy) shl 2) - 100)
#define MATCH_SELECT(event, info) ((((event->time = info->time) andalso (event->requestor = XtWindow(info->widget))) andalso (event->selection = info->ctx->selection)) andalso (event->target = (*info->target)))