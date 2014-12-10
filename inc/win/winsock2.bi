#pragma once

#include once "crt/wchar.bi"
#include once "crt/long.bi"
#include once "_mingw_unicode.bi"
#include once "windows.bi"
#include once "psdk_inc/_ws1_undef.bi"
#include once "_timeval.bi"
#include once "_bsd_types.bi"
#include once "inaddr.bi"
#include once "psdk_inc/_socket_types.bi"
#include once "psdk_inc/_fd_types.bi"
#include once "psdk_inc/_ip_types.bi"
#include once "psdk_inc/_wsadata.bi"
#include once "ws2def.bi"
#include once "psdk_inc/_wsa_errnos.bi"
#include once "qos.bi"

'' The following symbols have been renamed:
''     typedef SOCKADDR_STORAGE => SOCKADDR_STORAGE_
''     procedure select => select_

#ifdef __FB_64BIT__
	extern "C"
#else
	extern "Windows"
#endif

#define _WINSOCK2API_
#define _WINSOCKAPI_
#define INCL_WINSOCK_API_TYPEDEFS 0
#define WINSOCK_VERSION MAKEWORD(2, 2)
#define WINSOCK_API_LINKAGE DECLSPEC_IMPORT
#define WSAAPI WINAPI
#define IOCPARM_MASK &h7f
#define IOC_VOID &h20000000
#define IOC_OUT &h40000000
#define IOC_IN &h80000000
#define IOC_INOUT (IOC_IN or IOC_OUT)
#define _IO(x, y) ((IOC_VOID or ((x) shl 8)) or (y))

'' TODO: #define _IOR(x,y,t) (IOC_OUT|(((__LONG32)sizeof(t)&IOCPARM_MASK)<<16)|((x)<<8)|(y))
'' TODO: #define _IOW(x,y,t) (IOC_IN|(((__LONG32)sizeof(t)&IOCPARM_MASK)<<16)|((x)<<8)|(y))

#define FIONREAD _IOR(asc("f"), 127, u_long)
#define FIONBIO _IOW(asc("f"), 126, u_long)
#define FIOASYNC _IOW(asc("f"), 125, u_long)
#define SIOCSHIWAT _IOW(asc("s"), 0, u_long)
#define SIOCGHIWAT _IOR(asc("s"), 1, u_long)
#define SIOCSLOWAT _IOW(asc("s"), 2, u_long)
#define SIOCGLOWAT _IOR(asc("s"), 3, u_long)
#define SIOCATMARK _IOR(asc("s"), 7, u_long)
#define IPPROTO_IP 0
#define IPPROTO_HOPOPTS 0
#define IPPROTO_ICMP 1
#define IPPROTO_IGMP 2
#define IPPROTO_GGP 3
#define IPPROTO_IPV4 4
#define IPPROTO_TCP 6
#define IPPROTO_PUP 12
#define IPPROTO_UDP 17
#define IPPROTO_IDP 22
#define IPPROTO_IPV6 41
#define IPPROTO_ROUTING 43
#define IPPROTO_FRAGMENT 44
#define IPPROTO_ESP 50
#define IPPROTO_AH 51
#define IPPROTO_ICMPV6 58
#define IPPROTO_NONE 59
#define IPPROTO_DSTOPTS 60
#define IPPROTO_ND 77
#define IPPROTO_ICLFXBM 78
#define IPPROTO_RAW 255
#define IPPROTO_MAX 256
#define IPPORT_ECHO 7
#define IPPORT_DISCARD 9
#define IPPORT_SYSTAT 11
#define IPPORT_DAYTIME 13
#define IPPORT_NETSTAT 15
#define IPPORT_FTP 21
#define IPPORT_TELNET 23
#define IPPORT_SMTP 25
#define IPPORT_TIMESERVER 37
#define IPPORT_NAMESERVER 42
#define IPPORT_WHOIS 43
#define IPPORT_MTP 57
#define IPPORT_TFTP 69
#define IPPORT_RJE 77
#define IPPORT_FINGER 79
#define IPPORT_TTYLINK 87
#define IPPORT_SUPDUP 95
#define IPPORT_EXECSERVER 512
#define IPPORT_LOGINSERVER 513
#define IPPORT_CMDSERVER 514
#define IPPORT_EFSSERVER 520
#define IPPORT_BIFFUDP 512
#define IPPORT_WHOSERVER 513
#define IPPORT_ROUTESERVER 520
#define IPPORT_RESERVED 1024
#define IMPLINK_IP 155
#define IMPLINK_LOWEXPER 156
#define IMPLINK_HIGHEXPER 158

'' TODO: #define IN_CLASSA(i) (((__LONG32)(i) & 0x80000000)==0)

#define IN_CLASSA_NET &hff000000
#define IN_CLASSA_NSHIFT 24
#define IN_CLASSA_HOST &h00ffffff
#define IN_CLASSA_MAX 128

'' TODO: #define IN_CLASSB(i) (((__LONG32)(i) & 0xc0000000)==0x80000000)

#define IN_CLASSB_NET &hffff0000
#define IN_CLASSB_NSHIFT 16
#define IN_CLASSB_HOST &h0000ffff
#define IN_CLASSB_MAX 65536

'' TODO: #define IN_CLASSC(i) (((__LONG32)(i) & 0xe0000000)==0xc0000000)

#define IN_CLASSC_NET &hffffff00
#define IN_CLASSC_NSHIFT 8
#define IN_CLASSC_HOST &h000000ff

'' TODO: #define IN_CLASSD(i) (((__LONG32)(i) & 0xf0000000)==0xe0000000)

