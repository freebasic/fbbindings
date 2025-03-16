'freebasic bindings for PDFGen
' based on the C header files:
'https://github.com/AndreRenaud/PDFGen
'Simple C PDF Creation/Generation library. All contained a single C-file with header and no external library dependencies.
'This is free and unencumbered software released into the public domain.
'
'Anyone is free to copy, modify, publish, use, compile, sell, or
'distribute this software, either in source code form or as a compiled
'binary, for any purpose, commercial or non-commercial, and by any
'means.
'
'In jurisdictions that recognize copyright laws, the author or authors
'of this software dedicate any and all copyright interest in the
'software to the public domain. We make this dedication for the benefit
'of the public at large and to the detriment of our heirs and
'successors. We intend this dedication to be an overt act of
'relinquishment in perpetuity of all present and future rights to this
'software under copyright law.
'
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
'EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
'MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
'IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
'OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
'ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
'OTHER DEALINGS IN THE SOFTWARE.
'' translated to FreeBASIC by:
''  FreeBASIC development team

#pragma once
#ifndef PDFGEN_H

#define PDFGEN_H
#include once "crt/stdint.bi"
#include once "crt/stdio.bi"
#inclib "PDFGen"

extern "C"

Type pdf_doc As Any Ptr
Type pdf_object as any ptr
type pdf_info
   creator as zstring * 64
   producer as zstring * 64
   title as zstring * 64
   author as zstring * 64
   subject as zstring * 64
   date as zstring * 64
end type

enum
   IMAGE_PNG
   IMAGE_JPG
   IMAGE_PPM
   IMAGE_BMP
   IMAGE_UNKNOWN
end enum

enum
   PNG_COLOR_GREYSCALE = 0
   PNG_COLOR_RGB = 2
   PNG_COLOR_INDEXED = 3
   PNG_COLOR_GREYSCALE_A = 4
   PNG_COLOR_RGBA = 6
   PNG_COLOR_INVALID = 255
end enum

type png_header field = 1
   width as ulong
   height as ulong
   bitDepth as ubyte
   colorType as ubyte
   deflate as ubyte
   filtering as ubyte
   interlace as ubyte
end type

type bmp_header field = 1
   bfSize as ulong
   bfReserved1 as ushort
   bfReserved2 as ushort
   bfOffBits as ulong
   biSize as ulong
   biWidth as long
   biHeight as long
   biPlanes as ushort
   biBitCount as ushort
   biCompression as ulong
end type

type jpeg_header
   ncolours as long
end type

enum
   PPM_BINARY_COLOR_RGB
   PPM_BINARY_COLOR_GRAY
end enum

type ppm_header
   size as uinteger
   data_begin_pos as uinteger
   color_space as long
end type

type pdf_img_info
   image_format as long
   width as ulong
   height as ulong

   union
      bmp as bmp_header
      jpeg as jpeg_header
      png as png_header
      ppm as ppm_header
   end union
end type

type pdf_path_operation
   op as byte
   x1 as single
   y1 as single
   x2 as single
   y2 as single
   x3 as single
   y3 as single
end type

#define PDF_INCH_TO_POINT(inch) csng((inch) * 72.0f)
#define PDF_MM_TO_POINT(mm) csng(((mm) * 72.0f) / 25.4f)
#define PDF_LETTER_WIDTH PDF_INCH_TO_POINT(8.5f)
#define PDF_LETTER_HEIGHT PDF_INCH_TO_POINT(11.0f)
#define PDF_A4_WIDTH PDF_MM_TO_POINT(210.0f)
#define PDF_A4_HEIGHT PDF_MM_TO_POINT(297.0f)
#define PDF_A3_WIDTH PDF_MM_TO_POINT(297.0f)
#define PDF_A3_HEIGHT PDF_MM_TO_POINT(420.0f)
#define PDF_RGB(r, g, b) culng(((((r) and &hff) shl 16) or (((g) and &hff) shl 8)) or ((b) and &hff))
#define PDF_ARGB(a, r, g, b) culng(((culng(culng((a) and &hff) shl 24) or (((r) and &hff) shl 16)) or (((g) and &hff) shl 8)) or ((b) and &hff))
#define PDF_RED PDF_RGB(&hff, 0, 0)
#define PDF_GREEN PDF_RGB(0, &hff, 0)
#define PDF_BLUE PDF_RGB(0, 0, &hff)
#define PDF_BLACK PDF_RGB(0, 0, 0)
#define PDF_WHITE PDF_RGB(&hff, &hff, &hff)
const PDF_TRANSPARENT = culng(&hffu shl 24)

