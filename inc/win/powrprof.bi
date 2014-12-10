#pragma once

#include once "crt/wchar.bi"

#ifdef __FB_64BIT__
	extern "C"
#else
	extern "Windows"
#endif

type _GLOBAL_MACHINE_POWER_POLICY
	Revision as ULONG_
	LidOpenWakeAc as SYSTEM_POWER_STATE
	LidOpenWakeDc as SYSTEM_POWER_STATE
	BroadcastCapacityResolution as ULONG_
end type

type GLOBAL_MACHINE_POWER_POLICY as _GLOBAL_MACHINE_POWER_POLICY
type PGLOBAL_MACHINE_POWER_POLICY as _GLOBAL_MACHINE_POWER_POLICY ptr

type _GLOBAL_USER_POWER_POLICY
	Revision as ULONG_
	PowerButtonAc as POWER_ACTION_POLICY
	PowerButtonDc as POWER_ACTION_POLICY
	SleepButtonAc as POWER_ACTION_POLICY
	SleepButtonDc as POWER_ACTION_POLICY
	LidCloseAc as POWER_ACTION_POLICY
	LidCloseDc as POWER_ACTION_POLICY
	DischargePolicy(0 to 3) as SYSTEM_POWER_LEVEL
	GlobalFlags as ULONG_
end type

type GLOBAL_USER_POWER_POLICY as _GLOBAL_USER_POWER_POLICY
type PGLOBAL_USER_POWER_POLICY as _GLOBAL_USER_POWER_POLICY ptr

type _GLOBAL_POWER_POLICY
	user as GLOBAL_USER_POWER_POLICY
	mach as GLOBAL_MACHINE_POWER_POLICY
end type

type GLOBAL_POWER_POLICY as _GLOBAL_POWER_POLICY
type PGLOBAL_POWER_POLICY as _GLOBAL_POWER_POLICY ptr

type _MACHINE_POWER_POLICY
	Revision as ULONG_
	MinSleepAc as SYSTEM_POWER_STATE
	MinSleepDc as SYSTEM_POWER_STATE
	ReducedLatencySleepAc as SYSTEM_POWER_STATE
	ReducedLatencySleepDc as SYSTEM_POWER_STATE
	DozeTimeoutAc as ULONG_
	DozeTimeoutDc as ULONG_
	DozeS4TimeoutAc as ULONG_
	DozeS4TimeoutDc as ULONG_
	MinThrottleAc as UCHAR
	MinThrottleDc as UCHAR
	pad1(0 to 1) as UCHAR
	OverThrottledAc as POWER_ACTION_POLICY
	OverThrottledDc as POWER_ACTION_POLICY
end type

type MACHINE_POWER_POLICY as _MACHINE_POWER_POLICY
type PMACHINE_POWER_POLICY as _MACHINE_POWER_POLICY ptr

type _MACHINE_PROCESSOR_POWER_POLICY
	Revision as ULONG_
	ProcessorPolicyAc as PROCESSOR_POWER_POLICY
	ProcessorPolicyDc as PROCESSOR_POWER_POLICY
end type

type MACHINE_PROCESSOR_POWER_POLICY as _MACHINE_PROCESSOR_POWER_POLICY
type PMACHINE_PROCESSOR_POWER_POLICY as _MACHINE_PROCESSOR_POWER_POLICY ptr

type _USER_POWER_POLICY
	Revision as ULONG_
	IdleAc as POWER_ACTION_POLICY
	IdleDc as POWER_ACTION_POLICY
	IdleTimeoutAc as ULONG_
	IdleTimeoutDc as ULONG_
	IdleSensitivityAc as UCHAR
	IdleSensitivityDc as UCHAR
	ThrottlePolicyAc as UCHAR
	ThrottlePolicyDc as UCHAR
	MaxSleepAc as SYSTEM_POWER_STATE
	MaxSleepDc as SYSTEM_POWER_STATE
	Reserved(0 to 1) as ULONG_
	VideoTimeoutAc as ULONG_
	VideoTimeoutDc as ULONG_
	SpindownTimeoutAc as ULONG_
	SpindownTimeoutDc as ULONG_
	OptimizeForPowerAc as BOOLEAN
	OptimizeForPowerDc as BOOLEAN
	FanThrottleToleranceAc as UCHAR
	FanThrottleToleranceDc as UCHAR
	ForcedThrottleAc as UCHAR
	ForcedThrottleDc as UCHAR
