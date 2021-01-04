#!/bin/bash
# An alternative to get.sh.
# If the content of the tarball is in a single folder at the toplevel,
# factor it out. Repeat if deeper than 1 level.
# This is also useful if you want to extract to a directory named
# differently than the one inside the tarball.

set -ex

output="extracted/$1"

./get.sh "$1" "$2" "$3" createdir || exit 1

cd "$output"

while true
do
	# Count the number of non special (. or ..) folders
	nbdir=$(ls -aAd * | wc -l)

	# count the number of folders and files
	nbobj=$(ls -A | wc -l)

	# If the are a single rootdir, remove it
	# Otherwise, we have nothing to do
	if [ "$nbdir" -eq "$nbobj" ] && [ "$nbdir" -eq "1" ]; then
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
done
