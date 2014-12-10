#pragma once

#include once "_mingw_unicode.bi"
#include once "inaddr.bi"
#include once "in6addr.bi"
#include once "naptypes.bi"
#include once "lmcons.bi"

'' The following symbols have been renamed:
''     #define RASCONNSTATE => RASCONNSTATE_
''     #define RASEAPINFO => RASEAPINFO_
''     #define RASCTRYINFO => RASCTRYINFO_
''     #define RASIPADDR => RASIPADDR_

#ifdef __FB_64BIT__
	extern "C"
#else
	extern "Windows"
#endif

#define _RAS_H_

type RASIPV4ADDR as in_addr
type RASIPV6ADDR as in6_addr

type HRASCONN__ field = 4
	unused as long
end type

#define RAS_MaxDeviceType 16
#define RAS_MaxPhoneNumber 128
#define RAS_MaxIpAddress 15
#define RAS_MaxIpxAddress 21
#define RAS_MaxEntryName 256
#define RAS_MaxDeviceName 128
#define RAS_MaxCallbackNumber RAS_MaxPhoneNumber
#define RAS_MaxAreaCode 10
#define RAS_MaxPadType 32
#define RAS_MaxX25Address 200
#define RAS_MaxFacilities 200
#define RAS_MaxUserData 200
#define RAS_MaxReplyMessage 1024
#define RAS_MaxDnsSuffix 256

type HRASCONN as HRASCONN__ ptr

#define LPHRASCONN HRASCONN ptr
#define RASCF_AllUsers &h00000001
#define RASCF_GlobalCreds &h00000002
#define RASCONNW tagRASCONNW

type tagRASCONNW field = 4
	dwSize as DWORD
	hrasconn as HRASCONN
	szEntryName(0 to (256 + 1) - 1) as WCHAR
	szDeviceType(0 to (16 + 1) - 1) as WCHAR
	szDeviceName(0 to (128 + 1) - 1) as WCHAR
	szPhonebook(0 to 259) as WCHAR
	dwSubEntry as DWORD
	guidEntry as GUID
	dwFlags as DWORD
	luid as LUID
end type

#define RASCONNA tagRASCONNA

type tagRASCONNA field = 4
	dwSize as DWORD
	hrasconn as HRASCONN
	szEntryName(0 to (256 + 1) - 1) as CHAR
	szDeviceType(0 to (16 + 1) - 1) as CHAR
	szDeviceName(0 to (128 + 1) - 1) as CHAR
	szPhonebook(0 to 259) as CHAR
	dwSubEntry as DWORD
	guidEntry as GUID
	dwFlags as DWORD
	luid as LUID
end type

#define RASCONN __MINGW_NAME_AW(RASCONN)

'' TODO: #define LPRASCONNW RASCONNW*
'' TODO: #define LPRASCONNA RASCONNA*
'' TODO: #define LPRASCONN RASCONN*

#define RASCS_PAUSED &h1000
#define RASCS_DONE &h2000
#define RASCONNSTATE_ tagRASCONNSTATE

type tagRASCONNSTATE as long
enum
	RASCS_OpenPort = 0
	RASCS_PortOpened
	RASCS_ConnectDevice
	RASCS_DeviceConnected
	RASCS_AllDevicesConnected
	RASCS_Authenticate
	RASCS_AuthNotify
	RASCS_AuthRetry
	RASCS_AuthCallback
	RASCS_AuthChangePassword
	RASCS_AuthProject
	RASCS_AuthLinkSpeed
	RASCS_AuthAck
	RASCS_ReAuthenticate
	RASCS_Authenticated
	RASCS_PrepareForCallback
	RASCS_WaitForModemReset
	RASCS_WaitForCallback
	RASCS_Projected
	RASCS_StartAuthentication
	RASCS_CallbackComplete
	RASCS_LogonNetwork
	RASCS_SubEntryConnected
	RASCS_SubEntryDisconnected
	RASCS_Interactive = &h1000
	RASCS_RetryAuthentication
	RASCS_CallbackSetByCaller
	RASCS_PasswordExpired
	RASCS_InvokeEapUI
	RASCS_Connected = &h2000
	RASCS_Disconnected
end enum

'' TODO: #define LPRASCONNSTATE RASCONNSTATE*

#define RASCONNSTATUSW tagRASCONNSTATUSW

type tagRASCONNSTATUSW field = 4
	dwSize as DWORD
	rasconnstate as tagRASCONNSTATE
	dwError as DWORD
	szDeviceType(0 to (16 + 1) - 1) as WCHAR
	szDeviceName(0 to (128 + 1) - 1) as WCHAR
	szPhoneNumber(0 to (128 + 1) - 1) as WCHAR
end type

#define RASCONNSTATUSA tagRASCONNSTATUSA

type tagRASCONNSTATUSA field = 4
	dwSize as DWORD
	rasconnstate as tagRASCONNSTATE
	dwError as DWORD
	szDeviceType(0 to (16 + 1) - 1) as CHAR
	szDeviceName(0 to (128 + 1) - 1) as CHAR
	szPhoneNumber(0 to (128 + 1) - 1) as CHAR
end type

#define RASCONNSTATUS __MINGW_NAME_AW(RASCONNSTATUS)

'' TODO: #define LPRASCONNSTATUSW RASCONNSTATUSW*
'' TODO: #define LPRASCONNSTATUSA RASCONNSTATUSA*
'' TODO: #define LPRASCONNSTATUS RASCONNSTATUS*

#define RASDIALPARAMSW tagRASDIALPARAMSW

type tagRASDIALPARAMSW field = 4
	dwSize as DWORD
	szEntryName(0 to (256 + 1) - 1) as WCHAR
	szPhoneNumber(0 to (128 + 1) - 1) as WCHAR
	szCallbackNumber(0 to (128 + 1) - 1) as WCHAR
	szUserName(0 to (256 + 1) - 1) as WCHAR
	szPassword(0 to (256 + 1) - 1) as WCHAR
	szDomain(0 to (15 + 1) - 1) as WCHAR
	dwSubEntry as DWORD
	dwCallbackId as ULONG_PTR
end type

#define RASDIALPARAMSA tagRASDIALPARAMSA

type tagRASDIALPARAMSA field = 4
	dwSize as DWORD
	szEntryName(0 to (256 + 1) - 1) as CHAR
	szPhoneNumber(0 to (128 + 1) - 1) as CHAR
	szCallbackNumber(0 to (128 + 1) - 1) as CHAR
	szUserName(0 to (256 + 1) - 1) as CHAR
	szPassword(0 to (256 + 1) - 1) as CHAR
	szDomain(0 to (15 + 1) - 1) as CHAR
	dwSubEntry as DWORD
	dwCallbackId as ULONG_PTR
end type

#define RASDIALPARAMS __MINGW_NAME_AW(RASDIALPARAMS)

'' TODO: #define LPRASDIALPARAMSW RASDIALPARAMSW*
'' TODO: #define LPRASDIALPARAMSA RASDIALPARAMSA*
'' TODO: #define LPRASDIALPARAMS RASDIALPARAMS*

