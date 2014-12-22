#pragma once

#include once "_mingw_unicode.bi"
#include once "wintrust.bi"
#include once "psdk_inc/_dbg_common.bi"

#inclib "imagehlp"

#ifdef __FB_64BIT__
	extern "C"
#else
	extern "Windows"
#endif

#define _IMAGEHLP_

#ifdef __FB_64BIT__
	#define _IMAGEHLP64
#endif

#define IMAGEAPI '' TODO: DECLSPEC_IMPORT WINAPI
#define DBHLP_DEPRECIATED __declspec(deprecated)
#define DBHLPAPI IMAGEAPI
#define IMAGE_SEPARATION (64 * 1024)

type _LOADED_IMAGE
	ModuleName as PSTR
	hFile as HANDLE
	MappedAddress as PUCHAR

	#ifdef __FB_64BIT__
		FileHeader as PIMAGE_NT_HEADERS64
	#else
		FileHeader as PIMAGE_NT_HEADERS32
	#endif

	LastRvaSection as PIMAGE_SECTION_HEADER
	NumberOfSections as ULONG
	Sections as PIMAGE_SECTION_HEADER
	Characteristics as ULONG
	fSystemImage as BOOLEAN
	fDOSImage as BOOLEAN
	fReadOnly as BOOLEAN
	Version as UCHAR
	Links as LIST_ENTRY
	SizeOfImage as ULONG
end type

type LOADED_IMAGE as _LOADED_IMAGE
type PLOADED_IMAGE as _LOADED_IMAGE ptr

#define MAX_SYM_NAME 2000

type _MODLOAD_DATA
	ssize as DWORD
	ssig as DWORD
	data as PVOID
	size as DWORD
	flags as DWORD
end type

type MODLOAD_DATA as _MODLOAD_DATA
type PMODLOAD_DATA as _MODLOAD_DATA ptr

type _IMAGEHLP_STATUS_REASON as long
enum
	BindOutOfMemory
	BindRvaToVaFailed
	BindNoRoomInImage
	BindImportModuleFailed
	BindImportProcedureFailed
	BindImportModule
	BindImportProcedure
	BindForwarder
	BindForwarderNOT
	BindImageModified
	BindExpandFileHeaders
	BindImageComplete
	BindMismatchedSymbols
	BindSymbolsNotUpdated
	BindImportProcedure32
	BindImportProcedure64
	BindForwarder32
	BindForwarder64
	BindForwarderNOT32
	BindForwarderNOT64
end enum

type IMAGEHLP_STATUS_REASON as _IMAGEHLP_STATUS_REASON
type PIMAGEHLP_STATUS_ROUTINE as function(byval Reason as IMAGEHLP_STATUS_REASON, byval ImageName as PCSTR, byval DllName as PCSTR, byval Va as ULONG_PTR, byval Parameter as ULONG_PTR) as WINBOOL
type PIMAGEHLP_STATUS_ROUTINE32 as function(byval Reason as IMAGEHLP_STATUS_REASON, byval ImageName as PCSTR, byval DllName as PCSTR, byval Va as ULONG, byval Parameter as ULONG_PTR) as WINBOOL
type PIMAGEHLP_STATUS_ROUTINE64 as function(byval Reason as IMAGEHLP_STATUS_REASON, byval ImageName as PCSTR, byval DllName as PCSTR, byval Va as ULONG64, byval Parameter as ULONG_PTR) as WINBOOL

#define BIND_NO_BOUND_IMPORTS &h00000001
#define BIND_NO_UPDATE &h00000002
#define BIND_ALL_IMAGES &h00000004
#define BIND_CACHE_IMPORT_DLLS &h00000008
#define BIND_REPORT_64BIT_VA &h00000010
#define CHECKSUM_SUCCESS 0
#define CHECKSUM_OPEN_FAILURE 1
#define CHECKSUM_MAP_FAILURE 2
#define CHECKSUM_MAPVIEW_FAILURE 3
#define CHECKSUM_UNICODE_FAILURE 4
#define SPLITSYM_REMOVE_PRIVATE &h00000001
#define SPLITSYM_EXTRACT_ALL &h00000002
#define SPLITSYM_SYMBOLPATH_IS_SRC &h00000004

#ifdef UNICODE
	#define MapFileAndCheckSum MapFileAndCheckSumW
#else
	#define MapFileAndCheckSum MapFileAndCheckSumA
#endif

