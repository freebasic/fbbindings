#pragma once

#include once "crt/wchar.bi"
#include once "crt/long.bi"
#include once "_mingw_unicode.bi"
#include once "apisetcconv.bi"
#include once "bemapiset.bi"
#include once "debugapi.bi"
#include once "errhandlingapi.bi"
#include once "fibersapi.bi"
#include once "fileapi.bi"
#include once "handleapi.bi"
#include once "heapapi.bi"
#include once "ioapiset.bi"
#include once "interlockedapi.bi"
#include once "jobapi.bi"
#include once "libloaderapi.bi"
#include once "memoryapi.bi"
#include once "namedpipeapi.bi"
#include once "namespaceapi.bi"
#include once "processenv.bi"
#include once "processthreadsapi.bi"
#include once "processtopologyapi.bi"
#include once "profileapi.bi"
#include once "realtimeapiset.bi"
#include once "securityappcontainer.bi"
#include once "securitybaseapi.bi"
#include once "synchapi.bi"
#include once "sysinfoapi.bi"
#include once "systemtopologyapi.bi"
#include once "threadpoolapiset.bi"
#include once "threadpoollegacyapiset.bi"
#include once "utilapiset.bi"
#include once "wow64apiset.bi"
#include once "psdk_inc/intrin-impl.bi"
#include once "winerror.bi"
#include once "timezoneapi.bi"

#ifdef __FB_64BIT__
	extern "C"
#else
	extern "Windows"
#endif

#define _WINBASE_
#define _MINWINBASE_
#define MoveMemory RtlMoveMemory
#define CopyMemory RtlCopyMemory
#define FillMemory RtlFillMemory
#define ZeroMemory RtlZeroMemory

type _SECURITY_ATTRIBUTES
	nLength as DWORD
	lpSecurityDescriptor as LPVOID
	bInheritHandle as WINBOOL
end type

type SECURITY_ATTRIBUTES as _SECURITY_ATTRIBUTES
type PSECURITY_ATTRIBUTES as _SECURITY_ATTRIBUTES ptr
type LPSECURITY_ATTRIBUTES as _SECURITY_ATTRIBUTES ptr

type _OVERLAPPED
	Internal as ULONG_PTR
	InternalHigh as ULONG_PTR

	union
		type
			Offset as DWORD
			OffsetHigh as DWORD
		end type

		Pointer as PVOID
	end union

	hEvent as HANDLE
end type

type OVERLAPPED as _OVERLAPPED
type LPOVERLAPPED as _OVERLAPPED ptr

type _OVERLAPPED_ENTRY
	lpCompletionKey as ULONG_PTR
	lpOverlapped as LPOVERLAPPED
	Internal as ULONG_PTR
	dwNumberOfBytesTransferred as DWORD
end type

type OVERLAPPED_ENTRY as _OVERLAPPED_ENTRY
type LPOVERLAPPED_ENTRY as _OVERLAPPED_ENTRY ptr

#define _SYSTEMTIME_

type _SYSTEMTIME
	wYear as WORD
	wMonth as WORD
	wDayOfWeek as WORD
	wDay as WORD
	wHour as WORD
	wMinute as WORD
	wSecond as WORD
	wMilliseconds as WORD
end type

type SYSTEMTIME as _SYSTEMTIME
type PSYSTEMTIME as _SYSTEMTIME ptr
type LPSYSTEMTIME as _SYSTEMTIME ptr

type _WIN32_FIND_DATAA
	dwFileAttributes as DWORD
	ftCreationTime as FILETIME
	ftLastAccessTime as FILETIME
	ftLastWriteTime as FILETIME
	nFileSizeHigh as DWORD
	nFileSizeLow as DWORD
	dwReserved0 as DWORD
	dwReserved1 as DWORD
	cFileName(0 to 259) as CHAR
	cAlternateFileName(0 to 13) as CHAR
end type

type WIN32_FIND_DATAA as _WIN32_FIND_DATAA
type PWIN32_FIND_DATAA as _WIN32_FIND_DATAA ptr
type LPWIN32_FIND_DATAA as _WIN32_FIND_DATAA ptr

type _WIN32_FIND_DATAW
	dwFileAttributes as DWORD
	ftCreationTime as FILETIME
	ftLastAccessTime as FILETIME
	ftLastWriteTime as FILETIME
	nFileSizeHigh as DWORD
	nFileSizeLow as DWORD
	dwReserved0 as DWORD
	dwReserved1 as DWORD
	cFileName(0 to 259) as WCHAR
	cAlternateFileName(0 to 13) as WCHAR
end type

type WIN32_FIND_DATAW as _WIN32_FIND_DATAW
type PWIN32_FIND_DATAW as _WIN32_FIND_DATAW ptr
type LPWIN32_FIND_DATAW as _WIN32_FIND_DATAW ptr

#ifdef UNICODE
	type WIN32_FIND_DATA as WIN32_FIND_DATAW
	type PWIN32_FIND_DATA as PWIN32_FIND_DATAW
	type LPWIN32_FIND_DATA as LPWIN32_FIND_DATAW
#else
	type WIN32_FIND_DATA as WIN32_FIND_DATAA
	type PWIN32_FIND_DATA as PWIN32_FIND_DATAA
	type LPWIN32_FIND_DATA as LPWIN32_FIND_DATAA
#endif

type _FINDEX_INFO_LEVELS as long
enum
	FindExInfoStandard
	FindExInfoBasic
	FindExInfoMaxInfoLevel
end enum

type FINDEX_INFO_LEVELS as _FINDEX_INFO_LEVELS

#define FIND_FIRST_EX_CASE_SENSITIVE &h00000001
#define FIND_FIRST_EX_LARGE_FETCH &h00000002

type _FINDEX_SEARCH_OPS as long
enum
	FindExSearchNameMatch
	FindExSearchLimitToDirectories
	FindExSearchLimitToDevices
	FindExSearchMaxSearchOp
end enum

type FINDEX_SEARCH_OPS as _FINDEX_SEARCH_OPS

type _GET_FILEEX_INFO_LEVELS as long
enum
	GetFileExInfoStandard
	GetFileExMaxInfoLevel
end enum

type GET_FILEEX_INFO_LEVELS as _GET_FILEEX_INFO_LEVELS
type CRITICAL_SECTION as RTL_CRITICAL_SECTION
type PCRITICAL_SECTION as PRTL_CRITICAL_SECTION
type LPCRITICAL_SECTION as PRTL_CRITICAL_SECTION
type CRITICAL_SECTION_DEBUG as RTL_CRITICAL_SECTION_DEBUG
type PCRITICAL_SECTION_DEBUG as PRTL_CRITICAL_SECTION_DEBUG
type LPCRITICAL_SECTION_DEBUG as PRTL_CRITICAL_SECTION_DEBUG
type LPOVERLAPPED_COMPLETION_ROUTINE as sub(byval dwErrorCode as DWORD, byval dwNumberOfBytesTransfered as DWORD, byval lpOverlapped as LPOVERLAPPED)

#define LOCKFILE_FAIL_IMMEDIATELY &h1
#define LOCKFILE_EXCLUSIVE_LOCK &h2

type ___PROCESS_HEAP_ENTRY_Block
	hMem as HANDLE
	dwReserved(0 to 2) as DWORD
end type

type ___PROCESS_HEAP_ENTRY_Region
	dwCommittedSize as DWORD
	dwUnCommittedSize as DWORD
	lpFirstBlock as LPVOID
	lpLastBlock as LPVOID
end type

type _PROCESS_HEAP_ENTRY
	lpData as PVOID
	cbData as DWORD
	cbOverhead as BYTE_
	iRegionIndex as BYTE_
	wFlags as WORD

	union
		Block as ___PROCESS_HEAP_ENTRY_Block
		Region as ___PROCESS_HEAP_ENTRY_Region
	end union
end type

type PROCESS_HEAP_ENTRY as _PROCESS_HEAP_ENTRY
type LPPROCESS_HEAP_ENTRY as _PROCESS_HEAP_ENTRY ptr
type PPROCESS_HEAP_ENTRY as _PROCESS_HEAP_ENTRY ptr

#define PROCESS_HEAP_REGION &h1
#define PROCESS_HEAP_UNCOMMITTED_RANGE &h2
#define PROCESS_HEAP_ENTRY_BUSY &h4
#define PROCESS_HEAP_ENTRY_MOVEABLE &h10
#define PROCESS_HEAP_ENTRY_DDESHARE &h20

type ___REASON_CONTEXT_Detailed
	LocalizedReasonModule as HMODULE
	LocalizedReasonId as ULONG_
	ReasonStringCount as ULONG_
	ReasonStrings as LPWSTR ptr
end type

union ___REASON_CONTEXT_Reason
	Detailed as ___REASON_CONTEXT_Detailed
	SimpleReasonString as LPWSTR
end union

type _REASON_CONTEXT
	Version as ULONG_
	Flags as DWORD
	Reason as ___REASON_CONTEXT_Reason
end type

type REASON_CONTEXT as _REASON_CONTEXT
type PREASON_CONTEXT as _REASON_CONTEXT ptr

#define EXCEPTION_DEBUG_EVENT 1
#define CREATE_THREAD_DEBUG_EVENT 2
#define CREATE_PROCESS_DEBUG_EVENT 3
#define EXIT_THREAD_DEBUG_EVENT 4
#define EXIT_PROCESS_DEBUG_EVENT 5
#define LOAD_DLL_DEBUG_EVENT 6
#define UNLOAD_DLL_DEBUG_EVENT 7
#define OUTPUT_DEBUG_STRING_EVENT 8
#define RIP_EVENT 9

type PTHREAD_START_ROUTINE as function(byval lpThreadParameter as LPVOID) as DWORD
type LPTHREAD_START_ROUTINE as PTHREAD_START_ROUTINE

type _EXCEPTION_DEBUG_INFO
	ExceptionRecord as EXCEPTION_RECORD
	dwFirstChance as DWORD
end type

type EXCEPTION_DEBUG_INFO as _EXCEPTION_DEBUG_INFO
type LPEXCEPTION_DEBUG_INFO as _EXCEPTION_DEBUG_INFO ptr

type _CREATE_THREAD_DEBUG_INFO
	hThread as HANDLE
	lpThreadLocalBase as LPVOID
	lpStartAddress as LPTHREAD_START_ROUTINE
end type

type CREATE_THREAD_DEBUG_INFO as _CREATE_THREAD_DEBUG_INFO
type LPCREATE_THREAD_DEBUG_INFO as _CREATE_THREAD_DEBUG_INFO ptr

type _CREATE_PROCESS_DEBUG_INFO
	hFile as HANDLE
	hProcess as HANDLE
	hThread as HANDLE
	lpBaseOfImage as LPVOID
	dwDebugInfoFileOffset as DWORD
	nDebugInfoSize as DWORD
	lpThreadLocalBase as LPVOID
	lpStartAddress as LPTHREAD_START_ROUTINE
	lpImageName as LPVOID
	fUnicode as WORD
end type

type CREATE_PROCESS_DEBUG_INFO as _CREATE_PROCESS_DEBUG_INFO
type LPCREATE_PROCESS_DEBUG_INFO as _CREATE_PROCESS_DEBUG_INFO ptr

type _EXIT_THREAD_DEBUG_INFO
	dwExitCode as DWORD
end type

type EXIT_THREAD_DEBUG_INFO as _EXIT_THREAD_DEBUG_INFO
type LPEXIT_THREAD_DEBUG_INFO as _EXIT_THREAD_DEBUG_INFO ptr

type _EXIT_PROCESS_DEBUG_INFO
	dwExitCode as DWORD
end type

type EXIT_PROCESS_DEBUG_INFO as _EXIT_PROCESS_DEBUG_INFO
type LPEXIT_PROCESS_DEBUG_INFO as _EXIT_PROCESS_DEBUG_INFO ptr

type _LOAD_DLL_DEBUG_INFO
	hFile as HANDLE
	lpBaseOfDll as LPVOID
	dwDebugInfoFileOffset as DWORD
	nDebugInfoSize as DWORD
	lpImageName as LPVOID
	fUnicode as WORD
end type

type LOAD_DLL_DEBUG_INFO as _LOAD_DLL_DEBUG_INFO
type LPLOAD_DLL_DEBUG_INFO as _LOAD_DLL_DEBUG_INFO ptr

type _UNLOAD_DLL_DEBUG_INFO
	lpBaseOfDll as LPVOID
end type

type UNLOAD_DLL_DEBUG_INFO as _UNLOAD_DLL_DEBUG_INFO
type LPUNLOAD_DLL_DEBUG_INFO as _UNLOAD_DLL_DEBUG_INFO ptr

type _OUTPUT_DEBUG_STRING_INFO
	lpDebugStringData as LPSTR
	fUnicode as WORD
	nDebugStringLength as WORD
end type

type OUTPUT_DEBUG_STRING_INFO as _OUTPUT_DEBUG_STRING_INFO
type LPOUTPUT_DEBUG_STRING_INFO as _OUTPUT_DEBUG_STRING_INFO ptr

type _RIP_INFO
	dwError as DWORD
	dwType as DWORD
end type

type RIP_INFO as _RIP_INFO
type LPRIP_INFO as _RIP_INFO ptr

union ___DEBUG_EVENT_u
	Exception as EXCEPTION_DEBUG_INFO
	CreateThread as CREATE_THREAD_DEBUG_INFO
	CreateProcessInfo as CREATE_PROCESS_DEBUG_INFO
	ExitThread as EXIT_THREAD_DEBUG_INFO
	ExitProcess as EXIT_PROCESS_DEBUG_INFO
	LoadDll as LOAD_DLL_DEBUG_INFO
	UnloadDll as UNLOAD_DLL_DEBUG_INFO
	DebugString as OUTPUT_DEBUG_STRING_INFO
	RipInfo as RIP_INFO
end union

type _DEBUG_EVENT
	dwDebugEventCode as DWORD
	dwProcessId as DWORD
	dwThreadId as DWORD
	u as ___DEBUG_EVENT_u
end type

type DEBUG_EVENT as _DEBUG_EVENT
type LPDEBUG_EVENT as _DEBUG_EVENT ptr
type LPCONTEXT as PCONTEXT

#define STILL_ACTIVE STATUS_PENDING
#define EXCEPTION_ACCESS_VIOLATION STATUS_ACCESS_VIOLATION
#define EXCEPTION_DATATYPE_MISALIGNMENT STATUS_DATATYPE_MISALIGNMENT
#define EXCEPTION_BREAKPOINT STATUS_BREAKPOINT
#define EXCEPTION_SINGLE_STEP STATUS_SINGLE_STEP
#define EXCEPTION_ARRAY_BOUNDS_EXCEEDED STATUS_ARRAY_BOUNDS_EXCEEDED
#define EXCEPTION_FLT_DENORMAL_OPERAND STATUS_FLOAT_DENORMAL_OPERAND
#define EXCEPTION_FLT_DIVIDE_BY_ZERO STATUS_FLOAT_DIVIDE_BY_ZERO
#define EXCEPTION_FLT_INEXACT_RESULT STATUS_FLOAT_INEXACT_RESULT
#define EXCEPTION_FLT_INVALID_OPERATION STATUS_FLOAT_INVALID_OPERATION
#define EXCEPTION_FLT_OVERFLOW STATUS_FLOAT_OVERFLOW
#define EXCEPTION_FLT_STACK_CHECK STATUS_FLOAT_STACK_CHECK
#define EXCEPTION_FLT_UNDERFLOW STATUS_FLOAT_UNDERFLOW
#define EXCEPTION_INT_DIVIDE_BY_ZERO STATUS_INTEGER_DIVIDE_BY_ZERO
#define EXCEPTION_INT_OVERFLOW STATUS_INTEGER_OVERFLOW
#define EXCEPTION_PRIV_INSTRUCTION STATUS_PRIVILEGED_INSTRUCTION
#define EXCEPTION_IN_PAGE_ERROR STATUS_IN_PAGE_ERROR
#define EXCEPTION_ILLEGAL_INSTRUCTION STATUS_ILLEGAL_INSTRUCTION
#define EXCEPTION_NONCONTINUABLE_EXCEPTION STATUS_NONCONTINUABLE_EXCEPTION
#define EXCEPTION_STACK_OVERFLOW STATUS_STACK_OVERFLOW
#define EXCEPTION_INVALID_DISPOSITION STATUS_INVALID_DISPOSITION
#define EXCEPTION_GUARD_PAGE STATUS_GUARD_PAGE_VIOLATION
#define EXCEPTION_INVALID_HANDLE STATUS_INVALID_HANDLE
#define EXCEPTION_POSSIBLE_DEADLOCK STATUS_POSSIBLE_DEADLOCK
#define CONTROL_C_EXIT STATUS_CONTROL_C_EXIT
#define LMEM_FIXED &h0
#define LMEM_MOVEABLE &h2
#define LMEM_NOCOMPACT &h10
#define LMEM_NODISCARD &h20
#define LMEM_ZEROINIT &h40
#define LMEM_MODIFY &h80
#define LMEM_DISCARDABLE &hf00
#define LMEM_VALID_FLAGS &hf72
#define LMEM_INVALID_HANDLE &h8000
#define LHND (LMEM_MOVEABLE or LMEM_ZEROINIT)
#define LPTR (LMEM_FIXED or LMEM_ZEROINIT)
#define NONZEROLHND LMEM_MOVEABLE
#define NONZEROLPTR LMEM_FIXED
#define LocalDiscard(h) LocalReAlloc((h), 0, LMEM_MOVEABLE)
#define LMEM_DISCARDED &h4000
#define LMEM_LOCKCOUNT &hff
#define GetCurrentTime() GetTickCount()

'' TODO: #define DefineHandleTable(w) ( { (VOID)(w); TRUE; } )

