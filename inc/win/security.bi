#pragma once

#include once "crt/wchar.bi"
#include once "_mingw_unicode.bi"
#include once "sspi.bi"
#include once "secext.bi"

'' The following symbols have been renamed:
''     enum constant Unlock => Unlock_

#define NTLMSP_NAME_A "NTLM"
#define NTLMSP_NAME wstr("NTLM")
#define MICROSOFT_KERBEROS_NAME_A "Kerberos"
#define MICROSOFT_KERBEROS_NAME_W wstr("Kerberos")
#define MICROSOFT_KERBEROS_NAME MICROSOFT_KERBEROS_NAME_W
#define NEGOSSP_NAME_W wstr("Negotiate")
#define NEGOSSP_NAME_A "Negotiate"
#define NEGOSSP_NAME __MINGW_NAME_UAW(NEGOSSP_NAME)
