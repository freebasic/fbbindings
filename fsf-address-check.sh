#!/bin/bash
set -e

function check_bi() {
	bi="$1"
	if grep -q -f fsf-address-bad-patterns.txt "$bi"; then
		echo "$bi"
	fi
}

find inc -type f | sort | while read bi; do
	check_bi $bi
done
