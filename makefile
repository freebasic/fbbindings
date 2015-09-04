FBFROG_VERSION := ae309b6f76e19305edaaff68003c979e8006c6c9

ALL := allegro allegro4 allegro5 aspell atk
ALL += bass bassmod bfd bzip2
ALL += caca cairo cd cgiutil cgui chipmunk clang crt cryptlib cunit curl
ALL += devil disphelper
ALL += expat
ALL += fastcgi ffi flite fontconfig freeglut freeimage freetype
ALL += gdkpixbuf glib glfw glut gtk gtk2 gtk3 gtkglext
ALL += iconv iup
ALL += jit
ALL += llvm lua
ALL += ncurses
ALL += openal opengl opengl-mesa opengl-winapi
ALL += pango pdcurses png png12 png14 png15 png16
ALL += sdl sdl1 sdl2
ALL += tre
ALL += winapi
ALL += x11 xcb
ALL += zip zlib

EXEEXT := $(shell fbc -print x)
LOCAL_FBFROG_DIR := extracted/fbfrog-$(FBFROG_VERSION)
LOCAL_FBFROG := $(LOCAL_FBFROG_DIR)/fbfrog$(EXEEXT)
FBFROG := $(LOCAL_FBFROG)
GETCOMMENT := ./getcomment$(EXEEXT)

.PHONY: all clean $(ALL)

all: $(ALL)

clean:
	rm -rf extracted/*

$(LOCAL_FBFROG_DIR):
	./get.sh fbfrog-$(FBFROG_VERSION) fbfrog-$(FBFROG_VERSION).tar.gz https://github.com/dkl/fbfrog/archive/$(FBFROG_VERSION).tar.gz

$(LOCAL_FBFROG): $(wildcard $(LOCAL_FBFROG_DIR)/*.bas $(LOCAL_FBFROG_DIR)/*.bi) | $(LOCAL_FBFROG_DIR)
	cd $(LOCAL_FBFROG_DIR) && make

$(GETCOMMENT): getcomment.bas
	fbc $< -g -exx

tools: $(LOCAL_FBFROG) $(GETCOMMENT)

allegro: allegro4 allegro5

ALLEGRO4_VERSION := 4.4.2
ALLEGRO4_TITLE := allegro-$(ALLEGRO4_VERSION)
ALGIF := algif_1.3
ALPNG := alpng13
ALPNG_TARBALL := tarballs/$(ALPNG).tar.gz
allegro4: tools
	./get.sh $(ALLEGRO4_TITLE) $(ALLEGRO4_TITLE).tar.gz "http://cdn.allegro.cc/file/library/allegro/$(ALLEGRO4_VERSION)/$(ALLEGRO4_TITLE).tar.gz"
	./get.sh $(ALGIF) $(ALGIF).zip "http://prdownloads.sourceforge.net/algif/$(ALGIF).zip?download"
	if [ ! -f "$(ALPNG_TARBALL)" ]; then \
		wget --no-verbose "http://sourceforge.net/projects/alpng/files/alpng/1.3/$(ALPNG_TARBALL)/download" -O "$(ALPNG_TARBALL)"; \
	fi
	if [ ! -d extracted/$(ALPNG) ]; then \
		mkdir -p extracted/$(ALPNG); \
		tar xf "$(ALPNG_TARBALL)" -C extracted/$(ALPNG); \
	fi

	mkdir -p extracted/$(ALLEGRO4_TITLE)/include/dos/allegro/platform
	mkdir -p extracted/$(ALLEGRO4_TITLE)/include/unix/allegro/platform
	mkdir -p extracted/$(ALLEGRO4_TITLE)/include/windows/allegro/platform

	./fake-configure ALLEGRO_DJGPP \
		< extracted/$(ALLEGRO4_TITLE)/include/allegro/platform/alplatf.h.cmake \
		> extracted/$(ALLEGRO4_TITLE)/include/dos/allegro/platform/alplatf.h

	./fake-configure ALLEGRO_UNIX \
		< extracted/$(ALLEGRO4_TITLE)/include/allegro/platform/alplatf.h.cmake \
		> extracted/$(ALLEGRO4_TITLE)/include/unix/allegro/platform/alplatf.h

	./fake-configure ALLEGRO_MINGW32 \
		< extracted/$(ALLEGRO4_TITLE)/include/allegro/platform/alplatf.h.cmake \
		> extracted/$(ALLEGRO4_TITLE)/include/windows/allegro/platform/alplatf.h

	./fake-configure \
		ALLEGRO_LITTLE_ENDIAN \
		ALLEGRO_HAVE_INTTYPES_H \
		ALLEGRO_HAVE_STDBOOL_H \
		ALLEGRO_HAVE_STDINT_H \
		ALLEGRO_HAVE_MEMCMP \
		ALLEGRO_HAVE_SYS_TYPES_H \
		ALLEGRO_COLOR8  \
		ALLEGRO_COLOR16 \
		ALLEGRO_COLOR24 \
		ALLEGRO_COLOR32 \
		ALLEGRO_NO_ASM \
		< extracted/$(ALLEGRO4_TITLE)/include/allegro/platform/alunixac.h.cmake \
		> extracted/$(ALLEGRO4_TITLE)/include/allegro/platform/alunixac.h

	sed -n 1,15p    extracted/$(ALLEGRO4_TITLE)/readme.txt | cut -c4-  > allegro4.tmp
	sed -n 177,197p extracted/$(ALLEGRO4_TITLE)/readme.txt | cut -c4- >> allegro4.tmp
	sed -n 412,427p extracted/$(ALGIF)/README      > algif.tmp
	sed -n 2,24p    extracted/$(ALPNG)/src/alpng.h > alpng.tmp

	mkdir -p inc/allegro
	$(FBFROG) allegro4.fbfrog \
		\
		-incdir extracted/$(ALLEGRO4_TITLE)/include \
		-selecttarget \
		-case dos \
			-incdir extracted/$(ALLEGRO4_TITLE)/include/dos \
		-case windows \
			-incdir extracted/$(ALLEGRO4_TITLE)/include/windows \
		-caseelse \
			-incdir extracted/$(ALLEGRO4_TITLE)/include/unix \
		-endselect \
		-incdir extracted/algif_1.3/src \
		-incdir extracted/alpng13/src \
		\
		-include allegro.h \
		-include algif.h \
		-include alpng.h \
		\
		-emit '*/algif.h' inc/allegro/algif.bi \
		-emit '*/alpng.h' inc/allegro/alpng.bi \
		-emit '*'         inc/allegro.bi \
		\
		-selecttarget \
		-case dos \
			-inclib alleg inc/allegro.bi \
		-case windows \
			-ifdef ALLEGRO_STATICLINK \
				-inclib alleg_s inc/allegro.bi \
			-else \
				-inclib alleg   inc/allegro.bi \
			-endif \
		-caseelse \
			-inclib alleg   inc/allegro.bi \
			-inclib X11     inc/allegro.bi \
			-inclib Xext    inc/allegro.bi \
			-inclib Xpm     inc/allegro.bi \
			-inclib Xxf86vm inc/allegro.bi \
			-inclib Xcursor inc/allegro.bi \
		-endselect \
		-inclib algif  inc/allegro/algif.bi \
		-inclib alpng  inc/allegro/alpng.bi \
		-undef screen  inc/allegro.bi \
		-undef circle  inc/allegro.bi \
		-undef line    inc/allegro.bi \
		-undef palette inc/allegro.bi \
		-undef rgb     inc/allegro.bi \
		-addinclude allegro.bi inc/allegro/alpng.bi \
		\
		-title $(ALLEGRO4_TITLE) allegro4.tmp fbteam.txt inc/allegro.bi \
		-title algif_1.3         algif.tmp    fbteam.txt inc/allegro/algif.bi \
		-title alpng13           alpng.tmp    fbteam.txt inc/allegro/alpng.bi

	rm *.tmp

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
allegro5: tools
	./get.sh $(ALLEGRO5_TITLE) $(ALLEGRO5_TITLE).tar.gz "http://sourceforge.net/projects/alleg/files/allegro/$(ALLEGRO5_VERSION)/$(ALLEGRO5_TITLE).tar.gz/download"

	mkdir -p extracted/$(ALLEGRO5_TITLE)/include/unix/allegro5/platform
	mkdir -p extracted/$(ALLEGRO5_TITLE)/include/linux/allegro5/platform
	mkdir -p extracted/$(ALLEGRO5_TITLE)/include/windows/allegro5/platform

	# Other Unix (BSD/Cygwin)
	./fake-configure `cat allegro5-config.txt` `cat allegro5-config-unix.txt` \
		< extracted/$(ALLEGRO5_TITLE)/include/allegro5/platform/alplatf.h.cmake \
		> extracted/$(ALLEGRO5_TITLE)/include/unix/allegro5/platform/alplatf.h
	echo "#pragma once" >> extracted/$(ALLEGRO5_TITLE)/include/unix/allegro5/platform/alplatf.h

	# Linux
	./fake-configure `cat allegro5-config.txt` `cat allegro5-config-unix.txt` `cat allegro5-config-linux.txt` \
		< extracted/$(ALLEGRO5_TITLE)/include/allegro5/platform/alplatf.h.cmake \
		> extracted/$(ALLEGRO5_TITLE)/include/linux/allegro5/platform/alplatf.h
	echo "#pragma once" >> extracted/$(ALLEGRO5_TITLE)/include/linux/allegro5/platform/alplatf.h

	# Windows
	./fake-configure ALLEGRO_MINGW32 `cat allegro5-config.txt` \
		< extracted/$(ALLEGRO5_TITLE)/include/allegro5/platform/alplatf.h.cmake \
		> extracted/$(ALLEGRO5_TITLE)/include/windows/allegro5/platform/alplatf.h
	echo "#pragma once" >> extracted/$(ALLEGRO5_TITLE)/include/windows/allegro5/platform/alplatf.h

	sed -n 1,20p extracted/$(ALLEGRO5_TITLE)/LICENSE.txt > allegro5.tmp

	mkdir -p inc/allegro5
	$(FBFROG) allegro5.fbfrog \
		\
		-incdir extracted/$(ALLEGRO5_TITLE)/include \
		-incdir extracted/$(ALLEGRO5_TITLE)/addons/acodec \
		-incdir extracted/$(ALLEGRO5_TITLE)/addons/audio \
		-incdir extracted/$(ALLEGRO5_TITLE)/addons/color \
		-incdir extracted/$(ALLEGRO5_TITLE)/addons/font \
		-incdir extracted/$(ALLEGRO5_TITLE)/addons/image \
		-incdir extracted/$(ALLEGRO5_TITLE)/addons/memfile \
		-incdir extracted/$(ALLEGRO5_TITLE)/addons/native_dialog \
		-incdir extracted/$(ALLEGRO5_TITLE)/addons/physfs \
		-incdir extracted/$(ALLEGRO5_TITLE)/addons/primitives \
		-incdir extracted/$(ALLEGRO5_TITLE)/addons/ttf \
		-selecttarget \
		-case windows -incdir extracted/$(ALLEGRO5_TITLE)/include/windows \
		-case linux   -incdir extracted/$(ALLEGRO5_TITLE)/include/linux \
		-caseelse     -incdir extracted/$(ALLEGRO5_TITLE)/include/unix \
		-endselect \
		\
		-include allegro5/allegro.h \
		-include allegro5/allegro_acodec.h \
		-include allegro5/allegro_audio.h \
		-include allegro5/allegro_color.h \
		-include allegro5/allegro_font.h \
		-include allegro5/allegro_image.h \
		-include allegro5/allegro_memfile.h \
		-include allegro5/allegro_native_dialog.h \
		-include allegro5/allegro_physfs.h \
		-include allegro5/allegro_primitives.h \
		-include allegro5/allegro_ttf.h \
		\
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
		-iftarget windows \
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
		-endif \
		\
		-title $(ALLEGRO5_TITLE) allegro5.tmp fbteam.txt

	rm *.tmp

ASPELL := aspell-0.60.6.1
aspell: tools
	./get.sh $(ASPELL) $(ASPELL).tar.gz ftp://ftp.gnu.org/gnu/aspell/$(ASPELL).tar.gz

	$(GETCOMMENT) -2 extracted/$(ASPELL)/interfaces/cc/aspell.h > aspell.tmp
	$(GETCOMMENT)    extracted/$(ASPELL)/interfaces/cc/pspell.h > pspell.tmp

	$(FBFROG) aspell.fbfrog \
		-incdir extracted/$(ASPELL)/interfaces/cc \
		-include aspell.h -include pspell.h \
		-emit '*/aspell.h' inc/aspell.bi \
		-emit '*/pspell.h' inc/pspell.bi \
		-title $(ASPELL) aspell.tmp fbteam.txt inc/aspell.bi \
		-title $(ASPELL) pspell.tmp fbteam.txt inc/pspell.bi \
		-inclib aspell inc/aspell.bi \
		-iftarget dos \
			-inclib stdcx inc/aspell.bi \
		-else \
			-inclib stdc++ inc/aspell.bi \
			-iftarget windows \
				-inclib pthread inc/aspell.bi \
			-endif \
		-endif

	rm *.tmp

ATK_SERIES := 2.14
ATK := atk-$(ATK_SERIES).0
atk-extract:
	./get.sh $(ATK) $(ATK).tar.xz http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_SERIES)/$(ATK).tar.xz

atk: tools atk-extract glib-extract

	$(GETCOMMENT) extracted/$(ATK)/atk/atk.h > atk.tmp
	./fsf-address-fix.sh atk.tmp

	mkdir -p inc/atk
	$(FBFROG) atk.fbfrog \
		-incdir extracted/$(ATK) \
		-incdir extracted/$(GLIB) \
		-incdir extracted/$(GLIB)/glib \
		-include atk/atk.h \
		-emit '*/atk/atkaction.h'            inc/atk/atk.bi \
		-emit '*/atk/atkcomponent.h'         inc/atk/atk.bi \
		-emit '*/atk/atkdocument.h'          inc/atk/atk.bi \
		-emit '*/atk/atkeditabletext.h'      inc/atk/atk.bi \
		-emit '*/atk/atk-enum-types.h'       inc/atk/atk.bi \
		-emit '*/atk/atkgobjectaccessible.h' inc/atk/atk.bi \
		-emit '*/atk/atk.h'                  inc/atk/atk.bi \
		-emit '*/atk/atkhyperlink.h'         inc/atk/atk.bi \
		-emit '*/atk/atkhyperlinkimpl.h'     inc/atk/atk.bi \
		-emit '*/atk/atkhypertext.h'         inc/atk/atk.bi \
		-emit '*/atk/atkimage.h'             inc/atk/atk.bi \
		-emit '*/atk/atkmisc.h'              inc/atk/atk.bi \
		-emit '*/atk/atknoopobjectfactory.h' inc/atk/atk.bi \
		-emit '*/atk/atknoopobject.h'        inc/atk/atk.bi \
		-emit '*/atk/atkobjectfactory.h'     inc/atk/atk.bi \
		-emit '*/atk/atkobject.h'            inc/atk/atk.bi \
		-emit '*/atk/atkplug.h'              inc/atk/atk.bi \
		-emit '*/atk/atkprivate.h'           inc/atk/atk.bi \
		-emit '*/atk/atkrange.h'             inc/atk/atk.bi \
		-emit '*/atk/atkregistry.h'          inc/atk/atk.bi \
		-emit '*/atk/atkrelation.h'          inc/atk/atk.bi \
		-emit '*/atk/atkrelationset.h'       inc/atk/atk.bi \
		-emit '*/atk/atkrelationtype.h'      inc/atk/atk.bi \
		-emit '*/atk/atkselection.h'         inc/atk/atk.bi \
		-emit '*/atk/atksocket.h'            inc/atk/atk.bi \
		-emit '*/atk/atkstate.h'             inc/atk/atk.bi \
		-emit '*/atk/atkstateset.h'          inc/atk/atk.bi \
		-emit '*/atk/atkstreamablecontent.h' inc/atk/atk.bi \
		-emit '*/atk/atktablecell.h'         inc/atk/atk.bi \
		-emit '*/atk/atktable.h'             inc/atk/atk.bi \
		-emit '*/atk/atktext.h'              inc/atk/atk.bi \
		-emit '*/atk/atkutil.h'              inc/atk/atk.bi \
		-emit '*/atk/atkvalue.h'             inc/atk/atk.bi \
		-emit '*/atk/atkversion.h'           inc/atk/atk.bi \
		-emit '*/atk/atkwindow.h'            inc/atk/atk.bi \
		-inclib atk-1.0                      inc/atk/atk.bi \
		-title $(ATK) atk.tmp gtk+-translators.txt
	rm *.tmp

