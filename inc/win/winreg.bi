#pragma once

#include once "_mingw_unicode.bi"
#include once "reason.bi"

'' The following symbols have been renamed:
''     typedef PVALUEA => PVALUEA_
''     typedef PVALUEW => PVALUEW_
''     variable LONG => LONG_

extern "C"

#define _WINREG_
#define WINVER &h0502
#define RRF_RT_REG_NONE &h00000001
#define RRF_RT_REG_SZ &h00000002
#define RRF_RT_REG_EXPAND_SZ &h00000004
#define RRF_RT_REG_BINARY &h00000008
#define RRF_RT_REG_DWORD &h00000010
#define RRF_RT_REG_MULTI_SZ &h00000020
#define RRF_RT_REG_QWORD &h00000040
#define RRF_RT_DWORD (RRF_RT_REG_BINARY or RRF_RT_REG_DWORD)
#define RRF_RT_QWORD (RRF_RT_REG_BINARY or RRF_RT_REG_QWORD)
#define RRF_RT_ANY &h0000ffff
#define RRF_NOEXPAND &h10000000
#define RRF_ZEROONFAILURE &h20000000

type REGSAM as ACCESS_MASK
type LSTATUS as LONG_

'' TODO: #define HKEY_CLASSES_ROOT ((HKEY) (ULONG_PTR)((LONG)0x80000000))
'' TODO: #define HKEY_CURRENT_USER ((HKEY) (ULONG_PTR)((LONG)0x80000001))
'' TODO: #define HKEY_LOCAL_MACHINE ((HKEY) (ULONG_PTR)((LONG)0x80000002))
'' TODO: #define HKEY_USERS ((HKEY) (ULONG_PTR)((LONG)0x80000003))
'' TODO: #define HKEY_PERFORMANCE_DATA ((HKEY) (ULONG_PTR)((LONG)0x80000004))
'' TODO: #define HKEY_PERFORMANCE_TEXT ((HKEY) (ULONG_PTR)((LONG)0x80000050))
'' TODO: #define HKEY_PERFORMANCE_NLSTEXT ((HKEY) (ULONG_PTR)((LONG)0x80000060))
'' TODO: #define HKEY_CURRENT_CONFIG ((HKEY) (ULONG_PTR)((LONG)0x80000005))
'' TODO: #define HKEY_DYN_DATA ((HKEY) (ULONG_PTR)((LONG)0x80000006))

#define REG_SECURE_CONNECTION 1
#define _PROVIDER_STRUCTS_DEFINED
#define PROVIDER_KEEPS_VALUE_LENGTH &h1

type val_context
	valuelen as long
	value_context as LPVOID
	val_buff_ptr as LPVOID
end type

type PVALCONTEXT as val_context ptr

type pvalueA
	pv_valuename as LPSTR
	pv_valuelen as long
	pv_value_context as LPVOID
	pv_type as DWORD
end type

type PVALUEA_ as pvalueA
type PPVALUEA as pvalueA ptr

type pvalueW
	pv_valuename as LPWSTR
	pv_valuelen as long
	pv_value_context as LPVOID
	pv_type as DWORD
end type

type PVALUEW_ as pvalueW
type PPVALUEW as pvalueW ptr

#ifdef UNICODE
	type PVALUE as PVALUEW_
	type PPVALUE as PPVALUEW
#else
	type PVALUE as PVALUEA_
	type PPVALUE as PPVALUEA
#endif

type PQUERYHANDLER as function(byval keycontext as LPVOID, byval val_list as PVALCONTEXT, byval num_vals as DWORD, byval outputbuffer as LPVOID, byval total_outlen as DWORD ptr, byval input_blen as DWORD) as DWORD

type provider_info
	pi_R0_1val as PQUERYHANDLER
	pi_R0_allvals as PQUERYHANDLER
	pi_R3_1val as PQUERYHANDLER
	pi_R3_allvals as PQUERYHANDLER
	pi_flags as DWORD
	pi_key_context as LPVOID
end type

type REG_PROVIDER as provider_info
type PPROVIDER as provider_info ptr

type value_entA
	ve_valuename as LPSTR
	ve_valuelen as DWORD
	ve_valueptr as DWORD_PTR
	ve_type as DWORD
end type

type VALENTA as value_entA
type PVALENTA as value_entA ptr

type value_entW
	ve_valuename as LPWSTR
	ve_valuelen as DWORD
	ve_valueptr as DWORD_PTR
	ve_type as DWORD
end type

type VALENTW as value_entW
type PVALENTW as value_entW ptr

#ifdef UNICODE
	type VALENT as VALENTW
	type PVALENT as PVALENTW
