#pragma once

extern "C"

#define _NTSECPKG_

type PLSA_CLIENT_REQUEST as PVOID ptr

type _LSA_TOKEN_INFORMATION_TYPE as long
enum
	LsaTokenInformationNull
	LsaTokenInformationV1
	LsaTokenInformationV2
end enum

type LSA_TOKEN_INFORMATION_TYPE as _LSA_TOKEN_INFORMATION_TYPE
type PLSA_TOKEN_INFORMATION_TYPE as _LSA_TOKEN_INFORMATION_TYPE ptr

type _LSA_TOKEN_INFORMATION_NULL
	ExpirationTime as LARGE_INTEGER
	Groups as PTOKEN_GROUPS
end type

type LSA_TOKEN_INFORMATION_NULL as _LSA_TOKEN_INFORMATION_NULL
type PLSA_TOKEN_INFORMATION_NULL as _LSA_TOKEN_INFORMATION_NULL ptr

type _LSA_TOKEN_INFORMATION_V1
	ExpirationTime as LARGE_INTEGER
	User as TOKEN_USER
	Groups as PTOKEN_GROUPS
	PrimaryGroup as TOKEN_PRIMARY_GROUP
	Privileges as PTOKEN_PRIVILEGES
	Owner as TOKEN_OWNER
	DefaultDacl as TOKEN_DEFAULT_DACL
end type

type LSA_TOKEN_INFORMATION_V1 as _LSA_TOKEN_INFORMATION_V1
type PLSA_TOKEN_INFORMATION_V1 as _LSA_TOKEN_INFORMATION_V1 ptr
type LSA_TOKEN_INFORMATION_V2 as LSA_TOKEN_INFORMATION_V1
type PLSA_TOKEN_INFORMATION_V2 as LSA_TOKEN_INFORMATION_V1 ptr

'' TODO: typedef NTSTATUS (NTAPI LSA_CREATE_LOGON_SESSION)(PLUID LogonId);
'' TODO: typedef NTSTATUS (NTAPI LSA_DELETE_LOGON_SESSION)(PLUID LogonId);
'' TODO: typedef NTSTATUS (NTAPI LSA_ADD_CREDENTIAL)(PLUID LogonId,ULONG AuthenticationPackage,PLSA_STRING PrimaryKeyValue,PLSA_STRING Credentials);
'' TODO: typedef NTSTATUS (NTAPI LSA_GET_CREDENTIALS)(PLUID LogonId,ULONG AuthenticationPackage,PULONG QueryContext,BOOLEAN RetrieveAllCredentials,PLSA_STRING PrimaryKeyValue,PULONG PrimaryKeyLength,PLSA_STRING Credentials);
'' TODO: typedef NTSTATUS (NTAPI LSA_DELETE_CREDENTIAL)(PLUID LogonId,ULONG AuthenticationPackage,PLSA_STRING PrimaryKeyValue);
'' TODO: typedef PVOID (NTAPI LSA_ALLOCATE_LSA_HEAP)(ULONG Length);
'' TODO: typedef VOID (NTAPI LSA_FREE_LSA_HEAP)(PVOID Base);
'' TODO: typedef PVOID (NTAPI LSA_ALLOCATE_PRIVATE_HEAP)(SIZE_T Length);
'' TODO: typedef VOID (NTAPI LSA_FREE_PRIVATE_HEAP)(PVOID Base);
'' TODO: typedef NTSTATUS (NTAPI LSA_ALLOCATE_CLIENT_BUFFER)(PLSA_CLIENT_REQUEST ClientRequest,ULONG LengthRequired,PVOID *ClientBaseAddress);
'' TODO: typedef NTSTATUS (NTAPI LSA_FREE_CLIENT_BUFFER)(PLSA_CLIENT_REQUEST ClientRequest,PVOID ClientBaseAddress);
'' TODO: typedef NTSTATUS (NTAPI LSA_COPY_TO_CLIENT_BUFFER)(PLSA_CLIENT_REQUEST ClientRequest,ULONG Length,PVOID ClientBaseAddress,PVOID BufferToCopy);
'' TODO: typedef NTSTATUS (NTAPI LSA_COPY_FROM_CLIENT_BUFFER)(PLSA_CLIENT_REQUEST ClientRequest,ULONG Length,PVOID BufferToCopy,PVOID ClientBaseAddress);

type PLSA_CREATE_LOGON_SESSION as LSA_CREATE_LOGON_SESSION ptr
type PLSA_DELETE_LOGON_SESSION as LSA_DELETE_LOGON_SESSION ptr
type PLSA_ADD_CREDENTIAL as LSA_ADD_CREDENTIAL ptr
type PLSA_GET_CREDENTIALS as LSA_GET_CREDENTIALS ptr
type PLSA_DELETE_CREDENTIAL as LSA_DELETE_CREDENTIAL ptr
type PLSA_ALLOCATE_LSA_HEAP as LSA_ALLOCATE_LSA_HEAP ptr
type PLSA_FREE_LSA_HEAP as LSA_FREE_LSA_HEAP ptr
type PLSA_ALLOCATE_PRIVATE_HEAP as LSA_ALLOCATE_PRIVATE_HEAP ptr
type PLSA_FREE_PRIVATE_HEAP as LSA_FREE_PRIVATE_HEAP ptr
type PLSA_ALLOCATE_CLIENT_BUFFER as LSA_ALLOCATE_CLIENT_BUFFER ptr
type PLSA_FREE_CLIENT_BUFFER as LSA_FREE_CLIENT_BUFFER ptr
type PLSA_COPY_TO_CLIENT_BUFFER as LSA_COPY_TO_CLIENT_BUFFER ptr
type PLSA_COPY_FROM_CLIENT_BUFFER as LSA_COPY_FROM_CLIENT_BUFFER ptr

type _LSA_DISPATCH_TABLE
	CreateLogonSession as PLSA_CREATE_LOGON_SESSION
	DeleteLogonSession as PLSA_DELETE_LOGON_SESSION
	AddCredential as PLSA_ADD_CREDENTIAL
	GetCredentials as PLSA_GET_CREDENTIALS
	DeleteCredential as PLSA_DELETE_CREDENTIAL
	AllocateLsaHeap as PLSA_ALLOCATE_LSA_HEAP
	FreeLsaHeap as PLSA_FREE_LSA_HEAP
	AllocateClientBuffer as PLSA_ALLOCATE_CLIENT_BUFFER
	FreeClientBuffer as PLSA_FREE_CLIENT_BUFFER
	CopyToClientBuffer as PLSA_COPY_TO_CLIENT_BUFFER
	CopyFromClientBuffer as PLSA_COPY_FROM_CLIENT_BUFFER
end type

type LSA_DISPATCH_TABLE as _LSA_DISPATCH_TABLE
type PLSA_DISPATCH_TABLE as _LSA_DISPATCH_TABLE ptr

#define LSA_AP_NAME_INITIALIZE_PACKAGE !"LsaApInitializePackage\0"
#define LSA_AP_NAME_LOGON_USER !"LsaApLogonUser\0"
#define LSA_AP_NAME_LOGON_USER_EX !"LsaApLogonUserEx\0"
#define LSA_AP_NAME_CALL_PACKAGE !"LsaApCallPackage\0"
#define LSA_AP_NAME_LOGON_TERMINATED !"LsaApLogonTerminated\0"
#define LSA_AP_NAME_CALL_PACKAGE_UNTRUSTED !"LsaApCallPackageUntrusted\0"
#define LSA_AP_NAME_CALL_PACKAGE_PASSTHROUGH !"LsaApCallPackagePassthrough\0"

