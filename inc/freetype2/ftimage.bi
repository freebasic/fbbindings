#pragma once

#include once "crt/long.bi"
#include once "ft2build.bi"

extern "C"

#define __FTIMAGE_H__
type FT_Pos as clong

type FT_Vector_
	x as FT_Pos
	y as FT_Pos
end type

type FT_Vector as FT_Vector_

type FT_BBox_
	xMin as FT_Pos
	yMin as FT_Pos
	xMax as FT_Pos
	yMax as FT_Pos
end type

type FT_BBox as FT_BBox_

type FT_Pixel_Mode_ as long
enum
	FT_PIXEL_MODE_NONE = 0
	FT_PIXEL_MODE_MONO
	FT_PIXEL_MODE_GRAY
	FT_PIXEL_MODE_GRAY2
	FT_PIXEL_MODE_GRAY4
	FT_PIXEL_MODE_LCD
	FT_PIXEL_MODE_LCD_V
	FT_PIXEL_MODE_BGRA
	FT_PIXEL_MODE_MAX
end enum

type FT_Pixel_Mode as FT_Pixel_Mode_
#define ft_pixel_mode_none FT_PIXEL_MODE_NONE
#define ft_pixel_mode_mono FT_PIXEL_MODE_MONO
#define ft_pixel_mode_grays FT_PIXEL_MODE_GRAY
#define ft_pixel_mode_pal2 FT_PIXEL_MODE_GRAY2
#define ft_pixel_mode_pal4 FT_PIXEL_MODE_GRAY4

type FT_Bitmap_
	rows as ulong
	width as ulong
	pitch as long
	buffer as ubyte ptr
	num_grays as ushort
	pixel_mode as ubyte
	palette_mode as ubyte
	palette as any ptr
end type

type FT_Bitmap as FT_Bitmap_

type FT_Outline_
	n_contours as short
	n_points as short
	points as FT_Vector ptr
	tags as zstring ptr
	contours as short ptr
	flags as long
end type

type FT_Outline as FT_Outline_
#define FT_OUTLINE_CONTOURS_MAX SHRT_MAX
#define FT_OUTLINE_POINTS_MAX SHRT_MAX
const FT_OUTLINE_NONE = &h0
const FT_OUTLINE_OWNER = &h1
const FT_OUTLINE_EVEN_ODD_FILL = &h2
const FT_OUTLINE_REVERSE_FILL = &h4
const FT_OUTLINE_IGNORE_DROPOUTS = &h8
const FT_OUTLINE_SMART_DROPOUTS = &h10
const FT_OUTLINE_INCLUDE_STUBS = &h20
const FT_OUTLINE_HIGH_PRECISION = &h100
const FT_OUTLINE_SINGLE_PASS = &h200
#define ft_outline_none FT_OUTLINE_NONE
#define ft_outline_owner FT_OUTLINE_OWNER
#define ft_outline_even_odd_fill FT_OUTLINE_EVEN_ODD_FILL
#define ft_outline_reverse_fill FT_OUTLINE_REVERSE_FILL
#define ft_outline_ignore_dropouts FT_OUTLINE_IGNORE_DROPOUTS
#define ft_outline_high_precision FT_OUTLINE_HIGH_PRECISION
#define ft_outline_single_pass FT_OUTLINE_SINGLE_PASS
#define FT_CURVE_TAG(flag) (flag and 3)
const FT_CURVE_TAG_ON = 1
const FT_CURVE_TAG_CONIC = 0
const FT_CURVE_TAG_CUBIC = 2
const FT_CURVE_TAG_HAS_SCANMODE = 4
const FT_CURVE_TAG_TOUCH_X = 8
const FT_CURVE_TAG_TOUCH_Y = 16
#define FT_CURVE_TAG_TOUCH_BOTH (FT_CURVE_TAG_TOUCH_X or FT_CURVE_TAG_TOUCH_Y)
#define FT_Curve_Tag_On FT_CURVE_TAG_ON
#define FT_Curve_Tag_Conic FT_CURVE_TAG_CONIC
#define FT_Curve_Tag_Cubic FT_CURVE_TAG_CUBIC
#define FT_Curve_Tag_Touch_X FT_CURVE_TAG_TOUCH_X
#define FT_Curve_Tag_Touch_Y FT_CURVE_TAG_TOUCH_Y
type FT_Outline_MoveToFunc as function(byval to as const FT_Vector ptr, byval user as any ptr) as long
#define FT_Outline_MoveTo_Func FT_Outline_MoveToFunc
type FT_Outline_LineToFunc as function(byval to as const FT_Vector ptr, byval user as any ptr) as long
#define FT_Outline_LineTo_Func FT_Outline_LineToFunc
type FT_Outline_ConicToFunc as function(byval control as const FT_Vector ptr, byval to as const FT_Vector ptr, byval user as any ptr) as long
#define FT_Outline_ConicTo_Func FT_Outline_ConicToFunc
type FT_Outline_CubicToFunc as function(byval control1 as const FT_Vector ptr, byval control2 as const FT_Vector ptr, byval to as const FT_Vector ptr, byval user as any ptr) as long
#define FT_Outline_CubicTo_Func FT_Outline_CubicToFunc

