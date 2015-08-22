'' FreeBASIC binding for linux-4.1.6
''
'' based on the C header files:
''       This program is free software; you can redistribute it and/or modify
''       it under the terms of the GNU General Public License as published by
''       the Free Software Foundation; either version 2 of the License, or
''       (at your option) any later version.
''
''       This program is distributed in the hope that it will be useful,
''       but WITHOUT ANY WARRANTY; without even the implied warranty of
''       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
''       GNU General Public License for more details.
''
''       You should have received a copy of the GNU General Public License
''       along with this program; if not, write to the Free Software
''       Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
''
'' translated to FreeBASIC by:
''   Copyright © 2015 FreeBASIC development team

#pragma once

#ifndef __FB_64BIT__
	#include once "crt/long.bi"
#endif

#ifndef __FB_ARM__
	const FP_XSTATE_MAGIC1 = &h46505853u
	const FP_XSTATE_MAGIC2 = &h46505845u
	#define FP_XSTATE_MAGIC2_SIZE sizeof(FP_XSTATE_MAGIC2)

	type _fpx_sw_bytes
		magic1 as __u32
		extended_size as __u32
		xstate_bv as __u64
		xstate_size as __u32
		padding(0 to 6) as __u32
	end type
#endif

#if (not defined(__FB_64BIT__)) and (not defined(__FB_ARM__))
	type _fpreg
		significand(0 to 3) as ushort
		exponent as ushort
	end type

	type _fpxreg
		significand(0 to 3) as ushort
		exponent as ushort
		padding(0 to 2) as ushort
	end type

	type _xmmreg
		element(0 to 3) as culong
	end type
#endif

#ifndef __FB_ARM__
	type _fpstate
		#if (not defined(__FB_64BIT__)) and (not defined(__FB_ARM__))
			cw as culong
			sw as culong
			tag as culong
			ipoff as culong
			cssel as culong
			dataoff as culong
			datasel as culong
			_st(0 to 7) as _fpreg
			status as ushort
			magic as ushort
			_fxsr_env(0 to 5) as culong
			mxcsr as culong
			reserved as culong
			_fxsr_st(0 to 7) as _fpxreg
			_xmm(0 to 7) as _xmmreg
			padding1(0 to 43) as culong
		#elseif defined(__FB_64BIT__) and (not defined(__FB_ARM__))
			cwd as __u16
			swd as __u16
			twd as __u16
			fop as __u16
			rip as __u64
			rdp as __u64
			mxcsr as __u32
			mxcsr_mask as __u32
			st_space(0 to 31) as __u32
			xmm_space(0 to 63) as __u32
			reserved2(0 to 11) as __u32
		#endif

		union
			#if (not defined(__FB_64BIT__)) and (not defined(__FB_ARM__))
				padding2(0 to 11) as culong
			#elseif defined(__FB_64BIT__) and (not defined(__FB_ARM__))
				reserved3(0 to 11) as __u32
			#endif

			sw_reserved as _fpx_sw_bytes
		end union
	end type
#endif

#if (not defined(__FB_64BIT__)) and (not defined(__FB_ARM__))
	const X86_FXSR_MAGIC = &h0000
#endif

type sigcontext
	#if (not defined(__FB_64BIT__)) and (not defined(__FB_ARM__))
		gs as ushort
		__gsh as ushort
		fs as ushort
		__fsh as ushort
		es as ushort
		__esh as ushort
		ds as ushort
		__dsh as ushort
		edi as culong
		esi as culong
		ebp as culong
		esp as culong
		ebx as culong
		edx as culong
		ecx as culong
		eax as culong
		trapno as culong
		err as culong
		eip as culong
		cs as ushort
		__csh as ushort
		eflags as culong
		esp_at_signal as culong
		ss as ushort
		__ssh as ushort
	#elseif defined(__FB_64BIT__) and (not defined(__FB_ARM__))
		r8 as __u64
		r9 as __u64
		r10 as __u64
		r11 as __u64
		r12 as __u64
		r13 as __u64
		r14 as __u64
		r15 as __u64
		rdi as __u64
		rsi as __u64
		rbp as __u64
		rbx as __u64
		rdx as __u64
		rax as __u64
		rcx as __u64
		rsp as __u64
		rip as __u64
		eflags as __u64
		cs as __u16
		__pad2 as __u16
		__pad1 as __u16
		ss as __u16
		err as __u64
		trapno as __u64
		oldmask as __u64
		cr2 as __u64
	#endif

	#ifndef __FB_ARM__
		'' TODO: struct _fpstate __user *fpstate;
	#elseif (not defined(__FB_64BIT__)) and defined(__FB_ARM__)
		trap_no as culong
		error_code as culong
	#endif

	#ifndef __FB_64BIT__
		oldmask as culong
	#endif

	#if (not defined(__FB_64BIT__)) and (not defined(__FB_ARM__))
		cr2 as culong
	#elseif defined(__FB_64BIT__) and (not defined(__FB_ARM__))
		reserved1(0 to 7) as __u64
	#elseif (not defined(__FB_64BIT__)) and defined(__FB_ARM__)
		arm_r0 as culong
		arm_r1 as culong
		arm_r2 as culong
		arm_r3 as culong
		arm_r4 as culong
		arm_r5 as culong
		arm_r6 as culong
		arm_r7 as culong
		arm_r8 as culong
		arm_r9 as culong
		arm_r10 as culong
		arm_fp as culong
		arm_ip as culong
		arm_sp as culong
		arm_lr as culong
		arm_pc as culong
		arm_cpsr as culong
		fault_address as culong
	#else
		fault_address as __u64
		regs(0 to 30) as __u64
		sp as __u64
		pc as __u64
		pstate as __u64
		__reserved(0 to 4095) as __u8
	#endif
end type

#ifndef __FB_ARM__
	type _xsave_hdr
		xstate_bv as __u64
		reserved1(0 to 1) as __u64
		reserved2(0 to 4) as __u64
	end type

	type _ymmh_state
		ymmh_space(0 to 63) as __u32
	end type

	type _xstate
		fpstate as _fpstate
		xstate_hdr as _xsave_hdr
		ymmh as _ymmh_state
	end type
#elseif defined(__FB_64BIT__) and defined(__FB_ARM__)
	type _aarch64_ctx
		magic as __u32
		size as __u32
	end type

	const FPSIMD_MAGIC = &h46508001

	type fpsimd_context
		head as _aarch64_ctx
		fpsr as __u32
		fpcr as __u32
		vregs(0 to 31) as __uint128_t
	end type

	const ESR_MAGIC = &h45535201

	type esr_context
		head as _aarch64_ctx
		esr as __u64
	end type
#endif
