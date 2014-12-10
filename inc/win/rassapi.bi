#pragma once

#include once "lmcons.bi"

extern "C"

#define _RASSAPI_H_
#define RASSAPI_MAX_PHONENUMBER_SIZE 128
#define RASSAPI_MAX_MEDIA_NAME 16
#define RASSAPI_MAX_PORT_NAME 16
#define RASSAPI_MAX_DEVICE_NAME 128
#define RASSAPI_MAX_DEVICETYPE_NAME 16
#define RASSAPI_MAX_PARAM_KEY_SIZE 32
#define RASPRIV_NoCallback &h01
#define RASPRIV_AdminSetCallback &h02
#define RASPRIV_CallerSetCallback &h04
#define RASPRIV_DialinPrivilege &h08
#define RASPRIV_CallbackType ((RASPRIV_AdminSetCallback or RASPRIV_CallerSetCallback) or RASPRIV_NoCallback)
#define RAS_MODEM_OPERATIONAL 1
#define RAS_MODEM_NOT_RESPONDING 2
#define RAS_MODEM_HARDWARE_FAILURE 3
#define RAS_MODEM_INCORRECT_RESPONSE 4
#define RAS_MODEM_UNKNOWN 5
#define RAS_PORT_NON_OPERATIONAL 1
#define RAS_PORT_DISCONNECTED 2
#define RAS_PORT_CALLING_BACK 3
#define RAS_PORT_LISTENING 4
#define RAS_PORT_AUTHENTICATING 5
#define RAS_PORT_AUTHENTICATED 6
#define RAS_PORT_INITIALIZING 7

type RAS_PARAMS_FORMAT as long
enum
	ParamNumber = 0
	ParamString = 1
end enum

type __RAS_PARAMS_VALUE_String
	Length as DWORD
	Data as PCHAR
end type

union RAS_PARAMS_VALUE
	Number as DWORD
	String as __RAS_PARAMS_VALUE_String
end union

type RAS_PARAMETERS
	P_Key(0 to 31) as CHAR
	P_Type as RAS_PARAMS_FORMAT
	P_Attributes as BYTE
	P_Value as RAS_PARAMS_VALUE
end type

type _RAS_USER_0
	bfPrivilege as BYTE
	szPhoneNumber(0 to (128 + 1) - 1) as WCHAR
end type

type RAS_USER_0 as _RAS_USER_0
type PRAS_USER_0 as _RAS_USER_0 ptr

type _RAS_PORT_0
	wszPortName(0 to 15) as WCHAR
	wszDeviceType(0 to 15) as WCHAR
	wszDeviceName(0 to 127) as WCHAR
	wszMediaName(0 to 15) as WCHAR
	reserved as DWORD
	Flags as DWORD
	wszUserName(0 to (256 + 1) - 1) as WCHAR
	wszComputer(0 to 15) as WCHAR
	dwStartSessionTime as DWORD
	wszLogonDomain(0 to (15 + 1) - 1) as WCHAR
	fAdvancedServer as WINBOOL
end type

type RAS_PORT_0 as _RAS_PORT_0
type PRAS_PORT_0 as _RAS_PORT_0 ptr

#define MEDIA_UNKNOWN 0
#define MEDIA_SERIAL 1
#define MEDIA_RAS10_SERIAL 2
#define MEDIA_X25 3
#define MEDIA_ISDN 4
#define USER_AUTHENTICATED &h0001
#define MESSENGER_PRESENT &h0002
#define PPP_CLIENT &h0004
#define GATEWAY_ACTIVE &h0008
#define REMOTE_LISTEN &h0010
#define PORT_MULTILINKED &h0020

type IPADDR as ULONG

#define RAS_IPADDRESSLEN 15
#define RAS_IPXADDRESSLEN 22
#define RAS_ATADDRESSLEN 32

type _RAS_PPP_NBFCP_RESULT
	dwError as DWORD
	dwNetBiosError as DWORD
	szName(0 to (16 + 1) - 1) as CHAR
	wszWksta(0 to (16 + 1) - 1) as WCHAR
end type

type RAS_PPP_NBFCP_RESULT as _RAS_PPP_NBFCP_RESULT

type _RAS_PPP_IPCP_RESULT
	dwError as DWORD
	wszAddress(0 to (15 + 1) - 1) as WCHAR
end type

type RAS_PPP_IPCP_RESULT as _RAS_PPP_IPCP_RESULT

type _RAS_PPP_IPXCP_RESULT
	dwError as DWORD
	wszAddress(0 to (22 + 1) - 1) as WCHAR
end type

type RAS_PPP_IPXCP_RESULT as _RAS_PPP_IPXCP_RESULT

type _RAS_PPP_ATCP_RESULT
	dwError as DWORD
	wszAddress(0 to (32 + 1) - 1) as WCHAR
end type

type RAS_PPP_ATCP_RESULT as _RAS_PPP_ATCP_RESULT

type _RAS_PPP_PROJECTION_RESULT
	nbf as RAS_PPP_NBFCP_RESULT
	ip as RAS_PPP_IPCP_RESULT
	ipx as RAS_PPP_IPXCP_RESULT
	at as RAS_PPP_ATCP_RESULT
