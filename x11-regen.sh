#!/bin/bash
set -e

function work() {
	part="$1"

	emitsfile=x11-emits-$part-generated.fbfrog
	rm -f "$emitsfile"
	while read discard header; do
		echo "-emit '*/X11/$header.h' inc/X11/$header.bi" >> "$emitsfile"
	done < x11-list-$part.txt

	titlesfile=x11-titles-$part-generated.mk
	rm -f "$titlesfile"
	while read var header; do
		legal=$(./x11-get-legal-file-name.sh $header)
		echo "x11_titles_$part += -title \$(X11_$var) $legal fbteam.txt inc/X11/$header.bi" >> "$titlesfile"
	done < x11-list-$part.txt
}

work main
work internal
