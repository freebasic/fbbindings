'' FreeBASIC binding for mingw-w64-v3.3.0

#pragma once

#include once "crt/stddef.bi"
#include once "d3dtypes.bi"

#ifdef __FB_64BIT__
	extern "C"
#else
	extern "Windows"
#endif

#define __D3DRMDEFS_H__

type _D3DRMVECTOR4D
	x as D3DVALUE
	y as D3DVALUE
	z as D3DVALUE
	w as D3DVALUE
end type

type D3DRMVECTOR4D as _D3DRMVECTOR4D
type LPD3DRMVECTOR4D as _D3DRMVECTOR4D ptr

type _D3DRMQUATERNION
	s as D3DVALUE
	v as D3DVECTOR
end type

type D3DRMQUATERNION as _D3DRMQUATERNION
type LPD3DRMQUATERNION as _D3DRMQUATERNION ptr

type _D3DRMRAY
	dvDir as D3DVECTOR
	dvPos as D3DVECTOR
end type

type D3DRMRAY as _D3DRMRAY
type LPD3DRMRAY as _D3DRMRAY ptr

type _D3DRMBOX
	min as D3DVECTOR
	max as D3DVECTOR
end type

type D3DRMBOX as _D3DRMBOX
type LPD3DRMBOX as _D3DRMBOX ptr
type D3DRMWRAPCALLBACK as sub cdecl(byval vec as D3DVECTOR ptr, byval u as long ptr, byval v as long ptr, byval a as D3DVECTOR ptr, byval b as D3DVECTOR ptr, byval ctx as any ptr)

type _D3DRMLIGHTTYPE as long
enum
	D3DRMLIGHT_AMBIENT
	D3DRMLIGHT_POINT
	D3DRMLIGHT_SPOT
	D3DRMLIGHT_DIRECTIONAL
	D3DRMLIGHT_PARALLELPOINT
end enum

type D3DRMLIGHTTYPE as _D3DRMLIGHTTYPE
type LPD3DRMLIGHTTYPE as _D3DRMLIGHTTYPE ptr

type _D3DRMSHADEMODE as long
enum
	D3DRMSHADE_FLAT = 0
	D3DRMSHADE_GOURAUD = 1
	D3DRMSHADE_PHONG = 2
	D3DRMSHADE_MASK = 7
	D3DRMSHADE_MAX = 8
end enum

type D3DRMSHADEMODE as _D3DRMSHADEMODE
type LPD3DRMSHADEMODE as _D3DRMSHADEMODE ptr

type _D3DRMLIGHTMODE as long
enum
	D3DRMLIGHT_OFF = 0 * D3DRMSHADE_MAX
	D3DRMLIGHT_ON = 1 * D3DRMSHADE_MAX
	D3DRMLIGHT_MASK = 7 * D3DRMSHADE_MAX
	D3DRMLIGHT_MAX = 8 * D3DRMSHADE_MAX
end enum

type D3DRMLIGHTMODE as _D3DRMLIGHTMODE
type LPD3DRMLIGHTMODE as _D3DRMLIGHTMODE ptr

type _D3DRMFILLMODE as long
enum
	D3DRMFILL_POINTS = 0 * D3DRMLIGHT_MAX
	D3DRMFILL_WIREFRAME = 1 * D3DRMLIGHT_MAX
	D3DRMFILL_SOLID = 2 * D3DRMLIGHT_MAX
	D3DRMFILL_MASK = 7 * D3DRMLIGHT_MAX
	D3DRMFILL_MAX = 8 * D3DRMLIGHT_MAX
end enum

type D3DRMFILLMODE as _D3DRMFILLMODE
type LPD3DRMFILLMODE as _D3DRMFILLMODE ptr
type D3DRMRENDERQUALITY as DWORD
type LPD3DRMRENDERQUALITY as DWORD ptr

