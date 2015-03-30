FBFROG := fbfrog

ALL := allegro4 allegro5 atk
ALL += cairo cgui clang cunit curl
ALL += fastcgi ffi fontconfig freeglut freetype
ALL += gdk-pixbuf glib glibc glfw glut gtk
ALL += iconv iup
ALL += jit
ALL += llvm lua
ALL += ncurses
ALL += opengl-mesa opengl-winapi
ALL += pango pdcurses png png12 png14 png15 png16
ALL += sdl sdl1 sdl2
ALL += tre
ALL += x11
ALL += zip zlib

.PHONY: all clean tests tests-winapi $(ALL)

all: $(ALL)

clean:
	rm -rf extracted/*

tests:
	lib/tests.sh

tests-winapi:
	lib/tests-winapi.sh

ALLEGRO4_VERSION := 4.4.2
ALLEGRO4_TITLE := allegro-$(ALLEGRO4_VERSION)
ALPNG_TARBALL := tarballs/alpng13.tar.gz
allegro4:
	./get.sh $(ALLEGRO4_TITLE) $(ALLEGRO4_TITLE).tar.gz "http://cdn.allegro.cc/file/library/allegro/$(ALLEGRO4_VERSION)/$(ALLEGRO4_TITLE).tar.gz"
	./get.sh algif_1.3 algif_1.3.zip "http://prdownloads.sourceforge.net/algif/algif_1.3.zip?download"
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
		-emit '*'         inc/allegro.bi \
		-inclib alleg  inc/allegro.bi \
		-inclib algif  inc/allegro/algif.bi \
		-inclib alpng  inc/allegro/alpng.bi \
		-undef screen  inc/allegro.bi \
		-undef circle  inc/allegro.bi \
		-undef line    inc/allegro.bi \
		-undef palette inc/allegro.bi \
		-undef rgb     inc/allegro.bi \
		-addinclude allegro.bi inc/allegro/alpng.bi

ALLEGRO5_VERSION := 5.0.11
ALLEGRO5_TITLE := allegro-$(ALLEGRO5_VERSION)
# For Win32, the Allegro5 libs follow a specific naming pattern,
# e.g. "liballegro-5.0.10-md.a":
#     https://www.allegro.cc/manual/5/install/windows.html
# On Ubuntu though it's just "liballegro.so".
# We want to make #inclibs match that.
# This seems to be the latest version of the Win32 binary builds available on
# the Allegro homepage:
ALLEGRO5_LIB := -5.0.10-static-md
ALLEGRO5_DLL := -5.0.10-md
allegro5:
	./get.sh $(ALLEGRO5_TITLE) $(ALLEGRO5_TITLE).tar.gz "http://sourceforge.net/projects/alleg/files/allegro/$(ALLEGRO5_VERSION)/$(ALLEGRO5_TITLE).tar.gz/download"
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
		-emit '*'                         inc/allegro5/allegro.bi \
		\
		-ifdef __FB_WIN32__ \
			-ifdef ALLEGRO_STATICLINK \
				-inclib allegro$(ALLEGRO5_LIB)            inc/allegro5/allegro.bi \
				-inclib allegro_acodec$(ALLEGRO5_LIB)     inc/allegro5/allegro_acodec.bi \
				-inclib allegro_audio$(ALLEGRO5_LIB)      inc/allegro5/allegro_audio.bi \
				-inclib allegro_color$(ALLEGRO5_LIB)      inc/allegro5/allegro_color.bi \
				-inclib allegro_font$(ALLEGRO5_LIB)       inc/allegro5/allegro_font.bi \
				-inclib allegro_image$(ALLEGRO5_LIB)      inc/allegro5/allegro_image.bi \
				-inclib allegro_memfile$(ALLEGRO5_LIB)    inc/allegro5/allegro_memfile.bi \
				-inclib allegro_dialog$(ALLEGRO5_LIB)     inc/allegro5/allegro_native_dialog.bi \
				-inclib allegro_physfs$(ALLEGRO5_LIB)     inc/allegro5/allegro_physfs.bi \
				-inclib allegro_primitives$(ALLEGRO5_LIB) inc/allegro5/allegro_primitives.bi \
				-inclib allegro_ttf$(ALLEGRO5_LIB)        inc/allegro5/allegro_ttf.bi \
			-else \
				-inclib allegro$(ALLEGRO5_DLL)            inc/allegro5/allegro.bi \
				-inclib allegro_acodec$(ALLEGRO5_DLL)     inc/allegro5/allegro_acodec.bi \
				-inclib allegro_audio$(ALLEGRO5_DLL)      inc/allegro5/allegro_audio.bi \
				-inclib allegro_color$(ALLEGRO5_DLL)      inc/allegro5/allegro_color.bi \
				-inclib allegro_font$(ALLEGRO5_DLL)       inc/allegro5/allegro_font.bi \
				-inclib allegro_image$(ALLEGRO5_DLL)      inc/allegro5/allegro_image.bi \
				-inclib allegro_memfile$(ALLEGRO5_DLL)    inc/allegro5/allegro_memfile.bi \
				-inclib allegro_dialog$(ALLEGRO5_DLL)     inc/allegro5/allegro_native_dialog.bi \
				-inclib allegro_physfs$(ALLEGRO5_DLL)     inc/allegro5/allegro_physfs.bi \
				-inclib allegro_primitives$(ALLEGRO5_DLL) inc/allegro5/allegro_primitives.bi \
				-inclib allegro_ttf$(ALLEGRO5_DLL)        inc/allegro5/allegro_ttf.bi \
			-endif \
		-else \
			-inclib allegro            inc/allegro5/allegro.bi \
			-inclib allegro_acodec     inc/allegro5/allegro_acodec.bi \
			-inclib allegro_audio      inc/allegro5/allegro_audio.bi \
			-inclib allegro_color      inc/allegro5/allegro_color.bi \
			-inclib allegro_font       inc/allegro5/allegro_font.bi \
			-inclib allegro_image      inc/allegro5/allegro_image.bi \
			-inclib allegro_memfile    inc/allegro5/allegro_memfile.bi \
			-inclib allegro_dialog     inc/allegro5/allegro_native_dialog.bi \
			-inclib allegro_physfs     inc/allegro5/allegro_physfs.bi \
			-inclib allegro_primitives inc/allegro5/allegro_primitives.bi \
			-inclib allegro_ttf        inc/allegro5/allegro_ttf.bi \
		-endif

atk:
	http://ftp.gnome.org/pub/gnome/sources/atk/2.14/atk-2.14.0.tar.xz

# TODO:
# cairo-deprecated.h
# cairo-ps.h
# cairo-pdf.h
# cairo-svg.h
# cairo-ft.h
# cairo-xlib.h
# cairo-xlib-xrender.h
# cairo-xcb.h
# cairo-qt.h
# cairo-quartz.h
# cairo-quartz-image.h
# cairo-win32.h
# cairo-skia.h
# cairo-os2.h
# cairo-beos.h
# cairo-gl.h
# cairo-directfb.h
# cairo-drm.h
# cairo-script.h
# cairo-tee.h
# cairo-xml.h
# cairo-vg.h
# cairo-cogl.h
CAIRO := cairo-1.14.2
cairo:
	./get.sh $(CAIRO) $(CAIRO).tar.xz http://cairographics.org/releases/$(CAIRO).tar.xz

	# Overwrite src/cairo-version.h (a place holder) with the one from toplevel (the real thing)
	cp extracted/$(CAIRO)/cairo-version.h extracted/$(CAIRO)/src

	mkdir -p inc/cairo
	$(FBFROG) cairo.fbfrog \
		-incdir extracted/$(CAIRO)/src \
		-include cairo.h       \
		-include cairo-gl.h    \
		-include cairo-pdf.h   \
		-include cairo-ps.h    \
		-include cairo-svg.h   \
		-include cairo-win32.h \
		-emit '*/cairo.h'            inc/cairo/cairo.bi       \
		-emit '*/cairo-version.h'    inc/cairo/cairo.bi       \
		-emit '*/cairo-deprecated.h' inc/cairo/cairo.bi       \
		-emit '*/cairo-gl.h'         inc/cairo/cairo-gl.bi    \
		-emit '*/cairo-pdf.h'        inc/cairo/cairo-pdf.bi   \
		-emit '*/cairo-ps.h'         inc/cairo/cairo-ps.bi    \
		-emit '*/cairo-svg.h'        inc/cairo/cairo-svg.bi   \
		-emit '*/cairo-win32.h'      inc/cairo/cairo-win32.bi \
		-inclib cairo inc/cairo/cairo.bi

cgui:
	./get.sh cgui cgui-2.0.3.tar.gz "http://sourceforge.net/projects/cgui/files/2.0.3/cgui-2.0.3.tar.gz/download"
	$(FBFROG) cgui.fbfrog -o inc extracted/cgui/include/cgui.h

CLANG_VERSION := 3.5.0
CLANG_TITLE := cfe-$(CLANG_VERSION).src
clang:
	./get.sh $(CLANG_TITLE) $(CLANG_TITLE).tar.xz "http://llvm.org/releases/$(CLANG_VERSION)/$(CLANG_TITLE).tar.xz"
	$(FBFROG) -o inc/clang-c.bi \
		extracted/$(CLANG_TITLE)/include/clang-c/Index.h \
		extracted/$(CLANG_TITLE)/include/clang-c/CXCompilationDatabase.h \
		-incdir extracted/$(CLANG_TITLE)/include \
		-removedefine CINDEX_LINKAGE

CUNIT_VERSION := 2.1-3
CUNIT_TITLE := CUnit-$(CUNIT_VERSION)
cunit:
	./get.sh $(CUNIT_TITLE) $(CUNIT_TITLE).tar.bz2 "http://sourceforge.net/projects/cunit/files/CUnit/$(CUNIT_VERSION)/$(CUNIT_TITLE).tar.bz2/download"
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
	./get.sh $(CURL_TITLE) $(CURL_TITLE).tar.lzma "http://curl.haxx.se/download/$(CURL_TITLE).tar.lzma"
	$(FBFROG) curl.fbfrog \
		extracted/$(CURL_TITLE)/include/curl/curl.h \
		-dontemit '*/typecheck-gcc.h' \
		-emit '*' inc/curl.bi

FASTCGI_TITLE := fcgi-2.4.1-SNAP-0311112127
fastcgi:
	./get.sh $(FASTCGI_TITLE) $(FASTCGI_TITLE).tar.gz "http://www.fastcgi.com/dist/fcgi.tar.gz"
	mkdir -p inc/fastcgi
	$(FBFROG) fastcgi.fbfrog \
		extracted/$(FASTCGI_TITLE)/include/fastcgi.h \
		extracted/$(FASTCGI_TITLE)/include/fcgiapp.h \
		extracted/$(FASTCGI_TITLE)/include/fcgi_stdio.h \
		-emit '*/fastcgi.h'    inc/fastcgi/fastcgi.bi \
		-emit '*/fcgiapp.h'    inc/fastcgi/fcgiapp.bi \
		-emit '*/fcgi_stdio.h' inc/fastcgi/fcgi_stdio.bi \
		-addinclude crt.bi inc/fastcgi/fcgi_stdio.bi \
		-inclib fcgi inc/fastcgi/fcgiapp.bi

