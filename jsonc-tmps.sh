#!/bin/bash
set -e

jsoncdir="extracted/$1"

for hfile in `cat jsonc-headers.txt`; do
	hpath="$jsoncdir/$hfile"
	./getcomment "$hpath" > "${hpath%.h}.tmp"
done