BASS := bass24
bass: tools winapi-extract
	./get.sh $(BASS) $(BASS).zip http://us.un4seen.com/files/$(BASS).zip createdir

	$(GETCOMMENT) extracted/$(BASS)/c/bass.h > bass.tmp
	echo >> bass.tmp
	sed -n 639,655p extracted/$(BASS)/bass.txt >> bass.tmp

	$(FBFROG) bass.fbfrog \
		-iftarget windows \
			-incdir extracted/$(MINGWW64_TITLE)/mingw-w64-headers/crt \
			-incdir extracted/$(MINGWW64_TITLE)/mingw-w64-headers/include \
		-endif \
		extracted/$(BASS)/c/bass.h \
		-emit '*/bass.h' inc/bass.bi \
		-title $(BASS) bass.tmp fbteam.txt \
		-inclib bass

	rm *.tmp

BASSMOD := bassmod20
bassmod: tools winapi-extract
	./get.sh $(BASSMOD) $(BASSMOD).zip http://us.un4seen.com/files/$(BASSMOD).zip createdir

	$(GETCOMMENT) extracted/$(BASSMOD)/c/bassmod.h > bassmod.tmp
	echo >> bassmod.tmp
	sed -n 158,175p extracted/$(BASSMOD)/BASSMOD.txt >> bassmod.tmp

	$(FBFROG) bass.fbfrog \
		-iftarget windows \
			-incdir extracted/$(MINGWW64_TITLE)/mingw-w64-headers/crt \
			-incdir extracted/$(MINGWW64_TITLE)/mingw-w64-headers/include \
		-endif \
		extracted/$(BASSMOD)/c/bassmod.h \
		-emit '*/bassmod.h' inc/bassmod.bi \
		-title $(BASSMOD) bassmod.tmp fbteam.txt \
		-inclib bassmod inc/bassmod.bi

	rm *.tmp

################################################################################
# libbfd binding

BINUTILS_216 := binutils-2.16.1
BINUTILS_217 := binutils-2.17
BINUTILS_218 := binutils-2.18
BINUTILS_219 := binutils-2.19.1
BINUTILS_220 := binutils-2.20.1
BINUTILS_221 := binutils-2.21.1
BINUTILS_222 := binutils-2.22
BINUTILS_223 := binutils-2.23.2
BINUTILS_224 := binutils-2.24
BINUTILS_225 := binutils-2.25

BINUTILS_SED := -e 's/@supports_plugins@/1/g'
BINUTILS_SED += -e 's/@BFD_HOST_64BIT_LONG_LONG@/1/g'
BINUTILS_SED += -e 's/@BFD_HOST_64_BIT_DEFINED@/1/g'
BINUTILS_SED += -e 's/@BFD_HOST_64_BIT@/long long/g'
BINUTILS_SED += -e 's/@BFD_HOST_U_64_BIT@/unsigned long long/g'
BINUTILS_SED += -e 's/@BFD_HOST_64BIT_LONG@/0/g'
BINUTILS_SED += -e 's/@BFD_HOST_LONG_LONG@/1/g'
BINUTILS_SED += -e 's/@BFD_HOSTPTR_T@/size_t/g'

BINUTILS_SED_32 := $(BINUTILS_SED)
BINUTILS_SED_32 += -e 's/@wordsize@/32/g'
BINUTILS_SED_32 += -e 's/@bfd_default_target_size@/32/g'
# file_ptr is 64bit even on linux-x86 and win32 (MinGW-w64 at least) because 64bit off_t/ftello is available
BINUTILS_SED_32 += -e 's/@bfd_file_ptr@/BFD_HOST_64_BIT/g'

BINUTILS_SED_64 := $(BINUTILS_SED)
BINUTILS_SED_64 += -e 's/@wordsize@/64/g'
BINUTILS_SED_64 += -e 's/@bfd_default_target_size@/64/g'
BINUTILS_SED_64 += -e 's/@bfd_file_ptr@/BFD_HOST_64_BIT/g'

BINUTILS_SED_DJGPP := $(BINUTILS_SED)
BINUTILS_SED_DJGPP += -e 's/@wordsize@/32/g'
BINUTILS_SED_DJGPP += -e 's/@bfd_default_target_size@/32/g'
# 32bit file_ptr with DJGPP
BINUTILS_SED_DJGPP += -e 's/@bfd_file_ptr@/long/g'

include bfd.mk

################################################################################

BZIP2_VERSION := 1.0.6
BZIP2 := bzip2-$(BZIP2_VERSION)
bzip2: tools
	./get.sh $(BZIP2) $(BZIP2).tar.gz http://www.bzip.org/$(BZIP2_VERSION)/$(BZIP2).tar.gz

	sed -n 4,40p extracted/$(BZIP2)/LICENSE > bzip2.tmp
	$(FBFROG) bzip2.fbfrog extracted/$(BZIP2)/bzlib.h -o inc -inclib bz2 \
		-title $(BZIP2) bzip2.tmp fbteam.txt
	rm *.tmp

CACA := libcaca-0.99.beta19
caca: tools
	./get.sh $(CACA) $(CACA).tar.gz http://caca.zoy.org/files/libcaca/$(CACA).tar.gz

	$(GETCOMMENT) extracted/$(CACA)/caca/caca.h  > caca.tmp
	$(GETCOMMENT) extracted/$(CACA)/caca/caca0.h > caca0.tmp

	$(FBFROG) caca-common.fbfrog caca.fbfrog \
		-incdir extracted/$(CACA)/caca \
		-include caca.h \
		-emit '*/caca.h'       inc/caca.bi \
		-emit '*/caca_types.h' inc/caca.bi \
		-title $(CACA) caca.tmp fbteam.txt inc/caca.bi \
		-inclib caca inc/caca.bi

	$(FBFROG) caca-common.fbfrog caca0.fbfrog \
		-incdir extracted/$(CACA)/caca \
		-include caca0.h \
		-emit '*/caca0.h' inc/caca0.bi \
		-title $(CACA) caca0.tmp fbteam.txt inc/caca0.bi

	rm *.tmp

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
cairo-extract:
	./get.sh $(CAIRO) $(CAIRO).tar.xz http://cairographics.org/releases/$(CAIRO).tar.xz

	# Overwrite src/cairo-version.h (a place holder) with the one from toplevel (the real thing)
	cp extracted/$(CAIRO)/cairo-version.h extracted/$(CAIRO)/src

cairo: tools cairo-extract
	sed -n 1,35p extracted/$(CAIRO)/src/cairo.h | cut -c4- > cairo.tmp
	mkdir -p inc/cairo

	$(FBFROG) -target nodos cairo.fbfrog \
		-incdir extracted/$(CAIRO)/src \
		-include cairo.h       \
		-include cairo-gl.h    \
		-include cairo-pdf.h   \
		-include cairo-ps.h    \
		-include cairo-svg.h   \
		-emit '*/cairo.h'            inc/cairo/cairo.bi       \
		-emit '*/cairo-version.h'    inc/cairo/cairo.bi       \
		-emit '*/cairo-deprecated.h' inc/cairo/cairo.bi       \
		-emit '*/cairo-gl.h'         inc/cairo/cairo-gl.bi    \
		-emit '*/cairo-pdf.h'        inc/cairo/cairo-pdf.bi   \
		-emit '*/cairo-ps.h'         inc/cairo/cairo-ps.bi    \
		-emit '*/cairo-svg.h'        inc/cairo/cairo-svg.bi   \
		-inclib cairo inc/cairo/cairo.bi \
		-title $(CAIRO) cairo.tmp gtk+-translators.txt

	$(FBFROG) -target windows cairo.fbfrog \
		-incdir extracted/$(CAIRO)/src \
		-include cairo-win32.h \
		-emit '*/cairo-win32.h' inc/cairo/cairo-win32.bi \
		-title $(CAIRO) cairo.tmp gtk+-translators.txt

	rm *.tmp

# Canvas Draw
CD_VERSION := 5.8.2
CD := cd-$(CD_VERSION)
cd: tools
	./get.sh $(CD) $(CD)_Sources.tar.gz http://sourceforge.net/projects/canvasdraw/files/$(CD_VERSION)/Docs%20and%20Sources/$(CD)_Sources.tar.gz/download createdir
	find extracted/$(CD)/cd/ -type d -exec chmod +x '{}' ';'

	$(GETCOMMENT) --2 extracted/$(CD)/cd/include/cd.h | tail -n+2 | head -n-1 > cd.tmp

	mkdir -p inc/cd
	$(FBFROG) cd.fbfrog \
		extracted/$(CD)/cd/include/*.h \
		-emit '*/cdcairo.h'      inc/cd/cdcairo.bi \
		-emit '*/cdcgm.h'        inc/cd/cdcgm.bi \
		-emit '*/cdclipbd.h'     inc/cd/cdclipbd.bi \
		-emit '*/cddbuf.h'       inc/cd/cddbuf.bi \
		-emit '*/cddebug.h'      inc/cd/cddebug.bi \
		-emit '*/cddgn.h'        inc/cd/cddgn.bi \
		-emit '*/cddxf.h'        inc/cd/cddxf.bi \
		-emit '*/cdemf.h'        inc/cd/cdemf.bi \
		-emit '*/cdgdiplus.h'    inc/cd/cdgdiplus.bi \
		-emit '*/cdgl.h'         inc/cd/cdgl.bi \
		-emit '*/cd.h'           inc/cd/cd.bi \
		-emit '*/cdimage.h'      inc/cd/cdimage.bi \
		-emit '*/cdirgb.h'       inc/cd/cdirgb.bi \
		-emit '*/cdiup.h'        inc/cd/cdiup.bi \
		-emit '*/cdmf.h'         inc/cd/cdmf.bi \
		-emit '*/cdmf_private.h' inc/cd/cdmf_private.bi \
		-emit '*/cdnative.h'     inc/cd/cdnative.bi \
		-emit '*/cd_old.h'       inc/cd/cd_old.bi \
		-emit '*/cdpdf.h'        inc/cd/cdpdf.bi \
		-emit '*/cdpicture.h'    inc/cd/cdpicture.bi \
		-emit '*/cdprint.h'      inc/cd/cdprint.bi \
		-emit '*/cd_private.h'   inc/cd/cd_private.bi \
		-emit '*/cdps.h'         inc/cd/cdps.bi \
		-emit '*/cdsvg.h'        inc/cd/cdsvg.bi \
		-emit '*/cdwmf.h'        inc/cd/cdwmf.bi \
		-emit '*/wd.h'           inc/cd/wd.bi \
		-emit '*/wd_old.h'       inc/cd/wd_old.bi \
		-title $(CD) cd.tmp fbteam.txt \
		-inclib cd      inc/cd/cd.bi \
		-inclib cdcairo inc/cd/cdcairo.bi \
		-inclib cdgl    inc/cd/cdgl.bi \
		-inclib iupcd   inc/cd/cdiup.bi \
		-inclib cdpdf   inc/cd/cdpdf.bi

	$(FBFROG) iuplua.fbfrog \
		extracted/$(CD)/cd/include/*.h \
		-emit '*/cdlua3_private.h' inc/cd/cdlua3_private.bi \
		-emit '*/cdlua5_private.h' inc/cd/cdlua5_private.bi \
		-emit '*/cdluagl.h'        inc/cd/cdluagl.bi \
		-emit '*/cdlua.h'          inc/cd/cdlua.bi \
		-emit '*/cdluaim.h'        inc/cd/cdluaim.bi \
		-emit '*/cdluaiup.h'       inc/cd/cdluaiup.bi \
		-emit '*/cdluapdf.h'       inc/cd/cdluapdf.bi \
		-title $(CD) cd.tmp fbteam.txt \
		-inclib cdlua52 inc/cd/cdlua.bi

	rm *.tmp

CGIUTIL := cgi-util-2.2.1
cgiutil: tools
	./get.sh $(CGIUTIL) $(CGIUTIL).tar.gz ftp://ftp.tuxpaint.org/unix/www/cgi-util/cgi-util-2.2.1.tar.gz

	$(GETCOMMENT) extracted/$(CGIUTIL)/cgi-util.h > cgiutil.tmp
	$(FBFROG) extracted/$(CGIUTIL)/cgi-util.h -o inc/cgi-util.bi -title $(CGIUTIL) cgiutil.tmp fbteam.txt -inclib cgi-util
	rm *.tmp

CGUI_VERSION := 2.0.4
CGUI := cgui-$(CGUI_VERSION)
cgui: tools
	./get.sh $(CGUI) $(CGUI).tar.gz "http://cgui.cvs.sourceforge.net/viewvc/cgui/cgui/?view=tar&pathrev=Branch_CGUI_1-6-7"
	echo "A C Graphical User Interface [add on to Allegro] by Christer Sandberg" > cgui.tmp
	$(FBFROG) cgui.fbfrog -o inc extracted/cgui/include/cgui.h \
		-title $(CGUI) cgui.tmp fbteam.txt
	rm *.tmp

CHIPMUNK := Chipmunk-7.0.1
chipmunk: tools
	./get.sh $(CHIPMUNK) $(CHIPMUNK).tgz http://chipmunk-physics.net/release/Chipmunk-7.x/$(CHIPMUNK).tgz

	cat extracted/$(CHIPMUNK)/LICENSE.txt > chipmunk.tmp

	mkdir -p inc/chipmunk
	$(FBFROG) chipmunk.fbfrog \
		-incdir extracted/$(CHIPMUNK)/include/chipmunk \
		-incdir extracted/$(CHIPMUNK)/include \
		-include chipmunk.h \
		-include chipmunk_unsafe.h \
		-include cpHastySpace.h \
		-include cpMarch.h \
		-include cpPolyline.h \
		-include cpRobust.h \
		-emit '*/chipmunk_unsafe.h'  inc/chipmunk/chipmunk_unsafe.bi \
		-emit '*/cpHastySpace.h'     inc/chipmunk/cpHastySpace.bi \
		-emit '*/cpMarch.h'          inc/chipmunk/cpMarch.bi \
		-emit '*/cpPolyline.h'       inc/chipmunk/cpPolyline.bi \
		-emit '*/cpRobust.h'         inc/chipmunk/cpRobust.bi \
		-emit '*'                    inc/chipmunk/chipmunk.bi \
		-title $(CHIPMUNK) chipmunk.tmp fbteam.txt \
		-inclib "chipmunk" inc/chipmunk/chipmunk.bi

	rm *.tmp

CLANG_VERSION := 3.6.2
CLANG_TITLE := cfe-$(CLANG_VERSION).src
clang: tools
	./get.sh $(CLANG_TITLE) $(CLANG_TITLE).tar.xz "http://llvm.org/releases/$(CLANG_VERSION)/$(CLANG_TITLE).tar.xz"
	sed -n 4,43p extracted/$(CLANG_TITLE)/LICENSE.TXT > clang.tmp
	$(FBFROG) -o inc/clang-c.bi \
		extracted/$(CLANG_TITLE)/include/clang-c/Index.h \
		extracted/$(CLANG_TITLE)/include/clang-c/CXCompilationDatabase.h \
		-incdir extracted/$(CLANG_TITLE)/include \
		-removedefine CINDEX_LINKAGE \
		-title $(CLANG_TITLE) clang.tmp fbteam.txt
	rm *.tmp

