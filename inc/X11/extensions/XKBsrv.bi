#pragma once

#include once "crt/long.bi"
#include once "X11/extensions/XKBstr.bi"
#include once "X11/extensions/XKBproto.bi"
#include once "inputstr.bi"

extern "C"

#define _XKBSRV_H_

type _XkbInterest
	dev as DeviceIntPtr
	client as ClientPtr
	resource as XID
	next as _XkbInterest ptr
	extDevNotifyMask as CARD16
	stateNotifyMask as CARD16
	namesNotifyMask as CARD16
	ctrlsNotifyMask as CARD32
	compatNotifyMask as CARD8
	bellNotifyMask as BOOL
	actionMessageMask as BOOL
	accessXNotifyMask as CARD16
	iStateNotifyMask as CARD32
	iMapNotifyMask as CARD32
	altSymsNotifyMask as CARD16
	autoCtrls as CARD32
	autoCtrlValues as CARD32
end type

type XkbInterestRec as _XkbInterest
type XkbInterestPtr as _XkbInterest ptr

type _XkbRadioGroup
	flags as CARD8
	nMembers as CARD8
	dfltDown as CARD8
	currentDown as CARD8
	members(0 to 11) as CARD8
end type

type XkbRadioGroupRec as _XkbRadioGroup
type XkbRadioGroupPtr as _XkbRadioGroup ptr

type _XkbEventCause
	kc as CARD8
	event as CARD8
	mjr as CARD8
	mnr as CARD8
	client as ClientPtr
end type

type XkbEventCauseRec as _XkbEventCause
type XkbEventCausePtr as _XkbEventCause ptr
#macro XkbSetCauseKey(c, k, e)
	scope
		'' TODO: (c)->kc= (k),(c)->event= (e), (c)->mjr= (c)->mnr= 0;
		'' TODO: (c)->client= NULL;
	end scope
#endmacro
#macro XkbSetCauseReq(c, j, n, cl)
	scope
		'' TODO: (c)->kc= (c)->event= 0, (c)->mjr= (j),(c)->mnr= (n);
		'' TODO: (c)->client= (cl);
	end scope
#endmacro
#define XkbSetCauseCoreReq(c, e, cl) XkbSetCauseReq(c, e, 0, cl)
#define XkbSetCauseXkbReq(c, e, cl) XkbSetCauseReq(c, XkbReqCode, e, cl)
#define XkbSetCauseUnknown(c) XkbSetCauseKey(c, 0, 0)
const _OFF_TIMER = 0
const _KRG_WARN_TIMER = 1
const _KRG_TIMER = 2
const _SK_TIMEOUT_TIMER = 3
const _ALL_TIMEOUT_TIMER = 4
const _BEEP_NONE = 0
const _BEEP_FEATURE_ON = 1
const _BEEP_FEATURE_OFF = 2
const _BEEP_FEATURE_CHANGE = 3
const _BEEP_SLOW_WARN = 4
const _BEEP_SLOW_PRESS = 5
const _BEEP_SLOW_ACCEPT = 6
const _BEEP_SLOW_REJECT = 7
const _BEEP_SLOW_RELEASE = 8
const _BEEP_STICKY_LATCH = 9
const _BEEP_STICKY_LOCK = 10
const _BEEP_STICKY_UNLOCK = 11
const _BEEP_LED_ON = 12
const _BEEP_LED_OFF = 13
const _BEEP_LED_CHANGE = 14
const _BEEP_BOUNCE_REJECT = 15

