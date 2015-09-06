#!/bin/bash
set -e

xslt="$1"

for hpath in "extracted/$xslt/libxslt"/*.h; do
	hfile="`basename "$hpath"`"
	bifile=inc/libxslt/${hfile%.h}.bi
	echo \
		-include libxslt/$hfile \
		-emit "*/libxslt/$hfile" $bifile \
		-title "$xslt" xslt.tmp fbteam.txt $bifile
done
