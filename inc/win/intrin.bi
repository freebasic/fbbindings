#pragma once

#include once "crt/wchar.bi"
#include once "crtdefs.bi"
#include once "crt/setjmp.bi"
#include once "crt/stddef.bi"
#include once "crt/stdlib.bi"
#include once "crt/errno.bi"

'' The following symbols have been renamed:
''     #ifdef __FB_64BIT__
''         inside anonymous scopeblock:
''             variable var => var_
''         inside anonymous scopeblock:
''             variable var => var_
''     #endif
''     procedure inp => inp_
''     #define _rotl64 => _rotl64_
''     #define _rotr64 => _rotr64_

extern "C"

#define __INTRIN_H_
#define _INTRIN_MAC_
#define __buildstos(x, y, z) '' TODO: void x(y *Dest, y Data, size_t Count){ __asm__ __volatile__ ("rep stos{%z[Data]|" z "}" : "+D" (Dest), "+c" (Count) : [Data] "a" (Data) : "memory");}
#define __buildlogicali(x, y, o) '' TODO: y x(volatile y *Destination, y Value){ return __sync_fetch_and_ ## o(Destination, Value);}
#define __buildbittesti(x, y, z, a, b) '' TODO: unsigned char x(b y *Base, y Offset){ unsigned char old; __asm__ __volatile__ (z "%z[Base] {%[Offset],%[Base] | %[Base],%[Offset]} ; setc %[old]" : [old] "=qm" (old), [Base] "+m" (*Base) : [Offset] a "r" (Offset) : "memory", "cc"); return old;}
#define __buildpause() '' TODO: __asm__ __volatile__("rep nop")
#define __buildint(a) '' TODO: __asm__ __volatile__("int {$}" #a :)
#macro __buildmemorybarrier
	scope
		dim Barrier as ubyte
		__asm__
		'' TODO: __asm__ __volatile__("xchg{b %%| }al, %0" :"=m" (Barrier) : : "eax", "memory");
	end scope
#endmacro
#define __buildreadseg(x, y, z) '' TODO: y x(unsigned __LONG32 Offset) { y ret; __asm__ ("mov{%z[ret] %%" z ":%[offset], %[ret] | %[ret], %%" z ":%[offset]}" : [ret] "=r" (ret) : [offset] "m" ((*(y *) (size_t) Offset))); return ret;}
#define __buildwriteseg(x, y, z) '' TODO: void x(unsigned __LONG32 Offset, y Data) { __asm__ ("mov{%z[offset] %[Data], %%" z ":%[offset] | %%" z ":%[offset], %[Data]}" : [offset] "=m" ((*(y *) (size_t) Offset)) : [Data] "ri" (Data));}
#define __buildbitscan(x, y, z) '' TODO: unsigned char x(unsigned __LONG32 *Index, y Mask){ y n; __asm__ (z "{%z[Mask] %[Mask],%[Index] | %[Index],%[Mask]}" : [Index] "=r" (n) : [Mask] "r" (Mask) : "cc"); *Index = n; return Mask!=0;}
#define __buildbittest(x, y, a) '' TODO: unsigned char x(const y *Base, y Offset){ unsigned char old; __asm__ ("bt{%z[Base] %[Offset],%[Base] | %[Base],%[Offset]} ; setc %[old]" : [old] "=rm" (old) : [Offset] a "r" (Offset), [Base] "rm" (*Base) : "cc"); return old;}
#define __buildbittestand(x, y, z, a) '' TODO: unsigned char x(y *Base, y Offset){ unsigned char old; __asm__ (z "%z[Base] {%[Offset],%[Base] | %[Base],%[Offset]} ; setc %[old]" : [old] "=r" (old), [Base] "+rm" (*Base) : [Offset] a "r" (Offset) : "cc"); return old;}
#define __build_inport(x, y) '' TODO: y x(unsigned short Port) { y value; __asm__ __volatile__ ("in{%z0 %w1,%0| %0,%w1}" : "=a" (value) : "Nd" (Port)); return value; }
#define __build_outport(x, y) '' TODO: void x(unsigned short Port, y Data) { __asm__ __volatile__ ("out{%z0 %0,%w1| %w1,%0}" : : "a" (Data), "Nd" (Port)); }
#define __build_inportstring(x, y, z, a) '' TODO: void x(unsigned short Port, y *Buffer, unsigned __LONG32 Count) { __asm__ __volatile__ ("cld ; rep ins{" z "|" a "}" : "=D" (Buffer), "=c" (Count) : "d"(Port), "0"(Buffer), "1" (Count)); }
#define __build_outportstring(x, y, z, a) '' TODO: void x(unsigned short Port, y *Buffer, unsigned __LONG32 Count) { __asm__ __volatile__ ("cld ; rep outs{" z "|" a "}" : "=S" (Buffer), "=c" (Count) : "d"(Port), "0"(Buffer), "1" (Count)); }
#define __build_readcr(x, y, z) '' TODO: y x(void) { y value; __asm__ __volatile__ ("mov {%%cr" z ", %[value] | %[value], %%cr" z "}" : [value] "=q" (value)); return value; }
#define __build_writecr(x, y, z) '' TODO: void x(y Data) { __asm__ __volatile__ ("mov {%[Data], %%cr" z "|%%cr" z ", %[Data]}" : : [Data] "q" (Data) : "memory"); }
#define __buildmov(x, y, z) '' TODO: void x(y *Destination, y const *Source, size_t Count){ __asm__ __volatile__ ( "rep movs" z : "=D" (Destination), "=S" (Source), "=c" (Count) : "0" (Destination), "1" (Source), "2" (Count) : "memory");}
#define _ReadWriteBarrier() '' TODO: __asm__ __volatile__ ("" ::: "memory")
#define _ReadBarrier _ReadWriteBarrier
#define _WriteBarrier _ReadWriteBarrier

