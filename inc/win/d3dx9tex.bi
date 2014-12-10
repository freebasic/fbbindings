#pragma once

#include once "_mingw_unicode.bi"
#include once "d3dx9.bi"

#ifdef __FB_64BIT__
	extern "C"
#else
	extern "Windows"
#endif

#define __WINE_D3DX9TEX_H
#define D3DX_FILTER_NONE &h00000001
#define D3DX_FILTER_POINT &h00000002
#define D3DX_FILTER_LINEAR &h00000003
#define D3DX_FILTER_TRIANGLE &h00000004
#define D3DX_FILTER_BOX &h00000005
#define D3DX_FILTER_MIRROR_U &h00010000
#define D3DX_FILTER_MIRROR_V &h00020000
#define D3DX_FILTER_MIRROR_W &h00040000
#define D3DX_FILTER_MIRROR &h00070000
#define D3DX_FILTER_DITHER &h00080000
#define D3DX_FILTER_DITHER_DIFFUSION &h00100000
#define D3DX_FILTER_SRGB_IN &h00200000
#define D3DX_FILTER_SRGB_OUT &h00400000
#define D3DX_FILTER_SRGB &h00600000
#define D3DX_NORMALMAP_MIRROR_U &h00010000
#define D3DX_NORMALMAP_MIRROR_V &h00020000
#define D3DX_NORMALMAP_MIRROR &h00030000
#define D3DX_NORMALMAP_INVERTSIGN &h00080000
#define D3DX_NORMALMAP_COMPUTE_OCCLUSION &h00100000
#define D3DX_CHANNEL_RED &h00000001
#define D3DX_CHANNEL_BLUE &h00000002
#define D3DX_CHANNEL_GREEN &h00000004
#define D3DX_CHANNEL_ALPHA &h00000008
#define D3DX_CHANNEL_LUMINANCE &h00000010

type _D3DXIMAGE_FILEFORMAT as long
enum
	D3DXIFF_BMP
	D3DXIFF_JPG
	D3DXIFF_TGA
	D3DXIFF_PNG
	D3DXIFF_DDS
	D3DXIFF_PPM
	D3DXIFF_DIB
	D3DXIFF_HDR
	D3DXIFF_PFM
	D3DXIFF_FORCE_DWORD = &h7fffffff
end enum

type D3DXIMAGE_FILEFORMAT as _D3DXIMAGE_FILEFORMAT

type _D3DXIMAGE_INFO
	Width as UINT
	Height as UINT
	Depth as UINT
	MipLevels as UINT
	Format as D3DFORMAT
	ResourceType as D3DRESOURCETYPE
	ImageFileFormat as D3DXIMAGE_FILEFORMAT
end type

type D3DXIMAGE_INFO as _D3DXIMAGE_INFO
type LPD3DXFILL2D as sub(byval out_ as D3DXVECTOR4 ptr, byval texcoord as const D3DXVECTOR2 ptr, byval texelsize as const D3DXVECTOR2 ptr, byval data_ as any ptr)
type LPD3DXFILL3D as sub(byval out_ as D3DXVECTOR4 ptr, byval texcoord as const D3DXVECTOR3 ptr, byval texelsize as const D3DXVECTOR3 ptr, byval data_ as any ptr)

declare function D3DXGetImageInfoFromFileA(byval file as const zstring ptr, byval info as D3DXIMAGE_INFO ptr) as HRESULT
declare function D3DXGetImageInfoFromFileW(byval file as const WCHAR ptr, byval info as D3DXIMAGE_INFO ptr) as HRESULT

#define D3DXGetImageInfoFromFile __MINGW_NAME_AW(D3DXGetImageInfoFromFile)

declare function D3DXGetImageInfoFromResourceA(byval module as HMODULE, byval resource as const zstring ptr, byval info as D3DXIMAGE_INFO ptr) as HRESULT
declare function D3DXGetImageInfoFromResourceW(byval module as HMODULE, byval resource as const WCHAR ptr, byval info as D3DXIMAGE_INFO ptr) as HRESULT

