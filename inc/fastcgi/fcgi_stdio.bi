#pragma once

#include once "crt/long.bi"
#include once "crt/stdio.bi"
#include once "crt/sys/types.bi"
#include once "fcgiapp.bi"

extern "C"

#define _FCGI_STDIO 1

type FCGI_FILE
	stdio_stream as FILE ptr
	fcgx_stream as FCGX_Stream ptr
end type

declare function FCGI_Accept() as long
declare sub FCGI_Finish()
declare function FCGI_StartFilterData() as long
declare sub FCGI_SetExitStatus(byval status as long)

#define FCGI_ToFILE(fcgi_file) fcgi_file->stdio_stream
#define FCGI_ToFcgiStream(fcgi_file) fcgi_file->fcgx_stream

#ifdef __FB_WIN32__
	extern import _fcgi_sF(0 to ...) as FCGI_FILE
#else
	extern _fcgi_sF(0 to ...) as FCGI_FILE
#endif

#define FCGI_stdin (@_fcgi_sF[0])
#define FCGI_stdout (@_fcgi_sF[1])
#define FCGI_stderr (@_fcgi_sF[2])

declare sub FCGI_perror(byval str_ as const zstring ptr)
declare function FCGI_fopen(byval path as const zstring ptr, byval mode as const zstring ptr) as FCGI_FILE ptr
declare function FCGI_fclose(byval fp as FCGI_FILE ptr) as long
declare function FCGI_fflush(byval fp as FCGI_FILE ptr) as long
declare function FCGI_freopen(byval path as const zstring ptr, byval mode as const zstring ptr, byval fp as FCGI_FILE ptr) as FCGI_FILE ptr
declare function FCGI_setvbuf(byval fp as FCGI_FILE ptr, byval buf as zstring ptr, byval bufmode as long, byval size as uinteger) as long
declare sub FCGI_setbuf(byval fp as FCGI_FILE ptr, byval buf as zstring ptr)
declare function FCGI_fseek(byval fp as FCGI_FILE ptr, byval offset as clong, byval whence as long) as long
declare function FCGI_ftell(byval fp as FCGI_FILE ptr) as long
declare sub FCGI_rewind(byval fp as FCGI_FILE ptr)
declare function FCGI_fgetc(byval fp as FCGI_FILE ptr) as long
declare function FCGI_getchar() as long
declare function FCGI_ungetc(byval c as long, byval fp as FCGI_FILE ptr) as long
declare function FCGI_fgets(byval str_ as zstring ptr, byval size as long, byval fp as FCGI_FILE ptr) as zstring ptr
declare function FCGI_gets(byval str_ as zstring ptr) as zstring ptr
declare function FCGI_fputc(byval c as long, byval fp as FCGI_FILE ptr) as long
declare function FCGI_putchar(byval c as long) as long
declare function FCGI_fputs(byval str_ as const zstring ptr, byval fp as FCGI_FILE ptr) as long
declare function FCGI_puts(byval str_ as const zstring ptr) as long
declare function FCGI_fprintf(byval fp as FCGI_FILE ptr, byval format as const zstring ptr, ...) as long
declare function FCGI_printf(byval format as const zstring ptr, ...) as long
declare function FCGI_vfprintf(byval fp as FCGI_FILE ptr, byval format as const zstring ptr, byval ap as va_list) as long
declare function FCGI_vprintf(byval format as const zstring ptr, byval ap as va_list) as long
declare function FCGI_fread(byval ptr_ as any ptr, byval size as uinteger, byval nmemb as uinteger, byval fp as FCGI_FILE ptr) as uinteger
declare function FCGI_fwrite(byval ptr_ as any ptr, byval size as uinteger, byval nmemb as uinteger, byval fp as FCGI_FILE ptr) as uinteger
declare function FCGI_feof(byval fp as FCGI_FILE ptr) as long
declare function FCGI_ferror(byval fp as FCGI_FILE ptr) as long
declare sub FCGI_clearerr(byval fp as FCGI_FILE ptr)
declare function FCGI_tmpfile() as FCGI_FILE ptr
declare function FCGI_fileno(byval fp as FCGI_FILE ptr) as long
declare function FCGI_fdopen(byval fd as long, byval mode as const zstring ptr) as FCGI_FILE ptr
declare function FCGI_popen(byval cmd as const zstring ptr, byval type_ as const zstring ptr) as FCGI_FILE ptr
declare function FCGI_pclose(byval as FCGI_FILE ptr) as long

#define FILE FCGI_FILE
#define stdin FCGI_stdin
#define stdout FCGI_stdout
#define stderr FCGI_stderr
#define perror FCGI_perror
#define fopen FCGI_fopen
#define fclose FCGI_fclose
#define fflush FCGI_fflush
#define freopen FCGI_freopen
#define setvbuf FCGI_setvbuf
#define setbuf FCGI_setbuf
#define fseek FCGI_fseek
#define ftell FCGI_ftell
#define rewind FCGI_rewind
#define fgetpos FCGI_fgetpos
#define fsetpos FCGI_fsetpos
#define fgetc FCGI_fgetc
#define getc FCGI_fgetc
#define getchar FCGI_getchar
#define ungetc FCGI_ungetc
#define fgets FCGI_fgets
#define gets FCGI_gets
#define fputc FCGI_fputc
#define putc FCGI_fputc
#define putchar FCGI_putchar
#define fputs FCGI_fputs
#define puts FCGI_puts
#define fprintf FCGI_fprintf
#define printf FCGI_printf
#define vfprintf FCGI_vfprintf
#define vprintf FCGI_vprintf
#define fread FCGI_fread
#define fwrite FCGI_fwrite
#define feof FCGI_feof
#define ferror FCGI_ferror
#define clearerr FCGI_clearerr
#define tmpfile FCGI_tmpfile
#define fileno FCGI_fileno
#define fdopen FCGI_fdopen
#define popen FCGI_popen
#define pclose FCGI_pclose

end extern