#ifdef __FB_64BIT__
	declare sub __faststorefence()

	#define __INTRINSIC_DEFINED___faststorefence

	declare sub __stosq(byval as ulongint ptr, byval as ulongint, byval as uinteger)

	#define __INTRINSIC_DEFINED___stosq

	declare function _interlockedbittestandset64(byval a as longint ptr, byval b as longint) as ubyte

	#define __INTRINSIC_DEFINED__interlockedbittestandset64

	declare function _interlockedbittestandreset64(byval a as longint ptr, byval b as longint) as ubyte

	#define __INTRINSIC_DEFINED__interlockedbittestandreset64

	declare function _interlockedbittestandcomplement64(byval a as longint ptr, byval b as longint) as ubyte

	#define __INTRINSIC_DEFINED__interlockedbittestandcomplement64

	declare function InterlockedBitTestAndSet64(byval a as longint ptr, byval b as longint) as ubyte

	#define __INTRINSIC_DEFINED_InterlockedBitTestAndSet64

	declare function InterlockedBitTestAndReset64(byval a as longint ptr, byval b as longint) as ubyte

	#define __INTRINSIC_DEFINED_InterlockedBitTestAndReset64

	declare function InterlockedBitTestAndComplement64(byval a as longint ptr, byval b as longint) as ubyte

	#define __INTRINSIC_DEFINED_InterlockedBitTestAndComplement64

	declare function _InterlockedAnd64(byval as longint ptr, byval as longint) as longint

	#define __INTRINSIC_DEFINED__InterlockedAnd64

	declare function _InterlockedOr64(byval as longint ptr, byval as longint) as longint

	#define __INTRINSIC_DEFINED__InterlockedOr64

	declare function _InterlockedXor64(byval as longint ptr, byval as longint) as longint

	#define __INTRINSIC_DEFINED__InterlockedXor64

	declare function _InterlockedIncrement64(byval Addend as longint ptr) as longint

	#define __INTRINSIC_DEFINED__InterlockedIncrement64

	declare function _InterlockedDecrement64(byval Addend as longint ptr) as longint

	#define __INTRINSIC_DEFINED__InterlockedDecrement64

	declare function _InterlockedExchange64(byval Target as longint ptr, byval Value as longint) as longint

	#define __INTRINSIC_DEFINED__InterlockedExchange64

	declare function _InterlockedExchangeAdd64(byval Addend as longint ptr, byval Value as longint) as longint

	#define __INTRINSIC_DEFINED__InterlockedExchangeAdd64

	declare function __readgsbyte(byval Offset as ulong) as ubyte

	#define __INTRINSIC_DEFINED___readgsbyte

	declare function __readgsword(byval Offset as ulong) as ushort

	#define __INTRINSIC_DEFINED___readgsword

	declare function __readgsdword(byval Offset as ulong) as ulong

	#define __INTRINSIC_DEFINED___readgsdword

	declare function __readgsqword(byval Offset as ulong) as ulongint

	#define __INTRINSIC_DEFINED___readgsqword

	declare sub __writegsbyte(byval Offset as ulong, byval Data_ as ubyte)

	#define __INTRINSIC_DEFINED___writegsbyte

	declare sub __writegsword(byval Offset as ulong, byval Data_ as ushort)

	#define __INTRINSIC_DEFINED___writegsword

	declare sub __writegsdword(byval Offset as ulong, byval Data_ as ulong)

	#define __INTRINSIC_DEFINED___writegsdword

	declare sub __writegsqword(byval Offset as ulong, byval Data_ as ulongint)

	#define __INTRINSIC_DEFINED___writegsqword

	declare function _BitScanForward64(byval Index as ulong ptr, byval Mask as ulongint) as ubyte

	#define __INTRINSIC_DEFINED__BitScanForward64

	declare function _BitScanReverse64(byval Index as ulong ptr, byval Mask as ulongint) as ubyte

	#define __INTRINSIC_DEFINED__BitScanReverse64

	declare function _bittest64(byval a as const longint ptr, byval b as longint) as ubyte

	#define __INTRINSIC_DEFINED__bittest64

	declare function _bittestandset64(byval a as longint ptr, byval b as longint) as ubyte

	#define __INTRINSIC_DEFINED__bittestandset64

	declare function _bittestandreset64(byval a as longint ptr, byval b as longint) as ubyte

	#define __INTRINSIC_DEFINED__bittestandreset64

	declare function _bittestandcomplement64(byval a as longint ptr, byval b as longint) as ubyte

	#define __INTRINSIC_DEFINED__bittestandcomplement64

	declare function __readcr0() as ulongint

	#define __INTRINSIC_DEFINED___readcr0

	declare function __readcr2() as ulongint

	#define __INTRINSIC_DEFINED___readcr2

	declare function __readcr3() as ulongint

	#define __INTRINSIC_DEFINED___readcr3

	declare function __readcr4() as ulongint

	#define __INTRINSIC_DEFINED___readcr4

	declare function __readcr8() as ulongint

	#define __INTRINSIC_DEFINED___readcr8

	declare sub __writecr0(byval as ulongint)

	#define __INTRINSIC_DEFINED___writecr0

	declare sub __writecr3(byval as ulongint)

	#define __INTRINSIC_DEFINED___writecr3

	declare sub __writecr4(byval as ulongint)

	#define __INTRINSIC_DEFINED___writecr4

	declare sub __writecr8(byval as ulongint)

	#define __INTRINSIC_DEFINED___writecr8

	declare sub __movsq(byval Dest as ulongint ptr, byval Source as const ulongint ptr, byval Count as uinteger)

	#define __INTRINSIC_DEFINED___movsq

	declare function _umul128(byval as ulongint, byval as ulongint, byval as ulongint ptr) as ulongint

	#define __INTRINSIC_DEFINED__umul128

	declare function _mul128(byval as longint, byval as longint, byval as longint ptr) as longint

	#define __INTRINSIC_DEFINED__mul128

	declare function __shiftleft128(byval LowPart as ulongint, byval HighPart as ulongint, byval Shift as ubyte) as ulongint

	#define __INTRINSIC_DEFINED___shiftleft128

	declare function __shiftright128(byval LowPart as ulongint, byval HighPart as ulongint, byval Shift as ubyte) as ulongint

	#define __INTRINSIC_DEFINED___shiftright128
