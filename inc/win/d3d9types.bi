'' FreeBASIC binding for mingw-w64-v3.3.0

#pragma once

#define __WINE_D3D9TYPES_H
#define D3DCOLOR_ARGB(a, r, g, b) cast(D3DCOLOR, (((((a) and &hff) shl 24) or (((r) and &hff) shl 16)) or (((g) and &hff) shl 8)) or ((b) and &hff))
#define D3DCOLOR_COLORVALUE(r, g, b, a) D3DCOLOR_RGBA(cast(DWORD, (r) * 255.f), cast(DWORD, (g) * 255.f), cast(DWORD, (b) * 255.f), cast(DWORD, (a) * 255.f))
#define D3DCOLOR_RGBA(r, g, b, a) D3DCOLOR_ARGB(a, r, g, b)
#define D3DCOLOR_XRGB(r, g, b) D3DCOLOR_ARGB(&hff, r, g, b)
#define D3DCOLOR_XYUV(y, u, v) D3DCOLOR_ARGB(&hFF, y, u, v)
#define D3DCOLOR_AYUV(a, y, u, v) D3DCOLOR_ARGB(a, y, u, v)
#define D3DCS_LEFT __MSABI_LONG(&h001)
#define D3DCS_RIGHT __MSABI_LONG(&h002)
#define D3DCS_TOP __MSABI_LONG(&h004)
#define D3DCS_BOTTOM __MSABI_LONG(&h008)
#define D3DCS_FRONT __MSABI_LONG(&h010)
#define D3DCS_BACK __MSABI_LONG(&h020)
#define D3DCS_PLANE0 __MSABI_LONG(&h040)
#define D3DCS_PLANE1 __MSABI_LONG(&h080)
#define D3DCS_PLANE2 __MSABI_LONG(&h100)
#define D3DCS_PLANE3 __MSABI_LONG(&h200)
#define D3DCS_PLANE4 __MSABI_LONG(&h400)
#define D3DCS_PLANE5 __MSABI_LONG(&h800)
#define D3DCS_ALL __MSABI_LONG(&hFFF)
const D3DLOCK_READONLY = &h0010
const D3DLOCK_NOSYSLOCK = &h0800
const D3DLOCK_NOOVERWRITE = &h1000
const D3DLOCK_DISCARD = &h2000
const D3DLOCK_DONOTWAIT = &h4000
const D3DLOCK_NO_DIRTY_UPDATE = &h8000
const D3DTSS_TCI_SPHEREMAP = &h40000
#define D3DTS_WORLD D3DTS_WORLDMATRIX(0)
#define D3DTS_WORLD1 D3DTS_WORLDMATRIX(1)
#define D3DTS_WORLD2 D3DTS_WORLDMATRIX(2)
#define D3DTS_WORLD3 D3DTS_WORLDMATRIX(3)
#define D3DTS_WORLDMATRIX(index) cast(D3DTRANSFORMSTATETYPE, index + 256)
#define D3DUSAGE_RENDERTARGET __MSABI_LONG(&h00000001)
#define D3DUSAGE_DEPTHSTENCIL __MSABI_LONG(&h00000002)
#define D3DUSAGE_WRITEONLY __MSABI_LONG(&h00000008)
#define D3DUSAGE_SOFTWAREPROCESSING __MSABI_LONG(&h00000010)
#define D3DUSAGE_DONOTCLIP __MSABI_LONG(&h00000020)
#define D3DUSAGE_POINTS __MSABI_LONG(&h00000040)
#define D3DUSAGE_RTPATCHES __MSABI_LONG(&h00000080)
#define D3DUSAGE_NPATCHES __MSABI_LONG(&h00000100)
#define D3DUSAGE_DYNAMIC __MSABI_LONG(&h00000200)
#define D3DUSAGE_AUTOGENMIPMAP __MSABI_LONG(&h00000400)
#define D3DUSAGE_DMAP __MSABI_LONG(&h00004000)
#define D3DUSAGE_QUERY_FILTER __MSABI_LONG(&h00020000)
#define D3DUSAGE_QUERY_LEGACYBUMPMAP __MSABI_LONG(&h00008000)
#define D3DUSAGE_QUERY_POSTPIXELSHADER_BLENDING __MSABI_LONG(&h00080000)
#define D3DUSAGE_QUERY_SRGBREAD __MSABI_LONG(&h00010000)
#define D3DUSAGE_QUERY_SRGBWRITE __MSABI_LONG(&h00040000)
#define D3DUSAGE_QUERY_VERTEXTEXTURE __MSABI_LONG(&h00100000)
#define D3DUSAGE_QUERY_WRAPANDMIP __MSABI_LONG(&h00200000)
const D3DWRAP_W = 4
const MAX_DEVICE_IDENTIFIER_STRING = 512
const D3DFVF_XYZW = &h4002
const D3DFVF_PSIZE = &h0020
const D3DFVF_LASTBETA_UBYTE4 = &h1000
const D3DFVF_LASTBETA_D3DCOLOR = &h8000
const D3DTA_TEMP = &h00000005
const D3DTA_CONSTANT = &h00000006
#define D3DCOLORWRITEENABLE_RED (__MSABI_LONG(1) shl 0)
#define D3DCOLORWRITEENABLE_GREEN (__MSABI_LONG(1) shl 1)
#define D3DCOLORWRITEENABLE_BLUE (__MSABI_LONG(1) shl 2)
#define D3DCOLORWRITEENABLE_ALPHA (__MSABI_LONG(1) shl 3)
const D3DSTREAMSOURCE_INDEXEDDATA = 1 shl 30
const D3DSTREAMSOURCE_INSTANCEDATA = 2 shl 30
const D3D_MAX_SIMULTANEOUS_RENDERTARGETS = 4
const MAXD3DDECLLENGTH = 64
#define MAXD3DDECLMETHOD D3DDECLMETHOD_LOOKUPPRESAMPLED
#define MAXD3DDECLTYPE D3DDECLTYPE_UNUSED
#define MAXD3DDECLUSAGE D3DDECLUSAGE_SAMPLE
const MAXD3DDECLUSAGEINDEX = 15
const D3DDMAPSAMPLER = 256
#define D3DVERTEXTEXTURESAMPLER0 (D3DDMAPSAMPLER + 1)
#define D3DVERTEXTEXTURESAMPLER1 (D3DDMAPSAMPLER + 2)
#define D3DVERTEXTEXTURESAMPLER2 (D3DDMAPSAMPLER + 3)
#define D3DVERTEXTEXTURESAMPLER3 (D3DDMAPSAMPLER + 4)
const D3DPRESENTFLAG_LOCKABLE_BACKBUFFER = &h00000001
const D3DPRESENTFLAG_DISCARD_DEPTHSTENCIL = &h00000002
const D3DPRESENTFLAG_DEVICECLIP = &h00000004
const D3DPRESENTFLAG_VIDEO = &h00000010
const D3DPRESENTFLAG_NOAUTOROTATE = &h00000020
const D3DPRESENTFLAG_UNPRUNEDMODE = &h00000040
const D3DPRESENT_RATE_DEFAULT = &h00000000

type _D3DDECLUSAGE as long
enum
	D3DDECLUSAGE_POSITION = 0
	D3DDECLUSAGE_BLENDWEIGHT = 1
	D3DDECLUSAGE_BLENDINDICES = 2
	D3DDECLUSAGE_NORMAL = 3
	D3DDECLUSAGE_PSIZE = 4
	D3DDECLUSAGE_TEXCOORD = 5
	D3DDECLUSAGE_TANGENT = 6
	D3DDECLUSAGE_BINORMAL = 7
	D3DDECLUSAGE_TESSFACTOR = 8
	D3DDECLUSAGE_POSITIONT = 9
	D3DDECLUSAGE_COLOR = 10
	D3DDECLUSAGE_FOG = 11
	D3DDECLUSAGE_DEPTH = 12
	D3DDECLUSAGE_SAMPLE = 13
end enum

type D3DDECLUSAGE as _D3DDECLUSAGE
#define D3DMAXDECLUSAGE D3DDECLUSAGE_SAMPLE
const D3DMAXDECLUSAGEINDEX = 15
const D3DMAXDECLLENGTH = 18
#define D3DMAXDECLUSAGE_DX8 D3DDECLUSAGE_TEXCOORD

type _D3DDECLMETHOD as long
enum
	D3DDECLMETHOD_DEFAULT = 0
	D3DDECLMETHOD_PARTIALU = 1
	D3DDECLMETHOD_PARTIALV = 2
	D3DDECLMETHOD_CROSSUV = 3
	D3DDECLMETHOD_UV = 4
	D3DDECLMETHOD_LOOKUP = 5
	D3DDECLMETHOD_LOOKUPPRESAMPLED = 6
end enum

