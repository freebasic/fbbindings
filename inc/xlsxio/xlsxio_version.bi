'' FreeBASIC binding for XLSX I/O - 0.2.35
''
'' based on the C header files:
''   XLSX I/O - C library for reading and writing .xlsx files by brechtsanders
''XLSX I/O is released under the terms of the MIT License (MIT), see LICENSE.txt.
''This means you are free to use XLSX I/O in any of your projects, from open source to commercial.
''This library does not require Microsoft(R) Excel(TM) to be installed.
'' translated to FreeBASIC by:
'' FreeBASIC development team
#pragma once

#ifndef INCLUDED_XLSXIO_VERSION_H
#define INCLUDED_XLSXIO_VERSION_H


const XLSXIO_VERSION_MAJOR = 0
const XLSXIO_VERSION_MINOR = 2
const XLSXIO_VERSION_MICRO = 35

#define XLSXIO_VERSION_STRINGIZE_(major, minor, micro) #major "." #minor "." #micro
#define XLSXIO_VERSION_STRINGIZE(major, minor, micro) XLSXIO_VERSION_STRINGIZE_(major, minor, micro)
#define XLSXIO_VERSION_STRING XLSXIO_VERSION_STRINGIZE(XLSXIO_VERSION_MAJOR, XLSXIO_VERSION_MINOR, XLSXIO_VERSION_MICRO)

const XLSXIO_VERSION_ID = ((XLSXIO_VERSION_MAJOR * 10000) + (XLSXIO_VERSION_MINOR * 100)) + XLSXIO_VERSION_MICRO

#define XLSXIOREAD_NAME "libxlsxio_read"
#define XLSXIOWRITE_NAME "libxlsxio_write"
#define XLSXIOREAD_FULLNAME XLSXIOREAD_NAME " " XLSXIO_VERSION_STRING
#define XLSXIOWRITE_FULLNAME XLSXIOWRITE_NAME " " XLSXIO_VERSION_STRING

#endif
