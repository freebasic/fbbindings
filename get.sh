#!/bin/bash
#
# If not already extracted, download a .tar.gz or .zip to tarballs/ and extract it to extracted/.
# These names can include a subdirectory prefix.
#
set -ex

output="extracted/$1"
tarball="tarballs/$2"
url="$3"
createdir="$4"

if [ -d "$output" ]; then
	exit
fi

outputdir=$(dirname "$output")
tarballdir=$(dirname "$tarball")

mkdir -p "$outputdir" "$tarballdir"  # Usually tarballs extracted

# If the download failed previously, try to resume it.
# (WARNING: if the file is modified and increases in length,
# this will create garbage!)
# Increase the max number of redirection to 30 because
# the mirror autoselect function of SourceForge can test
# all mirrors before finding the closest
# (08/08/2018 : there are 25 mirrors)
wget -c --max-redirect=30 "$url" -O "$tarball" || exit 1

if [ "$createdir" = "createdir" ]; then
	mkdir "$output"
	case "$tarball" in
	*.zip) unzip -q -d "$output/" "$tarball";;
	*)     tar xf "$tarball" -C "$output/";;
	esac
else
	case "$tarball" in
	*.zip) unzip -q -d "$outputdir/" "$tarball";;
	*)     tar xf "$tarball" -C "$outputdir/";;
	esac
fi