'' TODO: typedef NTSTATUS (NTAPI LSA_AP_INITIALIZE_PACKAGE)(ULONG AuthenticationPackageId,PLSA_DISPATCH_TABLE LsaDispatchTable,PLSA_STRING Database,PLSA_STRING Confidentiality,PLSA_STRING *AuthenticationPackageName);
'' TODO: typedef NTSTATUS (NTAPI LSA_AP_LOGON_USER)(PLSA_CLIENT_REQUEST ClientRequest,SECURITY_LOGON_TYPE LogonType,PVOID AuthenticationInformation,PVOID ClientAuthenticationBase,ULONG AuthenticationInformationLength,PVOID *ProfileBuffer,PULONG ProfileBufferLength,PLUID LogonId,PNTSTATUS SubStatus,PLSA_TOKEN_INFORMATION_TYPE TokenInformationType,PVOID *TokenInformation,PLSA_UNICODE_STRING *AccountName,PLSA_UNICODE_STRING *AuthenticatingAuthority);
'' TODO: typedef NTSTATUS (NTAPI LSA_AP_LOGON_USER_EX)(PLSA_CLIENT_REQUEST ClientRequest,SECURITY_LOGON_TYPE LogonType,PVOID AuthenticationInformation,PVOID ClientAuthenticationBase,ULONG AuthenticationInformationLength,PVOID *ProfileBuffer,PULONG ProfileBufferLength,PLUID LogonId,PNTSTATUS SubStatus,PLSA_TOKEN_INFORMATION_TYPE TokenInformationType,PVOID *TokenInformation,PUNICODE_STRING *AccountName,PUNICODE_STRING *AuthenticatingAuthority,PUNICODE_STRING *MachineName);
'' TODO: typedef NTSTATUS (NTAPI LSA_AP_CALL_PACKAGE)(PLSA_CLIENT_REQUEST ClientRequest,PVOID ProtocolSubmitBuffer,PVOID ClientBufferBase,ULONG SubmitBufferLength,PVOID *ProtocolReturnBuffer,PULONG ReturnBufferLength,PNTSTATUS ProtocolStatus);
'' TODO: typedef NTSTATUS (NTAPI LSA_AP_CALL_PACKAGE_PASSTHROUGH)(PLSA_CLIENT_REQUEST ClientRequest,PVOID ProtocolSubmitBuffer,PVOID ClientBufferBase,ULONG SubmitBufferLength,PVOID *ProtocolReturnBuffer,PULONG ReturnBufferLength,PNTSTATUS ProtocolStatus);
'' TODO: typedef VOID (NTAPI LSA_AP_LOGON_TERMINATED)(PLUID LogonId);

type LSA_AP_CALL_PACKAGE_UNTRUSTED as LSA_AP_CALL_PACKAGE
type PLSA_AP_INITIALIZE_PACKAGE as LSA_AP_INITIALIZE_PACKAGE ptr
type PLSA_AP_LOGON_USER as LSA_AP_LOGON_USER ptr
type PLSA_AP_LOGON_USER_EX as LSA_AP_LOGON_USER_EX ptr
type PLSA_AP_CALL_PACKAGE as LSA_AP_CALL_PACKAGE ptr
type PLSA_AP_CALL_PACKAGE_PASSTHROUGH as LSA_AP_CALL_PACKAGE_PASSTHROUGH ptr
type PLSA_AP_LOGON_TERMINATED as LSA_AP_LOGON_TERMINATED ptr
type PLSA_AP_CALL_PACKAGE_UNTRUSTED as LSA_AP_CALL_PACKAGE_UNTRUSTED ptr

#define _SAM_CREDENTIAL_UPDATE_DEFINED

type PSAM_CREDENTIAL_UPDATE_NOTIFY_ROUTINE as function(byval ClearPassword as PUNICODE_STRING, byval OldCredentials as PVOID, byval OldCredentialSize as ULONG, byval UserAccountControl as ULONG, byval UPN as PUNICODE_STRING, byval UserName as PUNICODE_STRING, byval NetbiosDomainName as PUNICODE_STRING, byval DnsDomainName as PUNICODE_STRING, byval NewCredentials as PVOID ptr, byval NewCredentialSize as ULONG ptr) as NTSTATUS

#define SAM_CREDENTIAL_UPDATE_NOTIFY_ROUTINE "CredentialUpdateNotify"

type PSAM_CREDENTIAL_UPDATE_REGISTER_ROUTINE as function(byval CredentialName as PUNICODE_STRING) as BOOLEAN

#define SAM_CREDENTIAL_UPDATE_REGISTER_ROUTINE "CredentialUpdateRegister"

type PSAM_CREDENTIAL_UPDATE_FREE_ROUTINE as function(byval p as PVOID) as VOID

#define SAM_CREDENTIAL_UPDATE_FREE_ROUTINE "CredentialUpdateFree"

type SEC_THREAD_START as LPTHREAD_START_ROUTINE
type SEC_ATTRS as LPSECURITY_ATTRIBUTES

'' TODO: #define SecEqualLuid(L1,L2) ((((PLUID)L1)->LowPart==((PLUID)L2)->LowPart) && (((PLUID)L1)->HighPart==((PLUID)L2)->HighPart))

#define SecIsZeroLuid(L1) ((L1->LowPart or L1->HighPart) = 0)

type _SECPKG_CLIENT_INFO
	LogonId as LUID
	ProcessID as ULONG
	ThreadID as ULONG
	HasTcbPrivilege as BOOLEAN
	Impersonating as BOOLEAN
	Restricted as BOOLEAN
	ClientFlags as UCHAR
	ImpersonationLevel as SECURITY_IMPERSONATION_LEVEL
end type

type SECPKG_CLIENT_INFO as _SECPKG_CLIENT_INFO
type PSECPKG_CLIENT_INFO as _SECPKG_CLIENT_INFO ptr

#define SECPKG_CLIENT_PROCESS_TERMINATED &h01
#define SECPKG_CLIENT_THREAD_TERMINATED &h02

type _SECPKG_CALL_INFO
	ProcessId as ULONG
	ThreadId as ULONG
	Attributes as ULONG
	CallCount as ULONG
end type

type SECPKG_CALL_INFO as _SECPKG_CALL_INFO
type PSECPKG_CALL_INFO as _SECPKG_CALL_INFO ptr

#define SECPKG_CALL_KERNEL_MODE &h00000001
#define SECPKG_CALL_ANSI &h00000002
#define SECPKG_CALL_URGENT &h00000004
#define SECPKG_CALL_RECURSIVE &h00000008
#define SECPKG_CALL_IN_PROC &h00000010
#define SECPKG_CALL_CLEANUP &h00000020
#define SECPKG_CALL_WOWCLIENT &h00000040
#define SECPKG_CALL_THREAD_TERM &h00000080
#define SECPKG_CALL_PROCESS_TERM &h00000100
#define SECPKG_CALL_IS_TCB &h00000200

type _SECPKG_SUPPLEMENTAL_CRED
	PackageName as UNICODE_STRING
	CredentialSize as ULONG
	Credentials as PUCHAR
end type

type SECPKG_SUPPLEMENTAL_CRED as _SECPKG_SUPPLEMENTAL_CRED
type PSECPKG_SUPPLEMENTAL_CRED as _SECPKG_SUPPLEMENTAL_CRED ptr
type LSA_SEC_HANDLE as ULONG_PTR
type PLSA_SEC_HANDLE as LSA_SEC_HANDLE ptr

type _SECPKG_SUPPLEMENTAL_CRED_ARRAY
	CredentialCount as ULONG
	Credentials(0 to 0) as SECPKG_SUPPLEMENTAL_CRED
end type

type SECPKG_SUPPLEMENTAL_CRED_ARRAY as _SECPKG_SUPPLEMENTAL_CRED_ARRAY
type PSECPKG_SUPPLEMENTAL_CRED_ARRAY as _SECPKG_SUPPLEMENTAL_CRED_ARRAY ptr

#define SECBUFFER_UNMAPPED &h40000000
#define SECBUFFER_KERNEL_MAP &h20000000

'' TODO: typedef NTSTATUS (NTAPI LSA_CALLBACK_FUNCTION)(ULONG_PTR Argument1,ULONG_PTR Argument2,PSecBuffer InputBuffer,PSecBuffer OutputBuffer);

type PLSA_CALLBACK_FUNCTION as LSA_CALLBACK_FUNCTION ptr

#define PRIMARY_CRED_CLEAR_PASSWORD &h1
#define PRIMARY_CRED_OWF_PASSWORD &h2
#define PRIMARY_CRED_UPDATE &h4
#define PRIMARY_CRED_CACHED_LOGON &h8
#define PRIMARY_CRED_LOGON_NO_TCB &h10
#define PRIMARY_CRED_LOGON_PACKAGE_SHIFT 24
#define PRIMARY_CRED_PACKAGE_MASK &hff000000