#define RASEAPINFO_ tagRASEAPINFO

type tagRASEAPINFO field = 4
	dwSizeofEapInfo as DWORD
	pbEapInfo as BYTE_ ptr
end type

#define RASDIALEXTENSIONS tagRASDIALEXTENSIONS

type tagRASDIALEXTENSIONS field = 4
	dwSize as DWORD
	dwfOptions as DWORD
	hwndParent as HWND
	reserved as ULONG_PTR
	reserved1 as ULONG_PTR
	RasEapInfo as tagRASEAPINFO
end type

'' TODO: #define LPRASDIALEXTENSIONS RASDIALEXTENSIONS*

#define RDEOPT_UsePrefixSuffix &h00000001
#define RDEOPT_PausedStates &h00000002
#define RDEOPT_IgnoreModemSpeaker &h00000004
#define RDEOPT_SetModemSpeaker &h00000008
#define RDEOPT_IgnoreSoftwareCompression &h00000010
#define RDEOPT_SetSoftwareCompression &h00000020
#define RDEOPT_DisableConnectedUI &h00000040
#define RDEOPT_DisableReconnectUI &h00000080
#define RDEOPT_DisableReconnect &h00000100
#define RDEOPT_NoUser &h00000200
#define RDEOPT_PauseOnScript &h00000400
#define RDEOPT_Router &h00000800
#define RDEOPT_CustomDial &h00001000
#define RDEOPT_UseCustomScripting &h00002000
#define REN_User &h00000000
#define REN_AllUsers &h00000001
#define RASENTRYNAMEW tagRASENTRYNAMEW

type tagRASENTRYNAMEW field = 4
	dwSize as DWORD
	szEntryName(0 to (256 + 1) - 1) as WCHAR
	dwFlags as DWORD
	szPhonebookPath(0 to (260 + 1) - 1) as WCHAR
end type

#define RASENTRYNAMEA tagRASENTRYNAMEA

type tagRASENTRYNAMEA field = 4
	dwSize as DWORD
	szEntryName(0 to (256 + 1) - 1) as CHAR
	dwFlags as DWORD
	szPhonebookPath(0 to (260 + 1) - 1) as CHAR
end type

#define RASENTRYNAME __MINGW_NAME_AW(RASENTRYNAME)

'' TODO: #define LPRASENTRYNAMEW RASENTRYNAMEW*
'' TODO: #define LPRASENTRYNAMEA RASENTRYNAMEA*
'' TODO: #define LPRASENTRYNAME RASENTRYNAME*

#define RASPROJECTION tagRASPROJECTION

type tagRASPROJECTION as long
enum
	RASP_Amb = &h10000
	RASP_PppNbf = &h803F
	RASP_PppIpx = &h802B
	RASP_PppIp = &h8021
	RASP_PppCcp = &h80FD
	RASP_PppLcp = &hC021
	RASP_Slip = &h20000
end enum

'' TODO: #define LPRASPROJECTION RASPROJECTION *

#define RASAMBW tagRASAMBW

type tagRASAMBW field = 4
	dwSize as DWORD
	dwError as DWORD
	szNetBiosError(0 to (16 + 1) - 1) as WCHAR
	bLana as BYTE_
end type

#define RASAMBA tagRASAMBA

type tagRASAMBA field = 4
	dwSize as DWORD
	dwError as DWORD
	szNetBiosError(0 to (16 + 1) - 1) as CHAR
	bLana as BYTE_
end type

#define RASAMB __MINGW_NAME_AW(RASAMB)

'' TODO: #define LPRASAMBW RASAMBW*
'' TODO: #define LPRASAMBA RASAMBA*
'' TODO: #define LPRASAMB RASAMB*

#define RASPPPNBFW tagRASPPPNBFW

type tagRASPPPNBFW field = 4
	dwSize as DWORD
	dwError as DWORD
	dwNetBiosError as DWORD
	szNetBiosError(0 to (16 + 1) - 1) as WCHAR
	szWorkstationName(0 to (16 + 1) - 1) as WCHAR
	bLana as BYTE_
end type

#define RASPPPNBFA tagRASPPPNBFA

type tagRASPPPNBFA field = 4
	dwSize as DWORD
	dwError as DWORD
	dwNetBiosError as DWORD
	szNetBiosError(0 to (16 + 1) - 1) as CHAR
	szWorkstationName(0 to (16 + 1) - 1) as CHAR
	bLana as BYTE_
end type

#define RASPPPNBF __MINGW_NAME_AW(RASPPPNBF)

'' TODO: #define LPRASPPPNBFW RASPPPNBFW*
'' TODO: #define LPRASPPPNBFA RASPPPNBFA*
'' TODO: #define LPRASPPPNBF RASPPPNBF*

#define RASPPPIPXW tagRASIPXW

type tagRASIPXW field = 4
	dwSize as DWORD
	dwError as DWORD
	szIpxAddress(0 to (21 + 1) - 1) as WCHAR
end type

#define RASPPPIPXA tagRASPPPIPXA

type tagRASPPPIPXA field = 4
	dwSize as DWORD
	dwError as DWORD
	szIpxAddress(0 to (21 + 1) - 1) as CHAR
end type

#define RASPPPIPX __MINGW_NAME_AW(RASPPPIPX)

'' TODO: #define LPRASPPPIPXW RASPPPIPXW *
'' TODO: #define LPRASPPPIPXA RASPPPIPXA *
'' TODO: #define LPRASPPPIPX RASPPPIPX *

#define RASIPO_VJ &h00000001
#define RASPPPIPW tagRASPPPIPW

type tagRASPPPIPW field = 4
	dwSize as DWORD
	dwError as DWORD
	szIpAddress(0 to (15 + 1) - 1) as WCHAR
	szServerIpAddress(0 to (15 + 1) - 1) as WCHAR
	dwOptions as DWORD
	dwServerOptions as DWORD
end type

#define RASPPPIPA tagRASPPPIPA

type tagRASPPPIPA field = 4
	dwSize as DWORD
	dwError as DWORD
	szIpAddress(0 to (15 + 1) - 1) as CHAR
	szServerIpAddress(0 to (15 + 1) - 1) as CHAR
	dwOptions as DWORD
	dwServerOptions as DWORD
end type

#define RASPPPIP __MINGW_NAME_AW(RASPPPIP)

'' TODO: #define LPRASPPPIPW RASPPPIPW*
'' TODO: #define LPRASPPPIPA RASPPPIPA*
'' TODO: #define LPRASPPPIP RASPPPIP*

#define RASLCPAP_PAP &hC023
#define RASLCPAP_SPAP &hC027
#define RASLCPAP_CHAP &hC223
#define RASLCPAP_EAP &hC227
#define RASLCPAD_CHAP_MD5 &h05
#define RASLCPAD_CHAP_MS &h80
#define RASLCPAD_CHAP_MSV2 &h81
#define RASLCPO_PFC &h00000001
#define RASLCPO_ACFC &h00000002
#define RASLCPO_SSHF &h00000004
#define RASLCPO_DES_56 &h00000008
#define RASLCPO_3_DES &h00000010
#define RASPPPLCPW tagRASPPPLCPW

