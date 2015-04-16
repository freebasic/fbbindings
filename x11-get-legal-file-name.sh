#!/bin/bash
set -e

header="$1"

# Produce name for the temp file holding the copyright/license info
# Since the names from the x11-list-*.txt files can contain / slashes,
# we have to replace them to produce simple file names. a/b is turned
# into a-b which should be safe from accidential collision, because
# at least currently there are no -'s used in the names.
echo x11-$(echo $header | tr '/' '-').tmp