type _SECPKG_PRIMARY_CRED
	LogonId as LUID
	DownlevelName as UNICODE_STRING
	DomainName as UNICODE_STRING
	Password as UNICODE_STRING
	OldPassword as UNICODE_STRING
	UserSid as PSID
	Flags as ULONG
	DnsDomainName as UNICODE_STRING
	Upn as UNICODE_STRING
	LogonServer as UNICODE_STRING
	Spare1 as UNICODE_STRING
	Spare2 as UNICODE_STRING
	Spare3 as UNICODE_STRING
	Spare4 as UNICODE_STRING
end type

type SECPKG_PRIMARY_CRED as _SECPKG_PRIMARY_CRED
type PSECPKG_PRIMARY_CRED as _SECPKG_PRIMARY_CRED ptr

#define MAX_CRED_SIZE 1024
#define SECPKG_STATE_ENCRYPTION_PERMITTED &h01
#define SECPKG_STATE_STRONG_ENCRYPTION_PERMITTED &h02
#define SECPKG_STATE_DOMAIN_CONTROLLER &h04
#define SECPKG_STATE_WORKSTATION &h08
#define SECPKG_STATE_STANDALONE &h10

type _SECPKG_PARAMETERS
	Version as ULONG
	MachineState as ULONG
	SetupMode as ULONG
	DomainSid as PSID
	DomainName as UNICODE_STRING
	DnsDomainName as UNICODE_STRING
	DomainGuid as GUID
end type

type SECPKG_PARAMETERS as _SECPKG_PARAMETERS
type PSECPKG_PARAMETERS as _SECPKG_PARAMETERS ptr

type _SECPKG_EXTENDED_INFORMATION_CLASS as long
enum
	SecpkgGssInfo = 1
	SecpkgContextThunks
	SecpkgMutualAuthLevel
	SecpkgWowClientDll
	SecpkgExtraOids
	SecpkgMaxInfo
end enum

type SECPKG_EXTENDED_INFORMATION_CLASS as _SECPKG_EXTENDED_INFORMATION_CLASS

type _SECPKG_GSS_INFO
	EncodedIdLength as ULONG
	EncodedId(0 to 3) as UCHAR
end type

type SECPKG_GSS_INFO as _SECPKG_GSS_INFO
type PSECPKG_GSS_INFO as _SECPKG_GSS_INFO ptr

type _SECPKG_CONTEXT_THUNKS
	InfoLevelCount as ULONG
	Levels(0 to 0) as ULONG
end type

type SECPKG_CONTEXT_THUNKS as _SECPKG_CONTEXT_THUNKS
type PSECPKG_CONTEXT_THUNKS as _SECPKG_CONTEXT_THUNKS ptr

type _SECPKG_MUTUAL_AUTH_LEVEL
	MutualAuthLevel as ULONG
end type

type SECPKG_MUTUAL_AUTH_LEVEL as _SECPKG_MUTUAL_AUTH_LEVEL
type PSECPKG_MUTUAL_AUTH_LEVEL as _SECPKG_MUTUAL_AUTH_LEVEL ptr

type _SECPKG_WOW_CLIENT_DLL
	WowClientDllPath as SECURITY_STRING
end type

type SECPKG_WOW_CLIENT_DLL as _SECPKG_WOW_CLIENT_DLL
type PSECPKG_WOW_CLIENT_DLL as _SECPKG_WOW_CLIENT_DLL ptr

#define SECPKG_MAX_OID_LENGTH 32

type _SECPKG_SERIALIZED_OID
	OidLength as ULONG
	OidAttributes as ULONG
	OidValue(0 to 31) as UCHAR
end type

type SECPKG_SERIALIZED_OID as _SECPKG_SERIALIZED_OID
type PSECPKG_SERIALIZED_OID as _SECPKG_SERIALIZED_OID ptr

type _SECPKG_EXTRA_OIDS
	OidCount as ULONG
	Oids(0 to 0) as SECPKG_SERIALIZED_OID
end type

type SECPKG_EXTRA_OIDS as _SECPKG_EXTRA_OIDS
type PSECPKG_EXTRA_OIDS as _SECPKG_EXTRA_OIDS ptr

union ___SECPKG_EXTENDED_INFORMATION_Info
	GssInfo as SECPKG_GSS_INFO
	ContextThunks as SECPKG_CONTEXT_THUNKS
	MutualAuthLevel as SECPKG_MUTUAL_AUTH_LEVEL
	WowClientDll as SECPKG_WOW_CLIENT_DLL
	ExtraOids as SECPKG_EXTRA_OIDS
end union

type _SECPKG_EXTENDED_INFORMATION
	Class as SECPKG_EXTENDED_INFORMATION_CLASS
	Info as ___SECPKG_EXTENDED_INFORMATION_Info
end type

type SECPKG_EXTENDED_INFORMATION as _SECPKG_EXTENDED_INFORMATION
type PSECPKG_EXTENDED_INFORMATION as _SECPKG_EXTENDED_INFORMATION ptr

#define SECPKG_ATTR_SASL_CONTEXT &h00010000

type _SecPkgContext_SaslContext
	SaslContext as PVOID
end type

type SecPkgContext_SaslContext as _SecPkgContext_SaslContext
type PSecPkgContext_SaslContext as _SecPkgContext_SaslContext ptr

#define SECPKG_ATTR_THUNK_ALL &h00010000
#define SECURITY_USER_DATA_DEFINED

type _SECURITY_USER_DATA
	UserName as SECURITY_STRING
	LogonDomainName as SECURITY_STRING
	LogonServer as SECURITY_STRING
	pSid as PSID
end type

type SECURITY_USER_DATA as _SECURITY_USER_DATA
type PSECURITY_USER_DATA as _SECURITY_USER_DATA ptr
type SecurityUserData as SECURITY_USER_DATA
type PSecurityUserData as SECURITY_USER_DATA ptr

#define UNDERSTANDS_LONG_NAMES 1
#define NO_LONG_NAMES 2

'' TODO: typedef NTSTATUS (NTAPI LSA_IMPERSONATE_CLIENT)(VOID);
'' TODO: typedef NTSTATUS (NTAPI LSA_UNLOAD_PACKAGE)(VOID);
'' TODO: typedef NTSTATUS (NTAPI LSA_DUPLICATE_HANDLE)(HANDLE SourceHandle,PHANDLE DestionationHandle);
'' TODO: typedef NTSTATUS (NTAPI LSA_SAVE_SUPPLEMENTAL_CREDENTIALS)(PLUID LogonId,ULONG SupplementalCredSize,PVOID SupplementalCreds,BOOLEAN Synchronous);
'' TODO: typedef HANDLE (NTAPI LSA_CREATE_THREAD)(SEC_ATTRS SecurityAttributes,ULONG StackSize,SEC_THREAD_START StartFunction,PVOID ThreadParameter,ULONG CreationFlags,PULONG ThreadId);
'' TODO: typedef NTSTATUS (NTAPI LSA_GET_CLIENT_INFO)(PSECPKG_CLIENT_INFO ClientInfo);
'' TODO: typedef HANDLE (NTAPI LSA_REGISTER_NOTIFICATION)(SEC_THREAD_START StartFunction,PVOID Parameter,ULONG NotificationType,ULONG NotificationClass,ULONG NotificationFlags,ULONG IntervalMinutes,HANDLE WaitEvent);
'' TODO: typedef NTSTATUS (NTAPI LSA_CANCEL_NOTIFICATION)(HANDLE NotifyHandle);
'' TODO: typedef NTSTATUS (NTAPI LSA_MAP_BUFFER)(PSecBuffer InputBuffer,PSecBuffer OutputBuffer);
'' TODO: typedef NTSTATUS (NTAPI LSA_CREATE_TOKEN)(PLUID LogonId,PTOKEN_SOURCE TokenSource,SECURITY_LOGON_TYPE LogonType,SECURITY_IMPERSONATION_LEVEL ImpersonationLevel,LSA_TOKEN_INFORMATION_TYPE TokenInformationType,PVOID TokenInformation,PTOKEN_GROUPS TokenGroups,PUNICODE_STRING AccountName,PUNICODE_STRING AuthorityName,PUNICODE_STRING Workstation,PUNICODE_STRING ProfilePath,PHANDLE Token,PNTSTATUS SubStatus);

type _SECPKG_SESSIONINFO_TYPE as long
enum
	SecSessionPrimaryCred
end enum

