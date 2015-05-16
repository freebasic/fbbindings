#!/bin/bash

versions="216 217 218 219 220 221 222 223 224 225"

echo "bfd:" > bfd.mk
echo "	mkdir -p inc/bfd" >> bfd.mk

echo >> bfd.mk
for v in $versions; do
	echo "	./get.sh \$(BINUTILS_$v) \$(BINUTILS_$v).tar.bz2 http://ftp.gnu.org/gnu/binutils/\$(BINUTILS_$v).tar.bz2" >> bfd.mk
done

echo >> bfd.mk
for v in $versions; do
	echo "	sed \$(BINUTILS_SED_32) < extracted/\$(BINUTILS_$v)/bfd/bfd-in2.h > extracted/\$(BINUTILS_$v)/bfd/bfd-in3-32.h" >> bfd.mk
done

echo >> bfd.mk
for v in $versions; do
	echo "	sed \$(BINUTILS_SED_64) < extracted/\$(BINUTILS_$v)/bfd/bfd-in2.h > extracted/\$(BINUTILS_$v)/bfd/bfd-in3-64.h" >> bfd.mk
done

echo >> bfd.mk
for v in $versions; do
	echo "	sed \$(BINUTILS_SED_DJGPP) < extracted/\$(BINUTILS_$v)/bfd/bfd-in2.h > extracted/\$(BINUTILS_$v)/bfd/bfd-in3-djgpp.h" >> bfd.mk
done

for v in $versions; do
	cat >> bfd.mk <<EOF

	\$(FBFROG) bfd.fbfrog \\
		-ifdef __FB_DOS__ \\
			extracted/\$(BINUTILS_$v)/bfd/bfd-in3-djgpp.h \\
		-else \\
			-ifdef __FB_64BIT__ \\
				extracted/\$(BINUTILS_$v)/bfd/bfd-in3-64.h \\
			-else \\
				extracted/\$(BINUTILS_$v)/bfd/bfd-in3-32.h \\
			-endif \\
		-endif \\
		-o inc/bfd/bfd-$v.bi
EOF
done

cat >> bfd.mk <<EOF

bfd-merged:
	\$(FBFROG) bfd.fbfrog \\
		-declareversions __BFD_VER__ 216 217 218 219 220 221 222 223 224 225 \\
		-select __BFD_VER__ \\
EOF

for v in $versions; do
	cat >> bfd.mk <<EOF
		-case $v \\
			-ifdef __FB_DOS__ \\
				extracted/\$(BINUTILS_$v)/bfd/bfd-in3-djgpp.h \\
			-else \\
				-ifdef __FB_64BIT__ \\
					extracted/\$(BINUTILS_$v)/bfd/bfd-in3-64.h \\
				-else \\
					extracted/\$(BINUTILS_$v)/bfd/bfd-in3-32.h \\
				-endif \\
			-endif \\
EOF
done

cat >> bfd.mk <<EOF
		-endselect \\
		-o inc/bfd/bfd-merged.bi
EOF
