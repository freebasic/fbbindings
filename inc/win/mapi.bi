#pragma once

'' The following symbols have been renamed:
''     #define EXPORT => EXPORT_

extern "C"

#define MAPI_H
#define EXPORT_

type __LONG32 as ulong

'' TODO: typedef unsigned __LONG32 *LPULONG;
'' TODO: typedef unsigned __LONG32 FLAGS;

#define __LHANDLE

type LHANDLE as ULONG_PTR
type LPLHANDLE as ULONG_PTR ptr
type LPBYTE as ubyte ptr

#define lhSessionNull cast(LHANDLE, 0)

type MapiFileDesc
	ulReserved as ULONG
	flFlags as ULONG
	nPosition as ULONG
	lpszPathName as LPSTR
	lpszFileName as LPSTR
	lpFileType as LPVOID
end type

type lpMapiFileDesc as MapiFileDesc ptr

#define MAPI_OLE &h00000001
#define MAPI_OLE_STATIC &h00000002

type MapiFileTagExt
	ulReserved as ULONG
	cbTag as ULONG
	lpTag as LPBYTE
	cbEncoding as ULONG
	lpEncoding as LPBYTE
end type

type lpMapiFileTagExt as MapiFileTagExt ptr

type MapiRecipDesc
	ulReserved as ULONG
	ulRecipClass as ULONG
	lpszName as LPSTR
	lpszAddress as LPSTR
	ulEIDSize as ULONG
	lpEntryID as LPVOID
end type

type lpMapiRecipDesc as MapiRecipDesc ptr

#define MAPI_ORIG 0
#define MAPI_TO 1
#define MAPI_CC 2
#define MAPI_BCC 3

type MapiMessage
	ulReserved as ULONG
	lpszSubject as LPSTR
	lpszNoteText as LPSTR
	lpszMessageType as LPSTR
	lpszDateReceived as LPSTR
	lpszConversationID as LPSTR
	flFlags as FLAGS
	lpOriginator as lpMapiRecipDesc
	nRecipCount as ULONG
	lpRecips as lpMapiRecipDesc
	nFileCount as ULONG
	lpFiles as lpMapiFileDesc
end type

type lpMapiMessage as MapiMessage ptr

#define MAPI_UNREAD &h00000001
#define MAPI_RECEIPT_REQUESTED &h00000002
#define MAPI_SENT &h00000004
#define MAPI_LOGON_UI &h00000001
#define MAPI_PASSWORD_UI &h00020000
#define MAPI_NEW_SESSION &h00000002
#define MAPI_FORCE_DOWNLOAD &h00001000
#define MAPI_EXTENDED &h00000020
#define MAPI_DIALOG &h00000008
#define MAPI_UNREAD_ONLY &h00000020
#define MAPI_GUARANTEE_FIFO &h00000100
#define MAPI_LONG_MSGID &h00004000
#define MAPI_PEEK &h00000080
#define MAPI_SUPPRESS_ATTACH &h00000800
#define MAPI_ENVELOPE_ONLY &h00000040
#define MAPI_BODY_AS_FILE &h00000200
#define MAPI_AB_NOMODIFY &h00000400

'' TODO: typedef ULONG (WINAPI MAPILOGON)(ULONG_PTR ulUIParam,LPSTR lpszProfileName,LPSTR lpszPassword,FLAGS flFlags,ULONG ulReserved,LPLHANDLE lplhSession);

type LPMAPILOGON as MAPILOGON ptr

extern     MAPILogon as MAPILOGON
dim shared MAPILogon as MAPILOGON

'' TODO: typedef ULONG (WINAPI MAPILOGOFF)(LHANDLE lhSession,ULONG_PTR ulUIParam,FLAGS flFlags,ULONG ulReserved);

type LPMAPILOGOFF as MAPILOGOFF ptr

extern     MAPILogoff as MAPILOGOFF
dim shared MAPILogoff as MAPILOGOFF

'' TODO: typedef ULONG (WINAPI MAPISENDMAIL)(LHANDLE lhSession,ULONG_PTR ulUIParam,lpMapiMessage lpMessage,FLAGS flFlags,ULONG ulReserved);

type LPMAPISENDMAIL as MAPISENDMAIL ptr

extern     MAPISendMail as MAPISENDMAIL
dim shared MAPISendMail as MAPISENDMAIL

'' TODO: typedef ULONG (WINAPI MAPISENDDOCUMENTS)(ULONG_PTR ulUIParam,LPSTR lpszDelimChar,LPSTR lpszFilePaths,LPSTR lpszFileNames,ULONG ulReserved);

type LPMAPISENDDOCUMENTS as MAPISENDDOCUMENTS ptr

extern     MAPISendDocuments as MAPISENDDOCUMENTS
dim shared MAPISendDocuments as MAPISENDDOCUMENTS

'' TODO: typedef ULONG (WINAPI MAPIFINDNEXT)(LHANDLE lhSession,ULONG_PTR ulUIParam,LPSTR lpszMessageType,LPSTR lpszSeedMessageID,FLAGS flFlags,ULONG ulReserved,LPSTR lpszMessageID);

type LPMAPIFINDNEXT as MAPIFINDNEXT ptr

