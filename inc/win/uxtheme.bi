#pragma once

#include once "crt/wchar.bi"
#include once "commctrl.bi"

#ifdef __FB_64BIT__
	extern "C"
#else
	extern "Windows"
#endif

#define _UXTHEME_H_

type HTHEME as HANDLE

declare function OpenThemeData(byval hwnd as HWND, byval pszClassList as LPCWSTR) as HTHEME
declare function CloseThemeData(byval hTheme as HTHEME) as HRESULT
declare function DrawThemeBackground(byval hTheme as HTHEME, byval hdc as HDC, byval iPartId as long, byval iStateId as long, byval pRect as const RECT ptr, byval pClipRect as const RECT ptr) as HRESULT

#define DTT_GRAYED &h1

declare function DrawThemeText(byval hTheme as HTHEME, byval hdc as HDC, byval iPartId as long, byval iStateId as long, byval pszText as LPCWSTR, byval iCharCount as long, byval dwTextFlags as DWORD, byval dwTextFlags2 as DWORD, byval pRect as const RECT ptr) as HRESULT
declare function GetThemeBackgroundContentRect(byval hTheme as HTHEME, byval hdc as HDC, byval iPartId as long, byval iStateId as long, byval pBoundingRect as const RECT ptr, byval pContentRect as RECT ptr) as HRESULT
declare function GetThemeBackgroundExtent(byval hTheme as HTHEME, byval hdc as HDC, byval iPartId as long, byval iStateId as long, byval pContentRect as const RECT ptr, byval pExtentRect as RECT ptr) as HRESULT

type THEMESIZE as long
enum
	TS_MIN
	TS_TRUE
	TS_DRAW
end enum

declare function GetThemePartSize(byval hTheme as HTHEME, byval hdc as HDC, byval iPartId as long, byval iStateId as long, byval prc as RECT ptr, byval eSize as THEMESIZE, byval psz as SIZE ptr) as HRESULT
declare function GetThemeTextExtent(byval hTheme as HTHEME, byval hdc as HDC, byval iPartId as long, byval iStateId as long, byval pszText as LPCWSTR, byval iCharCount as long, byval dwTextFlags as DWORD, byval pBoundingRect as const RECT ptr, byval pExtentRect as RECT ptr) as HRESULT
declare function GetThemeTextMetrics(byval hTheme as HTHEME, byval hdc as HDC, byval iPartId as long, byval iStateId as long, byval ptm as TEXTMETRIC ptr) as HRESULT
declare function GetThemeBackgroundRegion(byval hTheme as HTHEME, byval hdc as HDC, byval iPartId as long, byval iStateId as long, byval pRect as const RECT ptr, byval pRegion as HRGN ptr) as HRESULT

#define HTTB_BACKGROUNDSEG &h0000
#define HTTB_FIXEDBORDER &h0002
#define HTTB_CAPTION &h0004
#define HTTB_RESIZINGBORDER_LEFT &h0010
#define HTTB_RESIZINGBORDER_TOP &h0020
#define HTTB_RESIZINGBORDER_RIGHT &h0040
#define HTTB_RESIZINGBORDER_BOTTOM &h0080
#define HTTB_RESIZINGBORDER (((HTTB_RESIZINGBORDER_LEFT or HTTB_RESIZINGBORDER_TOP) or HTTB_RESIZINGBORDER_RIGHT) or HTTB_RESIZINGBORDER_BOTTOM)
#define HTTB_SIZINGTEMPLATE &h0100
#define HTTB_SYSTEMSIZINGMARGINS &h0200

