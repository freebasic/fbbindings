#pragma once

#include once "_mingw_unicode.bi"
#include once "isguids.bi"

'' The following symbols have been renamed:
''     typedef IURL_SETURL_FLAGS => IURL_SETURL_FLAGS_
''     typedef IURL_INVOKECOMMAND_FLAGS => IURL_INVOKECOMMAND_FLAGS_
''     typedef URLINVOKECOMMANDINFOA => URLINVOKECOMMANDINFOA_
''     typedef URLINVOKECOMMANDINFOW => URLINVOKECOMMANDINFOW_
''     typedef TRANSLATEURL_IN_FLAGS => TRANSLATEURL_IN_FLAGS_
''     typedef URLASSOCIATIONDIALOG_IN_FLAGS => URLASSOCIATIONDIALOG_IN_FLAGS_
''     typedef MIMEASSOCIATIONDIALOG_IN_FLAGS => MIMEASSOCIATIONDIALOG_IN_FLAGS_

#ifdef __FB_64BIT__
	extern "C"
#else
	extern "Windows"
#endif

type IUniformResourceLocatorAVtbl as IUniformResourceLocatorAVtbl_
type IUniformResourceLocatorWVtbl as IUniformResourceLocatorWVtbl_

#define __INTSHCUT_H__
#define E_FLAGS MAKE_SCODE(SEVERITY_ERROR, FACILITY_ITF, &h1000)
#define IS_E_EXEC_FAILED MAKE_SCODE(SEVERITY_ERROR, FACILITY_ITF, &h2002)
#define URL_E_INVALID_SYNTAX MAKE_SCODE(SEVERITY_ERROR, FACILITY_ITF, &h1001)
#define URL_E_UNREGISTERED_PROTOCOL MAKE_SCODE(SEVERITY_ERROR, FACILITY_ITF, &h1002)

type iurl_seturl_flags as long
enum
	IURL_SETURL_FL_GUESS_PROTOCOL = &h0001
	IURL_SETURL_FL_USE_DEFAULT_PROTOCOL = &h0002
end enum

type IURL_SETURL_FLAGS_ as iurl_seturl_flags

type iurl_invokecommand_flags as long
enum
	IURL_INVOKECOMMAND_FL_ALLOW_UI = &h0001
	IURL_INVOKECOMMAND_FL_USE_DEFAULT_VERB = &h0002
	IURL_INVOKECOMMAND_FL_DDEWAIT = &h0004
end enum

type IURL_INVOKECOMMAND_FLAGS_ as iurl_invokecommand_flags

type urlinvokecommandinfoA
	dwcbSize as DWORD
	dwFlags as DWORD
	hwndParent as HWND
	pcszVerb as LPCSTR
end type

type URLINVOKECOMMANDINFOA_ as urlinvokecommandinfoA
type PURLINVOKECOMMANDINFOA as URLINVOKECOMMANDINFOA_ ptr
type CURLINVOKECOMMANDINFOA as const URLINVOKECOMMANDINFOA_
type PCURLINVOKECOMMANDINFOA as const URLINVOKECOMMANDINFOA_ ptr

type urlinvokecommandinfoW
	dwcbSize as DWORD
	dwFlags as DWORD
	hwndParent as HWND
	pcszVerb as LPCWSTR
end type

type URLINVOKECOMMANDINFOW_ as urlinvokecommandinfoW
type PURLINVOKECOMMANDINFOW as URLINVOKECOMMANDINFOW_ ptr
type CURLINVOKECOMMANDINFOW as const URLINVOKECOMMANDINFOW_
type PCURLINVOKECOMMANDINFOW as const URLINVOKECOMMANDINFOW_ ptr

#ifdef UNICODE
	#define URLINVOKECOMMANDINFO URLINVOKECOMMANDINFOW_
	#define PURLINVOKECOMMANDINFO PURLINVOKECOMMANDINFOW
	#define CURLINVOKECOMMANDINFO CURLINVOKECOMMANDINFOW
	#define PCURLINVOKECOMMANDINFO PCURLINVOKECOMMANDINFOW
#else
	#define URLINVOKECOMMANDINFO URLINVOKECOMMANDINFOA_
	#define PURLINVOKECOMMANDINFO PURLINVOKECOMMANDINFOA
	#define CURLINVOKECOMMANDINFO CURLINVOKECOMMANDINFOA
	#define PCURLINVOKECOMMANDINFO PCURLINVOKECOMMANDINFOA
#endif

type IUniformResourceLocatorA
	lpVtbl as IUniformResourceLocatorAVtbl ptr
end type

type IUniformResourceLocatorAVtbl_
	QueryInterface as function(byval This as IUniformResourceLocatorA ptr, byval riid as const IID const ptr, byval ppvObject as PVOID ptr) as HRESULT
	AddRef as function(byval This as IUniformResourceLocatorA ptr) as ULONG
	Release as function(byval This as IUniformResourceLocatorA ptr) as ULONG
	SetURL as function(byval This as IUniformResourceLocatorA ptr, byval pcszURL as LPCSTR, byval dwInFlags as DWORD) as HRESULT
	GetURL as function(byval This as IUniformResourceLocatorA ptr, byval ppszURL as LPSTR ptr) as HRESULT
	InvokeCommand as function(byval This as IUniformResourceLocatorA ptr, byval purlici as PURLINVOKECOMMANDINFOA) as HRESULT