#endif

declare sub __int2c()

#define __INTRINSIC_DEFINED___int2c

declare sub __stosb(byval as ubyte ptr, byval as ubyte, byval as uinteger)

#define __INTRINSIC_DEFINED___stosb

declare sub __stosw(byval as ushort ptr, byval as ushort, byval as uinteger)

#define __INTRINSIC_DEFINED___stosw

declare sub __stosd(byval as ulong ptr, byval as ulong, byval as uinteger)

#define __INTRINSIC_DEFINED___stosd

declare function _interlockedbittestandset(byval a as long ptr, byval b as long) as ubyte

#define __INTRINSIC_DEFINED__interlockedbittestandset

declare function _interlockedbittestandreset(byval a as long ptr, byval b as long) as ubyte

#define __INTRINSIC_DEFINED__interlockedbittestandreset

declare function _interlockedbittestandcomplement(byval a as long ptr, byval b as long) as ubyte

#define __INTRINSIC_DEFINED__interlockedbittestandcomplement

declare function InterlockedBitTestAndSet(byval a as long ptr, byval b as long) as ubyte

#define __INTRINSIC_DEFINED_InterlockedBitTestAndSet

declare function InterlockedBitTestAndReset(byval a as long ptr, byval b as long) as ubyte

#define __INTRINSIC_DEFINED_InterlockedBitTestAndReset

