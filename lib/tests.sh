#!/bin/bash
set -e

source lib/tests-common.sh

run_tests tests linux-x86
run_tests tests linux-x86_64
run_tests tests linux-arm
run_tests tests linux-aarch64
run_tests tests freebsd-x86
run_tests tests freebsd-x86_64
run_tests tests freebsd-arm
run_tests tests freebsd-aarch64
run_tests tests openbsd-x86
run_tests tests openbsd-x86_64
run_tests tests openbsd-arm
run_tests tests openbsd-aarch64
run_tests tests netbsd-x86
run_tests tests netbsd-x86_64
run_tests tests netbsd-arm
run_tests tests netbsd-aarch64
run_tests tests darwin-x86
run_tests tests darwin-x86_64
run_tests tests win32
run_tests tests win64
run_tests tests cygwin-x86
run_tests tests cygwin-x86_64
run_tests tests dos
