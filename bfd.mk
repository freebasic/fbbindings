bfd: tools

	./get.sh $(BINUTILS_216) $(BINUTILS_216).tar.bz2 http://ftp.gnu.org/gnu/binutils/$(BINUTILS_216).tar.bz2
	./get.sh $(BINUTILS_217) $(BINUTILS_217).tar.bz2 http://ftp.gnu.org/gnu/binutils/$(BINUTILS_217).tar.bz2
	./get.sh $(BINUTILS_218) $(BINUTILS_218).tar.bz2 http://ftp.gnu.org/gnu/binutils/$(BINUTILS_218).tar.bz2
	./get.sh $(BINUTILS_219) $(BINUTILS_219).tar.bz2 http://ftp.gnu.org/gnu/binutils/$(BINUTILS_219).tar.bz2
	./get.sh $(BINUTILS_220) $(BINUTILS_220).tar.bz2 http://ftp.gnu.org/gnu/binutils/$(BINUTILS_220).tar.bz2
	./get.sh $(BINUTILS_221) $(BINUTILS_221).tar.bz2 http://ftp.gnu.org/gnu/binutils/$(BINUTILS_221).tar.bz2
	./get.sh $(BINUTILS_222) $(BINUTILS_222).tar.bz2 http://ftp.gnu.org/gnu/binutils/$(BINUTILS_222).tar.bz2
	./get.sh $(BINUTILS_223) $(BINUTILS_223).tar.bz2 http://ftp.gnu.org/gnu/binutils/$(BINUTILS_223).tar.bz2
	./get.sh $(BINUTILS_224) $(BINUTILS_224).tar.bz2 http://ftp.gnu.org/gnu/binutils/$(BINUTILS_224).tar.bz2
	./get.sh $(BINUTILS_225) $(BINUTILS_225).tar.bz2 http://ftp.gnu.org/gnu/binutils/$(BINUTILS_225).tar.bz2

	sed $(BINUTILS_SED_32) < extracted/$(BINUTILS_216)/bfd/bfd-in2.h > extracted/$(BINUTILS_216)/bfd/bfd-in3-32.h
	sed $(BINUTILS_SED_32) < extracted/$(BINUTILS_217)/bfd/bfd-in2.h > extracted/$(BINUTILS_217)/bfd/bfd-in3-32.h
	sed $(BINUTILS_SED_32) < extracted/$(BINUTILS_218)/bfd/bfd-in2.h > extracted/$(BINUTILS_218)/bfd/bfd-in3-32.h
	sed $(BINUTILS_SED_32) < extracted/$(BINUTILS_219)/bfd/bfd-in2.h > extracted/$(BINUTILS_219)/bfd/bfd-in3-32.h
	sed $(BINUTILS_SED_32) < extracted/$(BINUTILS_220)/bfd/bfd-in2.h > extracted/$(BINUTILS_220)/bfd/bfd-in3-32.h
	sed $(BINUTILS_SED_32) < extracted/$(BINUTILS_221)/bfd/bfd-in2.h > extracted/$(BINUTILS_221)/bfd/bfd-in3-32.h
	sed $(BINUTILS_SED_32) < extracted/$(BINUTILS_222)/bfd/bfd-in2.h > extracted/$(BINUTILS_222)/bfd/bfd-in3-32.h
	sed $(BINUTILS_SED_32) < extracted/$(BINUTILS_223)/bfd/bfd-in2.h > extracted/$(BINUTILS_223)/bfd/bfd-in3-32.h
	sed $(BINUTILS_SED_32) < extracted/$(BINUTILS_224)/bfd/bfd-in2.h > extracted/$(BINUTILS_224)/bfd/bfd-in3-32.h
	sed $(BINUTILS_SED_32) < extracted/$(BINUTILS_225)/bfd/bfd-in2.h > extracted/$(BINUTILS_225)/bfd/bfd-in3-32.h

	sed $(BINUTILS_SED_64) < extracted/$(BINUTILS_216)/bfd/bfd-in2.h > extracted/$(BINUTILS_216)/bfd/bfd-in3-64.h
	sed $(BINUTILS_SED_64) < extracted/$(BINUTILS_217)/bfd/bfd-in2.h > extracted/$(BINUTILS_217)/bfd/bfd-in3-64.h
	sed $(BINUTILS_SED_64) < extracted/$(BINUTILS_218)/bfd/bfd-in2.h > extracted/$(BINUTILS_218)/bfd/bfd-in3-64.h
	sed $(BINUTILS_SED_64) < extracted/$(BINUTILS_219)/bfd/bfd-in2.h > extracted/$(BINUTILS_219)/bfd/bfd-in3-64.h
	sed $(BINUTILS_SED_64) < extracted/$(BINUTILS_220)/bfd/bfd-in2.h > extracted/$(BINUTILS_220)/bfd/bfd-in3-64.h
	sed $(BINUTILS_SED_64) < extracted/$(BINUTILS_221)/bfd/bfd-in2.h > extracted/$(BINUTILS_221)/bfd/bfd-in3-64.h
	sed $(BINUTILS_SED_64) < extracted/$(BINUTILS_222)/bfd/bfd-in2.h > extracted/$(BINUTILS_222)/bfd/bfd-in3-64.h
	sed $(BINUTILS_SED_64) < extracted/$(BINUTILS_223)/bfd/bfd-in2.h > extracted/$(BINUTILS_223)/bfd/bfd-in3-64.h
	sed $(BINUTILS_SED_64) < extracted/$(BINUTILS_224)/bfd/bfd-in2.h > extracted/$(BINUTILS_224)/bfd/bfd-in3-64.h
	sed $(BINUTILS_SED_64) < extracted/$(BINUTILS_225)/bfd/bfd-in2.h > extracted/$(BINUTILS_225)/bfd/bfd-in3-64.h

	sed $(BINUTILS_SED_DJGPP) < extracted/$(BINUTILS_216)/bfd/bfd-in2.h > extracted/$(BINUTILS_216)/bfd/bfd-in3-djgpp.h
	sed $(BINUTILS_SED_DJGPP) < extracted/$(BINUTILS_217)/bfd/bfd-in2.h > extracted/$(BINUTILS_217)/bfd/bfd-in3-djgpp.h
	sed $(BINUTILS_SED_DJGPP) < extracted/$(BINUTILS_218)/bfd/bfd-in2.h > extracted/$(BINUTILS_218)/bfd/bfd-in3-djgpp.h
	sed $(BINUTILS_SED_DJGPP) < extracted/$(BINUTILS_219)/bfd/bfd-in2.h > extracted/$(BINUTILS_219)/bfd/bfd-in3-djgpp.h
	sed $(BINUTILS_SED_DJGPP) < extracted/$(BINUTILS_220)/bfd/bfd-in2.h > extracted/$(BINUTILS_220)/bfd/bfd-in3-djgpp.h
	sed $(BINUTILS_SED_DJGPP) < extracted/$(BINUTILS_221)/bfd/bfd-in2.h > extracted/$(BINUTILS_221)/bfd/bfd-in3-djgpp.h
	sed $(BINUTILS_SED_DJGPP) < extracted/$(BINUTILS_222)/bfd/bfd-in2.h > extracted/$(BINUTILS_222)/bfd/bfd-in3-djgpp.h
	sed $(BINUTILS_SED_DJGPP) < extracted/$(BINUTILS_223)/bfd/bfd-in2.h > extracted/$(BINUTILS_223)/bfd/bfd-in3-djgpp.h
	sed $(BINUTILS_SED_DJGPP) < extracted/$(BINUTILS_224)/bfd/bfd-in2.h > extracted/$(BINUTILS_224)/bfd/bfd-in3-djgpp.h
	sed $(BINUTILS_SED_DJGPP) < extracted/$(BINUTILS_225)/bfd/bfd-in2.h > extracted/$(BINUTILS_225)/bfd/bfd-in3-djgpp.h

	$(GETCOMMENT) -2 extracted/$(BINUTILS_225)/bfd/bfd-in2.h > bfd-225.tmp

	$(FBFROG) bfd.fbfrog \
		-declareversions __BFD_VER__ 216 217 218 219 220 221 222 223 224 225 \
		-selectversion \
		-case 216 \
			-incdir extracted/$(BINUTILS_216)/include \
			-selecttarget \
			-case dos \
				extracted/$(BINUTILS_216)/bfd/bfd-in3-djgpp.h \
			-case 64bit \
				extracted/$(BINUTILS_216)/bfd/bfd-in3-64.h \
			-caseelse \
				extracted/$(BINUTILS_216)/bfd/bfd-in3-32.h \
			-endselect \
		-case 217 \
			-incdir extracted/$(BINUTILS_217)/include \
			-selecttarget \
			-case dos \
				extracted/$(BINUTILS_217)/bfd/bfd-in3-djgpp.h \
			-case 64bit \
				extracted/$(BINUTILS_217)/bfd/bfd-in3-64.h \
			-caseelse \
				extracted/$(BINUTILS_217)/bfd/bfd-in3-32.h \
			-endselect \
		-case 218 \
			-incdir extracted/$(BINUTILS_218)/include \
			-selecttarget \
			-case dos \
				extracted/$(BINUTILS_218)/bfd/bfd-in3-djgpp.h \
			-case 64bit \
				extracted/$(BINUTILS_218)/bfd/bfd-in3-64.h \
			-caseelse \
				extracted/$(BINUTILS_218)/bfd/bfd-in3-32.h \
			-endselect \
		-case 219 \
			-incdir extracted/$(BINUTILS_219)/include \
			-selecttarget \
			-case dos \
				extracted/$(BINUTILS_219)/bfd/bfd-in3-djgpp.h \
			-case 64bit \
				extracted/$(BINUTILS_219)/bfd/bfd-in3-64.h \
			-caseelse \
				extracted/$(BINUTILS_219)/bfd/bfd-in3-32.h \
			-endselect \
		-case 220 \
			-incdir extracted/$(BINUTILS_220)/include \
			-selecttarget \
			-case dos \
				extracted/$(BINUTILS_220)/bfd/bfd-in3-djgpp.h \
			-case 64bit \
				extracted/$(BINUTILS_220)/bfd/bfd-in3-64.h \
			-caseelse \
				extracted/$(BINUTILS_220)/bfd/bfd-in3-32.h \
			-endselect \
		-case 221 \
			-incdir extracted/$(BINUTILS_221)/include \
			-selecttarget \
			-case dos \
				extracted/$(BINUTILS_221)/bfd/bfd-in3-djgpp.h \
			-case 64bit \
				extracted/$(BINUTILS_221)/bfd/bfd-in3-64.h \
			-caseelse \
				extracted/$(BINUTILS_221)/bfd/bfd-in3-32.h \
			-endselect \
		-case 222 \
			-incdir extracted/$(BINUTILS_222)/include \
			-selecttarget \
			-case dos \
				extracted/$(BINUTILS_222)/bfd/bfd-in3-djgpp.h \
			-case 64bit \
				extracted/$(BINUTILS_222)/bfd/bfd-in3-64.h \
			-caseelse \
				extracted/$(BINUTILS_222)/bfd/bfd-in3-32.h \
			-endselect \
		-case 223 \
			-incdir extracted/$(BINUTILS_223)/include \
			-selecttarget \
			-case dos \
				extracted/$(BINUTILS_223)/bfd/bfd-in3-djgpp.h \
			-case 64bit \
				extracted/$(BINUTILS_223)/bfd/bfd-in3-64.h \
			-caseelse \
				extracted/$(BINUTILS_223)/bfd/bfd-in3-32.h \
			-endselect \
		-case 224 \
			-incdir extracted/$(BINUTILS_224)/include \
			-selecttarget \
			-case dos \
				extracted/$(BINUTILS_224)/bfd/bfd-in3-djgpp.h \
			-case 64bit \
				extracted/$(BINUTILS_224)/bfd/bfd-in3-64.h \
			-caseelse \
				extracted/$(BINUTILS_224)/bfd/bfd-in3-32.h \
			-endselect \
		-case 225 \
			-incdir extracted/$(BINUTILS_225)/include \
			-selecttarget \
			-case dos \
				extracted/$(BINUTILS_225)/bfd/bfd-in3-djgpp.h \
			-case 64bit \
				extracted/$(BINUTILS_225)/bfd/bfd-in3-64.h \
			-caseelse \
				extracted/$(BINUTILS_225)/bfd/bfd-in3-32.h \
			-endselect \
		-endselect \
		-emit '*/bfd/bfd-*.h' inc/bfd.bi \
		-title "$(BINUTILS_216), $(BINUTILS_217), $(BINUTILS_218), $(BINUTILS_219), $(BINUTILS_220), $(BINUTILS_221), $(BINUTILS_222), $(BINUTILS_223), $(BINUTILS_224), $(BINUTILS_225)" bfd-225.tmp fbteam.txt inc/bfd.bi \
		-inclib bfd -inclib iberty \
		-selecttarget \
		-case windows \
			-inclib intl \
		-case dos \
			-inclib intl \
		-endselect

	rm *.tmp