type SECPKG_SESSIONINFO_TYPE as _SECPKG_SESSIONINFO_TYPE

'' TODO: typedef NTSTATUS (NTAPI LSA_CREATE_TOKEN_EX)(PLUID LogonId,PTOKEN_SOURCE TokenSource,SECURITY_LOGON_TYPE LogonType,SECURITY_IMPERSONATION_LEVEL ImpersonationLevel,LSA_TOKEN_INFORMATION_TYPE TokenInformationType,PVOID TokenInformation,PTOKEN_GROUPS TokenGroups,PUNICODE_STRING Workstation,PUNICODE_STRING ProfilePath,PVOID SessionInformation,SECPKG_SESSIONINFO_TYPE SessionInformationType,PHANDLE Token,PNTSTATUS SubStatus);
'' TODO: typedef VOID (NTAPI LSA_AUDIT_LOGON)(NTSTATUS Status,NTSTATUS SubStatus,PUNICODE_STRING AccountName,PUNICODE_STRING AuthenticatingAuthority,PUNICODE_STRING WorkstationName,PSID UserSid,SECURITY_LOGON_TYPE LogonType,PTOKEN_SOURCE TokenSource,PLUID LogonId);
'' TODO: typedef NTSTATUS (NTAPI LSA_CALL_PACKAGE)(PUNICODE_STRING AuthenticationPackage,PVOID ProtocolSubmitBuffer,ULONG SubmitBufferLength,PVOID *ProtocolReturnBuffer,PULONG ReturnBufferLength,PNTSTATUS ProtocolStatus);
'' TODO: typedef NTSTATUS (NTAPI LSA_CALL_PACKAGEEX)(PUNICODE_STRING AuthenticationPackage,PVOID ClientBufferBase,PVOID ProtocolSubmitBuffer,ULONG SubmitBufferLength,PVOID *ProtocolReturnBuffer,PULONG ReturnBufferLength,PNTSTATUS ProtocolStatus);
'' TODO: typedef NTSTATUS (NTAPI LSA_CALL_PACKAGE_PASSTHROUGH)(PUNICODE_STRING AuthenticationPackage,PVOID ClientBufferBase,PVOID ProtocolSubmitBuffer,ULONG SubmitBufferLength,PVOID *ProtocolReturnBuffer,PULONG ReturnBufferLength,PNTSTATUS ProtocolStatus);
'' TODO: typedef BOOLEAN (NTAPI LSA_GET_CALL_INFO)(PSECPKG_CALL_INFO Info);
'' TODO: typedef PVOID (NTAPI LSA_CREATE_SHARED_MEMORY)(ULONG MaxSize,ULONG InitialSize);
'' TODO: typedef PVOID (NTAPI LSA_ALLOCATE_SHARED_MEMORY)(PVOID SharedMem,ULONG Size);
'' TODO: typedef VOID (NTAPI LSA_FREE_SHARED_MEMORY)(PVOID SharedMem,PVOID Memory);
'' TODO: typedef BOOLEAN (NTAPI LSA_DELETE_SHARED_MEMORY)(PVOID SharedMem);

type _SECPKG_NAME_TYPE as long
enum
	SecNameSamCompatible
	SecNameAlternateId
	SecNameFlat
	SecNameDN
	SecNameSPN
end enum

type SECPKG_NAME_TYPE as _SECPKG_NAME_TYPE

'' TODO: typedef NTSTATUS (NTAPI LSA_OPEN_SAM_USER)(PSECURITY_STRING Name,SECPKG_NAME_TYPE NameType,PSECURITY_STRING Prefix,BOOLEAN AllowGuest,ULONG Reserved,PVOID *UserHandle);
'' TODO: typedef NTSTATUS (NTAPI LSA_GET_USER_CREDENTIALS)(PVOID UserHandle,PVOID *PrimaryCreds,PULONG PrimaryCredsSize,PVOID *SupplementalCreds,PULONG SupplementalCredsSize);
'' TODO: typedef NTSTATUS (NTAPI LSA_GET_USER_AUTH_DATA)(PVOID UserHandle,PUCHAR *UserAuthData,PULONG UserAuthDataSize);
'' TODO: typedef NTSTATUS (NTAPI LSA_CLOSE_SAM_USER)(PVOID UserHandle);
'' TODO: typedef NTSTATUS (NTAPI LSA_GET_AUTH_DATA_FOR_USER)(PSECURITY_STRING Name,SECPKG_NAME_TYPE NameType,PSECURITY_STRING Prefix,PUCHAR *UserAuthData,PULONG UserAuthDataSize,PUNICODE_STRING UserFlatName);
'' TODO: typedef NTSTATUS (NTAPI LSA_CONVERT_AUTH_DATA_TO_TOKEN)(PVOID UserAuthData,ULONG UserAuthDataSize,SECURITY_IMPERSONATION_LEVEL ImpersonationLevel,PTOKEN_SOURCE TokenSource,SECURITY_LOGON_TYPE LogonType,PUNICODE_STRING AuthorityName,PHANDLE Token,PLUID LogonId,PUNICODE_STRING AccountName,PNTSTATUS SubStatus);
'' TODO: typedef NTSTATUS (NTAPI LSA_CRACK_SINGLE_NAME)(ULONG FormatOffered,BOOLEAN PerformAtGC,PUNICODE_STRING NameInput,PUNICODE_STRING Prefix,ULONG RequestedFormat,PUNICODE_STRING CrackedName,PUNICODE_STRING DnsDomainName,PULONG SubStatus);
'' TODO: typedef NTSTATUS (NTAPI LSA_AUDIT_ACCOUNT_LOGON)(ULONG AuditId,BOOLEAN Success,PUNICODE_STRING Source,PUNICODE_STRING ClientName,PUNICODE_STRING MappedName,NTSTATUS Status);
'' TODO: typedef NTSTATUS (NTAPI LSA_CLIENT_CALLBACK)(PCHAR Callback,ULONG_PTR Argument1,ULONG_PTR Argument2,PSecBuffer Input,PSecBuffer Output);
'' TODO: typedef NTSTATUS (NTAPI LSA_REGISTER_CALLBACK)(ULONG CallbackId,PLSA_CALLBACK_FUNCTION Callback);

#define NOTIFIER_FLAG_NEW_THREAD &h00000001
#define NOTIFIER_FLAG_ONE_SHOT &h00000002
#define NOTIFIER_FLAG_SECONDS &h80000000
#define NOTIFIER_TYPE_INTERVAL 1
#define NOTIFIER_TYPE_HANDLE_WAIT 2
#define NOTIFIER_TYPE_STATE_CHANGE 3
#define NOTIFIER_TYPE_NOTIFY_EVENT 4
#define NOTIFIER_TYPE_IMMEDIATE 16
#define NOTIFY_CLASS_PACKAGE_CHANGE 1
#define NOTIFY_CLASS_ROLE_CHANGE 2
#define NOTIFY_CLASS_DOMAIN_CHANGE 3
#define NOTIFY_CLASS_REGISTRY_CHANGE 4

type _SECPKG_EVENT_PACKAGE_CHANGE
	ChangeType as ULONG
	PackageId as LSA_SEC_HANDLE
	PackageName as SECURITY_STRING
end type

type SECPKG_EVENT_PACKAGE_CHANGE as _SECPKG_EVENT_PACKAGE_CHANGE
type PSECPKG_EVENT_PACKAGE_CHANGE as _SECPKG_EVENT_PACKAGE_CHANGE ptr

#define SECPKG_PACKAGE_CHANGE_LOAD 0
#define SECPKG_PACKAGE_CHANGE_UNLOAD 1
#define SECPKG_PACKAGE_CHANGE_SELECT 2

type _SECPKG_EVENT_ROLE_CHANGE
	PreviousRole as ULONG
	NewRole as ULONG
end type

type SECPKG_EVENT_ROLE_CHANGE as _SECPKG_EVENT_ROLE_CHANGE
type PSECPKG_EVENT_ROLE_CHANGE as _SECPKG_EVENT_ROLE_CHANGE ptr
type SECPKG_EVENT_DOMAIN_CHANGE as _SECPKG_PARAMETERS
type PSECPKG_EVENT_DOMAIN_CHANGE as _SECPKG_PARAMETERS ptr

