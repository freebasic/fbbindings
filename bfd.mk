bfd:
	mkdir -p inc/bfd

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

	$(FBFROG) bfd.fbfrog \
		-ifdef __FB_DOS__ \
			extracted/$(BINUTILS_216)/bfd/bfd-in3-djgpp.h \
		-else \
			-ifdef __FB_64BIT__ \
				extracted/$(BINUTILS_216)/bfd/bfd-in3-64.h \
			-else \
				extracted/$(BINUTILS_216)/bfd/bfd-in3-32.h \
			-endif \
		-endif \
		-o inc/bfd/bfd-216.bi

	$(FBFROG) bfd.fbfrog \
		-ifdef __FB_DOS__ \
			extracted/$(BINUTILS_217)/bfd/bfd-in3-djgpp.h \
		-else \
			-ifdef __FB_64BIT__ \
				extracted/$(BINUTILS_217)/bfd/bfd-in3-64.h \
			-else \
				extracted/$(BINUTILS_217)/bfd/bfd-in3-32.h \
			-endif \
		-endif \
		-o inc/bfd/bfd-217.bi

	$(FBFROG) bfd.fbfrog \
		-ifdef __FB_DOS__ \
			extracted/$(BINUTILS_218)/bfd/bfd-in3-djgpp.h \
		-else \
			-ifdef __FB_64BIT__ \
				extracted/$(BINUTILS_218)/bfd/bfd-in3-64.h \
			-else \
				extracted/$(BINUTILS_218)/bfd/bfd-in3-32.h \
			-endif \
		-endif \
		-o inc/bfd/bfd-218.bi

	$(FBFROG) bfd.fbfrog \
		-ifdef __FB_DOS__ \
			extracted/$(BINUTILS_219)/bfd/bfd-in3-djgpp.h \
		-else \
			-ifdef __FB_64BIT__ \
				extracted/$(BINUTILS_219)/bfd/bfd-in3-64.h \
			-else \
				extracted/$(BINUTILS_219)/bfd/bfd-in3-32.h \
			-endif \
		-endif \
		-o inc/bfd/bfd-219.bi

	$(FBFROG) bfd.fbfrog \
		-ifdef __FB_DOS__ \
			extracted/$(BINUTILS_220)/bfd/bfd-in3-djgpp.h \
		-else \
			-ifdef __FB_64BIT__ \
				extracted/$(BINUTILS_220)/bfd/bfd-in3-64.h \
			-else \
				extracted/$(BINUTILS_220)/bfd/bfd-in3-32.h \
			-endif \
		-endif \
		-o inc/bfd/bfd-220.bi

	$(FBFROG) bfd.fbfrog \
		-ifdef __FB_DOS__ \
			extracted/$(BINUTILS_221)/bfd/bfd-in3-djgpp.h \
		-else \
			-ifdef __FB_64BIT__ \
				extracted/$(BINUTILS_221)/bfd/bfd-in3-64.h \
			-else \
				extracted/$(BINUTILS_221)/bfd/bfd-in3-32.h \
			-endif \
		-endif \
		-o inc/bfd/bfd-221.bi

	$(FBFROG) bfd.fbfrog \
		-ifdef __FB_DOS__ \
			extracted/$(BINUTILS_222)/bfd/bfd-in3-djgpp.h \
		-else \
			-ifdef __FB_64BIT__ \
				extracted/$(BINUTILS_222)/bfd/bfd-in3-64.h \
			-else \
				extracted/$(BINUTILS_222)/bfd/bfd-in3-32.h \
			-endif \
		-endif \
		-o inc/bfd/bfd-222.bi

	$(FBFROG) bfd.fbfrog \
		-ifdef __FB_DOS__ \
			extracted/$(BINUTILS_223)/bfd/bfd-in3-djgpp.h \
		-else \
			-ifdef __FB_64BIT__ \
				extracted/$(BINUTILS_223)/bfd/bfd-in3-64.h \
			-else \
				extracted/$(BINUTILS_223)/bfd/bfd-in3-32.h \
			-endif \
		-endif \
		-o inc/bfd/bfd-223.bi

	$(FBFROG) bfd.fbfrog \
		-ifdef __FB_DOS__ \
			extracted/$(BINUTILS_224)/bfd/bfd-in3-djgpp.h \
		-else \
			-ifdef __FB_64BIT__ \
				extracted/$(BINUTILS_224)/bfd/bfd-in3-64.h \
			-else \
				extracted/$(BINUTILS_224)/bfd/bfd-in3-32.h \
			-endif \
		-endif \
		-o inc/bfd/bfd-224.bi

	$(FBFROG) bfd.fbfrog \
		-ifdef __FB_DOS__ \
			extracted/$(BINUTILS_225)/bfd/bfd-in3-djgpp.h \
		-else \
			-ifdef __FB_64BIT__ \
				extracted/$(BINUTILS_225)/bfd/bfd-in3-64.h \
			-else \
				extracted/$(BINUTILS_225)/bfd/bfd-in3-32.h \
			-endif \
		-endif \
		-o inc/bfd/bfd-225.bi
