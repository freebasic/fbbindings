#!/bin/bash
set -e

libffidir="$1"
FFI_VERSION="$2"

function get_target() {
	case "$1" in
	freebsd-x86 | openbsd-x86) echo X86_FREEBSD;;
	darwin-x86)    echo X86_DARWIN;;
	darwin-x86_64) echo X86_DARWIN;;
	win32 | cygwin-x86)    echo X86_WIN32;;
	win64 | cygwin-x86_64) echo X86_WIN64;;
	*-arm)     echo ARM;;
	*-aarch64) echo AARCH64;;
	*-x86)    echo X86;;
	*-x86_64) echo X86_64;;
	esac
}

for i in `cat ffi-targets.txt`; do
	echo "generating $libffidir/include/ffi-$i.h"
	sed \
		-e "s/@TARGET@/`get_target $i`/g" \
		-e 's/@HAVE_LONG_DOUBLE@/1/g' \
		-e 's/@FFI_EXEC_TRAMPOLINE_TABLE@/0/g' \
		-e "s/@VERSION@/$FFI_VERSION/g" \
		< $libffidir/include/ffi.h.in > $libffidir/include/ffi-$i.h
done