type tagRASPPPLCPW field = 4
	dwSize as DWORD
	fBundled as WINBOOL
	dwError as DWORD
	dwAuthenticationProtocol as DWORD
	dwAuthenticationData as DWORD
	dwEapTypeId as DWORD
	dwServerAuthenticationProtocol as DWORD
	dwServerAuthenticationData as DWORD
	dwServerEapTypeId as DWORD
	fMultilink as WINBOOL
	dwTerminateReason as DWORD
	dwServerTerminateReason as DWORD
	szReplyMessage(0 to 1023) as WCHAR
	dwOptions as DWORD
	dwServerOptions as DWORD
end type

#define RASPPPLCPA tagRASPPPLCPA

type tagRASPPPLCPA field = 4
	dwSize as DWORD
	fBundled as WINBOOL
	dwError as DWORD
	dwAuthenticationProtocol as DWORD
	dwAuthenticationData as DWORD
	dwEapTypeId as DWORD
	dwServerAuthenticationProtocol as DWORD
	dwServerAuthenticationData as DWORD
	dwServerEapTypeId as DWORD
	fMultilink as WINBOOL
	dwTerminateReason as DWORD
	dwServerTerminateReason as DWORD
	szReplyMessage(0 to 1023) as CHAR
	dwOptions as DWORD
	dwServerOptions as DWORD
end type

#define RASPPPLCP __MINGW_NAME_AW(RASPPPLCP)

'' TODO: #define LPRASPPPLCPW RASPPPLCPW *
'' TODO: #define LPRASPPPLCPA RASPPPLCPA *
'' TODO: #define LPRASPPPLCP RASPPPLCP *

#define RASSLIPW tagRASSLIPW

type tagRASSLIPW field = 4
	dwSize as DWORD
	dwError as DWORD
	szIpAddress(0 to (15 + 1) - 1) as WCHAR
end type

#define RASSLIPA tagRASSLIPA

type tagRASSLIPA field = 4
	dwSize as DWORD
	dwError as DWORD
	szIpAddress(0 to (15 + 1) - 1) as CHAR
end type

#define RASSLIP __MINGW_NAME_AW(RASSLIP)

'' TODO: #define LPRASSLIPW RASSLIPW*
'' TODO: #define LPRASSLIPA RASSLIPA*
'' TODO: #define LPRASSLIP RASSLIP*

#define RASCCPCA_MPPC &h00000006
#define RASCCPCA_STAC &h00000005
#define RASCCPO_Compression &h00000001
#define RASCCPO_HistoryLess &h00000002
#define RASCCPO_Encryption56bit &h00000010
#define RASCCPO_Encryption40bit &h00000020
#define RASCCPO_Encryption128bit &h00000040
#define RASPPPCCP tagRASPPPCCP

type tagRASPPPCCP field = 4
	dwSize as DWORD
	dwError as DWORD
	dwCompressionAlgorithm as DWORD
	dwOptions as DWORD
	dwServerCompressionAlgorithm as DWORD
	dwServerOptions as DWORD
end type

'' TODO: #define LPRASPPPCCP RASPPPCCP *

#define RASDIALEVENT "RasDialEvent"
#define WM_RASDIALEVENT &hCCCD

type RASDIALFUNC as sub(byval as UINT, byval as tagRASCONNSTATE, byval as DWORD)
type RASDIALFUNC1 as sub(byval as HRASCONN, byval as UINT, byval as tagRASCONNSTATE, byval as DWORD, byval as DWORD)
type RASDIALFUNC2 as function(byval as ULONG_PTR, byval as DWORD, byval as HRASCONN, byval as UINT, byval as tagRASCONNSTATE, byval as DWORD, byval as DWORD) as DWORD

#define RASDEVINFOW tagRASDEVINFOW

type tagRASDEVINFOW field = 4
	dwSize as DWORD
	szDeviceType(0 to (16 + 1) - 1) as WCHAR
	szDeviceName(0 to (128 + 1) - 1) as WCHAR
end type

#define RASDEVINFOA tagRASDEVINFOA

type tagRASDEVINFOA field = 4
	dwSize as DWORD
	szDeviceType(0 to (16 + 1) - 1) as CHAR
	szDeviceName(0 to (128 + 1) - 1) as CHAR
end type

#define RASDEVINFO __MINGW_NAME_AW(RASDEVINFO)

'' TODO: #define LPRASDEVINFOW RASDEVINFOW*
'' TODO: #define LPRASDEVINFOA RASDEVINFOA*
'' TODO: #define LPRASDEVINFO RASDEVINFO*

#define RASCTRYINFO_ RASCTRYINFO

type RASCTRYINFO field = 4
	dwSize as DWORD
	dwCountryID as DWORD
	dwNextCountryID as DWORD
	dwCountryCode as DWORD
	dwCountryNameOffset as DWORD
end type

#define RASCTRYINFOW RASCTRYINFO_
#define RASCTRYINFOA RASCTRYINFO_

'' TODO: #define LPRASCTRYINFOW RASCTRYINFOW*
'' TODO: #define LPRASCTRYINFOA RASCTRYINFOW*
'' TODO: #define LPRASCTRYINFO RASCTRYINFO*

#define RASIPADDR_ RASIPADDR

type RASIPADDR field = 4
	a as BYTE_
	b as BYTE_
	c as BYTE_
	d as BYTE_
end type

#define ET_None 0
#define ET_Require 1
#define ET_RequireMax 2
#define ET_Optional 3
#define VS_Default 0
#define VS_PptpOnly 1
#define VS_PptpFirst 2
#define VS_L2tpOnly 3
#define VS_L2tpFirst 4
#define RASENTRYA tagRASENTRYA

type tagRASENTRYA field = 4
	dwSize as DWORD
	dwfOptions as DWORD
	dwCountryID as DWORD
	dwCountryCode as DWORD
	szAreaCode(0 to (10 + 1) - 1) as CHAR
	szLocalPhoneNumber(0 to (128 + 1) - 1) as CHAR
	dwAlternateOffset as DWORD
	ipaddr as RASIPADDR
	ipaddrDns as RASIPADDR
	ipaddrDnsAlt as RASIPADDR
	ipaddrWins as RASIPADDR
	ipaddrWinsAlt as RASIPADDR
	dwFrameSize as DWORD
	dwfNetProtocols as DWORD
	dwFramingProtocol as DWORD
	szScript(0 to 259) as CHAR
	szAutodialDll(0 to 259) as CHAR
	szAutodialFunc(0 to 259) as CHAR
	szDeviceType(0 to (16 + 1) - 1) as CHAR
	szDeviceName(0 to (128 + 1) - 1) as CHAR
	szX25PadType(0 to (32 + 1) - 1) as CHAR
	szX25Address(0 to (200 + 1) - 1) as CHAR
	szX25Facilities(0 to (200 + 1) - 1) as CHAR
	szX25UserData(0 to (200 + 1) - 1) as CHAR
	dwChannels as DWORD
	dwReserved1 as DWORD
	dwReserved2 as DWORD
	dwSubEntries as DWORD
	dwDialMode as DWORD
	dwDialExtraPercent as DWORD
	dwDialExtraSampleSeconds as DWORD
	dwHangUpExtraPercent as DWORD
	dwHangUpExtraSampleSeconds as DWORD
	dwIdleDisconnectSeconds as DWORD
	dwType as DWORD
	dwEncryptionType as DWORD
	dwCustomAuthKey as DWORD
	guidId as GUID
	szCustomDialDll(0 to 259) as CHAR
	dwVpnStrategy as DWORD
	dwfOptions2 as DWORD
	dwfOptions3 as DWORD
	szDnsSuffix(0 to 255) as CHAR
	dwTcpWindowSize as DWORD
	szPrerequisitePbk(0 to 259) as CHAR
	szPrerequisiteEntry(0 to (256 + 1) - 1) as CHAR
	dwRedialCount as DWORD
	dwRedialPause as DWORD