#define IN_CLASSD_NET &hf0000000
#define IN_CLASSD_NSHIFT 28
#define IN_CLASSD_HOST &h0fffffff
#define IN_MULTICAST(i) IN_CLASSD(i)
#define INADDR_ANY cast(u_long, &h00000000)
#define INADDR_LOOPBACK &h7f000001
#define INADDR_BROADCAST cast(u_long, &hffffffff)
#define INADDR_NONE &hffffffff
#define ADDR_ANY INADDR_ANY
#define FROM_PROTOCOL_INFO (-1)
#define SOCK_STREAM 1
#define SOCK_DGRAM 2
#define SOCK_RAW 3
#define SOCK_RDM 4
#define SOCK_SEQPACKET 5
#define SO_DEBUG &h0001
#define SO_ACCEPTCONN &h0002
#define SO_REUSEADDR &h0004
#define SO_KEEPALIVE &h0008
#define SO_DONTROUTE &h0010
#define SO_BROADCAST &h0020
#define SO_USELOOPBACK &h0040
#define SO_LINGER &h0080
#define SO_OOBINLINE &h0100
#define SO_DONTLINGER clng(not SO_LINGER)
#define SO_EXCLUSIVEADDRUSE clng(not SO_REUSEADDR)
#define SO_SNDBUF &h1001
#define SO_RCVBUF &h1002
#define SO_SNDLOWAT &h1003
#define SO_RCVLOWAT &h1004
#define SO_SNDTIMEO &h1005
#define SO_RCVTIMEO &h1006
#define SO_ERROR &h1007
#define SO_TYPE &h1008
#define SO_GROUP_ID &h2001
#define SO_GROUP_PRIORITY &h2002
#define SO_MAX_MSG_SIZE &h2003
#define SO_PROTOCOL_INFOA &h2004
#define SO_PROTOCOL_INFOW &h2005
#define SO_PROTOCOL_INFO __MINGW_NAME_AW(SO_PROTOCOL_INFO)
#define PVD_CONFIG &h3001
#define SO_CONDITIONAL_ACCEPT &h3002
#define TCP_NODELAY &h0001
#define AF_UNSPEC 0
#define AF_UNIX 1
#define AF_INET 2
#define AF_IMPLINK 3
#define AF_PUP 4
#define AF_CHAOS 5
#define AF_NS 6
#define AF_IPX AF_NS
#define AF_ISO 7
#define AF_OSI AF_ISO
#define AF_ECMA 8
#define AF_DATAKIT 9
#define AF_CCITT 10
#define AF_SNA 11
#define AF_DECnet 12
#define AF_DLI 13
#define AF_LAT 14
#define AF_HYLINK 15
#define AF_APPLETALK 16
#define AF_NETBIOS 17
#define AF_VOICEVIEW 18
#define AF_FIREFOX 19
#define AF_UNKNOWN1 20
#define AF_BAN 21
#define AF_ATM 22
#define AF_INET6 23
#define AF_CLUSTER 24
#define AF_12844 25
#define AF_IRDA 26
#define AF_NETDES 28
#define AF_TCNPROCESS 29
#define AF_TCNMESSAGE 30
#define AF_ICLFXBM 31
#define AF_BTH 32
#define AF_MAX 33
#define _SS_MAXSIZE 128
#define _SS_ALIGNSIZE 8
#define _SS_PAD1SIZE (_SS_ALIGNSIZE - sizeof(short))
#define _SS_PAD2SIZE (_SS_MAXSIZE - ((sizeof(short) + _SS_PAD1SIZE) + _SS_ALIGNSIZE))

type sockaddr_storage
	ss_family as short
	__ss_pad1 as zstring * 8 - sizeof(short)
	__ss_align as longint
	__ss_pad2 as zstring * 128 - ((sizeof(short) + (8 - sizeof(short))) + 8)
end type

#define PF_UNSPEC AF_UNSPEC
#define PF_UNIX AF_UNIX
#define PF_INET AF_INET
#define PF_IMPLINK AF_IMPLINK
#define PF_PUP AF_PUP
#define PF_CHAOS AF_CHAOS
#define PF_NS AF_NS
#define PF_IPX AF_IPX
#define PF_ISO AF_ISO
#define PF_OSI AF_OSI
#define PF_ECMA AF_ECMA
#define PF_DATAKIT AF_DATAKIT
#define PF_CCITT AF_CCITT
#define PF_SNA AF_SNA
#define PF_DECnet AF_DECnet
#define PF_DLI AF_DLI
#define PF_LAT AF_LAT
#define PF_HYLINK AF_HYLINK
#define PF_APPLETALK AF_APPLETALK
#define PF_VOICEVIEW AF_VOICEVIEW
#define PF_FIREFOX AF_FIREFOX
#define PF_UNKNOWN1 AF_UNKNOWN1
#define PF_BAN AF_BAN
#define PF_ATM AF_ATM
#define PF_INET6 AF_INET6
#define PF_BTH AF_BTH
#define PF_MAX AF_MAX
#define SOL_SOCKET &hffff
#define SOMAXCONN &h7fffffff
#define MSG_OOB &h1
#define MSG_PEEK &h2
#define MSG_DONTROUTE &h4
#define MSG_WAITALL &h8
#define MSG_PARTIAL &h8000
#define MSG_INTERRUPT &h10
#define MSG_MAXIOVLEN 16
#define MAXGETHOSTSTRUCT 1024
#define FD_READ_BIT 0
#define FD_READ (1 shl FD_READ_BIT)
#define FD_WRITE_BIT 1
#define FD_WRITE (1 shl FD_WRITE_BIT)
#define FD_OOB_BIT 2
#define FD_OOB (1 shl FD_OOB_BIT)
#define FD_ACCEPT_BIT 3
#define FD_ACCEPT (1 shl FD_ACCEPT_BIT)
#define FD_CONNECT_BIT 4
#define FD_CONNECT (1 shl FD_CONNECT_BIT)
#define FD_CLOSE_BIT 5
#define FD_CLOSE (1 shl FD_CLOSE_BIT)
#define FD_QOS_BIT 6
#define FD_QOS (1 shl FD_QOS_BIT)
#define FD_GROUP_QOS_BIT 7
#define FD_GROUP_QOS (1 shl FD_GROUP_QOS_BIT)
#define FD_ROUTING_INTERFACE_CHANGE_BIT 8
#define FD_ROUTING_INTERFACE_CHANGE (1 shl FD_ROUTING_INTERFACE_CHANGE_BIT)
#define FD_ADDRESS_LIST_CHANGE_BIT 9
#define FD_ADDRESS_LIST_CHANGE (1 shl FD_ADDRESS_LIST_CHANGE_BIT)
#define FD_MAX_EVENTS 10
#define FD_ALL_EVENTS ((1 shl FD_MAX_EVENTS) - 1)
#define WSAEVENT HANDLE
#define LPWSAEVENT LPHANDLE
#define WSAOVERLAPPED OVERLAPPED

type LPWSAOVERLAPPED as _OVERLAPPED ptr

#define WSA_IO_PENDING ERROR_IO_PENDING
#define WSA_IO_INCOMPLETE ERROR_IO_INCOMPLETE
#define WSA_INVALID_HANDLE ERROR_INVALID_HANDLE
#define WSA_INVALID_PARAMETER ERROR_INVALID_PARAMETER
#define WSA_NOT_ENOUGH_MEMORY ERROR_NOT_ENOUGH_MEMORY
#define WSA_OPERATION_ABORTED ERROR_OPERATION_ABORTED

'' TODO: #define WSA_INVALID_EVENT ((WSAEVENT)NULL)

#define WSA_MAXIMUM_WAIT_EVENTS MAXIMUM_WAIT_OBJECTS
#define WSA_WAIT_FAILED WAIT_FAILED
#define WSA_WAIT_EVENT_0 WAIT_OBJECT_0
#define WSA_WAIT_IO_COMPLETION WAIT_IO_COMPLETION
#define WSA_WAIT_TIMEOUT WAIT_TIMEOUT
#define WSA_INFINITE INFINITE

type _WSABUF
	len as u_long
	buf as zstring ptr
end type

type WSABUF as _WSABUF
type LPWSABUF as _WSABUF ptr

