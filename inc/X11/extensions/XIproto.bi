#pragma once

#include once "X11/Xproto.bi"
#include once "X11/X.bi"

#define _XIPROTO_H
const MORE_EVENTS = &h80
const DEVICE_BITS = &h7F
const InputClassBits = &h3F
const ModeBitsShift = 6
const numInputClasses = 7
const IEVENTS = 17
const IERRORS = 5
const IREQUESTS = 39
const CLIENT_REQ = 1

type _XExtEventInfo
	mask as CARD32
	as UBYTE type
	word as UBYTE
end type

type XExtEventInfo as _XExtEventInfo
type Pointer as any ptr

type tmask
	mask as CARD32
	dev as any ptr
end type

const XI_DeviceValuator = 0
const XI_DeviceKeyPress = 1
const XI_DeviceKeyRelease = 2
const XI_DeviceButtonPress = 3
const XI_DeviceButtonRelease = 4
const XI_DeviceMotionNotify = 5
const XI_DeviceFocusIn = 6
const XI_DeviceFocusOut = 7
const XI_ProximityIn = 8
const XI_ProximityOut = 9
const XI_DeviceStateNotify = 10
const XI_DeviceMappingNotify = 11
const XI_ChangeDeviceNotify = 12
const XI_DeviceKeystateNotify = 13
const XI_DeviceButtonstateNotify = 14
const XI_DevicePresenceNotify = 15
const XI_DevicePropertyNotify = 16
const X_GetExtensionVersion = 1
const X_ListInputDevices = 2
const X_OpenDevice = 3
const X_CloseDevice = 4
const X_SetDeviceMode = 5
const X_SelectExtensionEvent = 6
const X_GetSelectedExtensionEvents = 7
const X_ChangeDeviceDontPropagateList = 8
const X_GetDeviceDontPropagateList = 9
const X_GetDeviceMotionEvents = 10
const X_ChangeKeyboardDevice = 11
const X_ChangePointerDevice = 12
const X_GrabDevice = 13
const X_UngrabDevice = 14
const X_GrabDeviceKey = 15
const X_UngrabDeviceKey = 16
const X_GrabDeviceButton = 17
const X_UngrabDeviceButton = 18
const X_AllowDeviceEvents = 19
const X_GetDeviceFocus = 20
const X_SetDeviceFocus = 21
const X_GetFeedbackControl = 22
const X_ChangeFeedbackControl = 23
const X_GetDeviceKeyMapping = 24
const X_ChangeDeviceKeyMapping = 25
const X_GetDeviceModifierMapping = 26
const X_SetDeviceModifierMapping = 27
const X_GetDeviceButtonMapping = 28
const X_SetDeviceButtonMapping = 29
const X_QueryDeviceState = 30
const X_SendExtensionEvent = 31
const X_DeviceBell = 32
const X_SetDeviceValuators = 33
const X_GetDeviceControl = 34
const X_ChangeDeviceControl = 35
const X_ListDeviceProperties = 36
const X_ChangeDeviceProperty = 37
const X_DeleteDeviceProperty = 38
const X_GetDeviceProperty = 39

type xGetExtensionVersionReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
	nbytes as CARD16
	pad1 as CARD8
	pad2 as CARD8
end type

type xGetExtensionVersionReply
	repType as CARD8
	RepType as CARD8
	sequenceNumber as CARD16
	length as CARD32
	major_version as CARD16
	minor_version as CARD16
	present as BOOL
	pad1 as CARD8
	pad2 as CARD8
	pad3 as CARD8
	pad01 as CARD32
	pad02 as CARD32
	pad03 as CARD32
	pad04 as CARD32
end type

type xListInputDevicesReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
end type

type xListInputDevicesReply
	repType as CARD8
	RepType as CARD8
	sequenceNumber as CARD16
	length as CARD32
	ndevices as CARD8
	pad1 as CARD8
	pad2 as CARD8
	pad3 as CARD8
	pad01 as CARD32
	pad02 as CARD32
	pad03 as CARD32
	pad04 as CARD32
	pad05 as CARD32
end type

type xDeviceInfoPtr as _xDeviceInfo ptr
type xAnyClassPtr as _xAnyClassinfo ptr

