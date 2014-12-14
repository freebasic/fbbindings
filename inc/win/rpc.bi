#pragma once

#include once "_mingw.bi"
#include once "windows.bi"
#include once "basetsd.bi"
#include once "rpcdce.bi"
#include once "rpcnsi.bi"
#include once "rpcnterr.bi"
#include once "rpcasync.bi"

'' The following symbols have been renamed:
''     #define midl_user_allocate => midl_user_allocate_
''     #define midl_user_free => midl_user_free_

#define __RPC_H__

#ifdef __FB_64BIT__
	#define __RPC_WIN64__

	type I_RPC_HANDLE as any ptr
#else
	#define __RPC_WIN32__
#endif

#define __MIDL_USER_DEFINED
#define midl_user_allocate_ MIDL_user_allocate
#define midl_user_free_ MIDL_user_free

#ifndef __FB_64BIT__
	type I_RPC_HANDLE as any ptr
#endif

type RPC_STATUS as long

#define RPC_UNICODE_SUPPORTED
#define RpcTryExcept '' TODO: __try {
#define RpcExcept(expr) '' TODO: } __except(expr) {
#define RpcEndExcept '' TODO: }
#define RpcTryFinally '' TODO: __try {
#define RpcFinally '' TODO: } __finally {
#define RpcEndFinally '' TODO: }
#define RpcExceptionCode() GetExceptionCode()
#define RpcAbnormalTermination() AbnormalTermination()
