#!/bin/bash
set -e

dirname="extracted/xorg/$1"
tarball="tarballs/xorg/$2"
url="$3"

mkdir -p tarballs/xorg extracted/xorg

if [ ! -f "$tarball" ]; then
	wget --no-verbose "$url" -O "$tarball"
fi

if [ ! -d "$dirname" ]; then
	tar xf "$tarball" -C extracted/xorg
fi
