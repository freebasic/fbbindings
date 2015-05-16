'' Wrapper header to select libbfd API version
'' Copyright © 2015 FreeBASIC development team
''
'' This library is free software; you can redistribute it and/or
'' modify it under the terms of the GNU Lesser General Public
'' License as published by the Free Software Foundation; either
'' version 2.1 of the License, or (at your option) any later version.
''
'' This library is distributed in the hope that it will be useful,
'' but WITHOUT ANY WARRANTY; without even the implied warranty of
'' MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
'' Lesser General Public License for more details.
''
'' You should have received a copy of the GNU Lesser General Public
'' License along with this library; if not, write to the Free Software
'' Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

#pragma once

#ifdef __BFD_216__
#define __BFD_VER__ 216
#elseif defined(__BFD_217__)
#define __BFD_VER__ 217
#endif

#ifndef __BFD_VER__
#define __BFD_VER__ 217
#print bfd.bi: warning: defaulting to bfd 2.17 header: please define __BFD_VER__
#endif

'' #include bfd/bfd-${__BFD_VER__}.bi

#define __bfd_bi__stringify(s) #s
#define __bfd_bi__makeBiName(ver) __bfd_bi__stringify(bfd/bfd-ver.bi)

#include __bfd_bi__makeBiName(__BFD_VER__)

#undef __bfd_bi__stringify
#undef __bfd_bi__makeBiName