declare function InterlockedBitTestAndComplement(byval a as long ptr, byval b as long) as ubyte

#define __INTRINSIC_DEFINED_InterlockedBitTestAndComplement

declare function _InterlockedAnd(byval as long ptr, byval as long) as long

#define __INTRINSIC_DEFINED__InterlockedAnd

declare function _InterlockedOr(byval as long ptr, byval as long) as long

#define __INTRINSIC_DEFINED__InterlockedOr

declare function _InterlockedXor(byval as long ptr, byval as long) as long

#define __INTRINSIC_DEFINED__InterlockedXor

declare function _InterlockedIncrement16(byval Addend as short ptr) as short

#define __INTRINSIC_DEFINED__InterlockedIncrement16

declare function _InterlockedDecrement16(byval Addend as short ptr) as short

#define __INTRINSIC_DEFINED__InterlockedDecrement16

declare function _InterlockedCompareExchange16(byval Destination as short ptr, byval ExChange as short, byval Comperand as short) as short

#define __INTRINSIC_DEFINED__InterlockedCompareExchange16

declare function _InterlockedExchangeAdd(byval Addend as long ptr, byval Value as long) as long

#define __INTRINSIC_DEFINED__InterlockedExchangeAdd

declare function _InterlockedCompareExchange(byval Destination as long ptr, byval ExChange as long, byval Comperand as long) as long

#define __INTRINSIC_DEFINED__InterlockedCompareExchange

declare function _InterlockedIncrement(byval Addend as long ptr) as long

#define __INTRINSIC_DEFINED__InterlockedIncrement

declare function _InterlockedDecrement(byval Addend as long ptr) as long

#define __INTRINSIC_DEFINED__InterlockedDecrement

declare function _InterlockedExchange(byval Target as long ptr, byval Value as long) as long

#define __INTRINSIC_DEFINED__InterlockedExchange

declare function _InterlockedCompareExchange64(byval Destination as longint ptr, byval ExChange as longint, byval Comperand as longint) as longint

#define __INTRINSIC_DEFINED__InterlockedCompareExchange64

declare function _InterlockedCompareExchangePointer(byval Destination as any ptr ptr, byval ExChange as any ptr, byval Comperand as any ptr) as any ptr

#define __INTRINSIC_DEFINED__InterlockedCompareExchangePointer

declare function _InterlockedExchangePointer(byval Target as any ptr ptr, byval Value as any ptr) as any ptr

#define __INTRINSIC_DEFINED__InterlockedExchangePointer

declare function _BitScanForward(byval Index as ulong ptr, byval Mask as ulong) as ubyte

#define __INTRINSIC_DEFINED__BitScanForward

declare function _BitScanReverse(byval Index as ulong ptr, byval Mask as ulong) as ubyte

#define __INTRINSIC_DEFINED__BitScanReverse

declare function _bittest(byval a as const long ptr, byval b as long) as ubyte

#define __INTRINSIC_DEFINED__bittest

declare function _bittestandset(byval a as long ptr, byval b as long) as ubyte

#define __INTRINSIC_DEFINED__bittestandset

declare function _bittestandreset(byval a as long ptr, byval b as long) as ubyte

#define __INTRINSIC_DEFINED__bittestandreset

declare function _bittestandcomplement(byval a as long ptr, byval b as long) as ubyte

