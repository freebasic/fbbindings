'freebasic bindings for llhttp library-9.2.1
'based on c header files:
'Port of http_parser to llparse.
'This software is licensed under the MIT License.
'Copyright Fedor Indutny, 2018.
'Permission is hereby granted, free of charge, to any
'person obtaining a copy of this software and associated
'documentation files (the "Software"), to deal in the Software
'without restriction, including without limitation the rights 
'to use, copy, modify, merge, publish, distribute, sublicense, 
'and/or sell copies of the Software, and to permit persons to 
'whom the Software is furnished to do so, subject to the following conditions:
'The above copyright notice and this permission notice shall be included 
'in all copies or substantial portions of the Software.
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
'EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
'MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
'IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, 
'DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
'ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
''DEALINGS IN THE SOFTWARE.
'' translated to FreeBASIC by:
''  FreeBASIC development team

#pragma once
#ifndef INCLUDE_LLHTTP_H_

#define INCLUDE_LLHTTP_H_
#include once "crt/stdint.bi"
#include once "crt/stddef.bi"
#inclib "llhttp"

extern "C"

const LLHTTP_VERSION_MAJOR = 9
const LLHTTP_VERSION_MINOR = 2
const LLHTTP_VERSION_PATCH = 1

#define INCLUDE_LLHTTP_ITSELF_H_

Type llhttp__internal_t As llhttp__internal_s

type llhttp__internal_s
   _index as long
   _span_pos0 as any ptr
   _span_cb0 as any ptr
   error_ as long
   reason As Const ZString Ptr
   error_pos as const zstring ptr
   data_ As Any Ptr
   _current as any ptr
   content_length as ulongint
   type_ as ubyte
   method as ubyte
   http_major as ubyte
   http_minor as ubyte
   header_state as ubyte
   lenient_flags as ushort
   upgrade as ubyte
   finish As UByte
   FLAGS As UShort
   status_code as ushort
   initial_message_completed as ubyte
   settings As Any Ptr
End Type

declare function llhttp__internal_init(byval s as llhttp__internal_t ptr) as long
declare function llhttp__internal_execute(byval s as llhttp__internal_t ptr, byval p as const zstring ptr, byval endp as const zstring ptr) as long

#define LLLLHTTP_C_HEADERS_

Type llhttp_errno As Long
enum
   HPE_OK = 0
   HPE_INTERNAL = 1
   HPE_STRICT = 2
   HPE_CR_EXPECTED = 25
   HPE_LF_EXPECTED = 3
   HPE_UNEXPECTED_CONTENT_LENGTH = 4
   HPE_UNEXPECTED_SPACE = 30
   HPE_CLOSED_CONNECTION = 5
   HPE_INVALID_METHOD = 6
   HPE_INVALID_URL = 7
   HPE_INVALID_CONSTANT = 8
   HPE_INVALID_VERSION = 9
   HPE_INVALID_HEADER_TOKEN = 10
   HPE_INVALID_CONTENT_LENGTH = 11
   HPE_INVALID_CHUNK_SIZE = 12
   HPE_INVALID_STATUS = 13
   HPE_INVALID_EOF_STATE = 14
   HPE_INVALID_TRANSFER_ENCODING = 15
   HPE_CB_MESSAGE_BEGIN = 16
   HPE_CB_HEADERS_COMPLETE = 17
   HPE_CB_MESSAGE_COMPLETE = 18
   HPE_CB_CHUNK_HEADER = 19
   HPE_CB_CHUNK_COMPLETE = 20
   HPE_PAUSED = 21
   HPE_PAUSED_UPGRADE = 22
   HPE_PAUSED_H2_UPGRADE = 23
   HPE_USER = 24
   HPE_CB_URL_COMPLETE = 26
   HPE_CB_STATUS_COMPLETE = 27
   HPE_CB_METHOD_COMPLETE = 32
   HPE_CB_VERSION_COMPLETE = 33
   HPE_CB_HEADER_FIELD_COMPLETE = 28
   HPE_CB_HEADER_VALUE_COMPLETE = 29
   HPE_CB_CHUNK_EXTENSION_NAME_COMPLETE = 34
   HPE_CB_CHUNK_EXTENSION_VALUE_COMPLETE = 35
   HPE_CB_RESET = 31