#define D3DXGetImageInfoFromResource __MINGW_NAME_AW(D3DXGetImageInfoFromResource)

declare function D3DXGetImageInfoFromFileInMemory(byval data_ as const any ptr, byval data_size as UINT, byval info as D3DXIMAGE_INFO ptr) as HRESULT
declare function D3DXLoadSurfaceFromFileA(byval destsurface as IDirect3DSurface9 ptr, byval destpalette as const PALETTEENTRY ptr, byval destrect as const RECT ptr, byval srcfile as const zstring ptr, byval srcrect as const RECT ptr, byval filter as DWORD, byval colorkey as D3DCOLOR, byval srcinfo as D3DXIMAGE_INFO ptr) as HRESULT
declare function D3DXLoadSurfaceFromFileW(byval destsurface as IDirect3DSurface9 ptr, byval destpalette as const PALETTEENTRY ptr, byval destrect as const RECT ptr, byval srcfile as const WCHAR ptr, byval srcrect as const RECT ptr, byval filter as DWORD, byval colorkey as D3DCOLOR, byval srcinfo as D3DXIMAGE_INFO ptr) as HRESULT

#define D3DXLoadSurfaceFromFile __MINGW_NAME_AW(D3DXLoadSurfaceFromFile)

declare function D3DXLoadSurfaceFromResourceA(byval destsurface as IDirect3DSurface9 ptr, byval destpalette as const PALETTEENTRY ptr, byval destrect as const RECT ptr, byval srcmodule as HMODULE, byval resource as const zstring ptr, byval srcrect as const RECT ptr, byval filter as DWORD, byval colorkey as D3DCOLOR, byval srcinfo as D3DXIMAGE_INFO ptr) as HRESULT
declare function D3DXLoadSurfaceFromResourceW(byval destsurface as IDirect3DSurface9 ptr, byval destpalette as const PALETTEENTRY ptr, byval destrect as const RECT ptr, byval srcmodule as HMODULE, byval resource as const WCHAR ptr, byval srcrect as const RECT ptr, byval filter as DWORD, byval colorkey as D3DCOLOR, byval srcinfo as D3DXIMAGE_INFO ptr) as HRESULT

#define D3DXLoadSurfaceFromResource __MINGW_NAME_AW(D3DXLoadSurfaceFromResource)

declare function D3DXLoadSurfaceFromFileInMemory(byval destsurface as IDirect3DSurface9 ptr, byval destpalette as const PALETTEENTRY ptr, byval destrect as const RECT ptr, byval srcdata as const any ptr, byval srcdatasize as UINT, byval srcrect as const RECT ptr, byval filter as DWORD, byval colorkey as D3DCOLOR, byval srcinfo as D3DXIMAGE_INFO ptr) as HRESULT
declare function D3DXLoadSurfaceFromSurface(byval destsurface as IDirect3DSurface9 ptr, byval destpalette as const PALETTEENTRY ptr, byval destrect as const RECT ptr, byval srcsurface as IDirect3DSurface9 ptr, byval srcpalette as const PALETTEENTRY ptr, byval srcrect as const RECT ptr, byval filter as DWORD, byval colorkey as D3DCOLOR) as HRESULT
declare function D3DXLoadSurfaceFromMemory(byval dst_surface as IDirect3DSurface9 ptr, byval dst_palette as const PALETTEENTRY ptr, byval dst_rect as const RECT ptr, byval src_memory as const any ptr, byval src_format as D3DFORMAT, byval src_pitch as UINT, byval src_palette as const PALETTEENTRY ptr, byval src_rect as const RECT ptr, byval filter as DWORD, byval color_key as D3DCOLOR) as HRESULT
declare function D3DXSaveSurfaceToFileInMemory(byval destbuffer as ID3DXBuffer ptr ptr, byval destformat as D3DXIMAGE_FILEFORMAT, byval srcsurface as IDirect3DSurface9 ptr, byval srcpalette as const PALETTEENTRY ptr, byval srcrect as const RECT ptr) as HRESULT
declare function D3DXSaveSurfaceToFileA(byval destfile as const zstring ptr, byval destformat as D3DXIMAGE_FILEFORMAT, byval srcsurface as IDirect3DSurface9 ptr, byval srcpalette as const PALETTEENTRY ptr, byval srcrect as const RECT ptr) as HRESULT
declare function D3DXSaveSurfaceToFileW(byval destfile as const WCHAR ptr, byval destformat as D3DXIMAGE_FILEFORMAT, byval srcsurface as IDirect3DSurface9 ptr, byval srcpalette as const PALETTEENTRY ptr, byval srcrect as const RECT ptr) as HRESULT