#else
	type VALENT as VALENTA
	type PVALENT as PVALENTA
#endif

#define WIN31_CLASS NULL
#define RegConnectRegistry __MINGW_NAME_AW(RegConnectRegistry)
#define RegConnectRegistryEx __MINGW_NAME_AW(RegConnectRegistryEx)
#define RegCreateKey __MINGW_NAME_AW(RegCreateKey)
#define RegCreateKeyEx __MINGW_NAME_AW(RegCreateKeyEx)
#define RegDeleteKey __MINGW_NAME_AW(RegDeleteKey)
#define RegDeleteKeyEx __MINGW_NAME_AW(RegDeleteKeyEx)
#define RegDeleteValue __MINGW_NAME_AW(RegDeleteValue)
#define RegEnumKey __MINGW_NAME_AW(RegEnumKey)
#define RegEnumKeyEx __MINGW_NAME_AW(RegEnumKeyEx)
#define RegEnumValue __MINGW_NAME_AW(RegEnumValue)
#define RegLoadKey __MINGW_NAME_AW(RegLoadKey)
#define RegOpenKey __MINGW_NAME_AW(RegOpenKey)
#define RegOpenKeyEx __MINGW_NAME_AW(RegOpenKeyEx)
#define RegQueryInfoKey __MINGW_NAME_AW(RegQueryInfoKey)
#define RegQueryValue __MINGW_NAME_AW(RegQueryValue)
#define RegQueryMultipleValues __MINGW_NAME_AW(RegQueryMultipleValues)
#define RegQueryValueEx __MINGW_NAME_AW(RegQueryValueEx)
#define RegReplaceKey __MINGW_NAME_AW(RegReplaceKey)
#define RegRestoreKey __MINGW_NAME_AW(RegRestoreKey)
#define RegSaveKey __MINGW_NAME_AW(RegSaveKey)
#define RegSetValue __MINGW_NAME_AW(RegSetValue)
#define RegSetValueEx __MINGW_NAME_AW(RegSetValueEx)
#define RegUnLoadKey __MINGW_NAME_AW(RegUnLoadKey)
#define RegGetValue __MINGW_NAME_AW(RegGetValue)
#define InitiateSystemShutdown __MINGW_NAME_AW(InitiateSystemShutdown)
#define AbortSystemShutdown __MINGW_NAME_AW(AbortSystemShutdown)

extern     LONG_ alias "LONG" as WINADVAPI
dim shared LONG_ as WINADVAPI

