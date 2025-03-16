'' FreeBASIC binding for zstd-1.5.6
''
'' based on the C header files:
''   Copyright (c) Meta Platforms, Inc. and affiliates.
''   All rights reserved.
''
''   This source code is licensed under both the BSD-style license (found in the
''   LICENSE file in the root directory of this source tree) and the GPLv2 (found
''   in the COPYING file in the root directory of this source tree).
''   You may select, at your option, one of the above-listed licenses.
''
'' translated to FreeBASIC by:
''   FreeBASIC development team

#pragma once

#inclib "zstd"

'' The following symbols have been renamed:
''     #define ZSTD_COMPRESSBOUND => ZSTD_COMPRESSBOUND_

extern "C"

#ifdef __FB_WIN32__
	#define ZSTDLIB_VISIBLE
	#define ZSTDLIB_HIDDEN
#endif

#define ZSTDLIB_API ZSTDLIB_VISIBLE
const ZSTD_VERSION_MAJOR = 1
const ZSTD_VERSION_MINOR = 5
const ZSTD_VERSION_RELEASE = 6
const ZSTD_VERSION_NUMBER = (((ZSTD_VERSION_MAJOR * 100) * 100) + (ZSTD_VERSION_MINOR * 100)) + ZSTD_VERSION_RELEASE
declare function ZSTD_versionNumber() as ulong
#define ZSTD_LIB_VERSION ZSTD_VERSION_MAJOR.ZSTD_VERSION_MINOR.ZSTD_VERSION_RELEASE
#define ZSTD_QUOTE(str_) #str_
#define ZSTD_EXPAND_AND_QUOTE(str_) ZSTD_QUOTE(str_)
#define ZSTD_VERSION_STRING ZSTD_EXPAND_AND_QUOTE(ZSTD_LIB_VERSION)
declare function ZSTD_versionString() as const zstring ptr
const ZSTD_CLEVEL_DEFAULT = 3
const ZSTD_MAGICNUMBER = &hFD2FB528
const ZSTD_MAGIC_DICTIONARY = &hEC30A437
const ZSTD_MAGIC_SKIPPABLE_START = &h184D2A50
const ZSTD_MAGIC_SKIPPABLE_MASK = &hFFFFFFF0
const ZSTD_BLOCKSIZELOG_MAX = 17
const ZSTD_BLOCKSIZE_MAX = 1 shl ZSTD_BLOCKSIZELOG_MAX
declare function ZSTD_compress(byval dst as any ptr, byval dstCapacity as uinteger, byval src as const any ptr, byval srcSize as uinteger, byval compressionLevel as long) as uinteger
declare function ZSTD_decompress(byval dst as any ptr, byval dstCapacity as uinteger, byval src as const any ptr, byval compressedSize as uinteger) as uinteger
const ZSTD_CONTENTSIZE_UNKNOWN = 0ull - 1
const ZSTD_CONTENTSIZE_ERROR = 0ull - 2

