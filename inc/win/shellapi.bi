#pragma once

#include once "_mingw_unicode.bi"
#include once "specstrings.bi"

#ifdef __FB_64BIT__
	extern "C"

	type HDROP__
		unused as long
	end type
#else
	extern "Windows"
#endif

#define _INC_SHELLAPI

#ifndef __FB_64BIT__
	type HDROP__ field = 1
		unused as long
	end type
#endif

type HDROP as HDROP__ ptr

#define DragQueryFile __MINGW_NAME_AW(DragQueryFile)
#define ShellExecute __MINGW_NAME_AW(ShellExecute)
#define FindExecutable __MINGW_NAME_AW(FindExecutable)
#define ShellAbout __MINGW_NAME_AW(ShellAbout)
#define ExtractAssociatedIcon __MINGW_NAME_AW(ExtractAssociatedIcon)
#define ExtractAssociatedIconEx __MINGW_NAME_AW(ExtractAssociatedIconEx)
#define ExtractIcon __MINGW_NAME_AW(ExtractIcon)

declare function DragQueryFileA(byval hDrop as HDROP, byval iFile as UINT, byval lpszFile as LPSTR, byval cch as UINT) as UINT
declare function DragQueryFileW(byval hDrop as HDROP, byval iFile as UINT, byval lpszFile as LPWSTR, byval cch as UINT) as UINT
declare function DragQueryPoint(byval hDrop as HDROP, byval ppt as POINT_ ptr) as WINBOOL
declare sub DragFinish(byval hDrop as HDROP)
declare sub DragAcceptFiles(byval hWnd as HWND, byval fAccept as WINBOOL)
declare function ShellExecuteA(byval hwnd as HWND, byval lpOperation as LPCSTR, byval lpFile as LPCSTR, byval lpParameters as LPCSTR, byval lpDirectory as LPCSTR, byval nShowCmd as INT_) as HINSTANCE
declare function ShellExecuteW(byval hwnd as HWND, byval lpOperation as LPCWSTR, byval lpFile as LPCWSTR, byval lpParameters as LPCWSTR, byval lpDirectory as LPCWSTR, byval nShowCmd as INT_) as HINSTANCE
declare function FindExecutableA(byval lpFile as LPCSTR, byval lpDirectory as LPCSTR, byval lpResult as LPSTR) as HINSTANCE
declare function FindExecutableW(byval lpFile as LPCWSTR, byval lpDirectory as LPCWSTR, byval lpResult as LPWSTR) as HINSTANCE
declare function CommandLineToArgvW(byval lpCmdLine as LPCWSTR, byval pNumArgs as long ptr) as LPWSTR ptr
declare function ShellAboutA(byval hWnd as HWND, byval szApp as LPCSTR, byval szOtherStuff as LPCSTR, byval hIcon as HICON) as INT_
declare function ShellAboutW(byval hWnd as HWND, byval szApp as LPCWSTR, byval szOtherStuff as LPCWSTR, byval hIcon as HICON) as INT_
declare function DuplicateIcon(byval hInst as HINSTANCE, byval hIcon as HICON) as HICON
declare function ExtractAssociatedIconA(byval hInst as HINSTANCE, byval pszIconPath as LPSTR, byval piIcon as WORD ptr) as HICON
declare function ExtractAssociatedIconW(byval hInst as HINSTANCE, byval pszIconPath as LPWSTR, byval piIcon as WORD ptr) as HICON
declare function ExtractAssociatedIconExA(byval hInst as HINSTANCE, byval pszIconPath as LPSTR, byval piIconIndex as WORD ptr, byval piIconId as WORD ptr) as HICON
declare function ExtractAssociatedIconExW(byval hInst as HINSTANCE, byval pszIconPath as LPWSTR, byval piIconIndex as WORD ptr, byval piIconId as WORD ptr) as HICON
declare function ExtractIconA(byval hInst as HINSTANCE, byval pszExeFileName as LPCSTR, byval nIconIndex as UINT) as HICON
declare function ExtractIconW(byval hInst as HINSTANCE, byval pszExeFileName as LPCWSTR, byval nIconIndex as UINT) as HICON

#ifdef __FB_64BIT__
	type _DRAGINFOA
		uSize as UINT
		pt as POINT_
		fNC as WINBOOL
		lpFileList as LPSTR
		grfKeyState as DWORD
	end type
#else
	type _DRAGINFOA field = 1
		uSize as UINT
		pt as POINT_
		fNC as WINBOOL
		lpFileList as LPSTR
		grfKeyState as DWORD
	end type
#endif

type DRAGINFOA as _DRAGINFOA
type LPDRAGINFOA as _DRAGINFOA ptr