GLIBC := glibc-2.22
crt: tools
	./get.sh $(GLIBC) $(GLIBC).tar.xz http://ftp.gnu.org/gnu/glibc/$(GLIBC).tar.xz

	cd extracted/$(GLIBC) && \
		if [ -f bits/wordsize.h ]; then \
			rm -f bits/wordsize.h bits/endian.h bits/setjmp.h bits/pthreadtypes.h; \
			echo "#pragma once" >> sysdeps/wordsize-32/bits/wordsize.h; \
			echo "#pragma once" >> sysdeps/wordsize-64/bits/wordsize.h; \
			echo "#pragma once" >> sysdeps/x86/bits/wordsize.h; \
		fi

	$(GETCOMMENT) extracted/$(GLIBC)/sysdeps/wordsize-32/bits/wordsize.h > glibc-wordsize.tmp
	$(GETCOMMENT) extracted/$(GLIBC)/sysdeps/nptl/pthread.h              > glibc-pthread.tmp
	$(GETCOMMENT) extracted/$(GLIBC)/posix/sched.h                       > glibc-sched.tmp

	mkdir -p inc/crt/bits
	$(FBFROG) -target linux -replacements crt.replacements glibc.fbfrog \
		-selecttarget \
		-case x86 \
			-incdir extracted/$(GLIBC)/sysdeps/x86 \
			-incdir extracted/$(GLIBC)/sysdeps/wordsize-32 \
		-case x86_64 \
			-incdir extracted/$(GLIBC)/sysdeps/x86_64 \
			-incdir extracted/$(GLIBC)/sysdeps/wordsize-64 \
			-incdir extracted/$(GLIBC)/sysdeps/x86 \
		-case arm \
			-incdir extracted/$(GLIBC)/sysdeps/arm \
			-incdir extracted/$(GLIBC)/sysdeps/arm/nptl \
			-incdir extracted/$(GLIBC)/sysdeps/wordsize-32 \
		-case aarch64 \
			-incdir extracted/$(GLIBC)/sysdeps/aarch64 \
			-incdir extracted/$(GLIBC)/sysdeps/aarch64/nptl \
			-incdir extracted/$(GLIBC)/sysdeps/wordsize-64 \
		-endselect \
		-incdir extracted/$(GLIBC)/sysdeps/nptl \
		-incdir extracted/$(GLIBC)/sysdeps/generic \
		-incdir extracted/$(GLIBC)/include \
		-incdir extracted/$(GLIBC) \
		-include libc-symbols.h \
		extracted/$(GLIBC)/sysdeps/nptl/pthread.h \
		-emit '*/bits/pthreadtypes.h' inc/crt/bits/pthreadtypes.bi \
		-emit '*/bits/wordsize.h'     inc/crt/bits/wordsize.bi \
		-emit '*/bits/sched.h'        inc/crt/bits/sched.bi \
		-emit '*/pthread.h'           inc/crt/pthread.bi \
		-emit '*/sched.h'             inc/crt/sched.bi \
		-title $(GLIBC) glibc-pthread.tmp    fbteam.txt inc/crt/bits/pthreadtypes.bi \
		-title $(GLIBC) glibc-wordsize.tmp   fbteam.txt inc/crt/bits/wordsize.bi \
		-title $(GLIBC) glibc-sched.tmp      fbteam.txt inc/crt/bits/sched.bi \
		-title $(GLIBC) glibc-pthread.tmp    fbteam.txt inc/crt/pthread.bi \
		-title $(GLIBC) glibc-sched.tmp      fbteam.txt inc/crt/sched.bi

	rm *.tmp

CRYPTLIB := cl343_beta
cryptlib: tools
	./get.sh $(CRYPTLIB) $(CRYPTLIB).zip http://www.cypherpunks.to/~peter/$(CRYPTLIB).zip createdir
	tail -n+7 extracted/$(CRYPTLIB)/COPYING > cryptlib.tmp
	$(FBFROG) cryptlib.fbfrog extracted/$(CRYPTLIB)/cryptlib.h \
		-o inc/cryptlib.bi -inclib cl -title $(CRYPTLIB) cryptlib.tmp fbteam.txt
	rm *.tmp

CUNIT_VERSION := 2.1-3
CUNIT_TITLE := CUnit-$(CUNIT_VERSION)
cunit: tools
	./get.sh $(CUNIT_TITLE) $(CUNIT_TITLE).tar.bz2 "http://sourceforge.net/projects/cunit/files/CUnit/$(CUNIT_VERSION)/$(CUNIT_TITLE).tar.bz2/download"
	cd extracted/$(CUNIT_TITLE)/CUnit/Headers && \
		sed -e 's/@VERSION@-@RELEASE@/$(CUNIT_VERSION)/g' < CUnit.h.in > CUnit.h
	$(GETCOMMENT) extracted/$(CUNIT_TITLE)/CUnit/Headers/CUnit.h > cunit.tmp
	./fsf-address-fix.sh cunit.tmp
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
		-emit '*/Util.h'      inc/CUnit/Util.bi			\
		-title $(CUNIT_TITLE) cunit.tmp fbteam.txt
	rm *.tmp

CURL_TITLE := curl-7.44.0
curl: tools
	./get.sh $(CURL_TITLE) $(CURL_TITLE).tar.lzma "http://curl.haxx.se/download/$(CURL_TITLE).tar.lzma"
	tail -n +3 extracted/$(CURL_TITLE)/COPYING > curl.tmp
	$(FBFROG) curl.fbfrog \
		extracted/$(CURL_TITLE)/include/curl/curl.h \
		-dontemit '*/typecheck-gcc.h' \
		-emit '*' inc/curl.bi \
		-title $(CURL_TITLE) curl.tmp fbteam.txt
	rm *.tmp

DEVIL_VERSION := 1.7.8
DEVIL := devil-$(DEVIL_VERSION)
DEVIL_PRETTY := DevIL-$(DEVIL_VERSION)
devil: tools
	./get.sh $(DEVIL) $(DEVIL).tar.gz http://downloads.sourceforge.net/openil/$(DEVIL_PRETTY).tar.gz

	sed -n 476,488p extracted/$(DEVIL)/COPYING | cut -c5- > devil.tmp
	$(GETCOMMENT) -3-9 extracted/$(DEVIL)/include/IL/il.h   > devil-il.tmp
	$(GETCOMMENT) -3-9 extracted/$(DEVIL)/include/IL/ilu.h  > devil-ilu.tmp
	$(GETCOMMENT) -3-9 extracted/$(DEVIL)/include/IL/ilut.h > devil-ilut.tmp
	echo >> devil-il.tmp
	echo >> devil-ilu.tmp
	echo >> devil-ilut.tmp
	cat devil.tmp >> devil-il.tmp
	cat devil.tmp >> devil-ilu.tmp
	cat devil.tmp >> devil-ilut.tmp
	./fsf-address-fix.sh *.tmp

	mkdir -p inc/IL
	$(FBFROG) devil.fbfrog -incdir extracted/$(DEVIL)/include \
		-include IL/il.h \
		-include IL/ilu.h \
		-include IL/ilut.h \
		-emit '*/il.h'          inc/IL/il.bi \
		-emit '*/ilu.h'         inc/IL/ilu.bi \
		-emit '*/ilut.h'        inc/IL/ilut.bi \
		-emit '*/ilut_config.h' inc/IL/ilut.bi \
		-title $(DEVIL_PRETTY) devil-il.tmp   fbteam.txt inc/IL/il.bi \
		-title $(DEVIL_PRETTY) devil-ilu.tmp  fbteam.txt inc/IL/ilu.bi \
		-title $(DEVIL_PRETTY) devil-ilut.tmp fbteam.txt inc/IL/ilut.bi
	rm *.tmp

disphelper: tools
	./get.sh disphelper_081 disphelper_081.zip http://sourceforge.net/projects/disphelper/files/DispHelper/0.81/disphelper_081.zip/download createdir

	$(GETCOMMENT) extracted/disphelper_081/source/disphelper.h > disphelper.tmp
	$(GETCOMMENT) extracted/disphelper_081/source/convert.h > convert.tmp

	mkdir -p inc/disphelper
	$(FBFROG) disphelper.fbfrog -incdir extracted/disphelper_081/source \
		-include disphelper.h -include convert.h \
		-emit '*/disphelper.h' inc/disphelper/disphelper.bi \
		-emit '*/convert.h'    inc/disphelper/convert.bi \
		-title disphelper_081 disphelper.tmp fbteam.txt inc/disphelper/disphelper.bi \
		-title disphelper_081 convert.tmp    fbteam.txt inc/disphelper/convert.bi

	rm *.tmp

EXPAT_VERSION := 2.1.0
EXPAT := expat-$(EXPAT_VERSION)
expat: tools
	./get.sh $(EXPAT) $(EXPAT).tar.gz http://sourceforge.net/projects/expat/files/expat/$(EXPAT_VERSION)/$(EXPAT).tar.gz/download
	cp extracted/$(EXPAT)/COPYING expat.tmp
	$(FBFROG) expat.fbfrog extracted/$(EXPAT)/lib/expat.h -o inc/expat.bi \
		-title $(EXPAT) expat.tmp fbteam.txt
	rm *.tmp

FASTCGI_TITLE := fcgi-2.4.1-SNAP-0311112127
fastcgi: tools
	./get.sh $(FASTCGI_TITLE) $(FASTCGI_TITLE).tar.gz "http://www.fastcgi.com/dist/fcgi.tar.gz"
	sed -n 7,7p extracted/$(FASTCGI_TITLE)/include/fastcgi.h | cut -c4- > fastcgi.tmp
	echo                                         >> fastcgi.tmp
	cat extracted/$(FASTCGI_TITLE)/LICENSE.TERMS >> fastcgi.tmp
	mkdir -p inc/fastcgi
	$(FBFROG) fastcgi.fbfrog \
		extracted/$(FASTCGI_TITLE)/include/fastcgi.h \
		extracted/$(FASTCGI_TITLE)/include/fcgiapp.h \
		extracted/$(FASTCGI_TITLE)/include/fcgi_stdio.h \
		-emit '*/fastcgi.h'    inc/fastcgi/fastcgi.bi \
		-emit '*/fcgiapp.h'    inc/fastcgi/fcgiapp.bi \
		-emit '*/fcgi_stdio.h' inc/fastcgi/fcgi_stdio.bi \
		-addinclude crt.bi inc/fastcgi/fcgi_stdio.bi \
		-inclib fcgi inc/fastcgi/fcgiapp.bi \
		-title $(FASTCGI_TITLE) fastcgi.tmp fbteam.txt
	rm *.tmp

FFI_VERSION := 3.2.1
FFI_TITLE := libffi-$(FFI_VERSION)
ffi: tools
	./get.sh $(FFI_TITLE) $(FFI_TITLE).tar.gz "ftp://sourceware.org/pub/libffi/$(FFI_TITLE).tar.gz"

	# libffi's configure script generates ffi.h based on ffi.h.in (inserting @TARGET@)
	# and symlinks ffitarget.h to ../src/<arch>/ffitarget.h.
	# Both are target-specific, but since the process is rather easy,
	# we can avoid running configure for all our targets and generate the
	# headers manually instead.
	./ffi-generate-headers.sh "extracted/$(FFI_TITLE)" "$(FFI_VERSION)"

	$(GETCOMMENT) extracted/$(FFI_TITLE)/include/ffi-linux-x86.h > ffi.tmp

	$(FBFROG) ffi.fbfrog -o inc/ffi.bi -target nodos \
		`./ffi-get-target-options.sh "extracted/$(FFI_TITLE)"` \
		-title $(FFI_TITLE) ffi.tmp fbteam.txt

	rm *.tmp

FLITE := flite-2.0.0-release
flite: tools
	./get.sh $(FLITE) $(FLITE).tar.bz2 http://www.festvox.org/flite/packed/flite-2.0/$(FLITE).tar.bz2

	sed -n 13,40p  extracted/$(FLITE)/COPYING > flite.tmp

	mkdir -p inc/flite
	$(FBFROG) flite.fbfrog extracted/$(FLITE)/include/*.h \
		`./flite-fbfrog-options.sh $(FLITE)` \
		-title $(FLITE) flite.tmp fbteam.txt

	rm *.tmp

FONTCONFIG := fontconfig-2.11.1
fontconfig: tools
	./get.sh $(FONTCONFIG) $(FONTCONFIG).tar.bz2 "http://www.freedesktop.org/software/fontconfig/release/$(FONTCONFIG).tar.bz2"

	$(GETCOMMENT) extracted/$(FONTCONFIG)/fontconfig/fontconfig.h > fontconfig.tmp
	$(GETCOMMENT) extracted/$(FONTCONFIG)/fontconfig/fcfreetype.h > fcfreetype.tmp

	mkdir -p inc/fontconfig
	$(FBFROG) fontconfig.fbfrog \
		-incdir extracted/$(FONTCONFIG)/fontconfig \
		-include fontconfig.h \
		-include fcfreetype.h \
		-emit '*/fontconfig.h' inc/fontconfig/fontconfig.bi \
		-emit '*/fcfreetype.h' inc/fontconfig/fcfreetype.bi \
		-title $(FONTCONFIG) fontconfig.tmp fbteam.txt inc/fontconfig/fontconfig.bi \
		-title $(FONTCONFIG) fcfreetype.tmp fbteam.txt inc/fontconfig/fcfreetype.bi

	rm *.tmp

FREEGLUT_VERSION := 3.0.0
FREEGLUT := freeglut-$(FREEGLUT_VERSION)
freeglut: tools
	./get.sh $(FREEGLUT) $(FREEGLUT).tar.gz http://sourceforge.net/projects/freeglut/files/freeglut/$(FREEGLUT_VERSION)/$(FREEGLUT).tar.gz/download

	$(GETCOMMENT) extracted/$(FREEGLUT)/include/GL/freeglut.h     > freeglut.tmp
	$(GETCOMMENT) extracted/$(FREEGLUT)/include/GL/freeglut_ext.h > freeglut_ext.tmp
	$(GETCOMMENT) extracted/$(FREEGLUT)/include/GL/freeglut_std.h > freeglut_std.tmp

	mkdir -p inc/GL
	$(FBFROG) freeglut.fbfrog \
		-incdir extracted/$(FREEGLUT)/include \
		-include GL/freeglut.h \
		-emit '*/GL/freeglut.h'     inc/GL/freeglut.bi \
		-emit '*/GL/freeglut_ext.h' inc/GL/freeglut_ext.bi \
		-emit '*/GL/freeglut_std.h' inc/GL/freeglut_std.bi \
		-title $(FREEGLUT) freeglut.tmp     fbteam.txt inc/GL/freeglut.bi \
		-title $(FREEGLUT) freeglut_ext.tmp fbteam.txt inc/GL/freeglut_ext.bi \
		-title $(FREEGLUT) freeglut_std.tmp fbteam.txt inc/GL/freeglut_std.bi

	rm *.tmp


FREEIMAGE := FreeImage3170
freeimage: tools
	./get.sh FreeImage3170 FreeImage3170.zip http://downloads.sourceforge.net/freeimage/FreeImage3170.zip createdir

	# need to fix up an é from some codepage encoding to Unicode/UTF8
	$(GETCOMMENT) -2-23 extracted/$(FREEIMAGE)/FreeImage/Source/FreeImage.h | \
		sed -e 's/\xE9/\xC3\xA9/g' > freeimage.tmp

	$(FBFROG) freeimage.fbfrog \
		extracted/$(FREEIMAGE)/FreeImage/Source/FreeImage.h \
		-o inc/FreeImage.bi \
		-title $(FREEIMAGE) freeimage.tmp fbteam.txt

	rm *.tmp

FREETYPE := freetype-2.6
freetype: tools
	./get.sh $(FREETYPE) $(FREETYPE).tar.bz2 http://download.savannah.gnu.org/releases/freetype/$(FREETYPE).tar.bz2

	cd extracted/$(FREETYPE)/include/config && \
		if [ ! -f ftoption.h.orig ]; then \
			mv ftoption.h ftoption.h.orig; \
			(sed -e 's/#undef FT_CONFIG_OPTION_FORCE_INT64/#define FT_CONFIG_OPTION_FORCE_INT64 1/g' \
				< ftoption.h.orig > ftoption.h); \
		fi

	# Freetype offers two licenses (its own FTL and GPL2); choosing GPL2 here
	sed -n 5,8p     extracted/$(FREETYPE)/include/freetype.h > freetype.tmp
	echo >> freetype.tmp
	sed -n 296,308p extracted/$(FREETYPE)/docs/GPLv2.TXT | cut -c5- >> freetype.tmp

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
		-inclib freetype             inc/freetype2/freetype.bi \
		-title $(FREETYPE) freetype.tmp fbteam.txt

	rm *.tmp

