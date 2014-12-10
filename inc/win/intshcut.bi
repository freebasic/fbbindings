#pragma once

#include once "crt/wchar.bi"
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
#define INTSHCUTAPI DECLSPEC_IMPORT
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

#define URLINVOKECOMMANDINFO __MINGW_NAME_AW(URLINVOKECOMMANDINFO)
#define PURLINVOKECOMMANDINFO __MINGW_NAME_AW(PURLINVOKECOMMANDINFO)
#define CURLINVOKECOMMANDINFO __MINGW_NAME_AW(CURLINVOKECOMMANDINFO)
#define PCURLINVOKECOMMANDINFO __MINGW_NAME_AW(PCURLINVOKECOMMANDINFO)

type IUniformResourceLocatorA
	lpVtbl as IUniformResourceLocatorAVtbl ptr
end type

type IUniformResourceLocatorAVtbl_
	QueryInterface as function(byval This as IUniformResourceLocatorA ptr, byval riid as const IID const ptr, byval ppvObject as PVOID ptr) as HRESULT
	AddRef as function(byval This as IUniformResourceLocatorA ptr) as ULONG_
	Release as function(byval This as IUniformResourceLocatorA ptr) as ULONG_
	SetURL as function(byval This as IUniformResourceLocatorA ptr, byval pcszURL as LPCSTR, byval dwInFlags as DWORD) as HRESULT
	GetURL as function(byval This as IUniformResourceLocatorA ptr, byval ppszURL as LPSTR ptr) as HRESULT
	InvokeCommand as function(byval This as IUniformResourceLocatorA ptr, byval purlici as PURLINVOKECOMMANDINFOA) as HRESULT
end type

type IUniformResourceLocatorW
	lpVtbl as IUniformResourceLocatorWVtbl ptr
end type

type IUniformResourceLocatorWVtbl_
	QueryInterface as function(byval This as IUniformResourceLocatorW ptr, byval riid as const IID const ptr, byval ppvObject as PVOID ptr) as HRESULT
	AddRef as function(byval This as IUniformResourceLocatorW ptr) as ULONG_
	Release as function(byval This as IUniformResourceLocatorW ptr) as ULONG_
	SetURL as function(byval This as IUniformResourceLocatorW ptr, byval pcszURL as LPCWSTR, byval dwInFlags as DWORD) as HRESULT
	GetURL as function(byval This as IUniformResourceLocatorW ptr, byval ppszURL as LPWSTR ptr) as HRESULT
	InvokeCommand as function(byval This as IUniformResourceLocatorW ptr, byval purlici as PURLINVOKECOMMANDINFOW) as HRESULT
end type

#define IUniformResourceLocator __MINGW_NAME_AW(IUniformResourceLocator)
#define IUniformResourceLocatorVtbl __MINGW_NAME_AW_EXT(IUniformResourceLocator, Vtbl)

#ifdef UNICODE
	type PIUniformResourceLocator as IUniformResourceLocatorW ptr
	type CIUniformResourceLocator as const IUniformResourceLocatorW
	type PCIUniformResourceLocator as const IUniformResourceLocatorW ptr
#else
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

#define TranslateURL __MINGW_NAME_AW(TranslateURL)

type urlassociationdialog_in_flags as long
enum
	URLASSOCDLG_FL_USE_DEFAULT_NAME = &h0001
	URLASSOCDLG_FL_REGISTER_ASSOC = &h0002
end enum

type URLASSOCIATIONDIALOG_IN_FLAGS_ as urlassociationdialog_in_flags

declare function URLAssociationDialogA(byval hwndParent as HWND, byval dwInFlags as DWORD, byval pcszFile as PCSTR, byval pcszURL as PCSTR, byval pszAppBuf as PSTR, byval ucAppBufLen as UINT) as HRESULT
declare function URLAssociationDialogW(byval hwndParent as HWND, byval dwInFlags as DWORD, byval pcszFile as PCWSTR, byval pcszURL as PCWSTR, byval pszAppBuf as PWSTR, byval ucAppBufLen as UINT) as HRESULT

#define URLAssociationDialog __MINGW_NAME_AW(URLAssociationDialog)

type mimeassociationdialog_in_flags as long
enum
	MIMEASSOCDLG_FL_REGISTER_ASSOC = &h0001
end enum

type MIMEASSOCIATIONDIALOG_IN_FLAGS_ as mimeassociationdialog_in_flags

declare function MIMEAssociationDialogA(byval hwndParent as HWND, byval dwInFlags as DWORD, byval pcszFile as PCSTR, byval pcszMIMEContentType as PCSTR, byval pszAppBuf as PSTR, byval ucAppBufLen as UINT) as HRESULT
declare function MIMEAssociationDialogW(byval hwndParent as HWND, byval dwInFlags as DWORD, byval pcszFile as PCWSTR, byval pcszMIMEContentType as PCWSTR, byval pszAppBuf as PWSTR, byval ucAppBufLen as UINT) as HRESULT

#define MIMEAssociationDialog __MINGW_NAME_AW(MIMEAssociationDialog)

declare function InetIsOffline(byval dwFlags as DWORD) as WINBOOL

end extern