declare function BindImage(byval ImageName as PCSTR, byval DllPath as PCSTR, byval SymbolPath as PCSTR) as WINBOOL
declare function BindImageEx(byval Flags as DWORD, byval ImageName as PCSTR, byval DllPath as PCSTR, byval SymbolPath as PCSTR, byval StatusRoutine as PIMAGEHLP_STATUS_ROUTINE) as WINBOOL
declare function ReBaseImage(byval CurrentImageName as PCSTR, byval SymbolPath as PCSTR, byval fReBase as WINBOOL, byval fRebaseSysfileOk as WINBOOL, byval fGoingDown as WINBOOL, byval CheckImageSize as ULONG, byval OldImageSize as ULONG ptr, byval OldImageBase as ULONG_PTR ptr, byval NewImageSize as ULONG ptr, byval NewImageBase as ULONG_PTR ptr, byval TimeStamp as ULONG) as WINBOOL
declare function ReBaseImage64(byval CurrentImageName as PCSTR, byval SymbolPath as PCSTR, byval fReBase as WINBOOL, byval fRebaseSysfileOk as WINBOOL, byval fGoingDown as WINBOOL, byval CheckImageSize as ULONG, byval OldImageSize as ULONG ptr, byval OldImageBase as ULONG64 ptr, byval NewImageSize as ULONG ptr, byval NewImageBase as ULONG64 ptr, byval TimeStamp as ULONG) as WINBOOL
declare function GetImageConfigInformation(byval LoadedImage as PLOADED_IMAGE, byval ImageConfigInformation as PIMAGE_LOAD_CONFIG_DIRECTORY) as WINBOOL
declare function GetImageUnusedHeaderBytes(byval LoadedImage as PLOADED_IMAGE, byval SizeUnusedHeaderBytes as PDWORD) as DWORD
declare function SetImageConfigInformation(byval LoadedImage as PLOADED_IMAGE, byval ImageConfigInformation as PIMAGE_LOAD_CONFIG_DIRECTORY) as WINBOOL
declare function CheckSumMappedFile(byval BaseAddress as PVOID, byval FileLength as DWORD, byval HeaderSum as PDWORD, byval CheckSum as PDWORD) as PIMAGE_NT_HEADERS
declare function MapFileAndCheckSumA(byval Filename as PCSTR, byval HeaderSum as PDWORD, byval CheckSum as PDWORD) as DWORD
declare function MapFileAndCheckSumW(byval Filename as PCWSTR, byval HeaderSum as PDWORD, byval CheckSum as PDWORD) as DWORD

#define CERT_PE_IMAGE_DIGEST_DEBUG_INFO &h01
#define CERT_PE_IMAGE_DIGEST_RESOURCES &h02
#define CERT_PE_IMAGE_DIGEST_ALL_IMPORT_INFO &h04
#define CERT_PE_IMAGE_DIGEST_NON_PE_INFO &h08
#define CERT_SECTION_TYPE_ANY &hFF

type DIGEST_HANDLE as PVOID
type DIGEST_FUNCTION as function(byval refdata as DIGEST_HANDLE, byval pData as PBYTE, byval dwLength as DWORD) as WINBOOL

declare function ImageGetDigestStream(byval FileHandle as HANDLE, byval DigestLevel as DWORD, byval DigestFunction as DIGEST_FUNCTION, byval DigestHandle as DIGEST_HANDLE) as WINBOOL
declare function ImageAddCertificate(byval FileHandle as HANDLE, byval Certificate as LPWIN_CERTIFICATE, byval Index as PDWORD) as WINBOOL
declare function ImageRemoveCertificate(byval FileHandle as HANDLE, byval Index as DWORD) as WINBOOL
declare function ImageEnumerateCertificates(byval FileHandle as HANDLE, byval TypeFilter as WORD, byval CertificateCount as PDWORD, byval Indices as PDWORD, byval IndexCount as DWORD) as WINBOOL
declare function ImageGetCertificateData(byval FileHandle as HANDLE, byval CertificateIndex as DWORD, byval Certificate as LPWIN_CERTIFICATE, byval RequiredLength as PDWORD) as WINBOOL
declare function ImageGetCertificateHeader(byval FileHandle as HANDLE, byval CertificateIndex as DWORD, byval Certificateheader as LPWIN_CERTIFICATE) as WINBOOL
declare function ImageLoad(byval DllName as PCSTR, byval DllPath as PCSTR) as PLOADED_IMAGE
declare function ImageUnload(byval LoadedImage as PLOADED_IMAGE) as WINBOOL
declare function MapAndLoad(byval ImageName as PCSTR, byval DllPath as PCSTR, byval LoadedImage as PLOADED_IMAGE, byval DotDll as WINBOOL, byval ReadOnly as WINBOOL) as WINBOOL
declare function UnMapAndLoad(byval LoadedImage as PLOADED_IMAGE) as WINBOOL
declare function TouchFileTimes(byval FileHandle as HANDLE, byval pSystemTime as PSYSTEMTIME) as WINBOOL
declare function SplitSymbols(byval ImageName as PSTR, byval SymbolsPath as PCSTR, byval SymbolFilePath as PSTR, byval Flags as DWORD) as WINBOOL
declare function UpdateDebugInfoFile(byval ImageFileName as PCSTR, byval SymbolPath as PCSTR, byval DebugFilePath as PSTR, byval NtHeaders as PIMAGE_NT_HEADERS32) as WINBOOL
declare function UpdateDebugInfoFileEx(byval ImageFileName as PCSTR, byval SymbolPath as PCSTR, byval DebugFilePath as PSTR, byval NtHeaders as PIMAGE_NT_HEADERS32, byval OldChecksum as DWORD) as WINBOOL

end extern