GLFW2_VERSION := 2.7.9
GLFW3_VERSION := 3.1.1
GLFW2 := glfw-$(GLFW2_VERSION)
GLFW3 := glfw-$(GLFW3_VERSION)
glfw: tools
	./get.sh $(GLFW2) $(GLFW2).tar.bz2 http://sourceforge.net/projects/glfw/files/glfw/$(GLFW2_VERSION)/$(GLFW2).tar.bz2/download
	./get.sh $(GLFW3) $(GLFW3).tar.bz2 http://sourceforge.net/projects/glfw/files/glfw/$(GLFW3_VERSION)/$(GLFW3).tar.bz2/download

	$(GETCOMMENT) extracted/$(GLFW2)/include/GL/glfw.h    > glfw2.tmp
	$(GETCOMMENT) extracted/$(GLFW3)/include/GLFW/glfw3.h > glfw3.tmp

	mkdir -p inc/GL inc/GLFW

	$(FBFROG) glfw.fbfrog extracted/$(GLFW2)/include/GL/glfw.h -o inc/GL/glfw.bi \
		-iftarget windows \
			-ifdef GLFW_DLL \
				-inclib glfwdll \
			-else \
				-inclib glfw \
				-inclib user32 \
				-inclib gdi32 \
			-endif \
		-else \
			-inclib glfw \
		-endif \
		-title $(GLFW2) glfw2.tmp fbteam.txt

	$(FBFROG) glfw.fbfrog extracted/$(GLFW3)/include/GLFW/glfw3.h -o inc/GLFW/glfw3.bi \
		-iftarget windows \
			-ifdef GLFW_DLL \
				-inclib glfw3dll \
			-else \
				-inclib glfw3 \
				-inclib user32 \
				-inclib gdi32 \
			-endif \
		-else \
			-inclib glfw \
		-endif\
		-title $(GLFW3) glfw3.tmp fbteam.txt

	rm *.tmp

GDKPIXBUF_SERIES := 2.30
GDKPIXBUF := gdk-pixbuf-$(GDKPIXBUF_SERIES).8
gdkpixbuf-extract:
	./get.sh $(GDKPIXBUF) $(GDKPIXBUF).tar.xz http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/$(GDKPIXBUF_SERIES)/$(GDKPIXBUF).tar.xz

gdkpixbuf: tools glib-extract gdkpixbuf-extract

	$(GETCOMMENT) extracted/$(GDKPIXBUF)/gdk-pixbuf/gdk-pixbuf.h > gdkpixbuf.tmp

	mkdir -p inc/gdk-pixbuf
	$(FBFROG) gdkpixbuf.fbfrog \
		-incdir extracted/$(GDKPIXBUF) \
		-incdir extracted/$(GLIB) \
		-incdir extracted/$(GLIB)/glib \
		-incdir extracted/$(GLIB)/gmodule \
		-include gdk-pixbuf/gdk-pixbuf.h \
		-emit '*/extracted/$(GDKPIXBUF)/gdk-pixbuf/*' inc/gdk-pixbuf/gdk-pixbuf.bi \
		-inclib gdk_pixbuf-2.0                        inc/gdk-pixbuf/gdk-pixbuf.bi \
		-title $(GDKPIXBUF) gdkpixbuf.tmp gtk+-translators.txt

	rm *.tmp

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

glib: tools glib-extract

	$(GETCOMMENT) extracted/$(GLIB)/glib/glib.h        > glib.tmp
	$(GETCOMMENT) extracted/$(GLIB)/glib/glib-object.h > glib-object.tmp
	$(GETCOMMENT) extracted/$(GLIB)/gmodule/gmodule.h  > glib-gmodule.tmp
	$(GETCOMMENT) extracted/$(GLIB)/gio/gio.h          > glib-gio.tmp

	mkdir -p inc/gio
	$(FBFROG) glib.fbfrog \
		-incdir extracted/$(GLIB) \
		-incdir extracted/$(GLIB)/glib \
		-incdir extracted/$(GLIB)/gmodule \
		-include glib/glib.h \
		-include glib/glib-object.h \
		-include gmodule.h \
		-include gio/gio.h \
		-emit '*/extracted/$(GLIB)/glib/glib-object.h' inc/glib-object.bi \
		-emit '*/extracted/$(GLIB)/gobject/*.h'        inc/glib-object.bi \
		-emit '*/extracted/$(GLIB)/glib/glibconfig.h'  inc/glibconfig.bi \
		-emit '*/extracted/$(GLIB)/gmodule/gmodule.h'  inc/gmodule.bi \
		-emit '*/extracted/$(GLIB)/gio/*'              inc/gio/gio.bi \
		-emit '*/extracted/$(GLIB)/glib/*.h'           inc/glib.bi \
		-inclib gio-2.0                                inc/gio/gio.bi \
		-inclib gobject-2.0                            inc/glib-object.bi \
		-inclib gmodule-2.0                            inc/gmodule.bi \
		-inclib glib-2.0                               inc/glib.bi \
		-iftarget windows \
			-inclib gthread-2.0                    inc/glib.bi \
		-endif \
		-title $(GLIB) glib.tmp         gtk+-translators.txt inc/glib.bi \
		-title $(GLIB) glib.tmp         gtk+-translators.txt inc/glibconfig.bi \
		-title $(GLIB) glib-object.tmp  gtk+-translators.txt inc/glib-object.bi \
		-title $(GLIB) glib-gmodule.tmp gtk+-translators.txt inc/gmodule.bi \
		-title $(GLIB) glib-gio.tmp     gtk+-translators.txt inc/gio/gio.bi

	rm *.tmp

GLUT := glut-3.7
glut: tools
	./get.sh $(GLUT) $(GLUT).tar.gz https://www.opengl.org/resources/libraries/glut/$(GLUT).tar.gz

	sed -n 4,8p extracted/$(GLUT)/include/GL/glut.h > glut.tmp

	mkdir -p inc/GL
	$(FBFROG) glut.fbfrog \
		extracted/$(GLUT)/include/GL/glut.h -o inc/GL/glut.bi \
		-selecttarget \
		-case windows \
			-inclib glut32 \
		-case dos \
			-inclib GLUT \
			-inclib alleg \
		-caseelse \
			-inclib glut \
		-endselect \
		-title $(GLUT) glut.tmp fbteam.txt

	rm *.tmp

gtk: gtk2 gtk3

GTK2_SERIES := 2.24
GTK2 := gtk+-$(GTK2_SERIES).27
gtk2-extract: glib-extract cairo-extract pango-extract atk-extract gdkpixbuf-extract
	./get.sh $(GTK2) $(GTK2).tar.xz http://ftp.gnome.org/pub/gnome/sources/gtk+/$(GTK2_SERIES)/$(GTK2).tar.xz

	# Insert our custom gdkconfig.h
	cp gdk2config.h extracted/$(GTK2)/gdkconfig.h

gtk2: tools gtk2-extract

	$(GETCOMMENT) extracted/$(GTK2)/gtk/gtk.h > gtk2.tmp
	$(GETCOMMENT) extracted/$(GTK2)/gdk/gdk.h > gdk2.tmp
	./fsf-address-fix.sh gtk2.tmp
	./fsf-address-fix.sh gdk2.tmp

	mkdir -p inc/gtk inc/gdk
	$(FBFROG) gtk.fbfrog gtk2.fbfrog \
		-incdir extracted/$(GTK2) \
		-incdir extracted/$(PANGO) \
		-incdir extracted/$(CAIRO)/src \
		-incdir extracted/$(GDKPIXBUF) \
		-incdir extracted/$(ATK) \
		-incdir extracted/$(GLIB) \
		-incdir extracted/$(GLIB)/glib \
		-incdir extracted/$(GLIB)/gmodule \
		-include gtk/gtk.h \
		-emit '*/extracted/$(GTK2)/gdk/*' inc/gdk/gdk2.bi \
		-emit '*/extracted/$(GTK2)/gtk/*' inc/gtk/gtk2.bi \
		-iftarget windows \
			-inclib gdk-win32-2.0 inc/gdk/gdk2.bi \
			-inclib gtk-win32-2.0 inc/gtk/gtk2.bi \
		-else \
			-inclib gdk-x11-2.0   inc/gdk/gdk2.bi \
			-inclib gtk-x11-2.0   inc/gtk/gtk2.bi \
		-endif \
		-title $(GTK2) gtk2.tmp gtk+-translators.txt inc/gtk/gtk2.bi \
		-title $(GTK2) gdk2.tmp gtk+-translators.txt inc/gdk/gdk2.bi

	rm *.tmp

GTK3_SERIES := 3.14
GTK3 := gtk+-$(GTK3_SERIES).10
gtk3: tools glib-extract cairo-extract pango-extract atk-extract gdkpixbuf-extract
	./get.sh $(GTK3) $(GTK3).tar.xz http://ftp.gnome.org/pub/gnome/sources/gtk+/$(GTK3_SERIES)/$(GTK3).tar.xz

	# Insert our custom gdkconfig.h
	cp gdk3config.h extracted/$(GTK3)/gdk/gdkconfig.h

	$(GETCOMMENT) extracted/$(GTK3)/gtk/gtk.h > gtk3.tmp
	$(GETCOMMENT) extracted/$(GTK3)/gdk/gdk.h > gdk3.tmp

	mkdir -p inc/gtk inc/gdk
	$(FBFROG) gtk.fbfrog gtk3.fbfrog \
		-incdir extracted/$(GTK3) \
		-incdir extracted/$(PANGO) \
		-incdir extracted/$(CAIRO)/src \
		-incdir extracted/$(GDKPIXBUF) \
		-incdir extracted/$(ATK) \
		-incdir extracted/$(GLIB) \
		-incdir extracted/$(GLIB)/glib \
		-incdir extracted/$(GLIB)/gmodule \
		-include gtk/gtk.h \
		-emit '*/extracted/$(GTK3)/gdk/*' inc/gdk/gdk3.bi \
		-emit '*/extracted/$(GTK3)/gtk/*' inc/gtk/gtk3.bi \
		-inclib gdk-3                     inc/gdk/gdk3.bi \
		-inclib gtk-3                     inc/gtk/gtk3.bi \
		-title $(GTK3) gtk3.tmp gtk+-translators.txt inc/gtk/gtk3.bi \
		-title $(GTK3) gdk3.tmp gtk+-translators.txt inc/gdk/gdk3.bi

	rm *.tmp

GTKGLEXT := gtkglext-1.2.0
gtkglext: tools glib-extract gtk2-extract
	./get.sh $(GTKGLEXT) $(GTKGLEXT).tar.gz http://downloads.sourceforge.net/gtkglext/$(GTKGLEXT).tar.gz

	# Insert our custom gdkglext-config.h
	cp gdkglext-config.h extracted/$(GTKGLEXT)/gdkglext-config.h

	$(GETCOMMENT) extracted/$(GTKGLEXT)/gtk/gtkgl.h > gtkglext.tmp
	$(GETCOMMENT) extracted/$(GTKGLEXT)/gdk/gdkgl.h > gdkglext.tmp
	./fsf-address-fix.sh gtkglext.tmp
	./fsf-address-fix.sh gdkglext.tmp

	mkdir -p inc/gtkgl
	$(FBFROG) gtkglext.fbfrog \
		-incdir extracted/$(GTKGLEXT) \
		-incdir extracted/$(GTK2) \
		-incdir extracted/$(PANGO) \
		-incdir extracted/$(CAIRO)/src \
		-incdir extracted/$(GDKPIXBUF) \
		-incdir extracted/$(ATK) \
		-incdir extracted/$(GLIB) \
		-incdir extracted/$(GLIB)/glib \
		-incdir extracted/$(GLIB)/gmodule \
		-include gdk/gdkgl.h \
		-include gtk/gtkgl.h \
		-emit '*/extracted/$(GTKGLEXT)/gdk/*' inc/gtkgl/gdkglext.bi \
		-emit '*/extracted/$(GTKGLEXT)/gtk/*' inc/gtkgl/gtkglext.bi \
		-iftarget windows \
			-inclib gdkglext-win32-1.0 inc/gtkgl/gdkglext.bi \
			-inclib gtkglext-win32-1.0 inc/gtkgl/gtkglext.bi \
		-else \
			-inclib gdkglext-x11-1.0 inc/gtkgl/gdkglext.bi \
			-inclib gtkglext-x11-1.0 inc/gtkgl/gtkglext.bi \
		-endif \
		-title $(GTKGLEXT) gdkglext.tmp gtk+-translators.txt inc/gtkgl/gdkglext.bi \
		-title $(GTKGLEXT) gtkglext.tmp gtk+-translators.txt inc/gtkgl/gtkglext.bi

	rm *.tmp

# GNU libiconv, not glibc's iconv
ICONV := libiconv-1.14
ICONV_SED_COMMON  := -e 's/@EILSEQ@//g'
ICONV_SED_COMMON  += -e 's/@ICONV_CONST@/const/g'
ICONV_SED_COMMON  += -e 's/@USE_MBSTATE_T@/1/g'
ICONV_SED_COMMON  += -e 's/@BROKEN_WCHAR_H@/0/g'
ICONV_SED_COMMON  += -e 's/@HAVE_WCHAR_T@/1/g'
ICONV_SED_DEFAULT := $(ICONV_SED_COMMON) -e 's/@DLL_VARIABLE@//g'
ICONV_SED_WINDOWS := $(ICONV_SED_COMMON) -e 's/@DLL_VARIABLE@/__declspec(dllimport)/g'
iconv: tools
	./get.sh $(ICONV) $(ICONV).tar.gz "http://ftp.gnu.org/pub/gnu/libiconv/$(ICONV).tar.gz"

	cd extracted/$(ICONV)/include && \
		sed $(ICONV_SED_DEFAULT) < iconv.h.in > iconv-default.h && \
		sed $(ICONV_SED_WINDOWS) < iconv.h.in > iconv-windows.h

	$(GETCOMMENT) extracted/$(ICONV)/include/iconv.h.in > iconv.tmp

	$(FBFROG) \
		-iftarget windows \
			extracted/$(ICONV)/include/iconv-windows.h \
		-else \
			extracted/$(ICONV)/include/iconv-default.h \
		-endif \
		-define EILSEQ "" \
		-rename_ _LIBICONV_VERSION \
		-o inc/libiconv.bi \
		-title $(ICONV) iconv.tmp fbteam.txt

	rm *.tmp

