#!/bin/bash
set -e

lzodir="extracted/$1"

for hpath in "$lzodir"/include/lzo/*.h; do
	./getcomment $hpath > ${hpath%.h}.tmp
done