end enum

Type llhttp_errno_t As llhttp_errno

type llhttp_flags as long
enum
   F_CONNECTION_KEEP_ALIVE = &h1
   F_CONNECTION_CLOSE = &h2
   F_CONNECTION_UPGRADE = &h4
   F_CHUNKED = &h8
   F_UPGRADE = &h10
   F_CONTENT_LENGTH = &h20
   F_SKIPBODY = &h40
   F_TRAILING = &h80
   F_TRANSFER_ENCODING = &h200
end enum

Type llhttp_flags_t As llhttp_flags

type llhttp_lenient_flags as long
enum
   LENIENT_HEADERS = &h1
   LENIENT_CHUNKED_LENGTH = &h2
   LENIENT_KEEP_ALIVE = &h4
   LENIENT_TRANSFER_ENCODING = &h8
   LENIENT_VERSION = &h10
   LENIENT_DATA_AFTER_CLOSE = &h20
   LENIENT_OPTIONAL_LF_AFTER_CR = &h40
   LENIENT_OPTIONAL_CRLF_AFTER_CHUNK = &h80
   LENIENT_OPTIONAL_CR_BEFORE_LF = &h100
   LENIENT_SPACES_AFTER_CHUNK_SIZE = &h200
end enum

Type llhttp_lenient_flags_t As llhttp_lenient_flags

Type llhttp_type As Long
enum
   HTTP_BOTH = 0
   HTTP_REQUEST = 1
   HTTP_RESPONSE = 2
end enum

Type llhttp_type_t As llhttp_type

type llhttp_finish as long
enum
   HTTP_FINISH_SAFE = 0
   HTTP_FINISH_SAFE_WITH_CB = 1
   HTTP_FINISH_UNSAFE = 2
end enum

type llhttp_finish_t as llhttp_finish

type llhttp_method as long
enum
   HTTP_DELETE = 0
   _Http_Get = 1
   HTTP_HEAD = 2
   _Http_Post = 3
   HTTP_PUT = 4
   HTTP_CONNECT = 5
   HTTP_OPTIONS = 6
   HTTP_TRACE = 7
   HTTP_COPY = 8
   HTTP_LOCK = 9
   HTTP_MKCOL = 10
   HTTP_MOVE = 11
   HTTP_PROPFIND = 12
   HTTP_PROPPATCH = 13
   HTTP_SEARCH = 14
   HTTP_UNLOCK = 15
   HTTP_BIND = 16
   HTTP_REBIND = 17
   HTTP_UNBIND = 18
   HTTP_ACL = 19
   HTTP_REPORT = 20
   HTTP_MKACTIVITY = 21
   HTTP_CHECKOUT = 22
   HTTP_MERGE = 23
   HTTP_MSEARCH = 24
   HTTP_NOTIFY = 25
   HTTP_SUBSCRIBE = 26
   HTTP_UNSUBSCRIBE = 27
   HTTP_PATCH = 28
   HTTP_PURGE = 29
   HTTP_MKCALENDAR = 30
   HTTP_LINK = 31
   HTTP_UNLINK = 32
   HTTP_SOURCE = 33
   HTTP_PRI = 34
   HTTP_DESCRIBE = 35
   HTTP_ANNOUNCE = 36
   HTTP_SETUP = 37
   HTTP_PLAY = 38
   HTTP_PAUSE = 39
   HTTP_TEARDOWN = 40
   HTTP_GET_PARAMETER = 41
   HTTP_SET_PARAMETER = 42
   HTTP_REDIRECT = 43
   HTTP_RECORD = 44
   HTTP_FLUSH = 45
   HTTP_QUERY = 46
end enum

Type llhttp_method_t As llhttp_method