end type

#define RASENTRYW tagRASENTRYW

type tagRASENTRYW field = 4
	dwSize as DWORD
	dwfOptions as DWORD
	dwCountryID as DWORD
	dwCountryCode as DWORD
	szAreaCode(0 to (10 + 1) - 1) as WCHAR
	szLocalPhoneNumber(0 to (128 + 1) - 1) as WCHAR
	dwAlternateOffset as DWORD
	ipaddr as RASIPADDR
	ipaddrDns as RASIPADDR
	ipaddrDnsAlt as RASIPADDR
	ipaddrWins as RASIPADDR
	ipaddrWinsAlt as RASIPADDR
	dwFrameSize as DWORD
	dwfNetProtocols as DWORD
	dwFramingProtocol as DWORD
	szScript(0 to 259) as WCHAR
	szAutodialDll(0 to 259) as WCHAR
	szAutodialFunc(0 to 259) as WCHAR
	szDeviceType(0 to (16 + 1) - 1) as WCHAR
	szDeviceName(0 to (128 + 1) - 1) as WCHAR
	szX25PadType(0 to (32 + 1) - 1) as WCHAR
	szX25Address(0 to (200 + 1) - 1) as WCHAR
	szX25Facilities(0 to (200 + 1) - 1) as WCHAR
	szX25UserData(0 to (200 + 1) - 1) as WCHAR
	dwChannels as DWORD
	dwReserved1 as DWORD
	dwReserved2 as DWORD
	dwSubEntries as DWORD
	dwDialMode as DWORD
	dwDialExtraPercent as DWORD
	dwDialExtraSampleSeconds as DWORD
	dwHangUpExtraPercent as DWORD
	dwHangUpExtraSampleSeconds as DWORD
	dwIdleDisconnectSeconds as DWORD
	dwType as DWORD
	dwEncryptionType as DWORD
	dwCustomAuthKey as DWORD
	guidId as GUID
	szCustomDialDll(0 to 259) as WCHAR
	dwVpnStrategy as DWORD
	dwfOptions2 as DWORD
	dwfOptions3 as DWORD
	szDnsSuffix(0 to 255) as WCHAR
	dwTcpWindowSize as DWORD
	szPrerequisitePbk(0 to 259) as WCHAR
	szPrerequisiteEntry(0 to (256 + 1) - 1) as WCHAR
	dwRedialCount as DWORD
	dwRedialPause as DWORD
end type

#define RASENTRY __MINGW_NAME_AW(RASENTRY)

'' TODO: #define LPRASENTRYW RASENTRYW*
'' TODO: #define LPRASENTRYA RASENTRYA*
'' TODO: #define LPRASENTRY RASENTRY*

#define RASEO_UseCountryAndAreaCodes &h00000001
#define RASEO_SpecificIpAddr &h00000002
#define RASEO_SpecificNameServers &h00000004
#define RASEO_IpHeaderCompression &h00000008
#define RASEO_RemoteDefaultGateway &h00000010
#define RASEO_DisableLcpExtensions &h00000020
#define RASEO_TerminalBeforeDial &h00000040
#define RASEO_TerminalAfterDial &h00000080
#define RASEO_ModemLights &h00000100
#define RASEO_SwCompression &h00000200
#define RASEO_RequireEncryptedPw &h00000400
#define RASEO_RequireMsEncryptedPw &h00000800
#define RASEO_RequireDataEncryption &h00001000
#define RASEO_NetworkLogon &h00002000
#define RASEO_UseLogonCredentials &h00004000
#define RASEO_PromoteAlternates &h00008000
#define RASEO_SecureLocalFiles &h00010000
#define RASEO_RequireEAP &h00020000
#define RASEO_RequirePAP &h00040000
#define RASEO_RequireSPAP &h00080000
#define RASEO_Custom &h00100000
#define RASEO_PreviewPhoneNumber &h00200000
#define RASEO_SharedPhoneNumbers &h00800000
#define RASEO_PreviewUserPw &h01000000
#define RASEO_PreviewDomain &h02000000
#define RASEO_ShowDialingProgress &h04000000
#define RASEO_RequireCHAP &h08000000
#define RASEO_RequireMsCHAP &h10000000
#define RASEO_RequireMsCHAP2 &h20000000
#define RASEO_RequireW95MSCHAP &h40000000
#define RASEO_CustomScript &h80000000
#define RASEO2_SecureFileAndPrint &h00000001
#define RASEO2_SecureClientForMSNet &h00000002
#define RASEO2_DontNegotiateMultilink &h00000004
#define RASEO2_DontUseRasCredentials &h00000008
#define RASEO2_UsePreSharedKey &h00000010
#define RASEO2_Internet &h00000020
#define RASEO2_DisableNbtOverIP &h00000040
#define RASEO2_UseGlobalDeviceSettings &h00000080
#define RASEO2_ReconnectIfDropped &h00000100
#define RASEO2_SharePhoneNumbers &h00000200
#define RASNP_NetBEUI &h00000001
#define RASNP_Ipx &h00000002
#define RASNP_Ip &h00000004
#define RASFP_Ppp &h00000001
#define RASFP_Slip &h00000002
#define RASFP_Ras &h00000004
#define RASDT_Modem TEXT_("modem")
#define RASDT_Isdn TEXT_("isdn")
#define RASDT_X25 TEXT_("x25")
#define RASDT_Vpn TEXT_("vpn")
#define RASDT_Pad TEXT_("pad")
#define RASDT_Generic TEXT_("GENERIC")
#define RASDT_Serial TEXT_("SERIAL")
#define RASDT_FrameRelay TEXT_("FRAMERELAY")
#define RASDT_Atm TEXT_("ATM")
#define RASDT_Sonet TEXT_("SONET")
#define RASDT_SW56 TEXT_("SW56")
#define RASDT_Irda TEXT_("IRDA")
#define RASDT_Parallel TEXT_("PARALLEL")
#define RASDT_PPPoE TEXT_("PPPoE")
#define RASET_Phone 1
#define RASET_Vpn 2
#define RASET_Direct 3
#define RASET_Internet 4
#define RASET_Broadband 5

