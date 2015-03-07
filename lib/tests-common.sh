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