type llhttp_status as long
enum
   HTTP_STATUS_CONTINUE = 100
   HTTP_STATUS_SWITCHING_PROTOCOLS = 101
   HTTP_STATUS_PROCESSING = 102
   HTTP_STATUS_EARLY_HINTS = 103
   HTTP_STATUS_RESPONSE_IS_STALE = 110
   HTTP_STATUS_REVALIDATION_FAILED = 111
   HTTP_STATUS_DISCONNECTED_OPERATION = 112
   HTTP_STATUS_HEURISTIC_EXPIRATION = 113
   HTTP_STATUS_MISCELLANEOUS_WARNING = 199
   HTTP_STATUS_OK = 200
   HTTP_STATUS_CREATED = 201
   HTTP_STATUS_ACCEPTED = 202
   HTTP_STATUS_NON_AUTHORITATIVE_INFORMATION = 203
   HTTP_STATUS_NO_CONTENT = 204
   HTTP_STATUS_RESET_CONTENT = 205
   HTTP_STATUS_PARTIAL_CONTENT = 206
   HTTP_STATUS_MULTI_STATUS = 207
   HTTP_STATUS_ALREADY_REPORTED = 208
   HTTP_STATUS_TRANSFORMATION_APPLIED = 214
   HTTP_STATUS_IM_USED = 226
   HTTP_STATUS_MISCELLANEOUS_PERSISTENT_WARNING = 299
   HTTP_STATUS_MULTIPLE_CHOICES = 300
   HTTP_STATUS_MOVED_PERMANENTLY = 301
   HTTP_STATUS_FOUND = 302
   HTTP_STATUS_SEE_OTHER = 303
   HTTP_STATUS_NOT_MODIFIED = 304
   HTTP_STATUS_USE_PROXY = 305
   HTTP_STATUS_SWITCH_PROXY = 306
   HTTP_STATUS_TEMPORARY_REDIRECT = 307
   HTTP_STATUS_PERMANENT_REDIRECT = 308
   HTTP_STATUS_BAD_REQUEST = 400
   HTTP_STATUS_UNAUTHORIZED = 401
   HTTP_STATUS_PAYMENT_REQUIRED = 402
   HTTP_STATUS_FORBIDDEN = 403
   HTTP_STATUS_NOT_FOUND = 404
   HTTP_STATUS_METHOD_NOT_ALLOWED = 405
   HTTP_STATUS_NOT_ACCEPTABLE = 406
   HTTP_STATUS_PROXY_AUTHENTICATION_REQUIRED = 407
   HTTP_STATUS_REQUEST_TIMEOUT = 408
   HTTP_STATUS_CONFLICT = 409
   HTTP_STATUS_GONE = 410
   HTTP_STATUS_LENGTH_REQUIRED = 411
   HTTP_STATUS_PRECONDITION_FAILED = 412
   HTTP_STATUS_PAYLOAD_TOO_LARGE = 413
   HTTP_STATUS_URI_TOO_LONG = 414
   HTTP_STATUS_UNSUPPORTED_MEDIA_TYPE = 415
   HTTP_STATUS_RANGE_NOT_SATISFIABLE = 416
   HTTP_STATUS_EXPECTATION_FAILED = 417
   HTTP_STATUS_IM_A_TEAPOT = 418
   HTTP_STATUS_PAGE_EXPIRED = 419
   HTTP_STATUS_ENHANCE_YOUR_CALM = 420
   HTTP_STATUS_MISDIRECTED_REQUEST = 421
   HTTP_STATUS_UNPROCESSABLE_ENTITY = 422
   HTTP_STATUS_LOCKED = 423
   HTTP_STATUS_FAILED_DEPENDENCY = 424
   HTTP_STATUS_TOO_EARLY = 425
   HTTP_STATUS_UPGRADE_REQUIRED = 426
   HTTP_STATUS_PRECONDITION_REQUIRED = 428
   HTTP_STATUS_TOO_MANY_REQUESTS = 429
   HTTP_STATUS_REQUEST_HEADER_FIELDS_TOO_LARGE_UNOFFICIAL = 430
   HTTP_STATUS_REQUEST_HEADER_FIELDS_TOO_LARGE = 431
   HTTP_STATUS_LOGIN_TIMEOUT = 440
   HTTP_STATUS_NO_RESPONSE = 444
   HTTP_STATUS_RETRY_WITH = 449
   HTTP_STATUS_BLOCKED_BY_PARENTAL_CONTROL = 450
   HTTP_STATUS_UNAVAILABLE_FOR_LEGAL_REASONS = 451
   HTTP_STATUS_CLIENT_CLOSED_LOAD_BALANCED_REQUEST = 460
   HTTP_STATUS_INVALID_X_FORWARDED_FOR = 463
   HTTP_STATUS_REQUEST_HEADER_TOO_LARGE = 494
   HTTP_STATUS_SSL_CERTIFICATE_ERROR = 495
   HTTP_STATUS_SSL_CERTIFICATE_REQUIRED = 496
   HTTP_STATUS_HTTP_REQUEST_SENT_TO_HTTPS_PORT = 497
   HTTP_STATUS_INVALID_TOKEN = 498
   HTTP_STATUS_CLIENT_CLOSED_REQUEST = 499
   HTTP_STATUS_INTERNAL_SERVER_ERROR = 500
   HTTP_STATUS_NOT_IMPLEMENTED = 501
   HTTP_STATUS_BAD_GATEWAY = 502
   HTTP_STATUS_SERVICE_UNAVAILABLE = 503
   HTTP_STATUS_GATEWAY_TIMEOUT = 504
   HTTP_STATUS_HTTP_VERSION_NOT_SUPPORTED = 505
   HTTP_STATUS_VARIANT_ALSO_NEGOTIATES = 506
   HTTP_STATUS_INSUFFICIENT_STORAGE = 507
   HTTP_STATUS_LOOP_DETECTED = 508
   HTTP_STATUS_BANDWIDTH_LIMIT_EXCEEDED = 509
   HTTP_STATUS_NOT_EXTENDED = 510
   HTTP_STATUS_NETWORK_AUTHENTICATION_REQUIRED = 511
   HTTP_STATUS_WEB_SERVER_UNKNOWN_ERROR = 520
   HTTP_STATUS_WEB_SERVER_IS_DOWN = 521
   HTTP_STATUS_CONNECTION_TIMEOUT = 522
   HTTP_STATUS_ORIGIN_IS_UNREACHABLE = 523
   HTTP_STATUS_TIMEOUT_OCCURED = 524
   HTTP_STATUS_SSL_HANDSHAKE_FAILED = 525
   HTTP_STATUS_INVALID_SSL_CERTIFICATE = 526
   HTTP_STATUS_RAILGUN_ERROR = 527
   HTTP_STATUS_SITE_IS_OVERLOADED = 529
   HTTP_STATUS_SITE_IS_FROZEN = 530
   HTTP_STATUS_IDENTITY_PROVIDER_AUTHENTICATION_ERROR = 561
   HTTP_STATUS_NETWORK_READ_TIMEOUT = 598
   HTTP_STATUS_NETWORK_CONNECT_TIMEOUT = 599
