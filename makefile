FBFROG := fbfrog

.PHONY: all clang cunit png12 png14 png15 png16 zip

all: clang cunit png12 png14 png15 png16 zip

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

FFI_TITLE := libffi-3.1
ffi:
	./downloadextract.sh $(FFI_TITLE) $(FFI_TITLE).tar.gz "ftp://sourceware.org/pub/libffi/$(FFI_TITLE).tar.gz"
	# Run libffi's configure script in order to get ffi.h (and ffitarget.h)
	# TODO: the chosen ffi.h/ffitarget.h settings depend on the host system,
	# so it'd be better to generate the proper ffi.h manually for the
	# targets we need.
	cd extracted/$(FFI_TITLE) && \
		if [ ! -f include/ffi.h ]; then ./configure --disable-builddir; fi
	$(FBFROG) ffi.fbfrog -o inc extracted/$(FFI_TITLE)/include/ffi.h

PNG12_TITLE := libpng-1.2.50
png12:
	./downloadextract.sh $(PNG12_TITLE) $(PNG12_TITLE).tar.xz "http://downloads.sourceforge.net/libpng/$(PNG12_TITLE).tar.xz?download"
	$(FBFROG) png.fbfrog -o inc/png12.bi extracted/$(PNG12_TITLE)/png.h

PNG14_TITLE := libpng-1.4.12
png14:
	./downloadextract.sh $(PNG14_TITLE) $(PNG14_TITLE).tar.xz "http://downloads.sourceforge.net/libpng/$(PNG14_TITLE).tar.xz?download"
	$(FBFROG) png.fbfrog -o inc/png14.bi extracted/$(PNG14_TITLE)/png.h

PNG15_TITLE := libpng-1.5.17
png15:
	./downloadextract.sh $(PNG15_TITLE) $(PNG15_TITLE).tar.xz "http://downloads.sourceforge.net/libpng/$(PNG15_TITLE).tar.xz?download"
	cp extracted/$(PNG15_TITLE)/scripts/pnglibconf.h.prebuilt \
	   extracted/$(PNG15_TITLE)/pnglibconf.h
	$(FBFROG) png.fbfrog -o inc/png15.bi extracted/$(PNG15_TITLE)/png.h

PNG16_TITLE := libpng-1.6.6
png16:
	./downloadextract.sh $(PNG16_TITLE) $(PNG16_TITLE).tar.xz "http://downloads.sourceforge.net/libpng/$(PNG16_TITLE).tar.xz?download"
	cp extracted/$(PNG16_TITLE)/scripts/pnglibconf.h.prebuilt \
	   extracted/$(PNG16_TITLE)/pnglibconf.h
	$(FBFROG) png.fbfrog -o inc/png16.bi extracted/$(PNG16_TITLE)/png.h

ZIP_VERSION := 0.11.2
ZIP_TITLE := libzip-$(ZIP_VERSION)
zip:
	./downloadextract.sh $(ZIP_TITLE) $(ZIP_TITLE).tar.xz "http://www.nih.at/libzip/$(ZIP_TITLE).tar.xz"
	# Need to compile libzip in order to get zipconf.h
	# (luckily it's the same for all targets)
	cd extracted/$(ZIP_TITLE) && \
		if [ ! -f lib/zipconf.h ]; then ./configure && make; fi
	$(FBFROG) zip.fbfrog -o inc extracted/$(ZIP_TITLE)/lib/zip.h

ZLIB_TITLE := zlib-1.2.8
zlib:
	./downloadextract.sh $(ZLIB_TITLE) $(ZLIB_TITLE).tar.xz "http://zlib.net/$(ZLIB_TITLE).tar.xz"
	$(FBFROG) zlib.fbfrog -o inc extracted/$(ZLIB_TITLE)/zlib.h
