'' FreeBASIC binding for mingw-w64-v4.0.1

#pragma once

'' TODO: #define REFPROPERTYKEY const PROPERTYKEY * __MIDL_CONST
#define IsEqualPropertyKey(a, b) (((a).pid = (b).pid) andalso IsEqualIID(@(a).fmtid, @(b).fmtid))
#define _PROPERTYKEY_EQUALITY_OPERATORS_