#define LimitEmsPages(dw)
#define SetSwapAreaSize(w) (w)
#define LockSegment(w) GlobalFix(cast(HANDLE, (w)))
#define UnlockSegment(w) GlobalUnfix(cast(HANDLE, (w)))
#define Yield()
#define FILE_BEGIN 0
#define FILE_CURRENT 1
#define FILE_END 2
#define WAIT_FAILED cast(DWORD, &hffffffff)
#define WAIT_OBJECT_0 (STATUS_WAIT_0 + 0)
#define WAIT_ABANDONED (STATUS_ABANDONED_WAIT_0 + 0)
#define WAIT_ABANDONED_0 (STATUS_ABANDONED_WAIT_0 + 0)
#define WAIT_IO_COMPLETION STATUS_USER_APC
#define SecureZeroMemory RtlSecureZeroMemory
#define CaptureStackBackTrace RtlCaptureStackBackTrace
#define FILE_FLAG_WRITE_THROUGH &h80000000
#define FILE_FLAG_OVERLAPPED &h40000000
#define FILE_FLAG_NO_BUFFERING &h20000000
#define FILE_FLAG_RANDOM_ACCESS &h10000000
#define FILE_FLAG_SEQUENTIAL_SCAN &h8000000
#define FILE_FLAG_DELETE_ON_CLOSE &h4000000
#define FILE_FLAG_BACKUP_SEMANTICS &h2000000
#define FILE_FLAG_POSIX_SEMANTICS &h1000000
#define FILE_FLAG_SESSION_AWARE &h800000
#define FILE_FLAG_OPEN_REPARSE_POINT &h200000
#define FILE_FLAG_OPEN_NO_RECALL &h100000
#define FILE_FLAG_FIRST_PIPE_INSTANCE &h80000
#define PROGRESS_CONTINUE 0
#define PROGRESS_CANCEL 1
#define PROGRESS_STOP 2
#define PROGRESS_QUIET 3
#define CALLBACK_CHUNK_FINISHED &h0
#define CALLBACK_STREAM_SWITCH &h1
#define COPY_FILE_FAIL_IF_EXISTS &h1
#define COPY_FILE_RESTARTABLE &h2
#define COPY_FILE_OPEN_SOURCE_FOR_WRITE &h4
#define COPY_FILE_ALLOW_DECRYPTED_DESTINATION &h8
#define REPLACEFILE_WRITE_THROUGH &h1
#define REPLACEFILE_IGNORE_MERGE_ERRORS &h2
#define PIPE_ACCESS_INBOUND &h1
#define PIPE_ACCESS_OUTBOUND &h2
#define PIPE_ACCESS_DUPLEX &h3
#define PIPE_CLIENT_END &h0
#define PIPE_SERVER_END &h1
#define PIPE_WAIT &h0
#define PIPE_NOWAIT &h1
#define PIPE_READMODE_BYTE &h0
#define PIPE_READMODE_MESSAGE &h2
#define PIPE_TYPE_BYTE &h0
#define PIPE_TYPE_MESSAGE &h4
#define PIPE_ACCEPT_REMOTE_CLIENTS &h0
#define PIPE_REJECT_REMOTE_CLIENTS &h8
#define PIPE_UNLIMITED_INSTANCES 255
#define SECURITY_ANONYMOUS (SecurityAnonymous shl 16)
#define SECURITY_IDENTIFICATION (SecurityIdentification shl 16)
#define SECURITY_IMPERSONATION (SecurityImpersonation shl 16)
#define SECURITY_DELEGATION (SecurityDelegation shl 16)
#define SECURITY_CONTEXT_TRACKING &h40000
#define SECURITY_EFFECTIVE_ONLY &h80000
#define SECURITY_SQOS_PRESENT &h100000
#define SECURITY_VALID_SQOS_FLAGS &h1f0000
#define FAIL_FAST_GENERATE_EXCEPTION_ADDRESS &h1
#define FAIL_FAST_NO_HARD_ERROR_DLG &h2

type PFIBER_START_ROUTINE as sub(byval lpFiberParameter as LPVOID)
type LPFIBER_START_ROUTINE as PFIBER_START_ROUTINE

#ifdef __FB_64BIT__
	type LPLDT_ENTRY as LPVOID
#else
	type LPLDT_ENTRY as PLDT_ENTRY
#endif

#define SP_SERIALCOMM cast(DWORD, &h1)
#define PST_UNSPECIFIED cast(DWORD, &h0)
#define PST_RS232 cast(DWORD, &h1)
#define PST_PARALLELPORT cast(DWORD, &h2)
#define PST_RS422 cast(DWORD, &h3)
#define PST_RS423 cast(DWORD, &h4)
#define PST_RS449 cast(DWORD, &h5)
#define PST_MODEM cast(DWORD, &h6)
#define PST_FAX cast(DWORD, &h21)
#define PST_SCANNER cast(DWORD, &h22)
#define PST_NETWORK_BRIDGE cast(DWORD, &h100)
#define PST_LAT cast(DWORD, &h101)
#define PST_TCPIP_TELNET cast(DWORD, &h102)
#define PST_X25 cast(DWORD, &h103)
#define PCF_DTRDSR cast(DWORD, &h1)
#define PCF_RTSCTS cast(DWORD, &h2)
#define PCF_RLSD cast(DWORD, &h4)
#define PCF_PARITY_CHECK cast(DWORD, &h8)
#define PCF_XONXOFF cast(DWORD, &h10)
#define PCF_SETXCHAR cast(DWORD, &h20)
#define PCF_TOTALTIMEOUTS cast(DWORD, &h40)
#define PCF_INTTIMEOUTS cast(DWORD, &h80)
#define PCF_SPECIALCHARS cast(DWORD, &h100)
#define PCF_16BITMODE cast(DWORD, &h200)
#define SP_PARITY cast(DWORD, &h1)
#define SP_BAUD cast(DWORD, &h2)
#define SP_DATABITS cast(DWORD, &h4)
#define SP_STOPBITS cast(DWORD, &h8)
#define SP_HANDSHAKING cast(DWORD, &h10)
#define SP_PARITY_CHECK cast(DWORD, &h20)
#define SP_RLSD cast(DWORD, &h40)
#define BAUD_075 cast(DWORD, &h1)
#define BAUD_110 cast(DWORD, &h2)
#define BAUD_134_5 cast(DWORD, &h4)
#define BAUD_150 cast(DWORD, &h8)
#define BAUD_300 cast(DWORD, &h10)
#define BAUD_600 cast(DWORD, &h20)
#define BAUD_1200 cast(DWORD, &h40)
#define BAUD_1800 cast(DWORD, &h80)
#define BAUD_2400 cast(DWORD, &h100)
#define BAUD_4800 cast(DWORD, &h200)
#define BAUD_7200 cast(DWORD, &h400)
#define BAUD_9600 cast(DWORD, &h800)
#define BAUD_14400 cast(DWORD, &h1000)
#define BAUD_19200 cast(DWORD, &h2000)
#define BAUD_38400 cast(DWORD, &h4000)
#define BAUD_56K cast(DWORD, &h8000)
#define BAUD_128K cast(DWORD, &h10000)
#define BAUD_115200 cast(DWORD, &h20000)
#define BAUD_57600 cast(DWORD, &h40000)
#define BAUD_USER cast(DWORD, &h10000000)
#define DATABITS_5 cast(WORD, &h1)
#define DATABITS_6 cast(WORD, &h2)
#define DATABITS_7 cast(WORD, &h4)
#define DATABITS_8 cast(WORD, &h8)
#define DATABITS_16 cast(WORD, &h10)
#define DATABITS_16X cast(WORD, &h20)
#define STOPBITS_10 cast(WORD, &h1)
#define STOPBITS_15 cast(WORD, &h2)
#define STOPBITS_20 cast(WORD, &h4)
#define PARITY_NONE cast(WORD, &h100)
#define PARITY_ODD cast(WORD, &h200)
#define PARITY_EVEN cast(WORD, &h400)
#define PARITY_MARK cast(WORD, &h800)
#define PARITY_SPACE cast(WORD, &h1000)

type _COMMPROP
	wPacketLength as WORD
	wPacketVersion as WORD
	dwServiceMask as DWORD
	dwReserved1 as DWORD
	dwMaxTxQueue as DWORD
	dwMaxRxQueue as DWORD
	dwMaxBaud as DWORD
	dwProvSubType as DWORD
	dwProvCapabilities as DWORD
	dwSettableParams as DWORD
	dwSettableBaud as DWORD
	wSettableData as WORD
	wSettableStopParity as WORD
	dwCurrentTxQueue as DWORD
	dwCurrentRxQueue as DWORD
	dwProvSpec1 as DWORD
	dwProvSpec2 as DWORD
	wcProvChar(0 to 0) as WCHAR
end type

type COMMPROP as _COMMPROP
type LPCOMMPROP as _COMMPROP ptr

#define COMMPROP_INITIALIZED cast(DWORD, &he73cf52e)

type _COMSTAT
	fCtsHold : 1 as DWORD
	fDsrHold : 1 as DWORD
	fRlsdHold : 1 as DWORD
	fXoffHold : 1 as DWORD
	fXoffSent : 1 as DWORD
	fEof : 1 as DWORD
	fTxim : 1 as DWORD
	fReserved : 25 as DWORD
	cbInQue as DWORD
	cbOutQue as DWORD
end type

type COMSTAT as _COMSTAT
type LPCOMSTAT as _COMSTAT ptr

#define DTR_CONTROL_DISABLE &h0
#define DTR_CONTROL_ENABLE &h1
#define DTR_CONTROL_HANDSHAKE &h2
#define RTS_CONTROL_DISABLE &h0
#define RTS_CONTROL_ENABLE &h1
#define RTS_CONTROL_HANDSHAKE &h2
#define RTS_CONTROL_TOGGLE &h3

type _DCB
	DCBlength as DWORD
	BaudRate as DWORD
	fBinary : 1 as DWORD
	fParity : 1 as DWORD
	fOutxCtsFlow : 1 as DWORD
	fOutxDsrFlow : 1 as DWORD
	fDtrControl : 2 as DWORD
	fDsrSensitivity : 1 as DWORD
	fTXContinueOnXoff : 1 as DWORD
	fOutX : 1 as DWORD
	fInX : 1 as DWORD
	fErrorChar : 1 as DWORD
	fNull : 1 as DWORD
	fRtsControl : 2 as DWORD
	fAbortOnError : 1 as DWORD
	fDummy2 : 17 as DWORD
	wReserved as WORD
	XonLim as WORD
	XoffLim as WORD
	ByteSize as BYTE_
	Parity as BYTE_
	StopBits as BYTE_
	XonChar as byte
	XoffChar as byte
	ErrorChar as byte
	EofChar as byte
	EvtChar as byte
	wReserved1 as WORD
end type

type DCB as _DCB
type LPDCB as _DCB ptr

type _COMMTIMEOUTS
	ReadIntervalTimeout as DWORD
	ReadTotalTimeoutMultiplier as DWORD
	ReadTotalTimeoutConstant as DWORD
	WriteTotalTimeoutMultiplier as DWORD
	WriteTotalTimeoutConstant as DWORD
end type

type COMMTIMEOUTS as _COMMTIMEOUTS
type LPCOMMTIMEOUTS as _COMMTIMEOUTS ptr

type _COMMCONFIG
	dwSize as DWORD
	wVersion as WORD
	wReserved as WORD
	dcb as DCB
	dwProviderSubType as DWORD
	dwProviderOffset as DWORD
	dwProviderSize as DWORD
	wcProviderData(0 to 0) as WCHAR
end type

type COMMCONFIG as _COMMCONFIG
type LPCOMMCONFIG as _COMMCONFIG ptr

#define FreeModule(hLibModule) FreeLibrary((hLibModule))
#define MakeProcInstance(lpProc, hInstance) (lpProc)
#define FreeProcInstance(lpProc) (lpProc)
#define GMEM_FIXED &h0
#define GMEM_MOVEABLE &h2
#define GMEM_NOCOMPACT &h10
#define GMEM_NODISCARD &h20
#define GMEM_ZEROINIT &h40
#define GMEM_MODIFY &h80
#define GMEM_DISCARDABLE &h100
#define GMEM_NOT_BANKED &h1000
#define GMEM_SHARE &h2000
#define GMEM_DDESHARE &h2000
#define GMEM_NOTIFY &h4000
#define GMEM_LOWER GMEM_NOT_BANKED
#define GMEM_VALID_FLAGS &h7f72
#define GMEM_INVALID_HANDLE &h8000
#define GHND (GMEM_MOVEABLE or GMEM_ZEROINIT)
#define GPTR (GMEM_FIXED or GMEM_ZEROINIT)
#define GlobalLRUNewest(h) cast(HANDLE, (h))
#define GlobalLRUOldest(h) cast(HANDLE, (h))
#define GlobalDiscard(h) GlobalReAlloc((h), 0, GMEM_MOVEABLE)
#define GMEM_DISCARDED &h4000
#define GMEM_LOCKCOUNT &h00ff

type _MEMORYSTATUS
	dwLength as DWORD
	dwMemoryLoad as DWORD
	dwTotalPhys as SIZE_T_
	dwAvailPhys as SIZE_T_
	dwTotalPageFile as SIZE_T_
	dwAvailPageFile as SIZE_T_
	dwTotalVirtual as SIZE_T_
	dwAvailVirtual as SIZE_T_
end type

type MEMORYSTATUS as _MEMORYSTATUS
type LPMEMORYSTATUS as _MEMORYSTATUS ptr

#define NUMA_NO_PREFERRED_NODE cast(DWORD, -1)
#define DEBUG_PROCESS &h1
#define DEBUG_ONLY_THIS_PROCESS &h2
#define CREATE_SUSPENDED &h4
#define DETACHED_PROCESS &h8
#define CREATE_NEW_CONSOLE &h10
#define NORMAL_PRIORITY_CLASS &h20
#define IDLE_PRIORITY_CLASS &h40
#define HIGH_PRIORITY_CLASS &h80
#define REALTIME_PRIORITY_CLASS &h100
#define CREATE_NEW_PROCESS_GROUP &h200
#define CREATE_UNICODE_ENVIRONMENT &h400
#define CREATE_SEPARATE_WOW_VDM &h800
#define CREATE_SHARED_WOW_VDM &h1000
#define CREATE_FORCEDOS &h2000
#define BELOW_NORMAL_PRIORITY_CLASS &h4000
#define ABOVE_NORMAL_PRIORITY_CLASS &h8000
#define INHERIT_PARENT_AFFINITY &h10000
#define INHERIT_CALLER_PRIORITY &h20000
#define CREATE_PROTECTED_PROCESS &h40000
#define EXTENDED_STARTUPINFO_PRESENT &h80000
#define PROCESS_MODE_BACKGROUND_BEGIN &h100000
#define PROCESS_MODE_BACKGROUND_END &h200000
#define CREATE_BREAKAWAY_FROM_JOB &h1000000
#define CREATE_PRESERVE_CODE_AUTHZ_LEVEL &h2000000
#define CREATE_DEFAULT_ERROR_MODE &h4000000
#define CREATE_NO_WINDOW &h8000000
#define PROFILE_USER &h10000000
#define PROFILE_KERNEL &h20000000
#define PROFILE_SERVER &h40000000
#define CREATE_IGNORE_SYSTEM_DEFAULT &h80000000
#define STACK_SIZE_PARAM_IS_A_RESERVATION &h10000
#define THREAD_PRIORITY_LOWEST THREAD_BASE_PRIORITY_MIN
#define THREAD_PRIORITY_BELOW_NORMAL (THREAD_PRIORITY_LOWEST + 1)
#define THREAD_PRIORITY_NORMAL 0
#define THREAD_PRIORITY_HIGHEST THREAD_BASE_PRIORITY_MAX
#define THREAD_PRIORITY_ABOVE_NORMAL (THREAD_PRIORITY_HIGHEST - 1)
#define THREAD_PRIORITY_ERROR_RETURN MAXLONG
#define THREAD_PRIORITY_TIME_CRITICAL THREAD_BASE_PRIORITY_LOWRT
#define THREAD_PRIORITY_IDLE THREAD_BASE_PRIORITY_IDLE
#define THREAD_MODE_BACKGROUND_BEGIN &h00010000
#define THREAD_MODE_BACKGROUND_END &h00020000
#define VOLUME_NAME_DOS &h0
#define VOLUME_NAME_GUID &h1
#define VOLUME_NAME_NT &h2
#define VOLUME_NAME_NONE &h4
#define FILE_NAME_NORMALIZED &h0
#define FILE_NAME_OPENED &h8

type _JIT_DEBUG_INFO
	dwSize as DWORD
	dwProcessorArchitecture as DWORD
	dwThreadID as DWORD
	dwReserved0 as DWORD
	lpExceptionAddress as ULONG64
	lpExceptionRecord as ULONG64
	lpContextRecord as ULONG64
end type

type JIT_DEBUG_INFO as _JIT_DEBUG_INFO
type LPJIT_DEBUG_INFO as _JIT_DEBUG_INFO ptr
type JIT_DEBUG_INFO32 as JIT_DEBUG_INFO
type LPJIT_DEBUG_INFO32 as JIT_DEBUG_INFO ptr
type JIT_DEBUG_INFO64 as JIT_DEBUG_INFO
type LPJIT_DEBUG_INFO64 as JIT_DEBUG_INFO ptr
type LPEXCEPTION_RECORD as PEXCEPTION_RECORD
type LPEXCEPTION_POINTERS as PEXCEPTION_POINTERS