#define __INTRINSIC_DEFINED__bittestandcomplement

declare function __inbyte(byval Port as ushort) as ubyte

#define __INTRINSIC_DEFINED___inbyte

declare function __inword(byval Port as ushort) as ushort

#define __INTRINSIC_DEFINED___inword

declare function __indword(byval Port as ushort) as ulong

#define __INTRINSIC_DEFINED___indword

declare sub __outbyte(byval Port as ushort, byval Data_ as ubyte)

#define __INTRINSIC_DEFINED___outbyte

declare sub __outword(byval Port as ushort, byval Data_ as ushort)

#define __INTRINSIC_DEFINED___outword

declare sub __outdword(byval Port as ushort, byval Data_ as ulong)

#define __INTRINSIC_DEFINED___outdword

declare sub __inbytestring(byval Port as ushort, byval Buffer as ubyte ptr, byval Count as ulong)

#define __INTRINSIC_DEFINED___inbytestring

declare sub __inwordstring(byval Port as ushort, byval Buffer as ushort ptr, byval Count as ulong)

#define __INTRINSIC_DEFINED___inwordstring

declare sub __indwordstring(byval Port as ushort, byval Buffer as ulong ptr, byval Count as ulong)

#define __INTRINSIC_DEFINED___indwordstring

declare sub __outbytestring(byval Port as ushort, byval Buffer as ubyte ptr, byval Count as ulong)

#define __INTRINSIC_DEFINED___outbytestring

declare sub __outwordstring(byval Port as ushort, byval Buffer as ushort ptr, byval Count as ulong)

#define __INTRINSIC_DEFINED___outwordstring

declare sub __outdwordstring(byval Port as ushort, byval Buffer as ulong ptr, byval Count as ulong)

#define __INTRINSIC_DEFINED___outdwordstring

declare sub __cpuid(byval CPUInfo as long ptr, byval InfoType as long)

#define __INTRINSIC_DEFINED___cpuid

declare function __readmsr(byval as ulong) as ulongint

#define __INTRINSIC_DEFINED___readmsr

declare sub __writemsr(byval as ulong, byval as ulongint)

#define __INTRINSIC_DEFINED___writemsr

declare sub __movsb(byval Destination as ubyte ptr, byval Source as const ubyte ptr, byval Count as uinteger)

#define __INTRINSIC_DEFINED___movsb

declare sub __movsw(byval Dest as ushort ptr, byval Source as const ushort ptr, byval Count as uinteger)

#define __INTRINSIC_DEFINED___movsw

declare sub __movsd(byval Dest as ulong ptr, byval Source as const ulong ptr, byval Count as uinteger)

#define __INTRINSIC_DEFINED___movsd

#ifndef __FB_64BIT__
	declare function __readfsbyte(byval Offset as ulong) as ubyte

	#define __INTRINSIC_DEFINED___readfsbyte

	declare function __readfsword(byval Offset as ulong) as ushort

	#define __INTRINSIC_DEFINED___readfsword

	declare function __readfsdword(byval Offset as ulong) as ulong

	#define __INTRINSIC_DEFINED___readfsdword

	declare sub __writefsbyte(byval Offset as ulong, byval Data_ as ubyte)

	#define __INTRINSIC_DEFINED___writefsbyte

	declare sub __writefsword(byval Offset as ulong, byval Data_ as ushort)

	#define __INTRINSIC_DEFINED___writefsword

	declare sub __writefsdword(byval Offset as ulong, byval Data_ as ulong)

	#define __INTRINSIC_DEFINED___writefsdword

	declare function __readcr0() as ulong

	#define __INTRINSIC_DEFINED___readcr0

	declare function __readcr2() as ulong

	#define __INTRINSIC_DEFINED___readcr2

	declare function __readcr3() as ulong

	#define __INTRINSIC_DEFINED___readcr3

	declare function __readcr4() as ulong

	#define __INTRINSIC_DEFINED___readcr4

	declare function __readcr8() as ulong

	#define __INTRINSIC_DEFINED___readcr8

	declare sub __writecr0(byval as ulong)

	#define __INTRINSIC_DEFINED___writecr0

	declare sub __writecr3(byval as ulong)

	#define __INTRINSIC_DEFINED___writecr3

	declare sub __writecr4(byval as ulong)

	#define __INTRINSIC_DEFINED___writecr4

	declare sub __writecr8(byval as ulong)

	#define __INTRINSIC_DEFINED___writecr8
