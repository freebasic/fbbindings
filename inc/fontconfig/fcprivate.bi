#pragma once

#define _FCPRIVATE_H_
#macro FcPatternVapBuild(result, orig, va)
	scope
		dim __p__ as FcPattern ptr = (orig)
		dim __o__ as const zstring ptr
		dim __v__ as FcValue
		'' TODO: if (!__p__) { __p__ = FcPatternCreate (); if (!__p__) goto _FcPatternVapBuild_bail0; }
		'' TODO: for (;;) { __o__ = va_arg (va, const char *); if (!__o__) break; __v__.type = va_arg (va, int); switch (__v__.type) { case FcTypeUnknown: case FcTypeVoid: goto _FcPatternVapBuild_bail1; case FcTypeInteger: __v__.u.i = va_arg (va, int); break; case FcTypeDouble: __v__.u.d = va_arg (va, double); break; case FcTypeString: __v__.u.s = va_arg (va, const FcChar8 *); break; case FcTypeBool: __v__.u.b = va_arg (va, FcBool); break; case FcTypeMatrix: __v__.u.m = va_arg (va, const FcMatrix *); break; case FcTypeCharSet: __v__.u.c = va_arg (va, const FcCharSet *); break; case FcTypeFTFace: __v__.u.f = va_arg (va, FT_Face); break; case FcTypeLangSet: __v__.u.l = va_arg (va, const FcLangSet *); break; } if (!FcPatternAdd (__p__, __o__, __v__, FcTrue)) goto _FcPatternVapBuild_bail1; }
		'' TODO: result = __p__;
		'' TODO: goto _FcPatternVapBuild_return;
		'' TODO: _FcPatternVapBuild_bail1: if (!orig) FcPatternDestroy (__p__);
		'' TODO: _FcPatternVapBuild_bail0: result = (void*)0;
		'' TODO: _FcPatternVapBuild_return: ;
	end scope
#endmacro
#macro FcObjectSetVapBuild(__ret__, __first__, __va__)
	scope
		dim __os__ as FcObjectSet ptr
		dim __ob__ as const zstring ptr
		'' TODO: __ret__ = 0;
		'' TODO: __os__ = FcObjectSetCreate ();
		'' TODO: if (!__os__) goto _FcObjectSetVapBuild_bail0;
		'' TODO: __ob__ = __first__;
		'' TODO: while (__ob__) { if (!FcObjectSetAdd (__os__, __ob__)) goto _FcObjectSetVapBuild_bail1; __ob__ = va_arg (__va__, const char *); }
		'' TODO: __ret__ = __os__;
		'' TODO: _FcObjectSetVapBuild_bail1: if (!__ret__ && __os__) FcObjectSetDestroy (__os__);
		'' TODO: _FcObjectSetVapBuild_bail0: ;
	end scope
#endmacro
