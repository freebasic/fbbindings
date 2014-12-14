#pragma once

#include once "windows.bi"
#include once "_timeval.bi"
#include once "_bsd_types.bi"
#include once "inaddr.bi"
#include once "psdk_inc/_socket_types.bi"
#include once "psdk_inc/_fd_types.bi"
#include once "psdk_inc/_ip_types.bi"
#include once "psdk_inc/_ip_mreq1.bi"
#include once "psdk_inc/_wsadata.bi"
#include once "psdk_inc/_xmitfile.bi"
#include once "psdk_inc/_wsa_errnos.bi"

'' The following symbols have been renamed:
''     procedure select => select_

#ifdef __FB_64BIT__
	extern "C"
#else
	extern "Windows"
#endif

#define _WINSOCKAPI_
#define IOCPARM_MASK &h7f
#define IOC_VOID &h20000000
#define IOC_OUT &h40000000
#define IOC_IN &h80000000
#define IOC_INOUT (IOC_IN or IOC_OUT)
#define _IO(x, y) ((IOC_VOID or ((x) shl 8)) or (y))
#define _IOR(x, y, t) (((IOC_OUT or (cast(__LONG32, sizeof((t)) and IOCPARM_MASK) shl 16)) or ((x) shl 8)) or (y))
#define _IOW(x, y, t) (((IOC_IN or (cast(__LONG32, sizeof((t)) and IOCPARM_MASK) shl 16)) or ((x) shl 8)) or (y))
#define FIONREAD _IOR(asc("f"), 127, u_long)
#define FIONBIO _IOW(asc("f"), 126, u_long)
#define FIOASYNC _IOW(asc("f"), 125, u_long)
#define SIOCSHIWAT _IOW(asc("s"), 0, u_long)
#define SIOCGHIWAT _IOR(asc("s"), 1, u_long)
#define SIOCSLOWAT _IOW(asc("s"), 2, u_long)
#define SIOCGLOWAT _IOR(asc("s"), 3, u_long)
#define SIOCATMARK _IOR(asc("s"), 7, u_long)
#define IPPROTO_IP 0
#define IPPROTO_ICMP 1
#define IPPROTO_IGMP 2
#define IPPROTO_GGP 3
#define IPPROTO_TCP 6
#define IPPROTO_PUP 12
#define IPPROTO_UDP 17
#define IPPROTO_IDP 22
#define IPPROTO_ND 77
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
#define IN_CLASSA(i) (cast(__LONG32, (i) and &h80000000) = 0)
#define IN_CLASSA_NET &hff000000
#define IN_CLASSA_NSHIFT 24
#define IN_CLASSA_HOST &h00ffffff
#define IN_CLASSA_MAX 128
#define IN_CLASSB(i) (cast(__LONG32, (i) and &hc0000000) = &h80000000)
#define IN_CLASSB_NET &hffff0000
#define IN_CLASSB_NSHIFT 16
#define IN_CLASSB_HOST &h0000ffff
#define IN_CLASSB_MAX 65536
#define IN_CLASSC(i) (cast(__LONG32, (i) and &he0000000) = &hc0000000)
#define IN_CLASSC_NET &hffffff00
#define IN_CLASSC_NSHIFT 8
#define IN_CLASSC_HOST &h000000ff
#define INADDR_ANY cast(u_long, &h00000000)
#define INADDR_LOOPBACK &h7f000001
#define INADDR_BROADCAST cast(u_long, &hffffffff)
#define INADDR_NONE &hffffffff
#define IP_OPTIONS 1
#define IP_MULTICAST_IF 2
#define IP_MULTICAST_TTL 3
#define IP_MULTICAST_LOOP 4
#define IP_ADD_MEMBERSHIP 5
#define IP_DROP_MEMBERSHIP 6
#define IP_TTL 7
#define IP_TOS 8
#define IP_DONTFRAGMENT 9
#define IP_DEFAULT_MULTICAST_TTL 1
#define IP_DEFAULT_MULTICAST_LOOP 1
#define IP_MAX_MEMBERSHIPS 20
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
#define SO_DONTLINGER cast(u_int, not SO_LINGER)
#define SO_SNDBUF &h1001
#define SO_RCVBUF &h1002
#define SO_SNDLOWAT &h1003
#define SO_RCVLOWAT &h1004
#define SO_SNDTIMEO &h1005
#define SO_RCVTIMEO &h1006
#define SO_ERROR &h1007
#define SO_TYPE &h1008
#define SO_CONNDATA &h7000
#define SO_CONNOPT &h7001
#define SO_DISCDATA &h7002
#define SO_DISCOPT &h7003
#define SO_CONNDATALEN &h7004
#define SO_CONNOPTLEN &h7005
#define SO_DISCDATALEN &h7006
#define SO_DISCOPTLEN &h7007
#define SO_OPENTYPE &h7008
#define SO_SYNCHRONOUS_ALERT &h10
#define SO_SYNCHRONOUS_NONALERT &h20
#define SO_MAXDG &h7009
#define SO_MAXPATHDG &h700A
#define SO_UPDATE_ACCEPT_CONTEXT &h700B
#define SO_CONNECT_TIME &h700C
#define TCP_NODELAY &h0001
#define TCP_BSDURGENT &h7000
#define AF_UNSPEC 0
#define AF_UNIX 1
#define AF_INET 2
#define AF_IMPLINK 3
#define AF_PUP 4
#define AF_CHAOS 5
#define AF_IPX 6
#define AF_NS 6
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
#define AF_MAX 22
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
#define PF_MAX AF_MAX
#define SOL_SOCKET &hffff
#define SOMAXCONN 5
#define MSG_OOB &h1
#define MSG_PEEK &h2
#define MSG_DONTROUTE &h4
#define MSG_MAXIOVLEN 16
#define MSG_PARTIAL &h8000
#define MAXGETHOSTSTRUCT 1024
#define FD_READ &h01
#define FD_WRITE &h02
#define FD_OOB &h04
#define FD_ACCEPT &h08
#define FD_CONNECT &h10
#define FD_CLOSE &h20

