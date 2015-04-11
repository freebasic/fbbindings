'' FreeBASIC binding for mingw-w64-v4.0.1

#pragma once

extern "C"

#define _INTRIN_MAC_
#define __INTRINSIC_SPECIAL___faststorefence
#define __INTRINSIC_SPECIAL___int2c
#define __INTRINSIC_SPECIAL___stosb
#define __INTRINSIC_SPECIAL___stosd
#define __INTRINSIC_SPECIAL___stosq
#define __INTRINSIC_SPECIAL___stosw
#define __INTRINSIC_SPECIAL__InterlockedAnd
#define __INTRINSIC_SPECIAL__interlockedbittestandcomplement
#define __INTRINSIC_SPECIAL__interlockedbittestandcomplement64
#define __INTRINSIC_SPECIAL__interlockedbittestandreset
#define __INTRINSIC_SPECIAL__interlockedbittestandreset64
#define __INTRINSIC_SPECIAL__interlockedbittestandset
#define __INTRINSIC_SPECIAL__interlockedbittestandset64
#define __INTRINSIC_SPECIAL__InterlockedOr
#define __INTRINSIC_SPECIAL__InterlockedXor
#define __INTRINSIC_SPECIAL_InterlockedBitTestAndComplement
#define __INTRINSIC_SPECIAL_InterlockedBitTestAndComplement64
#define __INTRINSIC_SPECIAL_InterlockedBitTestAndReset
#define __INTRINSIC_SPECIAL_InterlockedBitTestAndReset64
#define __INTRINSIC_SPECIAL_InterlockedBitTestAndSet
#define __INTRINSIC_SPECIAL_InterlockedBitTestAndSet64
#define __INTRINSIC_SPECIAL__InterlockedIncrement16
#define __INTRINSIC_SPECIAL__InterlockedDecrement16
#define __INTRINSIC_SPECIAL__InterlockedCompareExchange16
#define __INTRINSIC_SPECIAL___readgsbyte
#define __INTRINSIC_SPECIAL___readgsword
#define __INTRINSIC_SPECIAL___readgsdword
#define __INTRINSIC_SPECIAL___readgsqword
#define __INTRINSIC_SPECIAL___writegsbyte
#define __INTRINSIC_SPECIAL___writegsword
#define __INTRINSIC_SPECIAL___writegsdword
#define __INTRINSIC_SPECIAL___writegsqword
#define __INTRINSIC_SPECIAL___readfsbyte
#define __INTRINSIC_SPECIAL___readfsword
#define __INTRINSIC_SPECIAL___readfsdword
#define __INTRINSIC_SPECIAL___writefsbyte
#define __INTRINSIC_SPECIAL___writefsword
#define __INTRINSIC_SPECIAL___writefsdword
#define __INTRINSIC_SPECIAL__BitScanForward
#define __INTRINSIC_SPECIAL__BitScanForward64
#define __INTRINSIC_SPECIAL__BitScanReverse
#define __INTRINSIC_SPECIAL__BitScanReverse64
#define __INTRINSIC_SPECIAL__bittest
#define __INTRINSIC_SPECIAL__bittestandset
#define __INTRINSIC_SPECIAL__bittestandreset
#define __INTRINSIC_SPECIAL__bittestandcomplement
#define __INTRINSIC_SPECIAL__bittest64
#define __INTRINSIC_SPECIAL__bittestandset64
#define __INTRINSIC_SPECIAL__bittestandreset64
#define __INTRINSIC_SPECIAL__bittestandcomplement64
#define __INTRINSIC_SPECIAL___movsb
#define __INTRINSIC_SPECIAL___movsw
#define __INTRINSIC_SPECIAL___movsd
#define __INTRINSIC_SPECIAL___movsq

