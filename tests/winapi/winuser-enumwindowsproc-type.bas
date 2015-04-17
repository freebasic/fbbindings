#include "windows.bi"

'' The ENUMWINDOWSPROC type is an alias for the WNDENUMPROC type.
'' It existed in fbc's old winapi headers, so we keep it for backwards-compatiblity,
'' but is not documented on MSDN and doesn't exist in MinGW-w64 or MS headers.
dim foo as ENUMWINDOWSPROC