#define D3DXSaveSurfaceToFile __MINGW_NAME_AW(D3DXSaveSurfaceToFile)

declare function D3DXLoadVolumeFromFileA(byval destvolume as IDirect3DVolume9 ptr, byval destpalette as const PALETTEENTRY ptr, byval destbox as const D3DBOX ptr, byval srcfile as const zstring ptr, byval srcbox as const D3DBOX ptr, byval filter as DWORD, byval colorkey as D3DCOLOR, byval srcinfo as D3DXIMAGE_INFO ptr) as HRESULT
declare function D3DXLoadVolumeFromFileW(byval destvolume as IDirect3DVolume9 ptr, byval destpalette as const PALETTEENTRY ptr, byval destbox as const D3DBOX ptr, byval srcfile as const WCHAR ptr, byval srcbox as const D3DBOX ptr, byval filter as DWORD, byval colorkey as D3DCOLOR, byval srcinfo as D3DXIMAGE_INFO ptr) as HRESULT

#define D3DXLoadVolumeFromFile __MINGW_NAME_AW(D3DXLoadVolumeFromFile)

declare function D3DXLoadVolumeFromResourceA(byval destvolume as IDirect3DVolume9 ptr, byval destpalette as const PALETTEENTRY ptr, byval destbox as const D3DBOX ptr, byval srcmodule as HMODULE, byval resource as const zstring ptr, byval srcbox as const D3DBOX ptr, byval filter as DWORD, byval colorkey as D3DCOLOR, byval srcinfo as D3DXIMAGE_INFO ptr) as HRESULT
declare function D3DXLoadVolumeFromResourceW(byval destvolume as IDirect3DVolume9 ptr, byval destpalette as const PALETTEENTRY ptr, byval destbox as const D3DBOX ptr, byval srcmodule as HMODULE, byval resource as const WCHAR ptr, byval srcbox as const D3DBOX ptr, byval filter as DWORD, byval colorkey as D3DCOLOR, byval srcinfo as D3DXIMAGE_INFO ptr) as HRESULT

#define D3DXLoadVolumeFromResource __MINGW_NAME_AW(D3DXLoadVolumeFromResource)

declare function D3DXLoadVolumeFromFileInMemory(byval destvolume as IDirect3DVolume9 ptr, byval destpalette as const PALETTEENTRY ptr, byval destbox as const D3DBOX ptr, byval srcdata as const any ptr, byval srcdatasize as UINT, byval srcbox as const D3DBOX ptr, byval filter as DWORD, byval colorkey as D3DCOLOR, byval srcinfo as D3DXIMAGE_INFO ptr) as HRESULT
declare function D3DXLoadVolumeFromVolume(byval destvolume as IDirect3DVolume9 ptr, byval destpalette as const PALETTEENTRY ptr, byval destbox as const D3DBOX ptr, byval srcvolume as IDirect3DVolume9 ptr, byval srcpalette as const PALETTEENTRY ptr, byval srcbox as const D3DBOX ptr, byval filter as DWORD, byval colorkey as D3DCOLOR) as HRESULT
declare function D3DXLoadVolumeFromMemory(byval destvolume as IDirect3DVolume9 ptr, byval destpalette as const PALETTEENTRY ptr, byval destbox as const D3DBOX ptr, byval srcmemory as const any ptr, byval srcformat as D3DFORMAT, byval srcrowpitch as UINT, byval srcslicepitch as UINT, byval srcpalette as const PALETTEENTRY ptr, byval srcbox as const D3DBOX ptr, byval filter as DWORD, byval colorkey as D3DCOLOR) as HRESULT
declare function D3DXSaveVolumeToFileA(byval destfile as const zstring ptr, byval destformat as D3DXIMAGE_FILEFORMAT, byval srcvolume as IDirect3DVolume9 ptr, byval srcpalette as const PALETTEENTRY ptr, byval srcbox as const D3DBOX ptr) as HRESULT
declare function D3DXSaveVolumeToFileW(byval destfile as const WCHAR ptr, byval destformat as D3DXIMAGE_FILEFORMAT, byval srcvolume as IDirect3DVolume9 ptr, byval srcpalette as const PALETTEENTRY ptr, byval srcbox as const D3DBOX ptr) as HRESULT