declare function HitTestThemeBackground(byval hTheme as HTHEME, byval hdc as HDC, byval iPartId as long, byval iStateId as long, byval dwOptions as DWORD, byval pRect as const RECT ptr, byval hrgn as HRGN, byval ptTest as POINT_, byval pwHitTestCode as WORD ptr) as HRESULT
declare function DrawThemeEdge(byval hTheme as HTHEME, byval hdc as HDC, byval iPartId as long, byval iStateId as long, byval pDestRect as const RECT ptr, byval uEdge as UINT, byval uFlags as UINT, byval pContentRect as RECT ptr) as HRESULT
declare function DrawThemeIcon(byval hTheme as HTHEME, byval hdc as HDC, byval iPartId as long, byval iStateId as long, byval pRect as const RECT ptr, byval himl as HIMAGELIST, byval iImageIndex as long) as HRESULT
declare function IsThemePartDefined(byval hTheme as HTHEME, byval iPartId as long, byval iStateId as long) as WINBOOL
declare function IsThemeBackgroundPartiallyTransparent(byval hTheme as HTHEME, byval iPartId as long, byval iStateId as long) as WINBOOL
declare function GetThemeColor(byval hTheme as HTHEME, byval iPartId as long, byval iStateId as long, byval iPropId as long, byval pColor as COLORREF ptr) as HRESULT
declare function GetThemeMetric(byval hTheme as HTHEME, byval hdc as HDC, byval iPartId as long, byval iStateId as long, byval iPropId as long, byval piVal as long ptr) as HRESULT
declare function GetThemeString(byval hTheme as HTHEME, byval iPartId as long, byval iStateId as long, byval iPropId as long, byval pszBuff as LPWSTR, byval cchMaxBuffChars as long) as HRESULT
declare function GetThemeBool(byval hTheme as HTHEME, byval iPartId as long, byval iStateId as long, byval iPropId as long, byval pfVal as WINBOOL ptr) as HRESULT
declare function GetThemeInt(byval hTheme as HTHEME, byval iPartId as long, byval iStateId as long, byval iPropId as long, byval piVal as long ptr) as HRESULT
declare function GetThemeEnumValue(byval hTheme as HTHEME, byval iPartId as long, byval iStateId as long, byval iPropId as long, byval piVal as long ptr) as HRESULT
declare function GetThemePosition(byval hTheme as HTHEME, byval iPartId as long, byval iStateId as long, byval iPropId as long, byval pPoint as POINT_ ptr) as HRESULT
declare function GetThemeFont(byval hTheme as HTHEME, byval hdc as HDC, byval iPartId as long, byval iStateId as long, byval iPropId as long, byval pFont as LOGFONT ptr) as HRESULT
declare function GetThemeRect(byval hTheme as HTHEME, byval iPartId as long, byval iStateId as long, byval iPropId as long, byval pRect as RECT ptr) as HRESULT

type _MARGINS
	cxLeftWidth as long
	cxRightWidth as long
	cyTopHeight as long
	cyBottomHeight as long
end type

type MARGINS as _MARGINS
type PMARGINS as _MARGINS ptr

declare function GetThemeMargins(byval hTheme as HTHEME, byval hdc as HDC, byval iPartId as long, byval iStateId as long, byval iPropId as long, byval prc as RECT ptr, byval pMargins as MARGINS ptr) as HRESULT

#define MAX_INTLIST_COUNT 10

type _INTLIST
	iValueCount as long
	iValues(0 to 9) as long
end type

type INTLIST as _INTLIST
type PINTLIST as _INTLIST ptr

declare function GetThemeIntList(byval hTheme as HTHEME, byval iPartId as long, byval iStateId as long, byval iPropId as long, byval pIntList as INTLIST ptr) as HRESULT

type PROPERTYORIGIN as long
enum
	PO_STATE
	PO_PART
	PO_CLASS
	PO_GLOBAL
	PO_NOTFOUND
end enum