#ifdef __FB_64BIT__
	type _DRAGINFOW
		uSize as UINT
		pt as POINT_
		fNC as WINBOOL
		lpFileList as LPWSTR
		grfKeyState as DWORD
	end type
#else
	type _DRAGINFOW field = 1
		uSize as UINT
		pt as POINT_
		fNC as WINBOOL
		lpFileList as LPWSTR
		grfKeyState as DWORD
	end type
#endif

type DRAGINFOW as _DRAGINFOW
type LPDRAGINFOW as _DRAGINFOW ptr

#ifdef UNICODE
	type DRAGINFO as DRAGINFOW
	type LPDRAGINFO as LPDRAGINFOW
#else
	type DRAGINFO as DRAGINFOA
	type LPDRAGINFO as LPDRAGINFOA
#endif

#define ABM_NEW &h00000000
#define ABM_REMOVE &h00000001
#define ABM_QUERYPOS &h00000002
#define ABM_SETPOS &h00000003
#define ABM_GETSTATE &h00000004
#define ABM_GETTASKBARPOS &h00000005
#define ABM_ACTIVATE &h00000006
#define ABM_GETAUTOHIDEBAR &h00000007
#define ABM_SETAUTOHIDEBAR &h00000008
#define ABM_WINDOWPOSCHANGED &h0000009
#define ABM_SETSTATE &h0000000a
#define ABN_STATECHANGE &h0000000
#define ABN_POSCHANGED &h0000001
#define ABN_FULLSCREENAPP &h0000002
#define ABN_WINDOWARRANGE &h0000003
#define ABS_AUTOHIDE &h0000001
#define ABS_ALWAYSONTOP &h0000002
#define ABE_LEFT 0
#define ABE_TOP 1
#define ABE_RIGHT 2
#define ABE_BOTTOM 3

#ifdef __FB_64BIT__
	type _AppBarData
		cbSize as DWORD
		hWnd as HWND
		uCallbackMessage as UINT
		uEdge as UINT
		rc as RECT
		lParam as LPARAM
	end type
#else
	type _AppBarData field = 1
		cbSize as DWORD
		hWnd as HWND
		uCallbackMessage as UINT
		uEdge as UINT
		rc as RECT
		lParam as LPARAM
	end type
#endif

type APPBARDATA as _AppBarData
type PAPPBARDATA as _AppBarData ptr

declare function SHAppBarMessage(byval dwMessage as DWORD, byval pData as PAPPBARDATA) as UINT_PTR
declare function DoEnvironmentSubstA(byval pszSrc as LPSTR, byval cchSrc as UINT) as DWORD
declare function DoEnvironmentSubstW(byval pszSrc as LPWSTR, byval cchSrc as UINT) as DWORD
declare function ExtractIconExA(byval lpszFile as LPCSTR, byval nIconIndex as long, byval phiconLarge as HICON ptr, byval phiconSmall as HICON ptr, byval nIcons as UINT) as UINT
declare function ExtractIconExW(byval lpszFile as LPCWSTR, byval nIconIndex as long, byval phiconLarge as HICON ptr, byval phiconSmall as HICON ptr, byval nIcons as UINT) as UINT

#define DoEnvironmentSubst __MINGW_NAME_AW(DoEnvironmentSubst)
#define ExtractIconEx __MINGW_NAME_AW(ExtractIconEx)
#define EIRESID(x) ((-1) * clng((x)))
#define FO_MOVE &h1
#define FO_COPY &h2
#define FO_DELETE &h3
#define FO_RENAME &h4
#define FOF_MULTIDESTFILES &h1
#define FOF_CONFIRMMOUSE &h2
#define FOF_SILENT &h4
#define FOF_RENAMEONCOLLISION &h8
#define FOF_NOCONFIRMATION &h10
#define FOF_WANTMAPPINGHANDLE &h20
#define FOF_ALLOWUNDO &h40
#define FOF_FILESONLY &h80
#define FOF_SIMPLEPROGRESS &h100
#define FOF_NOCONFIRMMKDIR &h200
#define FOF_NOERRORUI &h400
#define FOF_NOCOPYSECURITYATTRIBS &h800
#define FOF_NORECURSION &h1000
#define FOF_NO_CONNECTED_ELEMENTS &h2000
#define FOF_WANTNUKEWARNING &h4000
#define FOF_NORECURSEREPARSE &h8000
#define FOF_NO_UI (((FOF_SILENT or FOF_NOCONFIRMATION) or FOF_NOERRORUI) or FOF_NOCONFIRMMKDIR)

type FILEOP_FLAGS as WORD

#define PO_DELETE &h0013
#define PO_RENAME &h0014
#define PO_PORTCHANGE &h0020
#define PO_REN_PORT &h0034

type PRINTEROP_FLAGS as WORD

