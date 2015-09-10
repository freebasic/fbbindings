#!/bin/bash
set -e

vlc="$1"
vlcdir="extracted/$vlc"

for i in "$vlcdir"/include/vlc/*.h; do
	hfile=`basename $i`
	bifile=inc/vlc/${hfile%.h}.bi
	echo $i -emit "*/$i" $bifile -title "$vlc" ${i%.h}.tmp fbteam.txt $bifile
done
