#!/bin/bash
set -e

source lib/tests-common.sh

run_tests tests linux-x86
run_tests tests linux-x86_64
run_tests tests win32
run_tests tests win64
run_tests tests dos