type _QualityOfService
	SendingFlowspec as FLOWSPEC
	ReceivingFlowspec as FLOWSPEC
	ProviderSpecific as WSABUF
end type

type QOS as _QualityOfService
type LPQOS as _QualityOfService ptr

#define CF_ACCEPT &h0000
#define CF_REJECT &h0001
#define CF_DEFER &h0002
#define SD_RECEIVE &h00
#define SD_SEND &h01
#define SD_BOTH &h02

type GROUP as ulong

#define SG_UNCONSTRAINED_GROUP &h01
#define SG_CONSTRAINED_GROUP &h02

type _WSANETWORKEVENTS
	lNetworkEvents as clong
	iErrorCode(0 to 9) as long
end type

type WSANETWORKEVENTS as _WSANETWORKEVENTS
type LPWSANETWORKEVENTS as _WSANETWORKEVENTS ptr

#define MAX_PROTOCOL_CHAIN 7
#define BASE_PROTOCOL 1
#define LAYERED_PROTOCOL 0

type _WSAPROTOCOLCHAIN
	ChainLen as long
	ChainEntries(0 to 6) as DWORD
end type

type WSAPROTOCOLCHAIN as _WSAPROTOCOLCHAIN
type LPWSAPROTOCOLCHAIN as _WSAPROTOCOLCHAIN ptr

#define WSAPROTOCOL_LEN 255

type _WSAPROTOCOL_INFOA
	dwServiceFlags1 as DWORD
	dwServiceFlags2 as DWORD
	dwServiceFlags3 as DWORD
	dwServiceFlags4 as DWORD
	dwProviderFlags as DWORD
	ProviderId as GUID
	dwCatalogEntryId as DWORD
	ProtocolChain as WSAPROTOCOLCHAIN
	iVersion as long
	iAddressFamily as long
	iMaxSockAddr as long
	iMinSockAddr as long
	iSocketType as long
	iProtocol as long
	iProtocolMaxOffset as long
	iNetworkByteOrder as long
	iSecurityScheme as long
	dwMessageSize as DWORD
	dwProviderReserved as DWORD
	szProtocol(0 to (255 + 1) - 1) as CHAR
end type

type WSAPROTOCOL_INFOA as _WSAPROTOCOL_INFOA
type LPWSAPROTOCOL_INFOA as _WSAPROTOCOL_INFOA ptr

type _WSAPROTOCOL_INFOW
	dwServiceFlags1 as DWORD
	dwServiceFlags2 as DWORD
	dwServiceFlags3 as DWORD
	dwServiceFlags4 as DWORD
	dwProviderFlags as DWORD
	ProviderId as GUID
	dwCatalogEntryId as DWORD
	ProtocolChain as WSAPROTOCOLCHAIN
	iVersion as long
	iAddressFamily as long
	iMaxSockAddr as long
	iMinSockAddr as long
	iSocketType as long
	iProtocol as long
	iProtocolMaxOffset as long
	iNetworkByteOrder as long
	iSecurityScheme as long
	dwMessageSize as DWORD
	dwProviderReserved as DWORD
	szProtocol(0 to (255 + 1) - 1) as WCHAR
end type

type WSAPROTOCOL_INFOW as _WSAPROTOCOL_INFOW
type LPWSAPROTOCOL_INFOW as _WSAPROTOCOL_INFOW ptr

#ifdef UNICODE
	type WSAPROTOCOL_INFO as WSAPROTOCOL_INFOW
	type LPWSAPROTOCOL_INFO as LPWSAPROTOCOL_INFOW
#else
	type WSAPROTOCOL_INFO as WSAPROTOCOL_INFOA
	type LPWSAPROTOCOL_INFO as LPWSAPROTOCOL_INFOA
#endif

#define PFL_MULTIPLE_PROTO_ENTRIES &h00000001
#define PFL_RECOMMENDED_PROTO_ENTRY &h00000002
#define PFL_HIDDEN &h00000004
#define PFL_MATCHES_PROTOCOL_ZERO &h00000008
#define XP1_CONNECTIONLESS &h00000001
#define XP1_GUARANTEED_DELIVERY &h00000002
#define XP1_GUARANTEED_ORDER &h00000004
#define XP1_MESSAGE_ORIENTED &h00000008
#define XP1_PSEUDO_STREAM &h00000010
#define XP1_GRACEFUL_CLOSE &h00000020
#define XP1_EXPEDITED_DATA &h00000040
#define XP1_CONNECT_DATA &h00000080
#define XP1_DISCONNECT_DATA &h00000100
#define XP1_SUPPORT_BROADCAST &h00000200
#define XP1_SUPPORT_MULTIPOINT &h00000400
#define XP1_MULTIPOINT_CONTROL_PLANE &h00000800
#define XP1_MULTIPOINT_DATA_PLANE &h00001000
#define XP1_QOS_SUPPORTED &h00002000
#define XP1_INTERRUPT &h00004000
#define XP1_UNI_SEND &h00008000
#define XP1_UNI_RECV &h00010000
#define XP1_IFS_HANDLES &h00020000
#define XP1_PARTIAL_MESSAGE &h00040000
#define BIGENDIAN &h0000
#define LITTLEENDIAN &h0001
#define SECURITY_PROTOCOL_NONE &h0000
#define JL_SENDER_ONLY &h01
#define JL_RECEIVER_ONLY &h02
#define JL_BOTH &h04
#define WSA_FLAG_OVERLAPPED &h01
#define WSA_FLAG_MULTIPOINT_C_ROOT &h02
#define WSA_FLAG_MULTIPOINT_C_LEAF &h04
#define WSA_FLAG_MULTIPOINT_D_ROOT &h08
#define WSA_FLAG_MULTIPOINT_D_LEAF &h10
#define IOC_UNIX &h00000000
#define IOC_WS2 &h08000000
#define IOC_PROTOCOL &h10000000
#define IOC_VENDOR &h18000000
#define _WSAIO(x, y) ((IOC_VOID or (x)) or (y))
#define _WSAIOR(x, y) ((IOC_OUT or (x)) or (y))
#define _WSAIOW(x, y) ((IOC_IN or (x)) or (y))
#define _WSAIORW(x, y) ((IOC_INOUT or (x)) or (y))
#define SIO_ASSOCIATE_HANDLE _WSAIOW(IOC_WS2, 1)
#define SIO_ENABLE_CIRCULAR_QUEUEING _WSAIO(IOC_WS2, 2)
#define SIO_FIND_ROUTE _WSAIOR(IOC_WS2, 3)
#define SIO_FLUSH _WSAIO(IOC_WS2, 4)
#define SIO_GET_BROADCAST_ADDRESS _WSAIOR(IOC_WS2, 5)
#define SIO_GET_EXTENSION_FUNCTION_POINTER _WSAIORW(IOC_WS2, 6)
#define SIO_GET_QOS _WSAIORW(IOC_WS2, 7)
#define SIO_GET_GROUP_QOS _WSAIORW(IOC_WS2, 8)
#define SIO_MULTIPOINT_LOOPBACK _WSAIOW(IOC_WS2, 9)
#define SIO_MULTICAST_SCOPE _WSAIOW(IOC_WS2, 10)
#define SIO_SET_QOS _WSAIOW(IOC_WS2, 11)
#define SIO_SET_GROUP_QOS _WSAIOW(IOC_WS2, 12)
#define SIO_TRANSLATE_HANDLE _WSAIORW(IOC_WS2, 13)
#define SIO_ROUTING_INTERFACE_QUERY _WSAIORW(IOC_WS2, 20)
#define SIO_ROUTING_INTERFACE_CHANGE _WSAIOW(IOC_WS2, 21)
#define SIO_ADDRESS_LIST_QUERY _WSAIOR(IOC_WS2, 22)
#define SIO_ADDRESS_LIST_CHANGE _WSAIO(IOC_WS2, 23)
#define SIO_QUERY_TARGET_PNP_HANDLE _WSAIOR(IOC_WS2, 24)
#define SIO_ADDRESS_LIST_SORT _WSAIORW(IOC_WS2, 25)

