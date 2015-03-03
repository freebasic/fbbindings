#pragma once

#include once "_mingw.bi"
#include once "windows.bi"
#include once "basetsd.bi"
#include once "rpcdce.bi"
#include once "rpcnsi.bi"
#include once "rpcnterr.bi"
#include once "excpt.bi"
#include once "winerror.bi"
#include once "rpcasync.bi"

#define __RPC_H__

#ifdef __FB_64BIT__
	#define __RPC_WIN64__
#else
	#define __RPC_WIN32__
#endif

#define __MIDL_USER_DEFINED
#define midl_user_allocate MIDL_user_allocate
#define midl_user_free MIDL_user_free

type I_RPC_HANDLE as any ptr
type RPC_STATUS as long

#define RPC_UNICODE_SUPPORTED
#define RpcExceptionCode() GetExceptionCode()
#define RpcAbnormalTermination() AbnormalTermination()
