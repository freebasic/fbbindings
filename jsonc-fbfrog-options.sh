#!/bin/bash
set -e

jsonc="$1"
jsoncdir="extracted/$2"

for hfile in `cat jsonc-headers.txt`; do
	bifile=inc/json-c/${hfile%.h}.bi
	echo \
		-include $hfile \
		-emit "*/$hfile" $bifile \
		-title "$jsonc" "$jsoncdir/${hfile%.h}.tmp" fbteam.txt $bifile
done