#endif

#define __MINGW_FORCE_SYS_INTRINS

declare function __builtin_ia32_crc32qi(byval as ulong, byval as ubyte) as ulong
declare function __builtin_ia32_crc32hi(byval as ulong, byval as ushort) as ulong
declare function __builtin_ia32_crc32si(byval as ulong, byval as ulong) as ulong

#define _MM_MALLOC_H_INCLUDED

#ifdef __FB_64BIT__
	#define __MACHINEX64 __MACHINE
#endif

#define __MACHINEI __MACHINE

#ifndef __FB_64BIT__
	#define __MACHINEIA32 __MACHINE
#endif

#define __MACHINEX86X __MACHINE

#ifndef __FB_64BIT__
	#define __MACHINEX86X_NOX64 __MACHINE
	#define __MACHINEX86X_NOIA64 __MACHINE
	#define __MACHINEX86X_NOWIN64 __MACHINE
#endif

#define __MACHINEIW64 __MACHINE

#ifdef __FB_64BIT__
	#define __MACHINEW64 __MACHINE
#endif

#define __MACHINE(X) '' TODO: X;
#define __MACHINEZ(X)

#ifdef __FB_64BIT__
	#define __MACHINEIA32 __MACHINEZ
#endif

#define __MACHINEIA64 __MACHINEZ

#ifdef __FB_64BIT__
	#define __MACHINEX86X_NOX64 __MACHINEZ
	#define __MACHINEX86X_NOIA64 __MACHINEZ
	#define __MACHINEX86X_NOWIN64 __MACHINEZ
#else
	#define __MACHINEW64 __MACHINEZ
#endif

#define __MACHINESA __MACHINEZ
#define __MACHINEARMX __MACHINEZ
#define __MACHINECC __MACHINEZ

#ifndef __FB_64BIT__
	#define __MACHINEX64 __MACHINEZ
#endif

#define __MACHINECE __MACHINEZ

#ifdef __FB_64BIT__
	declare function ceil(byval as double) as double
#endif

declare sub _disable()
declare function __emul(byval as long, byval as long) as longint
declare function __emulu(byval as ulong, byval as ulong) as ulongint
declare sub _enable()

#ifdef __FB_64BIT__
	declare function _InterlockedCompare64Exchange128(byval Destination as longint ptr, byval ExchangeHigh as longint, byval ExchangeLow as longint, byval Comparand as longint) as longint
	declare function _InterlockedCompare64Exchange128_acq(byval Destination as longint ptr, byval ExchangeHigh as longint, byval ExchangeLow as longint, byval Comparand as longint) as longint
	declare function _InterlockedCompare64Exchange128_rel(byval Destination as longint ptr, byval ExchangeHigh as longint, byval ExchangeLow as longint, byval Comparand as longint) as longint
#endif

declare function _InterlockedOr8(byval as zstring ptr, byval as byte) as byte
declare function _InterlockedOr16(byval as short ptr, byval as short) as short
declare function _InterlockedXor8(byval as zstring ptr, byval as byte) as byte
declare function _InterlockedXor16(byval as short ptr, byval as short) as short
declare function _InterlockedAnd8(byval as zstring ptr, byval as byte) as byte
declare function _InterlockedAnd16(byval as short ptr, byval as short) as short

#ifndef __FB_64BIT__
	declare function _InterlockedAddLargeStatistic(byval as longint ptr, byval as long) as long
#endif

declare function _inp(byval as ushort) as long
declare function inp_ alias "inp"(byval as ushort) as long
declare function _inpd(byval as ushort) as ulong
declare function inpd(byval as ushort) as ulong
declare function _inpw(byval as ushort) as ushort
declare function inpw(byval as ushort) as ushort
declare function __ll_lshift(byval as ulongint, byval as long) as ulongint
declare function __ll_rshift(byval as longint, byval as long) as longint
declare function _outp(byval as ushort, byval as long) as long
declare function outp(byval as ushort, byval as long) as long
declare function _outpd(byval as ushort, byval as ulong) as ulong
declare function outpd(byval as ushort, byval as ulong) as ulong
declare function _outpw(byval as ushort, byval as ushort) as ushort
declare function outpw(byval as ushort, byval as ushort) as ushort
declare function _ReturnAddress() as any ptr

