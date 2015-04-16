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

		# Some need to be created "manually" though
		CreateI|ImUtil|ShellI|XF86keysym|Xatom|Xw32defs|\
		extensions/recordstr|\
		extensions/shapestr|\
		extensions/xf86dga|\
		extensions/xf86dga1|\
		extensions/xf86dga1const|\
		extensions/xf86dga1proto|\
		extensions/xf86dga1str|\
		extensions/xf86dgaconst|\
		extensions/xf86dgaproto|\
		extensions/xf86dgastr|\
		extensions/xf86vmstr|\
		extensions/XvMC|\
		extensions/XvMCproto|\
		extensions/Xxf86dga)
			if [ ! -f "$legal" ]; then
				echo "missing file $legal"
			fi
			;;

		X|\
		Xcursor/Xcursor|\
		Xft/Xft|\
		extensions/lbxbuf|\
		extensions/lbxbufstr|\
		extensions/lbxdeltastr|\
		extensions/lbximage|\
		extensions/lbxopts|\
		extensions/lbxzlib|\
		extensions/xtestext1|\
		extensions/xtestext1const|\
		extensions/xtestext1proto)
			./getcomment -2 extracted/xorg/X11/$header.h > $legal;;

		Xproto)
			./getcomment -3 extracted/xorg/X11/$header.h > $legal;;

		*)
			./getcomment extracted/xorg/X11/$header.h > $legal;;
		esac
	done < x11-list-$part.txt
}

work main
work internal
