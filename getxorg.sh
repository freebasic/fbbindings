#!/bin/bash
set -e

dirname="extracted/xorg/$1"
tarball="tarballs/xorg/$2"
url="$3"

mkdir -p tarballs/xorg extracted/xorg

# If the download failed previously, try to resume it before
# Increase the max number of redirection to 30 because
# the mirror autoselect function of SourceForge can test
# all mirrors before finding the closest
# (08/08/2018 : there are 25 mirrors)
wget --no-verbose -c --max-redirect=30 "$url" -O "$tarball"

if [ $? -eq 0 ]; then
	if [ ! -d "$dirname" ]; then
		tar xf "$tarball" -C extracted/xorg
	fi
fi