FFI_TITLE := libffi-3.1
ffi:
	./get.sh $(FFI_TITLE) $(FFI_TITLE).tar.gz "ftp://sourceware.org/pub/libffi/$(FFI_TITLE).tar.gz"
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

FONTCONFIG := fontconfig-2.11.1
fontconfig:
	./get.sh $(FONTCONFIG) $(FONTCONFIG).tar.bz2 "http://www.freedesktop.org/software/fontconfig/release/$(FONTCONFIG).tar.bz2"
	mkdir -p inc/fontconfig
	$(FBFROG) fontconfig.fbfrog \
		-incdir extracted/$(FONTCONFIG)/fontconfig \
		-include fontconfig.h \
		-include fcfreetype.h \
		-emit '*/fontconfig.h' inc/fontconfig/fontconfig.bi \
		-emit '*/fcfreetype.h' inc/fontconfig/fcfreetype.bi


FREEGLUT_VERSION := 3.0.0
FREEGLUT := freeglut-$(FREEGLUT_VERSION)
freeglut:
	./get.sh $(FREEGLUT) $(FREEGLUT).tar.gz http://sourceforge.net/projects/freeglut/files/freeglut/$(FREEGLUT_VERSION)/$(FREEGLUT).tar.gz/download
	mkdir -p inc/GL
	$(FBFROG) freeglut.fbfrog \
		-incdir extracted/$(FREEGLUT)/include \
		-include GL/freeglut.h \
		-emit '*/GL/freeglut.h' inc/GL/freeglut.bi \
		-emit '*/GL/freeglut_ext.h' inc/GL/freeglut_ext.bi \
		-emit '*/GL/freeglut_std.h' inc/GL/freeglut_std.bi

FREETYPE := freetype-2.5.5
freetype:
	./get.sh $(FREETYPE) $(FREETYPE).tar.bz2 http://download.savannah.gnu.org/releases/freetype/$(FREETYPE).tar.bz2

	cd extracted/$(FREETYPE)/include/config && \
		if [ ! -f ftoption.h.orig ]; then \
			mv ftoption.h ftoption.h.orig; \
			(sed -e 's/#undef FT_CONFIG_OPTION_FORCE_INT64/#define FT_CONFIG_OPTION_FORCE_INT64 1/g' \
				< ftoption.h.orig > ftoption.h); \
		fi

	mkdir -p inc/freetype2/config
	$(FBFROG) freetype.fbfrog -incdir extracted/$(FREETYPE)/include \
		-include ft2build.h \
		-include freetype.h \
		-emit '*/freetype.h'         inc/freetype2/freetype.bi \
		-emit '*/fterrors.h'         inc/freetype2/fterrors.bi \
		-emit '*/ftimage.h'          inc/freetype2/ftimage.bi  \
		-emit '*/ftmoderr.h'         inc/freetype2/ftmoderr.bi \
		-emit '*/ftsystem.h'         inc/freetype2/ftsystem.bi \
		-emit '*/fttypes.h'          inc/freetype2/fttypes.bi  \
		-emit '*/config/ftconfig.h'  inc/freetype2/config/ftconfig.bi  \
		-emit '*/config/ftoption.h'  inc/freetype2/config/ftoption.bi  \
		-emit '*/config/ftstdlib.h'  inc/freetype2/config/ftstdlib.bi  \
		-inclib freetype             inc/freetype2/freetype.bi

GLFW2_VERSION := 2.7.9
GLFW3_VERSION := 3.1.1
GLFW2 := glfw-$(GLFW2_VERSION)
GLFW3 := glfw-$(GLFW3_VERSION)
glfw:
	./get.sh $(GLFW2) $(GLFW2).tar.bz2 http://sourceforge.net/projects/glfw/files/glfw/$(GLFW2_VERSION)/$(GLFW2).tar.bz2/download
	./get.sh $(GLFW3) $(GLFW3).tar.bz2 http://sourceforge.net/projects/glfw/files/glfw/$(GLFW3_VERSION)/$(GLFW3).tar.bz2/download
	mkdir -p inc/GL inc/GLFW

	$(FBFROG) glfw.fbfrog extracted/$(GLFW2)/include/GL/glfw.h -o inc/GL/glfw.bi \
		-ifdef __FB_WIN32__ \
			-ifdef GLFW_DLL \
				-inclib glfwdll \
			-else \
				-inclib glfw \
				-inclib user32 \
				-inclib gdi32 \
			-endif \
		-else \
			-inclib glfw \
		-endif

	$(FBFROG) glfw.fbfrog extracted/$(GLFW3)/include/GLFW/glfw3.h -o inc/GLFW/glfw3.bi \
		-ifdef __FB_WIN32__ \
			-ifdef GLFW_DLL \
				-inclib glfw3dll \
			-else \
				-inclib glfw3 \
				-inclib user32 \
				-inclib gdi32 \
			-endif \
		-else \
			-inclib glfw \
		-endif

gdk-pixbuf:
	http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.30/gdk-pixbuf-2.30.8.tar.xz

GLIB_MAJOR := 2
GLIB_MINOR := 42
GLIB_MICRO := 2
GLIB_SERIES := $(GLIB_MAJOR).$(GLIB_MINOR)
GLIB := glib-$(GLIB_SERIES).$(GLIB_MICRO)
SED_GLIBCONFIG := -e 's/@GLIB_MAJOR_VERSION@/$(GLIB_MAJOR)/g'
SED_GLIBCONFIG += -e 's/@GLIB_MINOR_VERSION@/$(GLIB_MINOR)/g'
SED_GLIBCONFIG += -e 's/@GLIB_MICRO_VERSION@/$(GLIB_MICRO)/g'
glib-extract:
	./get.sh $(GLIB) $(GLIB).tar.xz http://ftp.gnome.org/pub/gnome/sources/glib/$(GLIB_SERIES)/$(GLIB).tar.xz

	# We'd have to run configure to get the target-specific glibconfig.h,
	# but...
	#  * that's somewhat unviable
	#  * glibconfig.h is not trivial
	#  * we want to make a glibconfig.bi anyways
	# it looks like we have to maintain a unified copy that covers all
	# targets.
	sed $(SED_GLIBCONFIG) < glibconfig.h > extracted/$(GLIB)/glib/glibconfig.h

glib: glib-extract
	$(FBFROG) glib.fbfrog \
		-incdir extracted/$(GLIB) \
		-incdir extracted/$(GLIB)/glib \
		-include glib/glib.h \
		-include glib/glib-object.h \
		-emit '*/extracted/$(GLIB)/glib/glib-object.h' inc/glib-object.bi \
		-emit '*/extracted/$(GLIB)/gobject/*.h'        inc/glib-object.bi \
		-emit '*/extracted/$(GLIB)/glib/glibconfig.h'  inc/glibconfig.bi \
		-emit '*/extracted/$(GLIB)/glib/*.h'           inc/glib.bi

GLIBC := glibc-2.21
glibc:
	./get.sh $(GLIBC) $(GLIBC).tar.xz http://ftp.gnu.org/gnu/glibc/$(GLIBC).tar.xz

	cd extracted/$(GLIBC) && \
		rm -f bits/wordsize.h bits/endian.h bits/setjmp.h

	mkdir -p inc/crt/bits
	$(FBFROG) glibc.fbfrog \
		-ifdef __FB_64BIT__ \
			-incdir extracted/$(GLIBC)/sysdeps/x86_64 \
			-incdir extracted/$(GLIBC)/sysdeps/wordsize-64 \
		-endif \
		-incdir extracted/$(GLIBC)/sysdeps/x86 \
		-incdir extracted/$(GLIBC)/sysdeps/nptl \
		-incdir extracted/$(GLIBC)/include \
		-incdir extracted/$(GLIBC) \
		-include libc-symbols.h \
		extracted/$(GLIBC)/sysdeps/nptl/pthread.h \
		-emit '*/bits/pthreadtypes.h' inc/crt/bits/pthreadtypes.bi \
		-emit '*/bits/wordsize.h'     inc/crt/bits/wordsize.bi \
		-emit '*/bits/sched.h'        inc/crt/bits/sched.bi \
		-emit '*/pthread.h'           inc/crt/pthread.bi \
		-emit '*/sched.h'             inc/crt/sched.bi

GLUT := glut-3.7
glut:
	./get.sh $(GLUT) $(GLUT).tar.gz https://www.opengl.org/resources/libraries/glut/$(GLUT).tar.gz
	mkdir -p inc/GL
	$(FBFROG) glut.fbfrog \
		extracted/$(GLUT)/include/GL/glut.h -o inc/GL/glut.bi \
		-select \
		-case __FB_WIN32__ \
			-inclib glut32 \
		-case __FB_DOS__ \
			-inclib GLUT \
			-inclib alleg \
		-caseelse \
			-inclib glut \
		-endselect

GTK_SERIES := 3.14
GTK := gtk+-$(GTK_SERIES).10
gtk:
	./get.sh $(GTK) $(GTK).tar.xz http://ftp.gnome.org/pub/gnome/sources/gtk+/$(GTK_SERIES)/$(GTK).tar.xz
	http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-2.24.27.tar.xz

	$(FBFROG) \
		extracted/$(GTK)/gtk/gtk.h \
		-emit '*/gtk.h' inc/gtk/gtk.bi
		#-emit '*/atk.h' inc/atk/atk.bi

# GNU libiconv, not glibc's iconv
ICONV := libiconv-1.14
ICONV_SED_COMMON  := -e 's/@EILSEQ@//g'
ICONV_SED_COMMON  += -e 's/@ICONV_CONST@/const/g'
ICONV_SED_COMMON  += -e 's/@USE_MBSTATE_T@/1/g'
ICONV_SED_COMMON  += -e 's/@BROKEN_WCHAR_H@/0/g'
ICONV_SED_COMMON  += -e 's/@HAVE_WCHAR_T@/1/g'
ICONV_SED_DEFAULT := $(ICONV_SED_COMMON) -e 's/@DLL_VARIABLE@//g'
ICONV_SED_WINDOWS := $(ICONV_SED_COMMON) -e 's/@DLL_VARIABLE@/__declspec(dllimport)/g'
iconv:
	./get.sh $(ICONV) $(ICONV).tar.gz "http://ftp.gnu.org/pub/gnu/libiconv/$(ICONV).tar.gz"

	cd extracted/$(ICONV)/include && \
		sed $(ICONV_SED_DEFAULT) < iconv.h.in > iconv-default.h && \
		sed $(ICONV_SED_WINDOWS) < iconv.h.in > iconv-windows.h

	$(FBFROG) \
		-ifdef __FB_WIN32__ \
			extracted/$(ICONV)/include/iconv-windows.h \
		-else \
			extracted/$(ICONV)/include/iconv-default.h \
		-endif \
		-define EILSEQ "" \
		-renamedefine _LIBICONV_VERSION _LIBICONV_VERSION_ \
		-o inc/libiconv.bi

