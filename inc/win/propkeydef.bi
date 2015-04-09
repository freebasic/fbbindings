'' FreeBASIC binding for mingw-w64-v3.3.0

#pragma once

#define REFPROPERTYKEY '' TODO: const PROPERTYKEY * __MIDL_CONST
#define IsEqualPropertyKey(a, b) (((a).pid = (b).pid) andalso IsEqualIID(@(a).fmtid, @(b).fmtid))
#define _PROPERTYKEY_EQUALITY_OPERATORS_
