FBFROG := fbfrog

.PHONY: default cunit libpng12 libpng14 libpng15 libpng16 libzip
default:

CLANG_VERSION := 3.5.0
CLANG_TITLE := cfe-$(CLANG_VERSION).src
clang:
	./downloadextract.sh $(CLANG_TITLE) $(CLANG_TITLE).tar.xz "http://llvm.org/releases/$(CLANG_VERSION)/$(CLANG_TITLE).tar.xz"
	mkdir -p inc/clang-c
	$(FBFROG) -o inc/clang-c/BuildSystem.bi           extracted/$(CLANG_TITLE)/include/clang-c/BuildSystem.h           -incdir extracted/$(CLANG_TITLE)/include -filterout '*'
	$(FBFROG) -o inc/clang-c/CXCompilationDatabase.bi extracted/$(CLANG_TITLE)/include/clang-c/CXCompilationDatabase.h -incdir extracted/$(CLANG_TITLE)/include -filterout '*'
	$(FBFROG) -o inc/clang-c/CXErrorCode.bi           extracted/$(CLANG_TITLE)/include/clang-c/CXErrorCode.h           -incdir extracted/$(CLANG_TITLE)/include -filterout '*'
	$(FBFROG) -o inc/clang-c/CXString.bi              extracted/$(CLANG_TITLE)/include/clang-c/CXString.h              -incdir extracted/$(CLANG_TITLE)/include -filterout '*'
	$(FBFROG) -o inc/clang-c/Documentation.bi         extracted/$(CLANG_TITLE)/include/clang-c/Documentation.h         -incdir extracted/$(CLANG_TITLE)/include -filterout '*'
	$(FBFROG) -o inc/clang-c/Index.bi                 extracted/$(CLANG_TITLE)/include/clang-c/Index.h                 -incdir extracted/$(CLANG_TITLE)/include -filterout '*'

CUNIT_VERSION := 2.1-2
CUNIT_TITLE := CUnit-$(CUNIT_VERSION)
cunit:
	./downloadextract.sh $(CUNIT_TITLE) $(CUNIT_TITLE)-src.tar.bz2 "http://sourceforge.net/projects/cunit/files/CUnit/$(CUNIT_VERSION)/$(CUNIT_TITLE)-src.tar.bz2/download"
	$(FBFROG) cunit.fbfrog -o inc extracted/$(CUNIT_TITLE)/CUnit/Headers/CUnit.h

LIBPNG12_TITLE := libpng-1.2.50
libpng12:
	./downloadextract.sh $(LIBPNG12_TITLE) $(LIBPNG12_TITLE).tar.xz "http://downloads.sourceforge.net/libpng/$(LIBPNG12_TITLE).tar.xz?download"
	$(FBFROG) png.fbfrog -o inc/png12.bi extracted/$(LIBPNG12_TITLE)/png.h

LIBPNG14_TITLE := libpng-1.4.12
libpng14:
	./downloadextract.sh $(LIBPNG14_TITLE) $(LIBPNG14_TITLE).tar.xz "http://downloads.sourceforge.net/libpng/$(LIBPNG14_TITLE).tar.xz?download"
	$(FBFROG) png.fbfrog -o inc/png14.bi extracted/$(LIBPNG14_TITLE)/png.h

LIBPNG15_TITLE := libpng-1.5.17
libpng15:
	./downloadextract.sh $(LIBPNG15_TITLE) $(LIBPNG15_TITLE).tar.xz "http://downloads.sourceforge.net/libpng/$(LIBPNG15_TITLE).tar.xz?download"
	cp extracted/$(LIBPNG15_TITLE)/scripts/pnglibconf.h.prebuilt \
	   extracted/$(LIBPNG15_TITLE)/pnglibconf.h
	$(FBFROG) png.fbfrog -o inc/png15.bi extracted/$(LIBPNG15_TITLE)/png.h

LIBPNG16_TITLE := libpng-1.6.6
libpng16:
	./downloadextract.sh $(LIBPNG16_TITLE) $(LIBPNG16_TITLE).tar.xz "http://downloads.sourceforge.net/libpng/$(LIBPNG16_TITLE).tar.xz?download"
	cp extracted/$(LIBPNG16_TITLE)/scripts/pnglibconf.h.prebuilt \
	   extracted/$(LIBPNG16_TITLE)/pnglibconf.h
	$(FBFROG) png.fbfrog -o inc/png16.bi extracted/$(LIBPNG16_TITLE)/png.h

LIBZIP_VERSION := 0.11.2
LIBZIP_TITLE := libzip-$(LIBZIP_VERSION)
libzip:
	./downloadextract.sh $(LIBZIP_TITLE) $(LIBZIP_TITLE).tar.xz "http://www.nih.at/libzip/$(LIBZIP_TITLE).tar.xz"
	# Need to compile libzip in order to get zipconf.h
	# (luckily it's the same for all targets)
	cd extracted/$(LIBZIP_TITLE) && \
		if [ ! -f lib/zipconf.h ]; then ./configure && make; fi
	$(FBFROG) zip.fbfrog -o inc extracted/$(LIBZIP_TITLE)/lib/zip.h