extern     MAPIFindNext as MAPIFINDNEXT
dim shared MAPIFindNext as MAPIFINDNEXT

'' TODO: typedef ULONG (WINAPI MAPIREADMAIL)(LHANDLE lhSession,ULONG_PTR ulUIParam,LPSTR lpszMessageID,FLAGS flFlags,ULONG ulReserved,lpMapiMessage *lppMessage);

type LPMAPIREADMAIL as MAPIREADMAIL ptr

extern     MAPIReadMail as MAPIREADMAIL
dim shared MAPIReadMail as MAPIREADMAIL

'' TODO: typedef ULONG (WINAPI MAPISAVEMAIL)(LHANDLE lhSession,ULONG_PTR ulUIParam,lpMapiMessage lpMessage,FLAGS flFlags,ULONG ulReserved,LPSTR lpszMessageID);

type LPMAPISAVEMAIL as MAPISAVEMAIL ptr

extern     MAPISaveMail as MAPISAVEMAIL
dim shared MAPISaveMail as MAPISAVEMAIL

'' TODO: typedef ULONG (WINAPI MAPIDELETEMAIL)(LHANDLE lhSession,ULONG_PTR ulUIParam,LPSTR lpszMessageID,FLAGS flFlags,ULONG ulReserved);

type LPMAPIDELETEMAIL as MAPIDELETEMAIL ptr

extern     MAPIDeleteMail as MAPIDELETEMAIL
dim shared MAPIDeleteMail as MAPIDELETEMAIL

'' TODO: typedef ULONG ( WINAPI *LPMAPIFREEBUFFER)(LPVOID pv);

extern     WINAPI as ULONG
dim shared WINAPI as ULONG

'' TODO: ULONG WINAPI MAPIFreeBuffer(LPVOID pv);
'' TODO: typedef ULONG (WINAPI MAPIADDRESS)(LHANDLE lhSession,ULONG_PTR ulUIParam,LPSTR lpszCaption,ULONG nEditFields,LPSTR lpszLabels,ULONG nRecips,lpMapiRecipDesc lpRecips,FLAGS flFlags,ULONG ulReserved,LPULONG lpnNewRecips,lpMapiRecipDesc *lppNewRecips);

type LPMAPIADDRESS as MAPIADDRESS ptr

extern     MAPIAddress as MAPIADDRESS
dim shared MAPIAddress as MAPIADDRESS

'' TODO: typedef ULONG (WINAPI MAPIDETAILS)(LHANDLE lhSession,ULONG_PTR ulUIParam,lpMapiRecipDesc lpRecip,FLAGS flFlags,ULONG ulReserved);

type LPMAPIDETAILS as MAPIDETAILS ptr

extern     MAPIDetails as MAPIDETAILS
dim shared MAPIDetails as MAPIDETAILS

'' TODO: typedef ULONG (WINAPI MAPIRESOLVENAME)(LHANDLE lhSession,ULONG_PTR ulUIParam,LPSTR lpszName,FLAGS flFlags,ULONG ulReserved,lpMapiRecipDesc *lppRecip);

type LPMAPIRESOLVENAME as MAPIRESOLVENAME ptr

extern     MAPIResolveName as MAPIRESOLVENAME
dim shared MAPIResolveName as MAPIRESOLVENAME

#define SUCCESS_SUCCESS 0
#define MAPI_USER_ABORT 1
#define MAPI_E_USER_ABORT MAPI_USER_ABORT
#define MAPI_E_FAILURE 2
#define MAPI_E_LOGON_FAILURE 3
#define MAPI_E_LOGIN_FAILURE MAPI_E_LOGON_FAILURE
#define MAPI_E_DISK_FULL 4
#define MAPI_E_INSUFFICIENT_MEMORY 5
#define MAPI_E_ACCESS_DENIED 6
#define MAPI_E_TOO_MANY_SESSIONS 8
#define MAPI_E_TOO_MANY_FILES 9
#define MAPI_E_TOO_MANY_RECIPIENTS 10
#define MAPI_E_ATTACHMENT_NOT_FOUND 11
#define MAPI_E_ATTACHMENT_OPEN_FAILURE 12
#define MAPI_E_ATTACHMENT_WRITE_FAILURE 13
#define MAPI_E_UNKNOWN_RECIPIENT 14
#define MAPI_E_BAD_RECIPTYPE 15
#define MAPI_E_NO_MESSAGES 16
#define MAPI_E_INVALID_MESSAGE 17
#define MAPI_E_TEXT_TOO_LARGE 18
#define MAPI_E_INVALID_SESSION 19
#define MAPI_E_TYPE_NOT_SUPPORTED 20
#define MAPI_E_AMBIGUOUS_RECIPIENT 21
#define MAPI_E_AMBIG_RECIP MAPI_E_AMBIGUOUS_RECIPIENT
#define MAPI_E_MESSAGE_IN_USE 22
#define MAPI_E_NETWORK_FAILURE 23
#define MAPI_E_INVALID_EDITFIELDS 24
#define MAPI_E_INVALID_RECIPS 25
#define MAPI_E_NOT_SUPPORTED 26

end extern
