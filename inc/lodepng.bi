''freebasic bindings for LodePNG version 20241228
''LodePNG library is a PNG encoder and decoder in C and C++, without dependencies
''and is released under zlib license.
''Copyright (c) 2005-2024 Lode Vandevenne
''
''This software is provided 'as-is', without any express or implied
''warranty. In no event will the authors be held liable for any damages
''arising from the use of this software.
''
''Permission is granted to anyone to use this software for any purpose,
''including commercial applications, and to alter it and redistribute it
''freely, subject to the following restrictions:
''
''    1. The origin of this software must not be misrepresented; you must not
''    claim that you wrote the original software. If you use this software
''    in a product, an acknowledgment in the product documentation would be
''    appreciated but is not required.
''
''    2. Altered source versions must be plainly marked as such, and must not be
''    misrepresented as being the original software.
''
''    3. This notice may not be removed or altered from any source
''    distribution.
'' translated to FreeBASIC by:
''   FreeBASIC development team
#pragma once
#ifndef LODEPNG_H

#define LODEPNG_H
#include once "crt/string.bi"
#inclib "lodepng"

extern "C"

extern LODEPNG_VERSION_STRING as const zstring ptr
#define LODEPNG_COMPILE_ZLIB
#define LODEPNG_COMPILE_PNG
#define LODEPNG_COMPILE_DECODER
#define LODEPNG_COMPILE_ENCODER
#define LODEPNG_COMPILE_DISK
#define LODEPNG_COMPILE_ANCILLARY_CHUNKS
#define LODEPNG_COMPILE_ERROR_TEXT
#define LODEPNG_COMPILE_ALLOCATORS
#define LODEPNG_COMPILE_CRC

type LodePNGColorType as long
enum
   LCT_GREY = 0
   LCT_RGB = 2
   LCT_PALETTE = 3
   LCT_GREY_ALPHA = 4
   LCT_RGBA = 6
   LCT_MAX_OCTET_VALUE = 255
end enum

declare function lodepng_decode_memory(byval out_ as ubyte ptr ptr, byval w as ulong ptr, byval h as ulong ptr, byval in as const ubyte ptr, byval insize as uinteger, byval colortype as LodePNGColorType, byval bitdepth as ulong) as ulong
declare function lodepng_decode32(byval out_ as ubyte ptr ptr, byval w as ulong ptr, byval h as ulong ptr, byval in as const ubyte ptr, byval insize as uinteger) as ulong
declare function lodepng_decode24(byval out_ as ubyte ptr ptr, byval w as ulong ptr, byval h as ulong ptr, byval in as const ubyte ptr, byval insize as uinteger) as ulong
declare function lodepng_decode_file(byval out_ as ubyte ptr ptr, byval w as ulong ptr, byval h as ulong ptr, byval filename as const zstring ptr, byval colortype as LodePNGColorType, byval bitdepth as ulong) as ulong
declare function lodepng_decode32_file(byval out_ as ubyte ptr ptr, byval w as ulong ptr, byval h as ulong ptr, byval filename as const zstring ptr) as ulong
declare function lodepng_decode24_file(byval out_ as ubyte ptr ptr, byval w as ulong ptr, byval h as ulong ptr, byval filename as const zstring ptr) as ulong
declare function lodepng_encode_memory(byval out_ as ubyte ptr ptr, byval outsize as uinteger ptr, byval image as const ubyte ptr, byval w as ulong, byval h as ulong, byval colortype as LodePNGColorType, byval bitdepth as ulong) as ulong
declare function lodepng_encode32(byval out_ as ubyte ptr ptr, byval outsize as uinteger ptr, byval image as const ubyte ptr, byval w as ulong, byval h as ulong) as ulong
declare function lodepng_encode24(byval out_ as ubyte ptr ptr, byval outsize as uinteger ptr, byval image as const ubyte ptr, byval w as ulong, byval h as ulong) as ulong
declare function lodepng_encode_file(byval filename as const zstring ptr, byval image as const ubyte ptr, byval w as ulong, byval h as ulong, byval colortype as LodePNGColorType, byval bitdepth as ulong) as ulong
declare function lodepng_encode32_file(byval filename as const zstring ptr, byval image as const ubyte ptr, byval w as ulong, byval h as ulong) as ulong
declare function lodepng_encode24_file(byval filename as const zstring ptr, byval image as const ubyte ptr, byval w as ulong, byval h as ulong) as ulong
declare function lodepng_error_text(byval code as ulong) as const zstring ptr