declare function ZSTD_getFrameContentSize(byval src as const any ptr, byval srcSize as uinteger) as ulongint
declare function ZSTD_getDecompressedSize(byval src as const any ptr, byval srcSize as uinteger) as ulongint
declare function ZSTD_findFrameCompressedSize(byval src as const any ptr, byval srcSize as uinteger) as uinteger
#define ZSTD_MAX_INPUT_SIZE iif(sizeof(uinteger) = 8, &hFF00FF00FF00FF00ull, &hFF00FF00u)
#define ZSTD_COMPRESSBOUND_(srcSize) iif(cuint(srcSize) >= ZSTD_MAX_INPUT_SIZE, 0, ((srcSize) + ((srcSize) shr 8)) + iif((srcSize) < (128 shl 10), ((128 shl 10) - (srcSize)) shr 11, 0))
declare function ZSTD_compressBound(byval srcSize as uinteger) as uinteger
declare function ZSTD_isError(byval code as uinteger) as ulong
declare function ZSTD_getErrorName(byval code as uinteger) as const zstring ptr
declare function ZSTD_minCLevel() as long
declare function ZSTD_maxCLevel() as long
declare function ZSTD_defaultCLevel() as long
type ZSTD_CCtx as ZSTD_CCtx_s
declare function ZSTD_createCCtx() as ZSTD_CCtx ptr
declare function ZSTD_freeCCtx(byval cctx as ZSTD_CCtx ptr) as uinteger
declare function ZSTD_compressCCtx(byval cctx as ZSTD_CCtx ptr, byval dst as any ptr, byval dstCapacity as uinteger, byval src as const any ptr, byval srcSize as uinteger, byval compressionLevel as long) as uinteger
type ZSTD_DCtx as ZSTD_DCtx_s
declare function ZSTD_createDCtx() as ZSTD_DCtx ptr
declare function ZSTD_freeDCtx(byval dctx as ZSTD_DCtx ptr) as uinteger
declare function ZSTD_decompressDCtx(byval dctx as ZSTD_DCtx ptr, byval dst as any ptr, byval dstCapacity as uinteger, byval src as const any ptr, byval srcSize as uinteger) as uinteger

type ZSTD_strategy as long
enum
	ZSTD_fast = 1
	ZSTD_dfast = 2
	ZSTD_greedy = 3
	ZSTD_lazy = 4
	ZSTD_lazy2 = 5
	ZSTD_btlazy2 = 6
	ZSTD_btopt = 7
	ZSTD_btultra = 8
	ZSTD_btultra2 = 9
end enum

type ZSTD_cParameter as long
enum
	ZSTD_c_compressionLevel = 100
	ZSTD_c_windowLog = 101
	ZSTD_c_hashLog = 102
	ZSTD_c_chainLog = 103
	ZSTD_c_searchLog = 104
	ZSTD_c_minMatch = 105
	ZSTD_c_targetLength = 106
	ZSTD_c_strategy = 107
	ZSTD_c_targetCBlockSize = 130
	ZSTD_c_enableLongDistanceMatching = 160
	ZSTD_c_ldmHashLog = 161
	ZSTD_c_ldmMinMatch = 162
	ZSTD_c_ldmBucketSizeLog = 163
	ZSTD_c_ldmHashRateLog = 164
	ZSTD_c_contentSizeFlag = 200
	ZSTD_c_checksumFlag = 201
	ZSTD_c_dictIDFlag = 202
	ZSTD_c_nbWorkers = 400
	ZSTD_c_jobSize = 401
	ZSTD_c_overlapLog = 402
	ZSTD_c_experimentalParam1 = 500
	ZSTD_c_experimentalParam2 = 10
	ZSTD_c_experimentalParam3 = 1000
	ZSTD_c_experimentalParam4 = 1001
	ZSTD_c_experimentalParam5 = 1002
	ZSTD_c_experimentalParam7 = 1004
	ZSTD_c_experimentalParam8 = 1005
	ZSTD_c_experimentalParam9 = 1006
	ZSTD_c_experimentalParam10 = 1007
	ZSTD_c_experimentalParam11 = 1008
	ZSTD_c_experimentalParam12 = 1009
	ZSTD_c_experimentalParam13 = 1010
	ZSTD_c_experimentalParam14 = 1011
	ZSTD_c_experimentalParam15 = 1012
	ZSTD_c_experimentalParam16 = 1013
	ZSTD_c_experimentalParam17 = 1014
	ZSTD_c_experimentalParam18 = 1015
	ZSTD_c_experimentalParam19 = 1016
end enum

type ZSTD_bounds
	error as uinteger
	lowerBound as long
	upperBound as long
end type

declare function ZSTD_cParam_getBounds(byval cParam as ZSTD_cParameter) as ZSTD_bounds
declare function ZSTD_CCtx_setParameter(byval cctx as ZSTD_CCtx ptr, byval param as ZSTD_cParameter, byval value as long) as uinteger
declare function ZSTD_CCtx_setPledgedSrcSize(byval cctx as ZSTD_CCtx ptr, byval pledgedSrcSize as ulongint) as uinteger

