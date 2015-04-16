#!/bin/bash
set -e

function work() {
	part="$1"

	while read var header; do
		legal=$(./x11-get-legal-file-name.sh $header)
		echo "producing $legal"

		case "$header" in
		extensions/xf86vm|extensions/xf86vmode|extensions/xf86vmproto)
			./getcomment extracted/xorg/X11/$header.h > $legal;;

		CreateI|ImUtil|ShellI|X|XF86keysym|Xatom|Xcursor/Xcursor|Xft/Xft|Xproto|Xw32defs|\
		extensions/XvMC|\
		extensions/XvMCproto|\
		extensions/Xxf86dga|\
		extensions/lbxbuf|\
		extensions/lbxbufstr|\
		extensions/lbxdeltastr|\
		extensions/lbximage|\
		extensions/lbxopts|\
		extensions/lbxzlib|\
		extensions/recordstr|\
		extensions/shapestr|\
		extensions/xf86*|\
		extensions/xtestext1*)
			echo TODO > $legal;;
		*)
			./getcomment extracted/xorg/X11/$header.h > $legal;;
		esac
	done < x11-list-$part.txt
}

work main
work internal
