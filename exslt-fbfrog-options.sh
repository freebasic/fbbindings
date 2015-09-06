#!/bin/bash
set -e

xslt="$1"

for hpath in "extracted/$xslt/libexslt"/*.h; do
	hfile="`basename "$hpath"`"
	bifile=inc/libexslt/${hfile%.h}.bi
	echo \
		-include libexslt/$hfile \
		-emit "*/libexslt/$hfile" $bifile \
		-title "$xslt" exslt.tmp fbteam.txt $bifile
done