#define DRIVE_UNKNOWN 0
#define DRIVE_NO_ROOT_DIR 1
#define DRIVE_REMOVABLE 2
#define DRIVE_FIXED 3
#define DRIVE_REMOTE 4
#define DRIVE_CDROM 5
#define DRIVE_RAMDISK 6
#define GetFreeSpace(w) __MSABI_LONG(&h100000)
#define FILE_TYPE_UNKNOWN &h0
#define FILE_TYPE_DISK &h1
#define FILE_TYPE_CHAR &h2
#define FILE_TYPE_PIPE &h3
#define FILE_TYPE_REMOTE &h8000
#define STD_INPUT_HANDLE cast(DWORD, -10)
#define STD_OUTPUT_HANDLE cast(DWORD, -11)
#define STD_ERROR_HANDLE cast(DWORD, -12)
#define NOPARITY 0
#define ODDPARITY 1
#define EVENPARITY 2
#define MARKPARITY 3
#define SPACEPARITY 4
#define ONESTOPBIT 0
#define ONE5STOPBITS 1
#define TWOSTOPBITS 2
#define IGNORE 0
#define INFINITE &hffffffff
#define CBR_110 110
#define CBR_300 300
#define CBR_600 600
#define CBR_1200 1200
#define CBR_2400 2400
#define CBR_4800 4800
#define CBR_9600 9600
#define CBR_14400 14400
#define CBR_19200 19200
#define CBR_38400 38400
#define CBR_56000 56000
#define CBR_57600 57600
#define CBR_115200 115200
#define CBR_128000 128000
#define CBR_256000 256000
#define CE_RXOVER &h1
#define CE_OVERRUN &h2
#define CE_RXPARITY &h4
#define CE_FRAME &h8
#define CE_BREAK &h10
#define CE_TXFULL &h100
#define CE_PTO &h200
#define CE_IOE &h400
#define CE_DNS &h800
#define CE_OOP &h1000
#define CE_MODE &h8000
#define IE_BADID (-1)
#define IE_OPEN (-2)
#define IE_NOPEN (-3)
#define IE_MEMORY (-4)
#define IE_DEFAULT (-5)
#define IE_HARDWARE (-10)
#define IE_BYTESIZE (-11)
#define IE_BAUDRATE (-12)
#define EV_RXCHAR &h1
#define EV_RXFLAG &h2
#define EV_TXEMPTY &h4
#define EV_CTS &h8
#define EV_DSR &h10
#define EV_RLSD &h20
#define EV_BREAK &h40
#define EV_ERR &h80
#define EV_RING &h100
#define EV_PERR &h200
#define EV_RX80FULL &h400
#define EV_EVENT1 &h800
#define EV_EVENT2 &h1000
#define SETXOFF 1
#define SETXON 2
#define SETRTS 3
#define CLRRTS 4
#define SETDTR 5
#define CLRDTR 6
#define RESETDEV 7
#define SETBREAK 8
#define CLRBREAK 9
#define PURGE_TXABORT &h1
#define PURGE_RXABORT &h2
#define PURGE_TXCLEAR &h4
#define PURGE_RXCLEAR &h8
#define LPTx &h80
#define MS_CTS_ON cast(DWORD, &h10)
#define MS_DSR_ON cast(DWORD, &h20)
#define MS_RING_ON cast(DWORD, &h40)
#define MS_RLSD_ON cast(DWORD, &h80)
#define S_QUEUEEMPTY 0
#define S_THRESHOLD 1
#define S_ALLTHRESHOLD 2
#define S_NORMAL 0
#define S_LEGATO 1
#define S_STACCATO 2
#define S_PERIOD512 0
#define S_PERIOD1024 1
#define S_PERIOD2048 2
#define S_PERIODVOICE 3
#define S_WHITE512 4
#define S_WHITE1024 5
#define S_WHITE2048 6
#define S_WHITEVOICE 7
#define S_SERDVNA (-1)
#define S_SEROFM (-2)
#define S_SERMACT (-3)
#define S_SERQFUL (-4)
#define S_SERBDNT (-5)
#define S_SERDLN (-6)
#define S_SERDCC (-7)
#define S_SERDTP (-8)
#define S_SERDVL (-9)
#define S_SERDMD (-10)
#define S_SERDSH (-11)
#define S_SERDPT (-12)
#define S_SERDFQ (-13)
#define S_SERDDR (-14)
#define S_SERDSR (-15)
#define S_SERDST (-16)
#define NMPWAIT_WAIT_FOREVER &hffffffff
#define NMPWAIT_NOWAIT &h1
#define NMPWAIT_USE_DEFAULT_WAIT &h0
#define FS_CASE_IS_PRESERVED FILE_CASE_PRESERVED_NAMES
#define FS_CASE_SENSITIVE FILE_CASE_SENSITIVE_SEARCH
#define FS_UNICODE_STORED_ON_DISK FILE_UNICODE_ON_DISK
#define FS_PERSISTENT_ACLS FILE_PERSISTENT_ACLS
#define FS_VOL_IS_COMPRESSED FILE_VOLUME_IS_COMPRESSED
#define FS_FILE_COMPRESSION FILE_FILE_COMPRESSION
#define FS_FILE_ENCRYPTION FILE_SUPPORTS_ENCRYPTION
#define OF_READ &h0
#define OF_WRITE &h1
#define OF_READWRITE &h2
#define OF_SHARE_COMPAT &h0
#define OF_SHARE_EXCLUSIVE &h10
#define OF_SHARE_DENY_WRITE &h20
#define OF_SHARE_DENY_READ &h30
#define OF_SHARE_DENY_NONE &h40
#define OF_PARSE &h100
#define OF_DELETE &h200
#define OF_VERIFY &h400
#define OF_CANCEL &h800
#define OF_CREATE &h1000
#define OF_PROMPT &h2000
#define OF_EXIST &h4000
#define OF_REOPEN &h8000
#define OFS_MAXPATHNAME 128

type _OFSTRUCT
	cBytes as BYTE_
	fFixedDisk as BYTE_
	nErrCode as WORD
	Reserved1 as WORD
	Reserved2 as WORD
	szPathName(0 to 127) as CHAR
end type

type OFSTRUCT as _OFSTRUCT
type LPOFSTRUCT as _OFSTRUCT ptr
type POFSTRUCT as _OFSTRUCT ptr

#ifdef __FB_64BIT__
	#define InterlockedIncrement _InterlockedIncrement
#else
	'' TODO: extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) LONGLONG InterlockedAnd64 (LONGLONG volatile *Destination, LONGLONG Value) { LONGLONG Old; do { Old = *Destination; } while (InterlockedCompareExchange64 (Destination, Old &Value, Old) != Old); return Old; } extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) LONGLONG InterlockedOr64 (LONGLONG volatile *Destination, LONGLONG Value) { LONGLONG Old; do { Old = *Destination; } while (InterlockedCompareExchange64 (Destination, Old | Value, Old) != Old); return Old; } extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) LONGLONG InterlockedXor64 (LONGLONG volatile *Destination, LONGLONG Value) { LONGLONG Old; do { Old = *Destination; } while (InterlockedCompareExchange64 (Destination, Old ^ Value, Old) != Old); return Old; } extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) LONGLONG InterlockedIncrement64 (LONGLONG volatile *Addend) { LONGLONG Old; do { Old = *Addend; } while (InterlockedCompareExchange64 (Addend, Old + 1, Old) != Old); return Old + 1; } extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) LONGLONG InterlockedDecrement64 (LONGLONG volatile *Addend) { LONGLONG Old; do { Old = *Addend; } while (InterlockedCompareExchange64 (Addend, Old - 1, Old) != Old); return Old - 1; } extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) LONGLONG InterlockedExchange64 (LONGLONG volatile *Target, LONGLONG Value) { LONGLONG Old; do { Old = *Target; } while (InterlockedCompareExchange64 (Target, Value, Old) != Old); return Old; } extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) LONGLONG InterlockedExchangeAdd64 (LONGLONG volatile *Addend, LONGLONG Value) { LONGLONG Old; do { Old = *Addend; } while (InterlockedCompareExchange64 (Addend, Old + Value, Old) != Old); return Old; } int __attribute__((__stdcall__)) WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nShowCmd);

	#define InterlockedCompareExchangePointer(Destination, ExChange, Comperand) cast(PVOID, cast(LONG_PTR, InterlockedCompareExchange(cptr(LONG_ ptr, (Destination)), cast(LONG_, cast(LONG_PTR, (ExChange))), cast(LONG_, cast(LONG_PTR, (Comperand))))))
	#define InterlockedDecrementAcquire InterlockedDecrement
	#define InterlockedDecrementRelease InterlockedDecrement
#endif

#define InterlockedIncrementAcquire InterlockedIncrement
#define InterlockedIncrementRelease InterlockedIncrement

#ifdef __FB_64BIT__
	#define InterlockedDecrement _InterlockedDecrement
	#define InterlockedDecrementAcquire InterlockedDecrement
	#define InterlockedDecrementRelease InterlockedDecrement
	#define InterlockedExchange _InterlockedExchange
	#define InterlockedExchangeAdd _InterlockedExchangeAdd
	#define InterlockedCompareExchange _InterlockedCompareExchange
#endif

#define InterlockedCompareExchangeAcquire InterlockedCompareExchange
#define InterlockedCompareExchangeRelease InterlockedCompareExchange

#ifdef __FB_64BIT__
	#define InterlockedExchangePointer _InterlockedExchangePointer
	#define InterlockedCompareExchangePointer _InterlockedCompareExchangePointer
	#define InterlockedCompareExchangePointerAcquire _InterlockedCompareExchangePointer
	#define InterlockedCompareExchangePointerRelease _InterlockedCompareExchangePointer
	#define InterlockedAnd64 _InterlockedAnd64
	#define InterlockedOr64 _InterlockedOr64
	#define InterlockedXor64 _InterlockedXor64
	#define InterlockedIncrement64 _InterlockedIncrement64
	#define InterlockedDecrement64 _InterlockedDecrement64
	#define InterlockedExchange64 _InterlockedExchange64
	#define InterlockedExchangeAdd64 _InterlockedExchangeAdd64
	#define InterlockedCompareExchange64 _InterlockedCompareExchange64
#endif

#define InterlockedCompareExchangeAcquire64 InterlockedCompareExchange64
#define InterlockedCompareExchangeRelease64 InterlockedCompareExchange64

#ifdef __FB_64BIT__
	#define InterlockedAnd8 _InterlockedAnd8
	#define InterlockedOr8 _InterlockedOr8
	#define InterlockedXor8 _InterlockedXor8
	#define InterlockedAnd16 _InterlockedAnd16
	#define InterlockedOr16 _InterlockedOr16
	#define InterlockedXor16 _InterlockedXor16

	declare function _InterlockedAnd(byval Destination as LONG_ ptr, byval Value as LONG_) as LONG_
	declare function _InterlockedOr(byval Destination as LONG_ ptr, byval Value as LONG_) as LONG_
	declare function _InterlockedXor(byval Destination as LONG_ ptr, byval Value as LONG_) as LONG_
	declare function _InterlockedAnd8(byval Destination as zstring ptr, byval Value as byte) as byte
	declare function _InterlockedOr8(byval Destination as zstring ptr, byval Value as byte) as byte
	declare function _InterlockedXor8(byval Destination as zstring ptr, byval Value as byte) as byte
	declare function _InterlockedAnd16(byval Destination as SHORT_ ptr, byval Value as SHORT_) as SHORT_
	declare function _InterlockedOr16(byval Destination as SHORT_ ptr, byval Value as SHORT_) as SHORT_
	declare function _InterlockedXor16(byval Destination as SHORT_ ptr, byval Value as SHORT_) as SHORT_
#else
	#define InterlockedCompareExchangePointerAcquire InterlockedCompareExchangePointer
	#define InterlockedCompareExchangePointerRelease InterlockedCompareExchangePointer
#endif

'' TODO: #define UnlockResource(hResData) ( { (VOID)(hResData); 0; } )

#define MAXINTATOM &hc000
#define MAKEINTATOM(i) cast(LPTSTR, cast(ULONG_PTR, cast(WORD, (i))))
#define INVALID_ATOM cast(ATOM, 0)

#ifdef __FB_64BIT__
	declare function WinMain(byval hInstance as HINSTANCE, byval hPrevInstance as HINSTANCE, byval lpCmdLine as LPSTR, byval nShowCmd as long) as long
#endif

declare function wWinMain(byval hInstance as HINSTANCE, byval hPrevInstance as HINSTANCE, byval lpCmdLine as LPWSTR, byval nShowCmd as long) as long
declare function GlobalAlloc(byval uFlags as UINT, byval dwBytes as SIZE_T_) as HGLOBAL
declare function GlobalReAlloc(byval hMem as HGLOBAL, byval dwBytes as SIZE_T_, byval uFlags as UINT) as HGLOBAL
declare function GlobalSize(byval hMem as HGLOBAL) as SIZE_T_
declare function GlobalFlags(byval hMem as HGLOBAL) as UINT
declare function GlobalLock(byval hMem as HGLOBAL) as LPVOID
declare function GlobalHandle(byval pMem as LPCVOID) as HGLOBAL
declare function GlobalUnlock(byval hMem as HGLOBAL) as WINBOOL
declare function GlobalFree(byval hMem as HGLOBAL) as HGLOBAL
declare function GlobalCompact(byval dwMinFree as DWORD) as SIZE_T_
declare sub GlobalFix(byval hMem as HGLOBAL)
declare sub GlobalUnfix(byval hMem as HGLOBAL)
declare function GlobalWire(byval hMem as HGLOBAL) as LPVOID
declare function GlobalUnWire(byval hMem as HGLOBAL) as WINBOOL
declare sub GlobalMemoryStatus(byval lpBuffer as LPMEMORYSTATUS)
declare function LocalAlloc(byval uFlags as UINT, byval uBytes as SIZE_T_) as HLOCAL
declare function LocalReAlloc(byval hMem as HLOCAL, byval uBytes as SIZE_T_, byval uFlags as UINT) as HLOCAL
declare function LocalLock(byval hMem as HLOCAL) as LPVOID
declare function LocalHandle(byval pMem as LPCVOID) as HLOCAL
declare function LocalUnlock(byval hMem as HLOCAL) as WINBOOL
declare function LocalSize(byval hMem as HLOCAL) as SIZE_T_
declare function LocalFlags(byval hMem as HLOCAL) as UINT
declare function LocalFree(byval hMem as HLOCAL) as HLOCAL
declare function LocalShrink(byval hMem as HLOCAL, byval cbNewSize as UINT) as SIZE_T_
declare function LocalCompact(byval uMinFree as UINT) as SIZE_T_

#define SCS_32BIT_BINARY 0
#define SCS_DOS_BINARY 1
#define SCS_WOW_BINARY 2
#define SCS_PIF_BINARY 3
#define SCS_POSIX_BINARY 4
#define SCS_OS216_BINARY 5
#define SCS_64BIT_BINARY 6

#ifdef __FB_64BIT__
	#define SCS_THIS_PLATFORM_BINARY SCS_64BIT_BINARY
#else
	#define SCS_THIS_PLATFORM_BINARY SCS_32BIT_BINARY
#endif

declare function GetBinaryTypeA(byval lpApplicationName as LPCSTR, byval lpBinaryType as LPDWORD) as WINBOOL
declare function GetBinaryTypeW(byval lpApplicationName as LPCWSTR, byval lpBinaryType as LPDWORD) as WINBOOL
declare function GetShortPathNameA(byval lpszLongPath as LPCSTR, byval lpszShortPath as LPSTR, byval cchBuffer as DWORD) as DWORD
declare function GetProcessAffinityMask(byval hProcess as HANDLE, byval lpProcessAffinityMask as PDWORD_PTR, byval lpSystemAffinityMask as PDWORD_PTR) as WINBOOL
declare function SetProcessAffinityMask(byval hProcess as HANDLE, byval dwProcessAffinityMask as DWORD_PTR) as WINBOOL
declare function GetProcessIoCounters(byval hProcess as HANDLE, byval lpIoCounters as PIO_COUNTERS) as WINBOOL
declare function GetProcessWorkingSetSize(byval hProcess as HANDLE, byval lpMinimumWorkingSetSize as PSIZE_T, byval lpMaximumWorkingSetSize as PSIZE_T) as WINBOOL
declare function SetProcessWorkingSetSize(byval hProcess as HANDLE, byval dwMinimumWorkingSetSize as SIZE_T_, byval dwMaximumWorkingSetSize as SIZE_T_) as WINBOOL
declare sub FatalExit(byval ExitCode as long)
declare function SetEnvironmentStringsA(byval NewEnvironment as LPCH) as WINBOOL

#ifndef UNICODE
	#define SetEnvironmentStrings SetEnvironmentStringsA
	#define GetShortPathName GetShortPathNameA
#endif

#define GetBinaryType __MINGW_NAME_AW(GetBinaryType)

declare sub RaiseFailFastException(byval pExceptionRecord as PEXCEPTION_RECORD, byval pContextRecord as PCONTEXT, byval dwFlags as DWORD)

#define FIBER_FLAG_FLOAT_SWITCH &h1

declare function CreateFiber(byval dwStackSize as SIZE_T_, byval lpStartAddress as LPFIBER_START_ROUTINE, byval lpParameter as LPVOID) as LPVOID
declare function CreateFiberEx(byval dwStackCommitSize as SIZE_T_, byval dwStackReserveSize as SIZE_T_, byval dwFlags as DWORD, byval lpStartAddress as LPFIBER_START_ROUTINE, byval lpParameter as LPVOID) as LPVOID
declare sub DeleteFiber(byval lpFiber as LPVOID)
declare function ConvertThreadToFiber(byval lpParameter as LPVOID) as LPVOID
declare function ConvertThreadToFiberEx(byval lpParameter as LPVOID, byval dwFlags as DWORD) as LPVOID
declare function ConvertFiberToThread() as WINBOOL
declare sub SwitchToFiber(byval lpFiber as LPVOID)
declare function SetThreadAffinityMask(byval hThread as HANDLE, byval dwThreadAffinityMask as DWORD_PTR) as DWORD_PTR
declare function SetThreadIdealProcessor(byval hThread as HANDLE, byval dwIdealProcessor as DWORD) as DWORD

type _THREAD_INFORMATION_CLASS as long
enum
	ThreadMemoryPriority
	ThreadAbsoluteCpuPriority
	ThreadInformationClassMax
end enum

type THREAD_INFORMATION_CLASS as _THREAD_INFORMATION_CLASS

type _PROCESS_INFORMATION_CLASS as long
enum
	ProcessMemoryPriority
	ProcessInformationClassMax
end enum

type PROCESS_INFORMATION_CLASS as _PROCESS_INFORMATION_CLASS

declare function SetProcessPriorityBoost(byval hProcess as HANDLE, byval bDisablePriorityBoost as WINBOOL) as WINBOOL
declare function GetProcessPriorityBoost(byval hProcess as HANDLE, byval pDisablePriorityBoost as PBOOL) as WINBOOL
declare function RequestWakeupLatency(byval latency as LATENCY_TIME) as WINBOOL
declare function IsSystemResumeAutomatic() as WINBOOL
declare function GetThreadIOPendingFlag(byval hThread as HANDLE, byval lpIOIsPending as PBOOL) as WINBOOL
declare function GetThreadSelectorEntry(byval hThread as HANDLE, byval dwSelector as DWORD, byval lpSelectorEntry as LPLDT_ENTRY) as WINBOOL
declare function SetThreadExecutionState(byval esFlags as EXECUTION_STATE) as EXECUTION_STATE

#define HasOverlappedIoCompleted(lpOverlapped) (cast(DWORD, (lpOverlapped)->Internal) <> STATUS_PENDING)
#define SEM_FAILCRITICALERRORS &h0001
#define SEM_NOGPFAULTERRORBOX &h0002
#define SEM_NOALIGNMENTFAULTEXCEPT &h0004
#define SEM_NOOPENFILEERRORBOX &h8000

declare function GetThreadErrorMode() as DWORD
declare function SetThreadErrorMode(byval dwNewMode as DWORD, byval lpOldMode as LPDWORD) as WINBOOL
declare function DebugSetProcessKillOnExit(byval KillOnExit as WINBOOL) as WINBOOL
declare function DebugBreakProcess(byval Process as HANDLE) as WINBOOL

#define CRITICAL_SECTION_NO_DEBUG_INFO RTL_CRITICAL_SECTION_FLAG_NO_DEBUG_INFO

type _DEP_SYSTEM_POLICY_TYPE as long
enum
	DEPPolicyAlwaysOff = 0
	DEPPolicyAlwaysOn
	DEPPolicyOptIn
	DEPPolicyOptOut
	DEPTotalPolicyCount
end enum

type DEP_SYSTEM_POLICY_TYPE as _DEP_SYSTEM_POLICY_TYPE

