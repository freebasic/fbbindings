#!/bin/bash
set -e

function check_bi() {
	bi="$1"

	case "$bi" in

	# Exclude the custom (non-generated) files from the check for fbfrog-style titles
	"inc/curses.bi"|\
	"inc/gdk/gdk.bi"|\
	"inc/GL/gl.bi"|\
	"inc/GL/glext.bi"|\
	"inc/GL/glu.bi"|\
	"inc/gtkgl/gdkgl.bi"|\
	"inc/gtkgl/gtkgl.bi"|\
	"inc/gtk/gtk.bi"|\
	"inc/png.bi"|\
	"inc/win/ole-common.bi")
		;;

	*)
		line1="`head -1 $bi`"
		line3="`head -3 $bi | tail -1`"

		case "${line1}${line3}" in
		"'' FreeBASIC binding for "*"'' based on the C header files:")
			;;
		*)
			echo "$bi: missing fbfrog title"
			;;
		esac
	esac

	if grep -xq "#pragma once" "$bi"; then
		:
	else
		echo "$bi: missing #pragma once"
	fi
}

find inc -type f | sort | while read bi; do
	check_bi $bi
done