type LPCONDITIONPROC as function(byval lpCallerId as LPWSABUF, byval lpCallerData as LPWSABUF, byval lpSQOS as LPQOS, byval lpGQOS as LPQOS, byval lpCalleeId as LPWSABUF, byval lpCalleeData as LPWSABUF, byval g as GROUP ptr, byval dwCallbackData as DWORD_PTR) as long
type LPWSAOVERLAPPED_COMPLETION_ROUTINE as sub(byval dwError as DWORD, byval cbTransferred as DWORD, byval lpOverlapped as LPWSAOVERLAPPED, byval dwFlags as DWORD)

#define SIO_NSP_NOTIFY_CHANGE _WSAIOW(IOC_WS2, 25)

type _WSACOMPLETIONTYPE as long
enum
	NSP_NOTIFY_IMMEDIATELY = 0
	NSP_NOTIFY_HWND
	NSP_NOTIFY_EVENT
	NSP_NOTIFY_PORT
	NSP_NOTIFY_APC
end enum

type WSACOMPLETIONTYPE as _WSACOMPLETIONTYPE
type PWSACOMPLETIONTYPE as _WSACOMPLETIONTYPE ptr
type LPWSACOMPLETIONTYPE as _WSACOMPLETIONTYPE ptr

type ___WSACOMPLETION_WindowMessage
	hWnd as HWND
	uMsg as UINT
	context as WPARAM
end type

type ___WSACOMPLETION_Event
	lpOverlapped as LPWSAOVERLAPPED
end type

type ___WSACOMPLETION_Apc
	lpOverlapped as LPWSAOVERLAPPED
	lpfnCompletionProc as LPWSAOVERLAPPED_COMPLETION_ROUTINE
end type

type ___WSACOMPLETION_Port
	lpOverlapped as LPWSAOVERLAPPED
	hPort as HANDLE
	Key as ULONG_PTR
end type

union ___WSACOMPLETION_Parameters
	WindowMessage as ___WSACOMPLETION_WindowMessage
	Event as ___WSACOMPLETION_Event
	Apc as ___WSACOMPLETION_Apc
	Port as ___WSACOMPLETION_Port
end union

type _WSACOMPLETION
	as WSACOMPLETIONTYPE Type
	Parameters as ___WSACOMPLETION_Parameters
end type

type WSACOMPLETION as _WSACOMPLETION
type PWSACOMPLETION as _WSACOMPLETION ptr
type LPWSACOMPLETION as _WSACOMPLETION ptr

#define TH_NETDEV &h00000001
#define TH_TAPI &h00000002

type SOCKADDR_STORAGE_ as sockaddr_storage
type PSOCKADDR_STORAGE as sockaddr_storage ptr
type LPSOCKADDR_STORAGE as sockaddr_storage ptr
type ADDRESS_FAMILY as u_short

#define SERVICE_MULTIPLE &h00000001
#define NS_ALL 0
#define NS_SAP 1
#define NS_NDS 2
#define NS_PEER_BROWSE 3
#define NS_SLP 5
#define NS_DHCP 6
#define NS_TCPIP_LOCAL 10
#define NS_TCPIP_HOSTS 11
#define NS_DNS 12
#define NS_NETBT 13
#define NS_WINS 14
#define NS_NLA 15
#define NS_NBP 20
#define NS_MS 30
#define NS_STDA 31
#define NS_NTDS 32
#define NS_X500 40
#define NS_NIS 41
#define NS_NISPLUS 42
#define NS_WRQ 50
#define NS_NETDES 60
#define RES_UNUSED_1 &h00000001
#define RES_FLUSH_CACHE &h00000002
#define RES_SERVICE &h00000004
#define SERVICE_TYPE_VALUE_IPXPORTA "IpxSocket"
#define SERVICE_TYPE_VALUE_IPXPORTW wstr("IpxSocket")
#define SERVICE_TYPE_VALUE_SAPIDA "SapId"
#define SERVICE_TYPE_VALUE_SAPIDW wstr("SapId")
#define SERVICE_TYPE_VALUE_TCPPORTA "TcpPort"
#define SERVICE_TYPE_VALUE_TCPPORTW wstr("TcpPort")
#define SERVICE_TYPE_VALUE_UDPPORTA "UdpPort"
#define SERVICE_TYPE_VALUE_UDPPORTW wstr("UdpPort")
#define SERVICE_TYPE_VALUE_OBJECTIDA "ObjectId"
#define SERVICE_TYPE_VALUE_OBJECTIDW wstr("ObjectId")
#define SERVICE_TYPE_VALUE_SAPID __MINGW_NAME_AW(SERVICE_TYPE_VALUE_SAPID)
#define SERVICE_TYPE_VALUE_TCPPORT __MINGW_NAME_AW(SERVICE_TYPE_VALUE_TCPPORT)
#define SERVICE_TYPE_VALUE_UDPPORT __MINGW_NAME_AW(SERVICE_TYPE_VALUE_UDPPORT)
#define SERVICE_TYPE_VALUE_OBJECTID __MINGW_NAME_AW(SERVICE_TYPE_VALUE_OBJECTID)
#define __CSADDR_DEFINED__

type _SOCKET_ADDRESS
	lpSockaddr as LPSOCKADDR
	iSockaddrLength as INT_
end type

type SOCKET_ADDRESS as _SOCKET_ADDRESS
type PSOCKET_ADDRESS as _SOCKET_ADDRESS ptr
type LPSOCKET_ADDRESS as _SOCKET_ADDRESS ptr

type _CSADDR_INFO
	LocalAddr as SOCKET_ADDRESS
	RemoteAddr as SOCKET_ADDRESS
	iSocketType as INT_
	iProtocol as INT_
end type