#ifdef __FB_64BIT__
	declare sub __faststorefence()
	declare sub __faststorefence()
	#define __INTRINSIC_DEFINED___faststorefence
	declare sub __stosq(byval as ulongint ptr, byval as ulongint, byval as uinteger)
	declare sub __stosq(byval Dest as ulongint ptr, byval Data as ulongint, byval Count as uinteger)
	#define __INTRINSIC_DEFINED___stosq
	declare function _interlockedbittestandset64(byval a as longint ptr, byval b as longint) as ubyte
	declare function _interlockedbittestandset64(byval Base as longint ptr, byval Offset as longint) as ubyte
	#define __INTRINSIC_DEFINED__interlockedbittestandset64
	declare function _interlockedbittestandreset64(byval a as longint ptr, byval b as longint) as ubyte
	declare function _interlockedbittestandreset64(byval Base as longint ptr, byval Offset as longint) as ubyte
	#define __INTRINSIC_DEFINED__interlockedbittestandreset64
	declare function _interlockedbittestandcomplement64(byval a as longint ptr, byval b as longint) as ubyte
	declare function _interlockedbittestandcomplement64(byval Base as longint ptr, byval Offset as longint) as ubyte
	#define __INTRINSIC_DEFINED__interlockedbittestandcomplement64
	declare function InterlockedBitTestAndSet64(byval a as longint ptr, byval b as longint) as ubyte
	declare function InterlockedBitTestAndSet64(byval Base as longint ptr, byval Offset as longint) as ubyte
	#define __INTRINSIC_DEFINED_InterlockedBitTestAndSet64
	declare function InterlockedBitTestAndReset64(byval a as longint ptr, byval b as longint) as ubyte
	declare function InterlockedBitTestAndReset64(byval Base as longint ptr, byval Offset as longint) as ubyte
	#define __INTRINSIC_DEFINED_InterlockedBitTestAndReset64
	declare function InterlockedBitTestAndComplement64(byval a as longint ptr, byval b as longint) as ubyte
	declare function InterlockedBitTestAndComplement64(byval Base as longint ptr, byval Offset as longint) as ubyte
	#define __INTRINSIC_DEFINED_InterlockedBitTestAndComplement64
	declare function _InterlockedAnd64(byval as longint ptr, byval as longint) as longint
	declare function _InterlockedAnd64(byval Destination as longint ptr, byval Value as longint) as longint
	#define __INTRINSIC_DEFINED__InterlockedAnd64
	declare function _InterlockedOr64(byval as longint ptr, byval as longint) as longint
	declare function _InterlockedOr64(byval Destination as longint ptr, byval Value as longint) as longint
	#define __INTRINSIC_DEFINED__InterlockedOr64
	declare function _InterlockedXor64(byval as longint ptr, byval as longint) as longint
	declare function _InterlockedXor64(byval Destination as longint ptr, byval Value as longint) as longint
	#define __INTRINSIC_DEFINED__InterlockedXor64
	declare function _InterlockedIncrement64(byval Addend as longint ptr) as longint
	declare function _InterlockedIncrement64(byval Addend as longint ptr) as longint
	#define __INTRINSIC_DEFINED__InterlockedIncrement64
	declare function _InterlockedDecrement64(byval Addend as longint ptr) as longint
	declare function _InterlockedDecrement64(byval Addend as longint ptr) as longint
	#define __INTRINSIC_DEFINED__InterlockedDecrement64
	declare function _InterlockedExchange64(byval Target as longint ptr, byval Value as longint) as longint
	declare function _InterlockedExchange64(byval Target as longint ptr, byval Value as longint) as longint
	#define __INTRINSIC_DEFINED__InterlockedExchange64
	declare function _InterlockedExchangeAdd64(byval Addend as longint ptr, byval Value as longint) as longint
	declare function _InterlockedExchangeAdd64(byval Addend as longint ptr, byval Value as longint) as longint
	#define __INTRINSIC_DEFINED__InterlockedExchangeAdd64
	declare function __readgsbyte(byval Offset as ulong) as ubyte
	declare function __readgsbyte(byval Offset as ulong) as ubyte
	#define __INTRINSIC_DEFINED___readgsbyte
	declare function __readgsword(byval Offset as ulong) as ushort
	declare function __readgsword(byval Offset as ulong) as ushort
	#define __INTRINSIC_DEFINED___readgsword
	declare function __readgsdword(byval Offset as ulong) as ulong
	declare function __readgsdword(byval Offset as ulong) as ulong
	#define __INTRINSIC_DEFINED___readgsdword
	declare function __readgsqword(byval Offset as ulong) as ulongint
	declare function __readgsqword(byval Offset as ulong) as ulongint
	#define __INTRINSIC_DEFINED___readgsqword
	declare sub __writegsbyte(byval Offset as ulong, byval Data as ubyte)
	declare sub __writegsbyte(byval Offset as ulong, byval Data as ubyte)
	#define __INTRINSIC_DEFINED___writegsbyte
	declare sub __writegsword(byval Offset as ulong, byval Data as ushort)
	declare sub __writegsword(byval Offset as ulong, byval Data as ushort)
	#define __INTRINSIC_DEFINED___writegsword
	declare sub __writegsdword(byval Offset as ulong, byval Data as ulong)
	declare sub __writegsdword(byval Offset as ulong, byval Data as ulong)
	#define __INTRINSIC_DEFINED___writegsdword
	declare sub __writegsqword(byval Offset as ulong, byval Data as ulongint)
	declare sub __writegsqword(byval Offset as ulong, byval Data as ulongint)
	#define __INTRINSIC_DEFINED___writegsqword
	declare function _BitScanForward64(byval Index as ulong ptr, byval Mask as ulongint) as ubyte
	declare function _BitScanForward64(byval Index as ulong ptr, byval Mask as ulongint) as ubyte
	#define __INTRINSIC_DEFINED__BitScanForward64
	declare function _BitScanReverse64(byval Index as ulong ptr, byval Mask as ulongint) as ubyte
	declare function _BitScanReverse64(byval Index as ulong ptr, byval Mask as ulongint) as ubyte
	#define __INTRINSIC_DEFINED__BitScanReverse64
	declare function _bittest64(byval a as const longint ptr, byval b as longint) as ubyte
	declare function _bittest64(byval Base as const longint ptr, byval Offset as longint) as ubyte
	#define __INTRINSIC_DEFINED__bittest64
	declare function _bittestandset64(byval a as longint ptr, byval b as longint) as ubyte
	declare function _bittestandset64(byval Base as longint ptr, byval Offset as longint) as ubyte
	#define __INTRINSIC_DEFINED__bittestandset64
	declare function _bittestandreset64(byval a as longint ptr, byval b as longint) as ubyte
	declare function _bittestandreset64(byval Base as longint ptr, byval Offset as longint) as ubyte
	#define __INTRINSIC_DEFINED__bittestandreset64
	declare function _bittestandcomplement64(byval a as longint ptr, byval b as longint) as ubyte
	declare function _bittestandcomplement64(byval Base as longint ptr, byval Offset as longint) as ubyte
	#define __INTRINSIC_DEFINED__bittestandcomplement64
	declare sub __movsq(byval Dest as ulongint ptr, byval Source as const ulongint ptr, byval Count as uinteger)
	declare sub __movsq(byval Destination as ulongint ptr, byval Source as const ulongint ptr, byval Count as uinteger)
	#define __INTRINSIC_DEFINED___movsq
