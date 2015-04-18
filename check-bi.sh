#!/bin/bash
set -e

function check_bi() {
	bi="$1"

	line1="`head -1 $bi`"
	line3="`head -3 $bi | tail -1`"

	case "${line1}${line3}" in
	"'' FreeBASIC binding for "*"'' based on the C header files:")
		;;
	*)
		echo $bi
		;;
	esac
}

find inc -type f | sort | while read bi; do
	check_bi $bi
done