#define D3DRMRENDER_WIREFRAME ((D3DRMSHADE_FLAT + D3DRMLIGHT_OFF) + D3DRMFILL_WIREFRAME)
#define D3DRMRENDER_UNLITFLAT ((D3DRMSHADE_FLAT + D3DRMLIGHT_OFF) + D3DRMFILL_SOLID)
#define D3DRMRENDER_FLAT ((D3DRMSHADE_FLAT + D3DRMLIGHT_ON) + D3DRMFILL_SOLID)
#define D3DRMRENDER_GOURAUD ((D3DRMSHADE_GOURAUD + D3DRMLIGHT_ON) + D3DRMFILL_SOLID)
#define D3DRMRENDER_PHONG ((D3DRMSHADE_PHONG + D3DRMLIGHT_ON) + D3DRMFILL_SOLID)
const D3DRMRENDERMODE_BLENDEDTRANSPARENCY = 1
const D3DRMRENDERMODE_SORTEDTRANSPARENCY = 2
const D3DRMRENDERMODE_LIGHTINMODELSPACE = 8
const D3DRMRENDERMODE_VIEWDEPENDENTSPECULAR = 16
const D3DRMRENDERMODE_DISABLESORTEDALPHAZWRITE = 32

type _D3DRMTEXTUREQUALITY as long
enum
	D3DRMTEXTURE_NEAREST
	D3DRMTEXTURE_LINEAR
	D3DRMTEXTURE_MIPNEAREST
	D3DRMTEXTURE_MIPLINEAR
	D3DRMTEXTURE_LINEARMIPNEAREST
	D3DRMTEXTURE_LINEARMIPLINEAR
end enum

type D3DRMTEXTUREQUALITY as _D3DRMTEXTUREQUALITY
type LPD3DRMTEXTUREQUALITY as _D3DRMTEXTUREQUALITY ptr
const D3DRMTEXTURE_FORCERESIDENT = &h00000001
const D3DRMTEXTURE_STATIC = &h00000002
const D3DRMTEXTURE_DOWNSAMPLEPOINT = &h00000004
const D3DRMTEXTURE_DOWNSAMPLEBILINEAR = &h00000008
const D3DRMTEXTURE_DOWNSAMPLEREDUCEDEPTH = &h00000010
const D3DRMTEXTURE_DOWNSAMPLENONE = &h00000020
const D3DRMTEXTURE_CHANGEDPIXELS = &h00000040
const D3DRMTEXTURE_CHANGEDPALETTE = &h00000080
const D3DRMTEXTURE_INVALIDATEONLY = &h00000100
const D3DRMSHADOW_TRUEALPHA = &h00000001

type _D3DRMCOMBINETYPE as long
enum
	D3DRMCOMBINE_REPLACE
	D3DRMCOMBINE_BEFORE
	D3DRMCOMBINE_AFTER
end enum

type D3DRMCOMBINETYPE as _D3DRMCOMBINETYPE
type LPD3DRMCOMBINETYPE as _D3DRMCOMBINETYPE ptr
type D3DRMCOLORMODEL as D3DCOLORMODEL
type LPD3DRMCOLORMODEL as D3DCOLORMODEL ptr

type _D3DRMPALETTEFLAGS as long
enum
	D3DRMPALETTE_FREE
	D3DRMPALETTE_READONLY
	D3DRMPALETTE_RESERVED
end enum

type D3DRMPALETTEFLAGS as _D3DRMPALETTEFLAGS
type LPD3DRMPALETTEFLAGS as _D3DRMPALETTEFLAGS ptr

type _D3DRMPALETTEENTRY
	red as ubyte
	green as ubyte
	blue as ubyte
	flags as ubyte
end type

type D3DRMPALETTEENTRY as _D3DRMPALETTEENTRY
type LPD3DRMPALETTEENTRY as _D3DRMPALETTEENTRY ptr

type _D3DRMIMAGE
	width as long
	height as long
	aspectx as long
	aspecty as long
	depth as long
	rgb as long
	bytes_per_line as long
	buffer1 as any ptr
	buffer2 as any ptr
	red_mask as ULONG
	green_mask as ULONG
	blue_mask as ULONG
	alpha_mask as ULONG
	palette_size as long
	palette as D3DRMPALETTEENTRY ptr
end type

type D3DRMIMAGE as _D3DRMIMAGE
type LPD3DRMIMAGE as _D3DRMIMAGE ptr

type _D3DRMWRAPTYPE as long
enum
	D3DRMWRAP_FLAT
	D3DRMWRAP_CYLINDER
	D3DRMWRAP_SPHERE
	D3DRMWRAP_CHROME
	D3DRMWRAP_SHEET
	D3DRMWRAP_BOX
end enum

type D3DRMWRAPTYPE as _D3DRMWRAPTYPE
type LPD3DRMWRAPTYPE as _D3DRMWRAPTYPE ptr
const D3DRMWIREFRAME_CULL = 1
const D3DRMWIREFRAME_HIDDENLINE = 2