#ifdef __FB_64BIT__
	type _SHFILEOPSTRUCTA
		hwnd as HWND
		wFunc as UINT
		pFrom as LPCSTR
		pTo as LPCSTR
		fFlags as FILEOP_FLAGS
		fAnyOperationsAborted as WINBOOL
		hNameMappings as LPVOID
		lpszProgressTitle as PCSTR
	end type
#else
	type _SHFILEOPSTRUCTA field = 1
		hwnd as HWND
		wFunc as UINT
		pFrom as LPCSTR
		pTo as LPCSTR
		fFlags as FILEOP_FLAGS
		fAnyOperationsAborted as WINBOOL
		hNameMappings as LPVOID
		lpszProgressTitle as PCSTR
	end type
#endif

type SHFILEOPSTRUCTA as _SHFILEOPSTRUCTA
type LPSHFILEOPSTRUCTA as _SHFILEOPSTRUCTA ptr

#ifdef __FB_64BIT__
	type _SHFILEOPSTRUCTW
		hwnd as HWND
		wFunc as UINT
		pFrom as LPCWSTR
		pTo as LPCWSTR
		fFlags as FILEOP_FLAGS
		fAnyOperationsAborted as WINBOOL
		hNameMappings as LPVOID
		lpszProgressTitle as PCWSTR
	end type
#else
	type _SHFILEOPSTRUCTW field = 1
		hwnd as HWND
		wFunc as UINT
		pFrom as LPCWSTR
		pTo as LPCWSTR
		fFlags as FILEOP_FLAGS
		fAnyOperationsAborted as WINBOOL
		hNameMappings as LPVOID
		lpszProgressTitle as PCWSTR
	end type
#endif

type SHFILEOPSTRUCTW as _SHFILEOPSTRUCTW
type LPSHFILEOPSTRUCTW as _SHFILEOPSTRUCTW ptr

#ifdef UNICODE
	type SHFILEOPSTRUCT as SHFILEOPSTRUCTW
	type LPSHFILEOPSTRUCT as LPSHFILEOPSTRUCTW
#else
	type SHFILEOPSTRUCT as SHFILEOPSTRUCTA
	type LPSHFILEOPSTRUCT as LPSHFILEOPSTRUCTA
#endif

declare function SHFileOperationA(byval lpFileOp as LPSHFILEOPSTRUCTA) as long
declare function SHFileOperationW(byval lpFileOp as LPSHFILEOPSTRUCTW) as long

#define SHFileOperation __MINGW_NAME_AW(SHFileOperation)

declare sub SHFreeNameMappings(byval hNameMappings as HANDLE)

#ifdef __FB_64BIT__
	type _SHNAMEMAPPINGA
		pszOldPath as LPSTR
		pszNewPath as LPSTR
		cchOldPath as long
		cchNewPath as long
	end type
#else
	type _SHNAMEMAPPINGA field = 1
		pszOldPath as LPSTR
		pszNewPath as LPSTR
		cchOldPath as long
		cchNewPath as long
	end type
#endif

type SHNAMEMAPPINGA as _SHNAMEMAPPINGA
type LPSHNAMEMAPPINGA as _SHNAMEMAPPINGA ptr

#ifdef __FB_64BIT__
	type _SHNAMEMAPPINGW
		pszOldPath as LPWSTR
		pszNewPath as LPWSTR
		cchOldPath as long
		cchNewPath as long
	end type
#else
	type _SHNAMEMAPPINGW field = 1
		pszOldPath as LPWSTR
		pszNewPath as LPWSTR
		cchOldPath as long
		cchNewPath as long
	end type
#endif

type SHNAMEMAPPINGW as _SHNAMEMAPPINGW
type LPSHNAMEMAPPINGW as _SHNAMEMAPPINGW ptr

#ifdef UNICODE
	type SHNAMEMAPPING as SHNAMEMAPPINGW
	type LPSHNAMEMAPPING as LPSHNAMEMAPPINGW
#else
	type SHNAMEMAPPING as SHNAMEMAPPINGA
	type LPSHNAMEMAPPING as LPSHNAMEMAPPINGA
#endif

