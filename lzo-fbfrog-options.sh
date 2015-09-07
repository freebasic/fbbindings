#!/bin/bash
set -e

lzo="$1"
lzodir="extracted/$lzo"

for hpath in "$lzodir"/include/lzo/*.h; do
	hfile=`basename $hpath`
	bifile=inc/lzo/${hfile%.h}.bi
	echo \
		-include lzo/$hfile \
		-emit "*/$hfile" $bifile \
		-title "$lzo" ${hpath%.h}.tmp fbteam.txt $bifile
done