#define D3DXSaveVolumeToFile __MINGW_NAME_AW(D3DXSaveVolumeToFile)

declare function D3DXCheckTextureRequirements(byval device as IDirect3DDevice9 ptr, byval width_ as UINT ptr, byval height as UINT ptr, byval miplevels as UINT ptr, byval usage as DWORD, byval format as D3DFORMAT ptr, byval pool as D3DPOOL) as HRESULT
declare function D3DXCheckCubeTextureRequirements(byval device as IDirect3DDevice9 ptr, byval size as UINT ptr, byval miplevels as UINT ptr, byval usage as DWORD, byval format as D3DFORMAT ptr, byval pool as D3DPOOL) as HRESULT
declare function D3DXCheckVolumeTextureRequirements(byval device as IDirect3DDevice9 ptr, byval width_ as UINT ptr, byval height as UINT ptr, byval depth as UINT ptr, byval miplevels as UINT ptr, byval usage as DWORD, byval format as D3DFORMAT ptr, byval pool as D3DPOOL) as HRESULT
declare function D3DXCreateTexture(byval device as IDirect3DDevice9 ptr, byval width_ as UINT, byval height as UINT, byval miplevels as UINT, byval usage as DWORD, byval format as D3DFORMAT, byval pool as D3DPOOL, byval texture as IDirect3DTexture9 ptr ptr) as HRESULT
declare function D3DXCreateCubeTexture(byval device as IDirect3DDevice9 ptr, byval size as UINT, byval miplevels as UINT, byval usage as DWORD, byval format as D3DFORMAT, byval pool as D3DPOOL, byval cube as IDirect3DCubeTexture9 ptr ptr) as HRESULT
declare function D3DXCreateVolumeTexture(byval device as IDirect3DDevice9 ptr, byval width_ as UINT, byval height as UINT, byval depth as UINT, byval miplevels as UINT, byval usage as DWORD, byval format as D3DFORMAT, byval pool as D3DPOOL, byval volume as IDirect3DVolumeTexture9 ptr ptr) as HRESULT
declare function D3DXCreateTextureFromFileA(byval device as IDirect3DDevice9 ptr, byval srcfile as const zstring ptr, byval texture as IDirect3DTexture9 ptr ptr) as HRESULT
declare function D3DXCreateTextureFromFileW(byval device as IDirect3DDevice9 ptr, byval srcfile as const WCHAR ptr, byval texture as IDirect3DTexture9 ptr ptr) as HRESULT

#define D3DXCreateTextureFromFile __MINGW_NAME_AW(D3DXCreateTextureFromFile)

declare function D3DXCreateCubeTextureFromFileA(byval device as IDirect3DDevice9 ptr, byval srcfile as const zstring ptr, byval cube as IDirect3DCubeTexture9 ptr ptr) as HRESULT
declare function D3DXCreateCubeTextureFromFileW(byval device as IDirect3DDevice9 ptr, byval srcfile as const WCHAR ptr, byval cube as IDirect3DCubeTexture9 ptr ptr) as HRESULT

#define D3DXCreateCubeTextureFromFile __MINGW_NAME_AW(D3DXCreateCubeTextureFromFile)