type FT_Outline_Funcs_
	move_to as FT_Outline_MoveToFunc
	line_to as FT_Outline_LineToFunc
	conic_to as FT_Outline_ConicToFunc
	cubic_to as FT_Outline_CubicToFunc
	shift as long
	delta as FT_Pos
end type

type FT_Outline_Funcs as FT_Outline_Funcs_
#define FT_IMAGE_TAG(value, _x1, _x2, _x3, _x4) '' TODO: value = ( ( (unsigned long)_x1 << 24 ) | ( (unsigned long)_x2 << 16 ) | ( (unsigned long)_x3 << 8 ) | (unsigned long)_x4 )

type FT_Glyph_Format_ as long
enum
	FT_GLYPH_FORMAT_NONE = (((cast(culong, 0) shl 24) or (cast(culong, 0) shl 16)) or (cast(culong, 0) shl 8)) or cast(culong, 0)
	FT_GLYPH_FORMAT_COMPOSITE = (((cast(culong, asc("c")) shl 24) or (cast(culong, asc("o")) shl 16)) or (cast(culong, asc("m")) shl 8)) or cast(culong, asc("p"))
	FT_GLYPH_FORMAT_BITMAP = (((cast(culong, asc("b")) shl 24) or (cast(culong, asc("i")) shl 16)) or (cast(culong, asc("t")) shl 8)) or cast(culong, asc("s"))
	FT_GLYPH_FORMAT_OUTLINE = (((cast(culong, asc("o")) shl 24) or (cast(culong, asc("u")) shl 16)) or (cast(culong, asc("t")) shl 8)) or cast(culong, asc("l"))
	FT_GLYPH_FORMAT_PLOTTER = (((cast(culong, asc("p")) shl 24) or (cast(culong, asc("l")) shl 16)) or (cast(culong, asc("o")) shl 8)) or cast(culong, asc("t"))
end enum

type FT_Glyph_Format as FT_Glyph_Format_
#define ft_glyph_format_none FT_GLYPH_FORMAT_NONE
#define ft_glyph_format_composite FT_GLYPH_FORMAT_COMPOSITE
#define ft_glyph_format_bitmap FT_GLYPH_FORMAT_BITMAP
#define ft_glyph_format_outline FT_GLYPH_FORMAT_OUTLINE
#define ft_glyph_format_plotter FT_GLYPH_FORMAT_PLOTTER
type FT_Raster as FT_RasterRec_ ptr

type FT_Span_
	x as short
	len as ushort
	coverage as ubyte
end type

type FT_Span as FT_Span_
type FT_SpanFunc as sub(byval y as long, byval count as long, byval spans as const FT_Span ptr, byval user as any ptr)
#define FT_Raster_Span_Func FT_SpanFunc
type FT_Raster_BitTest_Func as function(byval y as long, byval x as long, byval user as any ptr) as long
type FT_Raster_BitSet_Func as sub(byval y as long, byval x as long, byval user as any ptr)
const FT_RASTER_FLAG_DEFAULT = &h0
const FT_RASTER_FLAG_AA = &h1
const FT_RASTER_FLAG_DIRECT = &h2
const FT_RASTER_FLAG_CLIP = &h4
#define ft_raster_flag_default FT_RASTER_FLAG_DEFAULT
#define ft_raster_flag_aa FT_RASTER_FLAG_AA
#define ft_raster_flag_direct FT_RASTER_FLAG_DIRECT
#define ft_raster_flag_clip FT_RASTER_FLAG_CLIP

type FT_Raster_Params_
	target as const FT_Bitmap ptr
	source as const any ptr
	flags as long
	gray_spans as FT_SpanFunc
	black_spans as FT_SpanFunc
	bit_test as FT_Raster_BitTest_Func
	bit_set as FT_Raster_BitSet_Func
	user as any ptr
	clip_box as FT_BBox
end type

type FT_Raster_Params as FT_Raster_Params_
type FT_Raster_NewFunc as function(byval memory as any ptr, byval raster as FT_Raster ptr) as long
#define FT_Raster_New_Func FT_Raster_NewFunc
type FT_Raster_DoneFunc as sub(byval raster as FT_Raster)
#define FT_Raster_Done_Func FT_Raster_DoneFunc
type FT_Raster_ResetFunc as sub(byval raster as FT_Raster, byval pool_base as ubyte ptr, byval pool_size as culong)
#define FT_Raster_Reset_Func FT_Raster_ResetFunc
type FT_Raster_SetModeFunc as function(byval raster as FT_Raster, byval mode as culong, byval args as any ptr) as long
#define FT_Raster_Set_Mode_Func FT_Raster_SetModeFunc
type FT_Raster_RenderFunc as function(byval raster as FT_Raster, byval params as const FT_Raster_Params ptr) as long
#define FT_Raster_Render_Func FT_Raster_RenderFunc

type FT_Raster_Funcs_
	glyph_format as FT_Glyph_Format
	raster_new as FT_Raster_NewFunc
	raster_reset as FT_Raster_ResetFunc
	raster_set_mode as FT_Raster_SetModeFunc
	raster_render as FT_Raster_RenderFunc
	raster_done as FT_Raster_DoneFunc
end type

type FT_Raster_Funcs as FT_Raster_Funcs_

end extern