type CSADDR_INFO as _CSADDR_INFO
type PCSADDR_INFO as _CSADDR_INFO ptr
type LPCSADDR_INFO as _CSADDR_INFO ptr

type _SOCKET_ADDRESS_LIST
	iAddressCount as INT_
	Address(0 to 0) as SOCKET_ADDRESS
end type

type SOCKET_ADDRESS_LIST as _SOCKET_ADDRESS_LIST
type PSOCKET_ADDRESS_LIST as _SOCKET_ADDRESS_LIST ptr
type LPSOCKET_ADDRESS_LIST as _SOCKET_ADDRESS_LIST ptr

type _AFPROTOCOLS
	iAddressFamily as INT_
	iProtocol as INT_
end type

type AFPROTOCOLS as _AFPROTOCOLS
type PAFPROTOCOLS as _AFPROTOCOLS ptr
type LPAFPROTOCOLS as _AFPROTOCOLS ptr

type _WSAEcomparator as long
enum
	COMP_EQUAL = 0
	COMP_NOTLESS
end enum

type WSAECOMPARATOR as _WSAEcomparator
type PWSAECOMPARATOR as _WSAEcomparator ptr
type LPWSAECOMPARATOR as _WSAEcomparator ptr

type _WSAVersion
	dwVersion as DWORD
	ecHow as WSAECOMPARATOR
end type

type WSAVERSION as _WSAVersion
type PWSAVERSION as _WSAVersion ptr
type LPWSAVERSION as _WSAVersion ptr

type _WSAQuerySetA
	dwSize as DWORD
	lpszServiceInstanceName as LPSTR
	lpServiceClassId as LPGUID
	lpVersion as LPWSAVERSION
	lpszComment as LPSTR
	dwNameSpace as DWORD
	lpNSProviderId as LPGUID
	lpszContext as LPSTR
	dwNumberOfProtocols as DWORD
	lpafpProtocols as LPAFPROTOCOLS
	lpszQueryString as LPSTR
	dwNumberOfCsAddrs as DWORD
	lpcsaBuffer as LPCSADDR_INFO
	dwOutputFlags as DWORD
	lpBlob as LPBLOB
end type

type WSAQUERYSETA as _WSAQuerySetA
type PWSAQUERYSETA as _WSAQuerySetA ptr
type LPWSAQUERYSETA as _WSAQuerySetA ptr

type _WSAQuerySetW
	dwSize as DWORD
	lpszServiceInstanceName as LPWSTR
	lpServiceClassId as LPGUID
	lpVersion as LPWSAVERSION
	lpszComment as LPWSTR
	dwNameSpace as DWORD
	lpNSProviderId as LPGUID
	lpszContext as LPWSTR
	dwNumberOfProtocols as DWORD
	lpafpProtocols as LPAFPROTOCOLS
	lpszQueryString as LPWSTR
	dwNumberOfCsAddrs as DWORD
	lpcsaBuffer as LPCSADDR_INFO
	dwOutputFlags as DWORD
	lpBlob as LPBLOB
end type

type WSAQUERYSETW as _WSAQuerySetW
type PWSAQUERYSETW as _WSAQuerySetW ptr
type LPWSAQUERYSETW as _WSAQuerySetW ptr

#ifdef UNICODE
	type WSAQUERYSET as WSAQUERYSETW
	type PWSAQUERYSET as PWSAQUERYSETW
	type LPWSAQUERYSET as LPWSAQUERYSETW
#else
	type WSAQUERYSET as WSAQUERYSETA
	type PWSAQUERYSET as PWSAQUERYSETA
	type LPWSAQUERYSET as LPWSAQUERYSETA
#endif

#define LUP_DEEP &h0001
#define LUP_CONTAINERS &h0002
#define LUP_NOCONTAINERS &h0004
#define LUP_NEAREST &h0008
#define LUP_RETURN_NAME &h0010
#define LUP_RETURN_TYPE &h0020
#define LUP_RETURN_VERSION &h0040
#define LUP_RETURN_COMMENT &h0080
#define LUP_RETURN_ADDR &h0100
#define LUP_RETURN_BLOB &h0200
#define LUP_RETURN_ALIASES &h0400
#define LUP_RETURN_QUERY_STRING &h0800
#define LUP_RETURN_ALL &h0FF0
#define LUP_RES_SERVICE &h8000
#define LUP_FLUSHCACHE &h1000
#define LUP_FLUSHPREVIOUS &h2000
#define LUP_NON_AUTHORITATIVE &h4000
#define LUP_SECURE &h8000
#define LUP_RETURN_PREFERRED_NAMES &h10000
#define LUP_ADDRCONFIG &h100000
#define LUP_DUAL_ADDR &h200000
#define LUP_FILESERVER &h400000
#define LUP_RES_RESERVICE &h8000
#define RESULT_IS_ALIAS &h0001
#define RESULT_IS_ADDED &h0010
#define RESULT_IS_CHANGED &h0020
#define RESULT_IS_DELETED &h0040

type _WSAESETSERVICEOP as long
enum
	RNRSERVICE_REGISTER = 0
	RNRSERVICE_DEREGISTER
	RNRSERVICE_DELETE
end enum

type WSAESETSERVICEOP as _WSAESETSERVICEOP
type PWSAESETSERVICEOP as _WSAESETSERVICEOP ptr
type LPWSAESETSERVICEOP as _WSAESETSERVICEOP ptr

type _WSANSClassInfoA
	lpszName as LPSTR
	dwNameSpace as DWORD
	dwValueType as DWORD
	dwValueSize as DWORD
	lpValue as LPVOID
end type

type WSANSCLASSINFOA as _WSANSClassInfoA
type PWSANSCLASSINFOA as _WSANSClassInfoA ptr
type LPWSANSCLASSINFOA as _WSANSClassInfoA ptr

type _WSANSClassInfoW
	lpszName as LPWSTR
	dwNameSpace as DWORD
	dwValueType as DWORD
	dwValueSize as DWORD
	lpValue as LPVOID
end type

type WSANSCLASSINFOW as _WSANSClassInfoW
type PWSANSCLASSINFOW as _WSANSClassInfoW ptr
type LPWSANSCLASSINFOW as _WSANSClassInfoW ptr

#ifdef UNICODE
	type WSANSCLASSINFO as WSANSCLASSINFOW
	type PWSANSCLASSINFO as PWSANSCLASSINFOW
	type LPWSANSCLASSINFO as LPWSANSCLASSINFOW
#else
	type WSANSCLASSINFO as WSANSCLASSINFOA
	type PWSANSCLASSINFO as PWSANSCLASSINFOA
	type LPWSANSCLASSINFO as LPWSANSCLASSINFOA
#endif

type _WSAServiceClassInfoA
	lpServiceClassId as LPGUID
	lpszServiceClassName as LPSTR
	dwCount as DWORD
	lpClassInfos as LPWSANSCLASSINFOA
end type