enum
   PDF_ALIGN_LEFT
   PDF_ALIGN_RIGHT
   PDF_ALIGN_CENTER
   PDF_ALIGN_JUSTIFY
   PDF_ALIGN_JUSTIFY_ALL
   PDF_ALIGN_NO_WRITE
end enum

Declare Function pdf_create(ByVal Width As Single, ByVal height As Single, ByVal info As Const pdf_info Ptr) As pdf_doc Ptr
declare sub pdf_destroy(byval pdf as pdf_doc ptr)
declare function pdf_get_err(byval pdf as const pdf_doc ptr, byval errval as long ptr) as const zstring ptr
declare sub pdf_clear_err(byval pdf as pdf_doc ptr)
declare function pdf_set_font(byval pdf as pdf_doc ptr, byval font as const zstring ptr) as long
declare function pdf_get_font_text_width(byval pdf as pdf_doc ptr, byval font_name as const zstring ptr, byval text as const zstring ptr, byval size as single, byval text_width as single ptr) as long
declare function pdf_height(byval pdf as const pdf_doc ptr) as single
declare function pdf_width(byval pdf as const pdf_doc ptr) as single
Declare Function pdf_page_height(ByVal page As Const pdf_object Ptr) As Single
declare function pdf_page_width(byval page as const pdf_object ptr) as single
declare function pdf_append_page(byval pdf as pdf_doc ptr) as pdf_object ptr
declare function pdf_get_page(byval pdf as pdf_doc ptr, byval page_number as long) as pdf_object ptr
declare function pdf_page_set_size(byval pdf as pdf_doc ptr, byval page as pdf_object ptr, byval width as single, byval height as single) as long
declare function pdf_save(byval pdf as pdf_doc ptr, byval filename as const zstring ptr) as long
declare function pdf_save_file(byval pdf as pdf_doc ptr, byval fp as FILE ptr) as long
declare function pdf_add_text(byval pdf as pdf_doc ptr, byval page as pdf_object ptr, byval text as const zstring ptr, byval size as single, byval xoff as single, byval yoff as single, byval colour as ulong) as long
declare function pdf_add_text_rotate(byval pdf as pdf_doc ptr, byval page as pdf_object ptr, byval text as const zstring ptr, byval size as single, byval xoff as single, byval yoff as single, byval angle as single, byval colour as ulong) as long
declare function pdf_add_text_wrap(byval pdf as pdf_doc ptr, byval page as pdf_object ptr, byval text as const zstring ptr, byval size as single, byval xoff as single, byval yoff as single, byval angle as single, byval colour as ulong, byval wrap_width as single, byval align as long, byval height as single ptr) as long
declare function pdf_add_line(byval pdf as pdf_doc ptr, byval page as pdf_object ptr, byval x1 as single, byval y1 as single, byval x2 as single, byval y2 as single, byval width as single, byval colour as ulong) as long
declare function pdf_add_cubic_bezier(byval pdf as pdf_doc ptr, byval page as pdf_object ptr, byval x1 as single, byval y1 as single, byval x2 as single, byval y2 as single, byval xq1 as single, byval yq1 as single, byval xq2 as single, byval yq2 as single, byval width as single, byval colour as ulong) as long
declare function pdf_add_quadratic_bezier(byval pdf as pdf_doc ptr, byval page as pdf_object ptr, byval x1 as single, byval y1 as single, byval x2 as single, byval y2 as single, byval xq1 as single, byval yq1 as single, byval width as single, byval colour as ulong) as long
declare function pdf_add_custom_path(byval pdf as pdf_doc ptr, byval page as pdf_object ptr, byval operations as const pdf_path_operation ptr, byval operation_count as long, byval stroke_width as single, byval stroke_colour as ulong, byval fill_colour as ulong) as long
declare function pdf_add_ellipse(byval pdf as pdf_doc ptr, byval page as pdf_object ptr, byval x as single, byval y as single, byval xradius as single, byval yradius as single, byval width as single, byval colour as ulong, byval fill_colour as ulong) as long
declare function pdf_add_circle(byval pdf as pdf_doc ptr, byval page as pdf_object ptr, byval x as single, byval y as single, byval radius as single, byval width as single, byval colour as ulong, byval fill_colour as ulong) as long
declare function pdf_add_rectangle(byval pdf as pdf_doc ptr, byval page as pdf_object ptr, byval x as single, byval y as single, byval width as single, byval height as single, byval border_width as single, byval colour as ulong) as long
declare function pdf_add_filled_rectangle(byval pdf as pdf_doc ptr, byval page as pdf_object ptr, byval x as single, byval y as single, byval width as single, byval height as single, byval border_width as single, byval colour_fill as ulong, byval colour_border as ulong) as long
declare function pdf_add_polygon(byval pdf as pdf_doc ptr, byval page as pdf_object ptr, byval x as single ptr, byval y as single ptr, byval count as long, byval border_width as single, byval colour as ulong) as long
declare function pdf_add_filled_polygon(byval pdf as pdf_doc ptr, byval page as pdf_object ptr, byval x as single ptr, byval y as single ptr, byval count as long, byval border_width as single, byval colour as ulong) as long
declare function pdf_add_bookmark(byval pdf as pdf_doc ptr, byval page as pdf_object ptr, byval parent as long, byval name_ as const zstring ptr) as long
declare function pdf_add_link(byval pdf as pdf_doc ptr, byval page as pdf_object ptr, byval x as single, byval y as single, byval width as single, byval height as single, byval target_page as pdf_object ptr, byval target_x as single, byval target_y as single) as long