#define SE_ERR_FNF 2
#define SE_ERR_PNF 3
#define SE_ERR_ACCESSDENIED 5
#define SE_ERR_OOM 8
#define SE_ERR_DLLNOTFOUND 32
#define SE_ERR_SHARE 26
#define SE_ERR_ASSOCINCOMPLETE 27
#define SE_ERR_DDETIMEOUT 28
#define SE_ERR_DDEFAIL 29
#define SE_ERR_DDEBUSY 30
#define SE_ERR_NOASSOC 31
#define SEE_MASK_DEFAULT &h0
#define SEE_MASK_CLASSNAME &h1
#define SEE_MASK_CLASSKEY &h3
#define SEE_MASK_IDLIST &h4
#define SEE_MASK_INVOKEIDLIST &hc
#define SEE_MASK_ICON &h10
#define SEE_MASK_HOTKEY &h20
#define SEE_MASK_NOCLOSEPROCESS &h40
#define SEE_MASK_CONNECTNETDRV &h80
#define SEE_MASK_NOASYNC &h100
#define SEE_MASK_FLAG_DDEWAIT SEE_MASK_NOASYNC
#define SEE_MASK_DOENVSUBST &h200
#define SEE_MASK_FLAG_NO_UI &h400
#define SEE_MASK_UNICODE &h4000
#define SEE_MASK_NO_CONSOLE &h8000
#define SEE_MASK_ASYNCOK &h100000
#define SEE_MASK_HMONITOR &h200000
#define SEE_MASK_NOZONECHECKS &h800000
#define SEE_MASK_NOQUERYCLASSSTORE &h1000000
#define SEE_MASK_WAITFORINPUTIDLE &h2000000
#define SEE_MASK_FLAG_LOG_USAGE &h4000000

#ifdef __FB_64BIT__
	type _SHELLEXECUTEINFOA
		cbSize as DWORD
		fMask as ULONG
		hwnd as HWND
		lpVerb as LPCSTR
		lpFile as LPCSTR
		lpParameters as LPCSTR
		lpDirectory as LPCSTR
		nShow as long
		hInstApp as HINSTANCE
		lpIDList as any ptr
		lpClass as LPCSTR
		hkeyClass as HKEY
		dwHotKey as DWORD

		union
			hIcon as HANDLE
			hMonitor as HANDLE
		end union

		hProcess as HANDLE
	end type
#else
	type _SHELLEXECUTEINFOA field = 1
		cbSize as DWORD
		fMask as ULONG
		hwnd as HWND
		lpVerb as LPCSTR
		lpFile as LPCSTR
		lpParameters as LPCSTR
		lpDirectory as LPCSTR
		nShow as long
		hInstApp as HINSTANCE
		lpIDList as any ptr
		lpClass as LPCSTR
		hkeyClass as HKEY
		dwHotKey as DWORD

		union field = 1
			hIcon as HANDLE
			hMonitor as HANDLE
		end union

		hProcess as HANDLE
	end type
#endif

type SHELLEXECUTEINFOA as _SHELLEXECUTEINFOA
type LPSHELLEXECUTEINFOA as _SHELLEXECUTEINFOA ptr

#ifdef __FB_64BIT__
	type _SHELLEXECUTEINFOW
		cbSize as DWORD
		fMask as ULONG
		hwnd as HWND
		lpVerb as LPCWSTR
		lpFile as LPCWSTR
		lpParameters as LPCWSTR
		lpDirectory as LPCWSTR
		nShow as long
		hInstApp as HINSTANCE
		lpIDList as any ptr
		lpClass as LPCWSTR
		hkeyClass as HKEY
		dwHotKey as DWORD

		union
			hIcon as HANDLE
			hMonitor as HANDLE
		end union

		hProcess as HANDLE
	end type
#else
	type _SHELLEXECUTEINFOW field = 1
		cbSize as DWORD
		fMask as ULONG
		hwnd as HWND
		lpVerb as LPCWSTR
		lpFile as LPCWSTR
		lpParameters as LPCWSTR
		lpDirectory as LPCWSTR
		nShow as long
		hInstApp as HINSTANCE
		lpIDList as any ptr
		lpClass as LPCWSTR
		hkeyClass as HKEY
		dwHotKey as DWORD

		union field = 1
			hIcon as HANDLE
			hMonitor as HANDLE
		end union

		hProcess as HANDLE
	end type
#endif

type SHELLEXECUTEINFOW as _SHELLEXECUTEINFOW
type LPSHELLEXECUTEINFOW as _SHELLEXECUTEINFOW ptr

#ifdef UNICODE
	type SHELLEXECUTEINFO as SHELLEXECUTEINFOW
	type LPSHELLEXECUTEINFO as LPSHELLEXECUTEINFOW
#else
	type SHELLEXECUTEINFO as SHELLEXECUTEINFOA
	type LPSHELLEXECUTEINFO as LPSHELLEXECUTEINFOA
#endif

declare function ShellExecuteExA(byval pExecInfo as SHELLEXECUTEINFOA ptr) as WINBOOL
declare function ShellExecuteExW(byval pExecInfo as SHELLEXECUTEINFOW ptr) as WINBOOL

#define ShellExecuteEx __MINGW_NAME_AW(ShellExecuteEx)