type _XkbSrvInfo
	prev_state as XkbStateRec
	state as XkbStateRec
	desc as XkbDescPtr
	device as DeviceIntPtr
	kbdProc as KbdCtrlProcPtr
	radioGroups as XkbRadioGroupPtr
	nRadioGroups as CARD8
	clearMods as CARD8
	setMods as CARD8
	groupChange as INT16
	dfltPtrDelta as CARD16
	mouseKeysCurve as double
	mouseKeysCurveFactor as double
	mouseKeysDX as INT16
	mouseKeysDY as INT16
	mouseKeysFlags as CARD8
	mouseKeysAccel as long
	mouseKeysCounter as CARD8
	lockedPtrButtons as CARD8
	shiftKeyCount as CARD8
	mouseKey as KeyCode
	inactiveKey as KeyCode
	slowKey as KeyCode
	repeatKey as KeyCode
	krgTimerActive as CARD8
	beepType as CARD8
	beepCount as CARD8
	flags as CARD32
	lastPtrEventTime as CARD32
	lastShiftEventTime as CARD32
	beepTimer as OsTimerPtr
	mouseKeyTimer as OsTimerPtr
	slowKeysTimer as OsTimerPtr
	bounceKeysTimer as OsTimerPtr
	repeatKeyTimer as OsTimerPtr
	krgTimer as OsTimerPtr
end type

type XkbSrvInfoRec as _XkbSrvInfo
type XkbSrvInfoPtr as _XkbSrvInfo ptr
const XkbSLI_IsDefault = cast(clong, 1) shl 0
const XkbSLI_HasOwnState = cast(clong, 1) shl 1

union _XkbSrvLedInfo_fb
	kf as KbdFeedbackPtr
	lf as LedFeedbackPtr
end union

type _XkbSrvLedInfo
	flags as CARD16
	class as CARD16
	id as CARD16
	fb as _XkbSrvLedInfo_fb
	physIndicators as CARD32
	autoState as CARD32
	explicitState as CARD32
	effectiveState as CARD32
	mapsPresent as CARD32
	namesPresent as CARD32
	maps as XkbIndicatorMapPtr
	names as Atom ptr
	usesBase as CARD32
	usesLatched as CARD32
	usesLocked as CARD32
	usesEffective as CARD32
	usesCompat as CARD32
	usesControls as CARD32
	usedComponents as CARD32
end type

type XkbSrvLedInfoRec as _XkbSrvLedInfo
type XkbSrvLedInfoPtr as _XkbSrvLedInfo ptr
const _XkbClientInitialized = 1 shl 15
#define _XkbWantsDetectableAutoRepeat(c) ((c)->xkbClientFlags and XkbPCF_DetectableAutoRepeatMask)
const _XkbStateNotifyInProgress = 1 shl 0

type xkbDeviceInfoRec
	processInputProc as ProcessInputProc
	realInputProc as ProcessInputProc
	unwrapProc as DeviceUnwrapProc
end type

type xkbDeviceInfoPtr as xkbDeviceInfoRec ptr
#define WRAP_PROCESS_INPUT_PROC(device, oldprocs, proc, unwrapproc) '' TODO: device->public.processInputProc = proc; oldprocs->processInputProc = oldprocs->realInputProc = device->public.realInputProc; device->public.realInputProc = proc; oldprocs->unwrapProc = device->unwrapProc; device->unwrapProc = unwrapproc;
#define COND_WRAP_PROCESS_INPUT_PROC(device, oldprocs, proc, unwrapproc) '' TODO: if (device->public.processInputProc == device->public.realInputProc) device->public.processInputProc = proc; oldprocs->processInputProc = oldprocs->realInputProc = device->public.realInputProc; device->public.realInputProc = proc; oldprocs->unwrapProc = device->unwrapProc; device->unwrapProc = unwrapproc;
#define UNWRAP_PROCESS_INPUT_PROC(device, oldprocs) '' TODO: device->public.processInputProc = oldprocs->processInputProc; device->public.realInputProc = oldprocs->realInputProc; device->unwrapProc = oldprocs->unwrapProc;
#define XKBDEVICEINFO(dev) cast(xkbDeviceInfoPtr, (dev)->devPrivates[xkbDevicePrivateIndex].ptr)
#define XkbAX_KRGMask (XkbSlowKeysMask or XkbBounceKeysMask)
#define XkbAllFilteredEventsMask (((XkbAccessXKeysMask or XkbRepeatKeysMask) or XkbMouseKeysAccelMask) or XkbAX_KRGMask)

