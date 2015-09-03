#!/bin/bash
set -e

flitetitle="$1"

for hpath in "extracted/$flitetitle/include"/*.h; do
	hfile="`basename "$hpath"`"
	echo "-emit */$hfile inc/flite/${hfile%.h}.bi"
done
