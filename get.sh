#!/bin/bash
set -ex

dirname="extracted/$1"
tarball="tarballs/$2"
url="$3"
createdir="$4"
pathstoextract="$5"

mkdir -p tarballs/ extracted/

if [ ! -f "$tarball" ]; then
	wget "$url" -O "$tarball"
fi

if [ ! -d "$dirname" ]; then
	if [ "$createdir" = "createdir" ]; then
		mkdir "$dirname"
		case "$tarball" in
		*.zip) unzip -q -d "$dirname/" "$tarball" $pathstoextract;;
		*)     tar xf "$tarball" -C "$dirname/" $pathstoextract;;
		esac
	else
		case "$tarball" in
		*.zip) unzip -q -d extracted/ "$tarball" $pathstoextract;;
		*)     tar xf "$tarball" -C extracted/ $pathstoextract;;
		esac
	fi
fi
