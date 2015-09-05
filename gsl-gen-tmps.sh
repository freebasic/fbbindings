#!/bin/bash
set -e

gsldir="extracted/$1"

for i in "$gsldir"/gsl/*.h; do
	hname=`basename "$i"`
	tmp=${i%.h}.tmp
	case $i in
	*/gsl_block.h)          ./getcomment ${i%$hname}gsl_block_int.h          | tail -n+2 > $tmp;;
	*/gsl_matrix.h)         ./getcomment ${i%$hname}gsl_matrix_int.h         | tail -n+2 > $tmp;;
	*/gsl_permute.h)        ./getcomment ${i%$hname}gsl_permute_int.h        | tail -n+2 > $tmp;;
	*/gsl_permute_vector.h) ./getcomment ${i%$hname}gsl_permute_vector_int.h | tail -n+2 > $tmp;;
	*/gsl_sf.h)             ./getcomment ${i%$hname}gsl_sf_log.h             | tail -n+2 > $tmp;;
	*/gsl_sort.h)           ./getcomment ${i%$hname}gsl_sort_int.h           | tail -n+2 > $tmp;;
	*/gsl_sort_vector.h)    ./getcomment ${i%$hname}gsl_sort_int.h           | tail -n+2 > $tmp;;
	*/gsl_statistics.h)     ./getcomment ${i%$hname}gsl_statistics_int.h     | tail -n+2 > $tmp;;
	*/gsl_vector.h)         ./getcomment ${i%$hname}gsl_vector_int.h         | tail -n+2 > $tmp;;
	*/gsl_vector_complex.h) ./getcomment ${i%$hname}gsl_vector_int.h         | tail -n+2 > $tmp;;
	*/gsl_version.h)
		./getcomment ${i%$hname}gsl_block_int.h | tail -n+4 > $tmp
		;;
	*/gsl_machine.h|*/gsl_qrng.h|*/gsl_specfunc.h)
		./getcomment $i > $tmp
		./getcomment ${i%$hname}gsl_block_int.h | tail -n+4 >> $tmp
		;;
	*)
		./getcomment $i > $tmp
		;;
	esac
done
