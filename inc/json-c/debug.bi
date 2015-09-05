'' FreeBASIC binding for json-c-0.12-20140410
''
'' based on the C header files:
''   $Id: debug.h,v 1.5 2006/01/30 23:07:57 mclark Exp $
''
''   Copyright (c) 2004, 2005 Metaparadigm Pte. Ltd.
''   Michael Clark <michael@metaparadigm.com>
''   Copyright (c) 2009 Hewlett-Packard Development Company, L.P.
''
''   This library is free software; you can redistribute it and/or modify
''   it under the terms of the MIT license. See COPYING for details.
''
''
'' translated to FreeBASIC by:
''   Copyright © 2015 FreeBASIC development team

#pragma once

#include once "crt/stdlib.bi"

extern "C"

#define _DEBUG_H_
declare sub mc_set_debug(byval debug as long)
declare function mc_get_debug() as long
declare sub mc_set_syslog(byval syslog as long)
declare sub mc_debug(byval msg as const zstring ptr, ...)
declare sub mc_error(byval msg as const zstring ptr, ...)
declare sub mc_info(byval msg as const zstring ptr, ...)
#define __STRING(x) #x
#macro JASSERT(cond)
	scope
	end scope
#endmacro
'' TODO: #define MC_ERROR(x, ...) mc_error(x, ##__VA_ARGS__)
'' TODO: #define MC_SET_DEBUG(x) if (0) mc_set_debug(x)
#define MC_GET_DEBUG() 0

'' TODO: #define MC_SET_SYSLOG(x) if (0) mc_set_syslog(x)
'' TODO: #define MC_DEBUG(x, ...) if (0) mc_debug(x, ##__VA_ARGS__)
'' TODO: #define MC_INFO(x, ...) if (0) mc_info(x, ##__VA_ARGS__)

end extern