type D3DDECLMETHOD as _D3DDECLMETHOD
#define D3DMAXDECLMETHOD D3DDECLMETHOD_LOOKUPPRESAMPLED

type _D3DDECLTYPE as long
enum
	D3DDECLTYPE_FLOAT1 = 0
	D3DDECLTYPE_FLOAT2 = 1
	D3DDECLTYPE_FLOAT3 = 2
	D3DDECLTYPE_FLOAT4 = 3
	D3DDECLTYPE_D3DCOLOR = 4
	D3DDECLTYPE_UBYTE4 = 5
	D3DDECLTYPE_SHORT2 = 6
	D3DDECLTYPE_SHORT4 = 7
	D3DDECLTYPE_UBYTE4N = 8
	D3DDECLTYPE_SHORT2N = 9
	D3DDECLTYPE_SHORT4N = 10
	D3DDECLTYPE_USHORT2N = 11
	D3DDECLTYPE_USHORT4N = 12
	D3DDECLTYPE_UDEC3 = 13
	D3DDECLTYPE_DEC3N = 14
	D3DDECLTYPE_FLOAT16_2 = 15
	D3DDECLTYPE_FLOAT16_4 = 16
	D3DDECLTYPE_UNUSED = 17
end enum

type D3DDECLTYPE as _D3DDECLTYPE
#define D3DMAXDECLTYPE D3DDECLTYPE_UNUSED

type _D3DVERTEXELEMENT9
	Stream as WORD
	Offset as WORD
	as UBYTE Type
	Method as UBYTE
	Usage as UBYTE
	UsageIndex as UBYTE
end type

type D3DVERTEXELEMENT9 as _D3DVERTEXELEMENT9
type LPD3DVERTEXELEMENT9 as _D3DVERTEXELEMENT9 ptr

type _D3DQUERYTYPE as long
enum
	D3DQUERYTYPE_VCACHE = 4
	D3DQUERYTYPE_RESOURCEMANAGER = 5
	D3DQUERYTYPE_VERTEXSTATS = 6
	D3DQUERYTYPE_EVENT = 8
	D3DQUERYTYPE_OCCLUSION = 9
	D3DQUERYTYPE_TIMESTAMP = 10
	D3DQUERYTYPE_TIMESTAMPDISJOINT = 11
	D3DQUERYTYPE_TIMESTAMPFREQ = 12
	D3DQUERYTYPE_PIPELINETIMINGS = 13
	D3DQUERYTYPE_INTERFACETIMINGS = 14
	D3DQUERYTYPE_VERTEXTIMINGS = 15
	D3DQUERYTYPE_PIXELTIMINGS = 16
	D3DQUERYTYPE_BANDWIDTHTIMINGS = 17
	D3DQUERYTYPE_CACHEUTILIZATION = 18
end enum

type D3DQUERYTYPE as _D3DQUERYTYPE
const D3DISSUE_BEGIN = 1 shl 1
const D3DISSUE_END = 1 shl 0
const D3DGETDATA_FLUSH = 1 shl 0
#define D3DDECL_END() (&hFF, 0, D3DDECLTYPE_UNUSED, 0, 0, 0)
#define D3DVSD_MAKETOKENTYPE(TokenType) ((TokenType shl D3DVSD_TOKENTYPESHIFT) and D3DVSD_TOKENTYPEMASK)
#define D3DVSD_CONST(ConstantAddress, Count) ((D3DVSD_MAKETOKENTYPE(D3DVSD_TOKEN_CONSTMEM) or ((Count) shl D3DVSD_CONSTCOUNTSHIFT)) or (ConstantAddress))
#define D3DVSD_END() &hFFFFFFFF
#define D3DVSD_NOP() &h00000000
#define D3DVSD_REG(VertexRegister, Type) ((D3DVSD_MAKETOKENTYPE(D3DVSD_TOKEN_STREAMDATA) or ((Type) shl D3DVSD_DATATYPESHIFT)) or (VertexRegister))
#define D3DVSD_SKIP(Count) ((D3DVSD_MAKETOKENTYPE(D3DVSD_TOKEN_STREAMDATA) or &h10000000) or ((Count) shl D3DVSD_SKIPCOUNTSHIFT))
#define D3DVSD_STREAM(StreamNumber) (D3DVSD_MAKETOKENTYPE(D3DVSD_TOKEN_STREAM) or (StreamNumber))
#define D3DVSD_STREAM_TESS() (D3DVSD_MAKETOKENTYPE(D3DVSD_TOKEN_STREAM) or D3DVSD_STREAMTESSMASK)
#define D3DVSD_TESSNORMAL(RegisterIn, RegisterOut) (((D3DVSD_MAKETOKENTYPE(D3DVSD_TOKEN_TESSELLATOR) or ((RegisterIn) shl D3DVSD_VERTEXREGINSHIFT)) or (&h02 shl D3DVSD_DATATYPESHIFT)) or (RegisterOut))
#define D3DVSD_TESSUV(Register) (((D3DVSD_MAKETOKENTYPE(D3DVSD_TOKEN_TESSELLATOR) or &h10000000) or (&h01 shl D3DVSD_DATATYPESHIFT)) or (Register))
const D3DSI_OPCODE_MASK = &h0000FFFF
const D3DSI_INSTLENGTH_MASK = &h0F000000
const D3DSI_INSTLENGTH_SHIFT = 24

type _D3DSHADER_INSTRUCTION_OPCODE_TYPE as long
enum
	D3DSIO_NOP = 0
	D3DSIO_MOV = 1
	D3DSIO_ADD = 2
	D3DSIO_SUB = 3
	D3DSIO_MAD = 4
	D3DSIO_MUL = 5
	D3DSIO_RCP = 6
	D3DSIO_RSQ = 7
	D3DSIO_DP3 = 8
	D3DSIO_DP4 = 9
	D3DSIO_MIN = 10
	D3DSIO_MAX = 11
	D3DSIO_SLT = 12
	D3DSIO_SGE = 13
	D3DSIO_EXP = 14
	D3DSIO_LOG = 15
	D3DSIO_LIT = 16
	D3DSIO_DST = 17
	D3DSIO_LRP = 18
	D3DSIO_FRC = 19
	D3DSIO_M4x4 = 20
	D3DSIO_M4x3 = 21
	D3DSIO_M3x4 = 22
	D3DSIO_M3x3 = 23
	D3DSIO_M3x2 = 24
	D3DSIO_CALL = 25
	D3DSIO_CALLNZ = 26
	D3DSIO_LOOP = 27
	D3DSIO_RET = 28
	D3DSIO_ENDLOOP = 29
	D3DSIO_LABEL = 30
	D3DSIO_DCL = 31
	D3DSIO_POW = 32
	D3DSIO_CRS = 33
	D3DSIO_SGN = 34
	D3DSIO_ABS = 35
	D3DSIO_NRM = 36
	D3DSIO_SINCOS = 37
	D3DSIO_REP = 38
	D3DSIO_ENDREP = 39
	D3DSIO_IF = 40
	D3DSIO_IFC = 41
	D3DSIO_ELSE = 42
	D3DSIO_ENDIF = 43
	D3DSIO_BREAK = 44
	D3DSIO_BREAKC = 45
	D3DSIO_MOVA = 46
	D3DSIO_DEFB = 47
	D3DSIO_DEFI = 48
	D3DSIO_TEXCOORD = 64
	D3DSIO_TEXKILL = 65
	D3DSIO_TEX = 66
	D3DSIO_TEXBEM = 67
	D3DSIO_TEXBEML = 68
	D3DSIO_TEXREG2AR = 69
	D3DSIO_TEXREG2GB = 70
	D3DSIO_TEXM3x2PAD = 71
	D3DSIO_TEXM3x2TEX = 72
	D3DSIO_TEXM3x3PAD = 73
	D3DSIO_TEXM3x3TEX = 74
	D3DSIO_TEXM3x3DIFF = 75
	D3DSIO_TEXM3x3SPEC = 76
	D3DSIO_TEXM3x3VSPEC = 77
	D3DSIO_EXPP = 78
	D3DSIO_LOGP = 79
	D3DSIO_CND = 80
	D3DSIO_DEF = 81
	D3DSIO_TEXREG2RGB = 82
	D3DSIO_TEXDP3TEX = 83
	D3DSIO_TEXM3x2DEPTH = 84
	D3DSIO_TEXDP3 = 85
	D3DSIO_TEXM3x3 = 86
	D3DSIO_TEXDEPTH = 87
	D3DSIO_CMP = 88
	D3DSIO_BEM = 89
	D3DSIO_DP2ADD = 90
	D3DSIO_DSX = 91
	D3DSIO_DSY = 92
	D3DSIO_TEXLDD = 93
	D3DSIO_SETP = 94
	D3DSIO_TEXLDL = 95
	D3DSIO_BREAKP = 96
	D3DSIO_PHASE = &hFFFD
	D3DSIO_COMMENT = &hFFFE
	D3DSIO_END = &hFFFF
	D3DSIO_FORCE_DWORD = &h7FFFFFFF