type _xAnyClassinfo
	class as CARD8
	length as CARD8
end type

type xAnyClassInfo as _xAnyClassinfo

type _xDeviceInfo
	as CARD32 type
	id as CARD8
	num_classes as CARD8
	use as CARD8
	attached as CARD8
end type

type xDeviceInfo as _xDeviceInfo
type xKeyInfoPtr as _xKeyInfo ptr

type _xKeyInfo
	class as CARD8
	length as CARD8
	min_keycode as CARD8
	max_keycode as CARD8
	num_keys as CARD16
	pad1 as CARD8
	pad2 as CARD8
end type

type xKeyInfo as _xKeyInfo
type xButtonInfoPtr as _xButtonInfo ptr

type _xButtonInfo
	class as CARD8
	length as CARD8
	num_buttons as CARD16
end type

type xButtonInfo as _xButtonInfo
type xValuatorInfoPtr as _xValuatorInfo ptr

type _xValuatorInfo
	class as CARD8
	length as CARD8
	num_axes as CARD8
	mode as CARD8
	motion_buffer_size as CARD32
end type

type xValuatorInfo as _xValuatorInfo
type xAxisInfoPtr as _xAxisInfo ptr

type _xAxisInfo
	resolution as CARD32
	min_value as CARD32
	max_value as CARD32
end type

type xAxisInfo as _xAxisInfo

type xOpenDeviceReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
	deviceid as CARD8
	pad1 as UBYTE
	pad2 as UBYTE
	pad3 as UBYTE
end type

type xOpenDeviceReply
	repType as CARD8
	RepType as CARD8
	sequenceNumber as CARD16
	length as CARD32
	num_classes as CARD8
	pad1 as UBYTE
	pad2 as UBYTE
	pad3 as UBYTE
	pad00 as CARD32
	pad01 as CARD32
	pad02 as CARD32
	pad03 as CARD32
	pad04 as CARD32
end type

type xInputClassInfo
	class as CARD8
	event_type_base as CARD8
end type

type xCloseDeviceReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
	deviceid as CARD8
	pad1 as UBYTE
	pad2 as UBYTE
	pad3 as UBYTE
end type

type xSetDeviceModeReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
	deviceid as CARD8
	mode as CARD8
	pad1 as UBYTE
	pad2 as UBYTE
end type

type xSetDeviceModeReply
	repType as CARD8
	RepType as CARD8
	sequenceNumber as CARD16
	length as CARD32
	status as CARD8
	pad1 as UBYTE
	pad2 as UBYTE
	pad3 as UBYTE
	pad01 as CARD32
	pad02 as CARD32
	pad03 as CARD32
	pad04 as CARD32
	pad05 as CARD32
end type

type xSelectExtensionEventReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
	window as CARD32
	count as CARD16
	pad00 as CARD16
end type

type xGetSelectedExtensionEventsReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
	window as CARD32
end type

type xGetSelectedExtensionEventsReply
	repType as CARD8
	RepType as CARD8
	sequenceNumber as CARD16
	length as CARD32
	this_client_count as CARD16
	all_clients_count as CARD16
	pad01 as CARD32
	pad02 as CARD32
	pad03 as CARD32
	pad04 as CARD32
	pad05 as CARD32
end type

type xChangeDeviceDontPropagateListReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
	window as CARD32
	count as CARD16
	mode as CARD8
	pad as UBYTE
end type

type xGetDeviceDontPropagateListReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
	window as CARD32
end type

type xGetDeviceDontPropagateListReply
	repType as CARD8
	RepType as CARD8
	sequenceNumber as CARD16
	length as CARD32
	count as CARD16
	pad00 as CARD16
	pad01 as CARD32
	pad02 as CARD32
	pad03 as CARD32
	pad04 as CARD32
	pad05 as CARD32
end type

type xGetDeviceMotionEventsReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
	start as CARD32
	stop as CARD32
	deviceid as CARD8
	pad1 as UBYTE
	pad2 as UBYTE
	pad3 as UBYTE
end type