enum
   PDF_BARCODE_128A
   PDF_BARCODE_39
   PDF_BARCODE_EAN13
   PDF_BARCODE_UPCA
   PDF_BARCODE_EAN8
   PDF_BARCODE_UPCE
end enum

declare function pdf_add_barcode(byval pdf as pdf_doc ptr, byval page as pdf_object ptr, byval code as long, byval x as single, byval y as single, byval width as single, byval height as single, byval string as const zstring ptr, byval colour as ulong) as long
declare function pdf_add_image_data(byval pdf as pdf_doc ptr, byval page as pdf_object ptr, byval x as single, byval y as single, byval display_width as single, byval display_height as single, byval data_ as const ubyte ptr, byval len_ as uinteger) as long
declare function pdf_add_rgb24(byval pdf as pdf_doc ptr, byval page as pdf_object ptr, byval x as single, byval y as single, byval display_width as single, byval display_height as single, byval data_ as const ubyte ptr, byval width as ulong, byval height as ulong) as long
declare function pdf_add_grayscale8(byval pdf as pdf_doc ptr, byval page as pdf_object ptr, byval x as single, byval y as single, byval display_width as single, byval display_height as single, byval data_ as const ubyte ptr, byval width as ulong, byval height as ulong) as long
declare function pdf_add_image_file(byval pdf as pdf_doc ptr, byval page as pdf_object ptr, byval x as single, byval y as single, byval display_width as single, byval display_height as single, byval image_filename as const zstring ptr) as long
declare function pdf_parse_image_header(byval info as pdf_img_info ptr, byval data_ as const ubyte ptr, byval length as uinteger, byval err_msg as zstring ptr, byval err_msg_length as uinteger) as long

end extern
#endif 