end enum

type D3DSHADER_INSTRUCTION_OPCODE_TYPE as _D3DSHADER_INSTRUCTION_OPCODE_TYPE
#define D3DSINCOSCONST1 -1.5500992e-006f, -2.1701389e-005f, 0.0026041667f, 0.00026041668f
#define D3DSINCOSCONST2 -0.020833334f, -0.12500000f, 1.0f, 0.50000000f

const D3DSHADER_INSTRUCTION_PREDICATED = 1 shl 28
const D3DSI_TEXLD_PROJECT = &h00010000
const D3DSI_TEXLD_BIAS = &h00020000
const D3DSI_COISSUE = &h40000000
const D3DSP_DCL_USAGE_SHIFT = 0
const D3DSP_DCL_USAGE_MASK = &h0000000f
const D3DSP_DCL_USAGEINDEX_SHIFT = 16
const D3DSP_DCL_USAGEINDEX_MASK = &h000f0000
const D3DSP_TEXTURETYPE_SHIFT = 27
const D3DSP_TEXTURETYPE_MASK = &h78000000

type _D3DSAMPLER_TEXTURE_TYPE as long
enum
	D3DSTT_UNKNOWN = 0 shl 27
	D3DSTT_1D = 1 shl 27
	D3DSTT_2D = 2 shl 27
	D3DSTT_CUBE = 3 shl 27
	D3DSTT_VOLUME = 4 shl 27
	D3DSTT_FORCE_DWORD = &h7FFFFFFF
end enum

type D3DSAMPLER_TEXTURE_TYPE as _D3DSAMPLER_TEXTURE_TYPE
const D3DSP_REGNUM_MASK = &h000007FF
const D3DSP_WRITEMASK_0 = &h00010000
const D3DSP_WRITEMASK_1 = &h00020000
const D3DSP_WRITEMASK_2 = &h00040000
const D3DSP_WRITEMASK_3 = &h00080000
const D3DSP_WRITEMASK_ALL = &h000F0000
const D3DSP_DSTMOD_SHIFT = 20
#define D3DSP_DSTMOD_MASK (&hF shl D3DSP_DSTMOD_SHIFT)

type _D3DSHADER_PARAM_DSTMOD_TYPE as long
enum
	D3DSPDM_NONE = 0 shl 20
	D3DSPDM_SATURATE = 1 shl 20
	D3DSPDM_PARTIALPRECISION = 2 shl 20
	D3DSPDM_MSAMPCENTROID = 4 shl 20
	D3DSPDM_FORCE_DWORD = &h7FFFFFFF
end enum

type D3DSHADER_PARAM_DSTMOD_TYPE as _D3DSHADER_PARAM_DSTMOD_TYPE
const D3DSP_DSTSHIFT_SHIFT = 24
#define D3DSP_DSTSHIFT_MASK (&hF shl D3DSP_DSTSHIFT_SHIFT)
const D3DSP_REGTYPE_SHIFT = 28
const D3DSP_REGTYPE_SHIFT2 = 8
#define D3DSP_REGTYPE_MASK (&h7 shl D3DSP_REGTYPE_SHIFT)
const D3DSP_REGTYPE_MASK2 = &h00001800

type _D3DSHADER_PARAM_REGISTER_TYPE as long
enum
	D3DSPR_TEMP = 0
	D3DSPR_INPUT = 1
	D3DSPR_CONST = 2
	D3DSPR_ADDR = 3
	D3DSPR_TEXTURE = 3
	D3DSPR_RASTOUT = 4
	D3DSPR_ATTROUT = 5
	D3DSPR_TEXCRDOUT = 6
	D3DSPR_OUTPUT = 6
	D3DSPR_CONSTINT = 7
	D3DSPR_COLOROUT = 8
	D3DSPR_DEPTHOUT = 9
	D3DSPR_SAMPLER = 10
	D3DSPR_CONST2 = 11
	D3DSPR_CONST3 = 12
	D3DSPR_CONST4 = 13
	D3DSPR_CONSTBOOL = 14
	D3DSPR_LOOP = 15
	D3DSPR_TEMPFLOAT16 = 16
	D3DSPR_MISCTYPE = 17
	D3DSPR_LABEL = 18
	D3DSPR_PREDICATE = 19
	D3DSPR_FORCE_DWORD = &h7FFFFFFF
end enum

type D3DSHADER_PARAM_REGISTER_TYPE as _D3DSHADER_PARAM_REGISTER_TYPE

type _D3DSHADER_MISCTYPE_OFFSETS as long
enum
	D3DSMO_POSITION = 0
	D3DSMO_FACE = 1
end enum

type D3DSHADER_MISCTYPE_OFFSETS as _D3DSHADER_MISCTYPE_OFFSETS

type _D3DVS_RASTOUT_OFFSETS as long
enum
	D3DSRO_POSITION = 0
	D3DSRO_FOG = 1
	D3DSRO_POINT_SIZE = 2
	D3DSRO_FORCE_DWORD = &h7FFFFFFF
end enum

type D3DVS_RASTOUT_OFFSETS as _D3DVS_RASTOUT_OFFSETS
const D3DVS_ADDRESSMODE_SHIFT = 13
#define D3DVS_ADDRESSMODE_MASK (&h1 shl D3DVS_ADDRESSMODE_SHIFT)

type _D3DVS_ADDRESSMODE_TYPE as long
enum
	D3DVS_ADDRMODE_ABSOLUTE = 0 shl 13
	D3DVS_ADDRMODE_RELATIVE = 1 shl 13
	D3DVS_ADDRMODE_FORCE_DWORD = &h7FFFFFFF
end enum

type D3DVS_ADDRESSMODE_TYPE as _D3DVS_ADDRESSMODE_TYPE
const D3DSHADER_ADDRESSMODE_SHIFT = 13
#define D3DSHADER_ADDRESSMODE_MASK (1 shl D3DSHADER_ADDRESSMODE_SHIFT)

type _D3DSHADER_ADDRESSMODE_TYPE as long
enum
	D3DSHADER_ADDRMODE_ABSOLUTE = 0 shl 13
	D3DSHADER_ADDRMODE_RELATIVE = 1 shl 13
	D3DSHADER_ADDRMODE_FORCE_DWORD = &h7FFFFFFF
end enum

type D3DSHADER_ADDRESSMODE_TYPE as _D3DSHADER_ADDRESSMODE_TYPE
const D3DVS_SWIZZLE_SHIFT = 16
#define D3DVS_SWIZZLE_MASK (&hFF shl D3DVS_SWIZZLE_SHIFT)
const D3DSP_SWIZZLE_SHIFT = 16
#define D3DSP_SWIZZLE_MASK (&hFF shl D3DSP_SWIZZLE_SHIFT)
#define D3DVS_X_X (0 shl D3DVS_SWIZZLE_SHIFT)
#define D3DVS_X_Y (1 shl D3DVS_SWIZZLE_SHIFT)
#define D3DVS_X_Z (2 shl D3DVS_SWIZZLE_SHIFT)
#define D3DVS_X_W (3 shl D3DVS_SWIZZLE_SHIFT)
#define D3DVS_Y_X (0 shl (D3DVS_SWIZZLE_SHIFT + 2))
#define D3DVS_Y_Y (1 shl (D3DVS_SWIZZLE_SHIFT + 2))
#define D3DVS_Y_Z (2 shl (D3DVS_SWIZZLE_SHIFT + 2))
#define D3DVS_Y_W (3 shl (D3DVS_SWIZZLE_SHIFT + 2))
#define D3DVS_Z_X (0 shl (D3DVS_SWIZZLE_SHIFT + 4))
#define D3DVS_Z_Y (1 shl (D3DVS_SWIZZLE_SHIFT + 4))
#define D3DVS_Z_Z (2 shl (D3DVS_SWIZZLE_SHIFT + 4))
#define D3DVS_Z_W (3 shl (D3DVS_SWIZZLE_SHIFT + 4))
#define D3DVS_W_X (0 shl (D3DVS_SWIZZLE_SHIFT + 6))
#define D3DVS_W_Y (1 shl (D3DVS_SWIZZLE_SHIFT + 6))
#define D3DVS_W_Z (2 shl (D3DVS_SWIZZLE_SHIFT + 6))
#define D3DVS_W_W (3 shl (D3DVS_SWIZZLE_SHIFT + 6))
#define D3DVS_NOSWIZZLE (((D3DVS_X_X or D3DVS_Y_Y) or D3DVS_Z_Z) or D3DVS_W_W)
#define D3DSP_NOSWIZZLE ((((0 shl (D3DSP_SWIZZLE_SHIFT + 0)) or (1 shl (D3DSP_SWIZZLE_SHIFT + 2))) or (2 shl (D3DSP_SWIZZLE_SHIFT + 4))) or (3 shl (D3DSP_SWIZZLE_SHIFT + 6)))
const D3DSP_SRCMOD_SHIFT = 24
#define D3DSP_SRCMOD_MASK (&hF shl D3DSP_SRCMOD_SHIFT)