type xGetDeviceMotionEventsReply
	repType as CARD8
	RepType as CARD8
	sequenceNumber as CARD16
	length as CARD32
	nEvents as CARD32
	axes as CARD8
	mode as CARD8
	pad1 as UBYTE
	pad2 as UBYTE
	pad01 as CARD32
	pad02 as CARD32
	pad03 as CARD32
	pad04 as CARD32
end type

type xChangeKeyboardDeviceReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
	deviceid as CARD8
	pad1 as UBYTE
	pad2 as UBYTE
	pad3 as UBYTE
end type

type xChangeKeyboardDeviceReply
	repType as CARD8
	RepType as CARD8
	sequenceNumber as CARD16
	length as CARD32
	status as CARD8
	pad1 as UBYTE
	pad2 as UBYTE
	pad3 as UBYTE
	pad01 as CARD32
	pad02 as CARD32
	pad03 as CARD32
	pad04 as CARD32
	pad05 as CARD32
end type

type xChangePointerDeviceReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
	xaxis as CARD8
	yaxis as CARD8
	deviceid as CARD8
	pad1 as UBYTE
end type

type xChangePointerDeviceReply
	repType as CARD8
	RepType as CARD8
	sequenceNumber as CARD16
	length as CARD32
	status as CARD8
	pad1 as UBYTE
	pad2 as UBYTE
	pad3 as UBYTE
	pad01 as CARD32
	pad02 as CARD32
	pad03 as CARD32
	pad04 as CARD32
	pad05 as CARD32
end type

type xGrabDeviceReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
	grabWindow as CARD32
	time as CARD32
	event_count as CARD16
	this_device_mode as CARD8
	other_devices_mode as CARD8
	ownerEvents as BOOL
	deviceid as CARD8
	pad01 as CARD16
end type

type xGrabDeviceReply
	repType as CARD8
	RepType as CARD8
	sequenceNumber as CARD16
	length as CARD32
	status as CARD8
	pad1 as UBYTE
	pad2 as UBYTE
	pad3 as UBYTE
	pad01 as CARD32
	pad02 as CARD32
	pad03 as CARD32
	pad04 as CARD32
	pad05 as CARD32
end type

type xUngrabDeviceReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
	time as CARD32
	deviceid as CARD8
	pad1 as UBYTE
	pad2 as UBYTE
	pad3 as UBYTE
end type

type xGrabDeviceKeyReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
	grabWindow as CARD32
	event_count as CARD16
	modifiers as CARD16
	modifier_device as CARD8
	grabbed_device as CARD8
	key as CARD8
	this_device_mode as UBYTE
	other_devices_mode as UBYTE
	ownerEvents as BOOL
	pad1 as UBYTE
	pad2 as UBYTE
end type

type xUngrabDeviceKeyReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
	grabWindow as CARD32
	modifiers as CARD16
	modifier_device as CARD8
	key as CARD8
	grabbed_device as CARD8
	pad1 as UBYTE
	pad2 as UBYTE
	pad3 as UBYTE
end type

type xGrabDeviceButtonReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
	grabWindow as CARD32
	grabbed_device as CARD8
	modifier_device as CARD8
	event_count as CARD16
	modifiers as CARD16
	this_device_mode as UBYTE
	other_devices_mode as UBYTE
	button as CARD8
	ownerEvents as BOOL
	pad1 as UBYTE
	pad2 as UBYTE
end type

type xUngrabDeviceButtonReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
	grabWindow as CARD32
	modifiers as CARD16
	modifier_device as CARD8
	button as CARD8
	grabbed_device as CARD8
	pad1 as UBYTE
	pad2 as UBYTE
	pad3 as UBYTE
end type

type xAllowDeviceEventsReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
	time as CARD32
	mode as CARD8
	deviceid as CARD8
	pad1 as UBYTE
	pad2 as UBYTE
end type

type xGetDeviceFocusReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
	deviceid as CARD8
	pad1 as UBYTE
	pad2 as UBYTE
	pad3 as UBYTE
end type

type xGetDeviceFocusReply
	repType as CARD8
	RepType as CARD8
	sequenceNumber as CARD16
	length as CARD32
	focus as CARD32
	time as CARD32
	revertTo as CARD8
	pad1 as UBYTE
	pad2 as UBYTE
	pad3 as UBYTE
	pad01 as CARD32
	pad02 as CARD32
	pad03 as CARD32
