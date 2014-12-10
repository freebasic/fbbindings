#pragma once

#include once "_mingw_unicode.bi"

extern "C"

#define _PSAPI_H_
#define GetModuleBaseName __MINGW_NAME_AW(GetModuleBaseName)
#define GetModuleFileNameEx __MINGW_NAME_AW(GetModuleFileNameEx)
#define GetMappedFileName __MINGW_NAME_AW(GetMappedFileName)
#define GetDeviceDriverBaseName __MINGW_NAME_AW(GetDeviceDriverBaseName)
#define GetDeviceDriverFileName __MINGW_NAME_AW(GetDeviceDriverFileName)
#define PENUM_PAGE_FILE_CALLBACK __MINGW_NAME_AW(PENUM_PAGE_FILE_CALLBACK)
#define EnumPageFiles __MINGW_NAME_AW(EnumPageFiles)
#define GetProcessImageFileName __MINGW_NAME_AW(GetProcessImageFileName)
#define LIST_MODULES_DEFAULT &h0
#define LIST_MODULES_32BIT &h01
#define LIST_MODULES_64BIT &h02
#define LIST_MODULES_ALL (LIST_MODULES_32BIT or LIST_MODULES_64BIT)

extern     WINAPI as WINBOOL
dim shared WINAPI as WINBOOL

'' TODO: WINBOOL WINAPI EnumProcesses(DWORD *lpidProcess,DWORD cb,DWORD *cbNeeded);
'' TODO: WINBOOL WINAPI EnumProcessModules(HANDLE hProcess,HMODULE *lphModule,DWORD cb,LPDWORD lpcbNeeded);
'' TODO: DWORD WINAPI GetModuleBaseNameA(HANDLE hProcess,HMODULE hModule,LPSTR lpBaseName,DWORD nSize);
'' TODO: DWORD WINAPI GetModuleBaseNameW(HANDLE hProcess,HMODULE hModule,LPWSTR lpBaseName,DWORD nSize);
'' TODO: DWORD WINAPI GetModuleFileNameExA(HANDLE hProcess,HMODULE hModule,LPSTR lpFilename,DWORD nSize);
'' TODO: DWORD WINAPI GetModuleFileNameExW(HANDLE hProcess,HMODULE hModule,LPWSTR lpFilename,DWORD nSize);

type _MODULEINFO
	lpBaseOfDll as LPVOID
	SizeOfImage as DWORD
	EntryPoint as LPVOID
end type

type MODULEINFO as _MODULEINFO
type LPMODULEINFO as _MODULEINFO ptr

'' TODO: WINBOOL WINAPI GetModuleInformation(HANDLE hProcess,HMODULE hModule,LPMODULEINFO lpmodinfo,DWORD cb);
'' TODO: WINBOOL WINAPI EmptyWorkingSet(HANDLE hProcess);
'' TODO: WINBOOL WINAPI QueryWorkingSet(HANDLE hProcess,PVOID pv,DWORD cb);
'' TODO: WINBOOL WINAPI QueryWorkingSetEx(HANDLE hProcess,PVOID pv,DWORD cb);
'' TODO: WINBOOL WINAPI InitializeProcessForWsWatch(HANDLE hProcess);

type _PSAPI_WS_WATCH_INFORMATION
	FaultingPc as LPVOID
	FaultingVa as LPVOID
end type

type PSAPI_WS_WATCH_INFORMATION as _PSAPI_WS_WATCH_INFORMATION
type PPSAPI_WS_WATCH_INFORMATION as _PSAPI_WS_WATCH_INFORMATION ptr

'' TODO: WINBOOL WINAPI GetWsChanges(HANDLE hProcess,PPSAPI_WS_WATCH_INFORMATION lpWatchInfo,DWORD cb);
'' TODO: DWORD WINAPI GetMappedFileNameW(HANDLE hProcess,LPVOID lpv,LPWSTR lpFilename,DWORD nSize);
'' TODO: DWORD WINAPI GetMappedFileNameA(HANDLE hProcess,LPVOID lpv,LPSTR lpFilename,DWORD nSize);
'' TODO: WINBOOL WINAPI EnumDeviceDrivers(LPVOID *lpImageBase,DWORD cb,LPDWORD lpcbNeeded);
'' TODO: DWORD WINAPI GetDeviceDriverBaseNameA(LPVOID ImageBase,LPSTR lpBaseName,DWORD nSize);
'' TODO: DWORD WINAPI GetDeviceDriverBaseNameW(LPVOID ImageBase,LPWSTR lpBaseName,DWORD nSize);
'' TODO: DWORD WINAPI GetDeviceDriverFileNameA(LPVOID ImageBase,LPSTR lpFilename,DWORD nSize);
'' TODO: DWORD WINAPI GetDeviceDriverFileNameW(LPVOID ImageBase,LPWSTR lpFilename,DWORD nSize);