type ORASADFUNC as function(byval as HWND, byval as LPSTR, byval as DWORD, byval as LPDWORD) as WINBOOL

#define RASCN_Connection &h00000001
#define RASCN_Disconnection &h00000002
#define RASCN_BandwidthAdded &h00000004
#define RASCN_BandwidthRemoved &h00000008
#define RASEDM_DialAll 1
#define RASEDM_DialAsNeeded 2
#define RASIDS_Disabled &hffffffff
#define RASIDS_UseGlobalValue 0
#define RASADPARAMS tagRASADPARAMS

type tagRASADPARAMS field = 4
	dwSize as DWORD
	hwndOwner as HWND
	dwFlags as DWORD
	xDlg as LONG_
	yDlg as LONG_
end type

'' TODO: #define LPRASADPARAMS RASADPARAMS*

#define RASADFLG_PositionDlg &h00000001

type RASADFUNCA as function(byval as LPSTR, byval as LPSTR, byval as tagRASADPARAMS ptr, byval as LPDWORD) as WINBOOL
type RASADFUNCW as function(byval as LPWSTR, byval as LPWSTR, byval as tagRASADPARAMS ptr, byval as LPDWORD) as WINBOOL

#define RASADFUNC __MINGW_NAME_AW(RASADFUNC)
#define RASSUBENTRYA tagRASSUBENTRYA

type tagRASSUBENTRYA field = 4
	dwSize as DWORD
	dwfFlags as DWORD
	szDeviceType(0 to (16 + 1) - 1) as CHAR
	szDeviceName(0 to (128 + 1) - 1) as CHAR
	szLocalPhoneNumber(0 to (128 + 1) - 1) as CHAR
	dwAlternateOffset as DWORD
end type

#define RASSUBENTRYW tagRASSUBENTRYW

type tagRASSUBENTRYW field = 4
	dwSize as DWORD
	dwfFlags as DWORD
	szDeviceType(0 to (16 + 1) - 1) as WCHAR
	szDeviceName(0 to (128 + 1) - 1) as WCHAR
	szLocalPhoneNumber(0 to (128 + 1) - 1) as WCHAR
	dwAlternateOffset as DWORD
end type

#define RASSUBENTRY __MINGW_NAME_AW(RASSUBENTRY)

'' TODO: #define LPRASSUBENTRYW RASSUBENTRYW*
'' TODO: #define LPRASSUBENTRYA RASSUBENTRYA*
'' TODO: #define LPRASSUBENTRY RASSUBENTRY*

#define RASCREDENTIALSA tagRASCREDENTIALSA

type tagRASCREDENTIALSA field = 4
	dwSize as DWORD
	dwMask as DWORD
	szUserName(0 to (256 + 1) - 1) as CHAR
	szPassword(0 to (256 + 1) - 1) as CHAR
	szDomain(0 to (15 + 1) - 1) as CHAR
end type

#define RASCREDENTIALSW tagRASCREDENTIALSW

type tagRASCREDENTIALSW field = 4
	dwSize as DWORD
	dwMask as DWORD
	szUserName(0 to (256 + 1) - 1) as WCHAR
	szPassword(0 to (256 + 1) - 1) as WCHAR
	szDomain(0 to (15 + 1) - 1) as WCHAR
end type

#define RASCREDENTIALS __MINGW_NAME_AW(RASCREDENTIALS)

'' TODO: #define LPRASCREDENTIALSW RASCREDENTIALSW*
'' TODO: #define LPRASCREDENTIALSA RASCREDENTIALSA*
'' TODO: #define LPRASCREDENTIALS RASCREDENTIALS*

#define RASCM_UserName &h00000001
#define RASCM_Password &h00000002
#define RASCM_Domain &h00000004
#define RASCM_DefaultCreds &h00000008
#define RASCM_PreSharedKey &h00000010
#define RASCM_ServerPreSharedKey &h00000020
#define RASCM_DDMPreSharedKey &h00000040
#define RASAUTODIALENTRYA tagRASAUTODIALENTRYA

type tagRASAUTODIALENTRYA field = 4
	dwSize as DWORD
	dwFlags as DWORD
	dwDialingLocation as DWORD
	szEntry(0 to (256 + 1) - 1) as CHAR
end type

#define RASAUTODIALENTRYW tagRASAUTODIALENTRYW

type tagRASAUTODIALENTRYW field = 4
	dwSize as DWORD
	dwFlags as DWORD
	dwDialingLocation as DWORD
	szEntry(0 to (256 + 1) - 1) as WCHAR
end type

#define RASAUTODIALENTRY __MINGW_NAME_AW(RASAUTODIALENTRY)

'' TODO: #define LPRASAUTODIALENTRYW RASAUTODIALENTRYW*
'' TODO: #define LPRASAUTODIALENTRYA RASAUTODIALENTRYA*
'' TODO: #define LPRASAUTODIALENTRY RASAUTODIALENTRY*

#define RASADP_DisableConnectionQuery 0
#define RASADP_LoginSessionDisable 1
#define RASADP_SavedAddressesLimit 2
#define RASADP_FailedConnectionTimeout 3
#define RASADP_ConnectionQueryTimeout 4
#define RASEAPF_NonInteractive &h00000002
#define RASEAPF_Logon &h00000004
#define RASEAPF_Preview &h00000008
#define RASEAPUSERIDENTITYA tagRASEAPUSERIDENTITYA

type tagRASEAPUSERIDENTITYA field = 4
	szUserName(0 to (256 + 1) - 1) as CHAR
	dwSizeofEapInfo as DWORD
	pbEapInfo(0 to 0) as BYTE_
end type

#define RASEAPUSERIDENTITYW tagRASEAPUSERIDENTITYW

type tagRASEAPUSERIDENTITYW field = 4
	szUserName(0 to (256 + 1) - 1) as WCHAR
	dwSizeofEapInfo as DWORD
	pbEapInfo(0 to 0) as BYTE_
end type

#define RASEAPUSERIDENTITY __MINGW_NAME_AW(RASEAPUSERIDENTITY)

'' TODO: #define LPRASEAPUSERIDENTITYW RASEAPUSERIDENTITYW*
'' TODO: #define LPRASEAPUSERIDENTITYA RASEAPUSERIDENTITYA*

type PFNRASGETBUFFER as function(byval ppBuffer as PBYTE ptr, byval pdwSize as PDWORD) as DWORD
type PFNRASFREEBUFFER as function(byval pBufer as PBYTE) as DWORD
type PFNRASSENDBUFFER as function(byval hPort as HANDLE, byval pBuffer as PBYTE, byval dwSize as DWORD) as DWORD
type PFNRASRECEIVEBUFFER as function(byval hPort as HANDLE, byval pBuffer as PBYTE, byval pdwSize as PDWORD, byval dwTimeOut as DWORD, byval hEvent as HANDLE) as DWORD
type PFNRASRETRIEVEBUFFER as function(byval hPort as HANDLE, byval pBuffer as PBYTE, byval pdwSize as PDWORD) as DWORD