IUP_VERSION := 3.11.2
IUP_TITLE := iup-3.11.2_Sources
iup:
	./get.sh iup $(IUP_TITLE).tar.gz "http://sourceforge.net/projects/iup/files/$(IUP_VERSION)/Docs%20and%20Sources/$(IUP_TITLE).tar.gz/download"
	find extracted/iup/ -type d -exec chmod +x '{}' ';'
	mkdir -p inc/IUP

	$(FBFROG) iup.fbfrog \
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
		-emit '*/iupweb.h'           inc/IUP/iupweb.bi           \
		-inclib iup                  inc/IUP/iup.bi              \
		-ifdef __FB_WIN32__                                      \
			-inclib gdi32        inc/IUP/iup.bi              \
			-inclib user32       inc/IUP/iup.bi              \
			-inclib comdlg32     inc/IUP/iup.bi              \
			-inclib comctl32     inc/IUP/iup.bi              \
			-inclib ole32        inc/IUP/iup.bi              \
		-else                                                    \
			-inclib gtk-x11-2.0  inc/IUP/iup.bi              \
			-inclib gdk-x11-2.0  inc/IUP/iup.bi              \
			-inclib pangox-1.0   inc/IUP/iup.bi              \
			-inclib gdk_pixbuf-2.0 inc/IUP/iup.bi            \
			-inclib pango-1.0    inc/IUP/iup.bi              \
			-inclib gobject-2.0  inc/IUP/iup.bi              \
			-inclib gmodule-2.0  inc/IUP/iup.bi              \
			-inclib glib-2.0     inc/IUP/iup.bi              \
		-endif


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
	./get.sh $(JIT_TITLE) $(JIT_TITLE).tar.gz "http://git.savannah.gnu.org/cgit/libjit.git/snapshot/$(JIT_TITLE).tar.gz"

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
	./get.sh $(LLVM_TITLE) $(LLVM_TITLE).tar.xz "http://llvm.org/releases/$(LLVM_VERSION)/$(LLVM_TITLE).tar.xz"

	cd extracted/$(LLVM_TITLE) && \
		if [ ! -f include/llvm/Config/Targets.def ]; then ./configure --prefix=/usr; fi

	$(FBFROG) -o inc/llvm-c.bi llvm.fbfrog \
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
		extracted/$(LLVM_TITLE)/include/llvm-c/TargetMachine.h

LUA_TITLE := lua-5.2.3
lua:
	./get.sh $(LUA_TITLE) $(LUA_TITLE).tar.gz "http://www.lua.org/ftp/$(LUA_TITLE).tar.gz"
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
	./get.sh $(NCURSES_TITLE) $(NCURSES_TITLE).tar.gz "http://ftp.gnu.org/pub/gnu/ncurses/$(NCURSES_TITLE).tar.gz"
	cd extracted/$(NCURSES_TITLE) && \
		if [ ! -f include/curses.h ]; then ./configure && cd include && make; fi
	mkdir -p inc/curses
	$(FBFROG) ncurses.fbfrog -o inc/curses/ncurses.bi  extracted/$(NCURSES_TITLE)/include/curses.h

#
# OpenGL headers
#
# There are multiple possible C headers to choose from:
#    Mesa-3D (mostly used on GNU/Linux and probably others)
#    MinGW.org (probably Windows only)
#    MinGW-w64 (probably Windows only)
#    ... and probably others.
#
# Since we often use MinGW-w64 instead of MinGW.org for FB nowadays, the
# MinGW.org headers can probably be ruled out (although I think fbc's old OpenGL
# headers were based on the MinGW.org ones).
#
# It's not quite clear whether to choose Mesa or MinGW-w64 though. They have
# mostly the exact same declarations, but they're also slightly different. The
# main specialty of the Windows-specific headers is that the main GL/gl.h is
# limited to OpenGL 1.1, and anything more recent is treated as extension in
# GL/glext.h. With Mesa that's not the case though.
#
# But using fbfrog to merge the Mesa/MinGW-w64 bindings produces an ugly result,
# because they have declarations ordered differently, so that's not a nice
# solution.
#
# Solution for now:
# Provide two OpenGL bindings, one for Mesa and one for MinGW-w64.
#
opengl: opengl-mesa opengl-winapi

MESA_VERSION := 10.5.1
MESA := mesa-$(MESA_VERSION)
GLU := glu-9.0.0
opengl-mesa:
	./get.sh $(MESA) $(MESA).tar.xz ftp://ftp.freedesktop.org/pub/mesa/$(MESA_VERSION)/$(MESA).tar.xz
	./get.sh $(GLU)  $(GLU).tar.bz2 ftp://ftp.freedesktop.org/pub/mesa/glu/$(GLU).tar.bz2

	mkdir -p inc/GL/mesa
	$(FBFROG) opengl.fbfrog \
		-incdir extracted/$(MESA)/include \
		-incdir extracted/$(GLU)/include \
		-include GL/gl.h \
		-include GL/glext.h \
		-include GL/glu.h \
		-emit '*/GL/gl.h'    inc/GL/mesa/gl.bi \
		-emit '*/GL/glext.h' inc/GL/mesa/glext.bi \
		-emit '*/GL/glu.h'   inc/GL/mesa/glu.bi

opengl-winapi: winapi-extract
	mkdir -p inc/GL/windows
	$(FBFROG) winapi.fbfrog opengl.fbfrog \
		-incdir extracted/$(MINGWW64_TITLE)/mingw-w64-headers/crt \
		-incdir extracted/$(MINGWW64_TITLE)/mingw-w64-headers/include \
		-include GL/gl.h \
		-include GL/glext.h \
		-include GL/glu.h \
		-emit '*/GL/gl.h'    inc/GL/windows/gl.bi \
		-emit '*/GL/glext.h' inc/GL/windows/glext.bi \
		-emit '*/GL/glu.h'   inc/GL/windows/glu.bi

PANGO_SERIES := 1.36
PANGO := pango-$(PANGO_SERIES).8
pango: glib-extract
	./get.sh $(PANGO) $(PANGO).tar.xz http://ftp.gnome.org/pub/gnome/sources/pango/$(PANGO_SERIES)/$(PANGO).tar.xz

	mkdir -p inc/pango
	$(FBFROG) \
		-incdir extracted/$(GLIB) \
		-incdir extracted/$(GLIB)/glib \
		-incdir extracted/$(PANGO) \
		-include pango/pango.h \
		-include pango/pangocairo.h \
		-emit '*/pango/pango.h'            inc/pango/pango.bi \
		-emit '*/pango/pangocairo.h'       inc/pango/pangocairo.bi \
		-emit '*/pango/pango-attributes.h' inc/pango/pango.bi \
		-emit '*/pango/pango-bidi-type.h'  inc/pango/pango.bi \
		-emit '*/pango/pango-break.h'      inc/pango/pango.bi \
		-emit '*/pango/pango-context.h'    inc/pango/pango.bi \
		-emit '*/pango/pango-coverage.h'   inc/pango/pango.bi \
		-emit '*/pango/pango-engine.h'     inc/pango/pango.bi \
		-emit '*/pango/pango-enum-types.h' inc/pango/pango.bi \
		-emit '*/pango/pango-features.h'   inc/pango/pango.bi \
		-emit '*/pango/pango-font.h'       inc/pango/pango.bi \
		-emit '*/pango/pango-fontmap.h'    inc/pango/pango.bi \
		-emit '*/pango/pango-fontset.h'    inc/pango/pango.bi \
		-emit '*/pango/pango-glyph.h'      inc/pango/pango.bi \
		-emit '*/pango/pango-glyph-item.h' inc/pango/pango.bi \
		-emit '*/pango/pango-gravity.h'    inc/pango/pango.bi \
		-emit '*/pango/pango-item.h'       inc/pango/pango.bi \
		-emit '*/pango/pango-layout.h'     inc/pango/pango.bi \
		-emit '*/pango/pango-matrix.h'     inc/pango/pango.bi \
		-emit '*/pango/pango-renderer.h'   inc/pango/pango.bi \
		-emit '*/pango/pango-script.h'     inc/pango/pango.bi \
		-emit '*/pango/pango-tabs.h'       inc/pango/pango.bi \
		-emit '*/pango/pango-types.h'      inc/pango/pango.bi \
		-emit '*/pango/pango-utils.h'      inc/pango/pango.bi

pdcurses:
	./get.sh PDCurses-3.4 PDCurses-3.4.tar.gz "http://sourceforge.net/projects/pdcurses/files/pdcurses/3.4/PDCurses-3.4.tar.gz/download"
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

PNG12_TITLE := libpng-1.2.53
png12:
	./get.sh $(PNG12_TITLE) $(PNG12_TITLE).tar.xz "http://downloads.sourceforge.net/libpng/$(PNG12_TITLE).tar.xz?download"
	$(FBFROG) png.fbfrog png12.fbfrog -o inc/png12.bi extracted/$(PNG12_TITLE)/png.h

PNG14_TITLE := libpng-1.4.16
png14:
	./get.sh $(PNG14_TITLE) $(PNG14_TITLE).tar.xz "http://downloads.sourceforge.net/libpng/$(PNG14_TITLE).tar.xz?download"
	$(FBFROG) png.fbfrog png14.fbfrog -o inc/png14.bi extracted/$(PNG14_TITLE)/png.h

PNG15_TITLE := libpng-1.5.21
png15:
	./get.sh $(PNG15_TITLE) $(PNG15_TITLE).tar.xz "http://downloads.sourceforge.net/libpng/$(PNG15_TITLE).tar.xz?download"
	cp extracted/$(PNG15_TITLE)/scripts/pnglibconf.h.prebuilt \
	   extracted/$(PNG15_TITLE)/pnglibconf.h
	$(FBFROG) png.fbfrog png15.fbfrog -o inc/png15.bi extracted/$(PNG15_TITLE)/png.h

PNG16_TITLE := libpng-1.6.16
png16:
	./get.sh $(PNG16_TITLE) $(PNG16_TITLE).tar.xz "http://downloads.sourceforge.net/libpng/$(PNG16_TITLE).tar.xz?download"
	cp extracted/$(PNG16_TITLE)/scripts/pnglibconf.h.prebuilt \
	   extracted/$(PNG16_TITLE)/pnglibconf.h
	$(FBFROG) png.fbfrog png16.fbfrog -o inc/png16.bi extracted/$(PNG16_TITLE)/png.h

sdl: sdl1 sdl2

