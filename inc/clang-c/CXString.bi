#pragma once

extern "C"

#define CLANG_CXSTRING_H

type CXString
	data as const any ptr
	private_flags as ulong
end type

declare function clang_getCString(byval string_ as CXString) as const zstring ptr
declare sub clang_disposeString(byval string_ as CXString)

end extern
