#!/bin/bash
set -e

source lib/tests-common.sh

run_tests tests/winapi win32
run_tests tests/winapi win64