SDL1_MAIN := SDL-1.2.15
SDL1_IMAGE := SDL_image-1.2.12
SDL1_MIXER := SDL_mixer-1.2.12
SDL1_NET := SDL_net-1.2.8
SDL1_TTF := SDL_ttf-2.0.11
SDL1_GFX := SDL_gfx-2.0.13
sdl1:
	./get.sh $(SDL1_MAIN)  $(SDL1_MAIN).tar.gz  "http://www.libsdl.org/release/$(SDL1_MAIN).tar.gz"
	./get.sh $(SDL1_IMAGE) $(SDL1_IMAGE).tar.gz "http://www.libsdl.org/projects/SDL_image/release/$(SDL1_IMAGE).tar.gz"
	./get.sh $(SDL1_MIXER) $(SDL1_MIXER).tar.gz "http://www.libsdl.org/projects/SDL_mixer/release/$(SDL1_MIXER).tar.gz"
	./get.sh $(SDL1_NET)   $(SDL1_NET).tar.gz   "http://www.libsdl.org/projects/SDL_net/release/$(SDL1_NET).tar.gz"
	./get.sh $(SDL1_TTF)   $(SDL1_TTF).tar.gz   "http://www.libsdl.org/projects/SDL_ttf/release/$(SDL1_TTF).tar.gz"
	./get.sh $(SDL1_GFX)   $(SDL1_GFX).tar.gz   "http://www.ferzkopp.net/Software/SDL_gfx-2.0/$(SDL1_GFX).tar.gz"

	# SDL_config.h is target-specific, so we'll have to use two versions
	# in separate incdirs, one for Windows (it's probably ok to just use the
	# prepackaged SDL_config.h for this), and one for Linux (generated based
	# on SDL_config.h.in).
	cd extracted/$(SDL1_MAIN)/include && \
		mkdir -p unix windows && \
		if [ -f SDL_config.h ]; then mv SDL_config.h windows; fi && \
		cp SDL_config.h.in unix/SDL_config.h
	cat sdl-unix-config.h >> extracted/$(SDL1_MAIN)/include/unix/SDL_config.h

	mkdir -p inc/SDL
	$(FBFROG) sdl.fbfrog sdl1.fbfrog \
		\
		-incdir extracted/$(SDL1_MAIN)/include \
			-ifdef __FB_WIN32__ \
				-incdir extracted/$(SDL1_MAIN)/include/windows \
			-else \
				-incdir extracted/$(SDL1_MAIN)/include/unix \
			-endif \
			-include SDL.h \
			-include SDL_getenv.h \
			-include SDL_syswm.h \
		-incdir extracted/$(SDL1_IMAGE) -include SDL_image.h \
		-incdir extracted/$(SDL1_MIXER) -include SDL_mixer.h \
		-incdir extracted/$(SDL1_NET)   -include SDL_net.h \
		-incdir extracted/$(SDL1_TTF)   -include SDL_ttf.h \
		-incdir extracted/$(SDL1_GFX) \
			-include SDL_framerate.h          \
			-include SDL_gfxPrimitives_font.h \
			-include SDL_gfxPrimitives.h      \
			-include SDL_imageFilter.h        \
			-include SDL_rotozoom.h           \
		\
		-emit '*/SDL_framerate.h'          inc/SDL/SDL_gfx_framerate.bi \
		-emit '*/SDL_imageFilter.h'        inc/SDL/SDL_gfx_imageFilter.bi \
		-emit '*/SDL_gfxPrimitives.h'      inc/SDL/SDL_gfx_primitives.bi \
		-emit '*/SDL_gfxPrimitives_font.h' inc/SDL/SDL_gfx_primitives_font.bi \
		-emit '*/SDL_rotozoom.h'           inc/SDL/SDL_gfx_rotozoom.bi \
		-emit '*/SDL_image.h' inc/SDL/SDL_image.bi \
		-emit '*/SDL_mixer.h' inc/SDL/SDL_mixer.bi \
		-emit '*/SDL_net.h'   inc/SDL/SDL_net.bi \
		-emit '*/SDL_ttf.h'   inc/SDL/SDL_ttf.bi \
		-emit '*/extracted/$(SDL1_MAIN)/include/*' inc/SDL/SDL.bi \
		\
		-inclib SDL inc/SDL/SDL.bi \
		-ifdef __FB_WIN32__ \
			-inclib gdi32    inc/SDL/SDL.bi \
			-inclib user32   inc/SDL/SDL.bi \
			-inclib winmm    inc/SDL/SDL.bi \
			-inclib dxguid   inc/SDL/SDL.bi \
			-inclib advapi32 inc/SDL/SDL.bi \
		-endif \
		-inclib SDL_gfx inc/SDL/SDL_gfx_framerate.bi \
		-inclib SDL_gfx inc/SDL/SDL_gfx_imageFilter.bi \
		-inclib SDL_gfx inc/SDL/SDL_gfx_primitives.bi \
		-inclib SDL_gfx inc/SDL/SDL_gfx_primitives_font.bi \
		-inclib SDL_gfx inc/SDL/SDL_gfx_rotozoom.bi \
		-inclib SDL_image inc/SDL/SDL_image.bi \
		-inclib SDL_mixer inc/SDL/SDL_mixer.bi \
		-inclib SDL_net inc/SDL/SDL_net.bi \
		-ifdef __FB_WIN32__ \
			-inclib ws2_32   inc/SDL/SDL_net.bi \
			-inclib iphlpapi inc/SDL/SDL_net.bi \
		-endif \
		-inclib SDL_ttf inc/SDL/SDL_ttf.bi

SDL2_MAIN := SDL2-2.0.3
SDL2_IMAGE := SDL2_image-2.0.0
SDL2_MIXER := SDL2_mixer-2.0.0
SDL2_NET := SDL2_net-2.0.0
SDL2_TTF := SDL2_ttf-2.0.12
SDL2_GFX := SDL2_gfx-1.0.1
sdl2: winapi-extract
	./get.sh $(SDL2_MAIN)  $(SDL2_MAIN).tar.gz  "http://www.libsdl.org/release/$(SDL2_MAIN).tar.gz"
	./get.sh $(SDL2_IMAGE) $(SDL2_IMAGE).tar.gz "http://www.libsdl.org/projects/SDL_image/release/$(SDL2_IMAGE).tar.gz"
	./get.sh $(SDL2_MIXER) $(SDL2_MIXER).tar.gz "http://www.libsdl.org/projects/SDL_mixer/release/$(SDL2_MIXER).tar.gz"
	./get.sh $(SDL2_NET)   $(SDL2_NET).tar.gz   "http://www.libsdl.org/projects/SDL_net/release/$(SDL2_NET).tar.gz"
	./get.sh $(SDL2_TTF)   $(SDL2_TTF).tar.gz   "http://www.libsdl.org/projects/SDL_ttf/release/$(SDL2_TTF).tar.gz"
	./get.sh $(SDL2_GFX)   $(SDL2_GFX).tar.gz   "http://www.ferzkopp.net/Software/SDL2_gfx/$(SDL2_GFX).tar.gz"

	# SDL_config.h is target-specific, so we'll have to use two versions
	# in separate incdirs, one for Windows (it's probably ok to just use the
	# prepackaged SDL_config.h for this), and one for Linux (generated based
	# on SDL_config.h.in).
	cd extracted/$(SDL2_MAIN)/include && \
		mkdir -p unix windows && \
		if [ -f SDL_config.h ]; then mv SDL_config.h windows; fi && \
		cp SDL_config.h.in unix/SDL_config.h
	cat sdl-unix-config.h >> extracted/$(SDL2_MAIN)/include/unix/SDL_config.h

	mkdir -p inc/SDL2
	$(FBFROG) sdl.fbfrog sdl2.fbfrog \
		\
		-incdir extracted/$(SDL2_MAIN)/include \
			-ifdef __FB_WIN32__ \
				-incdir extracted/$(SDL2_MAIN)/include/windows \
				-incdir extracted/$(MINGWW64_TITLE)/mingw-w64-headers/crt \
				-incdir extracted/$(MINGWW64_TITLE)/mingw-w64-headers/include \
			-else \
				-incdir extracted/$(SDL2_MAIN)/include/unix \
			-endif \
			-include SDL.h \
		-incdir extracted/$(SDL2_IMAGE) -include SDL_image.h \
		-incdir extracted/$(SDL2_MIXER) -include SDL_mixer.h \
		-incdir extracted/$(SDL2_NET)   -include SDL_net.h \
		-incdir extracted/$(SDL2_TTF)   -include SDL_ttf.h \
		-incdir extracted/$(SDL2_GFX) \
			-include SDL2_framerate.h          \
			-include SDL2_gfxPrimitives_font.h \
			-include SDL2_gfxPrimitives.h      \
			-include SDL2_imageFilter.h        \
			-include SDL2_rotozoom.h           \
		\
		-emit '*/SDL2_framerate.h'          inc/SDL2/SDL2_gfx_framerate.bi \
		-emit '*/SDL2_imageFilter.h'        inc/SDL2/SDL2_gfx_imageFilter.bi \
		-emit '*/SDL2_gfxPrimitives.h'      inc/SDL2/SDL2_gfx_primitives.bi \
		-emit '*/SDL2_gfxPrimitives_font.h' inc/SDL2/SDL2_gfx_primitives_font.bi \
		-emit '*/SDL2_rotozoom.h'           inc/SDL2/SDL2_gfx_rotozoom.bi \
		-emit '*/SDL_image.h' inc/SDL2/SDL_image.bi \
		-emit '*/SDL_mixer.h' inc/SDL2/SDL_mixer.bi \
		-emit '*/SDL_net.h'   inc/SDL2/SDL_net.bi \
		-emit '*/SDL_ttf.h'   inc/SDL2/SDL_ttf.bi \
		-emit '*/extracted/$(SDL2_MAIN)/include/*' inc/SDL2/SDL.bi \
		\
		-inclib SDL2       inc/SDL2/SDL.bi \
		-inclib SDL2_gfx   inc/SDL2/SDL2_gfx_framerate.bi \
		-inclib SDL2_gfx   inc/SDL2/SDL2_gfx_imageFilter.bi \
		-inclib SDL2_gfx   inc/SDL2/SDL2_gfx_primitives.bi \
		-inclib SDL2_gfx   inc/SDL2/SDL2_gfx_primitives_font.bi \
		-inclib SDL2_gfx   inc/SDL2/SDL2_gfx_rotozoom.bi \
		-inclib SDL2_image inc/SDL2/SDL_image.bi \
		-inclib SDL2_mixer inc/SDL2/SDL_mixer.bi \
		-inclib SDL2_net   inc/SDL2/SDL_net.bi \
		-inclib SDL2_ttf   inc/SDL2/SDL_ttf.bi

#
# libtre - regex matching library, provides an implementation of the POSIX
# reg*() functions. libtre's functions (tre/tre.h) have a tre_* prefix,
# tre/regex.h can be used to #define the POSIX reg* names to tre_reg*.
#
# There is a potential conflict with glibc (regex.h): It also provides the
# reg*() functions, but without a prefix. Furthermore, the regex_t type is
# different from the one of libtre. I.e. glibc and libtre are not
# ABI-compatible. But then libtre also has #ifdef TRE_USE_SYSTEM_REGEX_H,
# which allows to mix glibc's reg*() with libtre's extensions.
#
# fbc traditionally provided a regex.bi which means libtre's regex.h.
# This new libtre binding for fbc should provide tre/tre.bi and tre/regex.bi,
# and keep regex.bi as a wrapper for tre/regex.bi (libtre implementation) and
# crt/regex.bi (glibc implementation), with an #ifdef for switching.
#
TRE := tre-0.8.0
tre:
	./get.sh $(TRE) $(TRE).tar.bz2 "http://laurikari.net/tre/$(TRE).tar.bz2"

	mkdir -p inc/tre
	$(FBFROG) tre.fbfrog \
		-incdir extracted/$(TRE)/lib \
		-include regex.h -include tre.h \
		-emit '*/tre.h'   inc/tre/tre.bi \
		-emit '*/regex.h' inc/tre/regex.bi \
		-inclib tre       inc/tre/tre.bi

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
winapi-extract:
	./get.sh $(MINGWW64_TITLE) $(MINGWW64_TITLE).tar.bz2 "http://sourceforge.net/projects/mingw-w64/files/mingw-w64/mingw-w64-release/$(MINGWW64_TITLE).tar.bz2/download"
	cd extracted/$(MINGWW64_TITLE)/mingw-w64-headers/crt && \
		sed -e 's/@MINGW_HAS_SECURE_API@/#define MINGW_HAS_SECURE_API 1/g' < _mingw.h.in > _mingw.h && \
		sed -e 's/MINGW_HAS_DX$$/1/g' < sdks/_mingw_directx.h.in > sdks/_mingw_directx.h && \
		sed -e 's/MINGW_HAS_DDK$$/1/g' < sdks/_mingw_ddk.h.in > sdks/_mingw_ddk.h