type LodePNGDecompressSettings
   ignore_adler32 as ulong
   ignore_nlen as ulong
   max_output_size as uinteger
   custom_zlib as function(byval as ubyte ptr ptr, byval as uinteger ptr, byval as const ubyte ptr, byval as uinteger, byval as const LodePNGDecompressSettings ptr) as ulong
   custom_inflate as function(byval as ubyte ptr ptr, byval as uinteger ptr, byval as const ubyte ptr, byval as uinteger, byval as const LodePNGDecompressSettings ptr) as ulong
   custom_context as const any ptr
end type

extern lodepng_default_decompress_settings as const LodePNGDecompressSettings
declare sub lodepng_decompress_settings_init(byval settings as LodePNGDecompressSettings ptr)

type LodePNGCompressSettings
   btype as ulong
   use_lz77 as ulong
   windowsize as ulong
   minmatch as ulong
   nicematch as ulong
   lazymatching as ulong
   custom_zlib as function(byval as ubyte ptr ptr, byval as uinteger ptr, byval as const ubyte ptr, byval as uinteger, byval as const LodePNGCompressSettings ptr) as ulong
   custom_deflate as function(byval as ubyte ptr ptr, byval as uinteger ptr, byval as const ubyte ptr, byval as uinteger, byval as const LodePNGCompressSettings ptr) as ulong
   custom_context as const any ptr
end type

extern lodepng_default_compress_settings as const LodePNGCompressSettings
declare sub lodepng_compress_settings_init(byval settings as LodePNGCompressSettings ptr)

type LodePNGColorMode
   colortype as LodePNGColorType
   bitdepth as ulong
   palette as ubyte ptr
   palettesize as uinteger
   key_defined as ulong
   key_r as ulong
   key_g as ulong
   key_b as ulong
end type

declare sub lodepng_color_mode_init(byval info as LodePNGColorMode ptr)
declare sub lodepng_color_mode_cleanup(byval info as LodePNGColorMode ptr)
declare function lodepng_color_mode_copy(byval dest as LodePNGColorMode ptr, byval source as const LodePNGColorMode ptr) as ulong
declare function lodepng_color_mode_make(byval colortype as LodePNGColorType, byval bitdepth as ulong) as LodePNGColorMode
declare sub lodepng_palette_clear(byval info as LodePNGColorMode ptr)
declare function lodepng_palette_add(byval info as LodePNGColorMode ptr, byval r as ubyte, byval g as ubyte, byval b as ubyte, byval a as ubyte) as ulong
declare function lodepng_get_bpp(byval info as const LodePNGColorMode ptr) as ulong
declare function lodepng_get_channels(byval info as const LodePNGColorMode ptr) as ulong
declare function lodepng_is_greyscale_type(byval info as const LodePNGColorMode ptr) as ulong
declare function lodepng_is_alpha_type(byval info as const LodePNGColorMode ptr) as ulong
declare function lodepng_is_palette_type(byval info as const LodePNGColorMode ptr) as ulong
declare function lodepng_has_palette_alpha(byval info as const LodePNGColorMode ptr) as ulong
declare function lodepng_can_have_alpha(byval info as const LodePNGColorMode ptr) as ulong
declare function lodepng_get_raw_size(byval w as ulong, byval h as ulong, byval color as const LodePNGColorMode ptr) as uinteger

type LodePNGTime
   year as ulong
   month as ulong
   day as ulong
   hour as ulong
   minute as ulong
   second as ulong
end type

type LodePNGInfo
   compression_method as ulong
   filter_method as ulong
   interlace_method as ulong
   color as LodePNGColorMode
   background_defined as ulong
   background_r as ulong
   background_g as ulong
   background_b as ulong
   text_num as uinteger
   text_keys as zstring ptr ptr
   text_strings as zstring ptr ptr
   itext_num as uinteger
   itext_keys as zstring ptr ptr
   itext_langtags as zstring ptr ptr
   itext_transkeys as zstring ptr ptr
   itext_strings as zstring ptr ptr
   exif_defined as ulong
   exif as ubyte ptr
   exif_size as ulong
   time_defined as ulong
   time as LodePNGTime
   phys_defined as ulong
   phys_x as ulong
   phys_y as ulong
   phys_unit as ulong
   gama_defined as ulong
   gama_gamma as ulong
   chrm_defined as ulong
   chrm_white_x as ulong
   chrm_white_y as ulong
   chrm_red_x as ulong
   chrm_red_y as ulong
   chrm_green_x as ulong
   chrm_green_y as ulong
   chrm_blue_x as ulong
   chrm_blue_y as ulong
   srgb_defined as ulong
   srgb_intent as ulong
   iccp_defined as ulong
   iccp_name as zstring ptr
   iccp_profile as ubyte ptr
   iccp_profile_size as ulong
   cicp_defined as ulong
   cicp_color_primaries as ulong
   cicp_transfer_function as ulong
   cicp_matrix_coefficients as ulong
   cicp_video_full_range_flag as ulong
   mdcv_defined as ulong
   mdcv_red_x as ulong
   mdcv_red_y as ulong
   mdcv_green_x as ulong
   mdcv_green_y as ulong
   mdcv_blue_x as ulong
   mdcv_blue_y as ulong
   mdcv_white_x as ulong
   mdcv_white_y as ulong
   mdcv_max_luminance as ulong
   mdcv_min_luminance as ulong
   clli_defined as ulong
   clli_max_cll as ulong
   clli_max_fall as ulong
   sbit_defined as ulong
   sbit_r as ulong
   sbit_g as ulong
   sbit_b as ulong
   sbit_a as ulong
   unknown_chunks_data(0 to 2) as ubyte ptr
   unknown_chunks_size(0 to 2) as uinteger