#define HANDLE_FLAG_INHERIT &h1
#define HANDLE_FLAG_PROTECT_FROM_CLOSE &h2
#define HINSTANCE_ERROR 32
#define GET_TAPE_MEDIA_INFORMATION 0
#define GET_TAPE_DRIVE_INFORMATION 1
#define SET_TAPE_MEDIA_INFORMATION 0
#define SET_TAPE_DRIVE_INFORMATION 1

declare function PulseEvent(byval hEvent as HANDLE) as WINBOOL
declare function WaitForMultipleObjects(byval nCount as DWORD, byval lpHandles as const HANDLE ptr, byval bWaitAll as WINBOOL, byval dwMilliseconds as DWORD) as DWORD
declare function GlobalDeleteAtom(byval nAtom as ATOM) as ATOM
declare function InitAtomTable(byval nSize as DWORD) as WINBOOL
declare function DeleteAtom(byval nAtom as ATOM) as ATOM
declare function SetHandleCount(byval uNumber as UINT) as UINT
declare function RequestDeviceWakeup(byval hDevice as HANDLE) as WINBOOL
declare function CancelDeviceWakeupRequest(byval hDevice as HANDLE) as WINBOOL
declare function GetDevicePowerState(byval hDevice as HANDLE, byval pfOn as WINBOOL ptr) as WINBOOL
declare function SetMessageWaitingIndicator(byval hMsgIndicator as HANDLE, byval ulMsgCount as ULONG_) as WINBOOL
declare function SetFileShortNameA(byval hFile as HANDLE, byval lpShortName as LPCSTR) as WINBOOL
declare function SetFileShortNameW(byval hFile as HANDLE, byval lpShortName as LPCWSTR) as WINBOOL
declare function LoadModule(byval lpModuleName as LPCSTR, byval lpParameterBlock as LPVOID) as DWORD
declare function WinExec(byval lpCmdLine as LPCSTR, byval uCmdShow as UINT) as UINT
declare function ClearCommBreak(byval hFile as HANDLE) as WINBOOL
declare function ClearCommError(byval hFile as HANDLE, byval lpErrors as LPDWORD, byval lpStat as LPCOMSTAT) as WINBOOL
declare function SetupComm(byval hFile as HANDLE, byval dwInQueue as DWORD, byval dwOutQueue as DWORD) as WINBOOL
declare function EscapeCommFunction(byval hFile as HANDLE, byval dwFunc as DWORD) as WINBOOL
declare function GetCommConfig(byval hCommDev as HANDLE, byval lpCC as LPCOMMCONFIG, byval lpdwSize as LPDWORD) as WINBOOL
declare function GetCommMask(byval hFile as HANDLE, byval lpEvtMask as LPDWORD) as WINBOOL
declare function GetCommProperties(byval hFile as HANDLE, byval lpCommProp as LPCOMMPROP) as WINBOOL
declare function GetCommModemStatus(byval hFile as HANDLE, byval lpModemStat as LPDWORD) as WINBOOL
declare function GetCommState(byval hFile as HANDLE, byval lpDCB as LPDCB) as WINBOOL
declare function GetCommTimeouts(byval hFile as HANDLE, byval lpCommTimeouts as LPCOMMTIMEOUTS) as WINBOOL
declare function PurgeComm(byval hFile as HANDLE, byval dwFlags as DWORD) as WINBOOL
declare function SetCommBreak(byval hFile as HANDLE) as WINBOOL
declare function SetCommConfig(byval hCommDev as HANDLE, byval lpCC as LPCOMMCONFIG, byval dwSize as DWORD) as WINBOOL
declare function SetCommMask(byval hFile as HANDLE, byval dwEvtMask as DWORD) as WINBOOL
declare function SetCommState(byval hFile as HANDLE, byval lpDCB as LPDCB) as WINBOOL
declare function SetCommTimeouts(byval hFile as HANDLE, byval lpCommTimeouts as LPCOMMTIMEOUTS) as WINBOOL
declare function TransmitCommChar(byval hFile as HANDLE, byval cChar as byte) as WINBOOL
declare function WaitCommEvent(byval hFile as HANDLE, byval lpEvtMask as LPDWORD, byval lpOverlapped as LPOVERLAPPED) as WINBOOL
declare function SetTapePosition(byval hDevice as HANDLE, byval dwPositionMethod as DWORD, byval dwPartition as DWORD, byval dwOffsetLow as DWORD, byval dwOffsetHigh as DWORD, byval bImmediate as WINBOOL) as DWORD
declare function GetTapePosition(byval hDevice as HANDLE, byval dwPositionType as DWORD, byval lpdwPartition as LPDWORD, byval lpdwOffsetLow as LPDWORD, byval lpdwOffsetHigh as LPDWORD) as DWORD
declare function PrepareTape(byval hDevice as HANDLE, byval dwOperation as DWORD, byval bImmediate as WINBOOL) as DWORD
declare function EraseTape(byval hDevice as HANDLE, byval dwEraseType as DWORD, byval bImmediate as WINBOOL) as DWORD
declare function CreateTapePartition(byval hDevice as HANDLE, byval dwPartitionMethod as DWORD, byval dwCount as DWORD, byval dwSize as DWORD) as DWORD
declare function WriteTapemark(byval hDevice as HANDLE, byval dwTapemarkType as DWORD, byval dwTapemarkCount as DWORD, byval bImmediate as WINBOOL) as DWORD
declare function GetTapeStatus(byval hDevice as HANDLE) as DWORD
declare function GetTapeParameters(byval hDevice as HANDLE, byval dwOperation as DWORD, byval lpdwSize as LPDWORD, byval lpTapeInformation as LPVOID) as DWORD
declare function SetTapeParameters(byval hDevice as HANDLE, byval dwOperation as DWORD, byval lpTapeInformation as LPVOID) as DWORD
declare function GetSystemDEPPolicy() as DEP_SYSTEM_POLICY_TYPE
declare function GetSystemRegistryQuota(byval pdwQuotaAllowed as PDWORD, byval pdwQuotaUsed as PDWORD) as WINBOOL
declare function GetSystemTimes(byval lpIdleTime as LPFILETIME, byval lpKernelTime as LPFILETIME, byval lpUserTime as LPFILETIME) as WINBOOL
declare function FileTimeToDosDateTime(byval lpFileTime as const FILETIME ptr, byval lpFatDate as LPWORD, byval lpFatTime as LPWORD) as WINBOOL
declare function DosDateTimeToFileTime(byval wFatDate as WORD, byval wFatTime as WORD, byval lpFileTime as LPFILETIME) as WINBOOL
declare function SetSystemTimeAdjustment(byval dwTimeAdjustment as DWORD, byval bTimeAdjustmentDisabled as WINBOOL) as WINBOOL

#define SetFileShortName __MINGW_NAME_AW(SetFileShortName)

declare function MulDiv(byval nNumber as long, byval nNumerator as long, byval nDenominator as long) as long
declare function FormatMessageA(byval dwFlags as DWORD, byval lpSource as LPCVOID, byval dwMessageId as DWORD, byval dwLanguageId as DWORD, byval lpBuffer as LPSTR, byval nSize as DWORD, byval Arguments as va_list ptr) as DWORD
declare function FormatMessageW(byval dwFlags as DWORD, byval lpSource as LPCVOID, byval dwMessageId as DWORD, byval dwLanguageId as DWORD, byval lpBuffer as LPWSTR, byval nSize as DWORD, byval Arguments as va_list ptr) as DWORD

#define FormatMessage __MINGW_NAME_AW(FormatMessage)
#define FORMAT_MESSAGE_IGNORE_INSERTS &h00000200
#define FORMAT_MESSAGE_FROM_STRING &h00000400
#define FORMAT_MESSAGE_FROM_HMODULE &h00000800
#define FORMAT_MESSAGE_FROM_SYSTEM &h00001000
#define FORMAT_MESSAGE_ARGUMENT_ARRAY &h00002000
#define FORMAT_MESSAGE_MAX_WIDTH_MASK &h000000ff

type PFE_EXPORT_FUNC as function(byval pbData as PBYTE, byval pvCallbackContext as PVOID, byval ulLength as ULONG_) as DWORD
type PFE_IMPORT_FUNC as function(byval pbData as PBYTE, byval pvCallbackContext as PVOID, byval ulLength as PULONG) as DWORD

#define FILE_ENCRYPTABLE 0
#define FILE_IS_ENCRYPTED 1
#define FILE_SYSTEM_ATTR 2
#define FILE_ROOT_DIR 3
#define FILE_SYSTEM_DIR 4
#define FILE_UNKNOWN 5
#define FILE_SYSTEM_NOT_SUPPORT 6
#define FILE_USER_DISALLOWED 7
#define FILE_READ_ONLY 8
#define FILE_DIR_DISALLOWED 9
#define FORMAT_MESSAGE_ALLOCATE_BUFFER &h00000100
#define EFS_USE_RECOVERY_KEYS &h1
#define CREATE_FOR_IMPORT 1
#define CREATE_FOR_DIR 2
#define OVERWRITE_HIDDEN 4
#define EFSRPC_SECURE_ONLY 8

declare function GetNamedPipeInfo(byval hNamedPipe as HANDLE, byval lpFlags as LPDWORD, byval lpOutBufferSize as LPDWORD, byval lpInBufferSize as LPDWORD, byval lpMaxInstances as LPDWORD) as WINBOOL
declare function CreateMailslotA(byval lpName as LPCSTR, byval nMaxMessageSize as DWORD, byval lReadTimeout as DWORD, byval lpSecurityAttributes as LPSECURITY_ATTRIBUTES) as HANDLE
declare function CreateMailslotW(byval lpName as LPCWSTR, byval nMaxMessageSize as DWORD, byval lReadTimeout as DWORD, byval lpSecurityAttributes as LPSECURITY_ATTRIBUTES) as HANDLE
declare function GetMailslotInfo(byval hMailslot as HANDLE, byval lpMaxMessageSize as LPDWORD, byval lpNextSize as LPDWORD, byval lpMessageCount as LPDWORD, byval lpReadTimeout as LPDWORD) as WINBOOL
declare function SetMailslotInfo(byval hMailslot as HANDLE, byval lReadTimeout as DWORD) as WINBOOL
declare function EncryptFileA(byval lpFileName as LPCSTR) as WINBOOL
declare function EncryptFileW(byval lpFileName as LPCWSTR) as WINBOOL
declare function DecryptFileA(byval lpFileName as LPCSTR, byval dwReserved as DWORD) as WINBOOL
declare function DecryptFileW(byval lpFileName as LPCWSTR, byval dwReserved as DWORD) as WINBOOL
declare function FileEncryptionStatusA(byval lpFileName as LPCSTR, byval lpStatus as LPDWORD) as WINBOOL
declare function FileEncryptionStatusW(byval lpFileName as LPCWSTR, byval lpStatus as LPDWORD) as WINBOOL
declare function OpenEncryptedFileRawA(byval lpFileName as LPCSTR, byval ulFlags as ULONG_, byval pvContext as PVOID ptr) as DWORD
declare function OpenEncryptedFileRawW(byval lpFileName as LPCWSTR, byval ulFlags as ULONG_, byval pvContext as PVOID ptr) as DWORD
declare function ReadEncryptedFileRaw(byval pfExportCallback as PFE_EXPORT_FUNC, byval pvCallbackContext as PVOID, byval pvContext as PVOID) as DWORD
declare function WriteEncryptedFileRaw(byval pfImportCallback as PFE_IMPORT_FUNC, byval pvCallbackContext as PVOID, byval pvContext as PVOID) as DWORD
declare sub CloseEncryptedFileRaw(byval pvContext as PVOID)
declare function lstrcmpA(byval lpString1 as LPCSTR, byval lpString2 as LPCSTR) as long
declare function lstrcmpW(byval lpString1 as LPCWSTR, byval lpString2 as LPCWSTR) as long
declare function lstrcmpiA(byval lpString1 as LPCSTR, byval lpString2 as LPCSTR) as long
declare function lstrcmpiW(byval lpString1 as LPCWSTR, byval lpString2 as LPCWSTR) as long
declare function lstrcpynA(byval lpString1 as LPSTR, byval lpString2 as LPCSTR, byval iMaxLength as long) as LPSTR
declare function lstrcpynW(byval lpString1 as LPWSTR, byval lpString2 as LPCWSTR, byval iMaxLength as long) as LPWSTR
declare function lstrcpyA(byval lpString1 as LPSTR, byval lpString2 as LPCSTR) as LPSTR
declare function lstrcpyW(byval lpString1 as LPWSTR, byval lpString2 as LPCWSTR) as LPWSTR
declare function lstrcatA(byval lpString1 as LPSTR, byval lpString2 as LPCSTR) as LPSTR
declare function lstrcatW(byval lpString1 as LPWSTR, byval lpString2 as LPCWSTR) as LPWSTR
declare function lstrlenA(byval lpString as LPCSTR) as long
declare function lstrlenW(byval lpString as LPCWSTR) as long
declare function OpenFile(byval lpFileName as LPCSTR, byval lpReOpenBuff as LPOFSTRUCT, byval uStyle as UINT) as HFILE
declare function _lopen(byval lpPathName as LPCSTR, byval iReadWrite as long) as HFILE
declare function _lcreat(byval lpPathName as LPCSTR, byval iAttribute as long) as HFILE
declare function _lread(byval hFile as HFILE, byval lpBuffer as LPVOID, byval uBytes as UINT) as UINT
declare function _lwrite(byval hFile as HFILE, byval lpBuffer as LPCCH, byval uBytes as UINT) as UINT
declare function _hread(byval hFile as HFILE, byval lpBuffer as LPVOID, byval lBytes as clong) as clong
declare function _hwrite(byval hFile as HFILE, byval lpBuffer as LPCCH, byval lBytes as clong) as clong
declare function _lclose(byval hFile as HFILE) as HFILE
declare function _llseek(byval hFile as HFILE, byval lOffset as LONG_, byval iOrigin as long) as LONG_
declare function IsTextUnicode(byval lpv as const any ptr, byval iSize as long, byval lpiResult as LPINT) as WINBOOL
declare function BackupRead(byval hFile as HANDLE, byval lpBuffer as LPBYTE, byval nNumberOfBytesToRead as DWORD, byval lpNumberOfBytesRead as LPDWORD, byval bAbort as WINBOOL, byval bProcessSecurity as WINBOOL, byval lpContext as LPVOID ptr) as WINBOOL
declare function BackupSeek(byval hFile as HANDLE, byval dwLowBytesToSeek as DWORD, byval dwHighBytesToSeek as DWORD, byval lpdwLowByteSeeked as LPDWORD, byval lpdwHighByteSeeked as LPDWORD, byval lpContext as LPVOID ptr) as WINBOOL
declare function BackupWrite(byval hFile as HANDLE, byval lpBuffer as LPBYTE, byval nNumberOfBytesToWrite as DWORD, byval lpNumberOfBytesWritten as LPDWORD, byval bAbort as WINBOOL, byval bProcessSecurity as WINBOOL, byval lpContext as LPVOID ptr) as WINBOOL

#define CreateMailslot __MINGW_NAME_AW(CreateMailslot)
#define EncryptFile __MINGW_NAME_AW(EncryptFile)
#define DecryptFile __MINGW_NAME_AW(DecryptFile)
#define FileEncryptionStatus __MINGW_NAME_AW(FileEncryptionStatus)
#define OpenEncryptedFileRaw __MINGW_NAME_AW(OpenEncryptedFileRaw)
#define lstrcmp __MINGW_NAME_AW(lstrcmp)
#define lstrcmpi __MINGW_NAME_AW(lstrcmpi)
#define lstrcpyn __MINGW_NAME_AW(lstrcpyn)
#define lstrcpy __MINGW_NAME_AW(lstrcpy)
#define lstrcat __MINGW_NAME_AW(lstrcat)
#define lstrlen __MINGW_NAME_AW(lstrlen)

type _WIN32_STREAM_ID
	dwStreamId as DWORD
	dwStreamAttributes as DWORD
	Size as LARGE_INTEGER
	dwStreamNameSize as DWORD
	cStreamName(0 to 0) as WCHAR
end type

type WIN32_STREAM_ID as _WIN32_STREAM_ID
type LPWIN32_STREAM_ID as _WIN32_STREAM_ID ptr

#define BACKUP_INVALID &h00000000
#define BACKUP_DATA &h00000001
#define BACKUP_EA_DATA &h00000002
#define BACKUP_SECURITY_DATA &h00000003
#define BACKUP_ALTERNATE_DATA &h00000004
#define BACKUP_LINK &h00000005
#define BACKUP_PROPERTY_DATA &h00000006
#define BACKUP_OBJECT_ID &h00000007
#define BACKUP_REPARSE_DATA &h00000008
#define BACKUP_SPARSE_BLOCK &h00000009
#define BACKUP_TXFS_DATA &h0000000a
#define STREAM_NORMAL_ATTRIBUTE &h00000000
#define STREAM_MODIFIED_WHEN_READ &h00000001
#define STREAM_CONTAINS_SECURITY &h00000002
#define STREAM_CONTAINS_PROPERTIES &h00000004
#define STREAM_SPARSE_ATTRIBUTE &h00000008
#define STARTF_USESHOWWINDOW &h00000001
#define STARTF_USESIZE &h00000002
#define STARTF_USEPOSITION &h00000004
#define STARTF_USECOUNTCHARS &h00000008
#define STARTF_USEFILLATTRIBUTE &h00000010
#define STARTF_RUNFULLSCREEN &h00000020
#define STARTF_FORCEONFEEDBACK &h00000040
#define STARTF_FORCEOFFFEEDBACK &h00000080
#define STARTF_USESTDHANDLES &h00000100
#define STARTF_USEHOTKEY &h00000200
#define STARTF_TITLEISLINKNAME &h00000800
#define STARTF_TITLEISAPPID &h00001000
#define STARTF_PREVENTPINNING &h00002000
#define SHUTDOWN_NORETRY &h1
#define CreateSemaphore __MINGW_NAME_AW(CreateSemaphore)

