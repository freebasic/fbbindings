FBFROG := fbfrog
FBC := fbc

ALL := allegro4 allegro5 cgui clang cunit ffi iup jit llvm lua ncurses pdcurses png png12 png14 png15 png16 zip zlib

.PHONY: all clean tests $(ALL)

all: $(ALL)

clean:
	rm -rf extracted/*

tests:
	$(FBC) -rr -i inc tests/*.bas -v && rm -f tests/*.asm

ALLEGRO4_VERSION := 4.4.2
ALLEGRO4_TITLE := allegro-$(ALLEGRO4_VERSION)
allegro4:
	./downloadextract.sh $(ALLEGRO4_TITLE) $(ALLEGRO4_TITLE).tar.gz "http://cdn.allegro.cc/file/library/allegro/$(ALLEGRO4_VERSION)/$(ALLEGRO4_TITLE).tar.gz"
	$(FBFROG) allegro4.fbfrog allegro.fbfrog -o inc/allegro.bi \
		extracted/$(ALLEGRO4_TITLE)/include/allegro.h \
		-incdir extracted/$(ALLEGRO4_TITLE)/include

ALLEGRO5_VERSION := 5.0.10
ALLEGRO5_TITLE := allegro-$(ALLEGRO5_VERSION)
allegro5:
	./downloadextract.sh $(ALLEGRO5_TITLE) $(ALLEGRO5_TITLE).tar.gz "http://cdn.allegro.cc/file/library/allegro/$(ALLEGRO5_VERSION)/$(ALLEGRO5_TITLE).tar.gz"
	mkdir -p inc/allegro5
	$(FBFROG) allegro5.fbfrog allegro.fbfrog -o inc/allegro5/allegro.bi \
		extracted/$(ALLEGRO5_TITLE)/include/allegro5/allegro.h \
		-incdir extracted/$(ALLEGRO5_TITLE)/include

cgui:
	./downloadextract.sh cgui cgui-2.0.3.tar.gz "http://sourceforge.net/projects/cgui/files/2.0.3/cgui-2.0.3.tar.gz/download"
	$(FBFROG) cgui.fbfrog -o inc extracted/cgui/include/cgui.h

CLANG_VERSION := 3.5.0
CLANG_TITLE := cfe-$(CLANG_VERSION).src
clang:
	./downloadextract.sh $(CLANG_TITLE) $(CLANG_TITLE).tar.xz "http://llvm.org/releases/$(CLANG_VERSION)/$(CLANG_TITLE).tar.xz"
	$(FBFROG) -o inc/clang-c.bi \
		extracted/$(CLANG_TITLE)/include/clang-c/Index.h \
		extracted/$(CLANG_TITLE)/include/clang-c/CXCompilationDatabase.h \
		-incdir extracted/$(CLANG_TITLE)/include \
		-removedefine CINDEX_LINKAGE

CUNIT_VERSION := 2.1-3
CUNIT_TITLE := CUnit-$(CUNIT_VERSION)
cunit:
	./downloadextract.sh $(CUNIT_TITLE) $(CUNIT_TITLE).tar.bz2 "http://sourceforge.net/projects/cunit/files/CUnit/$(CUNIT_VERSION)/$(CUNIT_TITLE).tar.bz2/download"
	cd extracted/$(CUNIT_TITLE)/CUnit/Headers && \
		sed -e 's/@VERSION@-@RELEASE@/$(CUNIT_VERSION)/g' < CUnit.h.in > CUnit.h
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


CURL_TITLE := curl-7.39.0
curl:
	./downloadextract.sh $(CURL_TITLE) $(CURL_TITLE).tar.lzma "http://curl.haxx.se/download/$(CURL_TITLE).tar.lzma"
	$(FBFROG) -o inc/curl.bi extracted/$(CURL_TITLE)/include/curl/curl.h \
		-removedefine CINIT \
		-removedefine CURL_EXTERN \
		\
		-noexpand CURLOPTTYPE_LONG \
		-noexpand CURLOPTTYPE_OBJECTPOINT \
		-noexpand CURLOPTTYPE_FUNCTIONPOINT \
		-noexpand CURLOPTTYPE_OFF_T \
		-noexpand CURLINFO_STRING \
		-noexpand CURLINFO_LONG \
		-noexpand CURLINFO_DOUBLE \
		-noexpand CURLINFO_SLIST \
		\
		-removedefine curl_easy_setopt \
		-removedefine curl_easy_getinfo \
		-removedefine curl_share_setopt \
		-removedefine curl_multi_setopt \
		\
		-filterout '*typecheck-gcc.h'

FFI_TITLE := libffi-3.1
ffi:
	./downloadextract.sh $(FFI_TITLE) $(FFI_TITLE).tar.gz "ftp://sourceware.org/pub/libffi/$(FFI_TITLE).tar.gz"
	# libffi's configure script generates ffi.h based on ffi.h.in (inserting @TARGET@)
	# and symlinks ffitarget.h to ../src/<arch>/ffitarget.h.
	# Both are target-specific, but since the process it's not very complex,
	# we can avoid running configure for all our targets and generate the
	# headers manually instead.
	cd extracted/$(FFI_TITLE)/include && \
		sed -e 's/@TARGET@/X86/g'       -e 's/@HAVE_LONG_DOUBLE@/1/g' -e 's/@FFI_EXEC_TRAMPOLINE_TABLE@/0/g' < ffi.h.in > ffi-x86.h       && \
		sed -e 's/@TARGET@/X86_WIN32/g' -e 's/@HAVE_LONG_DOUBLE@/1/g' -e 's/@FFI_EXEC_TRAMPOLINE_TABLE@/0/g' < ffi.h.in > ffi-x86-win32.h && \
		sed -e 's/@TARGET@/X86_WIN64/g' -e 's/@HAVE_LONG_DOUBLE@/1/g' -e 's/@FFI_EXEC_TRAMPOLINE_TABLE@/0/g' < ffi.h.in > ffi-x86-win64.h

	$(FBFROG) ffi.fbfrog -o inc/ffi.bi \
		-ifdef __FB_WIN32__						\
			-ifdef __FB_64BIT__					\
				extracted/$(FFI_TITLE)/include/ffi-x86-win64.h	\
			-else							\
				extracted/$(FFI_TITLE)/include/ffi-x86-win32.h	\
			-endif							\
		-else								\
			extracted/$(FFI_TITLE)/include/ffi-x86.h		\
		-endif								\
		-incdir extracted/$(FFI_TITLE)/src/x86

IUP_VERSION := 3.11.2
IUP_TITLE := iup-3.11.2_Sources
iup:
	./downloadextract.sh iup $(IUP_TITLE).tar.gz "http://sourceforge.net/projects/iup/files/$(IUP_VERSION)/Docs%20and%20Sources/$(IUP_TITLE).tar.gz/download"
	find extracted/iup/ -type d -exec chmod +x '{}' ';'
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

	# libjit symlinks jit-arch.h to jit-arch-{x86|x86-64}.h and generates
	# jit-opcode.h (and jit-opcode-x86.h) during its build process.
	cd extracted/$(JIT_TITLE) && \
		if [ ! -f include/jit/jit-opcode.h ]; then \
			./auto_gen.sh && ./configure && make; \
		fi

	cd extracted/$(JIT_TITLE)/include/jit			&& \
		rm -f jit-arch.h				&& \
		mkdir -p x86/jit x86_64/jit			&& \
		cp jit-arch-x86.h    x86/jit/jit-arch.h		&& \
		cp jit-arch-x86-64.h x86_64/jit/jit-arch.h

	$(FBFROG) jit.fbfrog -o inc extracted/$(JIT_TITLE)/include/jit/jit.h	\
		-incdir extracted/$(JIT_TITLE)/include				\
		-ifdef __FB_64BIT__						\
			-incdir extracted/$(JIT_TITLE)/include/jit/x86_64	\
		-else								\
			-incdir extracted/$(JIT_TITLE)/include/jit/x86		\
		-endif

LLVM_VERSION := 3.5.0
LLVM_TITLE := llvm-$(LLVM_VERSION).src
llvm:
	./downloadextract.sh $(LLVM_TITLE) $(LLVM_TITLE).tar.xz "http://llvm.org/releases/$(LLVM_VERSION)/$(LLVM_TITLE).tar.xz"

	cd extracted/$(LLVM_TITLE) && \
		if [ ! -f include/llvm/Config/Targets.def ]; then ./configure --prefix=/usr; fi

	$(FBFROG) -o inc/llvm-c.bi \
		-include stdbool.h \
		-define __STDC_LIMIT_MACROS 1 \
		-define __STDC_CONSTANT_MACROS 1 \
		-incdir extracted/$(LLVM_TITLE)/include \
		extracted/$(LLVM_TITLE)/include/llvm-c/Analysis.h		\
		extracted/$(LLVM_TITLE)/include/llvm-c/BitReader.h		\
		extracted/$(LLVM_TITLE)/include/llvm-c/BitWriter.h		\
		extracted/$(LLVM_TITLE)/include/llvm-c/Core.h			\
		extracted/$(LLVM_TITLE)/include/llvm-c/Disassembler.h		\
		extracted/$(LLVM_TITLE)/include/llvm-c/ExecutionEngine.h	\
		extracted/$(LLVM_TITLE)/include/llvm-c/Initialization.h		\
		extracted/$(LLVM_TITLE)/include/llvm-c/IRReader.h		\
		extracted/$(LLVM_TITLE)/include/llvm-c/Linker.h			\
		extracted/$(LLVM_TITLE)/include/llvm-c/LinkTimeOptimizer.h	\
		extracted/$(LLVM_TITLE)/include/llvm-c/lto.h			\
		extracted/$(LLVM_TITLE)/include/llvm-c/Object.h			\
		extracted/$(LLVM_TITLE)/include/llvm-c/Support.h		\
		extracted/$(LLVM_TITLE)/include/llvm-c/Target.h			\
		extracted/$(LLVM_TITLE)/include/llvm-c/TargetMachine.h		\
		-removedefine HAVE_INTTYPES_H	\
		-removedefine HAVE_STDINT_H	\
		-removedefine HAVE_UINT64_T	\
		-removedefine INT64_MAX		\
		-removedefine INT64_MIN		\
		-removedefine UINT64_MAX	\
		-removedefine HUGE_VALF		\
		-removedefine LLVM_FOR_EACH_VALUE_SUBCLASS	\
		-removedefine LLVM_DECLARE_VALUE_CAST

LUA_TITLE := lua-5.2.3
lua:
	./downloadextract.sh $(LUA_TITLE) $(LUA_TITLE).tar.gz "http://www.lua.org/ftp/$(LUA_TITLE).tar.gz"
	mkdir -p inc/Lua
	$(FBFROG) lua.fbfrog -o inc/Lua/lua.bi     extracted/$(LUA_TITLE)/src/lua.h
	$(FBFROG) lua.fbfrog -o inc/Lua/lualib.bi  extracted/$(LUA_TITLE)/src/lualib.h  -filterout '*lua.h'
	$(FBFROG) lua.fbfrog -o inc/Lua/lauxlib.bi extracted/$(LUA_TITLE)/src/lauxlib.h -filterout '*lua.h'

NCURSES_TITLE := ncurses-5.9
ncurses:
	./downloadextract.sh $(NCURSES_TITLE) $(NCURSES_TITLE).tar.gz "http://ftp.gnu.org/pub/gnu/ncurses/$(NCURSES_TITLE).tar.gz"
	cd extracted/$(NCURSES_TITLE) && \
		if [ ! -f include/curses.h ]; then ./configure && cd include && make; fi
	mkdir -p inc/curses
	$(FBFROG) ncurses.fbfrog -o inc/curses/ncurses.bi  extracted/$(NCURSES_TITLE)/include/curses.h

pdcurses:
	./downloadextract.sh PDCurses-3.4 PDCurses-3.4.tar.gz "http://sourceforge.net/projects/pdcurses/files/pdcurses/3.4/PDCurses-3.4.tar.gz/download"
	mkdir -p inc/curses
	$(FBFROG) pdcurses.fbfrog -o inc/curses/pdcurses.bi extracted/PDCurses-3.4/curses.h

png: png12 png14 png15 png16

PNG12_TITLE := libpng-1.2.51
png12:
	./downloadextract.sh $(PNG12_TITLE) $(PNG12_TITLE).tar.xz "http://downloads.sourceforge.net/libpng/$(PNG12_TITLE).tar.xz?download"
	$(FBFROG) png.fbfrog -o inc/png12.bi extracted/$(PNG12_TITLE)/png.h

PNG14_TITLE := libpng-1.4.13
png14:
	./downloadextract.sh $(PNG14_TITLE) $(PNG14_TITLE).tar.xz "http://downloads.sourceforge.net/libpng/$(PNG14_TITLE).tar.xz?download"
	$(FBFROG) png.fbfrog -o inc/png14.bi extracted/$(PNG14_TITLE)/png.h

PNG15_TITLE := libpng-1.5.19
png15:
	./downloadextract.sh $(PNG15_TITLE) $(PNG15_TITLE).tar.xz "http://downloads.sourceforge.net/libpng/$(PNG15_TITLE).tar.xz?download"
	cp extracted/$(PNG15_TITLE)/scripts/pnglibconf.h.prebuilt \
	   extracted/$(PNG15_TITLE)/pnglibconf.h
	$(FBFROG) png.fbfrog -o inc/png15.bi extracted/$(PNG15_TITLE)/png.h

PNG16_TITLE := libpng-1.6.14
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
