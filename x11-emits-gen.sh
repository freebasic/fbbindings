#!/bin/bash
set -e

function work() {
	part="$1"

	outfile=x11-emits-$part-generated.fbfrog
	rm -f "$outfile"

	for i in `cat x11-list-$part.txt`; do
		echo "-emit '*/X11/$i.h' inc/X11/$i.bi" >> "$outfile"
	done
}

work main
work internal