declare function CreateSemaphoreW(byval lpSemaphoreAttributes as LPSECURITY_ATTRIBUTES, byval lInitialCount as LONG_, byval lMaximumCount as LONG_, byval lpName as LPCWSTR) as HANDLE
declare function OpenMutexA(byval dwDesiredAccess as DWORD, byval bInheritHandle as WINBOOL, byval lpName as LPCSTR) as HANDLE
declare function CreateSemaphoreA(byval lpSemaphoreAttributes as LPSECURITY_ATTRIBUTES, byval lInitialCount as LONG_, byval lMaximumCount as LONG_, byval lpName as LPCSTR) as HANDLE
declare function OpenSemaphoreA(byval dwDesiredAccess as DWORD, byval bInheritHandle as WINBOOL, byval lpName as LPCSTR) as HANDLE
declare function CreateWaitableTimerA(byval lpTimerAttributes as LPSECURITY_ATTRIBUTES, byval bManualReset as WINBOOL, byval lpTimerName as LPCSTR) as HANDLE
declare function CreateWaitableTimerW(byval lpTimerAttributes as LPSECURITY_ATTRIBUTES, byval bManualReset as WINBOOL, byval lpTimerName as LPCWSTR) as HANDLE
declare function OpenWaitableTimerA(byval dwDesiredAccess as DWORD, byval bInheritHandle as WINBOOL, byval lpTimerName as LPCSTR) as HANDLE
declare function CreateFileMappingA(byval hFile as HANDLE, byval lpFileMappingAttributes as LPSECURITY_ATTRIBUTES, byval flProtect as DWORD, byval dwMaximumSizeHigh as DWORD, byval dwMaximumSizeLow as DWORD, byval lpName as LPCSTR) as HANDLE
declare function OpenFileMappingA(byval dwDesiredAccess as DWORD, byval bInheritHandle as WINBOOL, byval lpName as LPCSTR) as HANDLE
declare function GetLogicalDriveStringsA(byval nBufferLength as DWORD, byval lpBuffer as LPSTR) as DWORD
declare function LoadLibraryA(byval lpLibFileName as LPCSTR) as HMODULE
declare function LoadLibraryW(byval lpLibFileName as LPCWSTR) as HMODULE

#ifndef UNICODE
	#define OpenMutex OpenMutexA
	#define OpenSemaphore OpenSemaphoreA
	#define OpenWaitableTimer OpenWaitableTimerA
	#define CreateFileMapping CreateFileMappingA
	#define OpenFileMapping OpenFileMappingA
	#define GetLogicalDriveStrings GetLogicalDriveStringsA
#endif

#define CreateWaitableTimer __MINGW_NAME_AW(CreateWaitableTimer)
#define LoadLibrary __MINGW_NAME_AW(LoadLibrary)
#define ATOM_FLAG_GLOBAL &h2

declare function GetProcessShutdownParameters(byval lpdwLevel as LPDWORD, byval lpdwFlags as LPDWORD) as WINBOOL
declare sub FatalAppExitA(byval uAction as UINT, byval lpMessageText as LPCSTR)
declare sub FatalAppExitW(byval uAction as UINT, byval lpMessageText as LPCWSTR)
declare sub GetStartupInfoA(byval lpStartupInfo as LPSTARTUPINFOA)
declare function GetFirmwareEnvironmentVariableA(byval lpName as LPCSTR, byval lpGuid as LPCSTR, byval pBuffer as PVOID, byval nSize as DWORD) as DWORD
declare function GetFirmwareEnvironmentVariableW(byval lpName as LPCWSTR, byval lpGuid as LPCWSTR, byval pBuffer as PVOID, byval nSize as DWORD) as DWORD
declare function SetFirmwareEnvironmentVariableA(byval lpName as LPCSTR, byval lpGuid as LPCSTR, byval pValue as PVOID, byval nSize as DWORD) as WINBOOL
declare function SetFirmwareEnvironmentVariableW(byval lpName as LPCWSTR, byval lpGuid as LPCWSTR, byval pValue as PVOID, byval nSize as DWORD) as WINBOOL
declare function FindResourceA(byval hModule as HMODULE, byval lpName as LPCSTR, byval lpType as LPCSTR) as HRSRC
declare function FindResourceW(byval hModule as HMODULE, byval lpName as LPCWSTR, byval lpType as LPCWSTR) as HRSRC
declare function FindResourceExA(byval hModule as HMODULE, byval lpType as LPCSTR, byval lpName as LPCSTR, byval wLanguage as WORD) as HRSRC
declare function EnumResourceTypesA(byval hModule as HMODULE, byval lpEnumFunc as ENUMRESTYPEPROCA, byval lParam as LONG_PTR) as WINBOOL
declare function EnumResourceTypesW(byval hModule as HMODULE, byval lpEnumFunc as ENUMRESTYPEPROCW, byval lParam as LONG_PTR) as WINBOOL
declare function EnumResourceNamesA(byval hModule as HMODULE, byval lpType as LPCSTR, byval lpEnumFunc as ENUMRESNAMEPROCA, byval lParam as LONG_PTR) as WINBOOL
declare function EnumResourceNamesW(byval hModule as HMODULE, byval lpType as LPCWSTR, byval lpEnumFunc as ENUMRESNAMEPROCW, byval lParam as LONG_PTR) as WINBOOL
declare function BeginUpdateResourceA(byval pFileName as LPCSTR, byval bDeleteExistingResources as WINBOOL) as HANDLE
declare function BeginUpdateResourceW(byval pFileName as LPCWSTR, byval bDeleteExistingResources as WINBOOL) as HANDLE
declare function UpdateResourceA(byval hUpdate as HANDLE, byval lpType as LPCSTR, byval lpName as LPCSTR, byval wLanguage as WORD, byval lpData as LPVOID, byval cb as DWORD) as WINBOOL
declare function UpdateResourceW(byval hUpdate as HANDLE, byval lpType as LPCWSTR, byval lpName as LPCWSTR, byval wLanguage as WORD, byval lpData as LPVOID, byval cb as DWORD) as WINBOOL
declare function EndUpdateResourceA(byval hUpdate as HANDLE, byval fDiscard as WINBOOL) as WINBOOL
declare function EndUpdateResourceW(byval hUpdate as HANDLE, byval fDiscard as WINBOOL) as WINBOOL
declare function GlobalAddAtomA(byval lpString as LPCSTR) as ATOM
declare function GlobalAddAtomW(byval lpString as LPCWSTR) as ATOM
declare function GlobalAddAtomExA(byval lpString as LPCSTR, byval Flags as DWORD) as ATOM
declare function GlobalAddAtomExW(byval lpString as LPCWSTR, byval Flags as DWORD) as ATOM
declare function GlobalFindAtomA(byval lpString as LPCSTR) as ATOM
declare function GlobalFindAtomW(byval lpString as LPCWSTR) as ATOM
declare function GlobalGetAtomNameA(byval nAtom as ATOM, byval lpBuffer as LPSTR, byval nSize as long) as UINT
declare function GlobalGetAtomNameW(byval nAtom as ATOM, byval lpBuffer as LPWSTR, byval nSize as long) as UINT
declare function AddAtomA(byval lpString as LPCSTR) as ATOM
declare function AddAtomW(byval lpString as LPCWSTR) as ATOM
declare function FindAtomA(byval lpString as LPCSTR) as ATOM
declare function FindAtomW(byval lpString as LPCWSTR) as ATOM
declare function GetAtomNameA(byval nAtom as ATOM, byval lpBuffer as LPSTR, byval nSize as long) as UINT
declare function GetAtomNameW(byval nAtom as ATOM, byval lpBuffer as LPWSTR, byval nSize as long) as UINT
declare function GetProfileIntA(byval lpAppName as LPCSTR, byval lpKeyName as LPCSTR, byval nDefault as INT_) as UINT
declare function GetProfileIntW(byval lpAppName as LPCWSTR, byval lpKeyName as LPCWSTR, byval nDefault as INT_) as UINT
declare function GetProfileStringA(byval lpAppName as LPCSTR, byval lpKeyName as LPCSTR, byval lpDefault as LPCSTR, byval lpReturnedString as LPSTR, byval nSize as DWORD) as DWORD
declare function GetProfileStringW(byval lpAppName as LPCWSTR, byval lpKeyName as LPCWSTR, byval lpDefault as LPCWSTR, byval lpReturnedString as LPWSTR, byval nSize as DWORD) as DWORD
declare function WriteProfileStringA(byval lpAppName as LPCSTR, byval lpKeyName as LPCSTR, byval lpString as LPCSTR) as WINBOOL
declare function WriteProfileStringW(byval lpAppName as LPCWSTR, byval lpKeyName as LPCWSTR, byval lpString as LPCWSTR) as WINBOOL
declare function GetProfileSectionA(byval lpAppName as LPCSTR, byval lpReturnedString as LPSTR, byval nSize as DWORD) as DWORD
declare function GetProfileSectionW(byval lpAppName as LPCWSTR, byval lpReturnedString as LPWSTR, byval nSize as DWORD) as DWORD
declare function WriteProfileSectionA(byval lpAppName as LPCSTR, byval lpString as LPCSTR) as WINBOOL
declare function WriteProfileSectionW(byval lpAppName as LPCWSTR, byval lpString as LPCWSTR) as WINBOOL
declare function GetPrivateProfileIntA(byval lpAppName as LPCSTR, byval lpKeyName as LPCSTR, byval nDefault as INT_, byval lpFileName as LPCSTR) as UINT
declare function GetPrivateProfileIntW(byval lpAppName as LPCWSTR, byval lpKeyName as LPCWSTR, byval nDefault as INT_, byval lpFileName as LPCWSTR) as UINT
declare function GetPrivateProfileStringA(byval lpAppName as LPCSTR, byval lpKeyName as LPCSTR, byval lpDefault as LPCSTR, byval lpReturnedString as LPSTR, byval nSize as DWORD, byval lpFileName as LPCSTR) as DWORD
declare function GetPrivateProfileStringW(byval lpAppName as LPCWSTR, byval lpKeyName as LPCWSTR, byval lpDefault as LPCWSTR, byval lpReturnedString as LPWSTR, byval nSize as DWORD, byval lpFileName as LPCWSTR) as DWORD
declare function WritePrivateProfileStringA(byval lpAppName as LPCSTR, byval lpKeyName as LPCSTR, byval lpString as LPCSTR, byval lpFileName as LPCSTR) as WINBOOL
declare function WritePrivateProfileStringW(byval lpAppName as LPCWSTR, byval lpKeyName as LPCWSTR, byval lpString as LPCWSTR, byval lpFileName as LPCWSTR) as WINBOOL
declare function GetPrivateProfileSectionA(byval lpAppName as LPCSTR, byval lpReturnedString as LPSTR, byval nSize as DWORD, byval lpFileName as LPCSTR) as DWORD
declare function GetPrivateProfileSectionW(byval lpAppName as LPCWSTR, byval lpReturnedString as LPWSTR, byval nSize as DWORD, byval lpFileName as LPCWSTR) as DWORD
declare function WritePrivateProfileSectionA(byval lpAppName as LPCSTR, byval lpString as LPCSTR, byval lpFileName as LPCSTR) as WINBOOL
declare function WritePrivateProfileSectionW(byval lpAppName as LPCWSTR, byval lpString as LPCWSTR, byval lpFileName as LPCWSTR) as WINBOOL
declare function GetPrivateProfileSectionNamesA(byval lpszReturnBuffer as LPSTR, byval nSize as DWORD, byval lpFileName as LPCSTR) as DWORD
declare function GetPrivateProfileSectionNamesW(byval lpszReturnBuffer as LPWSTR, byval nSize as DWORD, byval lpFileName as LPCWSTR) as DWORD
declare function GetPrivateProfileStructA(byval lpszSection as LPCSTR, byval lpszKey as LPCSTR, byval lpStruct as LPVOID, byval uSizeStruct as UINT, byval szFile as LPCSTR) as WINBOOL
declare function GetPrivateProfileStructW(byval lpszSection as LPCWSTR, byval lpszKey as LPCWSTR, byval lpStruct as LPVOID, byval uSizeStruct as UINT, byval szFile as LPCWSTR) as WINBOOL
declare function WritePrivateProfileStructA(byval lpszSection as LPCSTR, byval lpszKey as LPCSTR, byval lpStruct as LPVOID, byval uSizeStruct as UINT, byval szFile as LPCSTR) as WINBOOL
declare function WritePrivateProfileStructW(byval lpszSection as LPCWSTR, byval lpszKey as LPCWSTR, byval lpStruct as LPVOID, byval uSizeStruct as UINT, byval szFile as LPCWSTR) as WINBOOL
declare function GetTempPathA(byval nBufferLength as DWORD, byval lpBuffer as LPSTR) as DWORD
declare function GetTempFileNameA(byval lpPathName as LPCSTR, byval lpPrefixString as LPCSTR, byval uUnique as UINT, byval lpTempFileName as LPSTR) as UINT

#ifndef UNICODE
	#define GetStartupInfo GetStartupInfoA
	#define FindResourceEx FindResourceExA
	#define GetTempPath GetTempPathA
	#define GetTempFileName GetTempFileNameA
#endif

#define FatalAppExit __MINGW_NAME_AW(FatalAppExit)
#define GetFirmwareEnvironmentVariable __MINGW_NAME_AW(GetFirmwareEnvironmentVariable)
#define SetFirmwareEnvironmentVariable __MINGW_NAME_AW(SetFirmwareEnvironmentVariable)
#define FindResource __MINGW_NAME_AW(FindResource)
#define EnumResourceTypes __MINGW_NAME_AW(EnumResourceTypes)
#define EnumResourceNames __MINGW_NAME_AW(EnumResourceNames)
#define EnumResourceLanguages __MINGW_NAME_AW(EnumResourceLanguages)
#define BeginUpdateResource __MINGW_NAME_AW(BeginUpdateResource)
#define UpdateResource __MINGW_NAME_AW(UpdateResource)
#define EndUpdateResource __MINGW_NAME_AW(EndUpdateResource)
#define GlobalAddAtom __MINGW_NAME_AW(GlobalAddAtom)
#define GlobalAddAtomEx __MINGW_NAME_AW(GlobalAddAtomEx)
#define GlobalFindAtom __MINGW_NAME_AW(GlobalFindAtom)
#define GlobalGetAtomName __MINGW_NAME_AW(GlobalGetAtomName)
#define AddAtom __MINGW_NAME_AW(AddAtom)
#define FindAtom __MINGW_NAME_AW(FindAtom)
#define GetAtomName __MINGW_NAME_AW(GetAtomName)
#define GetProfileInt __MINGW_NAME_AW(GetProfileInt)
#define GetProfileString __MINGW_NAME_AW(GetProfileString)
#define WriteProfileString __MINGW_NAME_AW(WriteProfileString)
#define GetProfileSection __MINGW_NAME_AW(GetProfileSection)
#define WriteProfileSection __MINGW_NAME_AW(WriteProfileSection)
#define GetPrivateProfileInt __MINGW_NAME_AW(GetPrivateProfileInt)
#define GetPrivateProfileString __MINGW_NAME_AW(GetPrivateProfileString)
#define WritePrivateProfileString __MINGW_NAME_AW(WritePrivateProfileString)
#define GetPrivateProfileSection __MINGW_NAME_AW(GetPrivateProfileSection)
#define WritePrivateProfileSection __MINGW_NAME_AW(WritePrivateProfileSection)
#define GetPrivateProfileSectionNames __MINGW_NAME_AW(GetPrivateProfileSectionNames)
#define GetPrivateProfileStruct __MINGW_NAME_AW(GetPrivateProfileStruct)
#define WritePrivateProfileStruct __MINGW_NAME_AW(WritePrivateProfileStruct)

declare function GetSystemWow64DirectoryA(byval lpBuffer as LPSTR, byval uSize as UINT) as UINT
declare function GetSystemWow64DirectoryW(byval lpBuffer as LPWSTR, byval uSize as UINT) as UINT

#define GetSystemWow64Directory __MINGW_NAME_AW(GetSystemWow64Directory)

declare function Wow64EnableWow64FsRedirection(byval Wow64FsEnableRedirection as BOOLEAN) as BOOLEAN

type PGET_SYSTEM_WOW64_DIRECTORY_A as function(byval lpBuffer as LPSTR, byval uSize as UINT) as UINT
type PGET_SYSTEM_WOW64_DIRECTORY_W as function(byval lpBuffer as LPWSTR, byval uSize as UINT) as UINT

#define GET_SYSTEM_WOW64_DIRECTORY_NAME_A_A "GetSystemWow64DirectoryA"
#define GET_SYSTEM_WOW64_DIRECTORY_NAME_A_W wstr("GetSystemWow64DirectoryA")
#define GET_SYSTEM_WOW64_DIRECTORY_NAME_A_T TEXT_("GetSystemWow64DirectoryA")
#define GET_SYSTEM_WOW64_DIRECTORY_NAME_W_A "GetSystemWow64DirectoryW"
#define GET_SYSTEM_WOW64_DIRECTORY_NAME_W_W wstr("GetSystemWow64DirectoryW")
#define GET_SYSTEM_WOW64_DIRECTORY_NAME_W_T TEXT_("GetSystemWow64DirectoryW")
#define GET_SYSTEM_WOW64_DIRECTORY_NAME_T_A __MINGW_NAME_UAW_EXT(GET_SYSTEM_WOW64_DIRECTORY_NAME, A)
#define GET_SYSTEM_WOW64_DIRECTORY_NAME_T_W __MINGW_NAME_UAW_EXT(GET_SYSTEM_WOW64_DIRECTORY_NAME, W)
#define GET_SYSTEM_WOW64_DIRECTORY_NAME_T_T __MINGW_NAME_UAW_EXT(GET_SYSTEM_WOW64_DIRECTORY_NAME, T)

declare function SetDllDirectoryA(byval lpPathName as LPCSTR) as WINBOOL
declare function SetDllDirectoryW(byval lpPathName as LPCWSTR) as WINBOOL
declare function GetDllDirectoryA(byval nBufferLength as DWORD, byval lpBuffer as LPSTR) as DWORD
declare function GetDllDirectoryW(byval nBufferLength as DWORD, byval lpBuffer as LPWSTR) as DWORD

#define SetDllDirectory __MINGW_NAME_AW(SetDllDirectory)
#define GetDllDirectory __MINGW_NAME_AW(GetDllDirectory)
#define BASE_SEARCH_PATH_ENABLE_SAFE_SEARCHMODE &h1
#define BASE_SEARCH_PATH_DISABLE_SAFE_SEARCHMODE &h10000
#define BASE_SEARCH_PATH_PERMANENT &h8000
#define BASE_SEARCH_PATH_INVALID_FLAGS (not &h18001)

declare function SetSearchPathMode(byval Flags as DWORD) as WINBOOL
declare function CreateDirectoryExA(byval lpTemplateDirectory as LPCSTR, byval lpNewDirectory as LPCSTR, byval lpSecurityAttributes as LPSECURITY_ATTRIBUTES) as WINBOOL
declare function CreateDirectoryExW(byval lpTemplateDirectory as LPCWSTR, byval lpNewDirectory as LPCWSTR, byval lpSecurityAttributes as LPSECURITY_ATTRIBUTES) as WINBOOL