winapi: winapi-extract
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
		-emit '*/d3dtypes.h' inc/win/d3dtypes.bi \
		-inclib dxguid       inc/win/d3d.bi

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
		-emit '*/psdk_inc/_wsa_errnos.h'   inc/win/winsock.bi \
		-inclib wsock32                    inc/win/winsock.bi


	# ole.h pass (separate because it can't be #included with windows.h,
	# even though windows.h has code to do just that, due to conflicts with
	# ole2.h)
	$(FBFROG) $(WINAPI_FLAGS) -define _Analysis_noreturn_ "" \
		-include windef.h -include ole.h \
		-emit '*/ole.h' inc/win/ole.bi \
		-inclib ole32   inc/win/ole.bi

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

# X.org X11 headers
#
# TODO:
#    X11/Xlib-xcb.h (needs xcb headers first)
#    X11/Xpoll.h (lots of conflicts with win/winsock2.bi and crt/sys/select.bi)
#    X11/Xthreads.h (needs pthread headers first)
#
# xtrans: it installs .c files into include/X11/Xtrans, and the README says
# there is no shared library version of it. This can't easily be translated to
# FB. But it seems to be an internal library anyways, so it's probably not worth
# it to make a binding.

X11_ICE          := libICE-1.0.9
X11_SM           := libSM-1.2.2
X11_XAU          := libXau-1.0.8
X11_X11          := libX11-1.6.3
X11_XT           := libXt-1.1.4
X11_XEXT         := libXext-1.3.3
X11_XPM          := libXpm-3.5.11
X11_XRENDER      := libXrender-0.9.8
X11_XRANDR       := libXrandr-1.4.2
X11_XI           := libXi-1.7.4
X11_XDMCP        := libXdmcp-1.1.2
X11_XXF86DGA     := libXxf86dga-1.1.4
X11_XXF86VM      := libXxf86vm-1.1.4
X11_XV           := libXv-1.0.10
X11_XFT          := libXft-2.3.2
X11_XCURSOR      := libXcursor-1.1.14
X11_XMU          := libXmu-1.1.2
X11_XTST         := libXtst-1.2.2
X11_XFIXES       := libXfixes-5.0.1
X11_XINERAMA     := libXinerama-1.1.3
X11_LBXUTIL      := liblbxutil-1.1.0
X11_XTRANS       := xtrans-1.3.5
X11_XPROTO       := xproto-7.0.27
X11_XEXTPROTO    := xextproto-7.3.0
X11_RENDERPROTO  := renderproto-0.11.1
X11_RANDRPROTO   := randrproto-1.4.1
X11_KBPROTO      := kbproto-1.0.6
X11_INPUTPROTO   := inputproto-2.3.1
X11_DRI2PROTO    := dri2proto-2.8
X11_XF86DGAPROTO := xf86dgaproto-2.1
X11_XF86VIDMODEPROTO := xf86vidmodeproto-2.3.1
X11_VIDEOPROTO   := videoproto-2.3.2
X11_FIXESPROTO   := fixesproto-5.0
X11_RECORDPROTO  := recordproto-1.14.2

SED_X11_XFUNCPROTO := -e 's/\#undef NARROWPROTO/\#define NARROWPROTO 1/g'
SED_X11_XLIBCONF := -e 's/\#undef XTHREADS/\#define XTHREADS 1/g'
SED_X11_XLIBCONF += -e 's/\#undef XUSE_MTSAFE_API/\#define XUSE_MTSAFE_API 1/g'
SED_X11_XPOLL := -e 's/@USE_FDS_BITS@/__fds_bits/g'