type _D3DRMPROJECTIONTYPE as long
enum
	D3DRMPROJECT_PERSPECTIVE
	D3DRMPROJECT_ORTHOGRAPHIC
	D3DRMPROJECT_RIGHTHANDPERSPECTIVE
	D3DRMPROJECT_RIGHTHANDORTHOGRAPHIC
end enum

type D3DRMPROJECTIONTYPE as _D3DRMPROJECTIONTYPE
type LPD3DRMPROJECTIONTYPE as _D3DRMPROJECTIONTYPE ptr
const D3DRMOPTIONS_LEFTHANDED = &h00000001
const D3DRMOPTIONS_RIGHTHANDED = &h00000002

type _D3DRMXOFFORMAT as long
enum
	D3DRMXOF_BINARY
	D3DRMXOF_COMPRESSED
	D3DRMXOF_TEXT
end enum

type D3DRMXOFFORMAT as _D3DRMXOFFORMAT
type LPD3DRMXOFFORMAT as _D3DRMXOFFORMAT ptr
type D3DRMSAVEOPTIONS as DWORD

const D3DRMXOFSAVE_NORMALS = 1
const D3DRMXOFSAVE_TEXTURECOORDINATES = 2
const D3DRMXOFSAVE_MATERIALS = 4
const D3DRMXOFSAVE_TEXTURENAMES = 8
const D3DRMXOFSAVE_ALL = 15
const D3DRMXOFSAVE_TEMPLATES = 16
const D3DRMXOFSAVE_TEXTURETOPOLOGY = 32

type _D3DRMCOLORSOURCE as long
enum
	D3DRMCOLOR_FROMFACE
	D3DRMCOLOR_FROMVERTEX
end enum

type D3DRMCOLORSOURCE as _D3DRMCOLORSOURCE
type LPD3DRMCOLORSOURCE as _D3DRMCOLORSOURCE ptr

type _D3DRMFRAMECONSTRAINT as long
enum
	D3DRMCONSTRAIN_Z
	D3DRMCONSTRAIN_Y
	D3DRMCONSTRAIN_X
end enum

type D3DRMFRAMECONSTRAINT as _D3DRMFRAMECONSTRAINT
type LPD3DRMFRAMECONSTRAINT as _D3DRMFRAMECONSTRAINT ptr

type _D3DRMMATERIALMODE as long
enum
	D3DRMMATERIAL_FROMMESH
	D3DRMMATERIAL_FROMPARENT
	D3DRMMATERIAL_FROMFRAME
end enum

type D3DRMMATERIALMODE as _D3DRMMATERIALMODE
type LPD3DRMMATERIALMODE as _D3DRMMATERIALMODE ptr

type _D3DRMFOGMODE as long
enum
	D3DRMFOG_LINEAR
	D3DRMFOG_EXPONENTIAL
	D3DRMFOG_EXPONENTIALSQUARED
end enum

type D3DRMFOGMODE as _D3DRMFOGMODE
type LPD3DRMFOGMODE as _D3DRMFOGMODE ptr

type _D3DRMZBUFFERMODE as long
enum
	D3DRMZBUFFER_FROMPARENT
	D3DRMZBUFFER_ENABLE
	D3DRMZBUFFER_DISABLE
end enum

type D3DRMZBUFFERMODE as _D3DRMZBUFFERMODE
type LPD3DRMZBUFFERMODE as _D3DRMZBUFFERMODE ptr

type _D3DRMSORTMODE as long
enum
	D3DRMSORT_FROMPARENT
	D3DRMSORT_NONE
	D3DRMSORT_FRONTTOBACK
	D3DRMSORT_BACKTOFRONT
end enum

type D3DRMSORTMODE as _D3DRMSORTMODE
type LPD3DRMSORTMODE as _D3DRMSORTMODE ptr

type _D3DRMMATERIALOVERRIDE
	dwSize as DWORD
	dwFlags as DWORD
	dcDiffuse as D3DCOLORVALUE
	dcAmbient as D3DCOLORVALUE
	dcEmissive as D3DCOLORVALUE
	dcSpecular as D3DCOLORVALUE
	dvPower as D3DVALUE
	lpD3DRMTex as IUnknown ptr
end type

