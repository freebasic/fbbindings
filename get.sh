#!/bin/bash
set -e

dirname="extracted/$1"
tarball="tarballs/$2"
url="$3"
createdir="$4"

mkdir -p tarballs/ extracted/

if [ ! -f "$tarball" ]; then
	wget --no-verbose "$url" -O "$tarball"
fi

if [ ! -d "$dirname" ]; then
	if [ "$createdir" = "createdir" ]; then
		mkdir "$dirname"
		case "$tarball" in
		*.zip) unzip -q -d "$dirname/" "$tarball";;
		*)     tar xf "$tarball" -C "$dirname/";;
		esac
	else
		case "$tarball" in
		*.zip) unzip -q -d extracted/ "$tarball";;
		*)     tar xf "$tarball" -C extracted/;;
		esac
	fi
fi