type _PROCESS_MEMORY_COUNTERS
	cb as DWORD
	PageFaultCount as DWORD
	PeakWorkingSetSize as SIZE_T
	WorkingSetSize as SIZE_T
	QuotaPeakPagedPoolUsage as SIZE_T
	QuotaPagedPoolUsage as SIZE_T
	QuotaPeakNonPagedPoolUsage as SIZE_T
	QuotaNonPagedPoolUsage as SIZE_T
	PagefileUsage as SIZE_T
	PeakPagefileUsage as SIZE_T
end type

type PROCESS_MEMORY_COUNTERS as _PROCESS_MEMORY_COUNTERS
type PPROCESS_MEMORY_COUNTERS as PROCESS_MEMORY_COUNTERS ptr

type _PROCESS_MEMORY_COUNTERS_EX
	cb as DWORD
	PageFaultCount as DWORD
	PeakWorkingSetSize as SIZE_T
	WorkingSetSize as SIZE_T
	QuotaPeakPagedPoolUsage as SIZE_T
	QuotaPagedPoolUsage as SIZE_T
	QuotaPeakNonPagedPoolUsage as SIZE_T
	QuotaNonPagedPoolUsage as SIZE_T
	PagefileUsage as SIZE_T
	PeakPagefileUsage as SIZE_T
	PrivateUsage as SIZE_T
end type

type PROCESS_MEMORY_COUNTERS_EX as _PROCESS_MEMORY_COUNTERS_EX
type PPROCESS_MEMORY_COUNTERS_EX as PROCESS_MEMORY_COUNTERS_EX ptr

'' TODO: WINBOOL WINAPI GetProcessMemoryInfo(HANDLE Process,PPROCESS_MEMORY_COUNTERS ppsmemCounters,DWORD cb);

type _PERFORMANCE_INFORMATION
	cb as DWORD
	CommitTotal as SIZE_T
	CommitLimit as SIZE_T
	CommitPeak as SIZE_T
	PhysicalTotal as SIZE_T
	PhysicalAvailable as SIZE_T
	SystemCache as SIZE_T
	KernelTotal as SIZE_T
	KernelPaged as SIZE_T
	KernelNonpaged as SIZE_T
	PageSize as SIZE_T
	HandleCount as DWORD
	ProcessCount as DWORD
	ThreadCount as DWORD
end type

type PERFORMANCE_INFORMATION as _PERFORMANCE_INFORMATION
type PPERFORMANCE_INFORMATION as _PERFORMANCE_INFORMATION ptr
type PERFORMACE_INFORMATION as _PERFORMANCE_INFORMATION
type PPERFORMACE_INFORMATION as _PERFORMANCE_INFORMATION ptr

'' TODO: WINBOOL WINAPI GetPerformanceInfo (PPERFORMACE_INFORMATION pPerformanceInformation,DWORD cb);

type _ENUM_PAGE_FILE_INFORMATION
	cb as DWORD
	Reserved as DWORD
	TotalSize as SIZE_T
	TotalInUse as SIZE_T
	PeakUsage as SIZE_T
end type

type ENUM_PAGE_FILE_INFORMATION as _ENUM_PAGE_FILE_INFORMATION
type PENUM_PAGE_FILE_INFORMATION as _ENUM_PAGE_FILE_INFORMATION ptr
type PENUM_PAGE_FILE_CALLBACKW as function(byval pContext as LPVOID, byval pPageFileInfo as PENUM_PAGE_FILE_INFORMATION, byval lpFilename as LPCWSTR) as WINBOOL
type PENUM_PAGE_FILE_CALLBACKA as function(byval pContext as LPVOID, byval pPageFileInfo as PENUM_PAGE_FILE_INFORMATION, byval lpFilename as LPCSTR) as WINBOOL