end type

type xSetDeviceFocusReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
	focus as CARD32
	time as CARD32
	revertTo as CARD8
	device as CARD8
	pad01 as CARD16
end type

type xGetFeedbackControlReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
	deviceid as CARD8
	pad1 as UBYTE
	pad2 as UBYTE
	pad3 as UBYTE
end type

type xGetFeedbackControlReply
	repType as CARD8
	RepType as CARD8
	sequenceNumber as CARD16
	length as CARD32
	num_feedbacks as CARD16
	pad01 as CARD16
	pad02 as CARD32
	pad03 as CARD32
	pad04 as CARD32
	pad05 as CARD32
	pad06 as CARD32
end type

type xFeedbackState
	class as CARD8
	id as CARD8
	length as CARD16
end type

type xKbdFeedbackState
	class as CARD8
	id as CARD8
	length as CARD16
	pitch as CARD16
	duration as CARD16
	led_mask as CARD32
	led_values as CARD32
	global_auto_repeat as BOOL
	click as CARD8
	percent as CARD8
	pad as UBYTE
	auto_repeats(0 to 31) as UBYTE
end type

type xPtrFeedbackState
	class as CARD8
	id as CARD8
	length as CARD16
	pad1 as CARD8
	pad2 as CARD8
	accelNum as CARD16
	accelDenom as CARD16
	threshold as CARD16
end type

type xIntegerFeedbackState
	class as CARD8
	id as CARD8
	length as CARD16
	resolution as CARD32
	min_value as INT32
	max_value as INT32
end type

type xStringFeedbackState
	class as CARD8
	id as CARD8
	length as CARD16
	max_symbols as CARD16
	num_syms_supported as CARD16
end type

type xBellFeedbackState
	class as CARD8
	id as CARD8
	length as CARD16
	percent as CARD8
	pad1 as UBYTE
	pad2 as UBYTE
	pad3 as UBYTE
	pitch as CARD16
	duration as CARD16
end type

type xLedFeedbackState
	class as CARD8
	id as CARD8
	length as CARD16
	led_mask as CARD32
	led_values as CARD32
end type

type xChangeFeedbackControlReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
	mask as CARD32
	deviceid as CARD8
	feedbackid as CARD8
	pad1 as UBYTE
	pad2 as UBYTE
end type

type xFeedbackCtl
	class as CARD8
	id as CARD8
	length as CARD16
end type

type xKbdFeedbackCtl
	class as CARD8
	id as CARD8
	length as CARD16
	key as CARD8
	auto_repeat_mode as CARD8
	click as INT8
	percent as INT8
	pitch as INT16
	duration as INT16
	led_mask as CARD32
	led_values as CARD32
end type

type xPtrFeedbackCtl
	class as CARD8
	id as CARD8
	length as CARD16
	pad1 as CARD8
	pad2 as CARD8
	num as INT16
	denom as INT16
	thresh as INT16
end type

type xIntegerFeedbackCtl
	class as CARD8
	id as CARD8
	length as CARD16
	int_to_display as INT32
end type

type xStringFeedbackCtl
	class as CARD8
	id as CARD8
	length as CARD16
	pad1 as CARD8
	pad2 as CARD8
	num_keysyms as CARD16
end type

type xBellFeedbackCtl
	class as CARD8
	id as CARD8
	length as CARD16
	percent as INT8
	pad1 as UBYTE
	pad2 as UBYTE
	pad3 as UBYTE
	pitch as INT16
	duration as INT16
end type

type xLedFeedbackCtl
	class as CARD8
	id as CARD8
	length as CARD16
	led_mask as CARD32
	led_values as CARD32
end type

type xGetDeviceKeyMappingReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
	deviceid as CARD8
	firstKeyCode as CARD8
	count as CARD8
	pad1 as UBYTE
end type

type xGetDeviceKeyMappingReply
	repType as CARD8
	RepType as CARD8
	sequenceNumber as CARD16
	length as CARD32
	keySymsPerKeyCode as CARD8
	pad0 as CARD8
	pad1 as CARD16
	pad2 as CARD32
	pad3 as CARD32
	pad4 as CARD32
	pad5 as CARD32
	pad6 as CARD32