end enum

Type llhttp_status_t As llhttp_status

Enum 
    RTSP_METHOD_GET = 1
    RTSP_METHOD_POST = 3
    RTSP_METHOD_OPTIONS = 6
    RTSP_METHOD_DESCRIBE = 35
    RTSP_METHOD_ANNOUNCE = 36
    RTSP_METHOD_SETUP = 37
    RTSP_METHOD_PLAY = 38
    RTSP_METHOD_PAUSE = 39
    RTSP_METHOD_TEARDOWN = 40
    RTSP_METHOD_GET_PARAMETER = 41
    RTSP_METHOD_SET_PARAMETER = 42
    RTSP_METHOD_REDIRECT = 43
    RTSP_METHOD_RECORD = 44
    RTSP_METHOD_FLUSH = 45
End Enum


Type llhttp_t As llhttp__internal_t
Type llhttp_settings_t As llhttp_settings_s
Type llhttp_data_cb As Function(ByVal As llhttp_t Ptr, ByVal at As Const ZString Ptr, ByVal length As UInteger) As Long
type llhttp_cb as function(byval as llhttp_t ptr) as long

type llhttp_settings_s
   on_message_begin as llhttp_cb
   on_url as llhttp_data_cb
   on_status as llhttp_data_cb
   on_method as llhttp_data_cb
   on_version as llhttp_data_cb
   on_header_field as llhttp_data_cb
   on_header_value as llhttp_data_cb
   on_chunk_extension_name as llhttp_data_cb
   on_chunk_extension_value as llhttp_data_cb
   on_headers_complete as llhttp_cb
   on_body as llhttp_data_cb
   on_message_complete as llhttp_cb
   on_url_complete as llhttp_cb
   on_status_complete as llhttp_cb
   on_method_complete as llhttp_cb
   on_version_complete as llhttp_cb
   on_header_field_complete as llhttp_cb
   on_header_value_complete as llhttp_cb
   on_chunk_extension_name_complete As llhttp_cb
   on_chunk_extension_value_complete as llhttp_cb
   on_chunk_header As llhttp_cb
   on_chunk_complete As llhttp_cb
   on_reset As llhttp_cb
