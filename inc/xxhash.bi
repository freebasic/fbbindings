'freebasic bindings for xxHash - Extremely Fast Hash algorithm
 '* Copyright (C) 2012-2023 Yann Collet
 '*
 '* BSD 2-Clause License (https://www.opensource.org/licenses/bsd-license.php)
 '*
 '* Redistribution and use in source and binary forms, with or without
 '* modification, are permitted provided that the following conditions are
 '* met:
 '*
 '*    * Redistributions of source code must retain the above copyright
 '*      notice, this list of conditions and the following disclaimer.
 '*    * Redistributions in binary form must reproduce the above
 '*      copyright notice, this list of conditions and the following disclaimer
 '*      in the documentation and/or other materials provided with the
 '*      distribution.
 '*
 '* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 '* "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 '* LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 '* A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 '* OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 '* SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 '* LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 '* DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 '* THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 '* (INCLUDING NEGLIGENCE Or OTHERWISE) ARISING IN Any WAY Out OF THE USE
 '* OF This SOFTWARE, EVEN If ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 '' translated to FreeBASIC by:
''   FreeBASIC development team

#pragma once
#ifndef XXH_PUBLIC_API
#define XXH_PUBLIC_API
#include once "crt/long.bi"
#include once "crt/stddef.bi"
#include once "crt/stdint.bi"
#inclib "xxhash"
extern "C"

const XXHASH_H_5627135585666179 = 1

const XXH_VERSION_MAJOR = 0
const XXH_VERSION_MINOR = 8
const XXH_VERSION_RELEASE = 3
const XXH_VERSION_NUMBER = (((XXH_VERSION_MAJOR * 100) * 100) + (XXH_VERSION_MINOR * 100)) + XXH_VERSION_RELEASE
declare function XXH_versionNumber() as ulong

type XXH_errorcode as long
enum
   XXH_OK = 0
   XXH_ERROR
end enum

type XXH32_hash_t as ulong
declare function XXH32(byval input as const any ptr, byval length as uinteger, byval seed as XXH32_hash_t) as XXH32_hash_t
type XXH32_state_t as XXH32_state_s
declare function XXH32_createState() as XXH32_state_t ptr
declare function XXH32_freeState(byval statePtr as XXH32_state_t ptr) as XXH_errorcode
declare sub XXH32_copyState(byval dst_state as XXH32_state_t ptr, byval src_state as const XXH32_state_t ptr)
declare function XXH32_reset(byval statePtr as XXH32_state_t ptr, byval seed as XXH32_hash_t) as XXH_errorcode
declare function XXH32_update(byval statePtr as XXH32_state_t ptr, byval input as const any ptr, byval length as uinteger) as XXH_errorcode
declare function XXH32_digest(byval statePtr as const XXH32_state_t ptr) as XXH32_hash_t

type XXH32_canonical_t
   digest(0 to 3) as ubyte
end type

declare sub XXH32_canonicalFromHash(byval dst as XXH32_canonical_t ptr, byval hash as XXH32_hash_t)
declare function XXH32_hashFromCanonical(byval src as const XXH32_canonical_t ptr) as XXH32_hash_t
#define XXH_HAS_ATTRIBUTE(x) 0
const XXH_C23_VN = cast(clong, 201711)
#define XXH_HAS_C_ATTRIBUTE(x) 0
#define XXH_HAS_CPP_ATTRIBUTE(x) 0
#define XXH_FALLTHROUGH
#define XXH_NOESCAPE
Type XXH64_hash_t As ULongInt
Declare Function XXH64(ByVal Input As Const Any Ptr, ByVal length As UInteger, ByVal seed As XXH64_hash_t) As XXH64_hash_t
type XXH64_state_t as XXH64_state_s

declare function XXH64_createState() as XXH64_state_t ptr
declare function XXH64_freeState(byval statePtr as XXH64_state_t ptr) as XXH_errorcode
declare sub XXH64_copyState(byval dst_state as XXH64_state_t ptr, byval src_state as const XXH64_state_t ptr)
declare function XXH64_reset(byval statePtr as XXH64_state_t ptr, byval seed as XXH64_hash_t) as XXH_errorcode
declare function XXH64_update(byval statePtr as XXH64_state_t ptr, byval input as const any ptr, byval length as uinteger) as XXH_errorcode
declare function XXH64_digest(byval statePtr as const XXH64_state_t ptr) as XXH64_hash_t