type ZSTD_ResetDirective as long
enum
	ZSTD_reset_session_only = 1
	ZSTD_reset_parameters = 2
	ZSTD_reset_session_and_parameters = 3
end enum

declare function ZSTD_CCtx_reset(byval cctx as ZSTD_CCtx ptr, byval reset as ZSTD_ResetDirective) as uinteger
declare function ZSTD_compress2(byval cctx as ZSTD_CCtx ptr, byval dst as any ptr, byval dstCapacity as uinteger, byval src as const any ptr, byval srcSize as uinteger) as uinteger

type ZSTD_dParameter as long
enum
	ZSTD_d_windowLogMax = 100
	ZSTD_d_experimentalParam1 = 1000
	ZSTD_d_experimentalParam2 = 1001
	ZSTD_d_experimentalParam3 = 1002
	ZSTD_d_experimentalParam4 = 1003
	ZSTD_d_experimentalParam5 = 1004
	ZSTD_d_experimentalParam6 = 1005
end enum

declare function ZSTD_dParam_getBounds(byval dParam as ZSTD_dParameter) as ZSTD_bounds
declare function ZSTD_DCtx_setParameter(byval dctx as ZSTD_DCtx ptr, byval param as ZSTD_dParameter, byval value as long) as uinteger
declare function ZSTD_DCtx_reset(byval dctx as ZSTD_DCtx ptr, byval reset as ZSTD_ResetDirective) as uinteger

type ZSTD_inBuffer_s
	src as const any ptr
	size as uinteger
	pos as uinteger
end type

type ZSTD_inBuffer as ZSTD_inBuffer_s

type ZSTD_outBuffer_s
	dst as any ptr
	size as uinteger
	pos as uinteger
end type

type ZSTD_outBuffer as ZSTD_outBuffer_s
type ZSTD_CStream as ZSTD_CCtx
declare function ZSTD_createCStream() as ZSTD_CStream ptr
declare function ZSTD_freeCStream(byval zcs as ZSTD_CStream ptr) as uinteger

type ZSTD_EndDirective as long
enum
	ZSTD_e_continue = 0
	ZSTD_e_flush = 1
	ZSTD_e_end = 2
end enum