end type

type xChangeDeviceKeyMappingReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
	deviceid as CARD8
	firstKeyCode as CARD8
	keySymsPerKeyCode as CARD8
	keyCodes as CARD8
end type

type xGetDeviceModifierMappingReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
	deviceid as CARD8
	pad1 as UBYTE
	pad2 as UBYTE
	pad3 as UBYTE
end type

type xGetDeviceModifierMappingReply
	repType as CARD8
	RepType as CARD8
	sequenceNumber as CARD16
	length as CARD32
	numKeyPerModifier as CARD8
	pad0 as CARD8
	pad1 as CARD16
	pad2 as CARD32
	pad3 as CARD32
	pad4 as CARD32
	pad5 as CARD32
	pad6 as CARD32
end type

type xSetDeviceModifierMappingReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
	deviceid as CARD8
	numKeyPerModifier as CARD8
	pad1 as CARD16
end type

type xSetDeviceModifierMappingReply
	repType as CARD8
	RepType as CARD8
	sequenceNumber as CARD16
	length as CARD32
	success as CARD8
	pad0 as CARD8
	pad1 as CARD16
	pad2 as CARD32
	pad3 as CARD32
	pad4 as CARD32
	pad5 as CARD32
	pad6 as CARD32
end type

type xGetDeviceButtonMappingReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
	deviceid as CARD8
	pad1 as UBYTE
	pad2 as UBYTE
	pad3 as UBYTE
end type

type xGetDeviceButtonMappingReply
	repType as CARD8
	RepType as CARD8
	sequenceNumber as CARD16
	length as CARD32
	nElts as CARD8
	pad1 as UBYTE
	pad2 as UBYTE
	pad3 as UBYTE
	pad01 as CARD32
	pad02 as CARD32
	pad03 as CARD32
	pad04 as CARD32
	pad05 as CARD32
end type

type xSetDeviceButtonMappingReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
	deviceid as CARD8
	map_length as CARD8
	pad1 as UBYTE
	pad2 as UBYTE
end type

type xSetDeviceButtonMappingReply
	repType as CARD8
	RepType as CARD8
	sequenceNumber as CARD16
	length as CARD32
	status as CARD8
	pad0 as UBYTE
	pad1 as CARD16
	pad2 as CARD32
	pad3 as CARD32
	pad4 as CARD32
	pad5 as CARD32
	pad6 as CARD32
end type

type xQueryDeviceStateReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
	deviceid as CARD8
	pad1 as UBYTE
	pad2 as UBYTE
	pad3 as UBYTE
end type

type xQueryDeviceStateReply
	repType as CARD8
	RepType as CARD8
	sequenceNumber as CARD16
	length as CARD32
	num_classes as CARD8
	pad0 as UBYTE
	pad1 as CARD16
	pad2 as CARD32
	pad3 as CARD32
	pad4 as CARD32
	pad5 as CARD32
	pad6 as CARD32
end type

type xKeyState
	class as CARD8
	length as CARD8
	num_keys as CARD8
	pad1 as UBYTE
	keys(0 to 31) as CARD8
end type

type xButtonState
	class as CARD8
	length as CARD8
	num_buttons as CARD8
	pad1 as UBYTE
	buttons(0 to 31) as CARD8
end type

type xValuatorState
	class as CARD8
	length as CARD8
	num_valuators as CARD8
	mode as CARD8
end type

type xSendExtensionEventReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
	destination as CARD32
	deviceid as CARD8
	propagate as BOOL
	count as CARD16
	num_events as CARD8
	pad1 as UBYTE
	pad2 as UBYTE
	pad3 as UBYTE
end type

type xDeviceBellReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
	deviceid as CARD8
	feedbackid as CARD8
	feedbackclass as CARD8
	percent as INT8
end type

type xSetDeviceValuatorsReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
	deviceid as CARD8
	first_valuator as CARD8
	num_valuators as CARD8
	pad1 as UBYTE
end type