end type

declare sub lodepng_info_init(byval info as LodePNGInfo ptr)
declare sub lodepng_info_cleanup(byval info as LodePNGInfo ptr)
declare function lodepng_info_copy(byval dest as LodePNGInfo ptr, byval source as const LodePNGInfo ptr) as ulong
declare function lodepng_add_text(byval info as LodePNGInfo ptr, byval key as const zstring ptr, byval str_ as const zstring ptr) as ulong
declare sub lodepng_clear_text(byval info as LodePNGInfo ptr)
declare function lodepng_add_itext(byval info as LodePNGInfo ptr, byval key as const zstring ptr, byval langtag as const zstring ptr, byval transkey as const zstring ptr, byval str_ as const zstring ptr) as ulong
declare sub lodepng_clear_itext(byval info as LodePNGInfo ptr)
declare function lodepng_set_icc(byval info as LodePNGInfo ptr, byval name_ as const zstring ptr, byval profile as const ubyte ptr, byval profile_size as ulong) as ulong
declare sub lodepng_clear_icc(byval info as LodePNGInfo ptr)
declare function lodepng_set_exif(byval info as LodePNGInfo ptr, byval exif as const ubyte ptr, byval exif_size as ulong) as ulong
declare sub lodepng_clear_exif(byval info as LodePNGInfo ptr)
declare function lodepng_convert(byval out_ as ubyte ptr, byval in as const ubyte ptr, byval mode_out as const LodePNGColorMode ptr, byval mode_in as const LodePNGColorMode ptr, byval w as ulong, byval h as ulong) as ulong

type LodePNGDecoderSettings
   zlibsettings as LodePNGDecompressSettings
   ignore_crc as ulong
   ignore_critical as ulong
   ignore_end as ulong
   color_convert as ulong
   read_text_chunks as ulong
   remember_unknown_chunks as ulong
   max_text_size as uinteger
   max_icc_size as uinteger
end type

declare sub lodepng_decoder_settings_init(byval settings as LodePNGDecoderSettings ptr)

type LodePNGFilterStrategy as long
enum
   LFS_ZERO = 0
   LFS_ONE = 1
   LFS_TWO = 2
   LFS_THREE = 3
   LFS_FOUR = 4
   LFS_MINSUM
   LFS_ENTROPY
   LFS_BRUTE_FORCE
   LFS_PREDEFINED
end enum

type LodePNGColorStats
   colored as ulong
   key as ulong
   key_r as ushort
   key_g as ushort
   key_b as ushort
   alpha as ulong
   numcolors as ulong
   palette(0 to 1023) as ubyte
   bits as ulong
   numpixels as uinteger
   allow_palette as ulong
   allow_greyscale as ulong
end type

declare sub lodepng_color_stats_init(byval stats as LodePNGColorStats ptr)
declare function lodepng_compute_color_stats(byval stats as LodePNGColorStats ptr, byval image as const ubyte ptr, byval w as ulong, byval h as ulong, byval mode_in as const LodePNGColorMode ptr) as ulong

type LodePNGEncoderSettings
   zlibsettings as LodePNGCompressSettings
   auto_convert as ulong
   filter_palette_zero as ulong
   filter_strategy as LodePNGFilterStrategy
   predefined_filters as const ubyte ptr
   force_palette as ulong
   add_id as ulong
   text_compression as ulong
end type

declare sub lodepng_encoder_settings_init(byval settings as LodePNGEncoderSettings ptr)

type LodePNGState
   decoder as LodePNGDecoderSettings
   encoder as LodePNGEncoderSettings
   info_raw as LodePNGColorMode
   info_png as LodePNGInfo
   error_ as ulong
end type