IUP_VERSION := 3.15
IUP_TITLE := iup-$(IUP_VERSION)
iup: tools
	./get.sh $(IUP_TITLE) $(IUP_TITLE)_Sources.tar.gz "http://sourceforge.net/projects/iup/files/$(IUP_VERSION)/Docs%20and%20Sources/$(IUP_TITLE)_Sources.tar.gz/download" createdir
	find extracted/$(IUP_TITLE)/iup/ -type d -exec chmod +x '{}' ';'

	$(GETCOMMENT) --1 extracted/$(IUP_TITLE)/iup/include/iup.h | tail -n+2 | head -n-1 | cut -c2- > iup.tmp

	mkdir -p inc/IUP
	$(FBFROG) iup.fbfrog \
		extracted/$(IUP_TITLE)/iup/include/*.h \
		-emit '*/iupcb.h'            inc/IUP/iupcb.bi            \
		-emit '*/iupcbox.h'          inc/IUP/iupcbox.bi          \
		-emit '*/iupcbs.h'           inc/IUP/iupcbs.bi           \
		-emit '*/iupcells.h'         inc/IUP/iupcells.bi         \
		-emit '*/iupcolorbar.h'      inc/IUP/iupcolorbar.bi      \
		-emit '*/iup_config.h'       inc/IUP/iup_config.bi       \
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
		-emit '*/iup_plot.h'         inc/IUP/iup_plot.bi         \
		-emit '*/iup_pplot.h'        inc/IUP/iup_pplot.bi        \
		-emit '*/iupsbox.h'          inc/IUP/iupsbox.bi          \
		-emit '*/iupspin.h'          inc/IUP/iupspin.bi          \
		-emit '*/iuptabs.h'          inc/IUP/iuptabs.bi          \
		-emit '*/iuptree.h'          inc/IUP/iuptree.bi          \
		-emit '*/iuptuio.h'          inc/IUP/iuptuio.bi          \
		-emit '*/iupval.h'           inc/IUP/iupval.bi           \
		-emit '*/iupweb.h'           inc/IUP/iupweb.bi           \
		-inclib iup                  inc/IUP/iup.bi              \
		-inclib iupcontrols          inc/IUP/iupcontrols.bi      \
		-inclib iupglcontrols        inc/IUP/iupglcontrols.bi    \
		-inclib iupgl                inc/IUP/iupgl.bi            \
		-inclib iupmatrixex          inc/IUP/iupmatrixex.bi      \
		-inclib iup_mglplot          inc/IUP/iup_mglplot.bi      \
		-inclib iupole               inc/IUP/iupole.bi           \
		-inclib iup_plot             inc/IUP/iup_plot.bi         \
		-inclib iup_pplot            inc/IUP/iup_pplot.bi        \
		-inclib iuptuio              inc/IUP/iuptuio.bi          \
		-iftarget windows                                        \
			-inclib gdi32        inc/IUP/iup.bi              \
			-inclib user32       inc/IUP/iup.bi              \
			-inclib comdlg32     inc/IUP/iup.bi              \
			-inclib comctl32     inc/IUP/iup.bi              \
			-inclib ole32        inc/IUP/iup.bi              \
			-inclib advapi32     inc/IUP/iup.bi              \
			-inclib shell32      inc/IUP/iup.bi              \
			-inclib uuid         inc/IUP/iup.bi              \
		-else                                                    \
			-inclib gtk-x11-2.0  inc/IUP/iup.bi              \
			-inclib gdk-x11-2.0  inc/IUP/iup.bi              \
			-inclib pangox-1.0   inc/IUP/iup.bi              \
			-inclib gdk_pixbuf-2.0 inc/IUP/iup.bi            \
			-inclib pango-1.0    inc/IUP/iup.bi              \
			-inclib gobject-2.0  inc/IUP/iup.bi              \
			-inclib gmodule-2.0  inc/IUP/iup.bi              \
			-inclib glib-2.0     inc/IUP/iup.bi              \
		-endif                                                   \
		-title $(IUP_TITLE) iup.tmp fbteam.txt

	$(FBFROG) iupim.fbfrog extracted/$(IUP_TITLE)/iup/include/iupim.h -o inc/IUP \
		-inclib iupim \
		-title $(IUP_TITLE) iup.tmp fbteam.txt

	$(FBFROG) iuplua.fbfrog iupscintilla.fbfrog \
		extracted/$(IUP_TITLE)/iup/include/*.h \
		-emit '*/iupluacontrols.h'   inc/IUP/iupluacontrols.bi   \
		-emit '*/iupluaglcontrols.h' inc/IUP/iupluaglcontrols.bi \
		-emit '*/iupluagl.h'         inc/IUP/iupluagl.bi         \
		-emit '*/iuplua.h'           inc/IUP/iuplua.bi           \
		-emit '*/iupluaim.h'         inc/IUP/iupluaim.bi         \
		-emit '*/iupluamatrixex.h'   inc/IUP/iupluamatrixex.bi   \
		-emit '*/iuplua_mglplot.h'   inc/IUP/iuplua_mglplot.bi   \
		-emit '*/iupluaole.h'        inc/IUP/iupluaole.bi        \
		-emit '*/iuplua_plot.h'      inc/IUP/iuplua_plot.bi      \
		-emit '*/iuplua_pplot.h'     inc/IUP/iuplua_pplot.bi     \
		-emit '*/iuplua_scintilla.h' inc/IUP/iuplua_scintilla.bi \
		-emit '*/iupluatuio.h'       inc/IUP/iupluatuio.bi       \
		-emit '*/iupluaweb.h'        inc/IUP/iupluaweb.bi        \
		-emit '*/iup_scintilla.h'    inc/IUP/iup_scintilla.bi    \
		-inclib iup_scintilla        inc/IUP/iup_scintilla.bi    \
		-title $(IUP_TITLE) iup.tmp fbteam.txt

	rm *.tmp

JIT_TITLE := libjit-a8293e141b79c28734a3633a81a43f92f29fc2d7
jit: tools
	./get.sh $(JIT_TITLE) $(JIT_TITLE).tar.gz "http://git.savannah.gnu.org/cgit/libjit.git/snapshot/$(JIT_TITLE).tar.gz"

	# libjit symlinks jit-arch.h to jit-arch-{x86|x86-64}.h and generates
	# jit-opcode.h (and jit-opcode-x86.h) during its build process.
	cd extracted/$(JIT_TITLE) && \
		if [ ! -f include/jit/jit-opcode.h ]; then \
			./auto_gen.sh && ./configure && make; \
		fi

	cd extracted/$(JIT_TITLE)/include/jit && \
		rm -f jit-arch.h     && \
		mkdir -p x86/jit     && \
		mkdir -p x86_64/jit  && \
		mkdir -p arm/jit     && \
		cp jit-arch-x86.h         x86/jit/jit-arch.h && \
		cp jit-arch-x86-64.h   x86_64/jit/jit-arch.h && \
		cp jit-arch-generic.h     arm/jit/jit-arch.h

	$(GETCOMMENT) extracted/$(JIT_TITLE)/include/jit/jit.h | tail -n+3 > jit.tmp

	$(FBFROG) jit.fbfrog -o inc extracted/$(JIT_TITLE)/include/jit/jit.h   \
		-incdir extracted/$(JIT_TITLE)/include                         \
		-selecttarget                                                  \
		-case x86    -incdir extracted/$(JIT_TITLE)/include/jit/x86    \
		-case x86_64 -incdir extracted/$(JIT_TITLE)/include/jit/x86_64 \
		-caseelse    -incdir extracted/$(JIT_TITLE)/include/jit/arm    \
		-endselect                                                     \
		-title $(JIT_TITLE) jit.tmp fbteam.txt

	rm *.tmp

LLVM_VERSION := 3.6.2
LLVM_TITLE := llvm-$(LLVM_VERSION).src
llvm: tools
	./get.sh $(LLVM_TITLE) $(LLVM_TITLE).tar.xz "http://llvm.org/releases/$(LLVM_VERSION)/$(LLVM_TITLE).tar.xz"

	cd extracted/$(LLVM_TITLE) && \
		if [ ! -f include/llvm/Config/Targets.def ]; then ./configure --prefix=/usr; fi

	sed -n 4,43p extracted/$(LLVM_TITLE)/LICENSE.TXT > llvm.tmp

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
		extracted/$(LLVM_TITLE)/include/llvm-c/TargetMachine.h		\
		-title $(LLVM_TITLE) llvm.tmp fbteam.txt

	rm *.tmp

LUA_TITLE := lua-5.3.1
lua: tools
	./get.sh $(LUA_TITLE) $(LUA_TITLE).tar.gz "http://www.lua.org/ftp/$(LUA_TITLE).tar.gz"

	$(GETCOMMENT) --1 extracted/$(LUA_TITLE)/src/lua.h | tail -n+2 | head -n-1 | cut -c2- > lua.tmp

	mkdir -p inc/Lua
	$(FBFROG) lua.fbfrog \
		extracted/$(LUA_TITLE)/src/lua.h       \
		extracted/$(LUA_TITLE)/src/lualib.h    \
		extracted/$(LUA_TITLE)/src/lauxlib.h   \
		-emit '*/lua.h'     inc/Lua/lua.bi     \
		-emit '*/luaconf.h' inc/Lua/lua.bi     \
		-emit '*/lualib.h'  inc/Lua/lualib.bi  \
		-emit '*/lauxlib.h' inc/Lua/lauxlib.bi \
		-inclib lua inc/Lua/lua.bi \
		-title $(LUA_TITLE) lua.tmp fbteam.txt

	rm *.tmp

NCURSES_TITLE := ncurses-5.9
ncurses: tools
	./get.sh $(NCURSES_TITLE) $(NCURSES_TITLE).tar.gz "http://ftp.gnu.org/pub/gnu/ncurses/$(NCURSES_TITLE).tar.gz"
	cd extracted/$(NCURSES_TITLE) && \
		if [ ! -f include/curses.h ]; then ./configure && cd include && make; fi
	sed -n 1,27p extracted/$(NCURSES_TITLE)/include/curses.h.in > ncurses.tmp
	mkdir -p inc/curses
	$(FBFROG) ncurses.fbfrog -o inc/curses/ncurses.bi \
		-incdir extracted/$(NCURSES_TITLE)/include \
		-include curses.h \
		-title $(NCURSES_TITLE) ncurses.tmp fbteam.txt
	rm *.tmp

# There are 2 "versions" of OpenAL:
#  * Creative OpenAL SDK 1.1 (no longer developed, openal.org down?)
#     * I'm not sure whether the license allows making bindings...
#     * has EFX-Utils header/lib
#  * OpenAL Soft, free fork, mostly used on Linux
# freealut seems to be unavailable currently too, as openal.org is down.
OPENALSOFT := openal-soft-1.16.0
FREEALUT_TAG := freealut_1_1_0
FREEALUT := freealut-$(FREEALUT_TAG)
openal: tools
	./get.sh $(OPENALSOFT) $(OPENALSOFT).tar.bz2 http://kcat.strangesoft.net/openal-releases/$(OPENALSOFT).tar.bz2
	# Downloading freealut from unofficial mirror
	./get.sh $(FREEALUT) $(FREEALUT_TAG).tar.gz https://github.com/vancegroup/freealut/archive/$(FREEALUT_TAG).tar.gz

	$(GETCOMMENT) extracted/$(OPENALSOFT)/include/AL/alext.h > openalsoft.tmp
	./fsf-address-fix.sh openalsoft.tmp
	cp extracted/$(FREEALUT)/AUTHORS freealut.tmp
	echo >> freealut.tmp
	cat lgpl2+.txt >> freealut.tmp

	mkdir -p inc/AL

	$(FBFROG) openal.fbfrog \
		-incdir extracted/$(OPENALSOFT)/include/AL \
		-incdir extracted/$(FREEALUT)/include/AL \
		-include al.h \
		-include alc.h \
		-include alext.h \
		-include alut.h \
		-include efx.h \
		-include efx-creative.h \
		-include efx-presets.h \
		-emit '*/AL/alc.h'           inc/AL/alc.bi \
		-emit '*/AL/alext.h'         inc/AL/alext.bi \
		-emit '*/AL/al.h'            inc/AL/al.bi \
		-emit '*/AL/alut.h'          inc/AL/alut.bi \
		-emit '*/AL/efx-creative.h'  inc/AL/efx-creative.bi \
		-emit '*/AL/efx.h'           inc/AL/efx.bi \
		-emit '*/AL/efx-presets.h'   inc/AL/efx-presets.bi \
		-title $(OPENALSOFT) openalsoft.tmp fbteam.txt \
		-title $(FREEALUT) freealut.tmp fbteam.txt inc/AL/alut.bi \
		\
		-iftarget windows \
			-inclib OpenAL32 inc/AL/al.bi \
		-else \
			-inclib openal inc/AL/al.bi \
		-endif \
		-inclib alut inc/AL/alut.bi

	rm *.tmp

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

MESA_VERSION := 10.6.4
MESA := mesa-$(MESA_VERSION)
GLU := glu-9.0.0
opengl-mesa: tools
	./get.sh $(MESA) $(MESA).tar.xz ftp://ftp.freedesktop.org/pub/mesa/$(MESA_VERSION)/$(MESA).tar.xz
	./get.sh $(GLU)  $(GLU).tar.bz2 ftp://ftp.freedesktop.org/pub/mesa/glu/$(GLU).tar.bz2

	$(GETCOMMENT) extracted/$(MESA)/include/GL/gl.h    > mesa-gl.tmp
	sed -n 9,28p extracted/$(MESA)/include/GL/glext.h | cut -c4- > mesa-glext.tmp
	$(GETCOMMENT) extracted/$(GLU)/include/GL/glu.h    > mesa-glu.tmp

	mkdir -p inc/GL/mesa
	$(FBFROG) opengl.fbfrog \
		-incdir extracted/$(MESA)/include \
		-incdir extracted/$(GLU)/include \
		-include GL/gl.h \
		-include GL/glext.h \
		-include GL/glu.h \
		-emit '*/GL/gl.h'    inc/GL/mesa/gl.bi \
		-emit '*/GL/glext.h' inc/GL/mesa/glext.bi \
		-emit '*/GL/glu.h'   inc/GL/mesa/glu.bi \
		-title $(MESA) mesa-gl.tmp    fbteam.txt inc/GL/mesa/gl.bi \
		-title $(MESA) mesa-glext.tmp fbteam.txt inc/GL/mesa/glext.bi \
		-title $(GLU)  mesa-glu.tmp   fbteam.txt inc/GL/mesa/glu.bi

	rm *.tmp

opengl-winapi: tools winapi-extract

	sed -n 2,9p  extracted/$(MINGWW64_TITLE)/DISCLAIMER.PD | cut -c4- > mingw-w64-disclaimer-pd.tmp
	sed -n 9,28p extracted/$(MINGWW64_TITLE)/mingw-w64-headers/include/GL/glext.h | cut -c4- > mingw-w64-glext.tmp

	mkdir -p inc/GL/windows
	$(FBFROG) winapi.fbfrog opengl.fbfrog \
		-incdir extracted/$(MINGWW64_TITLE)/mingw-w64-headers/crt \
		-incdir extracted/$(MINGWW64_TITLE)/mingw-w64-headers/include \
		-include GL/gl.h \
		-include GL/glext.h \
		-include GL/glu.h \
		-emit '*/GL/gl.h'    inc/GL/windows/gl.bi \
		-emit '*/GL/glext.h' inc/GL/windows/glext.bi \
		-emit '*/GL/glu.h'   inc/GL/windows/glu.bi \
		-title $(MINGWW64_TITLE) mingw-w64-disclaimer-pd.tmp fbteam.txt \
		-title $(MINGWW64_TITLE) mingw-w64-glext.tmp fbteam.txt inc/GL/windows/glext.bi

	rm *.tmp

PANGO_SERIES := 1.36
PANGO := pango-$(PANGO_SERIES).8
pango-extract:
	./get.sh $(PANGO) $(PANGO).tar.xz http://ftp.gnome.org/pub/gnome/sources/pango/$(PANGO_SERIES)/$(PANGO).tar.xz

pango: tools pango-extract glib-extract cairo-extract

	$(GETCOMMENT) extracted/$(PANGO)/pango/pango.h      | tail -n+4 > pango.tmp
	$(GETCOMMENT) extracted/$(PANGO)/pango/pangocairo.h | tail -n+4 > pangocairo.tmp
	./fsf-address-fix.sh pango.tmp
	./fsf-address-fix.sh pangocairo.tmp

	mkdir -p inc/pango
	$(FBFROG) pango.fbfrog \
		-incdir extracted/$(CAIRO)/src \
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
		-emit '*/pango/pango-language.h'   inc/pango/pango.bi \
		-emit '*/pango/pango-layout.h'     inc/pango/pango.bi \
		-emit '*/pango/pango-matrix.h'     inc/pango/pango.bi \
		-emit '*/pango/pango-renderer.h'   inc/pango/pango.bi \
		-emit '*/pango/pango-script.h'     inc/pango/pango.bi \
		-emit '*/pango/pango-tabs.h'       inc/pango/pango.bi \
		-emit '*/pango/pango-types.h'      inc/pango/pango.bi \
		-emit '*/pango/pango-utils.h'      inc/pango/pango.bi \
		-inclib pango-1.0                  inc/pango/pango.bi \
		-inclib pangocairo-1.0             inc/pango/pangocairo.bi \
		-title $(PANGO) pango.tmp      gtk+-translators.txt inc/pango/pango.bi \
		-title $(PANGO) pangocairo.tmp gtk+-translators.txt inc/pango/pangocairo.bi

	rm *.tmp

PDCURSES_VERSION := 3.4
PDCURSES := PDCurses-$(PDCURSES_VERSION)
pdcurses: tools
	./get.sh $(PDCURSES) $(PDCURSES).tar.gz "http://sourceforge.net/projects/pdcurses/files/pdcurses/$(PDCURSES_VERSION)/$(PDCURSES).tar.gz/download"
	sed -n 15,25p extracted/$(PDCURSES)/README > pdcurses.tmp
	mkdir -p inc/curses
	$(FBFROG) pdcurses.fbfrog -o inc/curses/pdcurses.bi \
		extracted/$(PDCURSES)/curses.h \
		-title $(PDCURSES) pdcurses.tmp fbteam.txt
	rm *.tmp

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
png12: tools
	./get.sh $(PNG12_TITLE) $(PNG12_TITLE).tar.xz "http://downloads.sourceforge.net/libpng/$(PNG12_TITLE).tar.xz?download"
	sed -n 1,14p    extracted/$(PNG12_TITLE)/png.h | cut -c4- >  png12.tmp
	echo                                                      >> png12.tmp
	sed -n 323,412p extracted/$(PNG12_TITLE)/png.h | cut -c4- >> png12.tmp
	$(FBFROG) png.fbfrog png12.fbfrog -o inc/png12.bi extracted/$(PNG12_TITLE)/png.h \
		-title $(PNG12_TITLE) png12.tmp fbteam.txt
	rm *.tmp