type _SECPKG_EVENT_NOTIFY
	EventClass as ULONG
	Reserved as ULONG
	EventDataSize as ULONG
	EventData as PVOID
	PackageParameter as PVOID
end type

type SECPKG_EVENT_NOTIFY as _SECPKG_EVENT_NOTIFY
type PSECPKG_EVENT_NOTIFY as _SECPKG_EVENT_NOTIFY ptr

'' TODO: typedef NTSTATUS (NTAPI LSA_UPDATE_PRIMARY_CREDENTIALS)(PSECPKG_PRIMARY_CRED PrimaryCredentials,PSECPKG_SUPPLEMENTAL_CRED_ARRAY Credentials);
'' TODO: typedef VOID (NTAPI LSA_PROTECT_MEMORY)(PVOID Buffer,ULONG BufferSize);
'' TODO: typedef NTSTATUS (NTAPI LSA_OPEN_TOKEN_BY_LOGON_ID)(PLUID LogonId,HANDLE *RetTokenHandle);
'' TODO: typedef NTSTATUS (NTAPI LSA_EXPAND_AUTH_DATA_FOR_DOMAIN)(PUCHAR UserAuthData,ULONG UserAuthDataSize,PVOID Reserved,PUCHAR *ExpandedAuthData,PULONG ExpandedAuthDataSize);

type PLSA_IMPERSONATE_CLIENT as LSA_IMPERSONATE_CLIENT ptr
type PLSA_UNLOAD_PACKAGE as LSA_UNLOAD_PACKAGE ptr
type PLSA_DUPLICATE_HANDLE as LSA_DUPLICATE_HANDLE ptr
type PLSA_SAVE_SUPPLEMENTAL_CREDENTIALS as LSA_SAVE_SUPPLEMENTAL_CREDENTIALS ptr
type PLSA_CREATE_THREAD as LSA_CREATE_THREAD ptr
type PLSA_GET_CLIENT_INFO as LSA_GET_CLIENT_INFO ptr
type PLSA_REGISTER_NOTIFICATION as LSA_REGISTER_NOTIFICATION ptr
type PLSA_CANCEL_NOTIFICATION as LSA_CANCEL_NOTIFICATION ptr
type PLSA_MAP_BUFFER as LSA_MAP_BUFFER ptr
type PLSA_CREATE_TOKEN as LSA_CREATE_TOKEN ptr
type PLSA_AUDIT_LOGON as LSA_AUDIT_LOGON ptr
type PLSA_CALL_PACKAGE as LSA_CALL_PACKAGE ptr
type PLSA_CALL_PACKAGEEX as LSA_CALL_PACKAGEEX ptr
type PLSA_GET_CALL_INFO as LSA_GET_CALL_INFO ptr
type PLSA_CREATE_SHARED_MEMORY as LSA_CREATE_SHARED_MEMORY ptr
type PLSA_ALLOCATE_SHARED_MEMORY as LSA_ALLOCATE_SHARED_MEMORY ptr
type PLSA_FREE_SHARED_MEMORY as LSA_FREE_SHARED_MEMORY ptr
type PLSA_DELETE_SHARED_MEMORY as LSA_DELETE_SHARED_MEMORY ptr
type PLSA_OPEN_SAM_USER as LSA_OPEN_SAM_USER ptr
type PLSA_GET_USER_CREDENTIALS as LSA_GET_USER_CREDENTIALS ptr
type PLSA_GET_USER_AUTH_DATA as LSA_GET_USER_AUTH_DATA ptr
type PLSA_CLOSE_SAM_USER as LSA_CLOSE_SAM_USER ptr
type PLSA_CONVERT_AUTH_DATA_TO_TOKEN as LSA_CONVERT_AUTH_DATA_TO_TOKEN ptr
type PLSA_CLIENT_CALLBACK as LSA_CLIENT_CALLBACK ptr
type PLSA_REGISTER_CALLBACK as LSA_REGISTER_CALLBACK ptr
type PLSA_UPDATE_PRIMARY_CREDENTIALS as LSA_UPDATE_PRIMARY_CREDENTIALS ptr
type PLSA_GET_AUTH_DATA_FOR_USER as LSA_GET_AUTH_DATA_FOR_USER ptr
type PLSA_CRACK_SINGLE_NAME as LSA_CRACK_SINGLE_NAME ptr
type PLSA_AUDIT_ACCOUNT_LOGON as LSA_AUDIT_ACCOUNT_LOGON ptr
type PLSA_CALL_PACKAGE_PASSTHROUGH as LSA_CALL_PACKAGE_PASSTHROUGH ptr
type PLSA_PROTECT_MEMORY as LSA_PROTECT_MEMORY ptr
type PLSA_OPEN_TOKEN_BY_LOGON_ID as LSA_OPEN_TOKEN_BY_LOGON_ID ptr
type PLSA_EXPAND_AUTH_DATA_FOR_DOMAIN as LSA_EXPAND_AUTH_DATA_FOR_DOMAIN ptr
type PLSA_CREATE_TOKEN_EX as LSA_CREATE_TOKEN_EX ptr

type _SEC_WINNT_AUTH_IDENTITY32
	User as ULONG
	UserLength as ULONG
	Domain as ULONG
	DomainLength as ULONG
	Password as ULONG
	PasswordLength as ULONG
	Flags as ULONG
end type

type SEC_WINNT_AUTH_IDENTITY32 as _SEC_WINNT_AUTH_IDENTITY32
type PSEC_WINNT_AUTH_IDENTITY32 as _SEC_WINNT_AUTH_IDENTITY32 ptr

type _SEC_WINNT_AUTH_IDENTITY_EX32
	Version as ULONG
	Length as ULONG
	User as ULONG
	UserLength as ULONG
	Domain as ULONG
	DomainLength as ULONG
	Password as ULONG
	PasswordLength as ULONG
	Flags as ULONG
	PackageList as ULONG
	PackageListLength as ULONG
end type

type SEC_WINNT_AUTH_IDENTITY_EX32 as _SEC_WINNT_AUTH_IDENTITY_EX32
type PSEC_WINNT_AUTH_IDENTITY_EX32 as _SEC_WINNT_AUTH_IDENTITY_EX32 ptr

type _LSA_SECPKG_FUNCTION_TABLE
	CreateLogonSession as PLSA_CREATE_LOGON_SESSION
	DeleteLogonSession as PLSA_DELETE_LOGON_SESSION
	AddCredential as PLSA_ADD_CREDENTIAL
	GetCredentials as PLSA_GET_CREDENTIALS
	DeleteCredential as PLSA_DELETE_CREDENTIAL
	AllocateLsaHeap as PLSA_ALLOCATE_LSA_HEAP
	FreeLsaHeap as PLSA_FREE_LSA_HEAP
	AllocateClientBuffer as PLSA_ALLOCATE_CLIENT_BUFFER
	FreeClientBuffer as PLSA_FREE_CLIENT_BUFFER
	CopyToClientBuffer as PLSA_COPY_TO_CLIENT_BUFFER
	CopyFromClientBuffer as PLSA_COPY_FROM_CLIENT_BUFFER
	ImpersonateClient as PLSA_IMPERSONATE_CLIENT
	UnloadPackage as PLSA_UNLOAD_PACKAGE
	DuplicateHandle as PLSA_DUPLICATE_HANDLE
	SaveSupplementalCredentials as PLSA_SAVE_SUPPLEMENTAL_CREDENTIALS
	CreateThread as PLSA_CREATE_THREAD
	GetClientInfo as PLSA_GET_CLIENT_INFO
	RegisterNotification as PLSA_REGISTER_NOTIFICATION
	CancelNotification as PLSA_CANCEL_NOTIFICATION
	MapBuffer as PLSA_MAP_BUFFER
	CreateToken as PLSA_CREATE_TOKEN
	AuditLogon as PLSA_AUDIT_LOGON
	CallPackage as PLSA_CALL_PACKAGE
	FreeReturnBuffer as PLSA_FREE_LSA_HEAP
	GetCallInfo as PLSA_GET_CALL_INFO
	CallPackageEx as PLSA_CALL_PACKAGEEX
	CreateSharedMemory as PLSA_CREATE_SHARED_MEMORY
	AllocateSharedMemory as PLSA_ALLOCATE_SHARED_MEMORY
	FreeSharedMemory as PLSA_FREE_SHARED_MEMORY
	DeleteSharedMemory as PLSA_DELETE_SHARED_MEMORY
	OpenSamUser as PLSA_OPEN_SAM_USER
	GetUserCredentials as PLSA_GET_USER_CREDENTIALS
	GetUserAuthData as PLSA_GET_USER_AUTH_DATA
	CloseSamUser as PLSA_CLOSE_SAM_USER
	ConvertAuthDataToToken as PLSA_CONVERT_AUTH_DATA_TO_TOKEN
	ClientCallback as PLSA_CLIENT_CALLBACK
	UpdateCredentials as PLSA_UPDATE_PRIMARY_CREDENTIALS
	GetAuthDataForUser as PLSA_GET_AUTH_DATA_FOR_USER
	CrackSingleName as PLSA_CRACK_SINGLE_NAME
	AuditAccountLogon as PLSA_AUDIT_ACCOUNT_LOGON
	CallPackagePassthrough as PLSA_CALL_PACKAGE_PASSTHROUGH
	DummyFunction1 as PLSA_PROTECT_MEMORY
	DummyFunction2 as PLSA_PROTECT_MEMORY
	DummyFunction3 as PLSA_PROTECT_MEMORY
	LsaProtectMemory as PLSA_PROTECT_MEMORY
	LsaUnprotectMemory as PLSA_PROTECT_MEMORY
	OpenTokenByLogonId as PLSA_OPEN_TOKEN_BY_LOGON_ID
	ExpandAuthDataForDomain as PLSA_EXPAND_AUTH_DATA_FOR_DOMAIN
	AllocatePrivateHeap as PLSA_ALLOCATE_PRIVATE_HEAP
	FreePrivateHeap as PLSA_FREE_PRIVATE_HEAP
	CreateTokenEx as PLSA_CREATE_TOKEN_EX
	DummyFunction4 as PLSA_PROTECT_MEMORY