declare sub lodepng_state_init(byval state as LodePNGState ptr)
declare sub lodepng_state_cleanup(byval state as LodePNGState ptr)
declare sub lodepng_state_copy(byval dest as LodePNGState ptr, byval source as const LodePNGState ptr)
declare function lodepng_decode(byval out_ as ubyte ptr ptr, byval w as ulong ptr, byval h as ulong ptr, byval state as LodePNGState ptr, byval in as const ubyte ptr, byval insize as uinteger) as ulong
declare function lodepng_inspect(byval w as ulong ptr, byval h as ulong ptr, byval state as LodePNGState ptr, byval in as const ubyte ptr, byval insize as uinteger) as ulong
declare function lodepng_inspect_chunk(byval state as LodePNGState ptr, byval pos_ as uinteger, byval in as const ubyte ptr, byval insize as uinteger) as ulong
declare function lodepng_encode(byval out_ as ubyte ptr ptr, byval outsize as uinteger ptr, byval image as const ubyte ptr, byval w as ulong, byval h as ulong, byval state as LodePNGState ptr) as ulong
declare function lodepng_chunk_length(byval chunk as const ubyte ptr) as ulong
declare sub lodepng_chunk_type(byval type_ as zstring ptr, byval chunk as const ubyte ptr)
declare function lodepng_chunk_type_equals(byval chunk as const ubyte ptr, byval type_ as const zstring ptr) as ubyte
declare function lodepng_chunk_ancillary(byval chunk as const ubyte ptr) as ubyte
declare function lodepng_chunk_private(byval chunk as const ubyte ptr) as ubyte
declare function lodepng_chunk_safetocopy(byval chunk as const ubyte ptr) as ubyte
declare function lodepng_chunk_data(byval chunk as ubyte ptr) as ubyte ptr
declare function lodepng_chunk_data_const(byval chunk as const ubyte ptr) as const ubyte ptr
declare function lodepng_chunk_check_crc(byval chunk as const ubyte ptr) as ulong
declare sub lodepng_chunk_generate_crc(byval chunk as ubyte ptr)
declare function lodepng_chunk_next(byval chunk as ubyte ptr, byval end_ as ubyte ptr) as ubyte ptr
declare function lodepng_chunk_next_const(byval chunk as const ubyte ptr, byval end_ as const ubyte ptr) as const ubyte ptr
declare function lodepng_chunk_find(byval chunk as ubyte ptr, byval end_ as ubyte ptr, byval type_ as const zstring ptr) as ubyte ptr
declare function lodepng_chunk_find_const(byval chunk as const ubyte ptr, byval end_ as const ubyte ptr, byval type_ as const zstring ptr) as const ubyte ptr
declare function lodepng_chunk_append(byval out_ as ubyte ptr ptr, byval outsize as uinteger ptr, byval chunk as const ubyte ptr) as ulong
declare function lodepng_chunk_create(byval out_ as ubyte ptr ptr, byval outsize as uinteger ptr, byval length as uinteger, byval type_ as const zstring ptr, byval data_ as const ubyte ptr) as ulong
declare function lodepng_crc32(byval buf as const ubyte ptr, byval len_ as uinteger) as ulong
declare function lodepng_inflate(byval out_ as ubyte ptr ptr, byval outsize as uinteger ptr, byval in as const ubyte ptr, byval insize as uinteger, byval settings as const LodePNGDecompressSettings ptr) as ulong
declare function lodepng_zlib_decompress(byval out_ as ubyte ptr ptr, byval outsize as uinteger ptr, byval in as const ubyte ptr, byval insize as uinteger, byval settings as const LodePNGDecompressSettings ptr) as ulong
declare function lodepng_zlib_compress(byval out_ as ubyte ptr ptr, byval outsize as uinteger ptr, byval in as const ubyte ptr, byval insize as uinteger, byval settings as const LodePNGCompressSettings ptr) as ulong
declare function lodepng_huffman_code_lengths(byval lengths as ulong ptr, byval frequencies as const ulong ptr, byval numcodes as uinteger, byval maxbitlen as ulong) as ulong
declare function lodepng_deflate(byval out_ as ubyte ptr ptr, byval outsize as uinteger ptr, byval in as const ubyte ptr, byval insize as uinteger, byval settings as const LodePNGCompressSettings ptr) as ulong
declare function lodepng_load_file(byval out_ as ubyte ptr ptr, byval outsize as uinteger ptr, byval filename as const zstring ptr) as ulong
declare function lodepng_save_file(byval buffer as const ubyte ptr, byval buffersize as uinteger, byval filename as const zstring ptr) as ulong

end extern
#endif
#endif