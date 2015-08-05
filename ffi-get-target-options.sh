#!/bin/bash
set -e

libffidir="$1"

function get_targetdir() {
	case "$1" in
	*-arm)     echo arm;;
	*-aarch64) echo aarch64;;
	*)         echo x86;;
	esac
}

for i in `cat ffi-targets.txt`; do
	echo "-iftarget $i"
		echo "$libffidir/include/ffi-$i.h"
		echo "-incdir $libffidir/src/`get_targetdir $i`"
	echo "-endif"
done