type D3DRMMATERIALOVERRIDE as _D3DRMMATERIALOVERRIDE
type LPD3DRMMATERIALOVERRIDE as _D3DRMMATERIALOVERRIDE ptr
const D3DRMMATERIALOVERRIDE_DIFFUSE_ALPHAONLY = &h00000001
const D3DRMMATERIALOVERRIDE_DIFFUSE_RGBONLY = &h00000002
const D3DRMMATERIALOVERRIDE_DIFFUSE = &h00000003
const D3DRMMATERIALOVERRIDE_AMBIENT = &h00000004
const D3DRMMATERIALOVERRIDE_EMISSIVE = &h00000008
const D3DRMMATERIALOVERRIDE_SPECULAR = &h00000010
const D3DRMMATERIALOVERRIDE_POWER = &h00000020
const D3DRMMATERIALOVERRIDE_TEXTURE = &h00000040
const D3DRMMATERIALOVERRIDE_DIFFUSE_ALPHAMULTIPLY = &h00000080
const D3DRMMATERIALOVERRIDE_ALL = &h000000FF
const D3DRMFPTF_ALPHA = &h00000001
const D3DRMFPTF_NOALPHA = &h00000002
const D3DRMFPTF_PALETTIZED = &h00000004
const D3DRMFPTF_NOTPALETTIZED = &h00000008
const D3DRMSTATECHANGE_UPDATEONLY = &h000000001
const D3DRMSTATECHANGE_VOLATILE = &h000000002
const D3DRMSTATECHANGE_NONVOLATILE = &h000000004
const D3DRMSTATECHANGE_RENDER = &h000000020
const D3DRMSTATECHANGE_LIGHT = &h000000040
const D3DRMDEVICE_NOZBUFFER = &h00000001
const D3DRMCALLBACK_PREORDER = 0
const D3DRMCALLBACK_POSTORDER = 1
const D3DRMRAYPICK_ONLYBOUNDINGBOXES = &h01
const D3DRMRAYPICK_IGNOREFURTHERPRIMITIVES = &h02
const D3DRMRAYPICK_INTERPOLATEUV = &h04
const D3DRMRAYPICK_INTERPOLATECOLOR = &h08
const D3DRMRAYPICK_INTERPOLATENORMAL = &h10
const D3DRMADDFACES_VERTICESONLY = 1
const D3DRMGENERATENORMALS_PRECOMPACT = 1
const D3DRMGENERATENORMALS_USECREASEANGLE = 2
const D3DRMMESHBUILDER_DIRECTPARENT = 1
const D3DRMMESHBUILDER_ROOTMESH = 2
const D3DRMMESHBUILDER_RENDERENABLE = &h00000001
const D3DRMMESHBUILDER_PICKENABLE = &h00000002
const D3DRMADDMESHBUILDER_DONTCOPYAPPDATA = 1
const D3DRMADDMESHBUILDER_FLATTENSUBMESHES = 2
const D3DRMADDMESHBUILDER_NOSUBMESHES = 4
const D3DRMMESHBUILDERAGE_GEOMETRY = &h00000001
const D3DRMMESHBUILDERAGE_MATERIALS = &h00000002
const D3DRMMESHBUILDERAGE_TEXTURES = &h00000004
const D3DRMFVF_TYPE = &h00000001
const D3DRMFVF_NORMAL = &h00000002
const D3DRMFVF_COLOR = &h00000004
const D3DRMFVF_TEXTURECOORDS = &h00000008
const D3DRMVERTEX_STRIP = &h00000001
const D3DRMVERTEX_FAN = &h00000002
const D3DRMVERTEX_LIST = &h00000004
const D3DRMCLEAR_TARGET = &h00000001
const D3DRMCLEAR_ZBUFFER = &h00000002
const D3DRMCLEAR_DIRTYRECTS = &h00000004
#define D3DRMCLEAR_ALL ((D3DRMCLEAR_TARGET or D3DRMCLEAR_ZBUFFER) or D3DRMCLEAR_DIRTYRECTS)
const D3DRMFOGMETHOD_VERTEX = &h00000001
const D3DRMFOGMETHOD_TABLE = &h00000002
const D3DRMFOGMETHOD_ANY = &h00000004
const D3DRMFRAME_RENDERENABLE = &h00000001
const D3DRMFRAME_PICKENABLE = &h00000002
type D3DRMANIMATIONOPTIONS as DWORD
const D3DRMANIMATION_OPEN = &h00000001
const D3DRMANIMATION_CLOSED = &h00000002
const D3DRMANIMATION_LINEARPOSITION = &h00000004
const D3DRMANIMATION_SPLINEPOSITION = &h00000008
const D3DRMANIMATION_SCALEANDROTATION = &h00000010
const D3DRMANIMATION_POSITION = &h00000020
type D3DRMINTERPOLATIONOPTIONS as DWORD
const D3DRMINTERPOLATION_OPEN = &h0001
const D3DRMINTERPOLATION_CLOSED = &h0002
const D3DRMINTERPOLATION_NEAREST = &h0100
const D3DRMINTERPOLATION_LINEAR = &h0004
const D3DRMINTERPOLATION_SPLINE = &h0008
const D3DRMINTERPOLATION_VERTEXCOLOR = &h0040
const D3DRMINTERPOLATION_SLERPNORMALS = &h0080
type D3DRMLOADOPTIONS as DWORD
#define D3DRMLOAD_FROMFILE __MSABI_LONG(&h000)
#define D3DRMLOAD_FROMRESOURCE __MSABI_LONG(&h001)
#define D3DRMLOAD_FROMMEMORY __MSABI_LONG(&h002)
#define D3DRMLOAD_FROMSTREAM __MSABI_LONG(&h004)
#define D3DRMLOAD_FROMURL __MSABI_LONG(&h008)
#define D3DRMLOAD_BYNAME __MSABI_LONG(&h010)
#define D3DRMLOAD_BYPOSITION __MSABI_LONG(&h020)
#define D3DRMLOAD_BYGUID __MSABI_LONG(&h040)
#define D3DRMLOAD_FIRST __MSABI_LONG(&h080)
#define D3DRMLOAD_INSTANCEBYREFERENCE __MSABI_LONG(&h100)
#define D3DRMLOAD_INSTANCEBYCOPYING __MSABI_LONG(&h200)
#define D3DRMLOAD_ASYNCHRONOUS __MSABI_LONG(&h400)