type xSetDeviceValuatorsReply
	repType as CARD8
	RepType as CARD8
	sequenceNumber as CARD16
	length as CARD32
	status as CARD8
	pad1 as UBYTE
	pad2 as UBYTE
	pad3 as UBYTE
	pad01 as CARD32
	pad02 as CARD32
	pad03 as CARD32
	pad04 as CARD32
	pad05 as CARD32
end type

type xGetDeviceControlReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
	control as CARD16
	deviceid as CARD8
	pad2 as UBYTE
end type

type xGetDeviceControlReply
	repType as CARD8
	RepType as CARD8
	sequenceNumber as CARD16
	length as CARD32
	status as CARD8
	pad1 as UBYTE
	pad2 as UBYTE
	pad3 as UBYTE
	pad01 as CARD32
	pad02 as CARD32
	pad03 as CARD32
	pad04 as CARD32
	pad05 as CARD32
end type

type xDeviceState
	control as CARD16
	length as CARD16
end type

type xDeviceResolutionState
	control as CARD16
	length as CARD16
	num_valuators as CARD32
end type

type xDeviceAbsCalibState
	control as CARD16
	length as CARD16
	min_x as INT32
	max_x as INT32
	min_y as INT32
	max_y as INT32
	flip_x as CARD32
	flip_y as CARD32
	rotation as CARD32
	button_threshold as CARD32
end type

type xDeviceAbsAreaState
	control as CARD16
	length as CARD16
	offset_x as CARD32
	offset_y as CARD32
	width as CARD32
	height as CARD32
	screen as CARD32
	following as CARD32
end type

type xDeviceCoreState
	control as CARD16
	length as CARD16
	status as CARD8
	iscore as CARD8
	pad1 as CARD16
end type

type xDeviceEnableState
	control as CARD16
	length as CARD16
	enable as CARD8
	pad0 as CARD8
	pad1 as CARD16
end type

type xChangeDeviceControlReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
	control as CARD16
	deviceid as CARD8
	pad0 as UBYTE
end type

type xChangeDeviceControlReply
	repType as CARD8
	RepType as CARD8
	sequenceNumber as CARD16
	length as CARD32
	status as CARD8
	pad1 as UBYTE
	pad2 as UBYTE
	pad3 as UBYTE
	pad01 as CARD32
	pad02 as CARD32
	pad03 as CARD32
	pad04 as CARD32
	pad05 as CARD32
end type

type xDeviceCtl
	control as CARD16
	length as CARD16
end type

type xDeviceResolutionCtl
	control as CARD16
	length as CARD16
	first_valuator as CARD8
	num_valuators as CARD8
	pad1 as CARD8
	pad2 as CARD8
end type

type xDeviceAbsCalibCtl
	control as CARD16
	length as CARD16
	min_x as INT32
	max_x as INT32
	min_y as INT32
	max_y as INT32
	flip_x as CARD32
	flip_y as CARD32
	rotation as CARD32
	button_threshold as CARD32
end type

type xDeviceAbsAreaCtl
	control as CARD16
	length as CARD16
	offset_x as CARD32
	offset_y as CARD32
	width as INT32
	height as INT32
	screen as INT32
	following as CARD32
end type

type xDeviceCoreCtl
	control as CARD16
	length as CARD16
	status as CARD8
	pad0 as CARD8
	pad1 as CARD16
end type

type xDeviceEnableCtl
	control as CARD16
	length as CARD16
	enable as CARD8
	pad0 as CARD8
	pad1 as CARD16
end type

type xListDevicePropertiesReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
	deviceid as CARD8
	pad0 as CARD8
	pad1 as CARD16
end type

type xListDevicePropertiesReply
	repType as CARD8
	RepType as CARD8
	sequenceNumber as CARD16
	length as CARD32
	nAtoms as CARD16
	pad1 as CARD16
	pad2 as CARD32
	pad3 as CARD32
	pad4 as CARD32
	pad5 as CARD32
	pad6 as CARD32
end type

type xChangeDevicePropertyReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
	property as CARD32
	as CARD32 type
	deviceid as CARD8
	format as CARD8
	mode as CARD8
	pad as CARD8
	nUnits as CARD32
end type

type xDeleteDevicePropertyReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
	property as CARD32
	deviceid as CARD8
	pad0 as CARD8
	pad1 as CARD16
end type

type xGetDevicePropertyReq
	reqType as CARD8
	ReqType as CARD8
	length as CARD16
	property as CARD32
	as CARD32 type
	longOffset as CARD32
	longLength as CARD32
	deviceid as CARD8
	delete_ as BOOL
	pad as CARD16
end type

type xGetDevicePropertyReply
	repType as CARD8
	RepType as CARD8
	sequenceNumber as CARD16
	length as CARD32
	propertyType as CARD32
	bytesAfter as CARD32
	nItems as CARD32
	format as CARD8
	deviceid as CARD8
	pad1 as CARD16
	pad2 as CARD32
	pad3 as CARD32
end type

type deviceValuator
	as UBYTE type
	deviceid as CARD8
	sequenceNumber as CARD16
	device_state as KeyButMask
	num_valuators as CARD8
	first_valuator as CARD8
	valuator0 as INT32
	valuator1 as INT32
	valuator2 as INT32
	valuator3 as INT32
	valuator4 as INT32
	valuator5 as INT32
end type

type deviceKeyButtonPointer
	as UBYTE type
	detail as UBYTE
	sequenceNumber as CARD16
	time as CARD32
	root as CARD32
	event as CARD32
	child as CARD32
	root_x as INT16
	root_y as INT16
	event_x as INT16
	event_y as INT16
	state as KeyButMask
	same_screen as BOOL
	deviceid as CARD8
end type

type deviceFocus
	as UBYTE type
	detail as UBYTE
	sequenceNumber as CARD16
	time as CARD32
	window as CARD32
	mode as UBYTE
	deviceid as CARD8
	pad1 as UBYTE
	pad2 as UBYTE
	pad00 as CARD32
	pad01 as CARD32
	pad02 as CARD32
	pad03 as CARD32
end type

type deviceStateNotify
	as UBYTE type
	deviceid as UBYTE
	sequenceNumber as CARD16
	time as CARD32
	num_keys as CARD8
	num_buttons as CARD8
	num_valuators as CARD8
	classes_reported as CARD8
	buttons(0 to 3) as CARD8
	keys(0 to 3) as CARD8
	valuator0 as INT32
	valuator1 as INT32
	valuator2 as INT32
end type

type deviceKeyStateNotify
	as UBYTE type
	deviceid as UBYTE
	sequenceNumber as CARD16
	keys(0 to 27) as CARD8
end type

type deviceButtonStateNotify
	as UBYTE type
	deviceid as UBYTE
	sequenceNumber as CARD16
	buttons(0 to 27) as CARD8
end type

type deviceMappingNotify
	as UBYTE type
	deviceid as UBYTE
	sequenceNumber as CARD16
	request as CARD8
	firstKeyCode as CARD8
	count as CARD8
	pad1 as UBYTE
	time as CARD32
	pad00 as CARD32
	pad01 as CARD32
	pad02 as CARD32
	pad03 as CARD32
	pad04 as CARD32
end type

type changeDeviceNotify
	as UBYTE type
	deviceid as UBYTE
	sequenceNumber as CARD16
	time as CARD32
	request as CARD8
	pad1 as UBYTE
	pad2 as UBYTE
	pad3 as UBYTE
	pad00 as CARD32
	pad01 as CARD32
	pad02 as CARD32
	pad03 as CARD32
	pad04 as CARD32
end type

type devicePresenceNotify
	as UBYTE type
	pad00 as UBYTE
	sequenceNumber as CARD16
	time as CARD32
	devchange as UBYTE
	deviceid as UBYTE
	control as CARD16
	pad02 as CARD32
	pad03 as CARD32
	pad04 as CARD32
	pad05 as CARD32
	pad06 as CARD32
end type

type devicePropertyNotify
	as UBYTE type
	state as UBYTE
	sequenceNumber as CARD16
	time as CARD32
	atom as CARD32
	pad0 as CARD32
	pad1 as CARD32
	pad2 as CARD32
	pad3 as CARD32
	pad5 as CARD16
	pad4 as CARD8
	deviceid as CARD8
end type