#define CreateDirectoryEx __MINGW_NAME_AW(CreateDirectoryEx)
#define DDD_RAW_TARGET_PATH &h00000001
#define DDD_REMOVE_DEFINITION &h00000002
#define DDD_EXACT_MATCH_ON_REMOVE &h00000004
#define DDD_NO_BROADCAST_SYSTEM &h00000008
#define DDD_LUID_BROADCAST_DRIVE &h00000010

declare function DefineDosDeviceA(byval dwFlags as DWORD, byval lpDeviceName as LPCSTR, byval lpTargetPath as LPCSTR) as WINBOOL
declare function QueryDosDeviceA(byval lpDeviceName as LPCSTR, byval lpTargetPath as LPSTR, byval ucchMax as DWORD) as DWORD

#ifndef UNICODE
	#define DefineDosDevice DefineDosDeviceA
	#define QueryDosDevice QueryDosDeviceA
#endif

#define EXPAND_LOCAL_DRIVES

declare function ReOpenFile(byval hOriginalFile as HANDLE, byval dwDesiredAccess as DWORD, byval dwShareMode as DWORD, byval dwFlagsAndAttributes as DWORD) as HANDLE
declare function GetCompressedFileSizeA(byval lpFileName as LPCSTR, byval lpFileSizeHigh as LPDWORD) as DWORD
declare function GetCompressedFileSizeW(byval lpFileName as LPCWSTR, byval lpFileSizeHigh as LPDWORD) as DWORD

#define GetCompressedFileSize __MINGW_NAME_AW(GetCompressedFileSize)

type LPPROGRESS_ROUTINE as function(byval TotalFileSize as LARGE_INTEGER, byval TotalBytesTransferred as LARGE_INTEGER, byval StreamSize as LARGE_INTEGER, byval StreamBytesTransferred as LARGE_INTEGER, byval dwStreamNumber as DWORD, byval dwCallbackReason as DWORD, byval hSourceFile as HANDLE, byval hDestinationFile as HANDLE, byval lpData as LPVOID) as DWORD

declare function CheckNameLegalDOS8Dot3A(byval lpName as LPCSTR, byval lpOemName as LPSTR, byval OemNameSize as DWORD, byval pbNameContainsSpaces as PBOOL, byval pbNameLegal as PBOOL) as WINBOOL
declare function CheckNameLegalDOS8Dot3W(byval lpName as LPCWSTR, byval lpOemName as LPSTR, byval OemNameSize as DWORD, byval pbNameContainsSpaces as PBOOL, byval pbNameLegal as PBOOL) as WINBOOL
declare function CopyFileA(byval lpExistingFileName as LPCSTR, byval lpNewFileName as LPCSTR, byval bFailIfExists as WINBOOL) as WINBOOL
declare function CopyFileW(byval lpExistingFileName as LPCWSTR, byval lpNewFileName as LPCWSTR, byval bFailIfExists as WINBOOL) as WINBOOL
declare function CopyFileExA(byval lpExistingFileName as LPCSTR, byval lpNewFileName as LPCSTR, byval lpProgressRoutine as LPPROGRESS_ROUTINE, byval lpData as LPVOID, byval pbCancel as LPBOOL, byval dwCopyFlags as DWORD) as WINBOOL
declare function CopyFileExW(byval lpExistingFileName as LPCWSTR, byval lpNewFileName as LPCWSTR, byval lpProgressRoutine as LPPROGRESS_ROUTINE, byval lpData as LPVOID, byval pbCancel as LPBOOL, byval dwCopyFlags as DWORD) as WINBOOL

#define CheckNameLegalDOS8Dot3 __MINGW_NAME_AW(CheckNameLegalDOS8Dot3)
#define CopyFile __MINGW_NAME_AW(CopyFile)
#define CopyFileEx __MINGW_NAME_AW(CopyFileEx)

declare function MoveFileA(byval lpExistingFileName as LPCSTR, byval lpNewFileName as LPCSTR) as WINBOOL
declare function MoveFileW(byval lpExistingFileName as LPCWSTR, byval lpNewFileName as LPCWSTR) as WINBOOL

#define MoveFile __MINGW_NAME_AW(MoveFile)

declare function MoveFileExA(byval lpExistingFileName as LPCSTR, byval lpNewFileName as LPCSTR, byval dwFlags as DWORD) as WINBOOL
declare function MoveFileExW(byval lpExistingFileName as LPCWSTR, byval lpNewFileName as LPCWSTR, byval dwFlags as DWORD) as WINBOOL

#define MoveFileEx __MINGW_NAME_AW(MoveFileEx)

declare function MoveFileWithProgressA(byval lpExistingFileName as LPCSTR, byval lpNewFileName as LPCSTR, byval lpProgressRoutine as LPPROGRESS_ROUTINE, byval lpData as LPVOID, byval dwFlags as DWORD) as WINBOOL
declare function MoveFileWithProgressW(byval lpExistingFileName as LPCWSTR, byval lpNewFileName as LPCWSTR, byval lpProgressRoutine as LPPROGRESS_ROUTINE, byval lpData as LPVOID, byval dwFlags as DWORD) as WINBOOL

#define MoveFileWithProgress __MINGW_NAME_AW(MoveFileWithProgress)
#define MOVEFILE_REPLACE_EXISTING &h00000001
#define MOVEFILE_COPY_ALLOWED &h00000002
#define MOVEFILE_DELAY_UNTIL_REBOOT &h00000004
#define MOVEFILE_WRITE_THROUGH &h00000008
#define MOVEFILE_CREATE_HARDLINK &h00000010
#define MOVEFILE_FAIL_IF_NOT_TRACKABLE &h00000020

declare function ReplaceFileA(byval lpReplacedFileName as LPCSTR, byval lpReplacementFileName as LPCSTR, byval lpBackupFileName as LPCSTR, byval dwReplaceFlags as DWORD, byval lpExclude as LPVOID, byval lpReserved as LPVOID) as WINBOOL
declare function ReplaceFileW(byval lpReplacedFileName as LPCWSTR, byval lpReplacementFileName as LPCWSTR, byval lpBackupFileName as LPCWSTR, byval dwReplaceFlags as DWORD, byval lpExclude as LPVOID, byval lpReserved as LPVOID) as WINBOOL
declare function CreateHardLinkA(byval lpFileName as LPCSTR, byval lpExistingFileName as LPCSTR, byval lpSecurityAttributes as LPSECURITY_ATTRIBUTES) as WINBOOL
declare function CreateHardLinkW(byval lpFileName as LPCWSTR, byval lpExistingFileName as LPCWSTR, byval lpSecurityAttributes as LPSECURITY_ATTRIBUTES) as WINBOOL

#define ReplaceFile __MINGW_NAME_AW(ReplaceFile)
#define CreateHardLink __MINGW_NAME_AW(CreateHardLink)

type _STREAM_INFO_LEVELS as long
enum
	FindStreamInfoStandard
	FindStreamInfoMaxInfoLevel
end enum

type STREAM_INFO_LEVELS as _STREAM_INFO_LEVELS

type _WIN32_FIND_STREAM_DATA
	StreamSize as LARGE_INTEGER
	cStreamName(0 to (260 + 36) - 1) as WCHAR
end type

type WIN32_FIND_STREAM_DATA as _WIN32_FIND_STREAM_DATA
type PWIN32_FIND_STREAM_DATA as _WIN32_FIND_STREAM_DATA ptr

declare function FindFirstStreamW(byval lpFileName as LPCWSTR, byval InfoLevel as STREAM_INFO_LEVELS, byval lpFindStreamData as LPVOID, byval dwFlags as DWORD) as HANDLE
declare function FindNextStreamW(byval hFindStream as HANDLE, byval lpFindStreamData as LPVOID) as WINBOOL
declare function CreateNamedPipeA(byval lpName as LPCSTR, byval dwOpenMode as DWORD, byval dwPipeMode as DWORD, byval nMaxInstances as DWORD, byval nOutBufferSize as DWORD, byval nInBufferSize as DWORD, byval nDefaultTimeOut as DWORD, byval lpSecurityAttributes as LPSECURITY_ATTRIBUTES) as HANDLE
declare function GetNamedPipeHandleStateA(byval hNamedPipe as HANDLE, byval lpState as LPDWORD, byval lpCurInstances as LPDWORD, byval lpMaxCollectionCount as LPDWORD, byval lpCollectDataTimeout as LPDWORD, byval lpUserName as LPSTR, byval nMaxUserNameSize as DWORD) as WINBOOL
declare function GetNamedPipeHandleStateW(byval hNamedPipe as HANDLE, byval lpState as LPDWORD, byval lpCurInstances as LPDWORD, byval lpMaxCollectionCount as LPDWORD, byval lpCollectDataTimeout as LPDWORD, byval lpUserName as LPWSTR, byval nMaxUserNameSize as DWORD) as WINBOOL
declare function CallNamedPipeA(byval lpNamedPipeName as LPCSTR, byval lpInBuffer as LPVOID, byval nInBufferSize as DWORD, byval lpOutBuffer as LPVOID, byval nOutBufferSize as DWORD, byval lpBytesRead as LPDWORD, byval nTimeOut as DWORD) as WINBOOL
declare function CallNamedPipeW(byval lpNamedPipeName as LPCWSTR, byval lpInBuffer as LPVOID, byval nInBufferSize as DWORD, byval lpOutBuffer as LPVOID, byval nOutBufferSize as DWORD, byval lpBytesRead as LPDWORD, byval nTimeOut as DWORD) as WINBOOL
declare function WaitNamedPipeA(byval lpNamedPipeName as LPCSTR, byval nTimeOut as DWORD) as WINBOOL
declare function SetVolumeLabelA(byval lpRootPathName as LPCSTR, byval lpVolumeName as LPCSTR) as WINBOOL
declare function SetVolumeLabelW(byval lpRootPathName as LPCWSTR, byval lpVolumeName as LPCWSTR) as WINBOOL
declare sub SetFileApisToOEM()
declare sub SetFileApisToANSI()
declare function AreFileApisANSI() as WINBOOL
declare function GetVolumeInformationA(byval lpRootPathName as LPCSTR, byval lpVolumeNameBuffer as LPSTR, byval nVolumeNameSize as DWORD, byval lpVolumeSerialNumber as LPDWORD, byval lpMaximumComponentLength as LPDWORD, byval lpFileSystemFlags as LPDWORD, byval lpFileSystemNameBuffer as LPSTR, byval nFileSystemNameSize as DWORD) as WINBOOL
declare function ClearEventLogA(byval hEventLog as HANDLE, byval lpBackupFileName as LPCSTR) as WINBOOL
declare function ClearEventLogW(byval hEventLog as HANDLE, byval lpBackupFileName as LPCWSTR) as WINBOOL
declare function BackupEventLogA(byval hEventLog as HANDLE, byval lpBackupFileName as LPCSTR) as WINBOOL
declare function BackupEventLogW(byval hEventLog as HANDLE, byval lpBackupFileName as LPCWSTR) as WINBOOL
declare function CloseEventLog(byval hEventLog as HANDLE) as WINBOOL
declare function DeregisterEventSource(byval hEventLog as HANDLE) as WINBOOL
declare function NotifyChangeEventLog(byval hEventLog as HANDLE, byval hEvent as HANDLE) as WINBOOL
declare function GetNumberOfEventLogRecords(byval hEventLog as HANDLE, byval NumberOfRecords as PDWORD) as WINBOOL
declare function GetOldestEventLogRecord(byval hEventLog as HANDLE, byval OldestRecord as PDWORD) as WINBOOL
declare function OpenEventLogA(byval lpUNCServerName as LPCSTR, byval lpSourceName as LPCSTR) as HANDLE
declare function OpenEventLogW(byval lpUNCServerName as LPCWSTR, byval lpSourceName as LPCWSTR) as HANDLE
declare function RegisterEventSourceA(byval lpUNCServerName as LPCSTR, byval lpSourceName as LPCSTR) as HANDLE
declare function RegisterEventSourceW(byval lpUNCServerName as LPCWSTR, byval lpSourceName as LPCWSTR) as HANDLE
declare function OpenBackupEventLogA(byval lpUNCServerName as LPCSTR, byval lpFileName as LPCSTR) as HANDLE
declare function OpenBackupEventLogW(byval lpUNCServerName as LPCWSTR, byval lpFileName as LPCWSTR) as HANDLE
declare function ReadEventLogA(byval hEventLog as HANDLE, byval dwReadFlags as DWORD, byval dwRecordOffset as DWORD, byval lpBuffer as LPVOID, byval nNumberOfBytesToRead as DWORD, byval pnBytesRead as DWORD ptr, byval pnMinNumberOfBytesNeeded as DWORD ptr) as WINBOOL
declare function ReadEventLogW(byval hEventLog as HANDLE, byval dwReadFlags as DWORD, byval dwRecordOffset as DWORD, byval lpBuffer as LPVOID, byval nNumberOfBytesToRead as DWORD, byval pnBytesRead as DWORD ptr, byval pnMinNumberOfBytesNeeded as DWORD ptr) as WINBOOL
declare function ReportEventA(byval hEventLog as HANDLE, byval wType as WORD, byval wCategory as WORD, byval dwEventID as DWORD, byval lpUserSid as PSID, byval wNumStrings as WORD, byval dwDataSize as DWORD, byval lpStrings as LPCSTR ptr, byval lpRawData as LPVOID) as WINBOOL
declare function ReportEventW(byval hEventLog as HANDLE, byval wType as WORD, byval wCategory as WORD, byval dwEventID as DWORD, byval lpUserSid as PSID, byval wNumStrings as WORD, byval dwDataSize as DWORD, byval lpStrings as LPCWSTR ptr, byval lpRawData as LPVOID) as WINBOOL

#ifndef UNICODE
	#define CreateNamedPipe CreateNamedPipeA
	#define WaitNamedPipe WaitNamedPipeA
	#define GetVolumeInformation GetVolumeInformationA
#endif

#define GetNamedPipeHandleState __MINGW_NAME_AW(GetNamedPipeHandleState)
#define CallNamedPipe __MINGW_NAME_AW(CallNamedPipe)
#define SetVolumeLabel __MINGW_NAME_AW(SetVolumeLabel)
#define ClearEventLog __MINGW_NAME_AW(ClearEventLog)
#define BackupEventLog __MINGW_NAME_AW(BackupEventLog)
#define OpenEventLog __MINGW_NAME_AW(OpenEventLog)
#define RegisterEventSource __MINGW_NAME_AW(RegisterEventSource)
#define OpenBackupEventLog __MINGW_NAME_AW(OpenBackupEventLog)
#define ReadEventLog __MINGW_NAME_AW(ReadEventLog)
#define ReportEvent __MINGW_NAME_AW(ReportEvent)
#define EVENTLOG_FULL_INFO 0

type _EVENTLOG_FULL_INFORMATION
	dwFull as DWORD
end type

type EVENTLOG_FULL_INFORMATION as _EVENTLOG_FULL_INFORMATION
type LPEVENTLOG_FULL_INFORMATION as _EVENTLOG_FULL_INFORMATION ptr

declare function GetEventLogInformation(byval hEventLog as HANDLE, byval dwInfoLevel as DWORD, byval lpBuffer as LPVOID, byval cbBufSize as DWORD, byval pcbBytesNeeded as LPDWORD) as WINBOOL
declare function AccessCheckAndAuditAlarmA(byval SubsystemName as LPCSTR, byval HandleId as LPVOID, byval ObjectTypeName as LPSTR, byval ObjectName as LPSTR, byval SecurityDescriptor as PSECURITY_DESCRIPTOR, byval DesiredAccess as DWORD, byval GenericMapping as PGENERIC_MAPPING, byval ObjectCreation as WINBOOL, byval GrantedAccess as LPDWORD, byval AccessStatus as LPBOOL, byval pfGenerateOnClose as LPBOOL) as WINBOOL
declare function AccessCheckByTypeAndAuditAlarmA(byval SubsystemName as LPCSTR, byval HandleId as LPVOID, byval ObjectTypeName as LPCSTR, byval ObjectName as LPCSTR, byval SecurityDescriptor as PSECURITY_DESCRIPTOR, byval PrincipalSelfSid as PSID, byval DesiredAccess as DWORD, byval AuditType as AUDIT_EVENT_TYPE, byval Flags as DWORD, byval ObjectTypeList as POBJECT_TYPE_LIST, byval ObjectTypeListLength as DWORD, byval GenericMapping as PGENERIC_MAPPING, byval ObjectCreation as WINBOOL, byval GrantedAccess as LPDWORD, byval AccessStatus as LPBOOL, byval pfGenerateOnClose as LPBOOL) as WINBOOL
declare function AccessCheckByTypeResultListAndAuditAlarmA(byval SubsystemName as LPCSTR, byval HandleId as LPVOID, byval ObjectTypeName as LPCSTR, byval ObjectName as LPCSTR, byval SecurityDescriptor as PSECURITY_DESCRIPTOR, byval PrincipalSelfSid as PSID, byval DesiredAccess as DWORD, byval AuditType as AUDIT_EVENT_TYPE, byval Flags as DWORD, byval ObjectTypeList as POBJECT_TYPE_LIST, byval ObjectTypeListLength as DWORD, byval GenericMapping as PGENERIC_MAPPING, byval ObjectCreation as WINBOOL, byval GrantedAccess as LPDWORD, byval AccessStatusList as LPDWORD, byval pfGenerateOnClose as LPBOOL) as WINBOOL
declare function AccessCheckByTypeResultListAndAuditAlarmByHandleA(byval SubsystemName as LPCSTR, byval HandleId as LPVOID, byval ClientToken as HANDLE, byval ObjectTypeName as LPCSTR, byval ObjectName as LPCSTR, byval SecurityDescriptor as PSECURITY_DESCRIPTOR, byval PrincipalSelfSid as PSID, byval DesiredAccess as DWORD, byval AuditType as AUDIT_EVENT_TYPE, byval Flags as DWORD, byval ObjectTypeList as POBJECT_TYPE_LIST, byval ObjectTypeListLength as DWORD, byval GenericMapping as PGENERIC_MAPPING, byval ObjectCreation as WINBOOL, byval GrantedAccess as LPDWORD, byval AccessStatusList as LPDWORD, byval pfGenerateOnClose as LPBOOL) as WINBOOL
declare function ObjectOpenAuditAlarmA(byval SubsystemName as LPCSTR, byval HandleId as LPVOID, byval ObjectTypeName as LPSTR, byval ObjectName as LPSTR, byval pSecurityDescriptor as PSECURITY_DESCRIPTOR, byval ClientToken as HANDLE, byval DesiredAccess as DWORD, byval GrantedAccess as DWORD, byval Privileges as PPRIVILEGE_SET, byval ObjectCreation as WINBOOL, byval AccessGranted as WINBOOL, byval GenerateOnClose as LPBOOL) as WINBOOL
declare function ObjectPrivilegeAuditAlarmA(byval SubsystemName as LPCSTR, byval HandleId as LPVOID, byval ClientToken as HANDLE, byval DesiredAccess as DWORD, byval Privileges as PPRIVILEGE_SET, byval AccessGranted as WINBOOL) as WINBOOL
declare function ObjectCloseAuditAlarmA(byval SubsystemName as LPCSTR, byval HandleId as LPVOID, byval GenerateOnClose as WINBOOL) as WINBOOL
declare function ObjectDeleteAuditAlarmA(byval SubsystemName as LPCSTR, byval HandleId as LPVOID, byval GenerateOnClose as WINBOOL) as WINBOOL
declare function PrivilegedServiceAuditAlarmA(byval SubsystemName as LPCSTR, byval ServiceName as LPCSTR, byval ClientToken as HANDLE, byval Privileges as PPRIVILEGE_SET, byval AccessGranted as WINBOOL) as WINBOOL
declare function SetFileSecurityA(byval lpFileName as LPCSTR, byval SecurityInformation as SECURITY_INFORMATION, byval pSecurityDescriptor as PSECURITY_DESCRIPTOR) as WINBOOL
declare function GetFileSecurityA(byval lpFileName as LPCSTR, byval RequestedInformation as SECURITY_INFORMATION, byval pSecurityDescriptor as PSECURITY_DESCRIPTOR, byval nLength as DWORD, byval lpnLengthNeeded as LPDWORD) as WINBOOL
declare function ReadDirectoryChangesW(byval hDirectory as HANDLE, byval lpBuffer as LPVOID, byval nBufferLength as DWORD, byval bWatchSubtree as WINBOOL, byval dwNotifyFilter as DWORD, byval lpBytesReturned as LPDWORD, byval lpOverlapped as LPOVERLAPPED, byval lpCompletionRoutine as LPOVERLAPPED_COMPLETION_ROUTINE) as WINBOOL
declare function IsBadReadPtr(byval lp as const any ptr, byval ucb as UINT_PTR) as WINBOOL
declare function IsBadWritePtr(byval lp as LPVOID, byval ucb as UINT_PTR) as WINBOOL
declare function IsBadHugeReadPtr(byval lp as const any ptr, byval ucb as UINT_PTR) as WINBOOL
declare function IsBadHugeWritePtr(byval lp as LPVOID, byval ucb as UINT_PTR) as WINBOOL
declare function IsBadCodePtr(byval lpfn as FARPROC) as WINBOOL
declare function IsBadStringPtrA(byval lpsz as LPCSTR, byval ucchMax as UINT_PTR) as WINBOOL
declare function IsBadStringPtrW(byval lpsz as LPCWSTR, byval ucchMax as UINT_PTR) as WINBOOL
declare function LookupAccountSidA(byval lpSystemName as LPCSTR, byval Sid as PSID, byval Name_ as LPSTR, byval cchName as LPDWORD, byval ReferencedDomainName as LPSTR, byval cchReferencedDomainName as LPDWORD, byval peUse as PSID_NAME_USE) as WINBOOL
declare function LookupAccountSidW(byval lpSystemName as LPCWSTR, byval Sid as PSID, byval Name_ as LPWSTR, byval cchName as LPDWORD, byval ReferencedDomainName as LPWSTR, byval cchReferencedDomainName as LPDWORD, byval peUse as PSID_NAME_USE) as WINBOOL
declare function LookupAccountNameA(byval lpSystemName as LPCSTR, byval lpAccountName as LPCSTR, byval Sid as PSID, byval cbSid as LPDWORD, byval ReferencedDomainName as LPSTR, byval cchReferencedDomainName as LPDWORD, byval peUse as PSID_NAME_USE) as WINBOOL
declare function LookupAccountNameW(byval lpSystemName as LPCWSTR, byval lpAccountName as LPCWSTR, byval Sid as PSID, byval cbSid as LPDWORD, byval ReferencedDomainName as LPWSTR, byval cchReferencedDomainName as LPDWORD, byval peUse as PSID_NAME_USE) as WINBOOL

