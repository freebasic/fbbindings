#!/bin/bash
set -ex

dirname="extracted/$1"
tarball="tarballs/$2"
url="$3"

mkdir -p tarballs/ extracted/

# If the download failed previously, try to resume it before
# Increase the max number of redirection to 30 because
# the mirror autoselect function of SourceForge can test
# all mirrors before finding the closest
# (08/08/2018 : there are 25 mirrors)
wget -c --max-redirect=30 "$url" -O "$tarball"

if [ $? -eq 0 ]; then
	if [ ! -d "$dirname" ]; then
		mkdir "$dirname"
		case "$tarball" in
		*.zip) unzip -q -d "$dirname/" "$tarball";;
		*)     tar xf "$tarball" -C "$dirname/";;
		esac
	fi
	
	cd "$dirname"
	
	# If the content of the tarball is in a single folder at the top,
	# It's useless and we remove it.
	# Worst, useless folder can be deeper than 1 level, so do it in a loop
	while true
	do
		# Count the number of non special (. or ..) folders
		nbdir=$(ls -aAd * | wc -l)
		
		# count the number of folders and files
		nbobj=$(ls -A | wc -l)
		
		# If the are a single rootdir, romove it
		# Otherwise, we have nothing to do
		if [ "$nbdir" -eq "$nbobj" ]; then
			if [ "$nbdir" -eq "1" ]; then
				# Get a random uuid and rename the rootdir with it
				#in case the rootdir has a directory named like it
				rootdir=$(ls -aAd *)
				duuid=$(uuidgen -t)
				mv "$rootdir" "$duuid"
				
				# Move the content of the rootdir one level up
				# and remove the rootdir
				mv -f "$duuid"/* .
				rm -rf "$duuid"
			else
				break
			fi
		else
			break
		fi
	done
fi