#ifdef __FB_64BIT__
	type _SHCREATEPROCESSINFOW
		cbSize as DWORD
		fMask as ULONG
		hwnd as HWND
		pszFile as LPCWSTR
		pszParameters as LPCWSTR
		pszCurrentDirectory as LPCWSTR
		hUserToken as HANDLE
		lpProcessAttributes as LPSECURITY_ATTRIBUTES
		lpThreadAttributes as LPSECURITY_ATTRIBUTES
		bInheritHandles as WINBOOL
		dwCreationFlags as DWORD
		lpStartupInfo as LPSTARTUPINFOW
		lpProcessInformation as LPPROCESS_INFORMATION
	end type
#else
	type _SHCREATEPROCESSINFOW field = 1
		cbSize as DWORD
		fMask as ULONG
		hwnd as HWND
		pszFile as LPCWSTR
		pszParameters as LPCWSTR
		pszCurrentDirectory as LPCWSTR
		hUserToken as HANDLE
		lpProcessAttributes as LPSECURITY_ATTRIBUTES
		lpThreadAttributes as LPSECURITY_ATTRIBUTES
		bInheritHandles as WINBOOL
		dwCreationFlags as DWORD
		lpStartupInfo as LPSTARTUPINFOW
		lpProcessInformation as LPPROCESS_INFORMATION
	end type
#endif

type SHCREATEPROCESSINFOW as _SHCREATEPROCESSINFOW
type PSHCREATEPROCESSINFOW as _SHCREATEPROCESSINFOW ptr

declare function SHCreateProcessAsUserW(byval pscpi as PSHCREATEPROCESSINFOW) as WINBOOL

#ifdef __FB_64BIT__
	type _SHQUERYRBINFO
		cbSize as DWORD
		i64Size as longint
		i64NumItems as longint
	end type
#else
	type _SHQUERYRBINFO field = 1
		cbSize as DWORD
		i64Size as longint
		i64NumItems as longint
	end type
#endif

type SHQUERYRBINFO as _SHQUERYRBINFO
type LPSHQUERYRBINFO as _SHQUERYRBINFO ptr

#define SHERB_NOCONFIRMATION &h00000001
#define SHERB_NOPROGRESSUI &h00000002
#define SHERB_NOSOUND &h00000004

declare function SHQueryRecycleBinA(byval pszRootPath as LPCSTR, byval pSHQueryRBInfo as LPSHQUERYRBINFO) as HRESULT
declare function SHQueryRecycleBinW(byval pszRootPath as LPCWSTR, byval pSHQueryRBInfo as LPSHQUERYRBINFO) as HRESULT

#define SHQueryRecycleBin __MINGW_NAME_AW(SHQueryRecycleBin)

declare function SHEmptyRecycleBinA(byval hwnd as HWND, byval pszRootPath as LPCSTR, byval dwFlags as DWORD) as HRESULT
declare function SHEmptyRecycleBinW(byval hwnd as HWND, byval pszRootPath as LPCWSTR, byval dwFlags as DWORD) as HRESULT

#define SHEmptyRecycleBin __MINGW_NAME_AW(SHEmptyRecycleBin)

#ifdef __FB_64BIT__
	type _NOTIFYICONDATAA
		cbSize as DWORD
		hWnd as HWND
		uID as UINT
		uFlags as UINT
		uCallbackMessage as UINT
		hIcon as HICON
		szTip(0 to 127) as CHAR
		dwState as DWORD
		dwStateMask as DWORD
		szInfo(0 to 255) as CHAR

		union
			uTimeout as UINT
			uVersion as UINT
		end union

		szInfoTitle(0 to 63) as CHAR
		dwInfoFlags as DWORD
		guidItem as GUID
	end type
#else
	type _NOTIFYICONDATAA field = 1
		cbSize as DWORD
		hWnd as HWND
		uID as UINT
		uFlags as UINT
		uCallbackMessage as UINT
		hIcon as HICON
		szTip(0 to 127) as CHAR
		dwState as DWORD
		dwStateMask as DWORD
		szInfo(0 to 255) as CHAR

		union field = 1
			uTimeout as UINT
			uVersion as UINT
		end union

		szInfoTitle(0 to 63) as CHAR
		dwInfoFlags as DWORD
		guidItem as GUID
	end type
#endif

type NOTIFYICONDATAA as _NOTIFYICONDATAA
type PNOTIFYICONDATAA as _NOTIFYICONDATAA ptr

#ifdef __FB_64BIT__
	type _NOTIFYICONDATAW
		cbSize as DWORD
		hWnd as HWND
		uID as UINT
		uFlags as UINT
		uCallbackMessage as UINT
		hIcon as HICON
		szTip(0 to 127) as WCHAR
		dwState as DWORD
		dwStateMask as DWORD
		szInfo(0 to 255) as WCHAR

		union
			uTimeout as UINT
			uVersion as UINT
		end union

		szInfoTitle(0 to 63) as WCHAR
		dwInfoFlags as DWORD
		guidItem as GUID
	end type
