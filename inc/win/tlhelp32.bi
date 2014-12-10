#pragma once

#ifdef UNICODE
	'' The following symbols have been renamed:
	''     #define PROCESSENTRY32 => PROCESSENTRY32_
	''     #define PPROCESSENTRY32 => PPROCESSENTRY32_
	''     #define LPPROCESSENTRY32 => LPPROCESSENTRY32_
	''     #define MODULEENTRY32 => MODULEENTRY32_
	''     #define PMODULEENTRY32 => PMODULEENTRY32_
	''     #define LPMODULEENTRY32 => LPMODULEENTRY32_
#endif

extern "C"

#define _INC_TOOLHELP32
#define MAX_MODULE_NAME32 255

extern     WINAPI as HANDLE
dim shared WINAPI as HANDLE

'' TODO: HANDLE WINAPI CreateToolhelp32Snapshot(DWORD dwFlags,DWORD th32ProcessID);

#define TH32CS_SNAPHEAPLIST &h00000001
#define TH32CS_SNAPPROCESS &h00000002
#define TH32CS_SNAPTHREAD &h00000004
#define TH32CS_SNAPMODULE &h00000008
#define TH32CS_SNAPMODULE32 &h00000010
#define TH32CS_SNAPALL (((TH32CS_SNAPHEAPLIST or TH32CS_SNAPPROCESS) or TH32CS_SNAPTHREAD) or TH32CS_SNAPMODULE)
#define TH32CS_INHERIT &h80000000

type tagHEAPLIST32
	dwSize as SIZE_T
	th32ProcessID as DWORD
	th32HeapID as ULONG_PTR
	dwFlags as DWORD
end type

type HEAPLIST32 as tagHEAPLIST32
type PHEAPLIST32 as HEAPLIST32 ptr
type LPHEAPLIST32 as HEAPLIST32 ptr

#define HF32_DEFAULT 1
#define HF32_SHARED 2

'' TODO: WINBOOL WINAPI Heap32ListFirst(HANDLE hSnapshot,LPHEAPLIST32 lphl);
'' TODO: WINBOOL WINAPI Heap32ListNext(HANDLE hSnapshot,LPHEAPLIST32 lphl);

type tagHEAPENTRY32
	dwSize as SIZE_T
	hHandle as HANDLE
	dwAddress as ULONG_PTR
	dwBlockSize as SIZE_T
	dwFlags as DWORD
	dwLockCount as DWORD
	dwResvd as DWORD
	th32ProcessID as DWORD
	th32HeapID as ULONG_PTR
end type

type HEAPENTRY32 as tagHEAPENTRY32
type PHEAPENTRY32 as HEAPENTRY32 ptr
type LPHEAPENTRY32 as HEAPENTRY32 ptr

#define LF32_FIXED &h00000001
#define LF32_FREE &h00000002
#define LF32_MOVEABLE &h00000004

'' TODO: WINBOOL WINAPI Heap32First(LPHEAPENTRY32 lphe,DWORD th32ProcessID,ULONG_PTR th32HeapID);
'' TODO: WINBOOL WINAPI Heap32Next(LPHEAPENTRY32 lphe);
'' TODO: WINBOOL WINAPI Toolhelp32ReadProcessMemory(DWORD th32ProcessID,LPCVOID lpBaseAddress,LPVOID lpBuffer,SIZE_T cbRead,SIZE_T *lpNumberOfBytesRead);

type tagPROCESSENTRY32W
	dwSize as DWORD
	cntUsage as DWORD
	th32ProcessID as DWORD
	th32DefaultHeapID as ULONG_PTR
	th32ModuleID as DWORD
	cntThreads as DWORD
	th32ParentProcessID as DWORD
	pcPriClassBase as LONG
	dwFlags as DWORD
	szExeFile(0 to MAX_PATH - 1) as WCHAR
end type

type PROCESSENTRY32W as tagPROCESSENTRY32W
type PPROCESSENTRY32W as PROCESSENTRY32W ptr
type LPPROCESSENTRY32W as PROCESSENTRY32W ptr

'' TODO: WINBOOL WINAPI Process32FirstW(HANDLE hSnapshot,LPPROCESSENTRY32W lppe);
'' TODO: WINBOOL WINAPI Process32NextW(HANDLE hSnapshot,LPPROCESSENTRY32W lppe);