declare function accept(byval s as SOCKET, byval addr as sockaddr ptr, byval addrlen as long ptr) as SOCKET
declare function bind(byval s as SOCKET, byval name_ as const sockaddr ptr, byval namelen as long) as long
declare function closesocket(byval s as SOCKET) as long
declare function connect(byval s as SOCKET, byval name_ as const sockaddr ptr, byval namelen as long) as long
declare function ioctlsocket(byval s as SOCKET, byval cmd as long, byval argp as u_long ptr) as long
declare function getpeername(byval s as SOCKET, byval name_ as sockaddr ptr, byval namelen as long ptr) as long
declare function getsockname(byval s as SOCKET, byval name_ as sockaddr ptr, byval namelen as long ptr) as long
declare function getsockopt(byval s as SOCKET, byval level as long, byval optname as long, byval optval as zstring ptr, byval optlen as long ptr) as long
declare function htonl(byval hostlong as u_long) as u_long
declare function htons(byval hostshort as u_short) as u_short
declare function inet_addr(byval cp as const zstring ptr) as ulong
declare function inet_ntoa(byval in as in_addr) as zstring ptr
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
declare function WSAAsyncSelect(byval s as SOCKET, byval hWnd as HWND, byval wMsg as u_int, byval lEvent as long) as long

#define __WINSOCK_WS1_SHARED

declare function WSARecvEx(byval s as SOCKET, byval buf as zstring ptr, byval len_ as long, byval flags as long ptr) as long

#define TF_DISCONNECT &h01
#define TF_REUSE_SOCKET &h02
#define TF_WRITE_BEHIND &h04

declare function TransmitFile(byval hSocket as SOCKET, byval hFile as HANDLE, byval nNumberOfBytesToWrite as DWORD, byval nNumberOfBytesPerSend as DWORD, byval lpOverlapped as LPOVERLAPPED, byval lpTransmitBuffers as LPTRANSMIT_FILE_BUFFERS, byval dwReserved as DWORD) as WINBOOL
declare function AcceptEx(byval sListenSocket as SOCKET, byval sAcceptSocket as SOCKET, byval lpOutputBuffer as PVOID, byval dwReceiveDataLength as DWORD, byval dwLocalAddressLength as DWORD, byval dwRemoteAddressLength as DWORD, byval lpdwBytesReceived as LPDWORD, byval lpOverlapped as LPOVERLAPPED) as WINBOOL
declare sub GetAcceptExSockaddrs(byval lpOutputBuffer as PVOID, byval dwReceiveDataLength as DWORD, byval dwLocalAddressLength as DWORD, byval dwRemoteAddressLength as DWORD, byval LocalSockaddr as sockaddr ptr ptr, byval LocalSockaddrLength as LPINT, byval RemoteSockaddr as sockaddr ptr ptr, byval RemoteSockaddrLength as LPINT)

#define __MSWSOCK_WS1_SHARED
#define WSAMAKEASYNCREPLY(buflen, error) MAKELONG(buflen, error)
#define WSAMAKESELECTREPLY(event, error) MAKELONG(event, error)
#define WSAGETASYNCBUFLEN(lParam) LOWORD(lParam)
#define WSAGETASYNCERROR(lParam) HIWORD(lParam)
#define WSAGETSELECTEVENT(lParam) LOWORD(lParam)
#define WSAGETSELECTERROR(lParam) HIWORD(lParam)

end extern
