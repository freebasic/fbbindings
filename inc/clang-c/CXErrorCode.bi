#pragma once

#include once "clang-c/Platform.bi"

#define CLANG_C_CXERRORCODE_H

type CXErrorCode as long
enum
	CXError_Success = 0
	CXError_Failure = 1
	CXError_Crashed = 2
	CXError_InvalidArguments = 3
	CXError_ASTReadError = 4
end enum