type _D3DRMLOADRESOURCE
	hModule as HMODULE
	lpName as const zstring ptr
	lpType as const zstring ptr
end type

type D3DRMLOADRESOURCE as _D3DRMLOADRESOURCE
type LPD3DRMLOADRESOURCE as _D3DRMLOADRESOURCE ptr

type _D3DRMLOADMEMORY
	lpMemory as any ptr
	dSize as DWORD
end type

type D3DRMLOADMEMORY as _D3DRMLOADMEMORY
type LPD3DRMLOADMEMORY as _D3DRMLOADMEMORY ptr
const D3DRMPMESHSTATUS_VALID = &h01
const D3DRMPMESHSTATUS_INTERRUPTED = &h02
const D3DRMPMESHSTATUS_BASEMESHCOMPLETE = &h04
const D3DRMPMESHSTATUS_COMPLETE = &h08
const D3DRMPMESHSTATUS_RENDERABLE = &h10
const D3DRMPMESHEVENT_BASEMESH = &h01
const D3DRMPMESHEVENT_COMPLETE = &h02

type _D3DRMPMESHLOADSTATUS
	dwSize as DWORD
	dwPMeshSize as DWORD
	dwBaseMeshSize as DWORD
	dwBytesLoaded as DWORD
	dwVerticesLoaded as DWORD
	dwFacesLoaded as DWORD
	dwLoadResult as HRESULT
	dwFlags as DWORD
end type

type D3DRMPMESHLOADSTATUS as _D3DRMPMESHLOADSTATUS
type LPD3DRMPMESHLOADSTATUS as _D3DRMPMESHLOADSTATUS ptr

type _D3DRMUSERVISUALREASON as long
enum
	D3DRMUSERVISUAL_CANSEE
	D3DRMUSERVISUAL_RENDER
end enum

type D3DRMUSERVISUALREASON as _D3DRMUSERVISUALREASON
type LPD3DRMUSERVISUALREASON as _D3DRMUSERVISUALREASON ptr

type _D3DRMANIMATIONKEY
	dwSize as DWORD
	dwKeyType as DWORD
	dvTime as D3DVALUE
	dwID as DWORD

	union
		dqRotateKey as D3DRMQUATERNION
		dvScaleKey as D3DVECTOR
		dvPositionKey as D3DVECTOR
	end union
end type

type D3DRMANIMATIONKEY as _D3DRMANIMATIONKEY
type LPD3DRMANIMATIONKEY as D3DRMANIMATIONKEY ptr
const D3DRMANIMATION_ROTATEKEY = &h01
const D3DRMANIMATION_SCALEKEY = &h02
const D3DRMANIMATION_POSITIONKEY = &h03

