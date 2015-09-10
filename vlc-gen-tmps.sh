#!/bin/bash
set -e

vlcdir="extracted/$1"

for i in "$vlcdir"/include/vlc/*.h; do
	./getcomment $i > ${i%.h}.tmp
done
