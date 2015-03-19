FBFROG := fbfrog
override FBFROG += -disableconstants

override FBFROG += -disableconstants

ALL := allegro4 allegro5
ALL += cgui clang cunit curl
ALL += fastcgi ffi
ALL += iup
ALL += jit
ALL += llvm lua
ALL += ncurses
ALL += pdcurses png png12 png14 png15 png16
ALL += zip zlib

.PHONY: all clean $(ALL)

all: $(ALL)

clean:
	rm -rf extracted/*

ALLEGRO4_VERSION := 4.4.2
ALLEGRO4_TITLE := allegro-$(ALLEGRO4_VERSION)
ALPNG_TARBALL := tarballs/alpng13.tar.gz
allegro4:
	./downloadextract.sh $(ALLEGRO4_TITLE) $(ALLEGRO4_TITLE).tar.gz "http://cdn.allegro.cc/file/library/allegro/$(ALLEGRO4_VERSION)/$(ALLEGRO4_TITLE).tar.gz"
	./downloadextract.sh algif_1.3 algif_1.3.zip "http://prdownloads.sourceforge.net/algif/algif_1.3.zip?download"
	if [ ! -f "$(ALPNG_TARBALL)" ]; then \
		wget --no-verbose "http://sourceforge.net/projects/alpng/files/alpng/1.3/alpng13.tar.gz/download" -O "$(ALPNG_TARBALL)"; \
	fi
	if [ ! -d extracted/alpng13 ]; then \
		mkdir -p extracted/alpng13; \
		tar xf "$(ALPNG_TARBALL)" -C extracted/alpng13; \
	fi

	mkdir -p inc/allegro

	$(FBFROG) allegro4.fbfrog \
		-incdir extracted/$(ALLEGRO4_TITLE)/include \
		extracted/$(ALLEGRO4_TITLE)/include/allegro.h \
		extracted/algif_1.3/src/algif.h \
		extracted/alpng13/src/alpng.h \
		-emit '*/algif.h' inc/allegro/algif.bi \
		-emit '*/alpng.h' inc/allegro/alpng.bi \
		-emit '*'         inc/allegro.bi