#ifndef UNICODE
	#define AccessCheckAndAuditAlarm AccessCheckAndAuditAlarmA
	#define AccessCheckByTypeAndAuditAlarm AccessCheckByTypeAndAuditAlarmA
	#define AccessCheckByTypeResultListAndAuditAlarm AccessCheckByTypeResultListAndAuditAlarmA
	#define AccessCheckByTypeResultListAndAuditAlarmByHandle AccessCheckByTypeResultListAndAuditAlarmByHandleA
	#define ObjectOpenAuditAlarm ObjectOpenAuditAlarmA
	#define ObjectPrivilegeAuditAlarm ObjectPrivilegeAuditAlarmA
	#define ObjectCloseAuditAlarm ObjectCloseAuditAlarmA
	#define ObjectDeleteAuditAlarm ObjectDeleteAuditAlarmA
	#define PrivilegedServiceAuditAlarm PrivilegedServiceAuditAlarmA
	#define SetFileSecurity SetFileSecurityA
	#define GetFileSecurity GetFileSecurityA
#endif

#define IsBadStringPtr __MINGW_NAME_AW(IsBadStringPtr)
#define LookupAccountSid __MINGW_NAME_AW(LookupAccountSid)
#define LookupAccountName __MINGW_NAME_AW(LookupAccountName)
#define LookupAccountNameLocalA(n, s, cs, d, cd, u) LookupAccountNameA(NULL, n, s, cs, d, cd, u)
#define LookupAccountNameLocalW(n, s, cs, d, cd, u) LookupAccountNameW(NULL, n, s, cs, d, cd, u)

'' TODO: #define LookupAccountNameLocal(n, s, cs, d, cd, u) __MINGW_NAME_AW(LookupAccountName) (NULL, n, s, cs, d, cd, u)

#define LookupAccountSidLocalA(s, n, cn, d, cd, u) LookupAccountSidA(NULL, s, n, cn, d, cd, u)
#define LookupAccountSidLocalW(s, n, cn, d, cd, u) LookupAccountSidW(NULL, s, n, cn, d, cd, u)

'' TODO: #define LookupAccountSidLocal(s, n, cn, d, cd, u) __MINGW_NAME_AW(LookupAccountSid) (NULL, s, n, cn, d, cd, u)

declare function LookupPrivilegeValueA(byval lpSystemName as LPCSTR, byval lpName as LPCSTR, byval lpLuid as PLUID) as WINBOOL
declare function LookupPrivilegeValueW(byval lpSystemName as LPCWSTR, byval lpName as LPCWSTR, byval lpLuid as PLUID) as WINBOOL
declare function LookupPrivilegeNameA(byval lpSystemName as LPCSTR, byval lpLuid as PLUID, byval lpName as LPSTR, byval cchName as LPDWORD) as WINBOOL
declare function LookupPrivilegeNameW(byval lpSystemName as LPCWSTR, byval lpLuid as PLUID, byval lpName as LPWSTR, byval cchName as LPDWORD) as WINBOOL
declare function LookupPrivilegeDisplayNameA(byval lpSystemName as LPCSTR, byval lpName as LPCSTR, byval lpDisplayName as LPSTR, byval cchDisplayName as LPDWORD, byval lpLanguageId as LPDWORD) as WINBOOL
declare function LookupPrivilegeDisplayNameW(byval lpSystemName as LPCWSTR, byval lpName as LPCWSTR, byval lpDisplayName as LPWSTR, byval cchDisplayName as LPDWORD, byval lpLanguageId as LPDWORD) as WINBOOL
declare function BuildCommDCBA(byval lpDef as LPCSTR, byval lpDCB as LPDCB) as WINBOOL
declare function BuildCommDCBW(byval lpDef as LPCWSTR, byval lpDCB as LPDCB) as WINBOOL
declare function BuildCommDCBAndTimeoutsA(byval lpDef as LPCSTR, byval lpDCB as LPDCB, byval lpCommTimeouts as LPCOMMTIMEOUTS) as WINBOOL
declare function BuildCommDCBAndTimeoutsW(byval lpDef as LPCWSTR, byval lpDCB as LPDCB, byval lpCommTimeouts as LPCOMMTIMEOUTS) as WINBOOL
declare function CommConfigDialogA(byval lpszName as LPCSTR, byval hWnd as HWND, byval lpCC as LPCOMMCONFIG) as WINBOOL
declare function CommConfigDialogW(byval lpszName as LPCWSTR, byval hWnd as HWND, byval lpCC as LPCOMMCONFIG) as WINBOOL
declare function GetDefaultCommConfigA(byval lpszName as LPCSTR, byval lpCC as LPCOMMCONFIG, byval lpdwSize as LPDWORD) as WINBOOL
declare function GetDefaultCommConfigW(byval lpszName as LPCWSTR, byval lpCC as LPCOMMCONFIG, byval lpdwSize as LPDWORD) as WINBOOL
declare function SetDefaultCommConfigA(byval lpszName as LPCSTR, byval lpCC as LPCOMMCONFIG, byval dwSize as DWORD) as WINBOOL
declare function SetDefaultCommConfigW(byval lpszName as LPCWSTR, byval lpCC as LPCOMMCONFIG, byval dwSize as DWORD) as WINBOOL

#define LookupPrivilegeValue __MINGW_NAME_AW(LookupPrivilegeValue)
#define LookupPrivilegeName __MINGW_NAME_AW(LookupPrivilegeName)
#define LookupPrivilegeDisplayName __MINGW_NAME_AW(LookupPrivilegeDisplayName)
#define BuildCommDCB __MINGW_NAME_AW(BuildCommDCB)
#define BuildCommDCBAndTimeouts __MINGW_NAME_AW(BuildCommDCBAndTimeouts)
#define CommConfigDialog __MINGW_NAME_AW(CommConfigDialog)
#define GetDefaultCommConfig __MINGW_NAME_AW(GetDefaultCommConfig)
#define SetDefaultCommConfig __MINGW_NAME_AW(SetDefaultCommConfig)
#define MAX_COMPUTERNAME_LENGTH 15

declare function GetComputerNameA(byval lpBuffer as LPSTR, byval nSize as LPDWORD) as WINBOOL
declare function GetComputerNameW(byval lpBuffer as LPWSTR, byval nSize as LPDWORD) as WINBOOL
declare function SetComputerNameA(byval lpComputerName as LPCSTR) as WINBOOL
declare function SetComputerNameW(byval lpComputerName as LPCWSTR) as WINBOOL
declare function SetComputerNameExA(byval NameType as COMPUTER_NAME_FORMAT, byval lpBuffer as LPCTSTR) as WINBOOL
declare function DnsHostnameToComputerNameA(byval Hostname as LPCSTR, byval ComputerName as LPSTR, byval nSize as LPDWORD) as WINBOOL
declare function DnsHostnameToComputerNameW(byval Hostname as LPCWSTR, byval ComputerName as LPWSTR, byval nSize as LPDWORD) as WINBOOL
declare function GetUserNameA(byval lpBuffer as LPSTR, byval pcbBuffer as LPDWORD) as WINBOOL
declare function GetUserNameW(byval lpBuffer as LPWSTR, byval pcbBuffer as LPDWORD) as WINBOOL

#ifndef UNICODE
	#define SetComputerNameEx SetComputerNameExA
#endif

#define GetComputerName __MINGW_NAME_AW(GetComputerName)
#define SetComputerName __MINGW_NAME_AW(SetComputerName)
#define DnsHostnameToComputerName __MINGW_NAME_AW(DnsHostnameToComputerName)
#define GetUserName __MINGW_NAME_AW(GetUserName)
#define LOGON32_LOGON_INTERACTIVE 2
#define LOGON32_LOGON_NETWORK 3
#define LOGON32_LOGON_BATCH 4
#define LOGON32_LOGON_SERVICE 5
#define LOGON32_LOGON_UNLOCK 7
#define LOGON32_LOGON_NETWORK_CLEARTEXT 8
#define LOGON32_LOGON_NEW_CREDENTIALS 9
#define LOGON32_PROVIDER_DEFAULT 0
#define LOGON32_PROVIDER_WINNT35 1
#define LOGON32_PROVIDER_WINNT40 2
#define LOGON32_PROVIDER_WINNT50 3

declare function LogonUserA(byval lpszUsername as LPCSTR, byval lpszDomain as LPCSTR, byval lpszPassword as LPCSTR, byval dwLogonType as DWORD, byval dwLogonProvider as DWORD, byval phToken as PHANDLE) as WINBOOL
declare function LogonUserW(byval lpszUsername as LPCWSTR, byval lpszDomain as LPCWSTR, byval lpszPassword as LPCWSTR, byval dwLogonType as DWORD, byval dwLogonProvider as DWORD, byval phToken as PHANDLE) as WINBOOL
declare function LogonUserExA(byval lpszUsername as LPCSTR, byval lpszDomain as LPCSTR, byval lpszPassword as LPCSTR, byval dwLogonType as DWORD, byval dwLogonProvider as DWORD, byval phToken as PHANDLE, byval ppLogonSid as PSID ptr, byval ppProfileBuffer as PVOID ptr, byval pdwProfileLength as LPDWORD, byval pQuotaLimits as PQUOTA_LIMITS) as WINBOOL
declare function LogonUserExW(byval lpszUsername as LPCWSTR, byval lpszDomain as LPCWSTR, byval lpszPassword as LPCWSTR, byval dwLogonType as DWORD, byval dwLogonProvider as DWORD, byval phToken as PHANDLE, byval ppLogonSid as PSID ptr, byval ppProfileBuffer as PVOID ptr, byval pdwProfileLength as LPDWORD, byval pQuotaLimits as PQUOTA_LIMITS) as WINBOOL
declare function CreateProcessAsUserA(byval hToken as HANDLE, byval lpApplicationName as LPCSTR, byval lpCommandLine as LPSTR, byval lpProcessAttributes as LPSECURITY_ATTRIBUTES, byval lpThreadAttributes as LPSECURITY_ATTRIBUTES, byval bInheritHandles as WINBOOL, byval dwCreationFlags as DWORD, byval lpEnvironment as LPVOID, byval lpCurrentDirectory as LPCSTR, byval lpStartupInfo as LPSTARTUPINFOA, byval lpProcessInformation as LPPROCESS_INFORMATION) as WINBOOL

#ifndef UNICODE
	#define CreateProcessAsUser CreateProcessAsUserA
#endif

#define LogonUser __MINGW_NAME_AW(LogonUser)
#define LogonUserEx __MINGW_NAME_AW(LogonUserEx)
#define LOGON_WITH_PROFILE &h00000001
#define LOGON_NETCREDENTIALS_ONLY &h00000002
#define LOGON_ZERO_PASSWORD_BUFFER &h80000000

declare function CreateProcessWithLogonW(byval lpUsername as LPCWSTR, byval lpDomain as LPCWSTR, byval lpPassword as LPCWSTR, byval dwLogonFlags as DWORD, byval lpApplicationName as LPCWSTR, byval lpCommandLine as LPWSTR, byval dwCreationFlags as DWORD, byval lpEnvironment as LPVOID, byval lpCurrentDirectory as LPCWSTR, byval lpStartupInfo as LPSTARTUPINFOW, byval lpProcessInformation as LPPROCESS_INFORMATION) as WINBOOL
declare function CreateProcessWithTokenW(byval hToken as HANDLE, byval dwLogonFlags as DWORD, byval lpApplicationName as LPCWSTR, byval lpCommandLine as LPWSTR, byval dwCreationFlags as DWORD, byval lpEnvironment as LPVOID, byval lpCurrentDirectory as LPCWSTR, byval lpStartupInfo as LPSTARTUPINFOW, byval lpProcessInformation as LPPROCESS_INFORMATION) as WINBOOL
declare function IsTokenUntrusted(byval TokenHandle as HANDLE) as WINBOOL
declare function RegisterWaitForSingleObject(byval phNewWaitObject as PHANDLE, byval hObject as HANDLE, byval Callback_ as WAITORTIMERCALLBACK, byval Context as PVOID, byval dwMilliseconds as ULONG_, byval dwFlags as ULONG_) as WINBOOL
declare function UnregisterWait(byval WaitHandle as HANDLE) as WINBOOL
declare function BindIoCompletionCallback(byval FileHandle as HANDLE, byval Function_ as LPOVERLAPPED_COMPLETION_ROUTINE, byval Flags as ULONG_) as WINBOOL
declare function SetTimerQueueTimer(byval TimerQueue as HANDLE, byval Callback_ as WAITORTIMERCALLBACK, byval Parameter as PVOID, byval DueTime as DWORD, byval Period as DWORD, byval PreferIo as WINBOOL) as HANDLE
declare function CancelTimerQueueTimer(byval TimerQueue as HANDLE, byval Timer_ as HANDLE) as WINBOOL
declare function DeleteTimerQueue(byval TimerQueue as HANDLE) as WINBOOL
declare function CreatePrivateNamespaceA(byval lpPrivateNamespaceAttributes as LPSECURITY_ATTRIBUTES, byval lpBoundaryDescriptor as LPVOID, byval lpAliasPrefix as LPCSTR) as HANDLE
declare function OpenPrivateNamespaceA(byval lpBoundaryDescriptor as LPVOID, byval lpAliasPrefix as LPCSTR) as HANDLE
declare function CreateBoundaryDescriptorA(byval Name_ as LPCSTR, byval Flags as ULONG_) as HANDLE
declare function AddIntegrityLabelToBoundaryDescriptor(byval BoundaryDescriptor as HANDLE ptr, byval IntegrityLabel as PSID) as WINBOOL

#ifndef UNICODE
	#define CreatePrivateNamespace __MINGW_NAME_AW(CreatePrivateNamespace)
#endif

#define OpenPrivateNamespace __MINGW_NAME_AW(OpenPrivateNamespace)

#ifndef UNICODE
	#define CreateBoundaryDescriptor __MINGW_NAME_AW(CreateBoundaryDescriptor)
#endif

#define HW_PROFILE_GUIDLEN 39
#define MAX_PROFILE_LEN 80
#define DOCKINFO_UNDOCKED &h1
#define DOCKINFO_DOCKED &h2
#define DOCKINFO_USER_SUPPLIED &h4
#define DOCKINFO_USER_UNDOCKED (DOCKINFO_USER_SUPPLIED or DOCKINFO_UNDOCKED)
#define DOCKINFO_USER_DOCKED (DOCKINFO_USER_SUPPLIED or DOCKINFO_DOCKED)

type tagHW_PROFILE_INFOA
	dwDockInfo as DWORD
	szHwProfileGuid(0 to 38) as CHAR
	szHwProfileName(0 to 79) as CHAR
end type

type HW_PROFILE_INFOA as tagHW_PROFILE_INFOA
type LPHW_PROFILE_INFOA as tagHW_PROFILE_INFOA ptr