end type

type LSA_SECPKG_FUNCTION_TABLE as _LSA_SECPKG_FUNCTION_TABLE
type PLSA_SECPKG_FUNCTION_TABLE as _LSA_SECPKG_FUNCTION_TABLE ptr

type _SECPKG_DLL_FUNCTIONS
	AllocateHeap as PLSA_ALLOCATE_LSA_HEAP
	FreeHeap as PLSA_FREE_LSA_HEAP
	RegisterCallback as PLSA_REGISTER_CALLBACK
end type

type SECPKG_DLL_FUNCTIONS as _SECPKG_DLL_FUNCTIONS
type PSECPKG_DLL_FUNCTIONS as _SECPKG_DLL_FUNCTIONS ptr

'' TODO: typedef NTSTATUS (NTAPI SpInitializeFn)(ULONG_PTR PackageId,PSECPKG_PARAMETERS Parameters,PLSA_SECPKG_FUNCTION_TABLE FunctionTable);
'' TODO: typedef NTSTATUS (NTAPI SpShutdownFn)(VOID);
'' TODO: typedef NTSTATUS (NTAPI SpGetInfoFn)(PSecPkgInfo PackageInfo);
'' TODO: typedef NTSTATUS (NTAPI SpGetExtendedInformationFn)(SECPKG_EXTENDED_INFORMATION_CLASS Class,PSECPKG_EXTENDED_INFORMATION *ppInformation);
'' TODO: typedef NTSTATUS (NTAPI SpSetExtendedInformationFn)(SECPKG_EXTENDED_INFORMATION_CLASS Class,PSECPKG_EXTENDED_INFORMATION Info);

type PLSA_AP_LOGON_USER_EX2 as function(byval ClientRequest as PLSA_CLIENT_REQUEST, byval LogonType as SECURITY_LOGON_TYPE, byval AuthenticationInformation as PVOID, byval ClientAuthenticationBase as PVOID, byval AuthenticationInformationLength as ULONG, byval ProfileBuffer as PVOID ptr, byval ProfileBufferLength as PULONG, byval LogonId as PLUID, byval SubStatus as PNTSTATUS, byval TokenInformationType as PLSA_TOKEN_INFORMATION_TYPE, byval TokenInformation as PVOID ptr, byval AccountName as PUNICODE_STRING ptr, byval AuthenticatingAuthority as PUNICODE_STRING ptr, byval MachineName as PUNICODE_STRING ptr, byval PrimaryCredentials as PSECPKG_PRIMARY_CRED, byval CachedCredentials as PSECPKG_SUPPLEMENTAL_CRED_ARRAY ptr) as NTSTATUS

#define LSA_AP_NAME_LOGON_USER_EX2 !"LsaApLogonUserEx2\0"

'' TODO: typedef NTSTATUS (NTAPI SpAcceptCredentialsFn)(SECURITY_LOGON_TYPE LogonType,PUNICODE_STRING AccountName,PSECPKG_PRIMARY_CRED PrimaryCredentials,PSECPKG_SUPPLEMENTAL_CRED SupplementalCredentials);

#define SP_ACCEPT_CREDENTIALS_NAME !"SpAcceptCredentials\0"

'' TODO: typedef NTSTATUS (NTAPI SpAcquireCredentialsHandleFn)(PUNICODE_STRING PrincipalName,ULONG CredentialUseFlags,PLUID LogonId,PVOID AuthorizationData,PVOID GetKeyFunciton,PVOID GetKeyArgument,PLSA_SEC_HANDLE CredentialHandle,PTimeStamp ExpirationTime);
'' TODO: typedef NTSTATUS (NTAPI SpFreeCredentialsHandleFn)(LSA_SEC_HANDLE CredentialHandle);
'' TODO: typedef NTSTATUS (NTAPI SpQueryCredentialsAttributesFn)(LSA_SEC_HANDLE CredentialHandle,ULONG CredentialAttribute,PVOID Buffer);
'' TODO: typedef NTSTATUS (NTAPI SpSetCredentialsAttributesFn)(LSA_SEC_HANDLE CredentialHandle,ULONG CredentialAttribute,PVOID Buffer,ULONG BufferSize);
'' TODO: typedef NTSTATUS (NTAPI SpAddCredentialsFn)(LSA_SEC_HANDLE CredentialHandle,PUNICODE_STRING PrincipalName,PUNICODE_STRING Package,ULONG CredentialUseFlags,PVOID AuthorizationData,PVOID GetKeyFunciton,PVOID GetKeyArgument,PTimeStamp ExpirationTime);
'' TODO: typedef NTSTATUS (NTAPI SpSaveCredentialsFn)(LSA_SEC_HANDLE CredentialHandle,PSecBuffer Credentials);
'' TODO: typedef NTSTATUS (NTAPI SpGetCredentialsFn)(LSA_SEC_HANDLE CredentialHandle,PSecBuffer Credentials);
'' TODO: typedef NTSTATUS (NTAPI SpDeleteCredentialsFn)(LSA_SEC_HANDLE CredentialHandle,PSecBuffer Key);
'' TODO: typedef NTSTATUS (NTAPI SpInitLsaModeContextFn)(LSA_SEC_HANDLE CredentialHandle,LSA_SEC_HANDLE ContextHandle,PUNICODE_STRING TargetName,ULONG ContextRequirements,ULONG TargetDataRep,PSecBufferDesc InputBuffers,PLSA_SEC_HANDLE NewContextHandle,PSecBufferDesc OutputBuffers,PULONG ContextAttributes,PTimeStamp ExpirationTime,PBOOLEAN MappedContext,PSecBuffer ContextData);
'' TODO: typedef NTSTATUS (NTAPI SpDeleteContextFn)(LSA_SEC_HANDLE ContextHandle);
'' TODO: typedef NTSTATUS (NTAPI SpApplyControlTokenFn)(LSA_SEC_HANDLE ContextHandle,PSecBufferDesc ControlToken);
'' TODO: typedef NTSTATUS (NTAPI SpAcceptLsaModeContextFn)(LSA_SEC_HANDLE CredentialHandle,LSA_SEC_HANDLE ContextHandle,PSecBufferDesc InputBuffer,ULONG ContextRequirements,ULONG TargetDataRep,PLSA_SEC_HANDLE NewContextHandle,PSecBufferDesc OutputBuffer,PULONG ContextAttributes,PTimeStamp ExpirationTime,PBOOLEAN MappedContext,PSecBuffer ContextData);
'' TODO: typedef NTSTATUS (NTAPI SpGetUserInfoFn)(PLUID LogonId,ULONG Flags,PSecurityUserData *UserData);
'' TODO: typedef NTSTATUS (NTAPI SpQueryContextAttributesFn)(LSA_SEC_HANDLE ContextHandle,ULONG ContextAttribute,PVOID Buffer);
'' TODO: typedef NTSTATUS (NTAPI SpSetContextAttributesFn)(LSA_SEC_HANDLE ContextHandle,ULONG ContextAttribute,PVOID Buffer,ULONG BufferSize);