extern XkbReqCode as long
extern XkbEventBase as long
extern XkbKeyboardErrorCode as long
extern XkbDisableLockActions as long
extern XkbBaseDirectory as zstring ptr
extern XkbBinDirectory as zstring ptr
extern XkbInitialMap as zstring ptr
extern _XkbClientMajor as long
extern _XkbClientMinor as long
extern XkbXIUnsupported as ulong
extern XkbModelUsed as zstring ptr
extern XkbLayoutUsed as zstring ptr
extern XkbVariantUsed as zstring ptr
extern XkbOptionsUsed as zstring ptr
extern noXkbExtension as long
extern XkbWantRulesProp as long
extern XkbLastRepeatEvent as pointer
extern xkbDebugFlags as CARD32
extern xkbDebugCtrls as CARD32

#define _XkbAlloc(s) xalloc((s))
#define _XkbCalloc(n, s) Xcalloc((n) * (s))
#define _XkbRealloc(o, s) Xrealloc((o), (s))
#define _XkbTypedAlloc(t) cptr(t ptr, xalloc(sizeof((t))))
#define _XkbTypedCalloc(n, t) cptr(t ptr, Xcalloc((n) * sizeof((t))))
#define _XkbTypedRealloc(o, n, t) iif((o), cptr(t ptr, Xrealloc((o), (n) * sizeof((t)))), _XkbTypedCalloc(n, t))
#define _XkbClearElems(a, f, l, t) bzero(@(a)[f], (((l) - (f)) + 1) * sizeof((t)))
#define _XkbFree(p) Xfree_(p)
#macro _XkbLibError(c, l, d)
	scope
		'' TODO: _XkbErrCode= (c);
		'' TODO: _XkbErrLocation= (l);
		'' TODO: _XkbErrData= (d);
	end scope
#endmacro
#define _XkbErrCode2(a, b) cast(XID, culng(culng((a)) shl 24) or ((b) and &hffffff))
#define _XkbErrCode3(a, b, c) _XkbErrCode2(a, culng(culng((b)) shl 16) or (c))
#define _XkbErrCode4(a, b, c, d) _XkbErrCode3(a, b, culng(culng((c)) shl 8) or (d))

extern DeviceKeyPress as long
extern DeviceKeyRelease as long
extern DeviceButtonPress as long
extern DeviceButtonRelease as long

#define _XkbIsPressEvent(t) ((t) = KeyPress)
#define _XkbIsReleaseEvent(t) ((t) = KeyRelease)
#define _XkbCoreKeycodeInRange(c, k) (((k) >= (c)->curKeySyms.minKeyCode) andalso ((k) <= (c)->curKeySyms.maxKeyCode))
#define _XkbCoreNumKeys(c) (((c)->curKeySyms.maxKeyCode - (c)->curKeySyms.minKeyCode) + 1)
#define XConvertCase(s, l, u) XkbConvertCase(s, l, u)
#define IsKeypadKey(s) XkbKSIsKeypad(s)
'' TODO: typedef int int;
type XPointer as pointer
type Display as _XDisplay

#ifdef __FB_LINUX__
	const PATH_MAX = 1024
#endif