type tagHW_PROFILE_INFOW
	dwDockInfo as DWORD
	szHwProfileGuid(0 to 38) as WCHAR
	szHwProfileName(0 to 79) as WCHAR
end type

type HW_PROFILE_INFOW as tagHW_PROFILE_INFOW
type LPHW_PROFILE_INFOW as tagHW_PROFILE_INFOW ptr

#ifdef UNICODE
	type HW_PROFILE_INFO as HW_PROFILE_INFOW
	type LPHW_PROFILE_INFO as LPHW_PROFILE_INFOW
#else
	type HW_PROFILE_INFO as HW_PROFILE_INFOA
	type LPHW_PROFILE_INFO as LPHW_PROFILE_INFOA
#endif

declare function GetCurrentHwProfileA(byval lpHwProfileInfo as LPHW_PROFILE_INFOA) as WINBOOL
declare function GetCurrentHwProfileW(byval lpHwProfileInfo as LPHW_PROFILE_INFOW) as WINBOOL
declare function VerifyVersionInfoA(byval lpVersionInformation as LPOSVERSIONINFOEXA, byval dwTypeMask as DWORD, byval dwlConditionMask as DWORDLONG) as WINBOOL
declare function VerifyVersionInfoW(byval lpVersionInformation as LPOSVERSIONINFOEXW, byval dwTypeMask as DWORD, byval dwlConditionMask as DWORDLONG) as WINBOOL

#define GetCurrentHwProfile __MINGW_NAME_AW(GetCurrentHwProfile)
#define VerifyVersionInfo __MINGW_NAME_AW(VerifyVersionInfo)
#define TC_NORMAL 0
#define TC_HARDERR 1
#define TC_GP_TRAP 2
#define TC_SIGNAL 3
#define AC_LINE_OFFLINE &h00
#define AC_LINE_ONLINE &h01
#define AC_LINE_BACKUP_POWER &h02
#define AC_LINE_UNKNOWN &hff
#define BATTERY_FLAG_HIGH &h01
#define BATTERY_FLAG_LOW &h02
#define BATTERY_FLAG_CRITICAL &h04
#define BATTERY_FLAG_CHARGING &h08
#define BATTERY_FLAG_NO_BATTERY &h80
#define BATTERY_FLAG_UNKNOWN &hff
#define BATTERY_PERCENTAGE_UNKNOWN &hff
#define BATTERY_LIFE_UNKNOWN &hffffffff

type _SYSTEM_POWER_STATUS
	ACLineStatus as BYTE_
	BatteryFlag as BYTE_
	BatteryLifePercent as BYTE_
	Reserved1 as BYTE_
	BatteryLifeTime as DWORD
	BatteryFullLifeTime as DWORD
end type

type SYSTEM_POWER_STATUS as _SYSTEM_POWER_STATUS
type LPSYSTEM_POWER_STATUS as _SYSTEM_POWER_STATUS ptr

declare function GetSystemPowerStatus(byval lpSystemPowerStatus as LPSYSTEM_POWER_STATUS) as WINBOOL
declare function SetSystemPowerState(byval fSuspend as WINBOOL, byval fForce as WINBOOL) as WINBOOL
declare function AllocateUserPhysicalPages(byval hProcess as HANDLE, byval NumberOfPages as PULONG_PTR, byval PageArray as PULONG_PTR) as WINBOOL
declare function FreeUserPhysicalPages(byval hProcess as HANDLE, byval NumberOfPages as PULONG_PTR, byval PageArray as PULONG_PTR) as WINBOOL
declare function MapUserPhysicalPages(byval VirtualAddress as PVOID, byval NumberOfPages as ULONG_PTR, byval PageArray as PULONG_PTR) as WINBOOL
declare function MapUserPhysicalPagesScatter(byval VirtualAddresses as PVOID ptr, byval NumberOfPages as ULONG_PTR, byval PageArray as PULONG_PTR) as WINBOOL
declare function CreateJobObjectA(byval lpJobAttributes as LPSECURITY_ATTRIBUTES, byval lpName as LPCSTR) as HANDLE
declare function CreateJobObjectW(byval lpJobAttributes as LPSECURITY_ATTRIBUTES, byval lpName as LPCWSTR) as HANDLE
declare function OpenJobObjectA(byval dwDesiredAccess as DWORD, byval bInheritHandle as WINBOOL, byval lpName as LPCSTR) as HANDLE
declare function OpenJobObjectW(byval dwDesiredAccess as DWORD, byval bInheritHandle as WINBOOL, byval lpName as LPCWSTR) as HANDLE
declare function AssignProcessToJobObject(byval hJob as HANDLE, byval hProcess as HANDLE) as WINBOOL
declare function TerminateJobObject(byval hJob as HANDLE, byval uExitCode as UINT) as WINBOOL
declare function QueryInformationJobObject(byval hJob as HANDLE, byval JobObjectInformationClass as JOBOBJECTINFOCLASS, byval lpJobObjectInformation as LPVOID, byval cbJobObjectInformationLength as DWORD, byval lpReturnLength as LPDWORD) as WINBOOL
declare function SetInformationJobObject(byval hJob as HANDLE, byval JobObjectInformationClass as JOBOBJECTINFOCLASS, byval lpJobObjectInformation as LPVOID, byval cbJobObjectInformationLength as DWORD) as WINBOOL
declare function CreateJobSet(byval NumJob as ULONG_, byval UserJobSet as PJOB_SET_ARRAY, byval Flags as ULONG_) as WINBOOL
declare function FindFirstVolumeA(byval lpszVolumeName as LPSTR, byval cchBufferLength as DWORD) as HANDLE
declare function FindNextVolumeA(byval hFindVolume as HANDLE, byval lpszVolumeName as LPSTR, byval cchBufferLength as DWORD) as WINBOOL
declare function FindFirstVolumeMountPointA(byval lpszRootPathName as LPCSTR, byval lpszVolumeMountPoint as LPSTR, byval cchBufferLength as DWORD) as HANDLE
declare function FindFirstVolumeMountPointW(byval lpszRootPathName as LPCWSTR, byval lpszVolumeMountPoint as LPWSTR, byval cchBufferLength as DWORD) as HANDLE
declare function FindNextVolumeMountPointA(byval hFindVolumeMountPoint as HANDLE, byval lpszVolumeMountPoint as LPSTR, byval cchBufferLength as DWORD) as WINBOOL
declare function FindNextVolumeMountPointW(byval hFindVolumeMountPoint as HANDLE, byval lpszVolumeMountPoint as LPWSTR, byval cchBufferLength as DWORD) as WINBOOL
declare function FindVolumeMountPointClose(byval hFindVolumeMountPoint as HANDLE) as WINBOOL
declare function SetVolumeMountPointA(byval lpszVolumeMountPoint as LPCSTR, byval lpszVolumeName as LPCSTR) as WINBOOL
declare function SetVolumeMountPointW(byval lpszVolumeMountPoint as LPCWSTR, byval lpszVolumeName as LPCWSTR) as WINBOOL
declare function DeleteVolumeMountPointA(byval lpszVolumeMountPoint as LPCSTR) as WINBOOL
declare function GetVolumeNameForVolumeMountPointA(byval lpszVolumeMountPoint as LPCSTR, byval lpszVolumeName as LPSTR, byval cchBufferLength as DWORD) as WINBOOL
declare function GetVolumePathNameA(byval lpszFileName as LPCSTR, byval lpszVolumePathName as LPSTR, byval cchBufferLength as DWORD) as WINBOOL
declare function GetVolumePathNamesForVolumeNameA(byval lpszVolumeName as LPCSTR, byval lpszVolumePathNames as LPCH, byval cchBufferLength as DWORD, byval lpcchReturnLength as PDWORD) as WINBOOL

#ifndef UNICODE
	#define FindFirstVolume FindFirstVolumeA
	#define FindNextVolume FindNextVolumeA
	#define DeleteVolumeMountPoint DeleteVolumeMountPointA
	#define GetVolumeNameForVolumeMountPoint GetVolumeNameForVolumeMountPointA
	#define GetVolumePathName GetVolumePathNameA
	#define GetVolumePathNamesForVolumeName GetVolumePathNamesForVolumeNameA
#endif

#define CreateJobObject __MINGW_NAME_AW(CreateJobObject)
#define OpenJobObject __MINGW_NAME_AW(OpenJobObject)
#define FindFirstVolumeMountPoint __MINGW_NAME_AW(FindFirstVolumeMountPoint)
#define FindNextVolumeMountPoint __MINGW_NAME_AW(FindNextVolumeMountPoint)
#define SetVolumeMountPoint __MINGW_NAME_AW(SetVolumeMountPoint)
#define ACTCTX_FLAG_PROCESSOR_ARCHITECTURE_VALID &h00000001
#define ACTCTX_FLAG_LANGID_VALID &h00000002
#define ACTCTX_FLAG_ASSEMBLY_DIRECTORY_VALID &h00000004
#define ACTCTX_FLAG_RESOURCE_NAME_VALID &h00000008
#define ACTCTX_FLAG_SET_PROCESS_DEFAULT &h00000010
#define ACTCTX_FLAG_APPLICATION_NAME_VALID &h00000020
#define ACTCTX_FLAG_SOURCE_IS_ASSEMBLYREF &h00000040
#define ACTCTX_FLAG_HMODULE_VALID &h00000080

type tagACTCTXA
	cbSize as ULONG_
	dwFlags as DWORD
	lpSource as LPCSTR
	wProcessorArchitecture as USHORT_
	wLangId as LANGID
	lpAssemblyDirectory as LPCSTR
	lpResourceName as LPCSTR
	lpApplicationName as LPCSTR
	hModule as HMODULE
end type

type ACTCTXA as tagACTCTXA
type PACTCTXA as tagACTCTXA ptr

type tagACTCTXW
	cbSize as ULONG_
	dwFlags as DWORD
	lpSource as LPCWSTR
	wProcessorArchitecture as USHORT_
	wLangId as LANGID
	lpAssemblyDirectory as LPCWSTR
	lpResourceName as LPCWSTR
	lpApplicationName as LPCWSTR
	hModule as HMODULE
end type

type ACTCTXW as tagACTCTXW
type PACTCTXW as tagACTCTXW ptr

#ifdef UNICODE
	type ACTCTX as ACTCTXW
	type PACTCTX as PACTCTXW
#else
	type ACTCTX as ACTCTXA
	type PACTCTX as PACTCTXA
#endif

type PCACTCTXA as const ACTCTXA ptr
type PCACTCTXW as const ACTCTXW ptr

#ifdef UNICODE
	type PCACTCTX as PCACTCTXW
#else
	type PCACTCTX as PCACTCTXA
#endif

declare function CreateActCtxA(byval pActCtx as PCACTCTXA) as HANDLE
declare function CreateActCtxW(byval pActCtx as PCACTCTXW) as HANDLE
declare sub AddRefActCtx(byval hActCtx as HANDLE)
declare sub ReleaseActCtx(byval hActCtx as HANDLE)
declare function ZombifyActCtx(byval hActCtx as HANDLE) as WINBOOL
declare function ActivateActCtx(byval hActCtx as HANDLE, byval lpCookie as ULONG_PTR ptr) as WINBOOL
declare function DeactivateActCtx(byval dwFlags as DWORD, byval ulCookie as ULONG_PTR) as WINBOOL
declare function GetCurrentActCtx(byval lphActCtx as HANDLE ptr) as WINBOOL

#define CreateActCtx __MINGW_NAME_AW(CreateActCtx)
#define DEACTIVATE_ACTCTX_FLAG_FORCE_EARLY_DEACTIVATION &h00000001

type tagACTCTX_SECTION_KEYED_DATA_2600
	cbSize as ULONG_
	ulDataFormatVersion as ULONG_
	lpData as PVOID
	ulLength as ULONG_
	lpSectionGlobalData as PVOID
	ulSectionGlobalDataLength as ULONG_
	lpSectionBase as PVOID
	ulSectionTotalLength as ULONG_
	hActCtx as HANDLE
	ulAssemblyRosterIndex as ULONG_
end type

type ACTCTX_SECTION_KEYED_DATA_2600 as tagACTCTX_SECTION_KEYED_DATA_2600
type PACTCTX_SECTION_KEYED_DATA_2600 as tagACTCTX_SECTION_KEYED_DATA_2600 ptr
type PCACTCTX_SECTION_KEYED_DATA_2600 as const ACTCTX_SECTION_KEYED_DATA_2600 ptr

type tagACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA
	lpInformation as PVOID
	lpSectionBase as PVOID
	ulSectionLength as ULONG_
	lpSectionGlobalDataBase as PVOID
	ulSectionGlobalDataLength as ULONG_
end type

type ACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA as tagACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA
type PACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA as tagACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA ptr
type PCACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA as const ACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA ptr

type tagACTCTX_SECTION_KEYED_DATA
	cbSize as ULONG_
	ulDataFormatVersion as ULONG_
	lpData as PVOID
	ulLength as ULONG_
	lpSectionGlobalData as PVOID
	ulSectionGlobalDataLength as ULONG_
	lpSectionBase as PVOID
	ulSectionTotalLength as ULONG_
	hActCtx as HANDLE
	ulAssemblyRosterIndex as ULONG_
	ulFlags as ULONG_
	AssemblyMetadata as ACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA
end type

type ACTCTX_SECTION_KEYED_DATA as tagACTCTX_SECTION_KEYED_DATA
type PACTCTX_SECTION_KEYED_DATA as tagACTCTX_SECTION_KEYED_DATA ptr
type PCACTCTX_SECTION_KEYED_DATA as const ACTCTX_SECTION_KEYED_DATA ptr

#define FIND_ACTCTX_SECTION_KEY_RETURN_HACTCTX &h00000001
#define FIND_ACTCTX_SECTION_KEY_RETURN_FLAGS &h00000002
#define FIND_ACTCTX_SECTION_KEY_RETURN_ASSEMBLY_METADATA &h00000004

declare function FindActCtxSectionStringA(byval dwFlags as DWORD, byval lpExtensionGuid as const GUID ptr, byval ulSectionId as ULONG_, byval lpStringToFind as LPCSTR, byval ReturnedData as PACTCTX_SECTION_KEYED_DATA) as WINBOOL
declare function FindActCtxSectionStringW(byval dwFlags as DWORD, byval lpExtensionGuid as const GUID ptr, byval ulSectionId as ULONG_, byval lpStringToFind as LPCWSTR, byval ReturnedData as PACTCTX_SECTION_KEYED_DATA) as WINBOOL
declare function FindActCtxSectionGuid(byval dwFlags as DWORD, byval lpExtensionGuid as const GUID ptr, byval ulSectionId as ULONG_, byval lpGuidToFind as const GUID ptr, byval ReturnedData as PACTCTX_SECTION_KEYED_DATA) as WINBOOL

#define FindActCtxSectionString __MINGW_NAME_AW(FindActCtxSectionString)

type _ACTIVATION_CONTEXT_BASIC_INFORMATION
	hActCtx as HANDLE
	dwFlags as DWORD
end type

type ACTIVATION_CONTEXT_BASIC_INFORMATION as _ACTIVATION_CONTEXT_BASIC_INFORMATION
type PACTIVATION_CONTEXT_BASIC_INFORMATION as _ACTIVATION_CONTEXT_BASIC_INFORMATION ptr
type PCACTIVATION_CONTEXT_BASIC_INFORMATION as const _ACTIVATION_CONTEXT_BASIC_INFORMATION ptr

#define ACTIVATION_CONTEXT_BASIC_INFORMATION_DEFINED 1
#define QUERY_ACTCTX_FLAG_USE_ACTIVE_ACTCTX &h00000004
#define QUERY_ACTCTX_FLAG_ACTCTX_IS_HMODULE &h00000008
#define QUERY_ACTCTX_FLAG_ACTCTX_IS_ADDRESS &h00000010
#define QUERY_ACTCTX_FLAG_NO_ADDREF &h80000000

declare function QueryActCtxW(byval dwFlags as DWORD, byval hActCtx as HANDLE, byval pvSubInstance as PVOID, byval ulInfoClass as ULONG_, byval pvBuffer as PVOID, byval cbBuffer as SIZE_T_, byval pcbWrittenOrRequired as SIZE_T_ ptr) as WINBOOL

type PQUERYACTCTXW_FUNC as function(byval dwFlags as DWORD, byval hActCtx as HANDLE, byval pvSubInstance as PVOID, byval ulInfoClass as ULONG_, byval pvBuffer as PVOID, byval cbBuffer as SIZE_T_, byval pcbWrittenOrRequired as SIZE_T_ ptr) as WINBOOL

declare function WTSGetActiveConsoleSessionId() as DWORD
declare function GetNumaProcessorNode(byval Processor as UCHAR, byval NodeNumber as PUCHAR) as WINBOOL
declare function GetNumaNodeProcessorMask(byval Node as UCHAR, byval ProcessorMask as PULONGLONG) as WINBOOL
declare function GetNumaAvailableMemoryNode(byval Node as UCHAR, byval AvailableBytes as PULONGLONG) as WINBOOL

type APPLICATION_RECOVERY_CALLBACK as function(byval pvParameter as PVOID) as DWORD

#define RESTART_MAX_CMD_LINE 1024
#define RESTART_NO_CRASH 1
#define RESTART_NO_HANG 2
#define RESTART_NO_PATCH 4
#define RESTART_NO_REBOOT 8
#define RECOVERY_DEFAULT_PING_INTERVAL 5000
#define RECOVERY_MAX_PING_INTERVAL ((5 * 60) * 1000)

declare function CopyContext(byval Destination as PCONTEXT, byval ContextFlags as DWORD, byval Source as PCONTEXT) as WINBOOL
declare function InitializeContext(byval Buffer as PVOID, byval ContextFlags as DWORD, byval Context as PCONTEXT ptr, byval ContextLength as PDWORD) as WINBOOL
declare function GetEnabledXStateFeatures() as DWORD64
declare function GetXStateFeaturesMask(byval Context as PCONTEXT, byval FeatureMask as PDWORD64) as WINBOOL
declare function LocateXStateFeature(byval Context as PCONTEXT, byval FeatureId as DWORD, byval Length as PDWORD) as PVOID
declare function SetXStateFeaturesMask(byval Context as PCONTEXT, byval FeatureMask as DWORD64) as WINBOOL

#define MICROSOFT_WINDOWS_WINBASE_INTERLOCKED_CPLUSPLUS_H_INCLUDED
#define MICROSOFT_WINDOWS_WINBASE_H_DEFINE_INTERLOCKED_CPLUSPLUS_OVERLOADS ((_WIN32_WINNT >= &h0502) orelse (defined(_WINBASE_) = 0))
#define MICROSOFT_WINBASE_H_DEFINE_INTERLOCKED_CPLUSPLUS_OVERLOADS 0

end extern