type _SECPKG_FUNCTION_TABLE
	InitializePackage as PLSA_AP_INITIALIZE_PACKAGE
	LogonUser as PLSA_AP_LOGON_USER
	CallPackage as PLSA_AP_CALL_PACKAGE
	LogonTerminated as PLSA_AP_LOGON_TERMINATED
	CallPackageUntrusted as PLSA_AP_CALL_PACKAGE_UNTRUSTED
	CallPackagePassthrough as PLSA_AP_CALL_PACKAGE_PASSTHROUGH
	LogonUserEx as PLSA_AP_LOGON_USER_EX
	LogonUserEx2 as PLSA_AP_LOGON_USER_EX2
	Initialize as SpInitializeFn ptr
	Shutdown as SpShutdownFn ptr
	GetInfo as SpGetInfoFn ptr
	AcceptCredentials as SpAcceptCredentialsFn ptr
	AcquireCredentialsHandle as SpAcquireCredentialsHandleFn ptr
	QueryCredentialsAttributes as SpQueryCredentialsAttributesFn ptr
	FreeCredentialsHandle as SpFreeCredentialsHandleFn ptr
	SaveCredentials as SpSaveCredentialsFn ptr
	GetCredentials as SpGetCredentialsFn ptr
	DeleteCredentials as SpDeleteCredentialsFn ptr
	InitLsaModeContext as SpInitLsaModeContextFn ptr
	AcceptLsaModeContext as SpAcceptLsaModeContextFn ptr
	DeleteContext as SpDeleteContextFn ptr
	ApplyControlToken as SpApplyControlTokenFn ptr
	GetUserInfo as SpGetUserInfoFn ptr
	GetExtendedInformation as SpGetExtendedInformationFn ptr
	QueryContextAttributes as SpQueryContextAttributesFn ptr
	AddCredentials as SpAddCredentialsFn ptr
	SetExtendedInformation as SpSetExtendedInformationFn ptr
	SetContextAttributes as SpSetContextAttributesFn ptr
	SetCredentialsAttributes as SpSetCredentialsAttributesFn ptr
end type

type SECPKG_FUNCTION_TABLE as _SECPKG_FUNCTION_TABLE
type PSECPKG_FUNCTION_TABLE as _SECPKG_FUNCTION_TABLE ptr

'' TODO: typedef NTSTATUS (NTAPI SpInstanceInitFn)(ULONG Version,PSECPKG_DLL_FUNCTIONS FunctionTable,PVOID *UserFunctions);
'' TODO: typedef NTSTATUS (NTAPI SpInitUserModeContextFn)(LSA_SEC_HANDLE ContextHandle,PSecBuffer PackedContext);
'' TODO: typedef NTSTATUS (NTAPI SpMakeSignatureFn)(LSA_SEC_HANDLE ContextHandle,ULONG QualityOfProtection,PSecBufferDesc MessageBuffers,ULONG MessageSequenceNumber);
'' TODO: typedef NTSTATUS (NTAPI SpVerifySignatureFn)(LSA_SEC_HANDLE ContextHandle,PSecBufferDesc MessageBuffers,ULONG MessageSequenceNumber,PULONG QualityOfProtection);
'' TODO: typedef NTSTATUS (NTAPI SpSealMessageFn)(LSA_SEC_HANDLE ContextHandle,ULONG QualityOfProtection,PSecBufferDesc MessageBuffers,ULONG MessageSequenceNumber);
'' TODO: typedef NTSTATUS (NTAPI SpUnsealMessageFn)(LSA_SEC_HANDLE ContextHandle,PSecBufferDesc MessageBuffers,ULONG MessageSequenceNumber,PULONG QualityOfProtection);
'' TODO: typedef NTSTATUS (NTAPI SpGetContextTokenFn)(LSA_SEC_HANDLE ContextHandle,PHANDLE ImpersonationToken);
'' TODO: typedef NTSTATUS (NTAPI SpExportSecurityContextFn)(LSA_SEC_HANDLE phContext,ULONG fFlags,PSecBuffer pPackedContext,PHANDLE pToken);
'' TODO: typedef NTSTATUS (NTAPI SpImportSecurityContextFn)(PSecBuffer pPackedContext,HANDLE Token,PLSA_SEC_HANDLE phContext);
'' TODO: typedef NTSTATUS (NTAPI SpCompleteAuthTokenFn)(LSA_SEC_HANDLE ContextHandle,PSecBufferDesc InputBuffer);
'' TODO: typedef NTSTATUS (NTAPI SpFormatCredentialsFn)(PSecBuffer Credentials,PSecBuffer FormattedCredentials);
'' TODO: typedef NTSTATUS (NTAPI SpMarshallSupplementalCredsFn)(ULONG CredentialSize,PUCHAR Credentials,PULONG MarshalledCredSize,PVOID *MarshalledCreds);

type _SECPKG_USER_FUNCTION_TABLE
	InstanceInit as SpInstanceInitFn ptr
	InitUserModeContext as SpInitUserModeContextFn ptr
	MakeSignature as SpMakeSignatureFn ptr
	VerifySignature as SpVerifySignatureFn ptr
	SealMessage as SpSealMessageFn ptr
	UnsealMessage as SpUnsealMessageFn ptr
	GetContextToken as SpGetContextTokenFn ptr
	QueryContextAttributes as SpQueryContextAttributesFn ptr
	CompleteAuthToken as SpCompleteAuthTokenFn ptr
	DeleteUserModeContext as SpDeleteContextFn ptr
	FormatCredentials as SpFormatCredentialsFn ptr
	MarshallSupplementalCreds as SpMarshallSupplementalCredsFn ptr
	ExportContext as SpExportSecurityContextFn ptr
	ImportContext as SpImportSecurityContextFn ptr
end type

type SECPKG_USER_FUNCTION_TABLE as _SECPKG_USER_FUNCTION_TABLE
type PSECPKG_USER_FUNCTION_TABLE as _SECPKG_USER_FUNCTION_TABLE ptr

'' TODO: typedef NTSTATUS (SEC_ENTRY *SpLsaModeInitializeFn)(ULONG LsaVersion,PULONG PackageVersion,PSECPKG_FUNCTION_TABLE *ppTables,PULONG pcTables);
'' TODO: typedef NTSTATUS (SEC_ENTRY *SpUserModeInitializeFn)(ULONG LsaVersion,PULONG PackageVersion,PSECPKG_USER_FUNCTION_TABLE *ppTables,PULONG pcTables);

#define SECPKG_LSAMODEINIT_NAME "SpLsaModeInitialize"
#define SECPKG_USERMODEINIT_NAME "SpUserModeInitialize"
#define SECPKG_INTERFACE_VERSION &h00010000
#define SECPKG_INTERFACE_VERSION_2 &h00020000
#define SECPKG_INTERFACE_VERSION_3 &h00040000

type _KSEC_CONTEXT_TYPE as long
enum
	KSecPaged
	KSecNonPaged
end enum

type KSEC_CONTEXT_TYPE as _KSEC_CONTEXT_TYPE

type _KSEC_LIST_ENTRY
	List as LIST_ENTRY
	RefCount as LONG
	Signature as ULONG
	OwningList as PVOID
	Reserved as PVOID
end type

type KSEC_LIST_ENTRY as _KSEC_LIST_ENTRY
type PKSEC_LIST_ENTRY as _KSEC_LIST_ENTRY ptr