#endif

declare function _InterlockedAnd(byval as long ptr, byval as long) as long
declare function _InterlockedAnd(byval Destination as long ptr, byval Value as long) as long
#define __INTRINSIC_DEFINED__InterlockedAnd
declare function _InterlockedOr(byval as long ptr, byval as long) as long
declare function _InterlockedOr(byval Destination as long ptr, byval Value as long) as long
#define __INTRINSIC_DEFINED__InterlockedOr
declare function _InterlockedXor(byval as long ptr, byval as long) as long
declare function _InterlockedXor(byval Destination as long ptr, byval Value as long) as long
#define __INTRINSIC_DEFINED__InterlockedXor
declare function _InterlockedIncrement16(byval Addend as short ptr) as short
declare function _InterlockedIncrement16(byval Addend as short ptr) as short
#define __INTRINSIC_DEFINED__InterlockedIncrement16
declare function _InterlockedDecrement16(byval Addend as short ptr) as short
declare function _InterlockedDecrement16(byval Addend as short ptr) as short
#define __INTRINSIC_DEFINED__InterlockedDecrement16
declare function _InterlockedCompareExchange16(byval Destination as short ptr, byval ExChange as short, byval Comperand as short) as short
declare function _InterlockedCompareExchange16(byval Destination as short ptr, byval ExChange as short, byval Comperand as short) as short
#define __INTRINSIC_DEFINED__InterlockedCompareExchange16
declare function _InterlockedExchangeAdd(byval Addend as long ptr, byval Value as long) as long
declare function _InterlockedExchangeAdd(byval Addend as long ptr, byval Value as long) as long
#define __INTRINSIC_DEFINED__InterlockedExchangeAdd
declare function _InterlockedCompareExchange(byval Destination as long ptr, byval ExChange as long, byval Comperand as long) as long
declare function _InterlockedCompareExchange(byval Destination as long ptr, byval ExChange as long, byval Comperand as long) as long
#define __INTRINSIC_DEFINED__InterlockedCompareExchange
declare function _InterlockedIncrement(byval Addend as long ptr) as long
declare function _InterlockedIncrement(byval Addend as long ptr) as long
#define __INTRINSIC_DEFINED__InterlockedIncrement
declare function _InterlockedDecrement(byval Addend as long ptr) as long
declare function _InterlockedDecrement(byval Addend as long ptr) as long
#define __INTRINSIC_DEFINED__InterlockedDecrement
declare function _InterlockedExchange(byval Target as long ptr, byval Value as long) as long
declare function _InterlockedExchange(byval Target as long ptr, byval Value as long) as long
#define __INTRINSIC_DEFINED__InterlockedExchange
declare function _InterlockedCompareExchange64(byval Destination as longint ptr, byval ExChange as longint, byval Comperand as longint) as longint
declare function _InterlockedCompareExchange64(byval Destination as longint ptr, byval ExChange as longint, byval Comperand as longint) as longint
#define __INTRINSIC_DEFINED__InterlockedCompareExchange64
declare function _InterlockedCompareExchangePointer(byval Destination as any ptr ptr, byval ExChange as any ptr, byval Comperand as any ptr) as any ptr
declare function _InterlockedCompareExchangePointer(byval Destination as any ptr ptr, byval ExChange as any ptr, byval Comperand as any ptr) as any ptr
#define __INTRINSIC_DEFINED__InterlockedCompareExchangePointer
declare function _InterlockedExchangePointer(byval Target as any ptr ptr, byval Value as any ptr) as any ptr
declare function _InterlockedExchangePointer(byval Target as any ptr ptr, byval Value as any ptr) as any ptr
#define __INTRINSIC_DEFINED__InterlockedExchangePointer
declare sub __int2c()
declare sub __int2c()
#define __INTRINSIC_DEFINED___int2c
declare sub __stosb(byval as ubyte ptr, byval as ubyte, byval as uinteger)
declare sub __stosb(byval Dest as ubyte ptr, byval Data as ubyte, byval Count as uinteger)
#define __INTRINSIC_DEFINED___stosb
declare sub __stosw(byval as ushort ptr, byval as ushort, byval as uinteger)
declare sub __stosw(byval Dest as ushort ptr, byval Data as ushort, byval Count as uinteger)
#define __INTRINSIC_DEFINED___stosw
declare sub __stosd(byval as ulong ptr, byval as ulong, byval as uinteger)
declare sub __stosd(byval Dest as ulong ptr, byval Data as ulong, byval Count as uinteger)
#define __INTRINSIC_DEFINED___stosd
declare function _interlockedbittestandset(byval a as long ptr, byval b as long) as ubyte
declare function _interlockedbittestandset(byval Base as long ptr, byval Offset as long) as ubyte
#define __INTRINSIC_DEFINED__interlockedbittestandset
declare function _interlockedbittestandreset(byval a as long ptr, byval b as long) as ubyte
declare function _interlockedbittestandreset(byval Base as long ptr, byval Offset as long) as ubyte
#define __INTRINSIC_DEFINED__interlockedbittestandreset
declare function _interlockedbittestandcomplement(byval a as long ptr, byval b as long) as ubyte
declare function _interlockedbittestandcomplement(byval Base as long ptr, byval Offset as long) as ubyte
#define __INTRINSIC_DEFINED__interlockedbittestandcomplement
declare function InterlockedBitTestAndSet(byval a as long ptr, byval b as long) as ubyte
declare function InterlockedBitTestAndSet(byval Base as long ptr, byval Offset as long) as ubyte
#define __INTRINSIC_DEFINED_InterlockedBitTestAndSet
declare function InterlockedBitTestAndReset(byval a as long ptr, byval b as long) as ubyte
declare function InterlockedBitTestAndReset(byval Base as long ptr, byval Offset as long) as ubyte
#define __INTRINSIC_DEFINED_InterlockedBitTestAndReset
declare function InterlockedBitTestAndComplement(byval a as long ptr, byval b as long) as ubyte
declare function InterlockedBitTestAndComplement(byval Base as long ptr, byval Offset as long) as ubyte
#define __INTRINSIC_DEFINED_InterlockedBitTestAndComplement
declare function _BitScanForward(byval Index as ulong ptr, byval Mask as ulong) as ubyte
declare function _BitScanForward(byval Index as ulong ptr, byval Mask as ulong) as ubyte
#define __INTRINSIC_DEFINED__BitScanForward
declare function _BitScanReverse(byval Index as ulong ptr, byval Mask as ulong) as ubyte
declare function _BitScanReverse(byval Index as ulong ptr, byval Mask as ulong) as ubyte
#define __INTRINSIC_DEFINED__BitScanReverse
declare function _bittest(byval a as const long ptr, byval b as long) as ubyte
declare function _bittest(byval Base as const long ptr, byval Offset as long) as ubyte
#define __INTRINSIC_DEFINED__bittest
declare function _bittestandset(byval a as long ptr, byval b as long) as ubyte
declare function _bittestandset(byval Base as long ptr, byval Offset as long) as ubyte
#define __INTRINSIC_DEFINED__bittestandset
declare function _bittestandreset(byval a as long ptr, byval b as long) as ubyte
declare function _bittestandreset(byval Base as long ptr, byval Offset as long) as ubyte
#define __INTRINSIC_DEFINED__bittestandreset
declare function _bittestandcomplement(byval a as long ptr, byval b as long) as ubyte
declare function _bittestandcomplement(byval Base as long ptr, byval Offset as long) as ubyte
#define __INTRINSIC_DEFINED__bittestandcomplement
declare sub __movsb(byval Destination as ubyte ptr, byval Source as const ubyte ptr, byval Count as uinteger)
declare sub __movsb(byval Destination as ubyte ptr, byval Source as const ubyte ptr, byval Count as uinteger)
#define __INTRINSIC_DEFINED___movsb
declare sub __movsw(byval Dest as ushort ptr, byval Source as const ushort ptr, byval Count as uinteger)
declare sub __movsw(byval Destination as ushort ptr, byval Source as const ushort ptr, byval Count as uinteger)
#define __INTRINSIC_DEFINED___movsw
declare sub __movsd(byval Dest as ulong ptr, byval Source as const ulong ptr, byval Count as uinteger)
declare sub __movsd(byval Destination as ulong ptr, byval Source as const ulong ptr, byval Count as uinteger)
#define __INTRINSIC_DEFINED___movsd

