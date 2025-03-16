'' FreeBASIC binding for zstd-1.5.6
'' based on the C header files:
''   Main header file for the bfd library -- portable access to object files.
''Zstandard, or zstd as short version, is a fast lossless compression algorithm, 
''targeting real-time compression scenarios at zlib-level and better compression ratios.
''Zstandard is dual-licensed under BSD OR GPLv2.
'' translated to FreeBASIC by:
''   FreeBASIC development team
#pragma once
#ifndef ZSTD_ERRORS_H_398273423
#define ZSTD_ERRORS_H_398273423

#include once "crt/stddef.bi"

extern "C"

#define ZSTD_ERRORS_H_398273423

#ifdef __FB_WIN32__
	#define ZSTDERRORLIB_VISIBLE
	#define ZSTDERRORLIB_HIDDEN
#endif

#define ZSTDERRORLIB_API ZSTDERRORLIB_VISIBLE

type ZSTD_ErrorCode as long
enum
	ZSTD_error_no_error = 0
	ZSTD_error_GENERIC = 1
	ZSTD_error_prefix_unknown = 10
	ZSTD_error_version_unsupported = 12
	ZSTD_error_frameParameter_unsupported = 14
	ZSTD_error_frameParameter_windowTooLarge = 16
	ZSTD_error_corruption_detected = 20
	ZSTD_error_checksum_wrong = 22
	ZSTD_error_literals_headerWrong = 24
	ZSTD_error_dictionary_corrupted = 30
	ZSTD_error_dictionary_wrong = 32
	ZSTD_error_dictionaryCreation_failed = 34
	ZSTD_error_parameter_unsupported = 40
	ZSTD_error_parameter_combination_unsupported = 41
	ZSTD_error_parameter_outOfBound = 42
	ZSTD_error_tableLog_tooLarge = 44
	ZSTD_error_maxSymbolValue_tooLarge = 46
	ZSTD_error_maxSymbolValue_tooSmall = 48
	ZSTD_error_stabilityCondition_notRespected = 50
	ZSTD_error_stage_wrong = 60
	ZSTD_error_init_missing = 62
	ZSTD_error_memory_allocation = 64
	ZSTD_error_workSpace_tooSmall = 66
	ZSTD_error_dstSize_tooSmall = 70
	ZSTD_error_srcSize_wrong = 72
	ZSTD_error_dstBuffer_null = 74
	ZSTD_error_noForwardProgress_destFull = 80
	ZSTD_error_noForwardProgress_inputEmpty = 82
	ZSTD_error_frameIndex_tooLarge = 100
	ZSTD_error_seekableIO = 102
	ZSTD_error_dstBuffer_wrong = 104
	ZSTD_error_srcBuffer_wrong = 105
	ZSTD_error_sequenceProducer_failed = 106
	ZSTD_error_externalSequences_invalid = 107
	ZSTD_error_maxCode = 120
end enum

declare function ZSTD_getErrorCode(byval functionResult as uinteger) as ZSTD_ErrorCode
declare function ZSTD_getErrorString(byval code as ZSTD_ErrorCode) as const zstring ptr

end extern
#endif