'' TODO: WINADVAPI LONG WINAPI RegCloseKey(HKEY hKey);
'' TODO: WINADVAPI LONG WINAPI RegOverridePredefKey(HKEY hKey,HKEY hNewHKey);
'' TODO: WINADVAPI LONG WINAPI RegOpenUserClassesRoot(HANDLE hToken,DWORD dwOptions,REGSAM samDesired,PHKEY phkResult);
'' TODO: WINADVAPI LONG WINAPI RegOpenCurrentUser(REGSAM samDesired,PHKEY phkResult);
'' TODO: WINADVAPI LONG WINAPI RegDisablePredefinedCache();
'' TODO: WINADVAPI LONG WINAPI RegConnectRegistryA(LPCSTR lpMachineName,HKEY hKey,PHKEY phkResult);
'' TODO: WINADVAPI LONG WINAPI RegConnectRegistryW(LPCWSTR lpMachineName,HKEY hKey,PHKEY phkResult);
'' TODO: WINADVAPI LONG WINAPI RegConnectRegistryExA(LPCSTR lpMachineName,HKEY hKey,ULONG Flags,PHKEY phkResult);
'' TODO: WINADVAPI LONG WINAPI RegConnectRegistryExW(LPCWSTR lpMachineName,HKEY hKey,ULONG Flags,PHKEY phkResult);
'' TODO: WINADVAPI LONG WINAPI RegCreateKeyA(HKEY hKey,LPCSTR lpSubKey,PHKEY phkResult);
'' TODO: WINADVAPI LONG WINAPI RegCreateKeyW(HKEY hKey,LPCWSTR lpSubKey,PHKEY phkResult);
'' TODO: WINADVAPI LONG WINAPI RegCreateKeyExA(HKEY hKey,LPCSTR lpSubKey,DWORD Reserved,LPSTR lpClass,DWORD dwOptions,REGSAM samDesired,LPSECURITY_ATTRIBUTES lpSecurityAttributes,PHKEY phkResult,LPDWORD lpdwDisposition);
'' TODO: WINADVAPI LONG WINAPI RegCreateKeyExW(HKEY hKey,LPCWSTR lpSubKey,DWORD Reserved,LPWSTR lpClass,DWORD dwOptions,REGSAM samDesired,LPSECURITY_ATTRIBUTES lpSecurityAttributes,PHKEY phkResult,LPDWORD lpdwDisposition);
'' TODO: WINADVAPI LONG WINAPI RegDeleteKeyA(HKEY hKey,LPCSTR lpSubKey);
'' TODO: WINADVAPI LONG WINAPI RegDeleteKeyW(HKEY hKey,LPCWSTR lpSubKey);
'' TODO: WINADVAPI LONG WINAPI RegDeleteKeyExA(HKEY hKey,LPCSTR lpSubKey,REGSAM samDesired,DWORD Reserved);
'' TODO: WINADVAPI LONG WINAPI RegDeleteKeyExW(HKEY hKey,LPCWSTR lpSubKey,REGSAM samDesired,DWORD Reserved);
'' TODO: WINADVAPI LONG WINAPI RegDisableReflectionKey(HKEY hBase);
'' TODO: WINADVAPI LONG WINAPI RegEnableReflectionKey(HKEY hBase);
'' TODO: WINADVAPI LONG WINAPI RegQueryReflectionKey(HKEY hBase,WINBOOL *bIsReflectionDisabled);
'' TODO: WINADVAPI LONG WINAPI RegDeleteValueA(HKEY hKey,LPCSTR lpValueName);
'' TODO: WINADVAPI LONG WINAPI RegDeleteValueW(HKEY hKey,LPCWSTR lpValueName);
'' TODO: WINADVAPI LONG WINAPI RegEnumKeyA(HKEY hKey,DWORD dwIndex,LPSTR lpName,DWORD cchName);
'' TODO: WINADVAPI LONG WINAPI RegEnumKeyW(HKEY hKey,DWORD dwIndex,LPWSTR lpName,DWORD cchName);
'' TODO: WINADVAPI LONG WINAPI RegEnumKeyExA(HKEY hKey,DWORD dwIndex,LPSTR lpName,LPDWORD lpcchName,LPDWORD lpReserved,LPSTR lpClass,LPDWORD lpcchClass,PFILETIME lpftLastWriteTime);
'' TODO: WINADVAPI LONG WINAPI RegEnumKeyExW(HKEY hKey,DWORD dwIndex,LPWSTR lpName,LPDWORD lpcchName,LPDWORD lpReserved,LPWSTR lpClass,LPDWORD lpcchClass,PFILETIME lpftLastWriteTime);
'' TODO: WINADVAPI LONG WINAPI RegEnumValueA(HKEY hKey,DWORD dwIndex,LPSTR lpValueName,LPDWORD lpcchValueName,LPDWORD lpReserved,LPDWORD lpType,LPBYTE lpData,LPDWORD lpcbData);
'' TODO: WINADVAPI LONG WINAPI RegEnumValueW(HKEY hKey,DWORD dwIndex,LPWSTR lpValueName,LPDWORD lpcchValueName,LPDWORD lpReserved,LPDWORD lpType,LPBYTE lpData,LPDWORD lpcbData);
'' TODO: WINADVAPI LONG WINAPI RegFlushKey(HKEY hKey);
'' TODO: WINADVAPI LONG WINAPI RegGetKeySecurity(HKEY hKey,SECURITY_INFORMATION SecurityInformation,PSECURITY_DESCRIPTOR pSecurityDescriptor,LPDWORD lpcbSecurityDescriptor);
'' TODO: WINADVAPI LONG WINAPI RegLoadKeyA(HKEY hKey,LPCSTR lpSubKey,LPCSTR lpFile);
'' TODO: WINADVAPI LONG WINAPI RegLoadKeyW(HKEY hKey,LPCWSTR lpSubKey,LPCWSTR lpFile);
'' TODO: WINADVAPI LONG WINAPI RegNotifyChangeKeyValue(HKEY hKey,WINBOOL bWatchSubtree,DWORD dwNotifyFilter,HANDLE hEvent,WINBOOL fAsynchronous);
'' TODO: WINADVAPI LONG WINAPI RegOpenKeyA(HKEY hKey,LPCSTR lpSubKey,PHKEY phkResult);
'' TODO: WINADVAPI LONG WINAPI RegOpenKeyW(HKEY hKey,LPCWSTR lpSubKey,PHKEY phkResult);
'' TODO: WINADVAPI LONG WINAPI RegOpenKeyExA(HKEY hKey,LPCSTR lpSubKey,DWORD ulOptions,REGSAM samDesired,PHKEY phkResult);
'' TODO: WINADVAPI LONG WINAPI RegOpenKeyExW(HKEY hKey,LPCWSTR lpSubKey,DWORD ulOptions,REGSAM samDesired,PHKEY phkResult);
'' TODO: WINADVAPI LONG WINAPI RegQueryInfoKeyA(HKEY hKey,LPSTR lpClass,LPDWORD lpcchClass,LPDWORD lpReserved,LPDWORD lpcSubKeys,LPDWORD lpcbMaxSubKeyLen,LPDWORD lpcbMaxClassLen,LPDWORD lpcValues,LPDWORD lpcbMaxValueNameLen,LPDWORD lpcbMaxValueLen,LPDWORD lpcbSecurityDescriptor,PFILETIME lpftLastWriteTime);
'' TODO: WINADVAPI LONG WINAPI RegQueryInfoKeyW(HKEY hKey,LPWSTR lpClass,LPDWORD lpcchClass,LPDWORD lpReserved,LPDWORD lpcSubKeys,LPDWORD lpcbMaxSubKeyLen,LPDWORD lpcbMaxClassLen,LPDWORD lpcValues,LPDWORD lpcbMaxValueNameLen,LPDWORD lpcbMaxValueLen,LPDWORD lpcbSecurityDescriptor,PFILETIME lpftLastWriteTime);
'' TODO: WINADVAPI LONG WINAPI RegQueryValueA(HKEY hKey,LPCSTR lpSubKey,LPSTR lpData,PLONG lpcbData);
'' TODO: WINADVAPI LONG WINAPI RegQueryValueW(HKEY hKey,LPCWSTR lpSubKey,LPWSTR lpData,PLONG lpcbData);
'' TODO: WINADVAPI LONG WINAPI RegQueryMultipleValuesA(HKEY hKey,PVALENTA val_list,DWORD num_vals,LPSTR lpValueBuf,LPDWORD ldwTotsize);
'' TODO: WINADVAPI LONG WINAPI RegQueryMultipleValuesW(HKEY hKey,PVALENTW val_list,DWORD num_vals,LPWSTR lpValueBuf,LPDWORD ldwTotsize);
'' TODO: WINADVAPI LONG WINAPI RegQueryValueExA(HKEY hKey,LPCSTR lpValueName,LPDWORD lpReserved,LPDWORD lpType,LPBYTE lpData,LPDWORD lpcbData);
'' TODO: WINADVAPI LONG WINAPI RegQueryValueExW(HKEY hKey,LPCWSTR lpValueName,LPDWORD lpReserved,LPDWORD lpType,LPBYTE lpData,LPDWORD lpcbData);
'' TODO: WINADVAPI LONG WINAPI RegReplaceKeyA(HKEY hKey,LPCSTR lpSubKey,LPCSTR lpNewFile,LPCSTR lpOldFile);
'' TODO: WINADVAPI LONG WINAPI RegReplaceKeyW(HKEY hKey,LPCWSTR lpSubKey,LPCWSTR lpNewFile,LPCWSTR lpOldFile);
'' TODO: WINADVAPI LONG WINAPI RegRestoreKeyA(HKEY hKey,LPCSTR lpFile,DWORD dwFlags);
'' TODO: WINADVAPI LONG WINAPI RegRestoreKeyW(HKEY hKey,LPCWSTR lpFile,DWORD dwFlags);
'' TODO: WINADVAPI LONG WINAPI RegSaveKeyA(HKEY hKey,LPCSTR lpFile,LPSECURITY_ATTRIBUTES lpSecurityAttributes);
'' TODO: WINADVAPI LONG WINAPI RegSaveKeyW(HKEY hKey,LPCWSTR lpFile,LPSECURITY_ATTRIBUTES lpSecurityAttributes);
'' TODO: WINADVAPI LONG WINAPI RegSetKeySecurity(HKEY hKey,SECURITY_INFORMATION SecurityInformation,PSECURITY_DESCRIPTOR pSecurityDescriptor);
'' TODO: WINADVAPI LONG WINAPI RegSetValueA(HKEY hKey,LPCSTR lpSubKey,DWORD dwType,LPCSTR lpData,DWORD cbData);
'' TODO: WINADVAPI LONG WINAPI RegSetValueW(HKEY hKey,LPCWSTR lpSubKey,DWORD dwType,LPCWSTR lpData,DWORD cbData);
'' TODO: WINADVAPI LONG WINAPI RegSetValueExA(HKEY hKey,LPCSTR lpValueName,DWORD Reserved,DWORD dwType,CONST BYTE *lpData,DWORD cbData);
'' TODO: WINADVAPI LONG WINAPI RegSetValueExW(HKEY hKey,LPCWSTR lpValueName,DWORD Reserved,DWORD dwType,CONST BYTE *lpData,DWORD cbData);
'' TODO: WINADVAPI LONG WINAPI RegUnLoadKeyA(HKEY hKey,LPCSTR lpSubKey);
'' TODO: WINADVAPI LONG WINAPI RegUnLoadKeyW(HKEY hKey,LPCWSTR lpSubKey);
'' TODO: WINADVAPI LONG WINAPI RegGetValueA(HKEY hkey,LPCSTR lpSubKey,LPCSTR lpValue,DWORD dwFlags,LPDWORD pdwType,PVOID pvData,LPDWORD pcbData);
'' TODO: WINADVAPI LONG WINAPI RegGetValueW(HKEY hkey,LPCWSTR lpSubKey,LPCWSTR lpValue,DWORD dwFlags,LPDWORD pdwType,PVOID pvData,LPDWORD pcbData);

