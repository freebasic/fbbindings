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

extern "C"

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

'' TODO: DECLARE_INTERFACE_(IUniformResourceLocatorA,IUnknown) { STDMETHOD(QueryInterface)(THIS_ REFIID riid,PVOID *ppvObject) PURE; STDMETHOD_(ULONG,AddRef)(THIS) PURE; STDMETHOD_(ULONG,Release)(THIS) PURE; STDMETHOD(SetURL)(THIS_ LPCSTR pcszURL,DWORD dwInFlags) PURE; STDMETHOD(GetURL)(THIS_ LPSTR *ppszURL) PURE; STDMETHOD(InvokeCommand)(THIS_ PURLINVOKECOMMANDINFOA purlici) PURE; };
'' TODO: DECLARE_INTERFACE_(IUniformResourceLocatorW,IUnknown) { STDMETHOD(QueryInterface)(THIS_ REFIID riid,PVOID *ppvObject) PURE; STDMETHOD_(ULONG,AddRef)(THIS) PURE; STDMETHOD_(ULONG,Release)(THIS) PURE; STDMETHOD(SetURL)(THIS_ LPCWSTR pcszURL,DWORD dwInFlags) PURE; STDMETHOD(GetURL)(THIS_ LPWSTR *ppszURL) PURE; STDMETHOD(InvokeCommand)(THIS_ PURLINVOKECOMMANDINFOW purlici) PURE; };

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

extern     HRESULT as DECLSPEC_IMPORT
dim shared HRESULT as DECLSPEC_IMPORT

'' TODO: DECLSPEC_IMPORT HRESULT WINAPI TranslateURLA(PCSTR pcszURL,DWORD dwInFlags,PSTR *ppszTranslatedURL);
'' TODO: DECLSPEC_IMPORT HRESULT WINAPI TranslateURLW(PCWSTR pcszURL,DWORD dwInFlags,PWSTR UNALIGNED *ppszTranslatedURL);

#define TranslateURL __MINGW_NAME_AW(TranslateURL)

type urlassociationdialog_in_flags as long
enum
	URLASSOCDLG_FL_USE_DEFAULT_NAME = &h0001
	URLASSOCDLG_FL_REGISTER_ASSOC = &h0002
end enum

type URLASSOCIATIONDIALOG_IN_FLAGS_ as urlassociationdialog_in_flags

'' TODO: DECLSPEC_IMPORT HRESULT WINAPI URLAssociationDialogA(HWND hwndParent,DWORD dwInFlags,PCSTR pcszFile,PCSTR pcszURL,PSTR pszAppBuf,UINT ucAppBufLen);
'' TODO: DECLSPEC_IMPORT HRESULT WINAPI URLAssociationDialogW(HWND hwndParent,DWORD dwInFlags,PCWSTR pcszFile,PCWSTR pcszURL,PWSTR pszAppBuf,UINT ucAppBufLen);

#define URLAssociationDialog __MINGW_NAME_AW(URLAssociationDialog)

type mimeassociationdialog_in_flags as long
enum
	MIMEASSOCDLG_FL_REGISTER_ASSOC = &h0001
end enum

type MIMEASSOCIATIONDIALOG_IN_FLAGS_ as mimeassociationdialog_in_flags

'' TODO: DECLSPEC_IMPORT HRESULT WINAPI MIMEAssociationDialogA(HWND hwndParent,DWORD dwInFlags,PCSTR pcszFile,PCSTR pcszMIMEContentType,PSTR pszAppBuf,UINT ucAppBufLen);
'' TODO: DECLSPEC_IMPORT HRESULT WINAPI MIMEAssociationDialogW(HWND hwndParent,DWORD dwInFlags,PCWSTR pcszFile,PCWSTR pcszMIMEContentType,PWSTR pszAppBuf,UINT ucAppBufLen);

#define MIMEAssociationDialog __MINGW_NAME_AW(MIMEAssociationDialog)

extern     WINBOOL as DECLSPEC_IMPORT
dim shared WINBOOL as DECLSPEC_IMPORT

'' TODO: DECLSPEC_IMPORT WINBOOL WINAPI InetIsOffline(DWORD dwFlags);

end extern