type _D3DSHADER_PARAM_SRCMOD_TYPE as long
enum
	D3DSPSM_NONE = 0 shl 24
	D3DSPSM_NEG = 1 shl 24
	D3DSPSM_BIAS = 2 shl 24
	D3DSPSM_BIASNEG = 3 shl 24
	D3DSPSM_SIGN = 4 shl 24
	D3DSPSM_SIGNNEG = 5 shl 24
	D3DSPSM_COMP = 6 shl 24
	D3DSPSM_X2 = 7 shl 24
	D3DSPSM_X2NEG = 8 shl 24
	D3DSPSM_DZ = 9 shl 24
	D3DSPSM_DW = 10 shl 24
	D3DSPSM_ABS = 11 shl 24
	D3DSPSM_ABSNEG = 12 shl 24
	D3DSPSM_NOT = 13 shl 24
	D3DSPSM_FORCE_DWORD = &h7FFFFFFF
end enum

type D3DSHADER_PARAM_SRCMOD_TYPE as _D3DSHADER_PARAM_SRCMOD_TYPE
#define D3DPS_VERSION(major, minor) ((&hFFFF0000 or ((major) shl 8)) or (minor))
#define D3DVS_VERSION(major, minor) ((&hFFFE0000 or ((major) shl 8)) or (minor))
#define D3DSHADER_VERSION_MAJOR(version) (((version) shr 8) and &hFF)
#define D3DSHADER_VERSION_MINOR(version) (((version) shr 0) and &hFF)
const D3DSI_COMMENTSIZE_SHIFT = 16
#define D3DSI_COMMENTSIZE_MASK (&h7FFF shl D3DSI_COMMENTSIZE_SHIFT)
#define D3DSHADER_COMMENT(commentSize) ((((commentSize) shl D3DSI_COMMENTSIZE_SHIFT) and D3DSI_COMMENTSIZE_MASK) or D3DSIO_COMMENT)
#define D3DPS_END() &h0000FFFF
#define D3DVS_END() &h0000FFFF

type _D3DBACKBUFFER_TYPE as long
enum
	D3DBACKBUFFER_TYPE_MONO = 0
	D3DBACKBUFFER_TYPE_LEFT = 1
	D3DBACKBUFFER_TYPE_RIGHT = 2
	D3DBACKBUFFER_TYPE_FORCE_DWORD = &h7fffffff
end enum

type D3DBACKBUFFER_TYPE as _D3DBACKBUFFER_TYPE
#define D3DPRESENT_BACK_BUFFER_MAX __MSABI_LONG(3)

type _D3DBASISTYPE as long
enum
	D3DBASIS_BEZIER = 0
	D3DBASIS_BSPLINE = 1
	D3DBASIS_INTERPOLATE = 2
	D3DBASIS_FORCE_DWORD = &h7fffffff
end enum

type D3DBASISTYPE as _D3DBASISTYPE

type _D3DBLEND as long
enum
	D3DBLEND_ZERO = 1
	D3DBLEND_ONE = 2
	D3DBLEND_SRCCOLOR = 3
	D3DBLEND_INVSRCCOLOR = 4
	D3DBLEND_SRCALPHA = 5
	D3DBLEND_INVSRCALPHA = 6
	D3DBLEND_DESTALPHA = 7
	D3DBLEND_INVDESTALPHA = 8
	D3DBLEND_DESTCOLOR = 9
	D3DBLEND_INVDESTCOLOR = 10
	D3DBLEND_SRCALPHASAT = 11
	D3DBLEND_BOTHSRCALPHA = 12
	D3DBLEND_BOTHINVSRCALPHA = 13
	D3DBLEND_BLENDFACTOR = 14
	D3DBLEND_INVBLENDFACTOR = 15
	D3DBLEND_FORCE_DWORD = &h7fffffff
end enum

type D3DBLEND as _D3DBLEND

type _D3DBLENDOP as long
enum
	D3DBLENDOP_ADD = 1
	D3DBLENDOP_SUBTRACT = 2
	D3DBLENDOP_REVSUBTRACT = 3
	D3DBLENDOP_MIN = 4
	D3DBLENDOP_MAX = 5
	D3DBLENDOP_FORCE_DWORD = &h7fffffff
end enum

type D3DBLENDOP as _D3DBLENDOP

type _D3DCMPFUNC as long
enum
	D3DCMP_NEVER = 1
	D3DCMP_LESS = 2
	D3DCMP_EQUAL = 3
	D3DCMP_LESSEQUAL = 4
	D3DCMP_GREATER = 5
	D3DCMP_NOTEQUAL = 6
	D3DCMP_GREATEREQUAL = 7
	D3DCMP_ALWAYS = 8
	D3DCMP_FORCE_DWORD = &h7fffffff
end enum

type D3DCMPFUNC as _D3DCMPFUNC

type _D3DCUBEMAP_FACES as long
enum
	D3DCUBEMAP_FACE_POSITIVE_X = 0
	D3DCUBEMAP_FACE_NEGATIVE_X = 1
	D3DCUBEMAP_FACE_POSITIVE_Y = 2
	D3DCUBEMAP_FACE_NEGATIVE_Y = 3
	D3DCUBEMAP_FACE_POSITIVE_Z = 4
	D3DCUBEMAP_FACE_NEGATIVE_Z = 5
	D3DCUBEMAP_FACE_FORCE_DWORD = &hffffffff
end enum

type D3DCUBEMAP_FACES as _D3DCUBEMAP_FACES

type _D3DCULL as long
enum
	D3DCULL_NONE = 1
	D3DCULL_CW = 2
	D3DCULL_CCW = 3
	D3DCULL_FORCE_DWORD = &h7fffffff
end enum

type D3DCULL as _D3DCULL

type _D3DDEBUGMONITORTOKENS as long
enum
	D3DDMT_ENABLE = 0
	D3DDMT_DISABLE = 1
	D3DDMT_FORCE_DWORD = &h7fffffff
end enum

type D3DDEBUGMONITORTOKENS as _D3DDEBUGMONITORTOKENS

type _D3DDEGREETYPE as long
enum
	D3DDEGREE_LINEAR = 1
	D3DDEGREE_QUADRATIC = 2
	D3DDEGREE_CUBIC = 3
	D3DDEGREE_QUINTIC = 5
	D3DDEGREE_FORCE_DWORD = &h7fffffff
end enum

type D3DDEGREETYPE as _D3DDEGREETYPE

type _D3DDEVTYPE as long
enum
	D3DDEVTYPE_HAL = 1
	D3DDEVTYPE_REF = 2
	D3DDEVTYPE_SW = 3
	D3DDEVTYPE_NULLREF = 4
	D3DDEVTYPE_FORCE_DWORD = &hffffffff
end enum

type D3DDEVTYPE as _D3DDEVTYPE

type _D3DFILLMODE as long
enum
	D3DFILL_POINT = 1
	D3DFILL_WIREFRAME = 2
	D3DFILL_SOLID = 3
	D3DFILL_FORCE_DWORD = &h7fffffff
end enum

type D3DFILLMODE as _D3DFILLMODE

type _D3DFOGMODE as long
enum
	D3DFOG_NONE = 0
	D3DFOG_EXP = 1
	D3DFOG_EXP2 = 2
	D3DFOG_LINEAR = 3
	D3DFOG_FORCE_DWORD = &h7fffffff
end enum

type D3DFOGMODE as _D3DFOGMODE

