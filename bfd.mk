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

	$(GETCOMMENT) -2 extracted/$(BINUTILS_216)/bfd/bfd-in2.h > bfd-216.tmp
	$(GETCOMMENT) -2 extracted/$(BINUTILS_217)/bfd/bfd-in2.h > bfd-217.tmp
	$(GETCOMMENT) -2 extracted/$(BINUTILS_218)/bfd/bfd-in2.h > bfd-218.tmp
	$(GETCOMMENT) -2 extracted/$(BINUTILS_219)/bfd/bfd-in2.h > bfd-219.tmp
	$(GETCOMMENT) -2 extracted/$(BINUTILS_220)/bfd/bfd-in2.h > bfd-220.tmp
	$(GETCOMMENT) -2 extracted/$(BINUTILS_221)/bfd/bfd-in2.h > bfd-221.tmp
	$(GETCOMMENT) -2 extracted/$(BINUTILS_222)/bfd/bfd-in2.h > bfd-222.tmp
	$(GETCOMMENT) -2 extracted/$(BINUTILS_223)/bfd/bfd-in2.h > bfd-223.tmp
	$(GETCOMMENT) -2 extracted/$(BINUTILS_224)/bfd/bfd-in2.h > bfd-224.tmp
	$(GETCOMMENT) -2 extracted/$(BINUTILS_225)/bfd/bfd-in2.h > bfd-225.tmp

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
		-emit '*' inc/bfd/bfd-216.bi \
		-title $(BINUTILS_216) bfd-216.tmp fbteam.txt inc/bfd/bfd-216.bi

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
		-emit '*' inc/bfd/bfd-217.bi \
		-title $(BINUTILS_217) bfd-217.tmp fbteam.txt inc/bfd/bfd-217.bi

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
		-emit '*' inc/bfd/bfd-218.bi \
		-title $(BINUTILS_218) bfd-218.tmp fbteam.txt inc/bfd/bfd-218.bi

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
		-emit '*' inc/bfd/bfd-219.bi \
		-title $(BINUTILS_219) bfd-219.tmp fbteam.txt inc/bfd/bfd-219.bi

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
		-emit '*' inc/bfd/bfd-220.bi \
		-title $(BINUTILS_220) bfd-220.tmp fbteam.txt inc/bfd/bfd-220.bi

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
		-emit '*' inc/bfd/bfd-221.bi \
		-title $(BINUTILS_221) bfd-221.tmp fbteam.txt inc/bfd/bfd-221.bi

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
		-emit '*' inc/bfd/bfd-222.bi \
		-title $(BINUTILS_222) bfd-222.tmp fbteam.txt inc/bfd/bfd-222.bi

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
		-emit '*' inc/bfd/bfd-223.bi \
		-title $(BINUTILS_223) bfd-223.tmp fbteam.txt inc/bfd/bfd-223.bi

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
		-emit '*' inc/bfd/bfd-224.bi \
		-title $(BINUTILS_224) bfd-224.tmp fbteam.txt inc/bfd/bfd-224.bi

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
		-emit '*' inc/bfd/bfd-225.bi \
		-title $(BINUTILS_225) bfd-225.tmp fbteam.txt inc/bfd/bfd-225.bi

	$(GETCOMMENT) -2 extracted/$(BINUTILS_225)/bfd/bfd-in2.h > bfd-225.tmp

	$(FBFROG) bfd.fbfrog \
		-declareversions __BFD_VER__ 216 217 218 219 220 221 222 223 224 225 \
		-select __BFD_VER__ \
		-case 216 \
			-ifdef __FB_DOS__ \
				extracted/$(BINUTILS_216)/bfd/bfd-in3-djgpp.h \
			-else \
				-ifdef __FB_64BIT__ \
					extracted/$(BINUTILS_216)/bfd/bfd-in3-64.h \
				-else \
					extracted/$(BINUTILS_216)/bfd/bfd-in3-32.h \
				-endif \
			-endif \
		-case 217 \
			-ifdef __FB_DOS__ \
				extracted/$(BINUTILS_217)/bfd/bfd-in3-djgpp.h \
			-else \
				-ifdef __FB_64BIT__ \
					extracted/$(BINUTILS_217)/bfd/bfd-in3-64.h \
				-else \
					extracted/$(BINUTILS_217)/bfd/bfd-in3-32.h \
				-endif \
			-endif \
		-case 218 \
			-ifdef __FB_DOS__ \
				extracted/$(BINUTILS_218)/bfd/bfd-in3-djgpp.h \
			-else \
				-ifdef __FB_64BIT__ \
					extracted/$(BINUTILS_218)/bfd/bfd-in3-64.h \
				-else \
					extracted/$(BINUTILS_218)/bfd/bfd-in3-32.h \
				-endif \
			-endif \
		-case 219 \
			-ifdef __FB_DOS__ \
				extracted/$(BINUTILS_219)/bfd/bfd-in3-djgpp.h \
			-else \
				-ifdef __FB_64BIT__ \
					extracted/$(BINUTILS_219)/bfd/bfd-in3-64.h \
				-else \
					extracted/$(BINUTILS_219)/bfd/bfd-in3-32.h \
				-endif \
			-endif \
		-case 220 \
			-ifdef __FB_DOS__ \
				extracted/$(BINUTILS_220)/bfd/bfd-in3-djgpp.h \
			-else \
				-ifdef __FB_64BIT__ \
					extracted/$(BINUTILS_220)/bfd/bfd-in3-64.h \
				-else \
					extracted/$(BINUTILS_220)/bfd/bfd-in3-32.h \
				-endif \
			-endif \
		-case 221 \
			-ifdef __FB_DOS__ \
				extracted/$(BINUTILS_221)/bfd/bfd-in3-djgpp.h \
			-else \
				-ifdef __FB_64BIT__ \
					extracted/$(BINUTILS_221)/bfd/bfd-in3-64.h \
				-else \
					extracted/$(BINUTILS_221)/bfd/bfd-in3-32.h \
				-endif \
			-endif \
		-case 222 \
			-ifdef __FB_DOS__ \
				extracted/$(BINUTILS_222)/bfd/bfd-in3-djgpp.h \
			-else \
				-ifdef __FB_64BIT__ \
					extracted/$(BINUTILS_222)/bfd/bfd-in3-64.h \
				-else \
					extracted/$(BINUTILS_222)/bfd/bfd-in3-32.h \
				-endif \
			-endif \
		-case 223 \
			-ifdef __FB_DOS__ \
				extracted/$(BINUTILS_223)/bfd/bfd-in3-djgpp.h \
			-else \
				-ifdef __FB_64BIT__ \
					extracted/$(BINUTILS_223)/bfd/bfd-in3-64.h \
				-else \
					extracted/$(BINUTILS_223)/bfd/bfd-in3-32.h \
				-endif \
			-endif \
		-case 224 \
			-ifdef __FB_DOS__ \
				extracted/$(BINUTILS_224)/bfd/bfd-in3-djgpp.h \
			-else \
				-ifdef __FB_64BIT__ \
					extracted/$(BINUTILS_224)/bfd/bfd-in3-64.h \
				-else \
					extracted/$(BINUTILS_224)/bfd/bfd-in3-32.h \
				-endif \
			-endif \
		-case 225 \
			-ifdef __FB_DOS__ \
				extracted/$(BINUTILS_225)/bfd/bfd-in3-djgpp.h \
			-else \
				-ifdef __FB_64BIT__ \
					extracted/$(BINUTILS_225)/bfd/bfd-in3-64.h \
				-else \
					extracted/$(BINUTILS_225)/bfd/bfd-in3-32.h \
				-endif \
			-endif \
		-endselect \
		-emit '*' inc/bfd/bfd-merged.bi \
		-title "$(BINUTILS_216), $(BINUTILS_217), $(BINUTILS_218), $(BINUTILS_219), $(BINUTILS_220), $(BINUTILS_221), $(BINUTILS_222), $(BINUTILS_223), $(BINUTILS_224), $(BINUTILS_225)" bfd-225.tmp fbteam.txt inc/bfd/bfd-merged.bi

	rm *.tmp