declare sub XkbUseMsg()
declare function XkbProcessArguments(byval as long, byval as zstring ptr ptr, byval as long) as long
declare sub XkbSetExtension(byval device as DeviceIntPtr, byval proc as ProcessInputProc)
declare sub XkbFreeCompatMap(byval as XkbDescPtr, byval as ulong, byval as long)
declare sub XkbFreeNames(byval as XkbDescPtr, byval as ulong, byval as long)
declare function _XkbLookupAnyDevice(byval as long, byval as long ptr) as DeviceIntPtr
declare function _XkbLookupKeyboard(byval as long, byval as long ptr) as DeviceIntPtr
declare function _XkbLookupBellDevice(byval as long, byval as long ptr) as DeviceIntPtr
declare function _XkbLookupLedDevice(byval as long, byval as long ptr) as DeviceIntPtr
declare function _XkbLookupButtonDevice(byval as long, byval as long ptr) as DeviceIntPtr
declare function XkbAllocKeyboard() as XkbDescPtr
declare function XkbAllocClientMap(byval as XkbDescPtr, byval as ulong, byval as ulong) as long
declare function XkbAllocServerMap(byval as XkbDescPtr, byval as ulong, byval as ulong) as long
declare sub XkbFreeClientMap(byval as XkbDescPtr, byval as ulong, byval as long)
declare sub XkbFreeServerMap(byval as XkbDescPtr, byval as ulong, byval as long)
declare function XkbAllocIndicatorMaps(byval as XkbDescPtr) as long
declare function XkbAllocCompatMap(byval as XkbDescPtr, byval as ulong, byval as ulong) as long
declare function XkbAllocNames(byval as XkbDescPtr, byval as ulong, byval as long, byval as long) as long
declare function XkbAllocControls(byval as XkbDescPtr, byval as ulong) as long
declare function XkbCopyKeyType(byval as XkbKeyTypePtr, byval as XkbKeyTypePtr) as long
declare function XkbCopyKeyTypes(byval as XkbKeyTypePtr, byval as XkbKeyTypePtr, byval as long) as long
declare function XkbResizeKeyType(byval as XkbDescPtr, byval as long, byval as long, byval as long, byval as long) as long
declare sub XkbFreeKeyboard(byval as XkbDescPtr, byval as ulong, byval as long)
declare sub XkbSetActionKeyMods(byval as XkbDescPtr, byval as XkbAction ptr, byval as ulong)
declare function XkbCheckActionVMods(byval as XkbDescPtr, byval as XkbAction ptr, byval as ulong) as long
declare function XkbApplyVModChanges(byval as XkbSrvInfoPtr, byval as ulong, byval as XkbChangesPtr, byval as ulong ptr, byval as XkbEventCausePtr) as long
declare sub XkbApplyVModChangesToAllDevices(byval as DeviceIntPtr, byval as XkbDescPtr, byval as ulong, byval as XkbEventCausePtr)
declare function XkbMaskForVMask(byval as XkbDescPtr, byval as ulong) as ulong
declare function XkbVirtualModsToReal(byval as XkbDescPtr, byval as ulong, byval as ulong ptr) as long
declare function XkbAdjustGroup(byval as long, byval as XkbControlsPtr) as ulong
declare function XkbResizeKeySyms(byval as XkbDescPtr, byval as long, byval as long) as KeySym ptr
declare function XkbResizeKeyActions(byval as XkbDescPtr, byval as long, byval as long) as XkbAction ptr
declare sub XkbUpdateKeyTypesFromCore(byval as DeviceIntPtr, byval as KeyCode, byval as CARD8, byval as XkbChangesPtr)
declare sub XkbUpdateDescActions(byval as XkbDescPtr, byval as KeyCode, byval as CARD8, byval as XkbChangesPtr)
declare sub XkbUpdateActions(byval as DeviceIntPtr, byval as KeyCode, byval as CARD8, byval as XkbChangesPtr, byval as ulong ptr, byval as XkbEventCausePtr)
declare sub XkbUpdateCoreDescription(byval as DeviceIntPtr, byval as long)
declare sub XkbApplyMappingChange(byval as DeviceIntPtr, byval as CARD8, byval as KeyCode, byval as CARD8, byval as ClientPtr)
declare sub XkbSetIndicators(byval as DeviceIntPtr, byval as CARD32, byval as CARD32, byval as XkbEventCausePtr)
declare sub XkbUpdateIndicators(byval as DeviceIntPtr, byval as CARD32, byval as long, byval as XkbChangesPtr, byval as XkbEventCausePtr)
declare function XkbAllocSrvLedInfo(byval as DeviceIntPtr, byval as KbdFeedbackPtr, byval as LedFeedbackPtr, byval as ulong) as XkbSrvLedInfoPtr
declare function XkbFindSrvLedInfo(byval as DeviceIntPtr, byval as ulong, byval as ulong, byval as ulong) as XkbSrvLedInfoPtr
declare sub XkbApplyLedNameChanges(byval as DeviceIntPtr, byval as XkbSrvLedInfoPtr, byval as ulong, byval as xkbExtensionDeviceNotify ptr, byval as XkbChangesPtr, byval as XkbEventCausePtr)
declare sub XkbApplyLedMapChanges(byval as DeviceIntPtr, byval as XkbSrvLedInfoPtr, byval as ulong, byval as xkbExtensionDeviceNotify ptr, byval as XkbChangesPtr, byval as XkbEventCausePtr)
declare sub XkbApplyLedStateChanges(byval as DeviceIntPtr, byval as XkbSrvLedInfoPtr, byval as ulong, byval as xkbExtensionDeviceNotify ptr, byval as XkbChangesPtr, byval as XkbEventCausePtr)
declare sub XkbUpdateLedAutoState(byval as DeviceIntPtr, byval as XkbSrvLedInfoPtr, byval as ulong, byval as xkbExtensionDeviceNotify ptr, byval as XkbChangesPtr, byval as XkbEventCausePtr)
declare sub XkbFlushLedEvents(byval as DeviceIntPtr, byval as DeviceIntPtr, byval as XkbSrvLedInfoPtr, byval as xkbExtensionDeviceNotify ptr, byval as XkbChangesPtr, byval as XkbEventCausePtr)
declare sub XkbUpdateAllDeviceIndicators(byval as XkbChangesPtr, byval as XkbEventCausePtr)
declare function XkbIndicatorsToUpdate(byval as DeviceIntPtr, byval as culong, byval as long) as ulong
declare sub XkbComputeDerivedState(byval as XkbSrvInfoPtr)
declare sub XkbCheckSecondaryEffects(byval as XkbSrvInfoPtr, byval as ulong, byval as XkbChangesPtr, byval as XkbEventCausePtr)
declare sub XkbCheckIndicatorMaps(byval as DeviceIntPtr, byval as XkbSrvLedInfoPtr, byval as ulong)
declare function XkbStateChangedFlags(byval as XkbStatePtr, byval as XkbStatePtr) as ulong
declare sub XkbSendStateNotify(byval as DeviceIntPtr, byval as xkbStateNotify ptr)
declare sub XkbSendMapNotify(byval as DeviceIntPtr, byval as xkbMapNotify ptr)
declare function XkbComputeControlsNotify(byval as DeviceIntPtr, byval as XkbControlsPtr, byval as XkbControlsPtr, byval as xkbControlsNotify ptr, byval as long) as long
declare sub XkbSendControlsNotify(byval as DeviceIntPtr, byval as xkbControlsNotify ptr)
declare sub XkbSendCompatMapNotify(byval as DeviceIntPtr, byval as xkbCompatMapNotify ptr)
declare sub XkbSendIndicatorNotify(byval as DeviceIntPtr, byval as long, byval as xkbIndicatorNotify ptr)
declare sub XkbHandleBell(byval as BOOL, byval as BOOL, byval as DeviceIntPtr, byval as CARD8, byval as pointer, byval as CARD8, byval as Atom, byval as WindowPtr, byval as ClientPtr)
declare sub XkbSendAccessXNotify(byval as DeviceIntPtr, byval as xkbAccessXNotify ptr)
declare sub XkbSendNamesNotify(byval as DeviceIntPtr, byval as xkbNamesNotify ptr)
declare sub XkbSendCompatNotify(byval as DeviceIntPtr, byval as xkbCompatMapNotify ptr)
declare sub XkbSendActionMessage(byval as DeviceIntPtr, byval as xkbActionMessage ptr)
declare sub XkbSendExtensionDeviceNotify(byval as DeviceIntPtr, byval as ClientPtr, byval as xkbExtensionDeviceNotify ptr)
declare sub XkbSendNotification(byval as DeviceIntPtr, byval as XkbChangesPtr, byval as XkbEventCausePtr)
declare sub XkbProcessKeyboardEvent(byval as _xEvent ptr, byval as DeviceIntPtr, byval as long)
declare sub XkbProcessOtherEvent(byval as _xEvent ptr, byval as DeviceIntPtr, byval as long)
declare sub XkbHandleActions(byval as DeviceIntPtr, byval as DeviceIntPtr, byval as _xEvent ptr, byval as long)
declare function XkbEnableDisableControls(byval as XkbSrvInfoPtr, byval as culong, byval as culong, byval as XkbChangesPtr, byval as XkbEventCausePtr) as long
declare sub AccessXInit(byval as DeviceIntPtr)
declare function AccessXFilterPressEvent(byval as _xEvent ptr, byval as DeviceIntPtr, byval as long) as long
declare function AccessXFilterReleaseEvent(byval as _xEvent ptr, byval as DeviceIntPtr, byval as long) as long
declare sub AccessXCancelRepeatKey(byval as XkbSrvInfoPtr, byval as KeyCode)
declare sub AccessXComputeCurveFactor(byval as XkbSrvInfoPtr, byval as XkbControlsPtr)
declare function XkbAddDeviceLedInfo(byval as XkbDeviceInfoPtr, byval as ulong, byval as ulong) as XkbDeviceLedInfoPtr
declare function XkbAllocDeviceInfo(byval as ulong, byval as ulong, byval as ulong) as XkbDeviceInfoPtr
declare sub XkbFreeDeviceInfo(byval as XkbDeviceInfoPtr, byval as ulong, byval as long)
declare function XkbResizeDeviceButtonActions(byval as XkbDeviceInfoPtr, byval as ulong) as long
declare function XkbFindClientResource(byval as DevicePtr, byval as ClientPtr) as XkbInterestPtr
declare function XkbAddClientResource(byval as DevicePtr, byval as ClientPtr, byval as XID) as XkbInterestPtr
declare function XkbRemoveClient(byval as DevicePtr, byval as ClientPtr) as long
declare function XkbRemoveResourceClient(byval as DevicePtr, byval as XID) as long
declare function XkbDDXInitDevice(byval as DeviceIntPtr) as long
declare function XkbDDXAccessXBeep(byval as DeviceIntPtr, byval as ulong, byval as ulong) as long
declare sub XkbDDXKeyClick(byval as DeviceIntPtr, byval as long, byval as long)
declare function XkbDDXUsesSoftRepeat(byval as DeviceIntPtr) as long
declare sub XkbDDXKeybdCtrlProc(byval as DeviceIntPtr, byval as KeybdCtrl ptr)
declare sub XkbDDXChangeControls(byval as DeviceIntPtr, byval as XkbControlsPtr, byval as XkbControlsPtr)
declare sub XkbDDXUpdateIndicators(byval as DeviceIntPtr, byval as CARD32)
declare sub XkbDDXUpdateDeviceIndicators(byval as DeviceIntPtr, byval as XkbSrvLedInfoPtr, byval as CARD32)
declare sub XkbDDXFakePointerButton(byval as long, byval as long)
declare sub XkbDDXFakePointerMotion(byval as ulong, byval as long, byval as long)
declare sub XkbDDXFakeDeviceButton(byval as DeviceIntPtr, byval as long, byval as long)
declare function XkbDDXTerminateServer(byval as DeviceIntPtr, byval as KeyCode, byval as XkbAction ptr) as long
declare function XkbDDXSwitchScreen(byval as DeviceIntPtr, byval as KeyCode, byval as XkbAction ptr) as long
declare function XkbDDXPrivate(byval as DeviceIntPtr, byval as KeyCode, byval as XkbAction ptr) as long
declare sub XkbDisableComputedAutoRepeats(byval as DeviceIntPtr, byval as ulong)
declare sub XkbSetRepeatKeys(byval as DeviceIntPtr, byval as long, byval as long)
declare function XkbLatchModifiers(byval as DeviceIntPtr, byval as CARD8, byval as CARD8) as long
declare function XkbLatchGroup(byval as DeviceIntPtr, byval as long) as long
declare sub XkbClearAllLatchesAndLocks(byval as DeviceIntPtr, byval as XkbSrvInfoPtr, byval as long, byval as XkbEventCausePtr)
declare sub XkbSetRulesDflts(byval as zstring ptr, byval as zstring ptr, byval as zstring ptr, byval as zstring ptr, byval as zstring ptr)
declare sub XkbInitDevice(byval as DeviceIntPtr)
declare function XkbInitKeyboardDeviceStruct(byval as DeviceIntPtr, byval as XkbComponentNamesPtr, byval as KeySymsPtr, byval as CARD8 ptr, byval as BellProcPtr, byval as KbdCtrlProcPtr) as long
declare function SProcXkbDispatch(byval as ClientPtr) as long
declare function XkbLookupNamedGeometry(byval as DeviceIntPtr, byval as Atom, byval as long ptr) as XkbGeometryPtr
declare function _XkbDupString(byval as zstring ptr) as zstring ptr
declare sub XkbConvertCase(byval as KeySym, byval as KeySym ptr, byval as KeySym ptr)
declare function XkbChangeKeycodeRange(byval as XkbDescPtr, byval as long, byval as long, byval as XkbChangesPtr) as long
declare function XkbFinishDeviceInit(byval as DeviceIntPtr) as long
declare sub XkbFreeSrvLedInfo(byval as XkbSrvLedInfoPtr)
declare sub XkbFreeInfo(byval as XkbSrvInfoPtr)
declare function XkbChangeTypesOfKey(byval as XkbDescPtr, byval as long, byval as long, byval as ulong, byval as long ptr, byval as XkbMapChangesPtr) as long
declare function XkbAddKeyType(byval as XkbDescPtr, byval as Atom, byval as long, byval as long, byval as long) as XkbKeyTypePtr
declare function XkbInitCanonicalKeyTypes(byval as XkbDescPtr, byval as ulong, byval as long) as long
declare function XkbKeyTypesForCoreSymbols(byval as XkbDescPtr, byval as long, byval as KeySym ptr, byval as ulong, byval as long ptr, byval as KeySym ptr) as long
declare function XkbApplyCompatMapToKey(byval as XkbDescPtr, byval as KeyCode, byval as XkbChangesPtr) as long
declare function XkbUpdateMapFromCore(byval as XkbDescPtr, byval as KeyCode, byval as long, byval as long, byval as KeySym ptr, byval as XkbChangesPtr) as long
declare sub XkbFreeControls(byval as XkbDescPtr, byval as ulong, byval as long)
declare sub XkbFreeIndicatorMaps(byval as XkbDescPtr)
declare function XkbApplyVirtualModChanges(byval as XkbDescPtr, byval as ulong, byval as XkbChangesPtr) as long
declare function XkbUpdateActionVirtualMods(byval as XkbDescPtr, byval as XkbAction ptr, byval as ulong) as long
declare sub XkbUpdateKeyTypeVirtualMods(byval as XkbDescPtr, byval as XkbKeyTypePtr, byval as ulong, byval as XkbChangesPtr)
declare sub XkbSendNewKeyboardNotify(byval as DeviceIntPtr, byval as xkbNewKeyboardNotify ptr)
#define XkbAtomGetString(d, s) NameForAtom(s)

end extern
