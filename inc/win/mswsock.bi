#pragma once

#include once "winsock2.bi"
#include once "psdk_inc/_xmitfile.bi"

#ifdef __FB_64BIT__
	extern "C"
#else
	extern "Windows"
#endif

#define _MSWSOCK_
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
#define SO_UPDATE_CONNECT_CONTEXT &h7010
#define TCP_BSDURGENT &h7000
#define SIO_UDP_CONNRESET _WSAIOW(IOC_VENDOR, 12)
#define SIO_SOCKET_CLOSE_NOTIFY _WSAIOW(IOC_VENDOR, 13)

declare function WSARecvEx(byval s as SOCKET, byval buf as zstring ptr, byval len_ as long, byval flags as long ptr) as long

#define TF_DISCONNECT &h01
#define TF_REUSE_SOCKET &h02
#define TF_WRITE_BEHIND &h04
#define TF_USE_DEFAULT_WORKER &h00
#define TF_USE_SYSTEM_THREAD &h10
#define TF_USE_KERNEL_APC &h20

declare function TransmitFile(byval hSocket as SOCKET, byval hFile as HANDLE, byval nNumberOfBytesToWrite as DWORD, byval nNumberOfBytesPerSend as DWORD, byval lpOverlapped as LPOVERLAPPED, byval lpTransmitBuffers as LPTRANSMIT_FILE_BUFFERS, byval dwReserved as DWORD) as WINBOOL
declare function AcceptEx(byval sListenSocket as SOCKET, byval sAcceptSocket as SOCKET, byval lpOutputBuffer as PVOID, byval dwReceiveDataLength as DWORD, byval dwLocalAddressLength as DWORD, byval dwRemoteAddressLength as DWORD, byval lpdwBytesReceived as LPDWORD, byval lpOverlapped as LPOVERLAPPED) as WINBOOL
declare sub GetAcceptExSockaddrs(byval lpOutputBuffer as PVOID, byval dwReceiveDataLength as DWORD, byval dwLocalAddressLength as DWORD, byval dwRemoteAddressLength as DWORD, byval LocalSockaddr as sockaddr ptr ptr, byval LocalSockaddrLength as LPINT, byval RemoteSockaddr as sockaddr ptr ptr, byval RemoteSockaddrLength as LPINT)

type LPFN_TRANSMITFILE as function(byval hSocket as SOCKET, byval hFile as HANDLE, byval nNumberOfBytesToWrite as DWORD, byval nNumberOfBytesPerSend as DWORD, byval lpOverlapped as LPOVERLAPPED, byval lpTransmitBuffers as LPTRANSMIT_FILE_BUFFERS, byval dwReserved as DWORD) as WINBOOL

#define WSAID_TRANSMITFILE (&hb5367df0, &hcbac, &h11cf, (&h95, &hca, &h00, &h80, &h5f, &h48, &ha1, &h92))

type LPFN_ACCEPTEX as function(byval sListenSocket as SOCKET, byval sAcceptSocket as SOCKET, byval lpOutputBuffer as PVOID, byval dwReceiveDataLength as DWORD, byval dwLocalAddressLength as DWORD, byval dwRemoteAddressLength as DWORD, byval lpdwBytesReceived as LPDWORD, byval lpOverlapped as LPOVERLAPPED) as WINBOOL

#define WSAID_ACCEPTEX (&hb5367df1, &hcbac, &h11cf, (&h95, &hca, &h00, &h80, &h5f, &h48, &ha1, &h92))

type LPFN_GETACCEPTEXSOCKADDRS as sub(byval lpOutputBuffer as PVOID, byval dwReceiveDataLength as DWORD, byval dwLocalAddressLength as DWORD, byval dwRemoteAddressLength as DWORD, byval LocalSockaddr as sockaddr ptr ptr, byval LocalSockaddrLength as LPINT, byval RemoteSockaddr as sockaddr ptr ptr, byval RemoteSockaddrLength as LPINT)

#define WSAID_GETACCEPTEXSOCKADDRS (&hb5367df2, &hcbac, &h11cf, (&h95, &hca, &h00, &h80, &h5f, &h48, &ha1, &h92))

type _TRANSMIT_PACKETS_ELEMENT
	dwElFlags as ULONG
	cLength as ULONG

	union
		type
			nFileOffset as LARGE_INTEGER
			hFile as HANDLE
		end type

		pBuffer as PVOID
	end union
