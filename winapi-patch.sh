#!/bin/bash
set -e

if [ ! -f patched.stamp ]; then
	patch -p1 < ../../winapi-shlobj-add-missing-methods.patch
	cd mingw-w64-headers/crt
	sed -e 's/@MINGW_HAS_SECURE_API@/#define MINGW_HAS_SECURE_API 1/g' < _mingw.h.in > _mingw.h
	sed -e 's/MINGW_HAS_DX$/1/g' < sdks/_mingw_directx.h.in > sdks/_mingw_directx.h
	sed -e 's/MINGW_HAS_DDK$/1/g' < sdks/_mingw_ddk.h.in > sdks/_mingw_ddk.h
	cd ..
	echo "#pragma once" >> direct-x/include/vfwmsgs.h
	echo "#pragma once" >> include/uuids.h
	cd ..
	touch patched.stamp
fi