declare function D3DXCreateVolumeTextureFromFileA(byval device as IDirect3DDevice9 ptr, byval srcfile as const zstring ptr, byval volume as IDirect3DVolumeTexture9 ptr ptr) as HRESULT
declare function D3DXCreateVolumeTextureFromFileW(byval device as IDirect3DDevice9 ptr, byval srcfile as const WCHAR ptr, byval volume as IDirect3DVolumeTexture9 ptr ptr) as HRESULT

#define D3DXCreateVolumeTextureFromFile __MINGW_NAME_AW(D3DXCreateVolumeTextureFromFile)

declare function D3DXCreateTextureFromResourceA(byval device as IDirect3DDevice9 ptr, byval srcmodule as HMODULE, byval resource as const zstring ptr, byval texture as IDirect3DTexture9 ptr ptr) as HRESULT
declare function D3DXCreateTextureFromResourceW(byval device as IDirect3DDevice9 ptr, byval srcmodule as HMODULE, byval resource as const WCHAR ptr, byval texture as IDirect3DTexture9 ptr ptr) as HRESULT

#define D3DXCreateTextureFromResource __MINGW_NAME_AW(D3DXCreateTextureFromResource)

declare function D3DXCreateCubeTextureFromResourceA(byval device as IDirect3DDevice9 ptr, byval srcmodule as HMODULE, byval resource as const zstring ptr, byval cube as IDirect3DCubeTexture9 ptr ptr) as HRESULT
declare function D3DXCreateCubeTextureFromResourceW(byval device as IDirect3DDevice9 ptr, byval srcmodule as HMODULE, byval resource as const WCHAR ptr, byval cube as IDirect3DCubeTexture9 ptr ptr) as HRESULT

#define D3DXCreateCubeTextureFromResource __MINGW_NAME_AW(D3DXCreateCubeTextureFromResource)

declare function D3DXCreateVolumeTextureFromResourceA(byval device as IDirect3DDevice9 ptr, byval srcmodule as HMODULE, byval resource as const zstring ptr, byval volume as IDirect3DVolumeTexture9 ptr ptr) as HRESULT
declare function D3DXCreateVolumeTextureFromResourceW(byval device as IDirect3DDevice9 ptr, byval srcmodule as HMODULE, byval resource as const WCHAR ptr, byval volume as IDirect3DVolumeTexture9 ptr ptr) as HRESULT

#define D3DXCreateVolumeTextureFromResource __MINGW_NAME_AW(D3DXCreateVolumeTextureFromResource)

declare function D3DXCreateTextureFromFileExA(byval device as IDirect3DDevice9 ptr, byval srcfile as const zstring ptr, byval width_ as UINT, byval height as UINT, byval miplevels as UINT, byval usage as DWORD, byval format as D3DFORMAT, byval pool as D3DPOOL, byval filter as DWORD, byval mipfilter as DWORD, byval colorkey as D3DCOLOR, byval srcinfo as D3DXIMAGE_INFO ptr, byval palette_ as PALETTEENTRY ptr, byval texture as IDirect3DTexture9 ptr ptr) as HRESULT
declare function D3DXCreateTextureFromFileExW(byval device as IDirect3DDevice9 ptr, byval srcfile as const WCHAR ptr, byval width_ as UINT, byval height as UINT, byval miplevels as UINT, byval usage as DWORD, byval format as D3DFORMAT, byval pool as D3DPOOL, byval filter as DWORD, byval mipfilter as DWORD, byval colorkey as D3DCOLOR, byval srcinfo as D3DXIMAGE_INFO ptr, byval palette_ as PALETTEENTRY ptr, byval texture as IDirect3DTexture9 ptr ptr) as HRESULT

#define D3DXCreateTextureFromFileEx __MINGW_NAME_AW(D3DXCreateTextureFromFileEx)