type WSASERVICECLASSINFOA as _WSAServiceClassInfoA
type PWSASERVICECLASSINFOA as _WSAServiceClassInfoA ptr
type LPWSASERVICECLASSINFOA as _WSAServiceClassInfoA ptr

type _WSAServiceClassInfoW
	lpServiceClassId as LPGUID
	lpszServiceClassName as LPWSTR
	dwCount as DWORD
	lpClassInfos as LPWSANSCLASSINFOW
end type

type WSASERVICECLASSINFOW as _WSAServiceClassInfoW
type PWSASERVICECLASSINFOW as _WSAServiceClassInfoW ptr
type LPWSASERVICECLASSINFOW as _WSAServiceClassInfoW ptr

#ifdef UNICODE
	type WSASERVICECLASSINFO as WSASERVICECLASSINFOW
	type PWSASERVICECLASSINFO as PWSASERVICECLASSINFOW
	type LPWSASERVICECLASSINFO as LPWSASERVICECLASSINFOW
#else
	type WSASERVICECLASSINFO as WSASERVICECLASSINFOA
	type PWSASERVICECLASSINFO as PWSASERVICECLASSINFOA
	type LPWSASERVICECLASSINFO as LPWSASERVICECLASSINFOA
#endif

type _WSANAMESPACE_INFOA
	NSProviderId as GUID
	dwNameSpace as DWORD
	fActive as WINBOOL
	dwVersion as DWORD
	lpszIdentifier as LPSTR
end type

type WSANAMESPACE_INFOA as _WSANAMESPACE_INFOA
type PWSANAMESPACE_INFOA as _WSANAMESPACE_INFOA ptr
type LPWSANAMESPACE_INFOA as _WSANAMESPACE_INFOA ptr

type _WSANAMESPACE_INFOW
	NSProviderId as GUID
	dwNameSpace as DWORD
	fActive as WINBOOL
	dwVersion as DWORD
	lpszIdentifier as LPWSTR
end type

type WSANAMESPACE_INFOW as _WSANAMESPACE_INFOW
type PWSANAMESPACE_INFOW as _WSANAMESPACE_INFOW ptr
type LPWSANAMESPACE_INFOW as _WSANAMESPACE_INFOW ptr

#ifdef UNICODE
	type WSANAMESPACE_INFO as WSANAMESPACE_INFOW
	type PWSANAMESPACE_INFO as PWSANAMESPACE_INFOW
	type LPWSANAMESPACE_INFO as LPWSANAMESPACE_INFOW
#else
	type WSANAMESPACE_INFO as WSANAMESPACE_INFOA
	type PWSANAMESPACE_INFO as PWSANAMESPACE_INFOA
	type LPWSANAMESPACE_INFO as LPWSANAMESPACE_INFOA
#endif

type _WSAMSG
	name as LPSOCKADDR
	namelen as INT_
	lpBuffers as LPWSABUF
	dwBufferCount as DWORD
	Control as WSABUF
	dwFlags as DWORD
end type

type WSAMSG as _WSAMSG
type PWSAMSG as _WSAMSG ptr
type LPWSAMSG as _WSAMSG ptr

#define WSADuplicateSocket __MINGW_NAME_AW(WSADuplicateSocket)
#define WSAEnumProtocols __MINGW_NAME_AW(WSAEnumProtocols)
#define WSAAddressToString __MINGW_NAME_AW(WSAAddressToString)
#define WSASocket __MINGW_NAME_AW(WSASocket)
#define WSAStringToAddress __MINGW_NAME_AW(WSAStringToAddress)
#define WSALookupServiceBegin __MINGW_NAME_AW(WSALookupServiceBegin)
#define WSALookupServiceNext __MINGW_NAME_AW(WSALookupServiceNext)
#define WSAInstallServiceClass __MINGW_NAME_AW(WSAInstallServiceClass)
#define WSAGetServiceClassInfo __MINGW_NAME_AW(WSAGetServiceClassInfo)
#define WSAEnumNameSpaceProviders __MINGW_NAME_AW(WSAEnumNameSpaceProviders)
#define WSAGetServiceClassNameByClassId __MINGW_NAME_AW(WSAGetServiceClassNameByClassId)
#define WSASetService __MINGW_NAME_AW(WSASetService)