type _D3DFORMAT as long
enum
	D3DFMT_UNKNOWN = 0
	D3DFMT_R8G8B8 = 20
	D3DFMT_A8R8G8B8 = 21
	D3DFMT_X8R8G8B8 = 22
	D3DFMT_R5G6B5 = 23
	D3DFMT_X1R5G5B5 = 24
	D3DFMT_A1R5G5B5 = 25
	D3DFMT_A4R4G4B4 = 26
	D3DFMT_R3G3B2 = 27
	D3DFMT_A8 = 28
	D3DFMT_A8R3G3B2 = 29
	D3DFMT_X4R4G4B4 = 30
	D3DFMT_A2B10G10R10 = 31
	D3DFMT_A8B8G8R8 = 32
	D3DFMT_X8B8G8R8 = 33
	D3DFMT_G16R16 = 34
	D3DFMT_A2R10G10B10 = 35
	D3DFMT_A16B16G16R16 = 36
	D3DFMT_A8P8 = 40
	D3DFMT_P8 = 41
	D3DFMT_L8 = 50
	D3DFMT_A8L8 = 51
	D3DFMT_A4L4 = 52
	D3DFMT_V8U8 = 60
	D3DFMT_L6V5U5 = 61
	D3DFMT_X8L8V8U8 = 62
	D3DFMT_Q8W8V8U8 = 63
	D3DFMT_V16U16 = 64
	D3DFMT_A2W10V10U10 = 67
	D3DFMT_UYVY = ((cast(DWORD, cast(UBYTE, asc("U"))) or (cast(DWORD, cast(UBYTE, asc("Y"))) shl 8)) or (cast(DWORD, cast(UBYTE, asc("V"))) shl 16)) or (cast(DWORD, cast(UBYTE, asc("Y"))) shl 24)
	D3DFMT_YUY2 = ((cast(DWORD, cast(UBYTE, asc("Y"))) or (cast(DWORD, cast(UBYTE, asc("U"))) shl 8)) or (cast(DWORD, cast(UBYTE, asc("Y"))) shl 16)) or (cast(DWORD, cast(UBYTE, asc("2"))) shl 24)
	D3DFMT_DXT1 = ((cast(DWORD, cast(UBYTE, asc("D"))) or (cast(DWORD, cast(UBYTE, asc("X"))) shl 8)) or (cast(DWORD, cast(UBYTE, asc("T"))) shl 16)) or (cast(DWORD, cast(UBYTE, asc("1"))) shl 24)
	D3DFMT_DXT2 = ((cast(DWORD, cast(UBYTE, asc("D"))) or (cast(DWORD, cast(UBYTE, asc("X"))) shl 8)) or (cast(DWORD, cast(UBYTE, asc("T"))) shl 16)) or (cast(DWORD, cast(UBYTE, asc("2"))) shl 24)
	D3DFMT_DXT3 = ((cast(DWORD, cast(UBYTE, asc("D"))) or (cast(DWORD, cast(UBYTE, asc("X"))) shl 8)) or (cast(DWORD, cast(UBYTE, asc("T"))) shl 16)) or (cast(DWORD, cast(UBYTE, asc("3"))) shl 24)
	D3DFMT_DXT4 = ((cast(DWORD, cast(UBYTE, asc("D"))) or (cast(DWORD, cast(UBYTE, asc("X"))) shl 8)) or (cast(DWORD, cast(UBYTE, asc("T"))) shl 16)) or (cast(DWORD, cast(UBYTE, asc("4"))) shl 24)
	D3DFMT_DXT5 = ((cast(DWORD, cast(UBYTE, asc("D"))) or (cast(DWORD, cast(UBYTE, asc("X"))) shl 8)) or (cast(DWORD, cast(UBYTE, asc("T"))) shl 16)) or (cast(DWORD, cast(UBYTE, asc("5"))) shl 24)
	D3DFMT_MULTI2_ARGB8 = ((cast(DWORD, cast(UBYTE, asc("M"))) or (cast(DWORD, cast(UBYTE, asc("E"))) shl 8)) or (cast(DWORD, cast(UBYTE, asc("T"))) shl 16)) or (cast(DWORD, cast(UBYTE, asc("1"))) shl 24)
	D3DFMT_G8R8_G8B8 = ((cast(DWORD, cast(UBYTE, asc("G"))) or (cast(DWORD, cast(UBYTE, asc("R"))) shl 8)) or (cast(DWORD, cast(UBYTE, asc("G"))) shl 16)) or (cast(DWORD, cast(UBYTE, asc("B"))) shl 24)
	D3DFMT_R8G8_B8G8 = ((cast(DWORD, cast(UBYTE, asc("R"))) or (cast(DWORD, cast(UBYTE, asc("G"))) shl 8)) or (cast(DWORD, cast(UBYTE, asc("B"))) shl 16)) or (cast(DWORD, cast(UBYTE, asc("G"))) shl 24)
	D3DFMT_D16_LOCKABLE = 70
	D3DFMT_D32 = 71
	D3DFMT_D15S1 = 73
	D3DFMT_D24S8 = 75
	D3DFMT_D24X8 = 77
	D3DFMT_D24X4S4 = 79
	D3DFMT_D16 = 80
	D3DFMT_L16 = 81
	D3DFMT_D32F_LOCKABLE = 82
	D3DFMT_D24FS8 = 83
	D3DFMT_VERTEXDATA = 100
	D3DFMT_INDEX16 = 101
	D3DFMT_INDEX32 = 102
	D3DFMT_Q16W16V16U16 = 110
	D3DFMT_R16F = 111
	D3DFMT_G16R16F = 112
	D3DFMT_A16B16G16R16F = 113
	D3DFMT_R32F = 114
	D3DFMT_G32R32F = 115
	D3DFMT_A32B32G32R32F = 116
	D3DFMT_CxV8U8 = 117
	D3DFMT_FORCE_DWORD = &hFFFFFFFF
end enum

type D3DFORMAT as _D3DFORMAT

type _D3DLIGHTTYPE as long
enum
	D3DLIGHT_POINT = 1
	D3DLIGHT_SPOT = 2
	D3DLIGHT_DIRECTIONAL = 3
	D3DLIGHT_FORCE_DWORD = &h7fffffff
end enum

type D3DLIGHTTYPE as _D3DLIGHTTYPE

type _D3DMATERIALCOLORSOURCE as long
enum
	D3DMCS_MATERIAL = 0
	D3DMCS_COLOR1 = 1
	D3DMCS_COLOR2 = 2
	D3DMCS_FORCE_DWORD = &h7fffffff
end enum

type D3DMATERIALCOLORSOURCE as _D3DMATERIALCOLORSOURCE

type _D3DMULTISAMPLE_TYPE as long
enum
	D3DMULTISAMPLE_NONE = 0
	D3DMULTISAMPLE_NONMASKABLE = 1
	D3DMULTISAMPLE_2_SAMPLES = 2
	D3DMULTISAMPLE_3_SAMPLES = 3
	D3DMULTISAMPLE_4_SAMPLES = 4
	D3DMULTISAMPLE_5_SAMPLES = 5
	D3DMULTISAMPLE_6_SAMPLES = 6
	D3DMULTISAMPLE_7_SAMPLES = 7
	D3DMULTISAMPLE_8_SAMPLES = 8
	D3DMULTISAMPLE_9_SAMPLES = 9
	D3DMULTISAMPLE_10_SAMPLES = 10
	D3DMULTISAMPLE_11_SAMPLES = 11
	D3DMULTISAMPLE_12_SAMPLES = 12
	D3DMULTISAMPLE_13_SAMPLES = 13
	D3DMULTISAMPLE_14_SAMPLES = 14
	D3DMULTISAMPLE_15_SAMPLES = 15
	D3DMULTISAMPLE_16_SAMPLES = 16
	D3DMULTISAMPLE_FORCE_DWORD = &h7fffffff
end enum

type D3DMULTISAMPLE_TYPE as _D3DMULTISAMPLE_TYPE

type _D3DPATCHEDGESTYLE as long
enum
	D3DPATCHEDGE_DISCRETE = 0
	D3DPATCHEDGE_CONTINUOUS = 1
	D3DPATCHEDGE_FORCE_DWORD = &h7fffffff
end enum

type D3DPATCHEDGESTYLE as _D3DPATCHEDGESTYLE

type _D3DPOOL as long
enum
	D3DPOOL_DEFAULT = 0
	D3DPOOL_MANAGED = 1
	D3DPOOL_SYSTEMMEM = 2
	D3DPOOL_SCRATCH = 3
	D3DPOOL_FORCE_DWORD = &h7fffffff
end enum

type D3DPOOL as _D3DPOOL

type _D3DPRIMITIVETYPE as long
enum
	D3DPT_POINTLIST = 1
	D3DPT_LINELIST = 2
	D3DPT_LINESTRIP = 3
	D3DPT_TRIANGLELIST = 4
	D3DPT_TRIANGLESTRIP = 5
	D3DPT_TRIANGLEFAN = 6
	D3DPT_FORCE_DWORD = &h7fffffff
end enum

type D3DPRIMITIVETYPE as _D3DPRIMITIVETYPE

