'' wingdi headers #define OPAQUE which commonly causes conflicts with zlib.bi
'' which uses "opaque" as identifier
#define OPAQUE 2

#include "zlib.bi"
