#!/bin/bash
set -ex

dirname="extracted/$1"
tarball="tarballs/$2"
url="$3"
createdir="$4"

mkdir -p tarballs/ extracted/

# If the download failed previously, try to resume it before
# Increase the max number of redirection to 30 because
# the mirror autoselect function of SourceForge can test
# all mirrors before finding the closest
# (08/08/2018 : there are 25 mirrors)
wget -c --max-redirect=30 "$url" -O "$tarball"

if [ $? -eq 0 ]; then
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
fi