type _D3DRENDERSTATETYPE as long
enum
	D3DRS_ZENABLE = 7
	D3DRS_FILLMODE = 8
	D3DRS_SHADEMODE = 9
	D3DRS_ZWRITEENABLE = 14
	D3DRS_ALPHATESTENABLE = 15
	D3DRS_LASTPIXEL = 16
	D3DRS_SRCBLEND = 19
	D3DRS_DESTBLEND = 20
	D3DRS_CULLMODE = 22
	D3DRS_ZFUNC = 23
	D3DRS_ALPHAREF = 24
	D3DRS_ALPHAFUNC = 25
	D3DRS_DITHERENABLE = 26
	D3DRS_ALPHABLENDENABLE = 27
	D3DRS_FOGENABLE = 28
	D3DRS_SPECULARENABLE = 29
	D3DRS_FOGCOLOR = 34
	D3DRS_FOGTABLEMODE = 35
	D3DRS_FOGSTART = 36
	D3DRS_FOGEND = 37
	D3DRS_FOGDENSITY = 38
	D3DRS_RANGEFOGENABLE = 48
	D3DRS_STENCILENABLE = 52
	D3DRS_STENCILFAIL = 53
	D3DRS_STENCILZFAIL = 54
	D3DRS_STENCILPASS = 55
	D3DRS_STENCILFUNC = 56
	D3DRS_STENCILREF = 57
	D3DRS_STENCILMASK = 58
	D3DRS_STENCILWRITEMASK = 59
	D3DRS_TEXTUREFACTOR = 60
	D3DRS_WRAP0 = 128
	D3DRS_WRAP1 = 129
	D3DRS_WRAP2 = 130
	D3DRS_WRAP3 = 131
	D3DRS_WRAP4 = 132
	D3DRS_WRAP5 = 133
	D3DRS_WRAP6 = 134
	D3DRS_WRAP7 = 135
	D3DRS_CLIPPING = 136
	D3DRS_LIGHTING = 137
	D3DRS_AMBIENT = 139
	D3DRS_FOGVERTEXMODE = 140
	D3DRS_COLORVERTEX = 141
	D3DRS_LOCALVIEWER = 142
	D3DRS_NORMALIZENORMALS = 143
	D3DRS_DIFFUSEMATERIALSOURCE = 145
	D3DRS_SPECULARMATERIALSOURCE = 146
	D3DRS_AMBIENTMATERIALSOURCE = 147
	D3DRS_EMISSIVEMATERIALSOURCE = 148
	D3DRS_VERTEXBLEND = 151
	D3DRS_CLIPPLANEENABLE = 152
	D3DRS_POINTSIZE = 154
	D3DRS_POINTSIZE_MIN = 155
	D3DRS_POINTSPRITEENABLE = 156
	D3DRS_POINTSCALEENABLE = 157
	D3DRS_POINTSCALE_A = 158
	D3DRS_POINTSCALE_B = 159
	D3DRS_POINTSCALE_C = 160
	D3DRS_MULTISAMPLEANTIALIAS = 161
	D3DRS_MULTISAMPLEMASK = 162
	D3DRS_PATCHEDGESTYLE = 163
	D3DRS_DEBUGMONITORTOKEN = 165
	D3DRS_POINTSIZE_MAX = 166
	D3DRS_INDEXEDVERTEXBLENDENABLE = 167
	D3DRS_COLORWRITEENABLE = 168
	D3DRS_TWEENFACTOR = 170
	D3DRS_BLENDOP = 171
	D3DRS_POSITIONDEGREE = 172
	D3DRS_NORMALDEGREE = 173
	D3DRS_SCISSORTESTENABLE = 174
	D3DRS_SLOPESCALEDEPTHBIAS = 175
	D3DRS_ANTIALIASEDLINEENABLE = 176
	D3DRS_MINTESSELLATIONLEVEL = 178
	D3DRS_MAXTESSELLATIONLEVEL = 179
	D3DRS_ADAPTIVETESS_X = 180
	D3DRS_ADAPTIVETESS_Y = 181
	D3DRS_ADAPTIVETESS_Z = 182
	D3DRS_ADAPTIVETESS_W = 183
	D3DRS_ENABLEADAPTIVETESSELLATION = 184
	D3DRS_TWOSIDEDSTENCILMODE = 185
	D3DRS_CCW_STENCILFAIL = 186
	D3DRS_CCW_STENCILZFAIL = 187
	D3DRS_CCW_STENCILPASS = 188
	D3DRS_CCW_STENCILFUNC = 189
	D3DRS_COLORWRITEENABLE1 = 190
	D3DRS_COLORWRITEENABLE2 = 191
	D3DRS_COLORWRITEENABLE3 = 192
	D3DRS_BLENDFACTOR = 193
	D3DRS_SRGBWRITEENABLE = 194
	D3DRS_DEPTHBIAS = 195
	D3DRS_WRAP8 = 198
	D3DRS_WRAP9 = 199
	D3DRS_WRAP10 = 200
	D3DRS_WRAP11 = 201
	D3DRS_WRAP12 = 202
	D3DRS_WRAP13 = 203
	D3DRS_WRAP14 = 204
	D3DRS_WRAP15 = 205
	D3DRS_SEPARATEALPHABLENDENABLE = 206
	D3DRS_SRCBLENDALPHA = 207
	D3DRS_DESTBLENDALPHA = 208
	D3DRS_BLENDOPALPHA = 209
	D3DRS_FORCE_DWORD = &h7fffffff
end enum

type D3DRENDERSTATETYPE as _D3DRENDERSTATETYPE

type _D3DRESOURCETYPE as long
enum
	D3DRTYPE_SURFACE = 1
	D3DRTYPE_VOLUME = 2
	D3DRTYPE_TEXTURE = 3
	D3DRTYPE_VOLUMETEXTURE = 4
	D3DRTYPE_CUBETEXTURE = 5
	D3DRTYPE_VERTEXBUFFER = 6
	D3DRTYPE_INDEXBUFFER = 7
	D3DRTYPE_FORCE_DWORD = &h7fffffff
end enum

type D3DRESOURCETYPE as _D3DRESOURCETYPE
#define D3DRTYPECOUNT (D3DRTYPE_INDEXBUFFER + 1)

type _D3DSHADEMODE as long
enum
	D3DSHADE_FLAT = 1
	D3DSHADE_GOURAUD = 2
	D3DSHADE_PHONG = 3
	D3DSHADE_FORCE_DWORD = &h7fffffff
end enum

type D3DSHADEMODE as _D3DSHADEMODE

type _D3DSTATEBLOCKTYPE as long
enum
	D3DSBT_ALL = 1
	D3DSBT_PIXELSTATE = 2
	D3DSBT_VERTEXSTATE = 3
	D3DSBT_FORCE_DWORD = &hffffffff
end enum

type D3DSTATEBLOCKTYPE as _D3DSTATEBLOCKTYPE

type _D3DSTENCILOP as long
enum
	D3DSTENCILOP_KEEP = 1
	D3DSTENCILOP_ZERO = 2
	D3DSTENCILOP_REPLACE = 3
	D3DSTENCILOP_INCRSAT = 4
	D3DSTENCILOP_DECRSAT = 5
	D3DSTENCILOP_INVERT = 6
	D3DSTENCILOP_INCR = 7
	D3DSTENCILOP_DECR = 8
	D3DSTENCILOP_FORCE_DWORD = &h7fffffff
end enum

type D3DSTENCILOP as _D3DSTENCILOP

type _D3DSWAPEFFECT as long
enum
	D3DSWAPEFFECT_DISCARD = 1
	D3DSWAPEFFECT_FLIP = 2
	D3DSWAPEFFECT_COPY = 3
	D3DSWAPEFFECT_OVERLAY = 4
	D3DSWAPEFFECT_FLIPEX = 5
	D3DSWAPEFFECT_FORCE_DWORD = &hFFFFFFFF
end enum

type D3DSWAPEFFECT as _D3DSWAPEFFECT

type _D3DTEXTUREADDRESS as long
enum
	D3DTADDRESS_WRAP = 1
	D3DTADDRESS_MIRROR = 2
	D3DTADDRESS_CLAMP = 3
	D3DTADDRESS_BORDER = 4
	D3DTADDRESS_MIRRORONCE = 5
	D3DTADDRESS_FORCE_DWORD = &h7fffffff
end enum

type D3DTEXTUREADDRESS as _D3DTEXTUREADDRESS

type _D3DTEXTUREFILTERTYPE as long
enum
	D3DTEXF_NONE = 0
	D3DTEXF_POINT = 1
	D3DTEXF_LINEAR = 2
	D3DTEXF_ANISOTROPIC = 3
	D3DTEXF_FLATCUBIC = 4
	D3DTEXF_GAUSSIANCUBIC = 5
	D3DTEXF_PYRAMIDALQUAD = 6
	D3DTEXF_GAUSSIANQUAD = 7
	D3DTEXF_FORCE_DWORD = &h7fffffff
end enum

type D3DTEXTUREFILTERTYPE as _D3DTEXTUREFILTERTYPE