#ifdef UNICODE
	type RasCustomScriptExecuteFn as function(byval hPort as HANDLE, byval lpszPhonebook as LPCWSTR, byval lpszEntryName as LPCWSTR, byval pfnRasGetBuffer as PFNRASGETBUFFER, byval pfnRasFreeBuffer as PFNRASFREEBUFFER, byval pfnRasSendBuffer as PFNRASSENDBUFFER, byval pfnRasReceiveBuffer as PFNRASRECEIVEBUFFER, byval pfnRasRetrieveBuffer as PFNRASRETRIEVEBUFFER, byval hWnd as HWND, byval pRasDialParams as tagRASDIALPARAMSW ptr, byval pvReserved as PVOID) as DWORD
#else
	type RasCustomScriptExecuteFn as function(byval hPort as HANDLE, byval lpszPhonebook as LPCWSTR, byval lpszEntryName as LPCWSTR, byval pfnRasGetBuffer as PFNRASGETBUFFER, byval pfnRasFreeBuffer as PFNRASFREEBUFFER, byval pfnRasSendBuffer as PFNRASSENDBUFFER, byval pfnRasReceiveBuffer as PFNRASRECEIVEBUFFER, byval pfnRasRetrieveBuffer as PFNRASRETRIEVEBUFFER, byval hWnd as HWND, byval pRasDialParams as tagRASDIALPARAMSA ptr, byval pvReserved as PVOID) as DWORD
#endif

#define RASCOMMSETTINGS tagRASCOMMSETTINGS

type tagRASCOMMSETTINGS field = 4
	dwSize as DWORD
	bParity as BYTE_
	bStop as BYTE_
	bByteSize as BYTE_
	bAlign as BYTE_
end type

type PFNRASSETCOMMSETTINGS as function(byval hPort as HANDLE, byval pRasCommSettings as tagRASCOMMSETTINGS ptr, byval pvReserved as PVOID) as DWORD

#define RASCUSTOMSCRIPTEXTENSIONS tagRASCUSTOMSCRIPTEXTENSIONS

type tagRASCUSTOMSCRIPTEXTENSIONS field = 4
	dwSize as DWORD
	pfnRasSetCommSettings as PFNRASSETCOMMSETTINGS
end type

