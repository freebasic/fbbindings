#!/bin/bash
set -e

outfile=winapi-emits-generated.fbfrog
rm -f "$outfile"

for i in `cat winapi-list-crt.txt winapi-list-main.txt winapi-list-directx.txt`; do
	echo "-emit '*/$i.h' inc/win/$i.bi" >> "$outfile"
done