#else
	type _NOTIFYICONDATAW field = 1
		cbSize as DWORD
		hWnd as HWND
		uID as UINT
		uFlags as UINT
		uCallbackMessage as UINT
		hIcon as HICON
		szTip(0 to 127) as WCHAR
		dwState as DWORD
		dwStateMask as DWORD
		szInfo(0 to 255) as WCHAR

		union field = 1
			uTimeout as UINT
			uVersion as UINT
		end union

		szInfoTitle(0 to 63) as WCHAR
		dwInfoFlags as DWORD
		guidItem as GUID
	end type
#endif

type NOTIFYICONDATAW as _NOTIFYICONDATAW
type PNOTIFYICONDATAW as _NOTIFYICONDATAW ptr

#ifdef UNICODE
	type NOTIFYICONDATA as NOTIFYICONDATAW
	type PNOTIFYICONDATA as PNOTIFYICONDATAW
#else
	type NOTIFYICONDATA as NOTIFYICONDATAA
	type PNOTIFYICONDATA as PNOTIFYICONDATAA
#endif

#define NOTIFYICONDATAA_V1_SIZE FIELD_OFFSET(NOTIFYICONDATAA, szTip[64])
#define NOTIFYICONDATAW_V1_SIZE FIELD_OFFSET(NOTIFYICONDATAW, szTip[64])
#define NOTIFYICONDATAA_V2_SIZE FIELD_OFFSET(NOTIFYICONDATAA, guidItem)
#define NOTIFYICONDATAW_V2_SIZE FIELD_OFFSET(NOTIFYICONDATAW, guidItem)
#define NOTIFYICONDATAA_V3_SIZE FIELD_OFFSET(NOTIFYICONDATAA, hBalloonIcon)
#define NOTIFYICONDATAW_V3_SIZE FIELD_OFFSET(NOTIFYICONDATAW, hBalloonIcon)
#define NOTIFYICONDATA_V1_SIZE __MINGW_NAME_AW_EXT(NOTIFYICONDATA, _V1_SIZE)
#define NOTIFYICONDATA_V2_SIZE __MINGW_NAME_AW_EXT(NOTIFYICONDATA, _V2_SIZE)
#define NOTIFYICONDATA_V3_SIZE __MINGW_NAME_AW_EXT(NOTIFYICONDATA, _V3_SIZE)
#define NIN_SELECT (WM_USER + 0)
#define NINF_KEY &h1
#define NIN_KEYSELECT (NIN_SELECT or NINF_KEY)
#define NIN_BALLOONSHOW (WM_USER + 2)
#define NIN_BALLOONHIDE (WM_USER + 3)
#define NIN_BALLOONTIMEOUT (WM_USER + 4)
#define NIN_BALLOONUSERCLICK (WM_USER + 5)
#define NIM_ADD &h00000000
#define NIM_MODIFY &h00000001
#define NIM_DELETE &h00000002
#define NIM_SETFOCUS &h00000003
#define NIM_SETVERSION &h00000004
#define NOTIFYICON_VERSION 3
#define NIF_MESSAGE &h00000001
#define NIF_ICON &h00000002
#define NIF_TIP &h00000004
#define NIF_STATE &h00000008
#define NIF_INFO &h00000010
#define NIF_GUID &h00000020
#define NIS_HIDDEN &h00000001
#define NIS_SHAREDICON &h00000002
#define NIIF_NONE &h00000000
#define NIIF_INFO &h00000001
#define NIIF_WARNING &h00000002
#define NIIF_ERROR &h00000003
#define NIIF_USER &h00000004
#define NIIF_ICON_MASK &h0000000f
#define NIIF_NOSOUND &h00000010

#ifdef __FB_64BIT__
	type _NOTIFYICONIDENTIFIER
		cbSize as DWORD
		hWnd as HWND
		uID as UINT
		guidItem as GUID
	end type
#else
	type _NOTIFYICONIDENTIFIER field = 1
		cbSize as DWORD
		hWnd as HWND
		uID as UINT
		guidItem as GUID
	end type
#endif

type NOTIFYICONIDENTIFIER as _NOTIFYICONIDENTIFIER
type PNOTIFYICONIDENTIFIER as _NOTIFYICONIDENTIFIER ptr

declare function Shell_NotifyIconA(byval dwMessage as DWORD, byval lpData as PNOTIFYICONDATAA) as WINBOOL
declare function Shell_NotifyIconW(byval dwMessage as DWORD, byval lpData as PNOTIFYICONDATAW) as WINBOOL

#define Shell_NotifyIcon __MINGW_NAME_AW(Shell_NotifyIcon)
#define SHFILEINFO_DEFINED