type _D3DTEXTUREOP as long
enum
	D3DTOP_DISABLE = 1
	D3DTOP_SELECTARG1 = 2
	D3DTOP_SELECTARG2 = 3
	D3DTOP_MODULATE = 4
	D3DTOP_MODULATE2X = 5
	D3DTOP_MODULATE4X = 6
	D3DTOP_ADD = 7
	D3DTOP_ADDSIGNED = 8
	D3DTOP_ADDSIGNED2X = 9
	D3DTOP_SUBTRACT = 10
	D3DTOP_ADDSMOOTH = 11
	D3DTOP_BLENDDIFFUSEALPHA = 12
	D3DTOP_BLENDTEXTUREALPHA = 13
	D3DTOP_BLENDFACTORALPHA = 14
	D3DTOP_BLENDTEXTUREALPHAPM = 15
	D3DTOP_BLENDCURRENTALPHA = 16
	D3DTOP_PREMODULATE = 17
	D3DTOP_MODULATEALPHA_ADDCOLOR = 18
	D3DTOP_MODULATECOLOR_ADDALPHA = 19
	D3DTOP_MODULATEINVALPHA_ADDCOLOR = 20
	D3DTOP_MODULATEINVCOLOR_ADDALPHA = 21
	D3DTOP_BUMPENVMAP = 22
	D3DTOP_BUMPENVMAPLUMINANCE = 23
	D3DTOP_DOTPRODUCT3 = 24
	D3DTOP_MULTIPLYADD = 25
	D3DTOP_LERP = 26
	D3DTOP_FORCE_DWORD = &h7fffffff
end enum

type D3DTEXTUREOP as _D3DTEXTUREOP

type _D3DTEXTURESTAGESTATETYPE as long
enum
	D3DTSS_COLOROP = 1
	D3DTSS_COLORARG1 = 2
	D3DTSS_COLORARG2 = 3
	D3DTSS_ALPHAOP = 4
	D3DTSS_ALPHAARG1 = 5
	D3DTSS_ALPHAARG2 = 6
	D3DTSS_BUMPENVMAT00 = 7
	D3DTSS_BUMPENVMAT01 = 8
	D3DTSS_BUMPENVMAT10 = 9
	D3DTSS_BUMPENVMAT11 = 10
	D3DTSS_TEXCOORDINDEX = 11
	D3DTSS_BUMPENVLSCALE = 22
	D3DTSS_BUMPENVLOFFSET = 23
	D3DTSS_TEXTURETRANSFORMFLAGS = 24
	D3DTSS_COLORARG0 = 26
	D3DTSS_ALPHAARG0 = 27
	D3DTSS_RESULTARG = 28
	D3DTSS_CONSTANT = 32
	D3DTSS_FORCE_DWORD = &h7fffffff
end enum

type D3DTEXTURESTAGESTATETYPE as _D3DTEXTURESTAGESTATETYPE

type _D3DTEXTURETRANSFORMFLAGS as long
enum
	D3DTTFF_DISABLE = 0
	D3DTTFF_COUNT1 = 1
	D3DTTFF_COUNT2 = 2
	D3DTTFF_COUNT3 = 3
	D3DTTFF_COUNT4 = 4
	D3DTTFF_PROJECTED = 256
	D3DTTFF_FORCE_DWORD = &h7fffffff
end enum

type D3DTEXTURETRANSFORMFLAGS as _D3DTEXTURETRANSFORMFLAGS

type _D3DTRANSFORMSTATETYPE as long
enum
	D3DTS_VIEW = 2
	D3DTS_PROJECTION = 3
	D3DTS_TEXTURE0 = 16
	D3DTS_TEXTURE1 = 17
	D3DTS_TEXTURE2 = 18
	D3DTS_TEXTURE3 = 19
	D3DTS_TEXTURE4 = 20
	D3DTS_TEXTURE5 = 21
	D3DTS_TEXTURE6 = 22
	D3DTS_TEXTURE7 = 23
	D3DTS_FORCE_DWORD = &h7fffffff
end enum

type D3DTRANSFORMSTATETYPE as _D3DTRANSFORMSTATETYPE

type _D3DVERTEXBLENDFLAGS as long
enum
	D3DVBF_DISABLE = 0
	D3DVBF_1WEIGHTS = 1
	D3DVBF_2WEIGHTS = 2
	D3DVBF_3WEIGHTS = 3
	D3DVBF_TWEENING = 255
	D3DVBF_0WEIGHTS = 256
end enum

type D3DVERTEXBLENDFLAGS as _D3DVERTEXBLENDFLAGS

type _D3DZBUFFERTYPE as long
enum
	D3DZB_FALSE = 0
	D3DZB_TRUE = 1
	D3DZB_USEW = 2
	D3DZB_FORCE_DWORD = &h7fffffff
end enum

type D3DZBUFFERTYPE as _D3DZBUFFERTYPE

type _D3DSAMPLERSTATETYPE as long
enum
	D3DSAMP_ADDRESSU = 1
	D3DSAMP_ADDRESSV = 2
	D3DSAMP_ADDRESSW = 3
	D3DSAMP_BORDERCOLOR = 4
	D3DSAMP_MAGFILTER = 5
	D3DSAMP_MINFILTER = 6
	D3DSAMP_MIPFILTER = 7
	D3DSAMP_MIPMAPLODBIAS = 8
	D3DSAMP_MAXMIPLEVEL = 9
	D3DSAMP_MAXANISOTROPY = 10
	D3DSAMP_SRGBTEXTURE = 11
	D3DSAMP_ELEMENTINDEX = 12
	D3DSAMP_DMAPOFFSET = 13
	D3DSAMP_FORCE_DWORD = &h7fffffff
end enum

type D3DSAMPLERSTATETYPE as _D3DSAMPLERSTATETYPE
type D3DCOLOR as DWORD
#define D3DCOLOR_DEFINED

type _D3DADAPTER_IDENTIFIER9
	Driver as zstring * 512
	Description as zstring * 512
	DeviceName as zstring * 32
	DriverVersion as LARGE_INTEGER
	VendorId as DWORD
	DeviceId as DWORD
	SubSysId as DWORD
	Revision as DWORD
	DeviceIdentifier as GUID
	WHQLLevel as DWORD
end type

type D3DADAPTER_IDENTIFIER9 as _D3DADAPTER_IDENTIFIER9

type _D3DBOX
	Left as UINT
	Top as UINT
	Right as UINT
	Bottom as UINT
	Front as UINT
	Back as UINT
end type

type D3DBOX as _D3DBOX

type _D3DCLIPSTATUS9
	ClipUnion as DWORD
	ClipIntersection as DWORD
end type

type D3DCLIPSTATUS9 as _D3DCLIPSTATUS9

type _D3DCOLORVALUE
	r as single
	g as single
	b as single
	a as single
end type

type D3DCOLORVALUE as _D3DCOLORVALUE
#define D3DCOLORVALUE_DEFINED

type _D3DDEVICE_CREATION_PARAMETERS
	AdapterOrdinal as UINT
	DeviceType as D3DDEVTYPE
	hFocusWindow as HWND
	BehaviorFlags as DWORD
end type

type D3DDEVICE_CREATION_PARAMETERS as _D3DDEVICE_CREATION_PARAMETERS

type _D3DDEVINFO_D3D9BANDWIDTHTIMINGS
	MaxBandwidthUtilized as single
	FrontEndUploadMemoryUtilizedPercent as single
	VertexRateUtilizedPercent as single
	TriangleSetupRateUtilizedPercent as single
	FillRateUtilizedPercent as single
end type

type D3DDEVINFO_D3D9BANDWIDTHTIMINGS as _D3DDEVINFO_D3D9BANDWIDTHTIMINGS

type _D3DDEVINFO_D3D9CACHEUTILIZATION
	TextureCacheHitRate as single
	PostTransformVertexCacheHitRate as single
end type

type D3DDEVINFO_D3D9CACHEUTILIZATION as _D3DDEVINFO_D3D9CACHEUTILIZATION

type _D3DDEVINFO_D3D9INTERFACETIMINGS
	WaitingForGPUToUseApplicationResourceTimePercent as single
	WaitingForGPUToAcceptMoreCommandsTimePercent as single
	WaitingForGPUToStayWithinLatencyTimePercent as single
	WaitingForGPUExclusiveResourceTimePercent as single
	WaitingForGPUOtherTimePercent as single
end type

type D3DDEVINFO_D3D9INTERFACETIMINGS as _D3DDEVINFO_D3D9INTERFACETIMINGS

type _D3DDEVINFO_D3D9PIPELINETIMINGS
	VertexProcessingTimePercent as single
	PixelProcessingTimePercent as single
	OtherGPUProcessingTimePercent as single
	GPUIdleTimePercent as single
end type

type D3DDEVINFO_D3D9PIPELINETIMINGS as _D3DDEVINFO_D3D9PIPELINETIMINGS

type _D3DDEVINFO_D3D9STAGETIMINGS
	MemoryProcessingPercent as single
	ComputationProcessingPercent as single
end type

type D3DDEVINFO_D3D9STAGETIMINGS as _D3DDEVINFO_D3D9STAGETIMINGS

type D3DDEVINFO_VCACHE
	Pattern as DWORD
	OptMethod as DWORD
	CacheSize as DWORD
	MagicNumber as DWORD
end type