x11:
	mkdir -p extracted/xorg
	mkdir -p tarballs/xorg
	./getxorg.sh $(X11_ICE)      $(X11_ICE).tar.bz2       "http://xorg.freedesktop.org/releases/individual/lib/$(X11_ICE).tar.bz2"
	./getxorg.sh $(X11_SM)       $(X11_SM).tar.bz2        "http://xorg.freedesktop.org/releases/individual/lib/$(X11_SM).tar.bz2"
	./getxorg.sh $(X11_XAU)      $(X11_XAU).tar.bz2       "http://xorg.freedesktop.org/releases/individual/lib/$(X11_XAU).tar.bz2"
	./getxorg.sh $(X11_X11)      $(X11_X11).tar.bz2       "http://xorg.freedesktop.org/releases/individual/lib/$(X11_X11).tar.bz2"
	./getxorg.sh $(X11_XT)       $(X11_XT).tar.bz2        "http://xorg.freedesktop.org/releases/individual/lib/$(X11_XT).tar.bz2"
	./getxorg.sh $(X11_XEXT)     $(X11_XEXT).tar.bz2      "http://xorg.freedesktop.org/releases/individual/lib/$(X11_XEXT).tar.bz2"
	./getxorg.sh $(X11_XPM)      $(X11_XPM).tar.bz2       "http://xorg.freedesktop.org/releases/individual/lib/$(X11_XPM).tar.bz2"
	./getxorg.sh $(X11_XRENDER)  $(X11_XRENDER).tar.bz2   "http://xorg.freedesktop.org/releases/individual/lib/$(X11_XRENDER).tar.bz2"
	./getxorg.sh $(X11_XRANDR)   $(X11_XRANDR).tar.bz2    "http://xorg.freedesktop.org/releases/individual/lib/$(X11_XRANDR).tar.bz2"
	./getxorg.sh $(X11_XI)       $(X11_XI).tar.bz2        "http://xorg.freedesktop.org/releases/individual/lib/$(X11_XI).tar.bz2"
	./getxorg.sh $(X11_XDMCP)    $(X11_XDMCP).tar.bz2     "http://xorg.freedesktop.org/releases/individual/lib/$(X11_XDMCP).tar.bz2"
	./getxorg.sh $(X11_XXF86DGA) $(X11_XXF86DGA).tar.bz2  "http://xorg.freedesktop.org/releases/individual/lib/$(X11_XXF86DGA).tar.bz2"
	./getxorg.sh $(X11_XXF86VM)  $(X11_XXF86VM).tar.bz2   "http://xorg.freedesktop.org/releases/individual/lib/$(X11_XXF86VM).tar.bz2"
	./getxorg.sh $(X11_XV)       $(X11_XV).tar.bz2        "http://xorg.freedesktop.org/releases/individual/lib/$(X11_XV).tar.bz2"
	./getxorg.sh $(X11_XFT)      $(X11_XFT).tar.bz2       "http://xorg.freedesktop.org/releases/individual/lib/$(X11_XFT).tar.bz2"
	./getxorg.sh $(X11_XCURSOR)  $(X11_XCURSOR).tar.bz2   "http://xorg.freedesktop.org/releases/individual/lib/$(X11_XCURSOR).tar.bz2"
	./getxorg.sh $(X11_XMU)      $(X11_XMU).tar.bz2       "http://xorg.freedesktop.org/releases/individual/lib/$(X11_XMU).tar.bz2"
	./getxorg.sh $(X11_XTST)     $(X11_XTST).tar.bz2      "http://xorg.freedesktop.org/releases/individual/lib/$(X11_XTST).tar.bz2"
	./getxorg.sh $(X11_XFIXES)   $(X11_XFIXES).tar.bz2    "http://xorg.freedesktop.org/releases/individual/lib/$(X11_XFIXES).tar.bz2"
	./getxorg.sh $(X11_XINERAMA) $(X11_XINERAMA).tar.bz2  "http://xorg.freedesktop.org/releases/individual/lib/$(X11_XINERAMA).tar.bz2"
	./getxorg.sh $(X11_LBXUTIL)  $(X11_LBXUTIL).tar.bz2   "http://xorg.freedesktop.org/releases/individual/lib/$(X11_LBXUTIL).tar.bz2"
	./getxorg.sh $(X11_XTRANS)   $(X11_XTRANS).tar.bz2    "http://xorg.freedesktop.org/releases/individual/lib/$(X11_XTRANS).tar.bz2"
	./getxorg.sh $(X11_XPROTO)           $(X11_XPROTO).tar.bz2           "http://xorg.freedesktop.org/releases/individual/proto/$(X11_XPROTO).tar.bz2"
	./getxorg.sh $(X11_XEXTPROTO)        $(X11_XEXTPROTO).tar.bz2        "http://xorg.freedesktop.org/releases/individual/proto/$(X11_XEXTPROTO).tar.bz2"
	./getxorg.sh $(X11_RENDERPROTO)      $(X11_RENDERPROTO).tar.bz2      "http://xorg.freedesktop.org/releases/individual/proto/$(X11_RENDERPROTO).tar.bz2"
	./getxorg.sh $(X11_RANDRPROTO)       $(X11_RANDRPROTO).tar.bz2       "http://xorg.freedesktop.org/releases/individual/proto/$(X11_RANDRPROTO).tar.bz2"
	./getxorg.sh $(X11_KBPROTO)          $(X11_KBPROTO).tar.bz2          "http://xorg.freedesktop.org/releases/individual/proto/$(X11_KBPROTO).tar.bz2"
	./getxorg.sh $(X11_INPUTPROTO)       $(X11_INPUTPROTO).tar.bz2       "http://xorg.freedesktop.org/releases/individual/proto/$(X11_INPUTPROTO).tar.bz2"
	./getxorg.sh $(X11_DRI2PROTO)        $(X11_DRI2PROTO).tar.bz2        "http://xorg.freedesktop.org/releases/individual/proto/$(X11_DRI2PROTO).tar.bz2"
	./getxorg.sh $(X11_XF86DGAPROTO)     $(X11_XF86DGAPROTO).tar.bz2     "http://xorg.freedesktop.org/releases/individual/proto/$(X11_XF86DGAPROTO).tar.bz2"
	./getxorg.sh $(X11_XF86VIDMODEPROTO) $(X11_XF86VIDMODEPROTO).tar.bz2 "http://xorg.freedesktop.org/releases/individual/proto/$(X11_XF86VIDMODEPROTO).tar.bz2"
	./getxorg.sh $(X11_VIDEOPROTO)       $(X11_VIDEOPROTO).tar.bz2       "http://xorg.freedesktop.org/releases/individual/proto/$(X11_VIDEOPROTO).tar.bz2"
	./getxorg.sh $(X11_FIXESPROTO)       $(X11_FIXESPROTO).tar.bz2       "http://xorg.freedesktop.org/releases/individual/proto/$(X11_FIXESPROTO).tar.bz2"
	./getxorg.sh $(X11_RECORDPROTO)      $(X11_RECORDPROTO).tar.bz2      "http://xorg.freedesktop.org/releases/individual/proto/$(X11_RECORDPROTO).tar.bz2"

	# Xt: X11/Shell.h and X11/StringDefs.h are generated during the build process
	cd extracted/xorg/$(X11_XT) && \
		if [ ! -f include/X11/Shell.h ]; then \
			(./configure && make) \
		fi

	rm -rf extracted/xorg/X11
	mkdir -p extracted/xorg/X11/Xtrans

	cp extracted/xorg/$(X11_X11)/include/X11/*.h extracted/xorg/X11
	cp extracted/xorg/$(X11_XPROTO)/*.h          extracted/xorg/X11

	# X11: X11/XlibConf.h.in => X11/XlibConf.h
	# xproto: Xfuncproto.h.in => X11/Xfuncproto.h
	# xproto: Xpoll.h.in => X11/Xpoll.h
	sed $(SED_X11_XLIBCONF)   < extracted/xorg/$(X11_X11)/include/X11/XlibConf.h.in > extracted/xorg/X11/XlibConf.h
	sed $(SED_X11_XFUNCPROTO) < extracted/xorg/$(X11_XPROTO)/Xfuncproto.h.in        > extracted/xorg/X11/Xfuncproto.h
	sed $(SED_X11_XPOLL)      < extracted/xorg/$(X11_XPROTO)/Xpoll.h.in             > extracted/xorg/X11/Xpoll.h

	cp -R extracted/xorg/$(X11_ICE)/include/X11     extracted/xorg
	cp -R extracted/xorg/$(X11_SM)/include/X11      extracted/xorg
	cp -R extracted/xorg/$(X11_XAU)/include/X11     extracted/xorg
	cp -R extracted/xorg/$(X11_XT)/include/X11      extracted/xorg
	cp -R extracted/xorg/$(X11_XEXT)/include/X11    extracted/xorg
	cp -R extracted/xorg/$(X11_XPM)/include/X11     extracted/xorg
	cp -R extracted/xorg/$(X11_XRENDER)/include/X11 extracted/xorg
	cp -R extracted/xorg/$(X11_XRANDR)/include/X11  extracted/xorg
	cp -R extracted/xorg/$(X11_XI)/include/X11      extracted/xorg
	cp -R extracted/xorg/$(X11_XDMCP)/include/X11   extracted/xorg
	cp -R extracted/xorg/$(X11_XXF86DGA)/include/X11 extracted/xorg
	cp -R extracted/xorg/$(X11_XXF86VM)/include/X11  extracted/xorg
	cp -R extracted/xorg/$(X11_XV)/include/X11      extracted/xorg
	cp -R extracted/xorg/$(X11_XFT)/include/X11     extracted/xorg
	cp -R extracted/xorg/$(X11_XCURSOR)/include/X11 extracted/xorg
	cp -R extracted/xorg/$(X11_XMU)/include/X11     extracted/xorg
	cp -R extracted/xorg/$(X11_XTST)/include/X11    extracted/xorg
	cp -R extracted/xorg/$(X11_XFIXES)/include/X11  extracted/xorg
	cp -R extracted/xorg/$(X11_XINERAMA)/include/X11 extracted/xorg
	cp -R extracted/xorg/$(X11_LBXUTIL)/include/X11 extracted/xorg
	cp -R extracted/xorg/$(X11_XTRANS)/Xtrans.h     extracted/xorg/X11/Xtrans
	cp -R extracted/xorg/$(X11_XTRANS)/Xtransint.h  extracted/xorg/X11/Xtrans

	cp extracted/xorg/$(X11_XEXTPROTO)/*.h extracted/xorg/X11/extensions
	cp extracted/xorg/$(X11_RENDERPROTO)/*.h extracted/xorg/X11/extensions
	cp extracted/xorg/$(X11_RANDRPROTO)/*.h extracted/xorg/X11/extensions
	cp extracted/xorg/$(X11_KBPROTO)/*.h extracted/xorg/X11/extensions
	cp extracted/xorg/$(X11_INPUTPROTO)/*.h extracted/xorg/X11/extensions
	cp extracted/xorg/$(X11_DRI2PROTO)/*.h extracted/xorg/X11/extensions
	cp extracted/xorg/$(X11_XF86DGAPROTO)/*.h extracted/xorg/X11/extensions
	cp extracted/xorg/$(X11_XF86VIDMODEPROTO)/*.h extracted/xorg/X11/extensions
	cp extracted/xorg/$(X11_VIDEOPROTO)/*.h extracted/xorg/X11/extensions
	cp extracted/xorg/$(X11_FIXESPROTO)/*.h extracted/xorg/X11/extensions
	cp extracted/xorg/$(X11_RECORDPROTO)/*.h extracted/xorg/X11/extensions

	mkdir -p inc/X11/extensions inc/X11/ICE inc/X11/SM inc/X11/Xft inc/X11/Xcursor inc/X11/Xmu inc/X11/Xtrans
	$(FBFROG) x11.fbfrog -incdir extracted/xorg \
		\
		-include X11/Xlib.h \
		-include X11/Xatom.h \
		-include X11/Xcms.h \
		-include X11/Xproto.h \
		-include X11/Xresource.h \
		-include X11/Xutil.h \
		-include X11/cursorfont.h \
		-include X11/Xlibint.h \
		-include X11/ICE/ICEconn.h \
		-include X11/ICE/ICE.h \
		-include X11/ICE/ICElib.h \
		-include X11/ICE/ICEmsg.h \
		-include X11/ICE/ICEproto.h \
		-include X11/ICE/ICEutil.h \
		-include X11/ap_keysym.h \
		-include X11/DECkeysym.h \
		-include X11/HPkeysym.h \
		-include X11/ImUtil.h \
		-include X11/Sunkeysym.h \
		-include X11/Xalloca.h \
		-include X11/Xarch.h \
		-include X11/Xdefs.h \
		-include X11/XF86keysym.h \
		-include X11/XKBlib.h \
		-include X11/Xlocale.h \
		-include X11/Xos.h \
		-include X11/Xos_r.h \
		-include X11/Xregion.h \
		-include X11/Xthreads.h \
		-include X11/XWDFile.h \
		-include X11/SM/SMlib.h \
		-include X11/SM/SMproto.h \
		-include X11/Xauth.h \
		-include X11/Intrinsic.h \
		-include X11/Shell.h \
		-include X11/StringDefs.h \
		-include X11/Vendor.h \
		-include X11/Xtos.h \
		-include X11/extensions/Xcup.h \
		-include X11/extensions/Xext.h \
		-include X11/extensions/Xag.h \
		-include X11/extensions/XShm.h \
		-include X11/extensions/XLbx.h \
		-include X11/extensions/Xge.h \
		-include X11/extensions/extutil.h \
		-include X11/extensions/Xdbe.h \
		-include X11/extensions/xtestext1.h \
		-include X11/extensions/MITMisc.h \
		-include X11/extensions/multibuf.h \
		-include X11/extensions/XEVI.h \
		-include X11/extensions/security.h \
		-include X11/extensions/sync.h \
		-include X11/extensions/dpms.h \
		-include X11/extensions/shape.h \
		-include X11/extensions/Xrender.h \
		-include X11/extensions/Xrandr.h \
		-include X11/extensions/XInput.h \
		-include X11/extensions/XInput2.h \
		-include X11/extensions/Xxf86dga.h \
		-include X11/extensions/xf86vmode.h \
		-include X11/extensions/Xvlib.h \
		-include X11/extensions/EVIproto.h \
		-include X11/extensions/agproto.h \
		-include X11/extensions/cupproto.h \
		-include X11/extensions/dbeproto.h \
		-include X11/extensions/dpmsproto.h \
		-include X11/extensions/ge.h \
		-include X11/extensions/geproto.h \
		-include X11/extensions/lbxproto.h \
		-include X11/extensions/mitmiscproto.h \
		-include X11/extensions/multibufproto.h \
		-include X11/extensions/securproto.h \
		-include X11/extensions/shapeproto.h \
		-include X11/extensions/shapestr.h \
		-include X11/extensions/shmproto.h \
		-include X11/extensions/shmstr.h \
		-include X11/extensions/syncproto.h \
		-include X11/extensions/syncstr.h \
		-include X11/extensions/xtestconst.h \
		-include X11/extensions/xtestext1const.h \
		-include X11/extensions/xtestext1proto.h \
		-include X11/extensions/xtestproto.h \
		-include X11/extensions/randrproto.h \
		-include X11/extensions/XKB.h \
		-include X11/extensions/XKBgeom.h \
		-include X11/extensions/XKBproto.h \
		-include X11/extensions/XKBstr.h \
		-include X11/extensions/XI.h \
		-include X11/extensions/XI2.h \
		-include X11/extensions/XIproto.h \
		-include X11/extensions/XI2proto.h \
		-include X11/extensions/dri2proto.h \
		-include X11/extensions/dri2tokens.h \
		-include X11/extensions/xf86dga.h \
		-include X11/extensions/xf86dga1const.h \
		-include X11/extensions/xf86dga1str.h \
		-include X11/extensions/xf86dga1proto.h \
		-include X11/extensions/xf86dgaconst.h \
		-include X11/extensions/xf86dgaproto.h \
		-include X11/extensions/xf86dgastr.h \
		-include X11/extensions/xf86vm.h \
		-include X11/extensions/xf86vmproto.h \
		-include X11/extensions/xf86vmstr.h \
		-include X11/extensions/vldXvMC.h \
		-include X11/extensions/Xv.h \
		-include X11/extensions/XvMC.h \
		-include X11/extensions/XvMCproto.h \
		-include X11/extensions/Xvproto.h \
		-include X11/extensions/XTest.h \
		-include X11/extensions/record.h \
		-include X11/extensions/recordconst.h \
		-include X11/extensions/recordproto.h \
		-include X11/extensions/recordstr.h \
		-include X11/extensions/xfixesproto.h \
		-include X11/extensions/xfixeswire.h \
		-include X11/Xpoll.h \
		-include X11/Xdmcp.h \
		-include X11/xpm.h \
		-include X11/extensions/Xfixes.h \
		-include X11/extensions/Xinerama.h \
		-include X11/extensions/panoramiXext.h \
		-include X11/extensions/lbxbuf.h \
		-include X11/extensions/lbxbufstr.h \
		-include X11/extensions/lbxdeltastr.h \
		-include X11/extensions/lbximage.h \
		-include X11/extensions/lbxopts.h \
		-include X11/extensions/lbxzlib.h \
		-include X11/Xft/Xft.h \
		-include X11/Xft/XftCompat.h \
		-include X11/Xcursor/Xcursor.h \
		-include X11/Xmu/Xmu.h \
		-include X11/Xmu/CloseHook.h \
		-include X11/Xmu/CurUtil.h \
		-include X11/Xmu/CvtCache.h \
		-include X11/Xmu/Editres.h \
		-include X11/Xmu/EditresP.h \
		-include X11/Xmu/ExtAgent.h \
		-include X11/Xmu/Initer.h \
		-include X11/Xmu/Lookup.h \
		-include X11/Xmu/Misc.h \
		-include X11/Xmu/StdCmap.h \
		-include X11/Xmu/SysUtil.h \
		-include X11/Xmu/WhitePoint.h \
		-include X11/Xmu/WidgetNode.h \
		-include X11/Xmu/WinUtil.h \
		-include X11/Xmu/Xct.h \
		-include X11/Xtrans/Xtrans.h \
		-include X11/Xtrans/Xtransint.h \
		\
		-ifdef __FB_WIN32__ \
			-include X11/Xw32defs.h \
			-include X11/Xwindows.h \
			-include X11/Xwinsock.h \
		-endif \
		\
		-emit '*/X11/ap_keysym.h'    inc/X11/ap_keysym.bi \
		-emit '*/X11/Composite.h'    inc/X11/Composite.bi \
		-emit '*/X11/Constraint.h'   inc/X11/Constraint.bi \
		-emit '*/X11/Core.h'         inc/X11/Core.bi \
		-emit '*/X11/cursorfont.h'   inc/X11/cursorfont.bi \
		-emit '*/X11/DECkeysym.h'    inc/X11/DECkeysym.bi \
		-emit '*/X11/HPkeysym.h'     inc/X11/HPkeysym.bi \
		-emit '*/X11/ICE/ICEconn.h'  inc/X11/ICE/ICEconn.bi \
		-emit '*/X11/ICE/ICE.h'      inc/X11/ICE/ICE.bi \
		-emit '*/X11/ICE/ICElib.h'   inc/X11/ICE/ICElib.bi \
		-emit '*/X11/ICE/ICEmsg.h'   inc/X11/ICE/ICEmsg.bi \
		-emit '*/X11/ICE/ICEproto.h' inc/X11/ICE/ICEproto.bi \
		-emit '*/X11/ICE/ICEutil.h'  inc/X11/ICE/ICEutil.bi \
		-emit '*/X11/ImUtil.h'       inc/X11/ImUtil.bi \
		-emit '*/X11/Intrinsic.h'    inc/X11/Intrinsic.bi \
		-emit '*/X11/Shell.h'        inc/X11/Shell.bi \
		-emit '*/X11/StringDefs.h'   inc/X11/StringDefs.bi \
		-emit '*/X11/keysymdef.h'    inc/X11/keysymdef.bi \
		-emit '*/X11/keysym.h'       inc/X11/keysym.bi \
		-emit '*/X11/Object.h'       inc/X11/Object.bi \
		-emit '*/X11/RectObj.h'      inc/X11/RectObj.bi \
		-emit '*/X11/SM/SM.h'        inc/X11/SM/SM.bi \
		-emit '*/X11/SM/SMlib.h'     inc/X11/SM/SMlib.bi \
		-emit '*/X11/SM/SMproto.h'   inc/X11/SM/SMproto.bi \
		-emit '*/X11/Sunkeysym.h'    inc/X11/Sunkeysym.bi \
		-emit '*/X11/Vendor.h'       inc/X11/Vendor.bi \
		-emit '*/X11/Xalloca.h'      inc/X11/Xalloca.bi \
		-emit '*/X11/Xarch.h'        inc/X11/Xarch.bi \
		-emit '*/X11/Xatom.h'        inc/X11/Xatom.bi \
		-emit '*/X11/Xauth.h'        inc/X11/Xauth.bi \
		-emit '*/X11/Xcms.h'         inc/X11/Xcms.bi \
		-emit '*/X11/Xdefs.h'        inc/X11/Xdefs.bi \
		-emit '*/X11/XF86keysym.h'   inc/X11/XF86keysym.bi \
		-emit '*/X11/Xfuncproto.h'   inc/X11/Xfuncproto.bi \
		-emit '*/X11/Xfuncs.h'       inc/X11/Xfuncs.bi \
		-emit '*/X11/X.h'            inc/X11/X.bi \
		-emit '*/X11/XKBlib.h'       inc/X11/XKBlib.bi \
		-emit '*/X11/XlibConf.h'     inc/X11/XlibConf.bi \
		-emit '*/X11/Xlib.h'         inc/X11/Xlib.bi \
		-emit '*/X11/Xlibint.h'      inc/X11/Xlibint.bi \
		-emit '*/X11/Xlocale.h'      inc/X11/Xlocale.bi \
		-emit '*/X11/Xmd.h'          inc/X11/Xmd.bi \
		-emit '*/X11/Xosdefs.h'      inc/X11/Xosdefs.bi \
		-emit '*/X11/Xos.h'          inc/X11/Xos.bi \
		-emit '*/X11/Xos_r.h'        inc/X11/Xos_r.bi \
		-emit '*/X11/Xproto.h'       inc/X11/Xproto.bi \
		-emit '*/X11/Xprotostr.h'    inc/X11/Xprotostr.bi \
		-emit '*/X11/Xregion.h'      inc/X11/Xregion.bi \
		-emit '*/X11/Xresource.h'    inc/X11/Xresource.bi \
		-emit '*/X11/Xtos.h'         inc/X11/Xtos.bi \
		-emit '*/X11/Xutil.h'        inc/X11/Xutil.bi \
		-emit '*/X11/Xw32defs.h'     inc/X11/Xw32defs.bi \
		-emit '*/X11/XWDFile.h'      inc/X11/XWDFile.bi \
		-emit '*/X11/Xwindows.h'     inc/X11/Xwindows.bi \
		-emit '*/X11/Xwinsock.h'     inc/X11/Xwinsock.bi \
		-emit '*/X11/extensions/Xcup.h'      inc/X11/extensions/Xcup.bi      \
		-emit '*/X11/extensions/Xext.h'      inc/X11/extensions/Xext.bi      \
		-emit '*/X11/extensions/Xag.h'       inc/X11/extensions/Xag.bi       \
		-emit '*/X11/extensions/XShm.h'      inc/X11/extensions/XShm.bi      \
		-emit '*/X11/extensions/XLbx.h'      inc/X11/extensions/XLbx.bi      \
		-emit '*/X11/extensions/Xge.h'       inc/X11/extensions/Xge.bi       \
		-emit '*/X11/extensions/extutil.h'   inc/X11/extensions/extutil.bi   \
		-emit '*/X11/extensions/Xdbe.h'      inc/X11/extensions/Xdbe.bi      \
		-emit '*/X11/extensions/xtestext1.h' inc/X11/extensions/xtestext1.bi \
		-emit '*/X11/extensions/MITMisc.h'   inc/X11/extensions/MITMisc.bi   \
		-emit '*/X11/extensions/multibuf.h'  inc/X11/extensions/multibuf.bi  \
		-emit '*/X11/extensions/XEVI.h'      inc/X11/extensions/XEVI.bi      \
		-emit '*/X11/extensions/security.h'  inc/X11/extensions/security.bi  \
		-emit '*/X11/extensions/sync.h'      inc/X11/extensions/sync.bi      \
		-emit '*/X11/extensions/dpms.h'      inc/X11/extensions/dpms.bi      \
		-emit '*/X11/extensions/shape.h'     inc/X11/extensions/shape.bi     \
		-emit '*/X11/extensions/Xrender.h'   inc/X11/extensions/Xrender.bi   \
		-emit '*/X11/extensions/Xrandr.h'    inc/X11/extensions/Xrandr.bi    \
		-emit '*/X11/extensions/XInput.h'    inc/X11/extensions/XInput.bi    \
		-emit '*/X11/extensions/XInput2.h'   inc/X11/extensions/XInput2.bi   \
		-emit '*/X11/extensions/Xxf86dga.h'  inc/X11/extensions/Xxf86dga.bi  \
		-emit '*/X11/extensions/xf86dga1.h'  inc/X11/extensions/xf86dga1.bi  \
		-emit '*/X11/extensions/xf86vmode.h' inc/X11/extensions/xf86vmode.bi \
		-emit '*/X11/extensions/Xvlib.h'     inc/X11/extensions/Xvlib.bi     \
		-emit '*/X11/extensions/ag.h'              inc/X11/extensions/ag.bi \
		-emit '*/X11/extensions/agproto.h'         inc/X11/extensions/agproto.bi \
		-emit '*/X11/extensions/cup.h'             inc/X11/extensions/cup.bi \
		-emit '*/X11/extensions/cupproto.h'        inc/X11/extensions/cupproto.bi \
		-emit '*/X11/extensions/dbe.h'             inc/X11/extensions/dbe.bi \
		-emit '*/X11/extensions/dbeproto.h'        inc/X11/extensions/dbeproto.bi \
		-emit '*/X11/extensions/dpmsconst.h'       inc/X11/extensions/dpmsconst.bi \
		-emit '*/X11/extensions/dpmsproto.h'       inc/X11/extensions/dpmsproto.bi \
		-emit '*/X11/extensions/EVI.h'             inc/X11/extensions/EVI.bi \
		-emit '*/X11/extensions/EVIproto.h'        inc/X11/extensions/EVIproto.bi \
		-emit '*/X11/extensions/ge.h'              inc/X11/extensions/ge.bi \
		-emit '*/X11/extensions/geproto.h'         inc/X11/extensions/geproto.bi \
		-emit '*/X11/extensions/lbx.h'             inc/X11/extensions/lbx.bi \
		-emit '*/X11/extensions/lbxproto.h'        inc/X11/extensions/lbxproto.bi \
		-emit '*/X11/extensions/mitmiscconst.h'    inc/X11/extensions/mitmiscconst.bi \
		-emit '*/X11/extensions/mitmiscproto.h'    inc/X11/extensions/mitmiscproto.bi \
		-emit '*/X11/extensions/multibufconst.h'   inc/X11/extensions/multibufconst.bi \
		-emit '*/X11/extensions/multibufproto.h'   inc/X11/extensions/multibufproto.bi \
		-emit '*/X11/extensions/secur.h'           inc/X11/extensions/secur.bi \
		-emit '*/X11/extensions/securproto.h'      inc/X11/extensions/securproto.bi \
		-emit '*/X11/extensions/shapeconst.h'      inc/X11/extensions/shapeconst.bi \
		-emit '*/X11/extensions/shapeproto.h'      inc/X11/extensions/shapeproto.bi \
		-emit '*/X11/extensions/shapestr.h'        inc/X11/extensions/shapestr.bi \
		-emit '*/X11/extensions/shm.h'             inc/X11/extensions/shm.bi \
		-emit '*/X11/extensions/shmproto.h'        inc/X11/extensions/shmproto.bi \
		-emit '*/X11/extensions/shmstr.h'          inc/X11/extensions/shmstr.bi \
		-emit '*/X11/extensions/syncconst.h'       inc/X11/extensions/syncconst.bi \
		-emit '*/X11/extensions/syncproto.h'       inc/X11/extensions/syncproto.bi \
		-emit '*/X11/extensions/syncstr.h'         inc/X11/extensions/syncstr.bi \
		-emit '*/X11/extensions/xtestconst.h'      inc/X11/extensions/xtestconst.bi \
		-emit '*/X11/extensions/xtestext1const.h'  inc/X11/extensions/xtestext1const.bi \
		-emit '*/X11/extensions/xtestext1proto.h'  inc/X11/extensions/xtestext1proto.bi \
		-emit '*/X11/extensions/xtestproto.h'      inc/X11/extensions/xtestproto.bi \
		-emit '*/X11/extensions/render.h'          inc/X11/extensions/render.bi \
		-emit '*/X11/extensions/renderproto.h'     inc/X11/extensions/renderproto.bi \
		-emit '*/X11/extensions/randr.h'           inc/X11/extensions/randr.bi \
		-emit '*/X11/extensions/randrproto.h'      inc/X11/extensions/randrproto.bi \
		-emit '*/X11/extensions/XKB.h'             inc/X11/extensions/XKB.bi \
		-emit '*/X11/extensions/XKBgeom.h'         inc/X11/extensions/XKBgeom.bi \
		-emit '*/X11/extensions/XKBproto.h'        inc/X11/extensions/XKBproto.bi \
		-emit '*/X11/extensions/XKBstr.h'          inc/X11/extensions/XKBstr.bi \
		-emit '*/X11/extensions/XI.h'              inc/X11/extensions/XI.bi \
		-emit '*/X11/extensions/XI2.h'             inc/X11/extensions/XI2.bi \
		-emit '*/X11/extensions/XIproto.h'         inc/X11/extensions/XIproto.bi \
		-emit '*/X11/extensions/XI2proto.h'        inc/X11/extensions/XI2proto.bi \
		-emit '*/X11/extensions/dri2proto.h'       inc/X11/extensions/dri2proto.bi \
		-emit '*/X11/extensions/dri2tokens.h'      inc/X11/extensions/dri2tokens.bi \
		-emit '*/X11/extensions/xf86dga.h'         inc/X11/extensions/xf86dga.bi \
		-emit '*/X11/extensions/xf86dga1const.h'   inc/X11/extensions/xf86dga1const.bi \
		-emit '*/X11/extensions/xf86dga1str.h'     inc/X11/extensions/xf86dga1str.bi \
		-emit '*/X11/extensions/xf86dga1proto.h'   inc/X11/extensions/xf86dga1proto.bi \
		-emit '*/X11/extensions/xf86dgaconst.h'    inc/X11/extensions/xf86dgaconst.bi \
		-emit '*/X11/extensions/xf86dgaproto.h'    inc/X11/extensions/xf86dgaproto.bi \
		-emit '*/X11/extensions/xf86dgastr.h'      inc/X11/extensions/xf86dgastr.bi \
		-emit '*/X11/extensions/xf86vm.h'          inc/X11/extensions/xf86vm.bi \
		-emit '*/X11/extensions/xf86vmproto.h'     inc/X11/extensions/xf86vmproto.bi \
		-emit '*/X11/extensions/xf86vmstr.h'       inc/X11/extensions/xf86vmstr.bi \
		-emit '*/X11/extensions/vldXvMC.h'         inc/X11/extensions/vldXvMC.bi \
		-emit '*/X11/extensions/Xv.h'              inc/X11/extensions/Xv.bi \
		-emit '*/X11/extensions/XvMC.h'            inc/X11/extensions/XvMC.bi \
		-emit '*/X11/extensions/XvMCproto.h'       inc/X11/extensions/XvMCproto.bi \
		-emit '*/X11/extensions/Xvproto.h'         inc/X11/extensions/Xvproto.bi \
		-emit '*/X11/extensions/XTest.h'           inc/X11/extensions/XTest.bi \
		-emit '*/X11/extensions/record.h'          inc/X11/extensions/record.bi \
		-emit '*/X11/extensions/recordconst.h'     inc/X11/extensions/recordconst.bi \
		-emit '*/X11/extensions/recordproto.h'     inc/X11/extensions/recordproto.bi \
		-emit '*/X11/extensions/recordstr.h'       inc/X11/extensions/recordstr.bi \
		-emit '*/X11/extensions/Xfixes.h'          inc/X11/extensions/Xfixes.bi \
		-emit '*/X11/extensions/Xinerama.h'        inc/X11/extensions/Xinerama.bi \
		-emit '*/X11/extensions/panoramiXext.h'    inc/X11/extensions/panoramiXext.bi \
		-emit '*/X11/extensions/lbxbuf.h'          inc/X11/extensions/lbxbuf.bi \
		-emit '*/X11/extensions/lbxbufstr.h'       inc/X11/extensions/lbxbufstr.bi \
		-emit '*/X11/extensions/lbxdeltastr.h'     inc/X11/extensions/lbxdeltastr.bi \
		-emit '*/X11/extensions/lbximage.h'        inc/X11/extensions/lbximage.bi \
		-emit '*/X11/extensions/lbxopts.h'         inc/X11/extensions/lbxopts.bi \
		-emit '*/X11/extensions/lbxzlib.h'         inc/X11/extensions/lbxzlib.bi \
		-emit '*/X11/extensions/xfixesproto.h'     inc/X11/extensions/xfixesproto.bi \
		-emit '*/X11/extensions/xfixeswire.h'      inc/X11/extensions/xfixeswire.bi \
		-emit '*/X11/Xft/Xft.h'              inc/X11/Xft/Xft.bi \
		-emit '*/X11/Xft/XftCompat.h'        inc/X11/Xft/XftCompat.bi \
		-emit '*/X11/Xcursor/Xcursor.h'      inc/X11/Xcursor/Xcursor.bi \
		-emit '*/X11/Xmu/Atoms.h'            inc/X11/Xmu/Atoms.bi \
		-emit '*/X11/Xmu/CharSet.h'          inc/X11/Xmu/CharSet.bi \
		-emit '*/X11/Xmu/CloseHook.h'        inc/X11/Xmu/CloseHook.bi \
		-emit '*/X11/Xmu/Converters.h'       inc/X11/Xmu/Converters.bi \
		-emit '*/X11/Xmu/CurUtil.h'          inc/X11/Xmu/CurUtil.bi \
		-emit '*/X11/Xmu/CvtCache.h'         inc/X11/Xmu/CvtCache.bi \
		-emit '*/X11/Xmu/DisplayQue.h'       inc/X11/Xmu/DisplayQue.bi \
		-emit '*/X11/Xmu/Drawing.h'          inc/X11/Xmu/Drawing.bi \
		-emit '*/X11/Xmu/Editres.h'          inc/X11/Xmu/Editres.bi \
		-emit '*/X11/Xmu/EditresP.h'         inc/X11/Xmu/EditresP.bi \
		-emit '*/X11/Xmu/Error.h'            inc/X11/Xmu/Error.bi \
		-emit '*/X11/Xmu/ExtAgent.h'         inc/X11/Xmu/ExtAgent.bi \
		-emit '*/X11/Xmu/Initer.h'           inc/X11/Xmu/Initer.bi \
		-emit '*/X11/Xmu/Lookup.h'           inc/X11/Xmu/Lookup.bi \
		-emit '*/X11/Xmu/Misc.h'             inc/X11/Xmu/Misc.bi \
		-emit '*/X11/Xmu/StdCmap.h'          inc/X11/Xmu/StdCmap.bi \
		-emit '*/X11/Xmu/StdSel.h'           inc/X11/Xmu/StdSel.bi \
		-emit '*/X11/Xmu/SysUtil.h'          inc/X11/Xmu/SysUtil.bi \
		-emit '*/X11/Xmu/WhitePoint.h'       inc/X11/Xmu/WhitePoint.bi \
		-emit '*/X11/Xmu/WidgetNode.h'       inc/X11/Xmu/WidgetNode.bi \
		-emit '*/X11/Xmu/WinUtil.h'          inc/X11/Xmu/WinUtil.bi \
		-emit '*/X11/Xmu/Xct.h'              inc/X11/Xmu/Xct.bi \
		-emit '*/X11/Xmu/Xmu.h'              inc/X11/Xmu/Xmu.bi \
		-emit '*/X11/Xtrans/Xtrans.h'        inc/X11/Xtrans/Xtrans.bi \
		-emit '*/X11/Xtrans/Xtransint.h'     inc/X11/Xtrans/Xtransint.bi \
		-emit '*/X11/Xdmcp.h'  inc/X11/Xdmcp.bi \
		-emit '*/X11/xpm.h'    inc/X11/xpm.bi

	$(FBFROG) x11.fbfrog -incdir extracted/xorg \
		\
		-include X11/IntrinsicI.h \
		-include X11/ShellI.h \
		-include X11/ShellP.h \
		-include X11/VarargsI.h \
		-include X11/VendorP.h \
		-include X11/CreateI.h \
		-include X11/ResConfigP.h \
		-include X11/SelectionI.h \
		\
		-emit '*/X11/CallbackI.h'    inc/X11/CallbackI.bi \
		-emit '*/X11/CompositeP.h'   inc/X11/CompositeP.bi \
		-emit '*/X11/ConstrainP.h'   inc/X11/ConstrainP.bi \
		-emit '*/X11/ConvertI.h'     inc/X11/ConvertI.bi \
		-emit '*/X11/CoreP.h'        inc/X11/CoreP.bi \
		-emit '*/X11/CreateI.h'      inc/X11/CreateI.bi \
		-emit '*/X11/EventI.h'       inc/X11/EventI.bi \
		-emit '*/X11/HookObjI.h'     inc/X11/HookObjI.bi \
		-emit '*/X11/InitialI.h'     inc/X11/InitialI.bi \
		-emit '*/X11/IntrinsicI.h'   inc/X11/IntrinsicI.bi \
		-emit '*/X11/IntrinsicP.h'   inc/X11/IntrinsicP.bi \
		-emit '*/X11/ObjectP.h'      inc/X11/ObjectP.bi \
		-emit '*/X11/PassivGraI.h'   inc/X11/PassivGraI.bi \
		-emit '*/X11/RectObjP.h'     inc/X11/RectObjP.bi \
		-emit '*/X11/ResConfigP.h'   inc/X11/ResConfigP.bi \
		-emit '*/X11/ResourceI.h'    inc/X11/ResourceI.bi \
		-emit '*/X11/SelectionI.h'   inc/X11/SelectionI.bi \
		-emit '*/X11/ShellI.h'       inc/X11/ShellI.bi \
		-emit '*/X11/ShellP.h'       inc/X11/ShellP.bi \
		-emit '*/X11/ThreadsI.h'     inc/X11/ThreadsI.bi \
		-emit '*/X11/TranslateI.h'   inc/X11/TranslateI.bi \
		-emit '*/X11/VarargsI.h'     inc/X11/VarargsI.bi \
		-emit '*/X11/VendorP.h'      inc/X11/VendorP.bi \