PNG14_TITLE := libpng-1.4.16
png14: tools
	./get.sh $(PNG14_TITLE) $(PNG14_TITLE).tar.xz "http://downloads.sourceforge.net/libpng/$(PNG14_TITLE).tar.xz?download"
	sed -n 2,16p    extracted/$(PNG14_TITLE)/png.h | cut -c4- >  png14.tmp
	echo                                                      >> png14.tmp
	sed -n 210,299p extracted/$(PNG14_TITLE)/png.h | cut -c4- >> png14.tmp
	$(FBFROG) png.fbfrog png14.fbfrog -o inc/png14.bi extracted/$(PNG14_TITLE)/png.h \
		-title $(PNG14_TITLE) png14.tmp fbteam.txt
	rm *.tmp

PNG15_TITLE := libpng-1.5.23
png15: tools
	./get.sh $(PNG15_TITLE) $(PNG15_TITLE).tar.xz "http://downloads.sourceforge.net/libpng/$(PNG15_TITLE).tar.xz?download"
	cp extracted/$(PNG15_TITLE)/scripts/pnglibconf.h.prebuilt \
	   extracted/$(PNG15_TITLE)/pnglibconf.h
	sed -n 2,16p    extracted/$(PNG15_TITLE)/png.h | cut -c4- >  png15.tmp
	echo                                                      >> png15.tmp
	sed -n 239,323p extracted/$(PNG15_TITLE)/png.h | cut -c4- >> png15.tmp
	$(FBFROG) png.fbfrog png15.fbfrog -o inc/png15.bi extracted/$(PNG15_TITLE)/png.h \
		-title $(PNG15_TITLE) png15.tmp fbteam.txt
	rm *.tmp

PNG16_TITLE := libpng-1.6.18
png16: tools
	./get.sh $(PNG16_TITLE) $(PNG16_TITLE).tar.xz "http://downloads.sourceforge.net/libpng/$(PNG16_TITLE).tar.xz?download"
	cp extracted/$(PNG16_TITLE)/scripts/pnglibconf.h.prebuilt \
	   extracted/$(PNG16_TITLE)/pnglibconf.h
	sed -n 2,16p    extracted/$(PNG16_TITLE)/png.h | cut -c4- >  png16.tmp
	echo                                                      >> png16.tmp
	sed -n 246,331p extracted/$(PNG16_TITLE)/png.h | cut -c4- >> png16.tmp
	$(FBFROG) png.fbfrog png16.fbfrog -o inc/png16.bi extracted/$(PNG16_TITLE)/png.h \
		-title $(PNG16_TITLE) png16.tmp fbteam.txt
	rm *.tmp

sdl: sdl1 sdl2

SDL1_MAIN := SDL-1.2.15
SDL1_IMAGE := SDL_image-1.2.12
SDL1_MIXER := SDL_mixer-1.2.12
SDL1_NET := SDL_net-1.2.8
SDL1_TTF := SDL_ttf-2.0.11
SDL1_GFX := SDL_gfx-2.0.13
sdl1: tools
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
		if [ -f SDL_config.h ]; then mv SDL_config.h windows; fi
	./fake-configure \
		`cat unix-config.txt` \
		SDL_HAS_64BIT_TYPE \
		SDL_VIDEO_DRIVER_X11 \
		SDL_BYTEORDER=SDL_LIL_ENDIAN \
		< extracted/$(SDL1_MAIN)/include/SDL_config.h.in \
		> extracted/$(SDL1_MAIN)/include/unix/SDL_config.h

	$(GETCOMMENT) extracted/$(SDL1_MAIN)/include/SDL.h                 > sdl1.tmp
	sed -n 5,5p   extracted/$(SDL1_GFX)/SDL_gfxPrimitives.h | cut -c1- > sdl1-gfx.tmp
	$(GETCOMMENT) extracted/$(SDL1_IMAGE)/SDL_image.h                  > sdl1-image.tmp
	$(GETCOMMENT) extracted/$(SDL1_MIXER)/SDL_mixer.h                  > sdl1-mixer.tmp
	$(GETCOMMENT) extracted/$(SDL1_NET)/SDL_net.h                      > sdl1-net.tmp
	$(GETCOMMENT) extracted/$(SDL1_TTF)/SDL_ttf.h                      > sdl1-ttf.tmp

	mkdir -p inc/SDL
	$(FBFROG) sdl.fbfrog sdl1.fbfrog \
		\
		-incdir extracted/$(SDL1_MAIN)/include \
			-iftarget windows \
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
		-iftarget windows \
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
		-iftarget windows \
			-inclib ws2_32   inc/SDL/SDL_net.bi \
			-inclib iphlpapi inc/SDL/SDL_net.bi \
		-endif \
		-inclib SDL_ttf inc/SDL/SDL_ttf.bi \
		\
		-title $(SDL1_MAIN)  sdl1.tmp       fbteam.txt inc/SDL/SDL.bi \
		-title $(SDL1_GFX)   sdl1-gfx.tmp   fbteam.txt inc/SDL/SDL_gfx_framerate.bi \
		-title $(SDL1_GFX)   sdl1-gfx.tmp   fbteam.txt inc/SDL/SDL_gfx_imageFilter.bi \
		-title $(SDL1_GFX)   sdl1-gfx.tmp   fbteam.txt inc/SDL/SDL_gfx_primitives.bi \
		-title $(SDL1_GFX)   sdl1-gfx.tmp   fbteam.txt inc/SDL/SDL_gfx_primitives_font.bi \
		-title $(SDL1_GFX)   sdl1-gfx.tmp   fbteam.txt inc/SDL/SDL_gfx_rotozoom.bi \
		-title $(SDL1_IMAGE) sdl1-image.tmp fbteam.txt inc/SDL/SDL_image.bi \
		-title $(SDL1_MIXER) sdl1-mixer.tmp fbteam.txt inc/SDL/SDL_mixer.bi \
		-title $(SDL1_NET)   sdl1-net.tmp   fbteam.txt inc/SDL/SDL_net.bi \
		-title $(SDL1_TTF)   sdl1-ttf.tmp   fbteam.txt inc/SDL/SDL_ttf.bi

	rm *.tmp

SDL2_MAIN := SDL2-2.0.3
SDL2_IMAGE := SDL2_image-2.0.0
SDL2_MIXER := SDL2_mixer-2.0.0
SDL2_NET := SDL2_net-2.0.0
SDL2_TTF := SDL2_ttf-2.0.12
SDL2_GFX := SDL2_gfx-1.0.1
sdl2: tools winapi-extract
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
		if [ -f SDL_config.h ]; then mv SDL_config.h windows; fi
	./fake-configure \
		`cat unix-config.txt` \
		SDL_HAS_64BIT_TYPE \
		SDL_VIDEO_DRIVER_X11 \
		SDL_BYTEORDER=SDL_LIL_ENDIAN \
		< extracted/$(SDL2_MAIN)/include/SDL_config.h.in \
		> extracted/$(SDL2_MAIN)/include/unix/SDL_config.h
	echo "#define SDL_BYTEORDER SDL_LIL_ENDIAN" >> extracted/$(SDL2_MAIN)/include/unix/SDL_config.h

	$(GETCOMMENT) extracted/$(SDL2_MAIN)/include/SDL.h      > sdl2.tmp
	sed -n 5,26p extracted/$(SDL2_GFX)/SDL2_gfxPrimitives.h > sdl2-gfx.tmp
	$(GETCOMMENT) extracted/$(SDL2_IMAGE)/SDL_image.h       > sdl2-image.tmp
	$(GETCOMMENT) extracted/$(SDL2_MIXER)/SDL_mixer.h       > sdl2-mixer.tmp
	$(GETCOMMENT) extracted/$(SDL2_NET)/SDL_net.h           > sdl2-net.tmp
	$(GETCOMMENT) extracted/$(SDL2_TTF)/SDL_ttf.h           > sdl2-ttf.tmp

	mkdir -p inc/SDL2
	$(FBFROG) sdl.fbfrog sdl2.fbfrog \
		\
		-incdir extracted/$(SDL2_MAIN)/include \
			-iftarget windows \
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
		-inclib SDL2_ttf   inc/SDL2/SDL_ttf.bi \
		\
		-title $(SDL2_MAIN)  sdl2.tmp       fbteam.txt inc/SDL2/SDL.bi \
		-title $(SDL2_GFX)   sdl2-gfx.tmp   fbteam.txt inc/SDL2/SDL2_gfx_framerate.bi \
		-title $(SDL2_GFX)   sdl2-gfx.tmp   fbteam.txt inc/SDL2/SDL2_gfx_imageFilter.bi \
		-title $(SDL2_GFX)   sdl2-gfx.tmp   fbteam.txt inc/SDL2/SDL2_gfx_primitives.bi \
		-title $(SDL2_GFX)   sdl2-gfx.tmp   fbteam.txt inc/SDL2/SDL2_gfx_primitives_font.bi \
		-title $(SDL2_GFX)   sdl2-gfx.tmp   fbteam.txt inc/SDL2/SDL2_gfx_rotozoom.bi \
		-title $(SDL2_IMAGE) sdl2-image.tmp fbteam.txt inc/SDL2/SDL_image.bi \
		-title $(SDL2_MIXER) sdl2-mixer.tmp fbteam.txt inc/SDL2/SDL_mixer.bi \
		-title $(SDL2_NET)   sdl2-net.tmp   fbteam.txt inc/SDL2/SDL_net.bi \
		-title $(SDL2_TTF)   sdl2-ttf.tmp   fbteam.txt inc/SDL2/SDL_ttf.bi

	rm *.tmp

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
tre: tools
	./get.sh $(TRE) $(TRE).tar.bz2 "http://laurikari.net/tre/$(TRE).tar.bz2"

	cat extracted/$(TRE)/LICENSE > tre.tmp

	mkdir -p inc/tre
	$(FBFROG) tre.fbfrog \
		-incdir extracted/$(TRE)/lib \
		-include regex.h -include tre.h \
		-emit '*/tre.h'   inc/tre/tre.bi \
		-emit '*/regex.h' inc/tre/regex.bi \
		-inclib tre       inc/tre/tre.bi \
		-title $(TRE) tre.tmp fbteam.txt

	rm *.tmp

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

MINGWW64_TITLE := mingw-w64-v4.0.4
WINAPI_FLAGS := winapi.fbfrog
WINAPI_FLAGS += -incdir extracted/$(MINGWW64_TITLE)/mingw-w64-headers/crt
WINAPI_FLAGS += -incdir extracted/$(MINGWW64_TITLE)/mingw-w64-headers/include
WINAPI_FLAGS += -incdir extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include
winapi-extract:
	./get.sh $(MINGWW64_TITLE) $(MINGWW64_TITLE).tar.bz2 "http://sourceforge.net/projects/mingw-w64/files/mingw-w64/mingw-w64-release/$(MINGWW64_TITLE).tar.bz2/download"

	cd extracted/$(MINGWW64_TITLE) && ../../winapi-patch.sh

	./winapi-emits-gen.sh
	./winapi-titles-gen.sh extracted/$(MINGWW64_TITLE) $(MINGWW64_TITLE)

	mkdir -p inc/win

winapi: winapi-main winapi-rest