ALLEGRO5_VERSION := 5.0.10
ALLEGRO5_TITLE := allegro-$(ALLEGRO5_VERSION)
allegro5:
	./downloadextract.sh $(ALLEGRO5_TITLE) $(ALLEGRO5_TITLE).tar.gz "http://cdn.allegro.cc/file/library/allegro/$(ALLEGRO5_VERSION)/$(ALLEGRO5_TITLE).tar.gz"
	mkdir -p inc/allegro5
	$(FBFROG) allegro5.fbfrog \
		-incdir extracted/$(ALLEGRO5_TITLE)/include \
		-incdir extracted/$(ALLEGRO5_TITLE)/addons/audio \
		-incdir extracted/$(ALLEGRO5_TITLE)/addons/font \
		extracted/$(ALLEGRO5_TITLE)/include/allegro5/allegro.h \
		extracted/$(ALLEGRO5_TITLE)/addons/acodec/allegro5/allegro_acodec.h \
		extracted/$(ALLEGRO5_TITLE)/addons/audio/allegro5/allegro_audio.h \
		extracted/$(ALLEGRO5_TITLE)/addons/color/allegro5/allegro_color.h \
		extracted/$(ALLEGRO5_TITLE)/addons/font/allegro5/allegro_font.h \
		extracted/$(ALLEGRO5_TITLE)/addons/image/allegro5/allegro_image.h \
		extracted/$(ALLEGRO5_TITLE)/addons/memfile/allegro5/allegro_memfile.h \
		extracted/$(ALLEGRO5_TITLE)/addons/native_dialog/allegro5/allegro_native_dialog.h \
		extracted/$(ALLEGRO5_TITLE)/addons/physfs/allegro5/allegro_physfs.h \
		extracted/$(ALLEGRO5_TITLE)/addons/primitives/allegro5/allegro_primitives.h \
		extracted/$(ALLEGRO5_TITLE)/addons/ttf/allegro5/allegro_ttf.h \
		-emit '*/allegro_acodec.h'        inc/allegro5/allegro_acodec.bi \
		-emit '*/allegro_audio.h'         inc/allegro5/allegro_audio.bi \
		-emit '*/allegro_color.h'         inc/allegro5/allegro_color.bi \
		-emit '*/allegro_font.h'          inc/allegro5/allegro_font.bi \
		-emit '*/allegro_image.h'         inc/allegro5/allegro_image.bi \
		-emit '*/allegro_memfile.h'       inc/allegro5/allegro_memfile.bi \
		-emit '*/allegro_native_dialog.h' inc/allegro5/allegro_native_dialog.bi \
		-emit '*/allegro_physfs.h'        inc/allegro5/allegro_physfs.bi \
		-emit '*/allegro_primitives.h'    inc/allegro5/allegro_primitives.bi \
		-emit '*/allegro_ttf.h'           inc/allegro5/allegro_ttf.bi \
		-emit '*'                         inc/allegro5/allegro.bi

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
	$(FBFROG) cunit.fbfrog \
		extracted/$(CUNIT_TITLE)/CUnit/Headers/CUnit.h \
		extracted/$(CUNIT_TITLE)/CUnit/Headers/Automated.h \
		extracted/$(CUNIT_TITLE)/CUnit/Headers/Basic.h \
		extracted/$(CUNIT_TITLE)/CUnit/Headers/Console.h \
		extracted/$(CUNIT_TITLE)/CUnit/Headers/CUCurses.h \
		extracted/$(CUNIT_TITLE)/CUnit/Headers/Util.h \
		-emit '*/Automated.h' inc/CUnit/Automated.bi		\
		-emit '*/Basic.h'     inc/CUnit/Basic.bi		\
		-emit '*/Console.h'   inc/CUnit/Console.bi		\
		-emit '*/CUCurses.h'  inc/CUnit/CUCurses.bi		\
		-emit '*/CUError.h'   inc/CUnit/CUError.bi		\
		-emit '*/CUnit.h'     inc/CUnit/CUnit.bi		\
		-emit '*/TestDB.h'    inc/CUnit/TestDB.bi		\
		-emit '*/TestRun.h'   inc/CUnit/TestRun.bi		\
		-emit '*/Util.h'      inc/CUnit/Util.bi

CURL_TITLE := curl-7.39.0
curl:
	./downloadextract.sh $(CURL_TITLE) $(CURL_TITLE).tar.lzma "http://curl.haxx.se/download/$(CURL_TITLE).tar.lzma"
	$(FBFROG) \
		extracted/$(CURL_TITLE)/include/curl/curl.h \
		-dontemit '*/typecheck-gcc.h' \
		-emit '*' inc/curl.bi \
		\
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
		-removedefine curl_multi_setopt

