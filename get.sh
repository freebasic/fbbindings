#!/bin/bash
#
#  ./get.sh <output> <filename> <url> [createdir]
#
# If not already done, download $url (a .tar.gz or .zip or single .h) and
# extract it at extracted/$output/ or (.h files) place it
# extracted/$output/$filename.
# If 'createdir', extract it INSIDE extracted/$output/ instead of assuming
# tarball contains that subdir. (No effect single .h's: always created)
# Downloaded tarballs are cached at tarballs/$filename.
# $output and $filename can include a subdirectory prefix.

set -ex

output="extracted/$1"
download="tarballs/$2"
url="$3"
createdir="$4"

if [ -d "$output" ]; then
	exit
fi

outputdir=$(dirname "$output")
downloaddir=$(dirname "$download")

mkdir -p "$outputdir" "$downloaddir"  # Usually "tarballs", "extracted"

# If the download failed previously, try to resume it.
# (WARNING: if the file is modified and increases in length,
# this will create garbage!)
# Increase the max number of redirection to 30 because
# the mirror autoselect function of SourceForge can test
# all mirrors before finding the closest
# (08/08/2018 : there are 25 mirrors)
wget -c --max-redirect=30 "$url" -O "$download" || exit 1

if [ "$createdir" = "createdir" ]; then
	mkdir "$output"
	case "$download" in
	*.zip)  unzip -q -d "$output/" "$download";;
	*.tar*|*.tgz) tar xf "$download" -C "$output/";;
	*)      mv "$download" "$output/";;
	esac
else
	case "$download" in
	*.zip)  unzip -q -d "$outputdir/" "$download";;
	*.tar*|*.tgz) tar xf "$download" -C "$outputdir/";;
	*)      mkdir "$output";  # Always createdir
		mv "$download" "$output/";;
	esac
fi