declare function GetThemePropertyOrigin(byval hTheme as HTHEME, byval iPartId as long, byval iStateId as long, byval iPropId as long, byval pOrigin as PROPERTYORIGIN ptr) as HRESULT
declare function SetWindowTheme(byval hwnd as HWND, byval pszSubAppName as LPCWSTR, byval pszSubIdList as LPCWSTR) as HRESULT
declare function GetThemeFilename(byval hTheme as HTHEME, byval iPartId as long, byval iStateId as long, byval iPropId as long, byval pszThemeFileName as LPWSTR, byval cchMaxBuffChars as long) as HRESULT
declare function GetThemeSysColor(byval hTheme as HTHEME, byval iColorId as long) as COLORREF
declare function GetThemeSysColorBrush(byval hTheme as HTHEME, byval iColorId as long) as HBRUSH
declare function GetThemeSysBool(byval hTheme as HTHEME, byval iBoolId as long) as WINBOOL
declare function GetThemeSysSize(byval hTheme as HTHEME, byval iSizeId as long) as long
declare function GetThemeSysFont(byval hTheme as HTHEME, byval iFontId as long, byval plf as LOGFONT ptr) as HRESULT
declare function GetThemeSysString(byval hTheme as HTHEME, byval iStringId as long, byval pszStringBuff as LPWSTR, byval cchMaxStringChars as long) as HRESULT
declare function GetThemeSysInt(byval hTheme as HTHEME, byval iIntId as long, byval piValue as long ptr) as HRESULT
declare function IsThemeActive() as WINBOOL
declare function IsAppThemed() as WINBOOL
declare function GetWindowTheme(byval hwnd as HWND) as HTHEME

#define ETDT_DISABLE &h00000001
#define ETDT_ENABLE &h00000002
#define ETDT_USETABTEXTURE &h00000004
#define ETDT_ENABLETAB (ETDT_ENABLE or ETDT_USETABTEXTURE)

declare function EnableThemeDialogTexture(byval hwnd as HWND, byval dwFlags as DWORD) as HRESULT
declare function IsThemeDialogTextureEnabled(byval hwnd as HWND) as WINBOOL

#define STAP_ALLOW_NONCLIENT (1 shl 0)
#define STAP_ALLOW_CONTROLS (1 shl 1)
#define STAP_ALLOW_WEBCONTENT (1 shl 2)

declare function GetThemeAppProperties() as DWORD
declare sub SetThemeAppProperties(byval dwFlags as DWORD)
declare function GetCurrentThemeName(byval pszThemeFileName as LPWSTR, byval cchMaxNameChars as long, byval pszColorBuff as LPWSTR, byval cchMaxColorChars as long, byval pszSizeBuff as LPWSTR, byval cchMaxSizeChars as long) as HRESULT

#define SZ_THDOCPROP_DISPLAYNAME wstr("DisplayName")
#define SZ_THDOCPROP_CANONICALNAME wstr("ThemeName")
#define SZ_THDOCPROP_TOOLTIP wstr("ToolTip")
#define SZ_THDOCPROP_AUTHOR wstr("author")

declare function GetThemeDocumentationProperty(byval pszThemeName as LPCWSTR, byval pszPropertyName as LPCWSTR, byval pszValueBuff as LPWSTR, byval cchMaxValChars as long) as HRESULT
declare function DrawThemeParentBackground(byval hwnd as HWND, byval hdc as HDC, byval prc as RECT ptr) as HRESULT
declare function EnableTheming(byval fEnable as WINBOOL) as HRESULT

#define DTBG_CLIPRECT &h00000001
#define DTBG_DRAWSOLID &h00000002
#define DTBG_OMITBORDER &h00000004
#define DTBG_OMITCONTENT &h00000008
#define DTBG_COMPUTINGREGION &h00000010
#define DTBG_MIRRORDC &h00000020
#define DTBG_NOMIRROR &h00000040
#define DTBG_VALIDBITS ((((((DTBG_CLIPRECT or DTBG_DRAWSOLID) or DTBG_OMITBORDER) or DTBG_OMITCONTENT) or DTBG_COMPUTINGREGION) or DTBG_MIRRORDC) or DTBG_NOMIRROR)

type _DTBGOPTS
	dwSize as DWORD
	dwFlags as DWORD
	rcClip as RECT
end type

type DTBGOPTS as _DTBGOPTS
type PDTBGOPTS as _DTBGOPTS ptr

declare function DrawThemeBackgroundEx(byval hTheme as HTHEME, byval hdc as HDC, byval iPartId as long, byval iStateId as long, byval pRect as const RECT ptr, byval pOptions as const DTBGOPTS ptr) as HRESULT

end extern