end type

type IUniformResourceLocatorW
	lpVtbl as IUniformResourceLocatorWVtbl ptr
end type

type IUniformResourceLocatorWVtbl_
	QueryInterface as function(byval This as IUniformResourceLocatorW ptr, byval riid as const IID const ptr, byval ppvObject as PVOID ptr) as HRESULT
	AddRef as function(byval This as IUniformResourceLocatorW ptr) as ULONG
	Release as function(byval This as IUniformResourceLocatorW ptr) as ULONG
	SetURL as function(byval This as IUniformResourceLocatorW ptr, byval pcszURL as LPCWSTR, byval dwInFlags as DWORD) as HRESULT
	GetURL as function(byval This as IUniformResourceLocatorW ptr, byval ppszURL as LPWSTR ptr) as HRESULT
	InvokeCommand as function(byval This as IUniformResourceLocatorW ptr, byval purlici as PURLINVOKECOMMANDINFOW) as HRESULT
end type

#ifdef UNICODE
	#define IUniformResourceLocator IUniformResourceLocatorW
	#define IUniformResourceLocatorVtbl IUniformResourceLocatorWVtbl

	type PIUniformResourceLocator as IUniformResourceLocatorW ptr
	type CIUniformResourceLocator as const IUniformResourceLocatorW
	type PCIUniformResourceLocator as const IUniformResourceLocatorW ptr
#else
	#define IUniformResourceLocator IUniformResourceLocatorA
	#define IUniformResourceLocatorVtbl IUniformResourceLocatorAVtbl

	type PIUniformResourceLocator as IUniformResourceLocatorA ptr
	type CIUniformResourceLocator as const IUniformResourceLocatorA
	type PCIUniformResourceLocator as const IUniformResourceLocatorA ptr
#endif

type translateurl_in_flags as long
enum
	TRANSLATEURL_FL_GUESS_PROTOCOL = &h0001
	TRANSLATEURL_FL_USE_DEFAULT_PROTOCOL = &h0002
end enum

type TRANSLATEURL_IN_FLAGS_ as translateurl_in_flags

declare function TranslateURLA(byval pcszURL as PCSTR, byval dwInFlags as DWORD, byval ppszTranslatedURL as PSTR ptr) as HRESULT
declare function TranslateURLW(byval pcszURL as PCWSTR, byval dwInFlags as DWORD, byval ppszTranslatedURL as PWSTR ptr) as HRESULT

#ifdef UNICODE
	#define TranslateURL TranslateURLW
#else
	#define TranslateURL TranslateURLA
#endif

type urlassociationdialog_in_flags as long
enum
	URLASSOCDLG_FL_USE_DEFAULT_NAME = &h0001
	URLASSOCDLG_FL_REGISTER_ASSOC = &h0002
end enum

type URLASSOCIATIONDIALOG_IN_FLAGS_ as urlassociationdialog_in_flags

declare function URLAssociationDialogA(byval hwndParent as HWND, byval dwInFlags as DWORD, byval pcszFile as PCSTR, byval pcszURL as PCSTR, byval pszAppBuf as PSTR, byval ucAppBufLen as UINT) as HRESULT
declare function URLAssociationDialogW(byval hwndParent as HWND, byval dwInFlags as DWORD, byval pcszFile as PCWSTR, byval pcszURL as PCWSTR, byval pszAppBuf as PWSTR, byval ucAppBufLen as UINT) as HRESULT

#ifdef UNICODE
	#define URLAssociationDialog URLAssociationDialogW
#else
	#define URLAssociationDialog URLAssociationDialogA
#endif

type mimeassociationdialog_in_flags as long
enum
	MIMEASSOCDLG_FL_REGISTER_ASSOC = &h0001
end enum

type MIMEASSOCIATIONDIALOG_IN_FLAGS_ as mimeassociationdialog_in_flags

declare function MIMEAssociationDialogA(byval hwndParent as HWND, byval dwInFlags as DWORD, byval pcszFile as PCSTR, byval pcszMIMEContentType as PCSTR, byval pszAppBuf as PSTR, byval ucAppBufLen as UINT) as HRESULT
declare function MIMEAssociationDialogW(byval hwndParent as HWND, byval dwInFlags as DWORD, byval pcszFile as PCWSTR, byval pcszMIMEContentType as PCWSTR, byval pszAppBuf as PWSTR, byval ucAppBufLen as UINT) as HRESULT

#ifdef UNICODE
	#define MIMEAssociationDialog MIMEAssociationDialogW
#else
	#define MIMEAssociationDialog MIMEAssociationDialogA
#endif

declare function InetIsOffline(byval dwFlags as DWORD) as WINBOOL

end extern