'' TODO: #define KsecInitializeListEntry(Entry,SigValue) ((PKSEC_LIST_ENTRY) Entry)->List.Flink = ((PKSEC_LIST_ENTRY) Entry)->List.Blink = NULL; ((PKSEC_LIST_ENTRY) Entry)->RefCount = 1; ((PKSEC_LIST_ENTRY) Entry)->Signature = SigValue; ((PKSEC_LIST_ENTRY) Entry)->OwningList = NULL; ((PKSEC_LIST_ENTRY) Entry)->Reserved = NULL;
'' TODO: typedef PVOID (SEC_ENTRY KSEC_CREATE_CONTEXT_LIST)(KSEC_CONTEXT_TYPE Type);
'' TODO: typedef VOID (SEC_ENTRY KSEC_INSERT_LIST_ENTRY)(PVOID List,PKSEC_LIST_ENTRY Entry);
'' TODO: typedef NTSTATUS (SEC_ENTRY KSEC_REFERENCE_LIST_ENTRY)(PKSEC_LIST_ENTRY Entry,ULONG Signature,BOOLEAN RemoveNoRef);
'' TODO: typedef VOID (SEC_ENTRY KSEC_DEREFERENCE_LIST_ENTRY)(PKSEC_LIST_ENTRY Entry,BOOLEAN *Delete);
'' TODO: typedef NTSTATUS (SEC_ENTRY KSEC_SERIALIZE_WINNT_AUTH_DATA)(PVOID pvAuthData,PULONG Size,PVOID *SerializedData);
'' TODO: typedef NTSTATUS (SEC_ENTRY KSEC_SERIALIZE_SCHANNEL_AUTH_DATA)(PVOID pvAuthData,PULONG Size,PVOID *SerializedData);

extern     KSecCreateContextList as KSEC_CREATE_CONTEXT_LIST
dim shared KSecCreateContextList as KSEC_CREATE_CONTEXT_LIST
extern     KSecInsertListEntry as KSEC_INSERT_LIST_ENTRY
dim shared KSecInsertListEntry as KSEC_INSERT_LIST_ENTRY
extern     KSecReferenceListEntry as KSEC_REFERENCE_LIST_ENTRY
dim shared KSecReferenceListEntry as KSEC_REFERENCE_LIST_ENTRY
extern     KSecDereferenceListEntry as KSEC_DEREFERENCE_LIST_ENTRY
dim shared KSecDereferenceListEntry as KSEC_DEREFERENCE_LIST_ENTRY
extern     KSecSerializeWinntAuthData as KSEC_SERIALIZE_WINNT_AUTH_DATA
dim shared KSecSerializeWinntAuthData as KSEC_SERIALIZE_WINNT_AUTH_DATA
extern     KSecSerializeSchannelAuthData as KSEC_SERIALIZE_SCHANNEL_AUTH_DATA
dim shared KSecSerializeSchannelAuthData as KSEC_SERIALIZE_SCHANNEL_AUTH_DATA

type PKSEC_CREATE_CONTEXT_LIST as KSEC_CREATE_CONTEXT_LIST ptr
type PKSEC_INSERT_LIST_ENTRY as KSEC_INSERT_LIST_ENTRY ptr
type PKSEC_REFERENCE_LIST_ENTRY as KSEC_REFERENCE_LIST_ENTRY ptr
type PKSEC_DEREFERENCE_LIST_ENTRY as KSEC_DEREFERENCE_LIST_ENTRY ptr
type PKSEC_SERIALIZE_WINNT_AUTH_DATA as KSEC_SERIALIZE_WINNT_AUTH_DATA ptr
type PKSEC_SERIALIZE_SCHANNEL_AUTH_DATA as KSEC_SERIALIZE_SCHANNEL_AUTH_DATA ptr

type _SECPKG_KERNEL_FUNCTIONS
	AllocateHeap as PLSA_ALLOCATE_LSA_HEAP
	FreeHeap as PLSA_FREE_LSA_HEAP
	CreateContextList as PKSEC_CREATE_CONTEXT_LIST
	InsertListEntry as PKSEC_INSERT_LIST_ENTRY
	ReferenceListEntry as PKSEC_REFERENCE_LIST_ENTRY
	DereferenceListEntry as PKSEC_DEREFERENCE_LIST_ENTRY
	SerializeWinntAuthData as PKSEC_SERIALIZE_WINNT_AUTH_DATA
	SerializeSchannelAuthData as PKSEC_SERIALIZE_SCHANNEL_AUTH_DATA
end type

type SECPKG_KERNEL_FUNCTIONS as _SECPKG_KERNEL_FUNCTIONS
type PSECPKG_KERNEL_FUNCTIONS as _SECPKG_KERNEL_FUNCTIONS ptr

'' TODO: typedef NTSTATUS (NTAPI KspInitPackageFn)(PSECPKG_KERNEL_FUNCTIONS FunctionTable);
'' TODO: typedef NTSTATUS (NTAPI KspDeleteContextFn)(LSA_SEC_HANDLE ContextId,PLSA_SEC_HANDLE LsaContextId);
'' TODO: typedef NTSTATUS (NTAPI KspInitContextFn)(LSA_SEC_HANDLE ContextId,PSecBuffer ContextData,PLSA_SEC_HANDLE NewContextId);
'' TODO: typedef NTSTATUS (NTAPI KspMakeSignatureFn)(LSA_SEC_HANDLE ContextId,ULONG fQOP,PSecBufferDesc Message,ULONG MessageSeqNo);
'' TODO: typedef NTSTATUS (NTAPI KspVerifySignatureFn)(LSA_SEC_HANDLE ContextId,PSecBufferDesc Message,ULONG MessageSeqNo,PULONG pfQOP);
'' TODO: typedef NTSTATUS (NTAPI KspSealMessageFn)(LSA_SEC_HANDLE ContextId,ULONG fQOP,PSecBufferDesc Message,ULONG MessageSeqNo);
'' TODO: typedef NTSTATUS (NTAPI KspUnsealMessageFn)(LSA_SEC_HANDLE ContextId,PSecBufferDesc Message,ULONG MessageSeqNo,PULONG pfQOP);
'' TODO: typedef NTSTATUS (NTAPI KspGetTokenFn)(LSA_SEC_HANDLE ContextId,PHANDLE ImpersonationToken,PACCESS_TOKEN *RawToken);
'' TODO: typedef NTSTATUS (NTAPI KspQueryAttributesFn)(LSA_SEC_HANDLE ContextId,ULONG Attribute,PVOID Buffer);
'' TODO: typedef NTSTATUS (NTAPI KspCompleteTokenFn)(LSA_SEC_HANDLE ContextId,PSecBufferDesc Token);
'' TODO: typedef NTSTATUS (NTAPI KspMapHandleFn)(LSA_SEC_HANDLE ContextId,PLSA_SEC_HANDLE LsaContextId);
'' TODO: typedef NTSTATUS (NTAPI KspSetPagingModeFn)(BOOLEAN PagingMode);
'' TODO: typedef NTSTATUS (NTAPI KspSerializeAuthDataFn)(PVOID pvAuthData,PULONG Size,PVOID *SerializedData);

type _SECPKG_KERNEL_FUNCTION_TABLE
	Initialize as KspInitPackageFn ptr
	DeleteContext as KspDeleteContextFn ptr
	InitContext as KspInitContextFn ptr
	MapHandle as KspMapHandleFn ptr
	Sign as KspMakeSignatureFn ptr
	Verify as KspVerifySignatureFn ptr
	Seal as KspSealMessageFn ptr
	Unseal as KspUnsealMessageFn ptr
	GetToken as KspGetTokenFn ptr
	QueryAttributes as KspQueryAttributesFn ptr
	CompleteToken as KspCompleteTokenFn ptr
	ExportContext as SpExportSecurityContextFn ptr
	ImportContext as SpImportSecurityContextFn ptr
	SetPackagePagingMode as KspSetPagingModeFn ptr
	SerializeAuthData as KspSerializeAuthDataFn ptr
end type

type SECPKG_KERNEL_FUNCTION_TABLE as _SECPKG_KERNEL_FUNCTION_TABLE
type PSECPKG_KERNEL_FUNCTION_TABLE as _SECPKG_KERNEL_FUNCTION_TABLE ptr

extern     SEC_ENTRY as SECURITY_STATUS
dim shared SEC_ENTRY as SECURITY_STATUS

'' TODO: SECURITY_STATUS SEC_ENTRY KSecRegisterSecurityProvider(PSECURITY_STRING ProviderName,PSECPKG_KERNEL_FUNCTION_TABLE Table);

extern KspKernelFunctions as SECPKG_KERNEL_FUNCTIONS

end extern