declare function D3DXCreateCubeTextureFromFileExA(byval device as IDirect3DDevice9 ptr, byval srcfile as const zstring ptr, byval size as UINT, byval miplevels as UINT, byval usage as DWORD, byval format as D3DFORMAT, byval pool as D3DPOOL, byval filter as DWORD, byval mipfilter as DWORD, byval colorkey as D3DCOLOR, byval srcinfo as D3DXIMAGE_INFO ptr, byval palette_ as PALETTEENTRY ptr, byval cube as IDirect3DCubeTexture9 ptr ptr) as HRESULT
declare function D3DXCreateCubeTextureFromFileExW(byval device as IDirect3DDevice9 ptr, byval srcfile as const WCHAR ptr, byval size as UINT, byval miplevels as UINT, byval usage as DWORD, byval format as D3DFORMAT, byval pool as D3DPOOL, byval filter as DWORD, byval mipfilter as DWORD, byval colorkey as D3DCOLOR, byval srcinfo as D3DXIMAGE_INFO ptr, byval palette_ as PALETTEENTRY ptr, byval cube as IDirect3DCubeTexture9 ptr ptr) as HRESULT

#define D3DXCreateCubeTextureFromFileEx __MINGW_NAME_AW(D3DXCreateCubeTextureFromFileEx)

declare function D3DXCreateVolumeTextureFromFileExA(byval device as IDirect3DDevice9 ptr, byval srcfile as const zstring ptr, byval width_ as UINT, byval height as UINT, byval depth as UINT, byval miplevels as UINT, byval usage as DWORD, byval format as D3DFORMAT, byval pool as D3DPOOL, byval filter as DWORD, byval mipfilter as DWORD, byval colorkey as D3DCOLOR, byval srcinfo as D3DXIMAGE_INFO ptr, byval palette_ as PALETTEENTRY ptr, byval volume as IDirect3DVolumeTexture9 ptr ptr) as HRESULT
declare function D3DXCreateVolumeTextureFromFileExW(byval device as IDirect3DDevice9 ptr, byval srcfile as const WCHAR ptr, byval width_ as UINT, byval height as UINT, byval depth as UINT, byval miplevels as UINT, byval usage as DWORD, byval format as D3DFORMAT, byval pool as D3DPOOL, byval filter as DWORD, byval mipfilter as DWORD, byval colorkey as D3DCOLOR, byval srcinfo as D3DXIMAGE_INFO ptr, byval palette_ as PALETTEENTRY ptr, byval volume as IDirect3DVolumeTexture9 ptr ptr) as HRESULT

#define D3DXCreateVolumeTextureFromFileEx __MINGW_NAME_AW(D3DXCreateVolumeTextureFromFileEx)

declare function D3DXCreateTextureFromResourceExA(byval device as IDirect3DDevice9 ptr, byval srcmodule as HMODULE, byval resource as const zstring ptr, byval width_ as UINT, byval height as UINT, byval miplevels as UINT, byval usage as DWORD, byval format as D3DFORMAT, byval pool as D3DPOOL, byval filter as DWORD, byval mipfilter as DWORD, byval colorkey as D3DCOLOR, byval srcinfo as D3DXIMAGE_INFO ptr, byval palette_ as PALETTEENTRY ptr, byval texture as IDirect3DTexture9 ptr ptr) as HRESULT
declare function D3DXCreateTextureFromResourceExW(byval device as IDirect3DDevice9 ptr, byval srcmodule as HMODULE, byval resource as const WCHAR ptr, byval width_ as UINT, byval height as UINT, byval miplevels as UINT, byval usage as DWORD, byval format as D3DFORMAT, byval pool as D3DPOOL, byval filter as DWORD, byval mipfilter as DWORD, byval colorkey as D3DCOLOR, byval srcinfo as D3DXIMAGE_INFO ptr, byval palette_ as PALETTEENTRY ptr, byval texture as IDirect3DTexture9 ptr ptr) as HRESULT

#define D3DXCreateTextureFromResourceEx __MINGW_NAME_AW(D3DXCreateTextureFromResourceEx)

