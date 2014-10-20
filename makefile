FBFROG := fbfrog

.PHONY: default libzip
default:

LIBZIP_VERSION := 0.11.2
libzip:
	./downloadextract.sh libzip-$(LIBZIP_VERSION) libzip-$(LIBZIP_VERSION).tar.xz "http://www.nih.at/libzip/libzip-$(LIBZIP_VERSION).tar.xz"
	# Need to compile libzip in order to get zipconf.h
	# (luckily it's the same for all targets)
	cd extracted/libzip-$(LIBZIP_VERSION) && \
		if [ ! -f lib/zipconf.h ]; then ./configure && make; fi
	$(FBFROG) zip.fbfrog -o inc extracted/libzip-$(LIBZIP_VERSION)/lib/zip.h