FASTCGI_TITLE := fcgi-2.4.1-SNAP-0311112127
fastcgi:
	./downloadextract.sh $(FASTCGI_TITLE) $(FASTCGI_TITLE).tar.gz "http://www.fastcgi.com/dist/fcgi.tar.gz"
	mkdir -p inc/fastcgi
	$(FBFROG) fastcgi.fbfrog \
		extracted/$(FASTCGI_TITLE)/include/fastcgi.h \
		extracted/$(FASTCGI_TITLE)/include/fcgiapp.h \
		extracted/$(FASTCGI_TITLE)/include/fcgi_stdio.h \
		-emit '*/fastcgi.h'    inc/fastcgi/fastcgi.bi \
		-emit '*/fcgiapp.h'    inc/fastcgi/fcgiapp.bi \
		-emit '*/fcgi_stdio.h' inc/fastcgi/fcgi_stdio.bi

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

	$(FBFROG) \
		extracted/iup/include/*.h \
		-emit '*/iupcb.h'            inc/IUP/iupcb.bi            \
		-emit '*/iupcbox.h'          inc/IUP/iupcbox.bi          \
		-emit '*/iupcbs.h'           inc/IUP/iupcbs.bi           \
		-emit '*/iupcells.h'         inc/IUP/iupcells.bi         \
		-emit '*/iupcolorbar.h'      inc/IUP/iupcolorbar.bi      \
		-emit '*/iupcontrols.h'      inc/IUP/iupcontrols.bi      \
		-emit '*/iupdef.h'           inc/IUP/iupdef.bi           \
		-emit '*/iupdial.h'          inc/IUP/iupdial.bi          \
		-emit '*/iupgauge.h'         inc/IUP/iupgauge.bi         \
		-emit '*/iupgc.h'            inc/IUP/iupgc.bi            \
		-emit '*/iupgetparam.h'      inc/IUP/iupgetparam.bi      \
		-emit '*/iupglcontrols.h'    inc/IUP/iupglcontrols.bi    \
		-emit '*/iupgl.h'            inc/IUP/iupgl.bi            \
		-emit '*/iup.h'              inc/IUP/iup.bi              \
		-emit '*/iupkey.h'           inc/IUP/iupkey.bi           \
		-emit '*/iupmask.h'          inc/IUP/iupmask.bi          \
		-emit '*/iupmatrixex.h'      inc/IUP/iupmatrixex.bi      \
		-emit '*/iupmatrix.h'        inc/IUP/iupmatrix.bi        \
		-emit '*/iup_mglplot.h'      inc/IUP/iup_mglplot.bi      \
		-emit '*/iupole.h'           inc/IUP/iupole.bi           \
		-emit '*/iup_pplot.h'        inc/IUP/iup_pplot.bi        \
		-emit '*/iupsbox.h'          inc/IUP/iupsbox.bi          \
		-emit '*/iupspin.h'          inc/IUP/iupspin.bi          \
		-emit '*/iuptabs.h'          inc/IUP/iuptabs.bi          \
		-emit '*/iuptree.h'          inc/IUP/iuptree.bi          \
		-emit '*/iuptuio.h'          inc/IUP/iuptuio.bi          \
		-emit '*/iupval.h'           inc/IUP/iupval.bi           \
		-emit '*/iupweb.h'           inc/IUP/iupweb.bi

	$(FBFROG) iupim.fbfrog extracted/iup/include/iupim.h -o inc/IUP

	$(FBFROG) iuplua.fbfrog iupscintilla.fbfrog \
		extracted/iup/include/*.h \
		-emit '*/iupluacontrols.h'   inc/IUP/iupluacontrols.bi   \
		-emit '*/iupluaglcontrols.h' inc/IUP/iupluaglcontrols.bi \
		-emit '*/iupluagl.h'         inc/IUP/iupluagl.bi         \
		-emit '*/iuplua.h'           inc/IUP/iuplua.bi           \
		-emit '*/iupluaim.h'         inc/IUP/iupluaim.bi         \
		-emit '*/iupluamatrixex.h'   inc/IUP/iupluamatrixex.bi   \
		-emit '*/iuplua_mglplot.h'   inc/IUP/iuplua_mglplot.bi   \
		-emit '*/iupluaole.h'        inc/IUP/iupluaole.bi        \
		-emit '*/iuplua_pplot.h'     inc/IUP/iuplua_pplot.bi     \
		-emit '*/iuplua_scintilla.h' inc/IUP/iuplua_scintilla.bi \
		-emit '*/iupluatuio.h'       inc/IUP/iupluatuio.bi       \
		-emit '*/iupluaweb.h'        inc/IUP/iupluaweb.bi        \
		-emit '*/iup_scintilla.h'    inc/IUP/iup_scintilla.bi

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
		-fbfroginclude stdbool.h \
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
	$(FBFROG) lua.fbfrog \
		extracted/$(LUA_TITLE)/src/lua.h       \
		extracted/$(LUA_TITLE)/src/lualib.h    \
		extracted/$(LUA_TITLE)/src/lauxlib.h   \
		-emit '*/lua.h'     inc/Lua/lua.bi     \
		-emit '*/luaconf.h' inc/Lua/lua.bi     \
		-emit '*/lualib.h'  inc/Lua/lualib.bi  \
		-emit '*/lauxlib.h' inc/Lua/lauxlib.bi \
		-inclib lua inc/Lua/lua.bi

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