#ifndef __FB_64BIT__
	declare function __readfsbyte(byval Offset as ulong) as ubyte
	declare function __readfsbyte(byval Offset as ulong) as ubyte
	#define __INTRINSIC_DEFINED___readfsbyte
	declare function __readfsword(byval Offset as ulong) as ushort
	declare function __readfsword(byval Offset as ulong) as ushort
	#define __INTRINSIC_DEFINED___readfsword
	declare function __readfsdword(byval Offset as ulong) as ulong
	declare function __readfsdword(byval Offset as ulong) as ulong
	#define __INTRINSIC_DEFINED___readfsdword
	declare sub __writefsbyte(byval Offset as ulong, byval Data as ubyte)
	declare sub __writefsbyte(byval Offset as ulong, byval Data as ubyte)
	#define __INTRINSIC_DEFINED___writefsbyte
	declare sub __writefsword(byval Offset as ulong, byval Data as ushort)
	declare sub __writefsword(byval Offset as ulong, byval Data as ushort)
	#define __INTRINSIC_DEFINED___writefsword
	declare sub __writefsdword(byval Offset as ulong, byval Data as ulong)
	declare sub __writefsdword(byval Offset as ulong, byval Data as ulong)
	#define __INTRINSIC_DEFINED___writefsdword
#endif

#define __INTRINSIC_SPECIAL__InterlockedIncrement
#define __INTRINSIC_SPECIAL__InterlockedDecrement
#define __INTRINSIC_SPECIAL__InterlockedExchange
#define __INTRINSIC_SPECIAL__InterlockedExchangeAdd
#define __INTRINSIC_SPECIAL__InterlockedCompareExchange
#define __INTRINSIC_SPECIAL__InterlockedCompareExchangePointer
#define __INTRINSIC_SPECIAL__InterlockedExchangePointer
#define __INTRINSIC_SPECIAL__InterlockedAnd64
#define __INTRINSIC_SPECIAL__InterlockedOr64
#define __INTRINSIC_SPECIAL__InterlockedXor64
#define __INTRINSIC_SPECIAL__InterlockedIncrement64
#define __INTRINSIC_SPECIAL__InterlockedDecrement64
#define __INTRINSIC_SPECIAL__InterlockedExchange64
#define __INTRINSIC_SPECIAL__InterlockedExchangeAdd64
#define __INTRINSIC_SPECIAL__InterlockedCompareExchange64

end extern