end type

type USER_POWER_POLICY as _USER_POWER_POLICY
type PUSER_POWER_POLICY as _USER_POWER_POLICY ptr

type _POWER_POLICY
	user as USER_POWER_POLICY
	mach as MACHINE_POWER_POLICY
end type

type POWER_POLICY as _POWER_POLICY
type PPOWER_POLICY as _POWER_POLICY ptr

#define EnableSysTrayBatteryMeter &h01
#define EnableMultiBatteryDisplay &h02
#define EnablePasswordLogon &h04
#define EnableWakeOnRing &h08
#define EnableVideoDimDisplay &h10
#define NEWSCHEME cast(UINT, -1)

type PWRSCHEMESENUMPROC as function(byval as UINT, byval as DWORD, byval as LPTSTR, byval as DWORD, byval as LPTSTR, byval as PPOWER_POLICY, byval as LPARAM) as BOOLEAN
type PFNNTINITIATEPWRACTION as function(byval as POWER_ACTION, byval as SYSTEM_POWER_STATE, byval as ULONG_, byval as BOOLEAN) as BOOLEAN

declare function GetPwrDiskSpindownRange(byval as PUINT, byval as PUINT) as BOOLEAN
declare function EnumPwrSchemes(byval as PWRSCHEMESENUMPROC, byval as LPARAM) as BOOLEAN
declare function ReadGlobalPwrPolicy(byval as PGLOBAL_POWER_POLICY) as BOOLEAN
declare function ReadPwrScheme(byval as UINT, byval as PPOWER_POLICY) as BOOLEAN
declare function WritePwrScheme(byval as PUINT, byval as LPTSTR, byval as LPTSTR, byval as PPOWER_POLICY) as BOOLEAN
declare function WriteGlobalPwrPolicy(byval as PGLOBAL_POWER_POLICY) as BOOLEAN
declare function DeletePwrScheme(byval as UINT) as BOOLEAN
declare function GetActivePwrScheme(byval as PUINT) as BOOLEAN
declare function SetActivePwrScheme(byval as UINT, byval as PGLOBAL_POWER_POLICY, byval as PPOWER_POLICY) as BOOLEAN
declare function GetPwrCapabilities(byval as PSYSTEM_POWER_CAPABILITIES) as BOOLEAN
declare function IsPwrSuspendAllowed() as BOOLEAN
declare function IsPwrHibernateAllowed() as BOOLEAN
declare function IsPwrShutdownAllowed() as BOOLEAN
declare function IsAdminOverrideActive(byval as PADMINISTRATOR_POWER_POLICY) as BOOLEAN
declare function SetSuspendState(byval as BOOLEAN, byval as BOOLEAN, byval as BOOLEAN) as BOOLEAN
declare function GetCurrentPowerPolicies(byval as PGLOBAL_POWER_POLICY, byval as PPOWER_POLICY) as BOOLEAN
declare function CanUserWritePwrScheme() as BOOLEAN
declare function ReadProcessorPwrScheme(byval as UINT, byval as PMACHINE_PROCESSOR_POWER_POLICY) as BOOLEAN
declare function WriteProcessorPwrScheme(byval as UINT, byval as PMACHINE_PROCESSOR_POWER_POLICY) as BOOLEAN
declare function ValidatePowerPolicies(byval as PGLOBAL_POWER_POLICY, byval as PPOWER_POLICY) as BOOLEAN

#define _OVERRIDE_NTSTATUS_

declare function CallNtPowerInformation(byval as POWER_INFORMATION_LEVEL, byval as PVOID, byval as ULONG_, byval as PVOID, byval as ULONG_) as LONG_

end extern
