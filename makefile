FBFROG := fbfrog

ALL := allegro cgui clang cunit ffi iup jit ncurses pdcurses png12 png14 png15 png16 zip
.PHONY: all clean $(ALL)
all: $(ALL)

clean:
	rm -rf extracted/*

ALLEGRO_VERSION := 5.0.10
ALLEGRO_TITLE := allegro-$(ALLEGRO_VERSION)
allegro:
	./downloadextract.sh $(ALLEGRO_TITLE) $(ALLEGRO_TITLE).tar.gz "http://sourceforge.net/projects/alleg/files/allegro/$(ALLEGRO_VERSION)/$(ALLEGRO_TITLE).tar.gz/download"
	mkdir -p inc/allegro5
	$(FBFROG) allegro5.fbfrog -o inc/allegro5 extracted/$(ALLEGRO_TITLE)/include/allegro5/allegro.h -incdir extracted/$(ALLEGRO_TITLE)/include

cgui:
	./downloadextract.sh cgui cgui-2.0.3.tar.gz "http://sourceforge.net/projects/cgui/files/2.0.3/cgui-2.0.3.tar.gz/download"
	$(FBFROG) cgui.fbfrog -o inc extracted/cgui/include/cgui.h

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

CUNIT_VERSION := 2.1-3
CUNIT_TITLE := CUnit-$(CUNIT_VERSION)
cunit:
	./downloadextract.sh $(CUNIT_TITLE) $(CUNIT_TITLE).tar.bz2 "http://sourceforge.net/projects/cunit/files/CUnit/$(CUNIT_VERSION)/$(CUNIT_TITLE).tar.bz2/download"
	cd extracted/$(CUNIT_TITLE)/CUnit/Headers && \
		if [ ! -f CUnit.h ]; then \
			sed -e 's/@VERSION@-@RELEASE@/$(CUNIT_VERSION)/g' < CUnit.h.in > CUnit.h; \
		fi
	mkdir -p inc/CUnit
	$(FBFROG) cunit.fbfrog -filterout '*' -o inc/CUnit/Automated.bi extracted/$(CUNIT_TITLE)/CUnit/Headers/Automated.h
	$(FBFROG) cunit.fbfrog -filterout '*' -o inc/CUnit/Basic.bi     extracted/$(CUNIT_TITLE)/CUnit/Headers/Basic.h
	$(FBFROG) cunit.fbfrog -filterout '*' -o inc/CUnit/Console.bi   extracted/$(CUNIT_TITLE)/CUnit/Headers/Console.h
	$(FBFROG) cunit.fbfrog -filterout '*' -o inc/CUnit/CUCurses.bi  extracted/$(CUNIT_TITLE)/CUnit/Headers/CUCurses.h
	$(FBFROG) cunit.fbfrog -filterout '*' -o inc/CUnit/CUError.bi   extracted/$(CUNIT_TITLE)/CUnit/Headers/CUError.h
	$(FBFROG) cunit.fbfrog -filterout '*' -o inc/CUnit/CUnit.bi     extracted/$(CUNIT_TITLE)/CUnit/Headers/CUnit.h
	$(FBFROG) cunit.fbfrog -filterout '*' -o inc/CUnit/TestDB.bi    extracted/$(CUNIT_TITLE)/CUnit/Headers/TestDB.h
	$(FBFROG) cunit.fbfrog -filterout '*' -o inc/CUnit/TestRun.bi   extracted/$(CUNIT_TITLE)/CUnit/Headers/TestRun.h
	$(FBFROG) cunit.fbfrog -filterout '*' -o inc/CUnit/Util.bi      extracted/$(CUNIT_TITLE)/CUnit/Headers/Util.h

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

IUP_VERSION := 3.11.2
IUP_TITLE := iup-3.11.2_Sources
iup:
	./downloadextract.sh iup $(IUP_TITLE).tar.gz "http://sourceforge.net/projects/iup/files/$(IUP_VERSION)/Docs%20and%20Sources/$(IUP_TITLE).tar.gz/download"
	mkdir -p inc/IUP
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iupcb.h
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iupcbox.h
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iupcbs.h
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iupcells.h
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iupcolorbar.h
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iupcontrols.h
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iupdef.h
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iupdial.h
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iupgauge.h
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iupgc.h
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iupgetparam.h
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iupglcontrols.h
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iupgl.h
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iup.h
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iupim.h		iupim.fbfrog
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iupkey.h
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iupluacontrols.h	iuplua.fbfrog
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iupluaglcontrols.h	iuplua.fbfrog
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iupluagl.h		iuplua.fbfrog
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iuplua.h		iuplua.fbfrog
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iupluaim.h		iuplua.fbfrog
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iupluamatrixex.h	iuplua.fbfrog
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iuplua_mglplot.h	iuplua.fbfrog
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iupluaole.h		iuplua.fbfrog
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iuplua_pplot.h	iuplua.fbfrog
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iuplua_scintilla.h	iuplua.fbfrog iupscintilla.fbfrog
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iupluatuio.h		iuplua.fbfrog
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iupluaweb.h		iuplua.fbfrog
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iupmask.h
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iupmatrixex.h
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iupmatrix.h
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iup_mglplot.h
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iupole.h
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iup_pplot.h
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iupsbox.h
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iup_scintilla.h	iupscintilla.fbfrog
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iupspin.h
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iuptabs.h
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iuptree.h
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iuptuio.h
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iupval.h
	$(FBFROG) -o inc/IUP -filterout '*' extracted/iup/include/iupweb.h

JIT_TITLE := libjit-a8293e141b79c28734a3633a81a43f92f29fc2d7
jit:
	./downloadextract.sh $(JIT_TITLE) $(JIT_TITLE).tar.gz "http://git.savannah.gnu.org/cgit/libjit.git/snapshot/$(JIT_TITLE).tar.gz"
	cd extracted/$(JIT_TITLE) && \
		if [ ! -f include/jit/jit-arch.h ]; then ./auto_gen.sh && ./configure && make; fi
	$(FBFROG) jit.fbfrog -o inc extracted/$(JIT_TITLE)/include/jit/jit.h -incdir extracted/$(JIT_TITLE)/include

NCURSES_TITLE := ncurses-5.9
ncurses:
	./downloadextract.sh $(NCURSES_TITLE) $(NCURSES_TITLE).tar.gz "http://ftp.gnu.org/pub/gnu/ncurses/$(NCURSES_TITLE).tar.gz"
	cd extracted/$(NCURSES_TITLE) && \
		if [ ! -f include/curses.h ]; then ./configure && cd include && make; fi
	mkdir -p inc/ncurses
	$(FBFROG) ncurses.fbfrog -o inc/ncurses/curses.bi  extracted/$(NCURSES_TITLE)/include/curses.h
	$(FBFROG) ncurses.fbfrog -o inc/ncurses/term.bi    extracted/$(NCURSES_TITLE)/include/term.h
	$(FBFROG) ncurses.fbfrog -o inc/ncurses/termcap.bi extracted/$(NCURSES_TITLE)/include/termcap.h

pdcurses:
	./downloadextract.sh PDCurses-3.4 PDCurses-3.4.tar.gz "http://sourceforge.net/projects/pdcurses/files/pdcurses/3.4/PDCurses-3.4.tar.gz/download"
	mkdir -p inc/pdcurses
	$(FBFROG) pdcurses.fbfrog -o inc/pdcurses/curses.bi extracted/PDCurses-3.4/curses.h
	$(FBFROG) pdcurses.fbfrog -o inc/pdcurses/panel.bi extracted/PDCurses-3.4/panel.h -filterout '*curses.h'
	$(FBFROG) pdcurses.fbfrog -o inc/pdcurses/term.bi extracted/PDCurses-3.4/term.h -filterout '*curses.h'

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

ZIP_TITLE := libzip-0.11.2
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