type D3DRMMAPPING as DWORD
type D3DRMMAPPINGFLAG as DWORD
type LPD3DRMMAPPING as DWORD ptr

dim shared D3DRMMAP_WRAPU as const D3DRMMAPPINGFLAG = 1
dim shared D3DRMMAP_WRAPV as const D3DRMMAPPINGFLAG = 2
dim shared D3DRMMAP_PERSPCORRECT as const D3DRMMAPPINGFLAG = 4

type _D3DRMVERTEX
	position as D3DVECTOR
	normal as D3DVECTOR
	tu as D3DVALUE
	tv as D3DVALUE
	color as D3DCOLOR
end type

type D3DRMVERTEX as _D3DRMVERTEX
type LPD3DRMVERTEX as _D3DRMVERTEX ptr
type D3DRMGROUPINDEX as LONG
dim shared D3DRMGROUP_ALLGROUPS as const D3DRMGROUPINDEX = -1

declare sub D3DRMMatrixFromQuaternion(byval m as D3DVALUE ptr, byval q as D3DRMQUATERNION ptr)
declare function D3DRMQuaternionFromRotation(byval x as D3DRMQUATERNION ptr, byval axis as D3DVECTOR ptr, byval theta as D3DVALUE) as D3DRMQUATERNION ptr
declare function D3DRMQuaternionMultiply(byval ret as D3DRMQUATERNION ptr, byval x as D3DRMQUATERNION ptr, byval y as D3DRMQUATERNION ptr) as D3DRMQUATERNION ptr
declare function D3DRMQuaternionSlerp(byval ret as D3DRMQUATERNION ptr, byval x as D3DRMQUATERNION ptr, byval y as D3DRMQUATERNION ptr, byval alpha as D3DVALUE) as D3DRMQUATERNION ptr
declare function D3DRMVectorAdd(byval ret as D3DVECTOR ptr, byval x as D3DVECTOR ptr, byval y as D3DVECTOR ptr) as D3DVECTOR ptr
declare function D3DRMVectorCrossProduct(byval ret as D3DVECTOR ptr, byval x as D3DVECTOR ptr, byval y as D3DVECTOR ptr) as D3DVECTOR ptr
declare function D3DRMVectorDotProduct(byval x as D3DVECTOR ptr, byval y as D3DVECTOR ptr) as D3DVALUE
declare function D3DRMVectorNormalize(byval x as D3DVECTOR ptr) as D3DVECTOR ptr
#define D3DRMVectorNormalise D3DRMVectorNormalize
declare function D3DRMVectorModulus(byval x as D3DVECTOR ptr) as D3DVALUE
declare function D3DRMVectorRandom(byval ret as D3DVECTOR ptr) as D3DVECTOR ptr
declare function D3DRMVectorRotate(byval ret as D3DVECTOR ptr, byval x as D3DVECTOR ptr, byval axis as D3DVECTOR ptr, byval theta as D3DVALUE) as D3DVECTOR ptr
declare function D3DRMVectorReflect(byval ret as D3DVECTOR ptr, byval ray as D3DVECTOR ptr, byval normal as D3DVECTOR ptr) as D3DVECTOR ptr
declare function D3DRMVectorScale(byval ret as D3DVECTOR ptr, byval x as D3DVECTOR ptr, byval scale as D3DVALUE) as D3DVECTOR ptr
declare function D3DRMVectorSubtract(byval ret as D3DVECTOR ptr, byval x as D3DVECTOR ptr, byval y as D3DVECTOR ptr) as D3DVECTOR ptr
declare function D3DRMCreateColorRGB(byval as D3DVALUE, byval as D3DVALUE, byval as D3DVALUE) as D3DCOLOR
declare function D3DRMCreateColorRGBA(byval as D3DVALUE, byval as D3DVALUE, byval as D3DVALUE, byval as D3DVALUE) as D3DCOLOR
declare function D3DRMColorGetAlpha(byval as D3DCOLOR) as D3DVALUE
declare function D3DRMColorGetBlue(byval as D3DCOLOR) as D3DVALUE
declare function D3DRMColorGetGreen(byval as D3DCOLOR) as D3DVALUE
declare function D3DRMColorGetRed(byval as D3DCOLOR) as D3DVALUE

end extern