#ifdef __FB_64BIT__
	type _SHFILEINFOA
		hIcon as HICON
		iIcon as long
		dwAttributes as DWORD
		szDisplayName(0 to 259) as CHAR
		szTypeName(0 to 79) as CHAR
	end type
#else
	type _SHFILEINFOA field = 1
		hIcon as HICON
		iIcon as long
		dwAttributes as DWORD
		szDisplayName(0 to 259) as CHAR
		szTypeName(0 to 79) as CHAR
	end type
#endif

type SHFILEINFOA as _SHFILEINFOA

#ifdef __FB_64BIT__
	type _SHFILEINFOW
		hIcon as HICON
		iIcon as long
		dwAttributes as DWORD
		szDisplayName(0 to 259) as WCHAR
		szTypeName(0 to 79) as WCHAR
	end type
#else
	type _SHFILEINFOW field = 1
		hIcon as HICON
		iIcon as long
		dwAttributes as DWORD
		szDisplayName(0 to 259) as WCHAR
		szTypeName(0 to 79) as WCHAR
	end type
#endif

type SHFILEINFOW as _SHFILEINFOW

#ifdef UNICODE
	type SHFILEINFO as SHFILEINFOW
#else
	type SHFILEINFO as SHFILEINFOA
#endif

#define SHGFI_ICON &h000000100
#define SHGFI_DISPLAYNAME &h000000200
#define SHGFI_TYPENAME &h000000400
#define SHGFI_ATTRIBUTES &h000000800
#define SHGFI_ICONLOCATION &h000001000
#define SHGFI_EXETYPE &h000002000
#define SHGFI_SYSICONINDEX &h000004000
#define SHGFI_LINKOVERLAY &h000008000
#define SHGFI_SELECTED &h000010000
#define SHGFI_ATTR_SPECIFIED &h000020000
#define SHGFI_LARGEICON &h000000000
#define SHGFI_SMALLICON &h000000001
#define SHGFI_OPENICON &h000000002
#define SHGFI_SHELLICONSIZE &h000000004
#define SHGFI_PIDL &h000000008
#define SHGFI_USEFILEATTRIBUTES &h000000010
#define SHGFI_ADDOVERLAYS &h000000020
#define SHGFI_OVERLAYINDEX &h000000040

declare function SHGetFileInfoA(byval pszPath as LPCSTR, byval dwFileAttributes as DWORD, byval psfi as SHFILEINFOA ptr, byval cbFileInfo as UINT, byval uFlags as UINT) as DWORD_PTR
declare function SHGetFileInfoW(byval pszPath as LPCWSTR, byval dwFileAttributes as DWORD, byval psfi as SHFILEINFOW ptr, byval cbFileInfo as UINT, byval uFlags as UINT) as DWORD_PTR

#define SHGetFileInfo __MINGW_NAME_AW(SHGetFileInfo)
#define SHGetDiskFreeSpace SHGetDiskFreeSpaceEx

declare function SHGetDiskFreeSpaceExA(byval pszDirectoryName as LPCSTR, byval pulFreeBytesAvailableToCaller as ULARGE_INTEGER ptr, byval pulTotalNumberOfBytes as ULARGE_INTEGER ptr, byval pulTotalNumberOfFreeBytes as ULARGE_INTEGER ptr) as WINBOOL
declare function SHGetDiskFreeSpaceExW(byval pszDirectoryName as LPCWSTR, byval pulFreeBytesAvailableToCaller as ULARGE_INTEGER ptr, byval pulTotalNumberOfBytes as ULARGE_INTEGER ptr, byval pulTotalNumberOfFreeBytes as ULARGE_INTEGER ptr) as WINBOOL
declare function SHGetNewLinkInfoA(byval pszLinkTo as LPCSTR, byval pszDir as LPCSTR, byval pszName as LPSTR, byval pfMustCopy as WINBOOL ptr, byval uFlags as UINT) as WINBOOL
declare function SHGetNewLinkInfoW(byval pszLinkTo as LPCWSTR, byval pszDir as LPCWSTR, byval pszName as LPWSTR, byval pfMustCopy as WINBOOL ptr, byval uFlags as UINT) as WINBOOL

#define SHGetDiskFreeSpaceEx __MINGW_NAME_AW(SHGetDiskFreeSpaceEx)
#define SHGetNewLinkInfo __MINGW_NAME_AW(SHGetNewLinkInfo)
#define SHGNLI_PIDL &h000000001
#define SHGNLI_PREFIXNAME &h000000002
#define SHGNLI_NOUNIQUE &h000000004
#define SHGNLI_NOLNK &h000000008
#define SHGNLI_NOLOCNAME &h000000010
#define PRINTACTION_OPEN 0
#define PRINTACTION_PROPERTIES 1
#define PRINTACTION_NETINSTALL 2
#define PRINTACTION_NETINSTALLLINK 3
#define PRINTACTION_TESTPAGE 4
#define PRINTACTION_OPENNETPRN 5
#define PRINTACTION_DOCUMENTDEFAULTS 6
#define PRINTACTION_SERVERPROPERTIES 7

