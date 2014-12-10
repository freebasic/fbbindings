#pragma once

#include once "minwindef.bi"

'' The following symbols have been renamed:
''     typedef POINT => POINT_

#define _WINDEF_

type HWND__
	unused as long
end type

type HWND as HWND__ ptr

type HHOOK__
	unused as long
end type

type HHOOK as HHOOK__ ptr
type HGDIOBJ as any ptr

type HACCEL__
	unused as long
end type

type HACCEL as HACCEL__ ptr

type HBITMAP__
	unused as long
end type

type HBITMAP as HBITMAP__ ptr

type HBRUSH__
	unused as long
end type

type HBRUSH as HBRUSH__ ptr

type HCOLORSPACE__
	unused as long
end type

type HCOLORSPACE as HCOLORSPACE__ ptr

type HDC__
	unused as long
end type

type HDC as HDC__ ptr

type HGLRC__
	unused as long
end type

type HGLRC as HGLRC__ ptr

type HDESK__
	unused as long
end type

type HDESK as HDESK__ ptr

type HENHMETAFILE__
	unused as long
end type

type HENHMETAFILE as HENHMETAFILE__ ptr

type HFONT__
	unused as long
end type

type HFONT as HFONT__ ptr

type HICON__
	unused as long
end type

type HICON as HICON__ ptr

type HMENU__
	unused as long
end type

type HMENU as HMENU__ ptr

type HPALETTE__
	unused as long
end type

type HPALETTE as HPALETTE__ ptr

type HPEN__
	unused as long
end type

type HPEN as HPEN__ ptr

type HMONITOR__
	unused as long
end type

type HMONITOR as HMONITOR__ ptr

type HWINEVENTHOOK__
	unused as long
end type

type HWINEVENTHOOK as HWINEVENTHOOK__ ptr
type HCURSOR as HICON
type COLORREF as DWORD

type HUMPD__
	unused as long
end type

type HUMPD as HUMPD__ ptr
type LPCOLORREF as DWORD ptr

#define HFILE_ERROR cast(HFILE, -1)

type tagRECT
	left as LONG_
	top as LONG_
	right as LONG_
	bottom as LONG_
end type

type RECT as tagRECT
type PRECT as tagRECT ptr
type NPRECT as tagRECT ptr
type LPRECT as tagRECT ptr
type LPCRECT as const RECT ptr

type _RECTL
	left as LONG_
	top as LONG_
	right as LONG_
	bottom as LONG_
end type

type RECTL as _RECTL
type PRECTL as _RECTL ptr
type LPRECTL as _RECTL ptr
type LPCRECTL as const RECTL ptr

type tagPOINT
	x as LONG_
	y as LONG_
end type

type POINT_ as tagPOINT
type PPOINT as tagPOINT ptr
type NPPOINT as tagPOINT ptr
type LPPOINT as tagPOINT ptr

type _POINTL
	x as LONG_
	y as LONG_
end type

type POINTL as _POINTL
type PPOINTL as _POINTL ptr

type tagSIZE
	cx as LONG_
	cy as LONG_
end type

type SIZE as tagSIZE
type PSIZE as tagSIZE ptr
type LPSIZE as tagSIZE ptr
type SIZEL as SIZE
type PSIZEL as SIZE ptr
type LPSIZEL as SIZE ptr

type tagPOINTS
	x as SHORT_
	y as SHORT_
end type

type POINTS as tagPOINTS
type PPOINTS as tagPOINTS ptr
type LPPOINTS as tagPOINTS ptr

#define DM_UPDATE 1
#define DM_COPY 2
#define DM_PROMPT 4
#define DM_MODIFY 8
#define DM_IN_BUFFER DM_MODIFY
#define DM_IN_PROMPT DM_PROMPT
#define DM_OUT_BUFFER DM_COPY
#define DM_OUT_DEFAULT DM_UPDATE
#define DC_FIELDS 1
#define DC_PAPERS 2
#define DC_PAPERSIZE 3
#define DC_MINEXTENT 4
#define DC_MAXEXTENT 5
#define DC_BINS 6
#define DC_DUPLEX 7
#define DC_SIZE 8
#define DC_EXTRA 9
#define DC_VERSION 10
#define DC_DRIVER 11
#define DC_BINNAMES 12
#define DC_ENUMRESOLUTIONS 13
#define DC_FILEDEPENDENCIES 14
#define DC_TRUETYPE 15
#define DC_PAPERNAMES 16
#define DC_ORIENTATION 17
#define DC_COPIES 18