xcb:
	./downloadextract.sh xcb-proto-1.8          xcb-proto-1.8.tar.bz2          "http://xcb.freedesktop.org/dist/xcb-proto-1.8.tar.bz2"
	./downloadextract.sh libpthread-stubs-0.3 libpthread-stubs-0.3.tar.bz2 "http://xcb.freedesktop.org/dist/libpthread-stubs-0.3.tar.bz2"
	./downloadextract.sh libxcb-1.9           libxcb-1.9.tar.bz2           "http://xcb.freedesktop.org/dist/libxcb-1.9.tar.bz2"


ZIP_TITLE := libzip-0.11.2
zip:
	./get.sh $(ZIP_TITLE) $(ZIP_TITLE).tar.xz "http://www.nih.at/libzip/$(ZIP_TITLE).tar.xz"
	# Need to compile libzip in order to get zipconf.h
	# (luckily it's the same for all targets)
	cd extracted/$(ZIP_TITLE) && \
		if [ ! -f lib/zipconf.h ]; then ./configure && make; fi
	$(FBFROG) zip.fbfrog -o inc extracted/$(ZIP_TITLE)/lib/zip.h

ZLIB_TITLE := zlib-1.2.8
zlib:
	./get.sh $(ZLIB_TITLE) $(ZLIB_TITLE).tar.xz "http://zlib.net/$(ZLIB_TITLE).tar.xz"
	$(FBFROG) zlib.fbfrog -o inc extracted/$(ZLIB_TITLE)/zlib.h
