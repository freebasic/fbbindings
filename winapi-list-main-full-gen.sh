#!/bin/bash
set -e

mingwincludedir="$1"
if [ ! -d "$mingwincludedir" ]; then
	echo "usage: ./this.sh mingw-w64-headers/include"
	exit 1
fi

ls "${mingwincludedir}"*.h | \
	sed -e "s:^${mingwincludedir}::g" | \
	sed -e 's/\.h$//g' | \
	grep -v -f winapi-list-main-full-excludes.txt > winapi-list-main-full.txt