declare function D3DXCreateCubeTextureFromResourceExA(byval device as IDirect3DDevice9 ptr, byval srcmodule as HMODULE, byval resource as const zstring ptr, byval size as UINT, byval miplevels as UINT, byval usage as DWORD, byval format as D3DFORMAT, byval pool as D3DPOOL, byval filter as DWORD, byval mipfilter as DWORD, byval colorkey as D3DCOLOR, byval srcinfo as D3DXIMAGE_INFO ptr, byval palette_ as PALETTEENTRY ptr, byval cube as IDirect3DCubeTexture9 ptr ptr) as HRESULT
declare function D3DXCreateCubeTextureFromResourceExW(byval device as IDirect3DDevice9 ptr, byval srcmodule as HMODULE, byval resource as const WCHAR ptr, byval size as UINT, byval miplevels as UINT, byval usage as DWORD, byval format as D3DFORMAT, byval pool as D3DPOOL, byval filter as DWORD, byval mipfilter as DWORD, byval colorkey as D3DCOLOR, byval srcinfo as D3DXIMAGE_INFO ptr, byval palette_ as PALETTEENTRY ptr, byval cube as IDirect3DCubeTexture9 ptr ptr) as HRESULT

#define D3DXCreateCubeTextureFromResourceEx __MINGW_NAME_AW(D3DXCreateCubeTextureFromResourceEx)

declare function D3DXCreateVolumeTextureFromResourceExA(byval device as IDirect3DDevice9 ptr, byval srcmodule as HMODULE, byval resource as const zstring ptr, byval width_ as UINT, byval height as UINT, byval depth as UINT, byval miplevels as UINT, byval usage as DWORD, byval format as D3DFORMAT, byval pool as D3DPOOL, byval filter as DWORD, byval mipfilter as DWORD, byval colorkey as D3DCOLOR, byval srcinfo as D3DXIMAGE_INFO ptr, byval palette_ as PALETTEENTRY ptr, byval volume as IDirect3DVolumeTexture9 ptr ptr) as HRESULT
declare function D3DXCreateVolumeTextureFromResourceExW(byval device as IDirect3DDevice9 ptr, byval srcmodule as HMODULE, byval resource as const WCHAR ptr, byval width_ as UINT, byval height as UINT, byval depth as UINT, byval miplevels as UINT, byval usage as DWORD, byval format as D3DFORMAT, byval pool as D3DPOOL, byval filter as DWORD, byval mipfilter as DWORD, byval colorkey as D3DCOLOR, byval srcinfo as D3DXIMAGE_INFO ptr, byval palette_ as PALETTEENTRY ptr, byval volume as IDirect3DVolumeTexture9 ptr ptr) as HRESULT

#define D3DXCreateVolumeTextureFromResourceEx __MINGW_NAME_AW(D3DXCreateVolumeTextureFromResourceEx)

