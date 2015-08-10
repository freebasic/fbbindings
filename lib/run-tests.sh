#!/bin/bash
set -e

FBC=`printenv FBC || exit 0`
FBC=${FBC:-fbc}

testdir="$1"
fbtargets="$2"

for i in `ls $testdir/*.bas`; do
	for fbtarget in $fbtargets; do
		echo "TEST $i $fbtarget"
		$FBC -i inc $i -target $fbtarget -r -maxerr 1
		rm -f ${i%.bas}.asm ${i%.bas}.c
	done
done