end type

declare sub llhttp_init(byval parser as llhttp_t ptr, byval type_ as llhttp_type_t, byval settings as const llhttp_settings_t ptr)
declare function llhttp_alloc(byval type_ as llhttp_type_t) as llhttp_t ptr
declare sub llhttp_free(byval parser as llhttp_t ptr)
declare function llhttp_get_type(byval parser as llhttp_t ptr) as ubyte
declare function llhttp_get_http_major(byval parser as llhttp_t ptr) as ubyte
Declare Function llhttp_get_http_minor(ByVal parser As llhttp_t Ptr) As UByte
declare function llhttp_get_method(byval parser as llhttp_t ptr) as ubyte
declare function llhttp_get_status_code(byval parser as llhttp_t ptr) as long
declare function llhttp_get_upgrade(byval parser as llhttp_t ptr) as ubyte
declare sub llhttp_reset(byval parser as llhttp_t ptr)
declare sub llhttp_settings_init(byval settings as llhttp_settings_t ptr)
Declare Function llhttp_execute(ByVal parser As llhttp_t Ptr, ByVal data_ As Const ZString Ptr, ByVal len_ As UInteger) As llhttp_errno_t
Declare Function llhttp_finish(ByVal parser As llhttp_t Ptr) As llhttp_errno_t
declare function llhttp_message_needs_eof(byval parser as const llhttp_t ptr) as long
declare function llhttp_should_keep_alive(byval parser as const llhttp_t ptr) as long
declare sub llhttp_pause(byval parser as llhttp_t ptr)
declare sub llhttp_resume(byval parser as llhttp_t ptr)
declare sub llhttp_resume_after_upgrade(byval parser as llhttp_t ptr)
declare function llhttp_get_errno(byval parser as const llhttp_t ptr) as llhttp_errno_t
Declare Function llhttp_get_error_reason(ByVal parser As Const llhttp_t Ptr) As Const ZString Ptr
Declare Sub llhttp_set_error_reason(ByVal parser As llhttp_t Ptr, ByVal reason As Const ZString Ptr)
declare function llhttp_get_error_pos(byval parser as const llhttp_t ptr) as const zstring ptr
Declare Function llhttp_errno_name(ByVal err_ As llhttp_errno_t) As Const ZString Ptr
declare function llhttp_method_name(byval method as llhttp_method_t) as const zstring ptr
declare function llhttp_status_name(byval status as llhttp_status_t) as const zstring ptr
declare sub llhttp_set_lenient_headers(byval parser as llhttp_t ptr, byval enabled as long)
declare sub llhttp_set_lenient_chunked_length(byval parser as llhttp_t ptr, byval enabled as long)
declare sub llhttp_set_lenient_keep_alive(byval parser as llhttp_t ptr, byval enabled as long)
declare sub llhttp_set_lenient_transfer_encoding(byval parser as llhttp_t ptr, byval enabled as long)
declare sub llhttp_set_lenient_version(byval parser as llhttp_t ptr, byval enabled as long)
declare sub llhttp_set_lenient_data_after_close(byval parser as llhttp_t ptr, byval enabled as long)
declare sub llhttp_set_lenient_optional_lf_after_cr(byval parser as llhttp_t ptr, byval enabled as long)
declare sub llhttp_set_lenient_optional_cr_before_lf(byval parser as llhttp_t ptr, byval enabled as long)
declare sub llhttp_set_lenient_optional_crlf_after_chunk(byval parser as llhttp_t ptr, byval enabled as long)
declare sub llhttp_set_lenient_spaces_after_chunk_size(byval parser as llhttp_t ptr, byval enabled as long)

end extern
#endif