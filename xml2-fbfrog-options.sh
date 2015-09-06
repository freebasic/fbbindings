#!/bin/bash
set -e

xml2="$1"

for hpath in "extracted/$xml2/include/libxml"/*.h; do
	hfile="`basename "$hpath"`"
	bifile=inc/libxml/${hfile%.h}.bi
	echo \
		-include libxml/$hfile \
		-emit "*/$hfile" $bifile \
		-title "$xml2" xml2.tmp fbteam.txt $bifile
done
