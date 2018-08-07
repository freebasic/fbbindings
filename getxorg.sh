#!/bin/bash
set -e

dirname="extracted/xorg/$1"
tarball="tarballs/xorg/$2"
url="$3"

mkdir -p tarballs/xorg extracted/xorg

# If the download failed previously, try to resume it before 
wget --no-verbose -c "$url" -O "$tarball"

if [ $? -eq 0 ]; then
	if [ ! -d "$dirname" ]; then
		tar xf "$tarball" -C extracted/xorg
	fi
fi