'' TODO: WINBOOL WINAPI EnumPageFilesW (PENUM_PAGE_FILE_CALLBACKW pCallBackRoutine,LPVOID pContext);
'' TODO: WINBOOL WINAPI EnumPageFilesA (PENUM_PAGE_FILE_CALLBACKA pCallBackRoutine,LPVOID pContext);
'' TODO: DWORD WINAPI GetProcessImageFileNameA(HANDLE hProcess,LPSTR lpImageFileName,DWORD nSize);
'' TODO: DWORD WINAPI GetProcessImageFileNameW(HANDLE hProcess,LPWSTR lpImageFileName,DWORD nSize);

type _PSAPI_WS_WATCH_INFORMATION_EX
	BasicInfo as PSAPI_WS_WATCH_INFORMATION
	FaultingThreadId as ULONG_PTR
	Flags as ULONG_PTR
end type

type PSAPI_WS_WATCH_INFORMATION_EX as _PSAPI_WS_WATCH_INFORMATION_EX
type PPSAPI_WS_WATCH_INFORMATION_EX as _PSAPI_WS_WATCH_INFORMATION_EX ptr

'' TODO: WINBOOL WINAPI GetWsChangesEx( HANDLE hProcess, PPSAPI_WS_WATCH_INFORMATION_EX lpWatchInfoEx, DWORD cb);
'' TODO: WINBOOL WINAPI EnumProcessModulesEx( HANDLE hProcess, HMODULE *lphModule, DWORD cb, LPDWORD lpcbNeeded, DWORD dwFilterFlag);

union _PSAPI_WORKING_SET_BLOCK
	Flags as ULONG_PTR

	#ifdef __FB_64BIT__
		'' TODO: __C89_NAMELESS struct { ULONG_PTR Protection :5; ULONG_PTR ShareCount :3; ULONG_PTR Shared :1; ULONG_PTR Reserved :3; ULONG_PTR VirtualPage :52; } ;
	#else
		'' TODO: __C89_NAMELESS struct { ULONG_PTR Protection :5; ULONG_PTR ShareCount :3; ULONG_PTR Shared :1; ULONG_PTR Reserved :3; ULONG_PTR VirtualPage :20; } ;
	#endif
end union

type PSAPI_WORKING_SET_BLOCK as _PSAPI_WORKING_SET_BLOCK
type PPSAPI_WORKING_SET_BLOCK as _PSAPI_WORKING_SET_BLOCK ptr

type _PSAPI_WORKING_SET_INFORMATION
	NumberOfEntries as ULONG_PTR
	WorkingSetInfo(0 to 0) as PSAPI_WORKING_SET_BLOCK
end type

type PSAPI_WORKING_SET_INFORMATION as _PSAPI_WORKING_SET_INFORMATION
type PPSAPI_WORKING_SET_INFORMATION as _PSAPI_WORKING_SET_INFORMATION ptr

union _PSAPI_WORKING_SET_EX_BLOCK
	Flags as ULONG_PTR

	'' TODO: __C89_NAMELESS struct { ULONG_PTR Valid :1; ULONG_PTR ShareCount :3; ULONG_PTR Win32Protection :11; ULONG_PTR Shared :1; ULONG_PTR Node :6; ULONG_PTR Locked :1; ULONG_PTR LargePage :1; } DUMMYSTRUCTNAME;
end union

type PSAPI_WORKING_SET_EX_BLOCK as _PSAPI_WORKING_SET_EX_BLOCK
type PPSAPI_WORKING_SET_EX_BLOCK as _PSAPI_WORKING_SET_EX_BLOCK ptr

type _PSAPI_WORKING_SET_EX_INFORMATION
	VirtualAddress as PVOID
	VirtualAttributes as PSAPI_WORKING_SET_EX_BLOCK
end type

type PSAPI_WORKING_SET_EX_INFORMATION as _PSAPI_WORKING_SET_EX_INFORMATION
type PPSAPI_WORKING_SET_EX_INFORMATION as _PSAPI_WORKING_SET_EX_INFORMATION ptr

end extern
