#pragma once

#include once "winapifamily.bi"

'' The following symbols have been renamed:
''     variable ULONG => ULONG_
''     variable INT => INT_

extern "C"

#define _WINBER_DEFINED_
#define WINBERAPI DECLSPEC_IMPORT
#define BERAPI __cdecl
#define LBER_ERROR __MSABI_LONG(&hffffffff)
#define LBER_DEFAULT __MSABI_LONG(&hffffffff)

type ber_tag_t as ulong
type ber_int_t as long
type ber_uint_t as ulong
type ber_len_t as ulong
type ber_slen_t as long

extern     BerElement as DECLSPEC_IMPORT
dim shared BerElement as DECLSPEC_IMPORT

'' TODO: DECLSPEC_IMPORT BerElement *__attribute__((__cdecl__)) ber_init (BERVAL *pBerVal);

extern     VOID as DECLSPEC_IMPORT
dim shared VOID as DECLSPEC_IMPORT

'' TODO: DECLSPEC_IMPORT VOID __attribute__((__cdecl__)) ber_free (BerElement *pBerElement, INT fbuf);
'' TODO: DECLSPEC_IMPORT VOID __attribute__((__cdecl__)) ber_bvfree (BERVAL *pBerVal);
'' TODO: DECLSPEC_IMPORT VOID __attribute__((__cdecl__)) ber_bvecfree (PBERVAL *pBerVal);

extern     BERVAL as DECLSPEC_IMPORT
dim shared BERVAL as DECLSPEC_IMPORT

'' TODO: DECLSPEC_IMPORT BERVAL *__attribute__((__cdecl__)) ber_bvdup (BERVAL *pBerVal);
'' TODO: DECLSPEC_IMPORT BerElement *__attribute__((__cdecl__)) ber_alloc_t (INT options);

extern     ULONG_ alias "ULONG" as DECLSPEC_IMPORT
dim shared ULONG_ as DECLSPEC_IMPORT

'' TODO: DECLSPEC_IMPORT ULONG __attribute__((__cdecl__)) ber_skip_tag (BerElement *pBerElement, ULONG *pLen);
'' TODO: DECLSPEC_IMPORT ULONG __attribute__((__cdecl__)) ber_peek_tag (BerElement *pBerElement, ULONG *pLen);
'' TODO: DECLSPEC_IMPORT ULONG __attribute__((__cdecl__)) ber_first_element (BerElement *pBerElement, ULONG *pLen, CHAR **ppOpaque);
'' TODO: DECLSPEC_IMPORT ULONG __attribute__((__cdecl__)) ber_next_element (BerElement *pBerElement, ULONG *pLen, CHAR *opaque);

extern     INT_ alias "INT" as DECLSPEC_IMPORT
dim shared INT_ as DECLSPEC_IMPORT

'' TODO: DECLSPEC_IMPORT INT __attribute__((__cdecl__)) ber_flatten (BerElement *pBerElement, PBERVAL *pBerVal);
'' TODO: DECLSPEC_IMPORT INT __attribute__((__cdecl__)) ber_printf (BerElement *pBerElement, PSTR fmt,...);
'' TODO: DECLSPEC_IMPORT ULONG __attribute__((__cdecl__)) ber_scanf (BerElement *pBerElement, PSTR fmt,...);

end extern