winapi-main: tools winapi-extract

	# Main pass - winsock2.h, windows.h, Direct3D/DirectX 9
	# winsock2.h has to be #included before windows.h in order to override
	# winsock.h.
	sed -n 2,42p extracted/$(MINGWW64_TITLE)/DISCLAIMER    | cut -c2- > mingw-w64-disclaimer.tmp
	sed -n 2,9p  extracted/$(MINGWW64_TITLE)/DISCLAIMER.PD | cut -c4- > mingw-w64-disclaimer-pd.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/amaudio.h     > amaudio.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/amvideo.idl   > amvideo.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/d3d9.h        > d3d9.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/d3d9caps.h    > d3d9caps.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/d3d9types.h   > d3d9types.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/d3dx9anim.h   > d3dx9anim.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/d3dx9.h       > d3dx9.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/d3dx9core.h   > d3dx9core.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/d3dx9effect.h > d3dx9effect.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/d3dx9math.h   > d3dx9math.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/d3dx9mesh.h   > d3dx9mesh.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/d3dx9shader.h > d3dx9shader.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/d3dx9shape.h  > d3dx9shape.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/d3dx9tex.h    > d3dx9tex.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/d3dx9xof.h    > d3dx9xof.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/ddraw.h       > ddraw.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/dinput.h      > dinput.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/dls1.h        > dls1.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/dmdls.h       > dmdls.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/dmerror.h     > dmerror.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/dmplugin.h    > dmplugin.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/dmusbuff.h    > dmusbuff.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/dmusicc.h     > dmusicc.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/dmusicf.h     > dmusicf.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/dmusici.h     > dmusici.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/dmusics.h     > dmusics.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/dpaddr.h      > dpaddr.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/dplay8.h      > dplay8.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/dplay.h       > dplay.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/dplobby8.h    > dplobby8.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/dplobby.h     > dplobby.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/dshow.h       > dshow.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/dsound.h      > dsound.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/dxerr8.h      > dxerr8.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/dxerr9.h      > dxerr9.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/errors.h      > errors.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/evcode.h      > evcode.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/vfwmsgs.h     > vfwmsgs.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/include/objectarray.idl > objectarray.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/include/devpropdef.h > devpropdef.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/include/propkeydef.h > propkeydef.tmp
	sed -n 8,19p extracted/$(MINGWW64_TITLE)/mingw-w64-headers/include/gdiplus/gdiplus.h | cut -c4- > gdiplus.tmp
	$(FBFROG) $(WINAPI_FLAGS) \
		-include winsock2.h \
		\
		-include aclapi.h \
		-include aclui.h \
		-include comcat.h \
		-include control.h \
		-include cplext.h \
		-include cpl.h \
		-include custcntl.h \
		-include dbt.h \
		-include dimm.h \
		-include docobj.h \
		-include exdisp.h \
		-include gdiplus.h \
		-include imagehlp.h \
		-include in6addr.h \
		-include intshcut.h \
		-include iphlpapi.h \
		-include ipmib.h \
		-include lmcons.h \
		-include mapi.h \
		-include mgmtapi.h \
		-include mmreg.h \
		-include mshtmhst.h \
		-include mshtmlc.h \
		-include mshtml.h \
		-include mswsock.h \
		-include nspapi.h \
		-include ntddndis.h \
		-include objectarray.h \
		-include objsafe.h \
		-include ocidl.h \
		-include odbcinst.h \
		-include oleacc.h \
		-include oledlg.h \
		-include olectlid.h \
		-include powrprof.h \
		-include propkeydef.h \
		-include propsys.h \
		-include psapi.h \
		-include rasdlg.h \
		-include raserror.h \
		-include rassapi.h \
		-include regstr.h \
		-include richole.h \
		-include schemadef.h \
		-include scrnsave.h \
		-include security.h \
		-include setupapi.h \
		-include shldisp.h \
		-include shlobj.h \
		-include shlwapi.h \
		-include sqlext.h \
		-include strmif.h \
		-include strsafe.h \
		-include subauth.h \
		-include tlhelp32.h \
		-include tmschema.h \
		-include userenv.h \
		-include uuids.h \
		-include uxtheme.h \
		-include vfw.h \
		-include wbemcli.h \
		-include winber.h \
		-include windns.h \
		-include wininet.h \
		-include winldap.h \
		-include winsnmp.h \
		-include ws2spi.h \
		-include ws2tcpip.h \
		-include wsipx.h \
		\
		-include windowsx.h \
		\
		-include sspi.h \
		-include ntsecpkg.h \
		\
		-include d3d9.h \
		-include d3dx9.h \
		-include amaudio.h \
		-include dinput.h \
		-include dls1.h \
		-include dmdls.h \
		-include dmerror.h \
		-include dmusicc.h \
		-include dmusici.h \
		-include dmusicf.h \
		-include dmusics.h \
		-include dpaddr.h \
		-include dplay8.h \
		-include dplay.h \
		-include dplobby8.h \
		-include dplobby.h \
		-include dshow.h \
		-include dsound.h \
		-include dvdevcod.h \
		-include dxerr8.h \
		-include dxerr9.h \
		-include edevdefs.h \
		-include errors.h \
		-include vfwmsgs.h \
		\
		-include initguid.h \
		\
		winapi-inclibs.fbfrog \
		winapi-emits-generated.fbfrog \
		winapi-emits-custom.fbfrog \
		winapi-titles-generated.fbfrog \
		\
		-title $(MINGWW64_TITLE) amaudio.tmp     fbteam.txt inc/win/amaudio.bi \
		-title $(MINGWW64_TITLE) amvideo.tmp     fbteam.txt inc/win/amvideo.bi \
		-title $(MINGWW64_TITLE) d3d9.tmp        fbteam.txt inc/win/d3d9.bi \
		-title $(MINGWW64_TITLE) d3d9caps.tmp    fbteam.txt inc/win/d3d9caps.bi \
		-title $(MINGWW64_TITLE) d3d9types.tmp   fbteam.txt inc/win/d3d9types.bi \
		-title $(MINGWW64_TITLE) d3dx9anim.tmp   fbteam.txt inc/win/d3dx9anim.bi \
		-title $(MINGWW64_TITLE) d3dx9.tmp       fbteam.txt inc/win/d3dx9.bi \
		-title $(MINGWW64_TITLE) d3dx9core.tmp   fbteam.txt inc/win/d3dx9core.bi \
		-title $(MINGWW64_TITLE) d3dx9effect.tmp fbteam.txt inc/win/d3dx9effect.bi \
		-title $(MINGWW64_TITLE) d3dx9math.tmp   fbteam.txt inc/win/d3dx9math.bi \
		-title $(MINGWW64_TITLE) d3dx9mesh.tmp   fbteam.txt inc/win/d3dx9mesh.bi \
		-title $(MINGWW64_TITLE) d3dx9shader.tmp fbteam.txt inc/win/d3dx9shader.bi \
		-title $(MINGWW64_TITLE) d3dx9shape.tmp  fbteam.txt inc/win/d3dx9shape.bi \
		-title $(MINGWW64_TITLE) d3dx9tex.tmp    fbteam.txt inc/win/d3dx9tex.bi \
		-title $(MINGWW64_TITLE) d3dx9xof.tmp    fbteam.txt inc/win/d3dx9xof.bi \
		-title $(MINGWW64_TITLE) ddraw.tmp       fbteam.txt inc/win/ddraw.bi \
		-title $(MINGWW64_TITLE) dinput.tmp      fbteam.txt inc/win/dinput.bi \
		-title $(MINGWW64_TITLE) dls1.tmp        fbteam.txt inc/win/dls1.bi \
		-title $(MINGWW64_TITLE) dmdls.tmp       fbteam.txt inc/win/dmdls.bi \
		-title $(MINGWW64_TITLE) dmerror.tmp     fbteam.txt inc/win/dmerror.bi \
		-title $(MINGWW64_TITLE) dmplugin.tmp    fbteam.txt inc/win/dmplugin.bi \
		-title $(MINGWW64_TITLE) dmusbuff.tmp    fbteam.txt inc/win/dmusbuff.bi \
		-title $(MINGWW64_TITLE) dmusicc.tmp     fbteam.txt inc/win/dmusicc.bi \
		-title $(MINGWW64_TITLE) dmusicf.tmp     fbteam.txt inc/win/dmusicf.bi \
		-title $(MINGWW64_TITLE) dmusici.tmp     fbteam.txt inc/win/dmusici.bi \
		-title $(MINGWW64_TITLE) dmusics.tmp     fbteam.txt inc/win/dmusics.bi \
		-title $(MINGWW64_TITLE) dpaddr.tmp      fbteam.txt inc/win/dpaddr.bi \
		-title $(MINGWW64_TITLE) dplay8.tmp      fbteam.txt inc/win/dplay8.bi \
		-title $(MINGWW64_TITLE) dplay.tmp       fbteam.txt inc/win/dplay.bi \
		-title $(MINGWW64_TITLE) dplobby8.tmp    fbteam.txt inc/win/dplobby8.bi \
		-title $(MINGWW64_TITLE) dplobby.tmp     fbteam.txt inc/win/dplobby.bi \
		-title $(MINGWW64_TITLE) dshow.tmp       fbteam.txt inc/win/dshow.bi \
		-title $(MINGWW64_TITLE) dsound.tmp      fbteam.txt inc/win/dsound.bi \
		-title $(MINGWW64_TITLE) mingw-w64-disclaimer-pd.tmp fbteam.txt inc/win/dvdevcod.bi \
		-title $(MINGWW64_TITLE) dxerr8.tmp      fbteam.txt inc/win/dxerr8.bi \
		-title $(MINGWW64_TITLE) dxerr9.tmp      fbteam.txt inc/win/dxerr9.bi \
		-title $(MINGWW64_TITLE) mingw-w64-disclaimer-pd.tmp fbteam.txt inc/win/edevdefs.bi \
		-title $(MINGWW64_TITLE) errors.tmp      fbteam.txt inc/win/errors.bi \
		-title $(MINGWW64_TITLE) evcode.tmp      fbteam.txt inc/win/evcode.bi \
		-title $(MINGWW64_TITLE) vfwmsgs.tmp     fbteam.txt inc/win/vfwmsgs.bi \
		-title $(MINGWW64_TITLE) objectarray.tmp fbteam.txt inc/win/objectarray.bi \
		-title $(MINGWW64_TITLE) devpropdef.tmp  fbteam.txt inc/win/devpropdef.bi \
		-title $(MINGWW64_TITLE) propkeydef.tmp  fbteam.txt inc/win/propkeydef.bi \
		-title $(MINGWW64_TITLE) gdiplus.tmp     fbteam.txt inc/win/gdiplus.bi \
		\
		-title $(MINGWW64_TITLE) mingw-w64-disclaimer.tmp    fbteam.txt inc/win/comcat.bi \
		-title $(MINGWW64_TITLE) mingw-w64-disclaimer-pd.tmp fbteam.txt inc/win/control.bi \
		-title $(MINGWW64_TITLE) mingw-w64-disclaimer.tmp    fbteam.txt inc/win/dimm.bi \
		-title $(MINGWW64_TITLE) mingw-w64-disclaimer.tmp    fbteam.txt inc/win/docobj.bi \
		-title $(MINGWW64_TITLE) mingw-w64-disclaimer.tmp    fbteam.txt inc/win/mshtmhst.bi \
		-title $(MINGWW64_TITLE) mingw-w64-disclaimer.tmp    fbteam.txt inc/win/mshtml.bi \
		-title $(MINGWW64_TITLE) mingw-w64-disclaimer-pd.tmp fbteam.txt inc/win/msxml.bi \
		-title $(MINGWW64_TITLE) mingw-w64-disclaimer.tmp    fbteam.txt inc/win/naptypes.bi \
		-title $(MINGWW64_TITLE) mingw-w64-disclaimer.tmp    fbteam.txt inc/win/oaidl.bi \
		-title $(MINGWW64_TITLE) mingw-w64-disclaimer.tmp    fbteam.txt inc/win/objidlbase.bi \
		-title $(MINGWW64_TITLE) mingw-w64-disclaimer.tmp    fbteam.txt inc/win/objidl.bi \
		-title $(MINGWW64_TITLE) mingw-w64-disclaimer.tmp    fbteam.txt inc/win/ocidl.bi \
		-title $(MINGWW64_TITLE) mingw-w64-disclaimer-pd.tmp fbteam.txt inc/win/oleacc.bi \
		-title $(MINGWW64_TITLE) mingw-w64-disclaimer.tmp    fbteam.txt inc/win/oleidl.bi \
		-title $(MINGWW64_TITLE) mingw-w64-disclaimer.tmp    fbteam.txt inc/win/propidl.bi \
		-title $(MINGWW64_TITLE) mingw-w64-disclaimer.tmp    fbteam.txt inc/win/propsys.bi \
		-title $(MINGWW64_TITLE) mingw-w64-disclaimer.tmp    fbteam.txt inc/win/servprov.bi \
		-title $(MINGWW64_TITLE) mingw-w64-disclaimer.tmp    fbteam.txt inc/win/shldisp.bi \
		-title $(MINGWW64_TITLE) mingw-w64-disclaimer.tmp    fbteam.txt inc/win/shobjidl.bi \
		-title $(MINGWW64_TITLE) mingw-w64-disclaimer.tmp    fbteam.txt inc/win/shtypes.bi \
		-title $(MINGWW64_TITLE) mingw-w64-disclaimer-pd.tmp fbteam.txt inc/win/strmif.bi \
		-title $(MINGWW64_TITLE) mingw-w64-disclaimer.tmp    fbteam.txt inc/win/structuredquerycondition.bi \
		-title $(MINGWW64_TITLE) mingw-w64-disclaimer.tmp    fbteam.txt inc/win/unknwnbase.bi \
		-title $(MINGWW64_TITLE) mingw-w64-disclaimer.tmp    fbteam.txt inc/win/unknwn.bi \
		-title $(MINGWW64_TITLE) mingw-w64-disclaimer.tmp    fbteam.txt inc/win/urlmon.bi \
		-title $(MINGWW64_TITLE) mingw-w64-disclaimer.tmp    fbteam.txt inc/win/wbemcli.bi \
		-title $(MINGWW64_TITLE) mingw-w64-disclaimer.tmp    fbteam.txt inc/win/wtypesbase.bi \
		-title $(MINGWW64_TITLE) mingw-w64-disclaimer.tmp    fbteam.txt inc/win/wtypes.bi \
		-title $(MINGWW64_TITLE) mingw-w64-disclaimer.tmp    fbteam.txt inc/win/devpkey.bi

	rm *.tmp

winapi-rest: tools winapi-extract
	sed -n 2,42p extracted/$(MINGWW64_TITLE)/DISCLAIMER    | cut -c2- > mingw-w64-disclaimer.tmp
	sed -n 2,9p  extracted/$(MINGWW64_TITLE)/DISCLAIMER.PD | cut -c4- > mingw-w64-disclaimer-pd.tmp

	# Direct3D 7 (?) pass
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/d3d.h      > d3d.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/d3dcaps.h  > d3dcaps.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/d3dtypes.h > d3dtypes.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/d3drm.h    > d3drm.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/d3drmdef.h > d3drmdef.tmp
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/direct-x/include/d3drmobj.h > d3drmobj.tmp
	$(FBFROG) $(WINAPI_FLAGS) \
		-include d3d.h \
		-include d3drm.h \
		-emit '*/d3d.h'      inc/win/d3d.bi      \
		-emit '*/d3dcaps.h'  inc/win/d3dcaps.bi  \
		-emit '*/d3dtypes.h' inc/win/d3dtypes.bi \
		-emit '*/d3drm.h'    inc/win/d3drm.bi    \
		-emit '*/d3drmdef.h' inc/win/d3drmdef.bi \
		-emit '*/d3drmobj.h' inc/win/d3drmobj.bi \
		-inclib dxguid       inc/win/d3d.bi \
		-inclib d3drm        inc/win/d3drm.bi \
		-title $(MINGWW64_TITLE) d3d.tmp      fbteam.txt inc/win/d3d.bi      \
		-title $(MINGWW64_TITLE) d3dcaps.tmp  fbteam.txt inc/win/d3dcaps.bi  \
		-title $(MINGWW64_TITLE) d3dtypes.tmp fbteam.txt inc/win/d3dtypes.bi \
		-title $(MINGWW64_TITLE) d3drm.tmp    fbteam.txt inc/win/d3drm.bi    \
		-title $(MINGWW64_TITLE) d3drmdef.tmp fbteam.txt inc/win/d3drmdef.bi \
		-title $(MINGWW64_TITLE) d3drmobj.tmp fbteam.txt inc/win/d3drmobj.bi

	# CRT intrin.h pass (separate because of -nofunctionbodies)
	$(FBFROG) $(WINAPI_FLAGS) -nofunctionbodies \
		-include windows.h \
		-emit '*/intrin.h'               inc/win/intrin.bi \
		-emit '*/psdk_inc/intrin-impl.h' inc/win/intrin.bi \
		 -title $(MINGWW64_TITLE) mingw-w64-disclaimer-pd.tmp fbteam.txt inc/win/intrin.bi

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
		-inclib wsock32                    inc/win/winsock.bi \
		 -title $(MINGWW64_TITLE) mingw-w64-disclaimer-pd.tmp fbteam.txt inc/win/winsock.bi

	# ole.h pass (separate because it can't be #included with windows.h,
	# even though windows.h has code to do just that, due to conflicts with
	# ole2.h)
	$(FBFROG) $(WINAPI_FLAGS) -define _Analysis_noreturn_ "" \
		-include windef.h -include ole.h \
		-emit '*/ole.h' inc/win/ole.bi \
		-inclib ole32   inc/win/ole.bi \
		 -title $(MINGWW64_TITLE) mingw-w64-disclaimer.tmp fbteam.txt inc/win/ole.bi

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
		-emit '*/windows.h' inc/windows.bi \
		 -title $(MINGWW64_TITLE) mingw-w64-disclaimer-pd.tmp fbteam.txt inc/windows.bi

	# DDK pass
	$(GETCOMMENT) extracted/$(MINGWW64_TITLE)/mingw-w64-headers/include/ntdef.h > ntdef.tmp
	$(FBFROG) $(WINAPI_FLAGS) \
		-include ntdef.h \
		-emit '*/ntdef.h' inc/win/ntdef.bi \
		 -title $(MINGWW64_TITLE) ntdef.tmp fbteam.txt inc/win/ntdef.bi

	rm *.tmp

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
#

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

include x11-titles-main-generated.mk
include x11-titles-internal-generated.mk