end type

type RAS_PPP_PROJECTION_RESULT as _RAS_PPP_PROJECTION_RESULT

type _RAS_PORT_1
	rasport0 as RAS_PORT_0
	LineCondition as DWORD
	HardwareCondition as DWORD
	LineSpeed as DWORD
	NumStatistics as WORD
	NumMediaParms as WORD
	SizeMediaParms as DWORD
	ProjResult as RAS_PPP_PROJECTION_RESULT
end type

type RAS_PORT_1 as _RAS_PORT_1
type PRAS_PORT_1 as _RAS_PORT_1 ptr

type _RAS_PORT_STATISTICS
	dwBytesXmited as DWORD
	dwBytesRcved as DWORD
	dwFramesXmited as DWORD
	dwFramesRcved as DWORD
	dwCrcErr as DWORD
	dwTimeoutErr as DWORD
	dwAlignmentErr as DWORD
	dwHardwareOverrunErr as DWORD
	dwFramingErr as DWORD
	dwBufferOverrunErr as DWORD
	dwBytesXmitedUncompressed as DWORD
	dwBytesRcvedUncompressed as DWORD
	dwBytesXmitedCompressed as DWORD
	dwBytesRcvedCompressed as DWORD
	dwPortBytesXmited as DWORD
	dwPortBytesRcved as DWORD
	dwPortFramesXmited as DWORD
	dwPortFramesRcved as DWORD
	dwPortCrcErr as DWORD
	dwPortTimeoutErr as DWORD
	dwPortAlignmentErr as DWORD
	dwPortHardwareOverrunErr as DWORD
	dwPortFramingErr as DWORD
	dwPortBufferOverrunErr as DWORD
	dwPortBytesXmitedUncompressed as DWORD
	dwPortBytesRcvedUncompressed as DWORD
	dwPortBytesXmitedCompressed as DWORD
	dwPortBytesRcvedCompressed as DWORD
end type

type RAS_PORT_STATISTICS as _RAS_PORT_STATISTICS
type PRAS_PORT_STATISTICS as _RAS_PORT_STATISTICS ptr

#define RASDOWNLEVEL 10
#define RASADMIN_35 35
#define RASADMIN_CURRENT 40

type _RAS_SERVER_0
	TotalPorts as WORD
	PortsInUse as WORD
	RasVersion as DWORD
end type

type RAS_SERVER_0 as _RAS_SERVER_0
type PRAS_SERVER_0 as _RAS_SERVER_0 ptr

extern     WINAPI as DWORD
dim shared WINAPI as DWORD

'' TODO: DWORD WINAPI RasAdminServerGetInfo(const WCHAR *lpszServer,PRAS_SERVER_0 pRasServer0);
'' TODO: DWORD WINAPI RasAdminGetUserAccountServer(const WCHAR *lpszDomain,const WCHAR *lpszServer,LPWSTR lpszUserAccountServer);
'' TODO: DWORD WINAPI RasAdminUserGetInfo(const WCHAR *lpszUserAccountServer,const WCHAR *lpszUser,PRAS_USER_0 pRasUser0);
'' TODO: DWORD WINAPI RasAdminUserSetInfo(const WCHAR *lpszUserAccountServer,const WCHAR *lpszUser,const PRAS_USER_0 pRasUser0);
'' TODO: DWORD WINAPI RasAdminPortEnum(const WCHAR *lpszServer,PRAS_PORT_0 *ppRasPort0,WORD *pcEntriesRead);
'' TODO: DWORD WINAPI RasAdminPortGetInfo(const WCHAR *lpszServer,const WCHAR *lpszPort,RAS_PORT_1 *pRasPort1,RAS_PORT_STATISTICS *pRasStats,RAS_PARAMETERS **ppRasParams);
'' TODO: DWORD WINAPI RasAdminPortClearStatistics(const WCHAR *lpszServer,const WCHAR *lpszPort);
'' TODO: DWORD WINAPI RasAdminPortDisconnect(const WCHAR *lpszServer,const WCHAR *lpszPort);
'' TODO: DWORD WINAPI RasAdminFreeBuffer(PVOID Pointer);
'' TODO: WINBOOL WINAPI RasAdminAcceptNewConnection (RAS_PORT_1 *pRasPort1,RAS_PORT_STATISTICS *pRasStats,RAS_PARAMETERS *pRasParams);
'' TODO: VOID WINAPI RasAdminConnectionHangupNotification (RAS_PORT_1 *pRasPort1,RAS_PORT_STATISTICS *pRasStats,RAS_PARAMETERS *pRasParams);
'' TODO: DWORD WINAPI RasAdminGetIpAddressForUser (WCHAR *lpszUserName,WCHAR *lpszPortName,IPADDR *pipAddress,WINBOOL *bNotifyRelease);
'' TODO: VOID WINAPI RasAdminReleaseIpAddress (WCHAR *lpszUserName,WCHAR *lpszPortName,IPADDR *pipAddress);

end extern