type tagPROCESSENTRY32
	dwSize as DWORD
	cntUsage as DWORD
	th32ProcessID as DWORD
	th32DefaultHeapID as ULONG_PTR
	th32ModuleID as DWORD
	cntThreads as DWORD
	th32ParentProcessID as DWORD
	pcPriClassBase as LONG
	dwFlags as DWORD
	szExeFile(0 to MAX_PATH - 1) as CHAR
end type

type PROCESSENTRY32 as tagPROCESSENTRY32
type PPROCESSENTRY32 as PROCESSENTRY32 ptr
type LPPROCESSENTRY32 as PROCESSENTRY32 ptr

'' TODO: WINBOOL WINAPI Process32First(HANDLE hSnapshot,LPPROCESSENTRY32 lppe);
'' TODO: WINBOOL WINAPI Process32Next(HANDLE hSnapshot,LPPROCESSENTRY32 lppe);

#ifdef UNICODE
	#define Process32First Process32FirstW
	#define Process32Next Process32NextW
	#define PROCESSENTRY32_ PROCESSENTRY32W
	#define PPROCESSENTRY32_ PPROCESSENTRY32W
	#define LPPROCESSENTRY32_ LPPROCESSENTRY32W
#endif

type tagTHREADENTRY32
	dwSize as DWORD
	cntUsage as DWORD
	th32ThreadID as DWORD
	th32OwnerProcessID as DWORD
	tpBasePri as LONG
	tpDeltaPri as LONG
	dwFlags as DWORD
end type

type THREADENTRY32 as tagTHREADENTRY32
type PTHREADENTRY32 as THREADENTRY32 ptr
type LPTHREADENTRY32 as THREADENTRY32 ptr

'' TODO: WINBOOL WINAPI Thread32First(HANDLE hSnapshot,LPTHREADENTRY32 lpte);
'' TODO: WINBOOL WINAPI Thread32Next(HANDLE hSnapshot,LPTHREADENTRY32 lpte);

type tagMODULEENTRY32W
	dwSize as DWORD
	th32ModuleID as DWORD
	th32ProcessID as DWORD
	GlblcntUsage as DWORD
	ProccntUsage as DWORD
	modBaseAddr as BYTE ptr
	modBaseSize as DWORD
	hModule as HMODULE
	szModule(0 to (255 + 1) - 1) as WCHAR
	szExePath(0 to MAX_PATH - 1) as WCHAR
end type

type MODULEENTRY32W as tagMODULEENTRY32W
type PMODULEENTRY32W as MODULEENTRY32W ptr
type LPMODULEENTRY32W as MODULEENTRY32W ptr

'' TODO: WINBOOL WINAPI Module32FirstW(HANDLE hSnapshot,LPMODULEENTRY32W lpme);
'' TODO: WINBOOL WINAPI Module32NextW(HANDLE hSnapshot,LPMODULEENTRY32W lpme);

type tagMODULEENTRY32
	dwSize as DWORD
	th32ModuleID as DWORD
	th32ProcessID as DWORD
	GlblcntUsage as DWORD
	ProccntUsage as DWORD
	modBaseAddr as BYTE ptr
	modBaseSize as DWORD
	hModule as HMODULE
	szModule as zstring * 255 + 1
	szExePath as zstring * MAX_PATH
end type

type MODULEENTRY32 as tagMODULEENTRY32
type PMODULEENTRY32 as MODULEENTRY32 ptr
type LPMODULEENTRY32 as MODULEENTRY32 ptr

'' TODO: WINBOOL WINAPI Module32First(HANDLE hSnapshot,LPMODULEENTRY32 lpme);
'' TODO: WINBOOL WINAPI Module32Next(HANDLE hSnapshot,LPMODULEENTRY32 lpme);

#ifdef UNICODE
	#define Module32First Module32FirstW
	#define Module32Next Module32NextW
	#define MODULEENTRY32_ MODULEENTRY32W
	#define PMODULEENTRY32_ PMODULEENTRY32W
	#define LPMODULEENTRY32_ LPMODULEENTRY32W
#endif

end extern
