#!/bin/bash
set -ex

MINGWW64_DIR="$1"
MINGWW64_TITLE="$2"

outfile=winapi-titles-generated.fbfrog
rm -f $outfile

function addtitle() {
	echo "-title $MINGWW64_TITLE $2 fbteam.txt inc/win/$1.bi" >> $outfile
}

function work() {
	apis="$1"
	dir="$2"

	for i in $apis; do
		h=$dir/$i.h

		header=$(head -7 $h)

		case "$header" in
		*DISCLAIMER\.PD*)
			addtitle "$i" mingw-w64-disclaimer-pd.tmp
			;;
		*DISCLAIMER*)
			addtitle "$i" mingw-w64-disclaimer.tmp
			;;
		esac
	done
}

work "$(cat winapi-list-crt.txt)"  "$MINGWW64_DIR/mingw-w64-headers/crt"
work "$(cat winapi-list-main.txt)" "$MINGWW64_DIR/mingw-w64-headers/include"