#
# libpng:
#
# There are multiple libpng release series, 1.2.x, 1.4.x, 1.5.x, etc. and they
# are incompatible: For example, using the 1.5.14 header with the 1.2.50
# library results in:
#     libpng warning: Application was compiled with png.h from libpng-1.5.14
#     libpng warning: Application  is  running with png.c from libpng-1.2.50
# (and png_create_read_struct() fails because of the version mismatch)
# The same problem can also happen in the other direction: For example, header
# 1.2 isn't compatible with library 1.5.
#
# The problem is that different systems have different libpng versions
# installed, and the FreeBASIC binding cannot just support one version, because
# then it wouldn't work on the other systems. At the time of writing, the latest
# libpng series is 1.6, but Debian/Ubuntu use the 1.2 series.
#
# Thus, it seems like FreeBASIC bindings for multiple libpng versions are
# needed. FB programs should just #include png.bi, but depending on the system
# they may need the 1.2, 1.5, 1.6, etc. version of the libpng API. This could be
# handled by having a #define which tells png.bi which API version to use. This
# way it should be possible to compile the same source code for the
# system-specific libpng version.
#
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

################################################################################
# Windows API, based on MinGW-w64 headers
#
# winsock vs. winsock2
#
# In MinGW and MinGW-w64, windows.h provides winsock.h. In order to use
# winsock2.h it must be #included before windows.h so it can override winsock.h.
#
# In Cygwin, you have to define __USE_W32_SOCKETS in order to get windows.h to
# include winsock.h.
#
# In contrast to this,
# FB's windows.bi traditionally doesn't #include winsock, but winsock2, and even
# that only if __USE_W32_SOCKETS is defined, which overall is similar to Cygwin
# but not the same.
#
# FB should support the following:
#
#    #include "windows.bi"
#    (neither winsock nor winsock2; legacy)
#
#    #include "win/winsock2.bi"
#    #include "windows.bi"
#    ("normal" way of using winsock2)
#
#    #define WIN_INCLUDEALL
#    #define __USE_W32_SOCKETS
#    #include "windows.bi"
#    (legacy way of using winsock2)
#
#    #include "windows.bi"
#    #include "win/winsock.bi"
#    (legacy way of using winsock)
#
# mswsock.h has some declarations that also exist in winsock.h, and MinGW-w64's
# winsock #defines __MSWSOCK_WS1_SHARED, which mswsock.h checks for to prevent
# conflicts. This assumes that winsock is #included first, which could perhaps
# happen if windows.h is included first. However, according to MSDN, mswsock is
# a winsock2, not winsock, extension, and MinGW-w64's mswsock.h itself #includes
# winsock2. Since our windows.bi won't default to winsock, it looks like we can
# just have a pure winsock2-only mswsock.bi. Thus we have #include winsock2.h
# instead of windows.h for the translation.
#
# Global #defines causing accidental renames in the C headers
#
#   On one hand we have #defines like this:
#     #define LogonUser __MINGW_NAME_AW(LogonUser)
#     (or similar in the MS Windows SDK)
#   and on the other hand, we have fields/parameters with the same names as
#   these #defined functions.
#
#   Thus, such fields/parameter will be renamed during C preprocessing, which
#   is probably not intentional. Thus it's probably good to disable expansion
#   of a selected few ids when running fbfrog...
#
# BYTE/UBYTE typedefs
#
#   "BYTE" is defined as "unsigned char", thus it conflicts with FB's signed "byte" type.
#   Traditionally, the FB winapi headers have used FB's "ubyte" type everywhere in place
#   of "BYTE", so all we need to do is rename the typedef and then remove its declaration.
#   It helps that there is no existing UBYTE type in the winapi headers. The same must be
#   be done for the "byte" typedef (also "unsigned char") used by some headers.
#
# LONG/ULONG typedefs
#
#   Since they match the FB's long/ulong types exactly (always 32bit on both Win32 and Win64),
#   nothing needs to be done, besides removing the declarations.
#
# INT typedef
#
#   INT is traditionally renamed to INT_ to avoid conflict with FB's int() function.
#
# Uses of C's long type
#
#   There exist some uses of C's long type in the headers, but since the binding is only
#   for Win32/Win64, it can be translated to FB's long instead of crt/long.bi's clong.
#   (fbfrog -clong32)
#

