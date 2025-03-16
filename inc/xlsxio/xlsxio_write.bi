'' FreeBASIC binding for XLSX I/O - 0.2.35
''
'' based on the C header files:
''   XLSX I/O - C library for reading and writing .xlsx files by brechtsanders
''XLSX I/O is released under the terms of the MIT License (MIT), see LICENSE.txt.
''This means you are free to use XLSX I/O in any of your projects, from open source to commercial.
''This library does not require Microsoft(R) Excel(TM) to be installed.
'' translated to FreeBASIC by:
'' FreeBASIC development team
#pragma once
#ifndef INCLUDED_XLSXIO_WRITE_H

#define INCLUDED_XLSXIO_WRITE_H
#include once "crt/stdlib.bi"
#include once "crt/stdint.bi"
#include once "crt/time.bi"
#inclib "xlsxio_write"
#inclib "minizip"
#inclib "z"
extern "C"

Declare Sub xlsxiowrite_get_version(ByVal pmajor As Long Ptr, ByVal pminor As Long Ptr, ByVal pmicro As Long Ptr)
declare function xlsxiowrite_get_version_string() as const zstring ptr
Type xlsxiowriter As Any Ptr
declare function xlsxiowrite_open(byval filename as const zstring ptr, byval sheetname as const zstring ptr) as xlsxiowriter
Declare Function xlsxiowrite_close(ByVal HANDLE As xlsxiowriter) As Long
declare sub xlsxiowrite_set_detection_rows(byval handle as xlsxiowriter, byval rows as uinteger)
Declare Sub xlsxiowrite_set_row_height(ByVal HANDLE As xlsxiowriter, ByVal height As UInteger)
Declare Sub xlsxiowrite_add_column(ByVal HANDLE As xlsxiowriter, ByVal name_ As Const ZString Ptr, ByVal width_ As Long)
declare sub xlsxiowrite_add_cell_string(byval handle as xlsxiowriter, byval value as const zstring ptr)
Declare Sub xlsxiowrite_add_cell_int(ByVal HANDLE As xlsxiowriter, ByVal value As LongInt)
declare sub xlsxiowrite_add_cell_float(byval handle as xlsxiowriter, byval value as double)
declare sub xlsxiowrite_add_cell_datetime(byval handle as xlsxiowriter, byval value as time_t)
Declare Sub xlsxiowrite_next_row(ByVal HANDLE As xlsxiowriter)
End Extern
#endif