type D3DRESOURCESTATS
	bThrashing as WINBOOL
	ApproxBytesDownloaded as DWORD
	NumEvicts as DWORD
	NumVidCreates as DWORD
	LastPri as DWORD
	NumUsed as DWORD
	NumUsedInVidMem as DWORD
	WorkingSet as DWORD
	WorkingSetBytes as DWORD
	TotalManaged as DWORD
	TotalBytes as DWORD
end type

type _D3DDEVINFO_D3DRESOURCEMANAGER
	stats(0 to (D3DRTYPE_INDEXBUFFER + 1) - 1) as D3DRESOURCESTATS
end type

type D3DDEVINFO_D3DRESOURCEMANAGER as _D3DDEVINFO_D3DRESOURCEMANAGER

type _D3DDEVINFO_D3DVERTEXSTATS
	NumRenderedTriangles as DWORD
	NumExtraClippingTriangles as DWORD
end type

type D3DDEVINFO_D3DVERTEXSTATS as _D3DDEVINFO_D3DVERTEXSTATS

type _D3DDISPLAYMODE
	Width as UINT
	Height as UINT
	RefreshRate as UINT
	Format as D3DFORMAT
end type

type D3DDISPLAYMODE as _D3DDISPLAYMODE

type _D3DGAMMARAMP
	red(0 to 255) as WORD
	green(0 to 255) as WORD
	blue(0 to 255) as WORD
end type

type D3DGAMMARAMP as _D3DGAMMARAMP

type _D3DINDEXBUFFER_DESC
	Format as D3DFORMAT
	as D3DRESOURCETYPE Type
	Usage as DWORD
	Pool as D3DPOOL
	Size as UINT
end type

type D3DINDEXBUFFER_DESC as _D3DINDEXBUFFER_DESC

type _D3DVECTOR
	x as single
	y as single
	z as single
end type

type D3DVECTOR as _D3DVECTOR
#define D3DVECTOR_DEFINED

type _D3DLIGHT9
	as D3DLIGHTTYPE Type
	Diffuse as D3DCOLORVALUE
	Specular as D3DCOLORVALUE
	Ambient as D3DCOLORVALUE
	Position as D3DVECTOR
	Direction as D3DVECTOR
	Range as single
	Falloff as single
	Attenuation0 as single
	Attenuation1 as single
	Attenuation2 as single
	Theta as single
	Phi as single
end type

type D3DLIGHT9 as _D3DLIGHT9

type _D3DLINEPATTERN
	wRepeatFactor as WORD
	wLinePattern as WORD
end type

type D3DLINEPATTERN as _D3DLINEPATTERN

type _D3DLOCKED_BOX
	RowPitch as INT_
	SlicePitch as INT_
	pBits as any ptr
end type

type D3DLOCKED_BOX as _D3DLOCKED_BOX

type _D3DLOCKED_RECT
	Pitch as INT_
	pBits as any ptr
end type

type D3DLOCKED_RECT as _D3DLOCKED_RECT

type _D3DMATERIAL9
	Diffuse as D3DCOLORVALUE
	Ambient as D3DCOLORVALUE
	Specular as D3DCOLORVALUE
	Emissive as D3DCOLORVALUE
	Power as single
end type

type D3DMATERIAL9 as _D3DMATERIAL9

type _D3DMATRIX
	union
		type
			_11 as single
			_12 as single
			_13 as single
			_14 as single
			_21 as single
			_22 as single
			_23 as single
			_24 as single
			_31 as single
			_32 as single
			_33 as single
			_34 as single
			_41 as single
			_42 as single
			_43 as single
			_44 as single
		end type

		m(0 to 3, 0 to 3) as single
	end union
end type

type D3DMATRIX as _D3DMATRIX
#define D3DMATRIX_DEFINED

type _D3DPRESENT_PARAMETERS_
	BackBufferWidth as UINT
	BackBufferHeight as UINT
	BackBufferFormat as D3DFORMAT
	BackBufferCount as UINT
	MultiSampleType as D3DMULTISAMPLE_TYPE
	MultiSampleQuality as DWORD
	SwapEffect as D3DSWAPEFFECT
	hDeviceWindow as HWND
	Windowed as WINBOOL
	EnableAutoDepthStencil as WINBOOL
	AutoDepthStencilFormat as D3DFORMAT
	Flags as DWORD
	FullScreen_RefreshRateInHz as UINT
	PresentationInterval as UINT
end type

type D3DPRESENT_PARAMETERS as _D3DPRESENT_PARAMETERS_

type _D3DRANGE
	Offset as UINT
	Size as UINT
end type

type D3DRANGE as _D3DRANGE

type _D3DRASTER_STATUS
	InVBlank as WINBOOL
	ScanLine as UINT
end type

type D3DRASTER_STATUS as _D3DRASTER_STATUS

type _D3DRECT
	x1 as LONG
	y1 as LONG
	x2 as LONG
	y2 as LONG
end type

type D3DRECT as _D3DRECT
#define D3DRECT_DEFINED

type _D3DRECTPATCH_INFO
	StartVertexOffsetWidth as UINT
	StartVertexOffsetHeight as UINT
	Width as UINT
	Height as UINT
	Stride as UINT
	Basis as D3DBASISTYPE
	Degree as D3DDEGREETYPE
end type

type D3DRECTPATCH_INFO as _D3DRECTPATCH_INFO

type _D3DSURFACE_DESC
	Format as D3DFORMAT
	as D3DRESOURCETYPE Type
	Usage as DWORD
	Pool as D3DPOOL
	MultiSampleType as D3DMULTISAMPLE_TYPE
	MultiSampleQuality as DWORD
	Width as UINT
	Height as UINT
end type

type D3DSURFACE_DESC as _D3DSURFACE_DESC

type _D3DTRIPATCH_INFO
	StartVertexOffset as UINT
	NumVertices as UINT
	Basis as D3DBASISTYPE
	Degree as D3DDEGREETYPE
end type

type D3DTRIPATCH_INFO as _D3DTRIPATCH_INFO

type _D3DVERTEXBUFFER_DESC
	Format as D3DFORMAT
	as D3DRESOURCETYPE Type
	Usage as DWORD
	Pool as D3DPOOL
	Size as UINT
	FVF as DWORD
end type

type D3DVERTEXBUFFER_DESC as _D3DVERTEXBUFFER_DESC

type _D3DVIEWPORT9
	X as DWORD
	Y as DWORD
	Width as DWORD
	Height as DWORD
	MinZ as single
	MaxZ as single
end type

type D3DVIEWPORT9 as _D3DVIEWPORT9

type _D3DVOLUME_DESC
	Format as D3DFORMAT
	as D3DRESOURCETYPE Type
	Usage as DWORD
	Pool as D3DPOOL
	Width as UINT
	Height as UINT
	Depth as UINT
end type

type D3DVOLUME_DESC as _D3DVOLUME_DESC

type D3DSCANLINEORDERING as long
enum
	D3DSCANLINEORDERING_UNKNOWN
	D3DSCANLINEORDERING_PROGRESSIVE
	D3DSCANLINEORDERING_INTERLACED
end enum

type D3DDISPLAYMODEFILTER
	Size as UINT
	Format as D3DFORMAT
	ScanLineOrdering as D3DSCANLINEORDERING
end type

type D3DDISPLAYMODEEX
	Size as UINT
	Width as UINT
	Height as UINT
	RefreshRate as UINT
	Format as D3DFORMAT
	ScanLineOrdering as D3DSCANLINEORDERING
end type

type D3DDISPLAYROTATION as long
enum
	D3DDISPLAYROTATION_IDENTITY = 1
	D3DDISPLAYROTATION_90
	D3DDISPLAYROTATION_180
	D3DDISPLAYROTATION_270
end enum

type _D3DCOMPOSERECTSOP as long
enum
	D3DCOMPOSERECTS_COPY = 1
	D3DCOMPOSERECTS_OR
	D3DCOMPOSERECTS_AND
	D3DCOMPOSERECTS_NEG
	D3DCOMPOSERECTS_FORCE_DWORD = &h7fffffff
end enum

type D3DCOMPOSERECTSOP as _D3DCOMPOSERECTSOP

type _D3DPRESENTSTATS
	PresentCount as UINT
	PresentRefreshCount as UINT
	SyncRefreshCount as UINT
	SyncQPCTime as LARGE_INTEGER
	SyncGPUTime as LARGE_INTEGER
end type

type D3DPRESENTSTATS as _D3DPRESENTSTATS

type _D3DSHADER_COMPARISON as long
enum
	D3DSPC_RESERVED0 = 0
	D3DSPC_GT
	D3DSPC_EQ
	D3DSPC_GE
	D3DSPC_LT
	D3DSPC_NE
	D3DSPC_LE
	D3DSPC_RESERVED1
end enum

type D3DSHADER_COMPARISON as _D3DSHADER_COMPARISON