declare function RasDialA(byval as tagRASDIALEXTENSIONS ptr, byval as LPCSTR, byval as tagRASDIALPARAMSA ptr, byval as DWORD, byval as LPVOID, byval as HRASCONN ptr) as DWORD
declare function RasDialW(byval as tagRASDIALEXTENSIONS ptr, byval as LPCWSTR, byval as tagRASDIALPARAMSW ptr, byval as DWORD, byval as LPVOID, byval as HRASCONN ptr) as DWORD
declare function RasEnumConnectionsA(byval as tagRASCONNA ptr, byval as LPDWORD, byval as LPDWORD) as DWORD
declare function RasEnumConnectionsW(byval as tagRASCONNW ptr, byval as LPDWORD, byval as LPDWORD) as DWORD
declare function RasEnumEntriesA(byval as LPCSTR, byval as LPCSTR, byval as tagRASENTRYNAMEA ptr, byval as LPDWORD, byval as LPDWORD) as DWORD
declare function RasEnumEntriesW(byval as LPCWSTR, byval as LPCWSTR, byval as tagRASENTRYNAMEW ptr, byval as LPDWORD, byval as LPDWORD) as DWORD
declare function RasGetConnectStatusA(byval as HRASCONN, byval as tagRASCONNSTATUSA ptr) as DWORD
declare function RasGetConnectStatusW(byval as HRASCONN, byval as tagRASCONNSTATUSW ptr) as DWORD
declare function RasGetErrorStringA(byval as UINT, byval as LPSTR, byval as DWORD) as DWORD
declare function RasGetErrorStringW(byval as UINT, byval as LPWSTR, byval as DWORD) as DWORD
declare function RasHangUpA(byval as HRASCONN) as DWORD
declare function RasHangUpW(byval as HRASCONN) as DWORD
declare function RasGetProjectionInfoA(byval as HRASCONN, byval as tagRASPROJECTION, byval as LPVOID, byval as LPDWORD) as DWORD
declare function RasGetProjectionInfoW(byval as HRASCONN, byval as tagRASPROJECTION, byval as LPVOID, byval as LPDWORD) as DWORD
declare function RasCreatePhonebookEntryA(byval as HWND, byval as LPCSTR) as DWORD
declare function RasCreatePhonebookEntryW(byval as HWND, byval as LPCWSTR) as DWORD
declare function RasEditPhonebookEntryA(byval as HWND, byval as LPCSTR, byval as LPCSTR) as DWORD
declare function RasEditPhonebookEntryW(byval as HWND, byval as LPCWSTR, byval as LPCWSTR) as DWORD
declare function RasSetEntryDialParamsA(byval as LPCSTR, byval as tagRASDIALPARAMSA ptr, byval as WINBOOL) as DWORD
declare function RasSetEntryDialParamsW(byval as LPCWSTR, byval as tagRASDIALPARAMSW ptr, byval as WINBOOL) as DWORD
declare function RasGetEntryDialParamsA(byval as LPCSTR, byval as tagRASDIALPARAMSA ptr, byval as LPBOOL) as DWORD
declare function RasGetEntryDialParamsW(byval as LPCWSTR, byval as tagRASDIALPARAMSW ptr, byval as LPBOOL) as DWORD
declare function RasEnumDevicesA(byval as tagRASDEVINFOA ptr, byval as LPDWORD, byval as LPDWORD) as DWORD
declare function RasEnumDevicesW(byval as tagRASDEVINFOW ptr, byval as LPDWORD, byval as LPDWORD) as DWORD
declare function RasGetCountryInfoA(byval as RASCTRYINFO ptr, byval as LPDWORD) as DWORD
declare function RasGetCountryInfoW(byval as RASCTRYINFO ptr, byval as LPDWORD) as DWORD
declare function RasGetEntryPropertiesA(byval as LPCSTR, byval as LPCSTR, byval as tagRASENTRYA ptr, byval as LPDWORD, byval as LPBYTE, byval as LPDWORD) as DWORD
declare function RasGetEntryPropertiesW(byval as LPCWSTR, byval as LPCWSTR, byval as tagRASENTRYW ptr, byval as LPDWORD, byval as LPBYTE, byval as LPDWORD) as DWORD
declare function RasSetEntryPropertiesA(byval as LPCSTR, byval as LPCSTR, byval as tagRASENTRYA ptr, byval as DWORD, byval as LPBYTE, byval as DWORD) as DWORD
declare function RasSetEntryPropertiesW(byval as LPCWSTR, byval as LPCWSTR, byval as tagRASENTRYW ptr, byval as DWORD, byval as LPBYTE, byval as DWORD) as DWORD
declare function RasRenameEntryA(byval as LPCSTR, byval as LPCSTR, byval as LPCSTR) as DWORD
declare function RasRenameEntryW(byval as LPCWSTR, byval as LPCWSTR, byval as LPCWSTR) as DWORD
declare function RasDeleteEntryA(byval as LPCSTR, byval as LPCSTR) as DWORD
declare function RasDeleteEntryW(byval as LPCWSTR, byval as LPCWSTR) as DWORD
declare function RasValidateEntryNameA(byval as LPCSTR, byval as LPCSTR) as DWORD
declare function RasValidateEntryNameW(byval as LPCWSTR, byval as LPCWSTR) as DWORD
declare function RasConnectionNotificationA(byval as HRASCONN, byval as HANDLE, byval as DWORD) as DWORD
declare function RasConnectionNotificationW(byval as HRASCONN, byval as HANDLE, byval as DWORD) as DWORD
declare function RasGetSubEntryHandleA(byval as HRASCONN, byval as DWORD, byval as HRASCONN ptr) as DWORD
declare function RasGetSubEntryHandleW(byval as HRASCONN, byval as DWORD, byval as HRASCONN ptr) as DWORD
declare function RasGetCredentialsA(byval as LPCSTR, byval as LPCSTR, byval as tagRASCREDENTIALSA ptr) as DWORD
declare function RasGetCredentialsW(byval as LPCWSTR, byval as LPCWSTR, byval as tagRASCREDENTIALSW ptr) as DWORD
declare function RasSetCredentialsA(byval as LPCSTR, byval as LPCSTR, byval as tagRASCREDENTIALSA ptr, byval as WINBOOL) as DWORD
declare function RasSetCredentialsW(byval as LPCWSTR, byval as LPCWSTR, byval as tagRASCREDENTIALSW ptr, byval as WINBOOL) as DWORD
declare function RasGetSubEntryPropertiesA(byval as LPCSTR, byval as LPCSTR, byval as DWORD, byval as tagRASSUBENTRYA ptr, byval as LPDWORD, byval as LPBYTE, byval as LPDWORD) as DWORD
declare function RasGetSubEntryPropertiesW(byval as LPCWSTR, byval as LPCWSTR, byval as DWORD, byval as tagRASSUBENTRYW ptr, byval as LPDWORD, byval as LPBYTE, byval as LPDWORD) as DWORD
declare function RasSetSubEntryPropertiesA(byval as LPCSTR, byval as LPCSTR, byval as DWORD, byval as tagRASSUBENTRYA ptr, byval as DWORD, byval as LPBYTE, byval as DWORD) as DWORD
declare function RasSetSubEntryPropertiesW(byval as LPCWSTR, byval as LPCWSTR, byval as DWORD, byval as tagRASSUBENTRYW ptr, byval as DWORD, byval as LPBYTE, byval as DWORD) as DWORD
declare function RasGetAutodialAddressA(byval as LPCSTR, byval as LPDWORD, byval as tagRASAUTODIALENTRYA ptr, byval as LPDWORD, byval as LPDWORD) as DWORD
declare function RasGetAutodialAddressW(byval as LPCWSTR, byval as LPDWORD, byval as tagRASAUTODIALENTRYW ptr, byval as LPDWORD, byval as LPDWORD) as DWORD
declare function RasSetAutodialAddressA(byval as LPCSTR, byval as DWORD, byval as tagRASAUTODIALENTRYA ptr, byval as DWORD, byval as DWORD) as DWORD
declare function RasSetAutodialAddressW(byval as LPCWSTR, byval as DWORD, byval as tagRASAUTODIALENTRYW ptr, byval as DWORD, byval as DWORD) as DWORD
declare function RasEnumAutodialAddressesA(byval as LPSTR ptr, byval as LPDWORD, byval as LPDWORD) as DWORD
declare function RasEnumAutodialAddressesW(byval as LPWSTR ptr, byval as LPDWORD, byval as LPDWORD) as DWORD
declare function RasGetAutodialEnableA(byval as DWORD, byval as LPBOOL) as DWORD
declare function RasGetAutodialEnableW(byval as DWORD, byval as LPBOOL) as DWORD
declare function RasSetAutodialEnableA(byval as DWORD, byval as WINBOOL) as DWORD
declare function RasSetAutodialEnableW(byval as DWORD, byval as WINBOOL) as DWORD
declare function RasGetAutodialParamA(byval as DWORD, byval as LPVOID, byval as LPDWORD) as DWORD
declare function RasGetAutodialParamW(byval as DWORD, byval as LPVOID, byval as LPDWORD) as DWORD
declare function RasSetAutodialParamA(byval as DWORD, byval as LPVOID, byval as DWORD) as DWORD
declare function RasSetAutodialParamW(byval as DWORD, byval as LPVOID, byval as DWORD) as DWORD

type _RAS_STATS field = 4
	dwSize as DWORD
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
	dwCompressionRatioIn as DWORD
	dwCompressionRatioOut as DWORD
	dwBps as DWORD
	dwConnectDuration as DWORD
end type

type RAS_STATS as _RAS_STATS
type PRAS_STATS as _RAS_STATS ptr
type RasCustomHangUpFn as function(byval hRasConn as HRASCONN) as DWORD

#ifdef UNICODE
	type RasCustomDialFn as function(byval hInstDll as HINSTANCE, byval lpRasDialExtensions as tagRASDIALEXTENSIONS ptr, byval lpszPhonebook as LPCWSTR, byval lpRasDialParams as tagRASDIALPARAMSW ptr, byval dwNotifierType as DWORD, byval lpvNotifier as LPVOID, byval lphRasConn_ as HRASCONN ptr, byval dwFlags as DWORD) as DWORD
#else
	type RasCustomDialFn as function(byval hInstDll as HINSTANCE, byval lpRasDialExtensions as tagRASDIALEXTENSIONS ptr, byval lpszPhonebook as LPCWSTR, byval lpRasDialParams as tagRASDIALPARAMSA ptr, byval dwNotifierType as DWORD, byval lpvNotifier as LPVOID, byval lphRasConn_ as HRASCONN ptr, byval dwFlags as DWORD) as DWORD
#endif

type RasCustomDeleteEntryNotifyFn as function(byval lpszPhonebook as LPCWSTR, byval lpszEntry as LPCWSTR, byval dwFlags as DWORD) as DWORD

#define RCD_SingleUser 0
#define RCD_AllUsers &h00000001
#define RCD_Eap &h00000002
#define RCD_Logon &h00000004