x11: tools
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

	cp extracted/xorg/$(X11_XEXTPROTO)/*.h        extracted/xorg/X11/extensions
	cp extracted/xorg/$(X11_RENDERPROTO)/*.h      extracted/xorg/X11/extensions
	cp extracted/xorg/$(X11_RANDRPROTO)/*.h       extracted/xorg/X11/extensions
	cp extracted/xorg/$(X11_KBPROTO)/*.h          extracted/xorg/X11/extensions
	cp extracted/xorg/$(X11_INPUTPROTO)/*.h       extracted/xorg/X11/extensions
	cp extracted/xorg/$(X11_DRI2PROTO)/*.h        extracted/xorg/X11/extensions
	cp extracted/xorg/$(X11_XF86DGAPROTO)/*.h     extracted/xorg/X11/extensions
	cp extracted/xorg/$(X11_XF86VIDMODEPROTO)/*.h extracted/xorg/X11/extensions
	cp extracted/xorg/$(X11_VIDEOPROTO)/*.h       extracted/xorg/X11/extensions
	cp extracted/xorg/$(X11_FIXESPROTO)/*.h       extracted/xorg/X11/extensions
	cp extracted/xorg/$(X11_RECORDPROTO)/*.h      extracted/xorg/X11/extensions

	cp extracted/xorg/$(X11_XT)/COPYING x11-CreateI.tmp
	cp extracted/xorg/$(X11_XT)/COPYING x11-ShellI.tmp
	cp extracted/xorg/$(X11_X11)/COPYING x11-ImUtil.tmp
	cp extracted/xorg/$(X11_XPROTO)/COPYING x11-XF86keysym.tmp
	cp extracted/xorg/$(X11_XPROTO)/COPYING x11-Xatom.tmp
	cp extracted/xorg/$(X11_XPROTO)/COPYING x11-Xw32defs.tmp
	cp extracted/xorg/$(X11_VIDEOPROTO)/COPYING x11-extensions-XvMC.tmp
	cp extracted/xorg/$(X11_VIDEOPROTO)/COPYING x11-extensions-XvMCproto.tmp
	$(GETCOMMENT) extracted/xorg/$(X11_XXF86DGA)/include/X11/extensions/Xxf86dga.h > x11-extensions-Xxf86dga.tmp
	$(GETCOMMENT) extracted/xorg/$(X11_XXF86DGA)/include/X11/extensions/xf86dga1.h > x11-extensions-xf86dga1.tmp
	cat extracted/xorg/$(X11_XXF86DGA)/COPYING                                    >> x11-extensions-Xxf86dga.tmp
	cat extracted/xorg/$(X11_XXF86DGA)/COPYING                                    >> x11-extensions-xf86dga1.tmp
	$(GETCOMMENT) extracted/xorg/$(X11_XF86DGAPROTO)/xf86dga1const.h > x11-extensions-xf86dga1const.tmp
	$(GETCOMMENT) extracted/xorg/$(X11_XF86DGAPROTO)/xf86dga1proto.h > x11-extensions-xf86dga1proto.tmp
	$(GETCOMMENT) extracted/xorg/$(X11_XF86DGAPROTO)/xf86dgaconst.h  > x11-extensions-xf86dgaconst.tmp
	$(GETCOMMENT) extracted/xorg/$(X11_XF86DGAPROTO)/xf86dgaproto.h  > x11-extensions-xf86dgaproto.tmp
	cat extracted/xorg/$(X11_XF86DGAPROTO)/COPYING                  >> x11-extensions-xf86dga1const.tmp
	cat extracted/xorg/$(X11_XF86DGAPROTO)/COPYING                  >> x11-extensions-xf86dga1proto.tmp
	cp  extracted/xorg/$(X11_XF86DGAPROTO)/COPYING                     x11-extensions-xf86dga1str.tmp
	cat extracted/xorg/$(X11_XF86DGAPROTO)/COPYING                  >> x11-extensions-xf86dgaconst.tmp
	cat extracted/xorg/$(X11_XF86DGAPROTO)/COPYING                  >> x11-extensions-xf86dgaproto.tmp
	cp  extracted/xorg/$(X11_XF86DGAPROTO)/COPYING                     x11-extensions-xf86dgastr.tmp
	cp  extracted/xorg/$(X11_XF86DGAPROTO)/COPYING                     x11-extensions-xf86dga.tmp
	cp  extracted/xorg/$(X11_XF86VIDMODEPROTO)/COPYING                 x11-extensions-xf86vmstr.tmp
	cp extracted/xorg/$(X11_RECORDPROTO)/COPYING x11-extensions-recordstr.tmp
	cp extracted/xorg/$(X11_XEXTPROTO)/COPYING x11-extensions-shapestr.tmp
	./x11-gen-legal.sh

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
		-iftarget windows \
			-include X11/Xw32defs.h \
			-include X11/Xwindows.h \
			-include X11/Xwinsock.h \
		-endif \
		\
		x11-emits-main-generated.fbfrog \
		$(x11_titles_main)

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
		x11-emits-internal-generated.fbfrog \
		$(x11_titles_internal)

	rm *.tmp

XCB_PROTO := xcb-proto-1.11
XCB_PTHREAD_STUBS := libpthread-stubs-0.3
XCB := libxcb-1.11
xcbinstall := $(PWD)/extracted/xcbinstall
xcb: tools
	./get.sh $(XCB_PROTO)         $(XCB_PROTO).tar.bz2         "http://xcb.freedesktop.org/dist/$(XCB_PROTO).tar.bz2"
	./get.sh $(XCB_PTHREAD_STUBS) $(XCB_PTHREAD_STUBS).tar.bz2 "http://xcb.freedesktop.org/dist/$(XCB_PTHREAD_STUBS).tar.bz2"
	./get.sh $(XCB)               $(XCB).tar.bz2               "http://xcb.freedesktop.org/dist/$(XCB).tar.bz2"

	# Build libxcb and its xcb-proto dependency, to produce libxcb's headers
	# (most of them are auto-generated based on the xml files from xcb-proto)
	# xcb_windefs.h is only copied by "make install" for win32, so we do it
	# manually to get it always.
	mkdir -p extracted/xcbinstall
	cd extracted/$(XCB_PROTO) && if [ ! -f Makefile ]; then \
		PKG_CONFIG_PATH=$(xcbinstall)/lib/pkgconfig ./configure --prefix=$(xcbinstall) && \
		make && make install; \
	fi
	cd extracted/$(XCB) && if [ ! -f Makefile ]; then \
		PKG_CONFIG_PATH=$(xcbinstall)/lib/pkgconfig ./configure --prefix=$(xcbinstall) && \
		make && make install && \
		cp src/xcb_windefs.h $(xcbinstall)/include/xcb; \
	fi

	sed -n 3,26p extracted/$(XCB_PROTO)/src/bigreq.xml      > bigreq.tmp
	sed -n 3,25p extracted/$(XCB_PROTO)/src/composite.xml   > composite.tmp
	sed -n 3,27p extracted/$(XCB_PROTO)/src/damage.xml      > damage.tmp
	sed -n 3,26p extracted/$(XCB_PROTO)/src/dpms.xml        > dpms.tmp
	sed -n 3,27p extracted/$(XCB_PROTO)/src/dri2.xml        > dri2.tmp
	sed -n 4,22p extracted/$(XCB_PROTO)/src/dri3.xml        > dri3.tmp
	sed -n 3,25p extracted/$(XCB_PROTO)/src/ge.xml          > ge.tmp
	sed -n 3,26p extracted/$(XCB_PROTO)/src/glx.xml         > glx.tmp
	sed -n 4,22p extracted/$(XCB_PROTO)/src/present.xml     > present.tmp
	sed -n 3,26p extracted/$(XCB_PROTO)/src/randr.xml       > randr.tmp
	sed -n 3,26p extracted/$(XCB_PROTO)/src/record.xml      > record.tmp
	sed -n 3,26p extracted/$(XCB_PROTO)/src/res.xml         > res.tmp
	sed -n 3,26p extracted/$(XCB_PROTO)/src/screensaver.xml > screensaver.tmp
	sed -n 3,26p extracted/$(XCB_PROTO)/src/shape.xml       > shape.tmp
	sed -n 3,26p extracted/$(XCB_PROTO)/src/shm.xml         > shm.tmp
	sed -n 3,25p extracted/$(XCB_PROTO)/src/xevie.xml       > xevie.tmp
	sed -n 3,26p extracted/$(XCB_PROTO)/src/xf86dri.xml     > xf86dri.tmp
	sed -n 3,25p extracted/$(XCB_PROTO)/src/xf86vidmode.xml > xf86vidmode.tmp
	sed -n 3,25p extracted/$(XCB_PROTO)/src/xfixes.xml      > xfixes.tmp
	sed -n 3,26p extracted/$(XCB_PROTO)/src/xinerama.xml    > xinerama.tmp
	sed -n 3,27p extracted/$(XCB_PROTO)/src/xinput.xml      > xinput.tmp
	sed -n 3,25p extracted/$(XCB_PROTO)/src/xkb.xml         > xkb.tmp
	sed -n 3,26p extracted/$(XCB_PROTO)/src/xprint.xml      > xprint.tmp
	sed -n 3,26p extracted/$(XCB_PROTO)/src/xproto.xml      > xproto.tmp
	sed -n 3,23p extracted/$(XCB_PROTO)/src/xselinux.xml    > xselinux.tmp
	sed -n 3,26p extracted/$(XCB_PROTO)/src/xtest.xml       > xtest.tmp
	sed -n 3,26p extracted/$(XCB_PROTO)/src/xvmc.xml        > xvmc.tmp
	sed -n 3,26p extracted/$(XCB_PROTO)/src/xv.xml          > xv.tmp

	sed -n 3,3p extracted/$(XCB_PROTO)/src/render.xml      > render.tmp
	sed -n 3,3p extracted/$(XCB_PROTO)/src/sync.xml        > sync.tmp
	sed -n 3,3p extracted/$(XCB_PROTO)/src/xc_misc.xml     > xc_misc.tmp
	sed -n 2,30p extracted/$(XCB_PROTO)/COPYING           >> render.tmp
	sed -n 2,30p extracted/$(XCB_PROTO)/COPYING           >> sync.tmp
	sed -n 2,30p extracted/$(XCB_PROTO)/COPYING           >> xc_misc.tmp

	$(GETCOMMENT) extracted/xcbinstall/include/xcb/xcb.h    > xcb.tmp
	$(GETCOMMENT) extracted/xcbinstall/include/xcb/xcbext.h > xcbext.tmp
	$(GETCOMMENT) extracted/xcbinstall/include/xcb/xcb_windefs.h > xcb_windefs.tmp

	mkdir -p inc/xcb
	$(FBFROG) xcb.fbfrog -incdir extracted/xcbinstall/include/xcb \
		-include xcb.h \
		\
		-include bigreq.h \
		-include composite.h \
		-include damage.h \
		-include dpms.h \
		-include dri2.h \
		-include dri3.h \
		-include glx.h \
		-include present.h \
		-include randr.h \
		-include record.h \
		-include render.h \
		-include res.h \
		-include screensaver.h \
		-include shape.h \
		-include shm.h \
		-include sync.h \
		-include xcbext.h \
		-include xc_misc.h \
		-include xevie.h \
		-include xf86dri.h \
		-include xfixes.h \
		-include xinerama.h \
		-include xinput.h \
		-include xkb.h \
		-include xprint.h \
		-include xproto.h \
		-include xselinux.h \
		-include xtest.h \
		-include xv.h \
		-include xvmc.h \
		\
		-emit '*/bigreq.h'      inc/xcb/bigreq.bi \
		-emit '*/composite.h'   inc/xcb/composite.bi \
		-emit '*/damage.h'      inc/xcb/damage.bi \
		-emit '*/dpms.h'        inc/xcb/dpms.bi \
		-emit '*/dri2.h'        inc/xcb/dri2.bi \
		-emit '*/dri3.h'        inc/xcb/dri3.bi \
		-emit '*/glx.h'         inc/xcb/glx.bi \
		-emit '*/present.h'     inc/xcb/present.bi \
		-emit '*/randr.h'       inc/xcb/randr.bi \
		-emit '*/record.h'      inc/xcb/record.bi \
		-emit '*/render.h'      inc/xcb/render.bi \
		-emit '*/res.h'         inc/xcb/res.bi \
		-emit '*/screensaver.h' inc/xcb/screensaver.bi \
		-emit '*/shape.h'       inc/xcb/shape.bi \
		-emit '*/shm.h'         inc/xcb/shm.bi \
		-emit '*/sync.h'        inc/xcb/sync.bi \
		-emit '*/xcbext.h'      inc/xcb/xcbext.bi \
		-emit '*/xcb.h'         inc/xcb/xcb.bi \
		-emit '*/xcb_windefs.h' inc/xcb/xcb_windefs.bi \
		-emit '*/xc_misc.h'     inc/xcb/xc_misc.bi \
		-emit '*/xevie.h'       inc/xcb/xevie.bi \
		-emit '*/xf86dri.h'     inc/xcb/xf86dri.bi \
		-emit '*/xfixes.h'      inc/xcb/xfixes.bi \
		-emit '*/xinerama.h'    inc/xcb/xinerama.bi \
		-emit '*/xinput.h'      inc/xcb/xinput.bi \
		-emit '*/xkb.h'         inc/xcb/xkb.bi \
		-emit '*/xprint.h'      inc/xcb/xprint.bi \
		-emit '*/xproto.h'      inc/xcb/xproto.bi \
		-emit '*/xselinux.h'    inc/xcb/xselinux.bi \
		-emit '*/xtest.h'       inc/xcb/xtest.bi \
		-emit '*/xv.h'          inc/xcb/xv.bi \
		-emit '*/xvmc.h'        inc/xcb/xvmc.bi \
		\
		-title "$(XCB), $(XCB_PROTO)" bigreq.tmp      fbteam.txt inc/xcb/bigreq.bi \
		-title "$(XCB), $(XCB_PROTO)" composite.tmp   fbteam.txt inc/xcb/composite.bi \
		-title "$(XCB), $(XCB_PROTO)" damage.tmp      fbteam.txt inc/xcb/damage.bi \
		-title "$(XCB), $(XCB_PROTO)" dpms.tmp        fbteam.txt inc/xcb/dpms.bi \
		-title "$(XCB), $(XCB_PROTO)" dri2.tmp        fbteam.txt inc/xcb/dri2.bi \
		-title "$(XCB), $(XCB_PROTO)" dri3.tmp        fbteam.txt inc/xcb/dri3.bi \
		-title "$(XCB), $(XCB_PROTO)" glx.tmp         fbteam.txt inc/xcb/glx.bi \
		-title "$(XCB), $(XCB_PROTO)" present.tmp     fbteam.txt inc/xcb/present.bi \
		-title "$(XCB), $(XCB_PROTO)" randr.tmp       fbteam.txt inc/xcb/randr.bi \
		-title "$(XCB), $(XCB_PROTO)" record.tmp      fbteam.txt inc/xcb/record.bi \
		-title "$(XCB), $(XCB_PROTO)" render.tmp      fbteam.txt inc/xcb/render.bi \
		-title "$(XCB), $(XCB_PROTO)" res.tmp         fbteam.txt inc/xcb/res.bi \
		-title "$(XCB), $(XCB_PROTO)" screensaver.tmp fbteam.txt inc/xcb/screensaver.bi \
		-title "$(XCB), $(XCB_PROTO)" shape.tmp       fbteam.txt inc/xcb/shape.bi \
		-title "$(XCB), $(XCB_PROTO)" shm.tmp         fbteam.txt inc/xcb/shm.bi \
		-title "$(XCB), $(XCB_PROTO)" sync.tmp        fbteam.txt inc/xcb/sync.bi \
		-title "$(XCB), $(XCB_PROTO)" xcbext.tmp      fbteam.txt inc/xcb/xcbext.bi \
		-title "$(XCB), $(XCB_PROTO)" xcb.tmp         fbteam.txt inc/xcb/xcb.bi \
		-title "$(XCB), $(XCB_PROTO)" xcb_windefs.tmp fbteam.txt inc/xcb/xcb_windefs.bi \
		-title "$(XCB), $(XCB_PROTO)" xc_misc.tmp     fbteam.txt inc/xcb/xc_misc.bi \
		-title "$(XCB), $(XCB_PROTO)" xevie.tmp       fbteam.txt inc/xcb/xevie.bi \
		-title "$(XCB), $(XCB_PROTO)" xf86dri.tmp     fbteam.txt inc/xcb/xf86dri.bi \
		-title "$(XCB), $(XCB_PROTO)" xfixes.tmp      fbteam.txt inc/xcb/xfixes.bi \
		-title "$(XCB), $(XCB_PROTO)" xinerama.tmp    fbteam.txt inc/xcb/xinerama.bi \
		-title "$(XCB), $(XCB_PROTO)" xinput.tmp      fbteam.txt inc/xcb/xinput.bi \
		-title "$(XCB), $(XCB_PROTO)" xkb.tmp         fbteam.txt inc/xcb/xkb.bi \
		-title "$(XCB), $(XCB_PROTO)" xprint.tmp      fbteam.txt inc/xcb/xprint.bi \
		-title "$(XCB), $(XCB_PROTO)" xproto.tmp      fbteam.txt inc/xcb/xproto.bi \
		-title "$(XCB), $(XCB_PROTO)" xselinux.tmp    fbteam.txt inc/xcb/xselinux.bi \
		-title "$(XCB), $(XCB_PROTO)" xtest.tmp       fbteam.txt inc/xcb/xtest.bi \
		-title "$(XCB), $(XCB_PROTO)" xvmc.tmp        fbteam.txt inc/xcb/xvmc.bi \
		-title "$(XCB), $(XCB_PROTO)" xv.tmp          fbteam.txt inc/xcb/xv.bi

ZIP_TITLE := libzip-1.0.1
zip: tools
	./get.sh $(ZIP_TITLE) $(ZIP_TITLE).tar.xz "http://www.nih.at/libzip/$(ZIP_TITLE).tar.xz"

	# Need to compile libzip in order to get zipconf.h
	# (luckily it's the same for all targets)
	cd extracted/$(ZIP_TITLE) && \
		if [ ! -f lib/zipconf.h ]; then ./configure && make; fi

	$(GETCOMMENT) extracted/$(ZIP_TITLE)/lib/zip.h > zip.tmp
	$(FBFROG) zip.fbfrog -o inc/zip.bi \
		-incdir extracted/$(ZIP_TITLE)/lib \
		-include zip.h \
		-title $(ZIP_TITLE) zip.tmp fbteam.txt
	rm *.tmp

ZLIB_TITLE := zlib-1.2.8
zlib: tools
	./get.sh $(ZLIB_TITLE) $(ZLIB_TITLE).tar.xz "http://zlib.net/$(ZLIB_TITLE).tar.xz"

	$(GETCOMMENT) extracted/$(ZLIB_TITLE)/zlib.h > zlib.tmp
	$(FBFROG) zlib.fbfrog -o inc extracted/$(ZLIB_TITLE)/zlib.h \
		-title $(ZLIB_TITLE) zlib.tmp fbteam.txt
	rm *.tmp
