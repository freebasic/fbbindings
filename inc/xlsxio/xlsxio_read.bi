#pragma once
#ifndef INCLUDED_XLSXIO_READ_H

#define INCLUDED_XLSXIO_READ_H
#include once "crt/stdlib.bi"
#include once "crt/stdint.bi"
#include once "crt/time.bi"
#inclib "xlsxio_read"
#inclib "expat"
#inclib "minizip"
#inclib "z"
extern "C"

type XLSXIOCHAR as zstring

Declare Sub xlsxioread_get_version(ByVal pmajor As Long Ptr, ByVal pminor As Long Ptr, ByVal pmicro As Long Ptr)
declare function xlsxioread_get_version_string() as const zstring ptr
Type xlsxioreader As Any Ptr
Declare Function xlsxioread_open(ByVal filename As Const ZString Ptr) As xlsxioreader
Declare Function xlsxioread_open_filehandle(ByVal filehandle As Long) As xlsxioreader
declare function xlsxioread_open_memory(byval data as any ptr, byval datalen as ulongint, byval freedata as long) as xlsxioreader
Declare Sub xlsxioread_close(ByVal HANDLE As xlsxioreader)
Type xlsxioread_list_sheets_callback_fn As Function(ByVal name_ As Const ZString Ptr, ByVal callbackdata As Any Ptr) As Long
Declare Sub xlsxioread_list_sheets(ByVal HANDLE As xlsxioreader, ByVal callback As xlsxioread_list_sheets_callback_fn, ByVal callbackdata As Any Ptr)

const XLSXIOREAD_SKIP_NONE = 0
const XLSXIOREAD_SKIP_EMPTY_ROWS = &h01
const XLSXIOREAD_SKIP_EMPTY_CELLS = &h02
const XLSXIOREAD_SKIP_ALL_EMPTY = XLSXIOREAD_SKIP_EMPTY_ROWS or XLSXIOREAD_SKIP_EMPTY_CELLS
const XLSXIOREAD_SKIP_EXTRA_CELLS = &h04
const XLSXIOREAD_SKIP_HIDDEN_ROWS = &h08
type xlsxioread_process_cell_callback_fn as function(byval row as uinteger, byval col as uinteger, byval value as const zstring ptr, byval callbackdata as any ptr) as long
type xlsxioread_process_row_callback_fn as function(byval row as uinteger, byval maxcol as uinteger, byval callbackdata as any ptr) as long
Declare Function xlsxioread_process(ByVal HANDLE As xlsxioreader, ByVal sheetname As Const ZString Ptr, ByVal FLAGS As ULong, ByVal cell_callback As xlsxioread_process_cell_callback_fn, ByVal row_callback As xlsxioread_process_row_callback_fn, ByVal callbackdata As Any Ptr) As Long
Type xlsxioreadersheetlist As Any Ptr

Declare Function xlsxioread_sheetlist_open(ByVal HANDLE As xlsxioreader) As xlsxioreadersheetlist
declare sub xlsxioread_sheetlist_close(byval sheetlisthandle as xlsxioreadersheetlist)
declare function xlsxioread_sheetlist_next(byval sheetlisthandle as xlsxioreadersheetlist) as const zstring ptr
Type xlsxioreadersheet As Any Ptr
Declare Function xlsxioread_sheet_last_row_index(ByVal sheethandle As xlsxioreadersheet) As UInteger
declare function xlsxioread_sheet_last_column_index(byval sheethandle as xlsxioreadersheet) as uinteger
declare function xlsxioread_sheet_flags(byval sheethandle as xlsxioreadersheet) as ulong
declare function xlsxioread_sheet_open(byval handle as xlsxioreader, byval sheetname as const zstring ptr, byval flags as ulong) as xlsxioreadersheet
Declare Sub xlsxioread_sheet_close(ByVal sheethandle As xlsxioreadersheet)
Declare Function xlsxioread_sheet_next_row(ByVal sheethandle As xlsxioreadersheet) As Long
declare function xlsxioread_sheet_next_cell(byval sheethandle as xlsxioreadersheet) as zstring ptr
declare function xlsxioread_sheet_next_cell_string(byval sheethandle as xlsxioreadersheet, byval pvalue as zstring ptr ptr) as long
declare function xlsxioread_sheet_next_cell_int(byval sheethandle as xlsxioreadersheet, byval pvalue as longint ptr) as long
declare function xlsxioread_sheet_next_cell_float(byval sheethandle as xlsxioreadersheet, byval pvalue as double ptr) as long
declare function xlsxioread_sheet_next_cell_datetime(byval sheethandle as xlsxioreadersheet, byval pvalue as time_t ptr) as long
Declare Sub xlsxioread_free(ByVal data_ As ZString Ptr)

end extern
#endif