end type

type TRANSMIT_PACKETS_ELEMENT as _TRANSMIT_PACKETS_ELEMENT
type PTRANSMIT_PACKETS_ELEMENT as _TRANSMIT_PACKETS_ELEMENT ptr
type LPTRANSMIT_PACKETS_ELEMENT as _TRANSMIT_PACKETS_ELEMENT ptr

#define TP_ELEMENT_MEMORY 1
#define TP_ELEMENT_FILE 2
#define TP_ELEMENT_EOP 4
#define TP_DISCONNECT TF_DISCONNECT
#define TP_REUSE_SOCKET TF_REUSE_SOCKET
#define TP_USE_DEFAULT_WORKER TF_USE_DEFAULT_WORKER
#define TP_USE_SYSTEM_THREAD TF_USE_SYSTEM_THREAD
#define TP_USE_KERNEL_APC TF_USE_KERNEL_APC

type LPFN_TRANSMITPACKETS as function(byval hSocket as SOCKET, byval lpPacketArray as LPTRANSMIT_PACKETS_ELEMENT, byval nElementCount as DWORD, byval nSendSize as DWORD, byval lpOverlapped as LPOVERLAPPED, byval dwFlags as DWORD) as WINBOOL

#define WSAID_TRANSMITPACKETS (&hd9689da0, &h1f90, &h11d3, (&h99, &h71, &h00, &hc0, &h4f, &h68, &hc8, &h76))

type LPFN_CONNECTEX as function(byval s as SOCKET, byval name_ as const sockaddr ptr, byval namelen as long, byval lpSendBuffer as PVOID, byval dwSendDataLength as DWORD, byval lpdwBytesSent as LPDWORD, byval lpOverlapped as LPOVERLAPPED) as WINBOOL

#define WSAID_CONNECTEX (&h25a207b9, &hddf3, &h4660, (&h8e, &he9, &h76, &he5, &h8c, &h74, &h06, &h3e))

type LPFN_DISCONNECTEX as function(byval s as SOCKET, byval lpOverlapped as LPOVERLAPPED, byval dwFlags as DWORD, byval dwReserved as DWORD) as WINBOOL

#define WSAID_DISCONNECTEX (&h7fda2e11, &h8630, &h436f, (&ha0, &h31, &hf5, &h36, &ha6, &hee, &hc1, &h57))
#define DE_REUSE_SOCKET TF_REUSE_SOCKET
#define NLA_NAMESPACE_GUID (&h6642243a, &h3ba8, &h4aa6, (&hba, &ha5, &h2e, &hb, &hd7, &h1f, &hdd, &h83))
#define NLA_SERVICE_CLASS_GUID (&h37e515, &hb5c9, &h4a43, (&hba, &hda, &h8b, &h48, &ha8, &h7a, &hd2, &h39))
#define NLA_ALLUSERS_NETWORK &h00000001
#define NLA_FRIENDLY_NAME &h00000002

type _NLA_BLOB_DATA_TYPE as long
enum
	NLA_RAW_DATA = 0
	NLA_INTERFACE = 1
	NLA_802_1X_LOCATION = 2
	NLA_CONNECTIVITY = 3
	NLA_ICS = 4
end enum

type NLA_BLOB_DATA_TYPE as _NLA_BLOB_DATA_TYPE
type PNLA_BLOB_DATA_TYPE as _NLA_BLOB_DATA_TYPE ptr

type _NLA_CONNECTIVITY_TYPE as long
enum
	NLA_NETWORK_AD_HOC = 0
	NLA_NETWORK_MANAGED = 1
	NLA_NETWORK_UNMANAGED = 2
	NLA_NETWORK_UNKNOWN = 3
end enum

type NLA_CONNECTIVITY_TYPE as _NLA_CONNECTIVITY_TYPE
type PNLA_CONNECTIVITY_TYPE as _NLA_CONNECTIVITY_TYPE ptr

type _NLA_INTERNET as long
enum
	NLA_INTERNET_UNKNOWN = 0
	NLA_INTERNET_NO = 1
	NLA_INTERNET_YES = 2
end enum

type NLA_INTERNET as _NLA_INTERNET
type PNLA_INTERNET as _NLA_INTERNET ptr

