#!/bin/bash
set -e

gsl="$1"
gsldir="extracted/$gsl"

for i in "$gsldir"/gsl/*.h; do
	hfile=`basename $i`
	bifile=inc/gsl/${hfile%.h}.bi
	echo $i -emit "*/$i" $bifile -title "$gsl" ${i%.h}.tmp fbteam.txt $bifile
done
