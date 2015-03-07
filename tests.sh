#!/bin/bash
set -e

FBC=`printenv FBC || exit 0`
FBC=${FBC:-fbc}

function run_tests() {
	testdir="$1"
	fbtarget="$2"
	tests=`ls $testdir/*.bas`
	for i in $tests; do
		echo "TEST $fbtarget $i"
		$FBC -i inc $i -target $fbtarget -r -maxerr 1
		rm -f ${i%.bas}.asm ${i%.bas}.c
	done
}

run_tests tests dos
run_tests tests linux-x86
run_tests tests linux-x86_64
run_tests tests win32
run_tests tests win64

run_tests tests/no-dos linux-x86
run_tests tests/no-dos linux-x86_64
run_tests tests/no-dos win32
run_tests tests/no-dos win64

run_tests tests/winapi win32
run_tests tests/winapi win64