declare function SHInvokePrinterCommandA(byval hwnd as HWND, byval uAction as UINT, byval lpBuf1 as LPCSTR, byval lpBuf2 as LPCSTR, byval fModal as WINBOOL) as WINBOOL
declare function SHInvokePrinterCommandW(byval hwnd as HWND, byval uAction as UINT, byval lpBuf1 as LPCWSTR, byval lpBuf2 as LPCWSTR, byval fModal as WINBOOL) as WINBOOL

#define SHInvokePrinterCommand __MINGW_NAME_AW(SHInvokePrinterCommand)

declare function SHLoadNonloadedIconOverlayIdentifiers() as HRESULT
declare function SHIsFileAvailableOffline(byval pwszPath as PCWSTR, byval pdwStatus as DWORD ptr) as HRESULT

#define OFFLINE_STATUS_LOCAL &h0001
#define OFFLINE_STATUS_REMOTE &h0002
#define OFFLINE_STATUS_INCOMPLETE &h0004

declare function SHSetLocalizedName(byval pszPath as PCWSTR, byval pszResModule as PCWSTR, byval idsRes as long) as HRESULT
declare function ShellMessageBoxA cdecl(byval hAppInst as HINSTANCE, byval hWnd as HWND, byval lpcText as LPCSTR, byval lpcTitle as LPCSTR, byval fuStyle as UINT, ...) as long
declare function ShellMessageBoxW cdecl(byval hAppInst as HINSTANCE, byval hWnd as HWND, byval lpcText as LPCWSTR, byval lpcTitle as LPCWSTR, byval fuStyle as UINT, ...) as long

#define ShellMessageBox __MINGW_NAME_AW(ShellMessageBox)

declare function IsLFNDriveA(byval pszPath as LPCSTR) as WINBOOL
declare function IsLFNDriveW(byval pszPath as LPCWSTR) as WINBOOL

#define IsLFNDrive __MINGW_NAME_AW(IsLFNDrive)

declare function SHEnumerateUnreadMailAccountsA(byval hKeyUser as HKEY, byval dwIndex as DWORD, byval pszMailAddress as LPSTR, byval cchMailAddress as long) as HRESULT
declare function SHEnumerateUnreadMailAccountsW(byval hKeyUser as HKEY, byval dwIndex as DWORD, byval pszMailAddress as LPWSTR, byval cchMailAddress as long) as HRESULT
declare function SHGetUnreadMailCountA(byval hKeyUser as HKEY, byval pszMailAddress as LPCSTR, byval pdwCount as DWORD ptr, byval pFileTime as FILETIME ptr, byval pszShellExecuteCommand as LPSTR, byval cchShellExecuteCommand as long) as HRESULT
declare function SHGetUnreadMailCountW(byval hKeyUser as HKEY, byval pszMailAddress as LPCWSTR, byval pdwCount as DWORD ptr, byval pFileTime as FILETIME ptr, byval pszShellExecuteCommand as LPWSTR, byval cchShellExecuteCommand as long) as HRESULT
declare function SHSetUnreadMailCountA(byval pszMailAddress as LPCSTR, byval dwCount as DWORD, byval pszShellExecuteCommand as LPCSTR) as HRESULT
declare function SHSetUnreadMailCountW(byval pszMailAddress as LPCWSTR, byval dwCount as DWORD, byval pszShellExecuteCommand as LPCWSTR) as HRESULT

#define SHEnumerateUnreadMailAccounts __MINGW_NAME_AW(SHEnumerateUnreadMailAccounts)
#define SHGetUnreadMailCount __MINGW_NAME_AW(SHGetUnreadMailCount)
#define SHSetUnreadMailCount __MINGW_NAME_AW(SHSetUnreadMailCount)

declare function SHTestTokenMembership(byval hToken as HANDLE, byval ulRID as ULONG) as WINBOOL
declare function SHGetImageList(byval iImageList as long, byval riid as const IID const ptr, byval ppvObj as any ptr ptr) as HRESULT

#define SHIL_LARGE 0
#define SHIL_SMALL 1
#define SHIL_EXTRALARGE 2
#define SHIL_SYSSMALL 3
#define SHIL_LAST SHIL_SYSSMALL

type PFNCANSHAREFOLDERW as function(byval pszPath as PCWSTR) as HRESULT
type PFNSHOWSHAREFOLDERUIW as function(byval hwndParent as HWND, byval pszPath as PCWSTR) as HRESULT

end extern