declare function ZSTD_compressStream2(byval cctx as ZSTD_CCtx ptr, byval output as ZSTD_outBuffer ptr, byval input as ZSTD_inBuffer ptr, byval endOp as ZSTD_EndDirective) as uinteger
declare function ZSTD_CStreamInSize() as uinteger
declare function ZSTD_CStreamOutSize() as uinteger
declare function ZSTD_initCStream(byval zcs as ZSTD_CStream ptr, byval compressionLevel as long) as uinteger
declare function ZSTD_compressStream(byval zcs as ZSTD_CStream ptr, byval output as ZSTD_outBuffer ptr, byval input as ZSTD_inBuffer ptr) as uinteger
declare function ZSTD_flushStream(byval zcs as ZSTD_CStream ptr, byval output as ZSTD_outBuffer ptr) as uinteger
declare function ZSTD_endStream(byval zcs as ZSTD_CStream ptr, byval output as ZSTD_outBuffer ptr) as uinteger
type ZSTD_DStream as ZSTD_DCtx
declare function ZSTD_createDStream() as ZSTD_DStream ptr
declare function ZSTD_freeDStream(byval zds as ZSTD_DStream ptr) as uinteger
declare function ZSTD_initDStream(byval zds as ZSTD_DStream ptr) as uinteger
declare function ZSTD_decompressStream(byval zds as ZSTD_DStream ptr, byval output as ZSTD_outBuffer ptr, byval input as ZSTD_inBuffer ptr) as uinteger
declare function ZSTD_DStreamInSize() as uinteger
declare function ZSTD_DStreamOutSize() as uinteger
declare function ZSTD_compress_usingDict(byval ctx as ZSTD_CCtx ptr, byval dst as any ptr, byval dstCapacity as uinteger, byval src as const any ptr, byval srcSize as uinteger, byval dict as const any ptr, byval dictSize as uinteger, byval compressionLevel as long) as uinteger
declare function ZSTD_decompress_usingDict(byval dctx as ZSTD_DCtx ptr, byval dst as any ptr, byval dstCapacity as uinteger, byval src as const any ptr, byval srcSize as uinteger, byval dict as const any ptr, byval dictSize as uinteger) as uinteger
type ZSTD_CDict as ZSTD_CDict_s
declare function ZSTD_createCDict(byval dictBuffer as const any ptr, byval dictSize as uinteger, byval compressionLevel as long) as ZSTD_CDict ptr
declare function ZSTD_freeCDict(byval CDict as ZSTD_CDict ptr) as uinteger
declare function ZSTD_compress_usingCDict(byval cctx as ZSTD_CCtx ptr, byval dst as any ptr, byval dstCapacity as uinteger, byval src as const any ptr, byval srcSize as uinteger, byval cdict as const ZSTD_CDict ptr) as uinteger
type ZSTD_DDict as ZSTD_DDict_s
declare function ZSTD_createDDict(byval dictBuffer as const any ptr, byval dictSize as uinteger) as ZSTD_DDict ptr
declare function ZSTD_freeDDict(byval ddict as ZSTD_DDict ptr) as uinteger
declare function ZSTD_decompress_usingDDict(byval dctx as ZSTD_DCtx ptr, byval dst as any ptr, byval dstCapacity as uinteger, byval src as const any ptr, byval srcSize as uinteger, byval ddict as const ZSTD_DDict ptr) as uinteger
declare function ZSTD_getDictID_fromDict(byval dict as const any ptr, byval dictSize as uinteger) as ulong
declare function ZSTD_getDictID_fromCDict(byval cdict as const ZSTD_CDict ptr) as ulong
declare function ZSTD_getDictID_fromDDict(byval ddict as const ZSTD_DDict ptr) as ulong
declare function ZSTD_getDictID_fromFrame(byval src as const any ptr, byval srcSize as uinteger) as ulong
declare function ZSTD_CCtx_loadDictionary(byval cctx as ZSTD_CCtx ptr, byval dict as const any ptr, byval dictSize as uinteger) as uinteger
declare function ZSTD_CCtx_refCDict(byval cctx as ZSTD_CCtx ptr, byval cdict as const ZSTD_CDict ptr) as uinteger
declare function ZSTD_CCtx_refPrefix(byval cctx as ZSTD_CCtx ptr, byval prefix as const any ptr, byval prefixSize as uinteger) as uinteger
declare function ZSTD_DCtx_loadDictionary(byval dctx as ZSTD_DCtx ptr, byval dict as const any ptr, byval dictSize as uinteger) as uinteger
declare function ZSTD_DCtx_refDDict(byval dctx as ZSTD_DCtx ptr, byval ddict as const ZSTD_DDict ptr) as uinteger
declare function ZSTD_DCtx_refPrefix(byval dctx as ZSTD_DCtx ptr, byval prefix as const any ptr, byval prefixSize as uinteger) as uinteger
declare function ZSTD_sizeof_CCtx(byval cctx as const ZSTD_CCtx ptr) as uinteger
declare function ZSTD_sizeof_DCtx(byval dctx as const ZSTD_DCtx ptr) as uinteger
declare function ZSTD_sizeof_CStream(byval zcs as const ZSTD_CStream ptr) as uinteger
declare function ZSTD_sizeof_DStream(byval zds as const ZSTD_DStream ptr) as uinteger
declare function ZSTD_sizeof_CDict(byval cdict as const ZSTD_CDict ptr) as uinteger
declare function ZSTD_sizeof_DDict(byval ddict as const ZSTD_DDict ptr) as uinteger

end extern