extern     WINBOOL as WINADVAPI
dim shared WINBOOL as WINADVAPI

'' TODO: WINADVAPI WINBOOL WINAPI InitiateSystemShutdownA(LPSTR lpMachineName,LPSTR lpMessage,DWORD dwTimeout,WINBOOL bForceAppsClosed,WINBOOL bRebootAfterShutdown);
'' TODO: WINADVAPI WINBOOL WINAPI InitiateSystemShutdownW(LPWSTR lpMachineName,LPWSTR lpMessage,DWORD dwTimeout,WINBOOL bForceAppsClosed,WINBOOL bRebootAfterShutdown);
'' TODO: WINADVAPI WINBOOL WINAPI AbortSystemShutdownA(LPSTR lpMachineName);
'' TODO: WINADVAPI WINBOOL WINAPI AbortSystemShutdownW(LPWSTR lpMachineName);

#define REASON_SWINSTALL (SHTDN_REASON_MAJOR_SOFTWARE or SHTDN_REASON_MINOR_INSTALLATION)
#define REASON_HWINSTALL (SHTDN_REASON_MAJOR_HARDWARE or SHTDN_REASON_MINOR_INSTALLATION)
#define REASON_SERVICEHANG (SHTDN_REASON_MAJOR_SOFTWARE or SHTDN_REASON_MINOR_HUNG)
#define REASON_UNSTABLE (SHTDN_REASON_MAJOR_SYSTEM or SHTDN_REASON_MINOR_UNSTABLE)
#define REASON_SWHWRECONF (SHTDN_REASON_MAJOR_SOFTWARE or SHTDN_REASON_MINOR_RECONFIG)
#define REASON_OTHER (SHTDN_REASON_MAJOR_OTHER or SHTDN_REASON_MINOR_OTHER)
#define REASON_UNKNOWN SHTDN_REASON_UNKNOWN
#define REASON_LEGACY_API SHTDN_REASON_LEGACY_API
#define REASON_PLANNED_FLAG SHTDN_REASON_FLAG_PLANNED
#define MAX_SHUTDOWN_TIMEOUT ((((10 * 365) * 24) * 60) * 60)
#define InitiateSystemShutdownEx __MINGW_NAME_AW(InitiateSystemShutdownEx)
#define RegSaveKeyEx __MINGW_NAME_AW(RegSaveKeyEx)

'' TODO: WINADVAPI WINBOOL WINAPI InitiateSystemShutdownExA(LPSTR lpMachineName,LPSTR lpMessage,DWORD dwTimeout,WINBOOL bForceAppsClosed,WINBOOL bRebootAfterShutdown,DWORD dwReason);
'' TODO: WINADVAPI WINBOOL WINAPI InitiateSystemShutdownExW(LPWSTR lpMachineName,LPWSTR lpMessage,DWORD dwTimeout,WINBOOL bForceAppsClosed,WINBOOL bRebootAfterShutdown,DWORD dwReason);
'' TODO: WINADVAPI LONG WINAPI RegSaveKeyExA(HKEY hKey,LPCSTR lpFile,LPSECURITY_ATTRIBUTES lpSecurityAttributes,DWORD Flags);
'' TODO: WINADVAPI LONG WINAPI RegSaveKeyExW(HKEY hKey,LPCWSTR lpFile,LPSECURITY_ATTRIBUTES lpSecurityAttributes,DWORD Flags);
'' TODO: WINADVAPI LONG WINAPI Wow64Win32ApiEntry (DWORD dwFuncNumber,DWORD dwFlag,DWORD dwRes);

end extern