type ___NLA_BLOB_header
	as NLA_BLOB_DATA_TYPE type
	dwSize as DWORD
	nextOffset as DWORD
end type

type ___NLA_BLOB_interfaceData
	dwType as DWORD
	dwSpeed as DWORD
	adapterName(0 to 0) as CHAR
end type

type ___NLA_BLOB_locationData
	information(0 to 0) as CHAR
end type

type ___NLA_BLOB_connectivity
	as NLA_CONNECTIVITY_TYPE type
	internet as NLA_INTERNET
end type

type ___NLA_BLOB_remote
	speed as DWORD
	as DWORD type
	state as DWORD
	machineName(0 to 255) as WCHAR
	sharedAdapterName(0 to 255) as WCHAR
end type

type ___NLA_BLOB_ICS
	remote as ___NLA_BLOB_remote
end type

union ___NLA_BLOB_data
	rawData(0 to 0) as CHAR
	interfaceData as ___NLA_BLOB_interfaceData
	locationData as ___NLA_BLOB_locationData
	connectivity as ___NLA_BLOB_connectivity
	ICS as ___NLA_BLOB_ICS
end union

type _NLA_BLOB
	header as ___NLA_BLOB_header
	data as ___NLA_BLOB_data
end type

type NLA_BLOB as _NLA_BLOB
type PNLA_BLOB as _NLA_BLOB ptr
type LPNLA_BLOB as _NLA_BLOB ptr

type _WSACMSGHDR
	cmsg_len as SIZE_T_
	cmsg_level as INT_
	cmsg_type as INT_
end type

type WSACMSGHDR as _WSACMSGHDR
type PWSACMSGHDR as _WSACMSGHDR ptr
type LPWSACMSGHDR as _WSACMSGHDR ptr

#define WSA_CMSGHDR_ALIGN(length) ((((length) + TYPE_ALIGNMENT(WSACMSGHDR)) - 1) and (not (TYPE_ALIGNMENT(WSACMSGHDR) - 1)))
#define WSA_CMSGDATA_ALIGN(length) ((((length) + MAX_NATURAL_ALIGNMENT) - 1) and (not (MAX_NATURAL_ALIGNMENT - 1)))
#define WSA_CMSG_FIRSTHDR(msg) iif((msg)->Control.len >= sizeof(WSACMSGHDR), cast(LPWSACMSGHDR, (msg)->Control.buf), cast(LPWSACMSGHDR, NULL))
#define WSA_CMSG_NXTHDR(msg, cmsg) iif((cmsg) = 0, WSA_CMSG_FIRSTHDR(msg), iif(cptr(u_char ptr, ((cmsg) + WSA_CMSGHDR_ALIGN((cmsg)->cmsg_len)) + sizeof(WSACMSGHDR)) > cptr(u_char ptr, (msg)->Control.buf + (msg)->Control.len), cast(LPWSACMSGHDR, NULL), cast(LPWSACMSGHDR, cptr(u_char ptr, (cmsg) + WSA_CMSGHDR_ALIGN((cmsg)->cmsg_len)))))
#define WSA_CMSG_DATA(cmsg) cptr(u_char ptr, (cmsg) + WSA_CMSGDATA_ALIGN(sizeof(WSACMSGHDR)))
#define WSA_CMSG_SPACE(length) WSA_CMSGDATA_ALIGN(sizeof(WSACMSGHDR) + WSA_CMSGHDR_ALIGN(length))
#define WSA_CMSG_LEN(length) (WSA_CMSGDATA_ALIGN(sizeof(WSACMSGHDR)) + length)
#define MSG_TRUNC &h0100
#define MSG_CTRUNC &h0200
#define MSG_BCAST &h0400
#define MSG_MCAST &h0800

type LPFN_WSARECVMSG as function(byval s as SOCKET, byval lpMsg as LPWSAMSG, byval lpdwNumberOfBytesRecvd as LPDWORD, byval lpOverlapped as LPWSAOVERLAPPED, byval lpCompletionRoutine as LPWSAOVERLAPPED_COMPLETION_ROUTINE) as INT_

#define WSAID_WSARECVMSG (&hf689d7c8, &h6f1f, &h436b, (&h8a, &h53, &he5, &h4f, &he3, &h51, &hc3, &h22))

end extern