#define _rotl64_ __rolq
#define _rotr64_ __rorq

'' TODO: int __attribute__((__cdecl__)) __attribute__ ((__nothrow__,__returns_twice__)) _setjmp(jmp_buf,void *);

#ifdef __FB_64BIT__
	'' TODO: int __attribute__((__cdecl__)) __attribute__ ((__nothrow__,__returns_twice__)) _setjmpex(jmp_buf,void *);
#endif

declare function _strset(byval as zstring ptr, byval as long) as zstring ptr
declare function strset(byval as zstring ptr, byval as long) as zstring ptr
declare function __ull_rshift(byval as ulongint, byval as long) as ulongint
declare function _AddressOfReturnAddress() as any ptr

#ifdef __FB_64BIT__
	declare function __mulh(byval as longint, byval as longint) as longint
	declare function __umulh(byval as ulongint, byval as ulongint) as ulongint
#endif

declare sub __wbinvd()
declare sub __invlpg(byval as any ptr)
declare function __getcallerseflags() as ulong

#ifdef __FB_64BIT__
	declare sub _mm_stream_si64x(byval as longint ptr, byval as longint)
#endif

declare function __readpmc(byval a as ulong) as ulongint
declare function __segmentlimit(byval a as ulong) as ulong
declare function _wcsset(byval as wstring ptr, byval as wchar_t) as wstring ptr
declare function _rotr8(byval value as ubyte, byval shift as ubyte) as ubyte
declare function _rotr16(byval value as ushort, byval shift as ubyte) as ushort
declare function _rotl8(byval value as ubyte, byval shift as ubyte) as ubyte
declare function _rotl16(byval value as ushort, byval shift as ubyte) as ushort
declare sub __nvreg_save_fence()
declare sub __nvreg_restore_fence()

#ifdef __FB_64BIT__
	declare function _InterlockedCompareExchange16_np(byval Destination as short ptr, byval Exchange as short, byval Comparand as short) as short
	declare function _InterlockedCompareExchange_np(byval as long ptr, byval as long, byval as long) as long
	declare function _InterlockedCompareExchange64_np(byval as longint ptr, byval as longint, byval as longint) as longint
	declare function _InterlockedCompareExchangePointer_np(byval as any ptr ptr, byval as any ptr, byval as any ptr) as any ptr
	declare function _InterlockedCompare64Exchange128_np(byval Destination as longint ptr, byval ExchangeHigh as longint, byval ExchangeLow as longint, byval Comparand as longint) as longint
	declare function _InterlockedCompare64Exchange128_acq_np(byval Destination as longint ptr, byval ExchangeHigh as longint, byval ExchangeLow as longint, byval Comparand as longint) as longint
	declare function _InterlockedCompare64Exchange128_rel_np(byval Destination as longint ptr, byval ExchangeHigh as longint, byval ExchangeLow as longint, byval Comparand as longint) as longint
	declare function _InterlockedAnd_np(byval as long ptr, byval as long) as long
	declare function _InterlockedAnd8_np(byval as zstring ptr, byval as byte) as byte
	declare function _InterlockedAnd16_np(byval as short ptr, byval as short) as short
	declare function _InterlockedAnd64_np(byval as longint ptr, byval as longint) as longint
	declare function _InterlockedOr_np(byval as long ptr, byval as long) as long
	declare function _InterlockedOr8_np(byval as zstring ptr, byval as byte) as byte
	declare function _InterlockedOr16_np(byval as short ptr, byval as short) as short
	declare function _InterlockedOr64_np(byval as longint ptr, byval as longint) as longint
	declare function _InterlockedXor_np(byval as long ptr, byval as long) as long
	declare function _InterlockedXor8_np(byval as zstring ptr, byval as byte) as byte
	declare function _InterlockedXor16_np(byval as short ptr, byval as short) as short
	declare function _InterlockedXor64_np(byval as longint ptr, byval as longint) as longint
#endif

end extern