declare function D3DXCreateTextureFromFileInMemory(byval device as IDirect3DDevice9 ptr, byval srcdata as const any ptr, byval srcdatasize as UINT, byval texture as IDirect3DTexture9 ptr ptr) as HRESULT
declare function D3DXCreateCubeTextureFromFileInMemory(byval device as IDirect3DDevice9 ptr, byval srcdata as const any ptr, byval srcdatasize as UINT, byval cube as IDirect3DCubeTexture9 ptr ptr) as HRESULT
declare function D3DXCreateVolumeTextureFromFileInMemory(byval device as IDirect3DDevice9 ptr, byval srcdata as const any ptr, byval srcdatasize as UINT, byval volume as IDirect3DVolumeTexture9 ptr ptr) as HRESULT
declare function D3DXCreateTextureFromFileInMemoryEx(byval device as IDirect3DDevice9 ptr, byval srcdata as const any ptr, byval srcdatasize as UINT, byval width_ as UINT, byval height as UINT, byval miplevels as UINT, byval usage as DWORD, byval format as D3DFORMAT, byval pool as D3DPOOL, byval filter as DWORD, byval mipfilter as DWORD, byval colorkey as D3DCOLOR, byval srcinfo as D3DXIMAGE_INFO ptr, byval palette_ as PALETTEENTRY ptr, byval texture as IDirect3DTexture9 ptr ptr) as HRESULT
declare function D3DXCreateCubeTextureFromFileInMemoryEx(byval device as IDirect3DDevice9 ptr, byval srcdata as const any ptr, byval srcdatasize as UINT, byval size as UINT, byval miplevels as UINT, byval usage as DWORD, byval format as D3DFORMAT, byval pool as D3DPOOL, byval filter as DWORD, byval mipfilter as DWORD, byval colorkey as D3DCOLOR, byval srcinfo as D3DXIMAGE_INFO ptr, byval palette_ as PALETTEENTRY ptr, byval cube as IDirect3DCubeTexture9 ptr ptr) as HRESULT
declare function D3DXCreateVolumeTextureFromFileInMemoryEx(byval device as IDirect3DDevice9 ptr, byval srcdata as const any ptr, byval srcdatasize as UINT, byval width_ as UINT, byval height as UINT, byval depth as UINT, byval miplevels as UINT, byval usage as DWORD, byval format as D3DFORMAT, byval pool as D3DPOOL, byval filter as DWORD, byval mipfilter as DWORD, byval colorkey as D3DCOLOR, byval srcinfo as D3DXIMAGE_INFO ptr, byval palette_ as PALETTEENTRY ptr, byval volume as IDirect3DVolumeTexture9 ptr ptr) as HRESULT
declare function D3DXSaveTextureToFileInMemory(byval destbuffer as ID3DXBuffer ptr ptr, byval destformat as D3DXIMAGE_FILEFORMAT, byval srctexture as IDirect3DBaseTexture9 ptr, byval srcpalette as const PALETTEENTRY ptr) as HRESULT
declare function D3DXSaveTextureToFileA(byval destfile as const zstring ptr, byval destformat as D3DXIMAGE_FILEFORMAT, byval srctexture as IDirect3DBaseTexture9 ptr, byval srcpalette as const PALETTEENTRY ptr) as HRESULT
declare function D3DXSaveTextureToFileW(byval destfile as const WCHAR ptr, byval destformat as D3DXIMAGE_FILEFORMAT, byval srctexture as IDirect3DBaseTexture9 ptr, byval srcpalette as const PALETTEENTRY ptr) as HRESULT

#define D3DXSaveTextureToFile __MINGW_NAME_AW(D3DXSaveTextureToFile)

declare function D3DXFilterTexture(byval texture as IDirect3DBaseTexture9 ptr, byval palette_ as const PALETTEENTRY ptr, byval srclevel as UINT, byval filter as DWORD) as HRESULT

#define D3DXFilterCubeTexture D3DXFilterTexture
#define D3DXFilterVolumeTexture D3DXFilterTexture

declare function D3DXFillTexture(byval texture as IDirect3DTexture9 ptr, byval function_ as LPD3DXFILL2D, byval data_ as any ptr) as HRESULT
declare function D3DXFillCubeTexture(byval cube as IDirect3DCubeTexture9 ptr, byval function_ as LPD3DXFILL3D, byval data_ as any ptr) as HRESULT
declare function D3DXFillVolumeTexture(byval volume as IDirect3DVolumeTexture9 ptr, byval function_ as LPD3DXFILL3D, byval data_ as any ptr) as HRESULT
declare function D3DXFillTextureTX(byval texture as IDirect3DTexture9 ptr, byval function_ as const DWORD ptr, byval constants as const D3DXVECTOR4 ptr, byval numconstants as UINT) as HRESULT
declare function D3DXFillCubeTextureTX(byval cube as IDirect3DCubeTexture9 ptr, byval function_ as const DWORD ptr, byval constants as const D3DXVECTOR4 ptr, byval numconstants as UINT) as HRESULT
declare function D3DXFillVolumeTextureTX(byval volume as IDirect3DVolumeTexture9 ptr, byval function_ as const DWORD ptr, byval constants as const D3DXVECTOR4 ptr, byval numconstants as UINT) as HRESULT
declare function D3DXComputeNormalMap(byval texture as IDirect3DTexture9 ptr, byval srctexture as IDirect3DTexture9 ptr, byval srcpalette as const PALETTEENTRY ptr, byval flags as DWORD, byval channel as DWORD, byval amplitude as single) as HRESULT

end extern