MINGWW64_TITLE := mingw-w64-v3.3.0
WINAPI_FLAGS := winapi.fbfrog
WINAPI_FLAGS += -incdir extracted/$(MINGWW64_TITLE)/mingw-w64-headers/crt
WINAPI_FLAGS += -incdir extracted/$(MINGWW64_TITLE)/mingw-w64-headers/include
WINAPI_FLAGS += -incdir extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include
winapi:
	./downloadextract.sh $(MINGWW64_TITLE) $(MINGWW64_TITLE).tar.bz2 "http://sourceforge.net/projects/mingw-w64/files/mingw-w64/mingw-w64-release/$(MINGWW64_TITLE).tar.bz2/download"
	cd extracted/$(MINGWW64_TITLE)/mingw-w64-headers/crt && \
		sed -e 's/@MINGW_HAS_SECURE_API@/#define MINGW_HAS_SECURE_API 1/g' < _mingw.h.in > _mingw.h && \
		sed -e 's/MINGW_HAS_DX$$/1/g' < sdks/_mingw_directx.h.in > sdks/_mingw_directx.h && \
		sed -e 's/MINGW_HAS_DDK$$/1/g' < sdks/_mingw_ddk.h.in > sdks/_mingw_ddk.h
	mkdir -p inc/win

	# Main pass - winsock2.h, windows.h, Direct3D/DirectX 9
	# winsock2.h has to be #included before windows.h in order to override
	# winsock.h.
	$(FBFROG) $(WINAPI_FLAGS) winapi-main.fbfrog

	# Direct3D 7 (?) pass
	$(FBFROG) $(WINAPI_FLAGS) \
		-include d3d.h \
		-emit '*/d3d.h'      inc/win/d3d.bi     \
		-emit '*/d3dcaps.h'  inc/win/d3dcaps.bi \
		-emit '*/d3dtypes.h' inc/win/d3dtypes.bi

	# CRT intrin.h pass (separate because of -nofunctionbodies)
	$(FBFROG) $(WINAPI_FLAGS) -nofunctionbodies \
		-include windows.h \
		-emit '*/intrin.h'               inc/win/intrin.bi \
		-emit '*/psdk_inc/intrin-impl.h' inc/win/intrin.bi

	# winsock.h pass (separate because it can't be used together with
	# winsock2.h)
	$(FBFROG) $(WINAPI_FLAGS) \
		-include windows.h \
		-emit '*/winsock.h'                inc/win/winsock.bi \
		-emit '*/psdk_inc/_socket_types.h' inc/win/winsock.bi \
		-emit '*/psdk_inc/_fd_types.h'     inc/win/winsock.bi \
		-emit '*/psdk_inc/_ip_types.h'     inc/win/winsock.bi \
		-emit '*/psdk_inc/_ip_mreq1.h'     inc/win/winsock.bi \
		-emit '*/psdk_inc/_wsadata.h'      inc/win/winsock.bi \
		-emit '*/psdk_inc/_xmitfile.h'     inc/win/winsock.bi \
		-emit '*/psdk_inc/_wsa_errnos.h'   inc/win/winsock.bi

	# ole.h pass (separate because it can't be #included with windows.h,
	# even though windows.h has code to do just that, due to conflicts with
	# ole2.h)
	$(FBFROG) $(WINAPI_FLAGS) -define _Analysis_noreturn_ "" \
		-include windef.h -include ole.h \
		-emit '*/ole.h' inc/win/ole.bi

	# windows.h pass to get windows.bi (separate because of the additional
	# -declarebool that would only slow down the main pass)
	$(FBFROG) $(WINAPI_FLAGS) \
		\
		-declarebool WIN32_LEAN_AND_MEAN \
		-ifdef WIN32_LEAN_AND_MEAN \
			-define WIN32_LEAN_AND_MEAN 1 \
		-endif \
		\
		-include windows.h \
		-emit '*/windows.h' inc/windows.bi

	# DDK pass
	$(FBFROG) $(WINAPI_FLAGS) \
		-include ntdef.h \
		-emit '*/ntdef.h' inc/win/ntdef.bi


################################################################################

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