declare function RasInvokeEapUI(byval as HRASCONN, byval as DWORD, byval as tagRASDIALEXTENSIONS ptr, byval as HWND) as DWORD
declare function RasGetLinkStatistics(byval hRasConn as HRASCONN, byval dwSubEntry as DWORD, byval lpStatistics as RAS_STATS ptr) as DWORD
declare function RasGetConnectionStatistics(byval hRasConn as HRASCONN, byval lpStatistics as RAS_STATS ptr) as DWORD
declare function RasClearLinkStatistics(byval hRasConn as HRASCONN, byval dwSubEntry as DWORD) as DWORD
declare function RasClearConnectionStatistics(byval hRasConn as HRASCONN) as DWORD
declare function RasGetEapUserDataA(byval hToken as HANDLE, byval pszPhonebook as LPCSTR, byval pszEntry as LPCSTR, byval pbEapData as BYTE_ ptr, byval pdwSizeofEapData as DWORD ptr) as DWORD
declare function RasGetEapUserDataW(byval hToken as HANDLE, byval pszPhonebook as LPCWSTR, byval pszEntry as LPCWSTR, byval pbEapData as BYTE_ ptr, byval pdwSizeofEapData as DWORD ptr) as DWORD
declare function RasSetEapUserDataA(byval hToken as HANDLE, byval pszPhonebook as LPCSTR, byval pszEntry as LPCSTR, byval pbEapData as BYTE_ ptr, byval dwSizeofEapData as DWORD) as DWORD
declare function RasSetEapUserDataW(byval hToken as HANDLE, byval pszPhonebook as LPCWSTR, byval pszEntry as LPCWSTR, byval pbEapData as BYTE_ ptr, byval dwSizeofEapData as DWORD) as DWORD
declare function RasGetCustomAuthDataA(byval pszPhonebook as LPCSTR, byval pszEntry as LPCSTR, byval pbCustomAuthData as BYTE_ ptr, byval pdwSizeofCustomAuthData as DWORD ptr) as DWORD
declare function RasGetCustomAuthDataW(byval pszPhonebook as LPCWSTR, byval pszEntry as LPCWSTR, byval pbCustomAuthData as BYTE_ ptr, byval pdwSizeofCustomAuthData as DWORD ptr) as DWORD
declare function RasSetCustomAuthDataA(byval pszPhonebook as LPCSTR, byval pszEntry as LPCSTR, byval pbCustomAuthData as BYTE_ ptr, byval dwSizeofCustomAuthData as DWORD) as DWORD
declare function RasSetCustomAuthDataW(byval pszPhonebook as LPCWSTR, byval pszEntry as LPCWSTR, byval pbCustomAuthData as BYTE_ ptr, byval dwSizeofCustomAuthData as DWORD) as DWORD
declare function RasGetEapUserIdentityW(byval pszPhonebook as LPCWSTR, byval pszEntry as LPCWSTR, byval dwFlags as DWORD, byval hwnd as HWND, byval ppRasEapUserIdentity as tagRASEAPUSERIDENTITYW ptr ptr) as DWORD
declare function RasGetEapUserIdentityA(byval pszPhonebook as LPCSTR, byval pszEntry as LPCSTR, byval dwFlags as DWORD, byval hwnd as HWND, byval ppRasEapUserIdentity as tagRASEAPUSERIDENTITYA ptr ptr) as DWORD
declare sub RasFreeEapUserIdentityW(byval pRasEapUserIdentity as tagRASEAPUSERIDENTITYW ptr)
declare sub RasFreeEapUserIdentityA(byval pRasEapUserIdentity as tagRASEAPUSERIDENTITYA ptr)
declare function RasDeleteSubEntryA(byval pszPhonebook as LPCSTR, byval pszEntry as LPCSTR, byval dwSubentryId as DWORD) as DWORD
declare function RasDeleteSubEntryW(byval pszPhonebook as LPCWSTR, byval pszEntry as LPCWSTR, byval dwSubEntryId as DWORD) as DWORD

#define RasDial __MINGW_NAME_AW(RasDial)
#define RasEnumConnections __MINGW_NAME_AW(RasEnumConnections)
#define RasEnumEntries __MINGW_NAME_AW(RasEnumEntries)
#define RasGetConnectStatus __MINGW_NAME_AW(RasGetConnectStatus)
#define RasGetErrorString __MINGW_NAME_AW(RasGetErrorString)
#define RasHangUp __MINGW_NAME_AW(RasHangUp)
#define RasGetProjectionInfo __MINGW_NAME_AW(RasGetProjectionInfo)
#define RasCreatePhonebookEntry __MINGW_NAME_AW(RasCreatePhonebookEntry)
#define RasEditPhonebookEntry __MINGW_NAME_AW(RasEditPhonebookEntry)
#define RasSetEntryDialParams __MINGW_NAME_AW(RasSetEntryDialParams)
#define RasGetEntryDialParams __MINGW_NAME_AW(RasGetEntryDialParams)
#define RasEnumDevices __MINGW_NAME_AW(RasEnumDevices)
#define RasGetCountryInfo __MINGW_NAME_AW(RasGetCountryInfo)
#define RasGetEntryProperties __MINGW_NAME_AW(RasGetEntryProperties)
#define RasSetEntryProperties __MINGW_NAME_AW(RasSetEntryProperties)
#define RasRenameEntry __MINGW_NAME_AW(RasRenameEntry)
#define RasDeleteEntry __MINGW_NAME_AW(RasDeleteEntry)
#define RasValidateEntryName __MINGW_NAME_AW(RasValidateEntryName)
#define RasGetSubEntryHandle __MINGW_NAME_AW(RasGetSubEntryHandle)
#define RasConnectionNotification __MINGW_NAME_AW(RasConnectionNotification)
#define RasGetSubEntryProperties __MINGW_NAME_AW(RasGetSubEntryProperties)
#define RasSetSubEntryProperties __MINGW_NAME_AW(RasSetSubEntryProperties)
#define RasGetCredentials __MINGW_NAME_AW(RasGetCredentials)
#define RasSetCredentials __MINGW_NAME_AW(RasSetCredentials)
#define RasGetAutodialAddress __MINGW_NAME_AW(RasGetAutodialAddress)
#define RasSetAutodialAddress __MINGW_NAME_AW(RasSetAutodialAddress)
#define RasEnumAutodialAddresses __MINGW_NAME_AW(RasEnumAutodialAddresses)
#define RasGetAutodialEnable __MINGW_NAME_AW(RasGetAutodialEnable)
#define RasSetAutodialEnable __MINGW_NAME_AW(RasSetAutodialEnable)
#define RasGetAutodialParam __MINGW_NAME_AW(RasGetAutodialParam)
#define RasSetAutodialParam __MINGW_NAME_AW(RasSetAutodialParam)
#define RasGetEapUserData __MINGW_NAME_AW(RasGetEapUserData)
#define RasSetEapUserData __MINGW_NAME_AW(RasSetEapUserData)
#define RasGetCustomAuthData __MINGW_NAME_AW(RasGetCustomAuthData)
#define RasSetCustomAuthData __MINGW_NAME_AW(RasSetCustomAuthData)
#define RasGetEapUserIdentity __MINGW_NAME_AW(RasGetEapUserIdentity)
#define RasFreeEapUserIdentity __MINGW_NAME_AW(RasFreeEapUserIdentity)
#define RasDeleteSubEntry __MINGW_NAME_AW(RasDeleteSubEntry)

end extern