declare function accept(byval s as SOCKET, byval addr as sockaddr ptr, byval addrlen as long ptr) as SOCKET
declare function bind(byval s as SOCKET, byval name_ as const sockaddr ptr, byval namelen as long) as long
declare function closesocket(byval s as SOCKET) as long
declare function connect(byval s as SOCKET, byval name_ as const sockaddr ptr, byval namelen as long) as long
declare function ioctlsocket(byval s as SOCKET, byval cmd as clong, byval argp as u_long ptr) as long
declare function getpeername(byval s as SOCKET, byval name_ as sockaddr ptr, byval namelen as long ptr) as long
declare function getsockname(byval s as SOCKET, byval name_ as sockaddr ptr, byval namelen as long ptr) as long
declare function getsockopt(byval s as SOCKET, byval level as long, byval optname as long, byval optval as zstring ptr, byval optlen as long ptr) as long
declare function htonl(byval hostlong as u_long) as u_long
declare function htons(byval hostshort as u_short) as u_short
declare function inet_addr(byval cp as const zstring ptr) as culong
declare function inet_ntoa(byval in_ as in_addr) as zstring ptr
declare function listen(byval s as SOCKET, byval backlog as long) as long
declare function ntohl(byval netlong as u_long) as u_long
declare function ntohs(byval netshort as u_short) as u_short
declare function recv(byval s as SOCKET, byval buf as zstring ptr, byval len_ as long, byval flags as long) as long
declare function recvfrom(byval s as SOCKET, byval buf as zstring ptr, byval len_ as long, byval flags as long, byval from as sockaddr ptr, byval fromlen as long ptr) as long
declare function select_ alias "select"(byval nfds as long, byval readfds as fd_set ptr, byval writefds as fd_set ptr, byval exceptfds as fd_set ptr, byval timeout as const PTIMEVAL) as long
declare function send(byval s as SOCKET, byval buf as const zstring ptr, byval len_ as long, byval flags as long) as long
declare function sendto(byval s as SOCKET, byval buf as const zstring ptr, byval len_ as long, byval flags as long, byval to_ as const sockaddr ptr, byval tolen as long) as long
declare function setsockopt(byval s as SOCKET, byval level as long, byval optname as long, byval optval as const zstring ptr, byval optlen as long) as long
declare function shutdown(byval s as SOCKET, byval how as long) as long
declare function socket(byval af as long, byval type_ as long, byval protocol as long) as SOCKET
declare function gethostbyaddr(byval addr as const zstring ptr, byval len_ as long, byval type_ as long) as hostent ptr
declare function gethostbyname(byval name_ as const zstring ptr) as hostent ptr
declare function gethostname(byval name_ as zstring ptr, byval namelen as long) as long
declare function getservbyport(byval port as long, byval proto as const zstring ptr) as servent ptr
declare function getservbyname(byval name_ as const zstring ptr, byval proto as const zstring ptr) as servent ptr
declare function getprotobynumber(byval number as long) as protoent ptr
declare function getprotobyname(byval name_ as const zstring ptr) as protoent ptr
declare function WSAStartup(byval wVersionRequested as WORD, byval lpWSAData as LPWSADATA) as long
declare function WSACleanup() as long
declare sub WSASetLastError(byval iError as long)
declare function WSAGetLastError() as long
declare function WSAIsBlocking() as WINBOOL
declare function WSAUnhookBlockingHook() as long
declare function WSASetBlockingHook(byval lpBlockFunc as FARPROC) as FARPROC
declare function WSACancelBlockingCall() as long
declare function WSAAsyncGetServByName(byval hWnd as HWND, byval wMsg as u_int, byval name_ as const zstring ptr, byval proto as const zstring ptr, byval buf as zstring ptr, byval buflen as long) as HANDLE
declare function WSAAsyncGetServByPort(byval hWnd as HWND, byval wMsg as u_int, byval port as long, byval proto as const zstring ptr, byval buf as zstring ptr, byval buflen as long) as HANDLE
declare function WSAAsyncGetProtoByName(byval hWnd as HWND, byval wMsg as u_int, byval name_ as const zstring ptr, byval buf as zstring ptr, byval buflen as long) as HANDLE
declare function WSAAsyncGetProtoByNumber(byval hWnd as HWND, byval wMsg as u_int, byval number as long, byval buf as zstring ptr, byval buflen as long) as HANDLE
declare function WSAAsyncGetHostByName(byval hWnd as HWND, byval wMsg as u_int, byval name_ as const zstring ptr, byval buf as zstring ptr, byval buflen as long) as HANDLE
declare function WSAAsyncGetHostByAddr(byval hWnd as HWND, byval wMsg as u_int, byval addr as const zstring ptr, byval len_ as long, byval type_ as long, byval buf as zstring ptr, byval buflen as long) as HANDLE
declare function WSACancelAsyncRequest(byval hAsyncTaskHandle as HANDLE) as long
declare function WSAAsyncSelect(byval s as SOCKET, byval hWnd as HWND, byval wMsg as u_int, byval lEvent as clong) as long
declare function WSAAccept(byval s as SOCKET, byval addr as sockaddr ptr, byval addrlen as LPINT, byval lpfnCondition as LPCONDITIONPROC, byval dwCallbackData as DWORD_PTR) as SOCKET
declare function WSACloseEvent(byval hEvent as HANDLE) as WINBOOL
declare function WSAConnect(byval s as SOCKET, byval name_ as const sockaddr ptr, byval namelen as long, byval lpCallerData as LPWSABUF, byval lpCalleeData as LPWSABUF, byval lpSQOS as LPQOS, byval lpGQOS as LPQOS) as long
declare function WSACreateEvent() as HANDLE
declare function WSADuplicateSocketA(byval s as SOCKET, byval dwProcessId as DWORD, byval lpProtocolInfo as LPWSAPROTOCOL_INFOA) as long
declare function WSADuplicateSocketW(byval s as SOCKET, byval dwProcessId as DWORD, byval lpProtocolInfo as LPWSAPROTOCOL_INFOW) as long
declare function WSAEnumNetworkEvents(byval s as SOCKET, byval hEventObject as HANDLE, byval lpNetworkEvents as LPWSANETWORKEVENTS) as long
declare function WSAEnumProtocolsA(byval lpiProtocols as LPINT, byval lpProtocolBuffer as LPWSAPROTOCOL_INFOA, byval lpdwBufferLength as LPDWORD) as long
declare function WSAEnumProtocolsW(byval lpiProtocols as LPINT, byval lpProtocolBuffer as LPWSAPROTOCOL_INFOW, byval lpdwBufferLength as LPDWORD) as long
declare function WSAEventSelect(byval s as SOCKET, byval hEventObject as HANDLE, byval lNetworkEvents as clong) as long
declare function WSAGetOverlappedResult(byval s as SOCKET, byval lpOverlapped as LPWSAOVERLAPPED, byval lpcbTransfer as LPDWORD, byval fWait as WINBOOL, byval lpdwFlags as LPDWORD) as WINBOOL
declare function WSAGetQOSByName(byval s as SOCKET, byval lpQOSName as LPWSABUF, byval lpQOS as LPQOS) as WINBOOL
declare function WSAHtonl(byval s as SOCKET, byval hostlong as u_long, byval lpnetlong as u_long ptr) as long
declare function WSAHtons(byval s as SOCKET, byval hostshort as u_short, byval lpnetshort as u_short ptr) as long
declare function WSAIoctl(byval s as SOCKET, byval dwIoControlCode as DWORD, byval lpvInBuffer as LPVOID, byval cbInBuffer as DWORD, byval lpvOutBuffer as LPVOID, byval cbOutBuffer as DWORD, byval lpcbBytesReturned as LPDWORD, byval lpOverlapped as LPWSAOVERLAPPED, byval lpCompletionRoutine as LPWSAOVERLAPPED_COMPLETION_ROUTINE) as long
declare function WSAJoinLeaf(byval s as SOCKET, byval name_ as const sockaddr ptr, byval namelen as long, byval lpCallerData as LPWSABUF, byval lpCalleeData as LPWSABUF, byval lpSQOS as LPQOS, byval lpGQOS as LPQOS, byval dwFlags as DWORD) as SOCKET
declare function WSANtohl(byval s as SOCKET, byval netlong as u_long, byval lphostlong as u_long ptr) as long
declare function WSANtohs(byval s as SOCKET, byval netshort as u_short, byval lphostshort as u_short ptr) as long
declare function WSARecv(byval s as SOCKET, byval lpBuffers as LPWSABUF, byval dwBufferCount as DWORD, byval lpNumberOfBytesRecvd as LPDWORD, byval lpFlags as LPDWORD, byval lpOverlapped as LPWSAOVERLAPPED, byval lpCompletionRoutine as LPWSAOVERLAPPED_COMPLETION_ROUTINE) as long
declare function WSARecvDisconnect(byval s as SOCKET, byval lpInboundDisconnectData as LPWSABUF) as long
declare function WSARecvFrom(byval s as SOCKET, byval lpBuffers as LPWSABUF, byval dwBufferCount as DWORD, byval lpNumberOfBytesRecvd as LPDWORD, byval lpFlags as LPDWORD, byval lpFrom as sockaddr ptr, byval lpFromlen as LPINT, byval lpOverlapped as LPWSAOVERLAPPED, byval lpCompletionRoutine as LPWSAOVERLAPPED_COMPLETION_ROUTINE) as long
declare function WSAResetEvent(byval hEvent as HANDLE) as WINBOOL
declare function WSASend(byval s as SOCKET, byval lpBuffers as LPWSABUF, byval dwBufferCount as DWORD, byval lpNumberOfBytesSent as LPDWORD, byval dwFlags as DWORD, byval lpOverlapped as LPWSAOVERLAPPED, byval lpCompletionRoutine as LPWSAOVERLAPPED_COMPLETION_ROUTINE) as long
declare function WSASendDisconnect(byval s as SOCKET, byval lpOutboundDisconnectData as LPWSABUF) as long
declare function WSASendTo(byval s as SOCKET, byval lpBuffers as LPWSABUF, byval dwBufferCount as DWORD, byval lpNumberOfBytesSent as LPDWORD, byval dwFlags as DWORD, byval lpTo as const sockaddr ptr, byval iTolen as long, byval lpOverlapped as LPWSAOVERLAPPED, byval lpCompletionRoutine as LPWSAOVERLAPPED_COMPLETION_ROUTINE) as long
declare function WSASetEvent(byval hEvent as HANDLE) as WINBOOL
declare function WSASocketA(byval af as long, byval type_ as long, byval protocol as long, byval lpProtocolInfo as LPWSAPROTOCOL_INFOA, byval g as GROUP, byval dwFlags as DWORD) as SOCKET
declare function WSASocketW(byval af as long, byval type_ as long, byval protocol as long, byval lpProtocolInfo as LPWSAPROTOCOL_INFOW, byval g as GROUP, byval dwFlags as DWORD) as SOCKET
declare function WSAWaitForMultipleEvents(byval cEvents as DWORD, byval lphEvents as const HANDLE ptr, byval fWaitAll as WINBOOL, byval dwTimeout as DWORD, byval fAlertable as WINBOOL) as DWORD
declare function WSAAddressToStringA(byval lpsaAddress as LPSOCKADDR, byval dwAddressLength as DWORD, byval lpProtocolInfo as LPWSAPROTOCOL_INFOA, byval lpszAddressString as LPSTR, byval lpdwAddressStringLength as LPDWORD) as INT_
declare function WSAAddressToStringW(byval lpsaAddress as LPSOCKADDR, byval dwAddressLength as DWORD, byval lpProtocolInfo as LPWSAPROTOCOL_INFOW, byval lpszAddressString as LPWSTR, byval lpdwAddressStringLength as LPDWORD) as INT_
declare function WSAStringToAddressA(byval AddressString as LPSTR, byval AddressFamily as INT_, byval lpProtocolInfo as LPWSAPROTOCOL_INFOA, byval lpAddress as LPSOCKADDR, byval lpAddressLength as LPINT) as INT_
declare function WSAStringToAddressW(byval AddressString as LPWSTR, byval AddressFamily as INT_, byval lpProtocolInfo as LPWSAPROTOCOL_INFOW, byval lpAddress as LPSOCKADDR, byval lpAddressLength as LPINT) as INT_
declare function WSALookupServiceBeginA(byval lpqsRestrictions as LPWSAQUERYSETA, byval dwControlFlags as DWORD, byval lphLookup as LPHANDLE) as INT_
declare function WSALookupServiceBeginW(byval lpqsRestrictions as LPWSAQUERYSETW, byval dwControlFlags as DWORD, byval lphLookup as LPHANDLE) as INT_
declare function WSALookupServiceNextA(byval hLookup as HANDLE, byval dwControlFlags as DWORD, byval lpdwBufferLength as LPDWORD, byval lpqsResults as LPWSAQUERYSETA) as INT_
declare function WSALookupServiceNextW(byval hLookup as HANDLE, byval dwControlFlags as DWORD, byval lpdwBufferLength as LPDWORD, byval lpqsResults as LPWSAQUERYSETW) as INT_
declare function WSANSPIoctl(byval hLookup as HANDLE, byval dwControlCode as DWORD, byval lpvInBuffer as LPVOID, byval cbInBuffer as DWORD, byval lpvOutBuffer as LPVOID, byval cbOutBuffer as DWORD, byval lpcbBytesReturned as LPDWORD, byval lpCompletion as LPWSACOMPLETION) as INT_
declare function WSALookupServiceEnd(byval hLookup as HANDLE) as INT_
declare function WSAInstallServiceClassA(byval lpServiceClassInfo as LPWSASERVICECLASSINFOA) as INT_
declare function WSAInstallServiceClassW(byval lpServiceClassInfo as LPWSASERVICECLASSINFOW) as INT_
declare function WSARemoveServiceClass(byval lpServiceClassId as LPGUID) as INT_
declare function WSAGetServiceClassInfoA(byval lpProviderId as LPGUID, byval lpServiceClassId as LPGUID, byval lpdwBufSize as LPDWORD, byval lpServiceClassInfo as LPWSASERVICECLASSINFOA) as INT_
declare function WSAGetServiceClassInfoW(byval lpProviderId as LPGUID, byval lpServiceClassId as LPGUID, byval lpdwBufSize as LPDWORD, byval lpServiceClassInfo as LPWSASERVICECLASSINFOW) as INT_
declare function WSAEnumNameSpaceProvidersA(byval lpdwBufferLength as LPDWORD, byval lpnspBuffer as LPWSANAMESPACE_INFOA) as INT_
declare function WSAEnumNameSpaceProvidersW(byval lpdwBufferLength as LPDWORD, byval lpnspBuffer as LPWSANAMESPACE_INFOW) as INT_
declare function WSAGetServiceClassNameByClassIdA(byval lpServiceClassId as LPGUID, byval lpszServiceClassName as LPSTR, byval lpdwBufferLength as LPDWORD) as INT_
declare function WSAGetServiceClassNameByClassIdW(byval lpServiceClassId as LPGUID, byval lpszServiceClassName as LPWSTR, byval lpdwBufferLength as LPDWORD) as INT_
declare function WSASetServiceA(byval lpqsRegInfo as LPWSAQUERYSETA, byval essoperation as WSAESETSERVICEOP, byval dwControlFlags as DWORD) as INT_
declare function WSASetServiceW(byval lpqsRegInfo as LPWSAQUERYSETW, byval essoperation as WSAESETSERVICEOP, byval dwControlFlags as DWORD) as INT_
declare function WSAProviderConfigChange(byval lpNotificationHandle as LPHANDLE, byval lpOverlapped as LPWSAOVERLAPPED, byval lpCompletionRoutine as LPWSAOVERLAPPED_COMPLETION_ROUTINE) as INT_

#define WSAMAKEASYNCREPLY(buflen, error) MAKELONG(buflen, error)
#define WSAMAKESELECTREPLY(event, error) MAKELONG(event, error)
#define WSAGETASYNCBUFLEN(lParam) LOWORD_(lParam)
#define WSAGETASYNCERROR(lParam) HIWORD_(lParam)
#define WSAGETSELECTEVENT(lParam) LOWORD_(lParam)
#define WSAGETSELECTERROR(lParam) HIWORD_(lParam)

end extern