type XXH64_canonical_t
   digest(0 to sizeof(XXH64_hash_t) - 1) as ubyte
end type

declare sub XXH64_canonicalFromHash(byval dst as XXH64_canonical_t ptr, byval hash as XXH64_hash_t)
declare function XXH64_hashFromCanonical(byval src as const XXH64_canonical_t ptr) as XXH64_hash_t
const XXH_SCALAR = 0
const XXH_SSE2 = 1
const XXH_AVX2 = 2
const XXH_AVX512 = 3
const XXH_NEON = 4
const XXH_VSX = 5
const XXH_SVE = 6
const XXH_LSX = 7
declare function XXH3_64bits(byval input as const any ptr, byval length as uinteger) as XXH64_hash_t
declare function XXH3_64bits_withSeed(byval input as const any ptr, byval length as uinteger, byval seed as XXH64_hash_t) as XXH64_hash_t
const XXH3_SECRET_SIZE_MIN = 136
declare function XXH3_64bits_withSecret(byval data_ as const any ptr, byval len_ as uinteger, byval secret as const any ptr, byval secretSize as uinteger) as XXH64_hash_t
type XXH3_state_t as XXH3_state_s

declare function XXH3_createState() as XXH3_state_t ptr
declare function XXH3_freeState(byval statePtr as XXH3_state_t ptr) as XXH_errorcode
declare sub XXH3_copyState(byval dst_state as XXH3_state_t ptr, byval src_state as const XXH3_state_t ptr)
declare function XXH3_64bits_reset(byval statePtr as XXH3_state_t ptr) as XXH_errorcode
declare function XXH3_64bits_reset_withSeed(byval statePtr as XXH3_state_t ptr, byval seed as XXH64_hash_t) as XXH_errorcode
declare function XXH3_64bits_reset_withSecret(byval statePtr as XXH3_state_t ptr, byval secret as const any ptr, byval secretSize as uinteger) as XXH_errorcode
declare function XXH3_64bits_update(byval statePtr as XXH3_state_t ptr, byval input as const any ptr, byval length as uinteger) as XXH_errorcode
declare function XXH3_64bits_digest(byval statePtr as const XXH3_state_t ptr) as XXH64_hash_t

type XXH128_hash_t
   low64 as XXH64_hash_t
   high64 as XXH64_hash_t
end type

declare function XXH3_128bits(byval data_ as const any ptr, byval len_ as uinteger) as XXH128_hash_t
declare function XXH3_128bits_withSeed(byval data_ as const any ptr, byval len_ as uinteger, byval seed as XXH64_hash_t) as XXH128_hash_t
declare function XXH3_128bits_withSecret(byval data_ as const any ptr, byval len_ as uinteger, byval secret as const any ptr, byval secretSize as uinteger) as XXH128_hash_t
declare function XXH3_128bits_reset(byval statePtr as XXH3_state_t ptr) as XXH_errorcode
declare function XXH3_128bits_reset_withSeed(byval statePtr as XXH3_state_t ptr, byval seed as XXH64_hash_t) as XXH_errorcode
declare function XXH3_128bits_reset_withSecret(byval statePtr as XXH3_state_t ptr, byval secret as const any ptr, byval secretSize as uinteger) as XXH_errorcode
declare function XXH3_128bits_update(byval statePtr as XXH3_state_t ptr, byval input as const any ptr, byval length as uinteger) as XXH_errorcode
declare function XXH3_128bits_digest(byval statePtr as const XXH3_state_t ptr) as XXH128_hash_t
declare function XXH128_isEqual(byval h1 as XXH128_hash_t, byval h2 as XXH128_hash_t) as long
declare function XXH128_cmp(byval h128_1 as const any ptr, byval h128_2 as const any ptr) as long

type XXH128_canonical_t
   digest(0 to sizeof(XXH128_hash_t) - 1) as ubyte
end type

declare sub XXH128_canonicalFromHash(byval dst as XXH128_canonical_t ptr, byval hash as XXH128_hash_t)
declare function XXH128_hashFromCanonical(byval src as const XXH128_canonical_t ptr) as XXH128_hash_t

end extern
#endif
