#pragma once

#include once "crt/long.bi"
#include once "crt/stdlib.bi"

extern "C"

const Expat_INCLUDED = 1
const Expat_External_INCLUDED = 1

#ifdef XML_UNICODE
	type XML_Char as wstring
	type XML_LChar as wstring
#else
	type XML_Char as zstring
	type XML_LChar as zstring
#endif

type XML_Index as clong
type XML_Size as culong
type XML_Parser as XML_ParserStruct ptr
type XML_Bool as ubyte
const XML_TRUE = cast(XML_Bool, 1)
const XML_FALSE = cast(XML_Bool, 0)

type XML_Status as long
enum
	XML_STATUS_ERROR = 0
	XML_STATUS_OK = 1
	XML_STATUS_SUSPENDED = 2
end enum

type XML_Error as long
enum
	XML_ERROR_NONE
	XML_ERROR_NO_MEMORY
	XML_ERROR_SYNTAX
	XML_ERROR_NO_ELEMENTS
	XML_ERROR_INVALID_TOKEN
	XML_ERROR_UNCLOSED_TOKEN
	XML_ERROR_PARTIAL_CHAR
	XML_ERROR_TAG_MISMATCH
	XML_ERROR_DUPLICATE_ATTRIBUTE
	XML_ERROR_JUNK_AFTER_DOC_ELEMENT
	XML_ERROR_PARAM_ENTITY_REF
	XML_ERROR_UNDEFINED_ENTITY
	XML_ERROR_RECURSIVE_ENTITY_REF
	XML_ERROR_ASYNC_ENTITY
	XML_ERROR_BAD_CHAR_REF
	XML_ERROR_BINARY_ENTITY_REF
	XML_ERROR_ATTRIBUTE_EXTERNAL_ENTITY_REF
	XML_ERROR_MISPLACED_XML_PI
	XML_ERROR_UNKNOWN_ENCODING
	XML_ERROR_INCORRECT_ENCODING
	XML_ERROR_UNCLOSED_CDATA_SECTION
	XML_ERROR_EXTERNAL_ENTITY_HANDLING
	XML_ERROR_NOT_STANDALONE
	XML_ERROR_UNEXPECTED_STATE
	XML_ERROR_ENTITY_DECLARED_IN_PE
	XML_ERROR_FEATURE_REQUIRES_XML_DTD
	XML_ERROR_CANT_CHANGE_FEATURE_ONCE_PARSING
	XML_ERROR_UNBOUND_PREFIX
	XML_ERROR_UNDECLARING_PREFIX
	XML_ERROR_INCOMPLETE_PE
	XML_ERROR_XML_DECL
	XML_ERROR_TEXT_DECL
	XML_ERROR_PUBLICID
	XML_ERROR_SUSPENDED
	XML_ERROR_NOT_SUSPENDED
	XML_ERROR_ABORTED
	XML_ERROR_FINISHED
	XML_ERROR_SUSPEND_PE
	XML_ERROR_RESERVED_PREFIX_XML
	XML_ERROR_RESERVED_PREFIX_XMLNS
	XML_ERROR_RESERVED_NAMESPACE_URI
end enum

type XML_Content_Type as long
enum
	XML_CTYPE_EMPTY = 1
	XML_CTYPE_ANY
	XML_CTYPE_MIXED
	XML_CTYPE_NAME
	XML_CTYPE_CHOICE
	XML_CTYPE_SEQ
end enum

type XML_Content_Quant as long
enum
	XML_CQUANT_NONE
	XML_CQUANT_OPT
	XML_CQUANT_REP
	XML_CQUANT_PLUS
end enum

type XML_Content as XML_cp

type XML_cp
	as XML_Content_Type type
	quant as XML_Content_Quant

	#ifdef XML_UNICODE
		name as wstring ptr
	#else
		name as zstring ptr
	#endif

	numchildren as ulong
	children as XML_Content ptr
end type

#ifdef XML_UNICODE
	type XML_ElementDeclHandler as sub(byval userData as any ptr, byval name as const wstring ptr, byval model as XML_Content ptr)
#else
	type XML_ElementDeclHandler as sub(byval userData as any ptr, byval name as const zstring ptr, byval model as XML_Content ptr)
#endif

declare sub XML_SetElementDeclHandler(byval parser as XML_Parser, byval eldecl as XML_ElementDeclHandler)

#ifdef XML_UNICODE
	type XML_AttlistDeclHandler as sub(byval userData as any ptr, byval elname as const wstring ptr, byval attname as const wstring ptr, byval att_type as const wstring ptr, byval dflt as const wstring ptr, byval isrequired as long)
#else
	type XML_AttlistDeclHandler as sub(byval userData as any ptr, byval elname as const zstring ptr, byval attname as const zstring ptr, byval att_type as const zstring ptr, byval dflt as const zstring ptr, byval isrequired as long)
#endif

declare sub XML_SetAttlistDeclHandler(byval parser as XML_Parser, byval attdecl as XML_AttlistDeclHandler)

#ifdef XML_UNICODE
	type XML_XmlDeclHandler as sub(byval userData as any ptr, byval version as const wstring ptr, byval encoding as const wstring ptr, byval standalone as long)
#else
	type XML_XmlDeclHandler as sub(byval userData as any ptr, byval version as const zstring ptr, byval encoding as const zstring ptr, byval standalone as long)
#endif

declare sub XML_SetXmlDeclHandler(byval parser as XML_Parser, byval xmldecl as XML_XmlDeclHandler)

type XML_Memory_Handling_Suite
	malloc_fcn as function(byval size as uinteger) as any ptr
	realloc_fcn as function(byval ptr as any ptr, byval size as uinteger) as any ptr
	free_fcn as sub(byval ptr as any ptr)
end type

#ifdef XML_UNICODE
	declare function XML_ParserCreate(byval encoding as const wstring ptr) as XML_Parser
	declare function XML_ParserCreateNS(byval encoding as const wstring ptr, byval namespaceSeparator as wchar_t) as XML_Parser
	declare function XML_ParserCreate_MM(byval encoding as const wstring ptr, byval memsuite as const XML_Memory_Handling_Suite ptr, byval namespaceSeparator as const wstring ptr) as XML_Parser
	declare function XML_ParserReset(byval parser as XML_Parser, byval encoding as const wstring ptr) as XML_Bool

	type XML_StartElementHandler as sub(byval userData as any ptr, byval name as const wstring ptr, byval atts as const wstring ptr ptr)
	type XML_EndElementHandler as sub(byval userData as any ptr, byval name as const wstring ptr)
	type XML_CharacterDataHandler as sub(byval userData as any ptr, byval s as const wstring ptr, byval len as long)
	type XML_ProcessingInstructionHandler as sub(byval userData as any ptr, byval target as const wstring ptr, byval data as const wstring ptr)
	type XML_CommentHandler as sub(byval userData as any ptr, byval data as const wstring ptr)
#else
	declare function XML_ParserCreate(byval encoding as const zstring ptr) as XML_Parser
	declare function XML_ParserCreateNS(byval encoding as const zstring ptr, byval namespaceSeparator as byte) as XML_Parser
	declare function XML_ParserCreate_MM(byval encoding as const zstring ptr, byval memsuite as const XML_Memory_Handling_Suite ptr, byval namespaceSeparator as const zstring ptr) as XML_Parser
	declare function XML_ParserReset(byval parser as XML_Parser, byval encoding as const zstring ptr) as XML_Bool

	type XML_StartElementHandler as sub(byval userData as any ptr, byval name as const zstring ptr, byval atts as const zstring ptr ptr)
	type XML_EndElementHandler as sub(byval userData as any ptr, byval name as const zstring ptr)
	type XML_CharacterDataHandler as sub(byval userData as any ptr, byval s as const zstring ptr, byval len as long)
	type XML_ProcessingInstructionHandler as sub(byval userData as any ptr, byval target as const zstring ptr, byval data as const zstring ptr)
	type XML_CommentHandler as sub(byval userData as any ptr, byval data as const zstring ptr)
#endif

type XML_StartCdataSectionHandler as sub(byval userData as any ptr)
type XML_EndCdataSectionHandler as sub(byval userData as any ptr)

#ifdef XML_UNICODE
	type XML_DefaultHandler as sub(byval userData as any ptr, byval s as const wstring ptr, byval len as long)
	type XML_StartDoctypeDeclHandler as sub(byval userData as any ptr, byval doctypeName as const wstring ptr, byval sysid as const wstring ptr, byval pubid as const wstring ptr, byval has_internal_subset as long)
#else
	type XML_DefaultHandler as sub(byval userData as any ptr, byval s as const zstring ptr, byval len as long)
	type XML_StartDoctypeDeclHandler as sub(byval userData as any ptr, byval doctypeName as const zstring ptr, byval sysid as const zstring ptr, byval pubid as const zstring ptr, byval has_internal_subset as long)
#endif

type XML_EndDoctypeDeclHandler as sub(byval userData as any ptr)

#ifdef XML_UNICODE
	type XML_EntityDeclHandler as sub(byval userData as any ptr, byval entityName as const wstring ptr, byval is_parameter_entity as long, byval value as const wstring ptr, byval value_length as long, byval base as const wstring ptr, byval systemId as const wstring ptr, byval publicId as const wstring ptr, byval notationName as const wstring ptr)
#else
	type XML_EntityDeclHandler as sub(byval userData as any ptr, byval entityName as const zstring ptr, byval is_parameter_entity as long, byval value as const zstring ptr, byval value_length as long, byval base as const zstring ptr, byval systemId as const zstring ptr, byval publicId as const zstring ptr, byval notationName as const zstring ptr)
#endif

declare sub XML_SetEntityDeclHandler(byval parser as XML_Parser, byval handler as XML_EntityDeclHandler)

#ifdef XML_UNICODE
	type XML_UnparsedEntityDeclHandler as sub(byval userData as any ptr, byval entityName as const wstring ptr, byval base as const wstring ptr, byval systemId as const wstring ptr, byval publicId as const wstring ptr, byval notationName as const wstring ptr)
	type XML_NotationDeclHandler as sub(byval userData as any ptr, byval notationName as const wstring ptr, byval base as const wstring ptr, byval systemId as const wstring ptr, byval publicId as const wstring ptr)
	type XML_StartNamespaceDeclHandler as sub(byval userData as any ptr, byval prefix as const wstring ptr, byval uri as const wstring ptr)
	type XML_EndNamespaceDeclHandler as sub(byval userData as any ptr, byval prefix as const wstring ptr)
#else
	type XML_UnparsedEntityDeclHandler as sub(byval userData as any ptr, byval entityName as const zstring ptr, byval base as const zstring ptr, byval systemId as const zstring ptr, byval publicId as const zstring ptr, byval notationName as const zstring ptr)
	type XML_NotationDeclHandler as sub(byval userData as any ptr, byval notationName as const zstring ptr, byval base as const zstring ptr, byval systemId as const zstring ptr, byval publicId as const zstring ptr)
	type XML_StartNamespaceDeclHandler as sub(byval userData as any ptr, byval prefix as const zstring ptr, byval uri as const zstring ptr)
	type XML_EndNamespaceDeclHandler as sub(byval userData as any ptr, byval prefix as const zstring ptr)
#endif

type XML_NotStandaloneHandler as function(byval userData as any ptr) as long

#ifdef XML_UNICODE
	type XML_ExternalEntityRefHandler as function(byval parser as XML_Parser, byval context as const wstring ptr, byval base as const wstring ptr, byval systemId as const wstring ptr, byval publicId as const wstring ptr) as long
	type XML_SkippedEntityHandler as sub(byval userData as any ptr, byval entityName as const wstring ptr, byval is_parameter_entity as long)
#else
	type XML_ExternalEntityRefHandler as function(byval parser as XML_Parser, byval context as const zstring ptr, byval base as const zstring ptr, byval systemId as const zstring ptr, byval publicId as const zstring ptr) as long
	type XML_SkippedEntityHandler as sub(byval userData as any ptr, byval entityName as const zstring ptr, byval is_parameter_entity as long)
#endif

type XML_Encoding
	map(0 to 255) as long
	data as any ptr
	convert as function(byval data as any ptr, byval s as const zstring ptr) as long
	release as sub(byval data as any ptr)
end type

#ifdef XML_UNICODE
	type XML_UnknownEncodingHandler as function(byval encodingHandlerData as any ptr, byval name as const wstring ptr, byval info as XML_Encoding ptr) as long
#else
	type XML_UnknownEncodingHandler as function(byval encodingHandlerData as any ptr, byval name as const zstring ptr, byval info as XML_Encoding ptr) as long
#endif

declare sub XML_SetElementHandler(byval parser as XML_Parser, byval start as XML_StartElementHandler, byval end as XML_EndElementHandler)
declare sub XML_SetStartElementHandler(byval parser as XML_Parser, byval handler as XML_StartElementHandler)
declare sub XML_SetEndElementHandler(byval parser as XML_Parser, byval handler as XML_EndElementHandler)
declare sub XML_SetCharacterDataHandler(byval parser as XML_Parser, byval handler as XML_CharacterDataHandler)
declare sub XML_SetProcessingInstructionHandler(byval parser as XML_Parser, byval handler as XML_ProcessingInstructionHandler)
declare sub XML_SetCommentHandler(byval parser as XML_Parser, byval handler as XML_CommentHandler)
declare sub XML_SetCdataSectionHandler(byval parser as XML_Parser, byval start as XML_StartCdataSectionHandler, byval end as XML_EndCdataSectionHandler)
declare sub XML_SetStartCdataSectionHandler(byval parser as XML_Parser, byval start as XML_StartCdataSectionHandler)
declare sub XML_SetEndCdataSectionHandler(byval parser as XML_Parser, byval end as XML_EndCdataSectionHandler)
declare sub XML_SetDefaultHandler(byval parser as XML_Parser, byval handler as XML_DefaultHandler)
declare sub XML_SetDefaultHandlerExpand(byval parser as XML_Parser, byval handler as XML_DefaultHandler)
declare sub XML_SetDoctypeDeclHandler(byval parser as XML_Parser, byval start as XML_StartDoctypeDeclHandler, byval end as XML_EndDoctypeDeclHandler)
declare sub XML_SetStartDoctypeDeclHandler(byval parser as XML_Parser, byval start as XML_StartDoctypeDeclHandler)
declare sub XML_SetEndDoctypeDeclHandler(byval parser as XML_Parser, byval end as XML_EndDoctypeDeclHandler)
declare sub XML_SetUnparsedEntityDeclHandler(byval parser as XML_Parser, byval handler as XML_UnparsedEntityDeclHandler)
declare sub XML_SetNotationDeclHandler(byval parser as XML_Parser, byval handler as XML_NotationDeclHandler)
declare sub XML_SetNamespaceDeclHandler(byval parser as XML_Parser, byval start as XML_StartNamespaceDeclHandler, byval end as XML_EndNamespaceDeclHandler)
declare sub XML_SetStartNamespaceDeclHandler(byval parser as XML_Parser, byval start as XML_StartNamespaceDeclHandler)
declare sub XML_SetEndNamespaceDeclHandler(byval parser as XML_Parser, byval end as XML_EndNamespaceDeclHandler)
declare sub XML_SetNotStandaloneHandler(byval parser as XML_Parser, byval handler as XML_NotStandaloneHandler)
declare sub XML_SetExternalEntityRefHandler(byval parser as XML_Parser, byval handler as XML_ExternalEntityRefHandler)
declare sub XML_SetExternalEntityRefHandlerArg(byval parser as XML_Parser, byval arg as any ptr)
declare sub XML_SetSkippedEntityHandler(byval parser as XML_Parser, byval handler as XML_SkippedEntityHandler)
declare sub XML_SetUnknownEncodingHandler(byval parser as XML_Parser, byval handler as XML_UnknownEncodingHandler, byval encodingHandlerData as any ptr)
declare sub XML_DefaultCurrent(byval parser as XML_Parser)
declare sub XML_SetReturnNSTriplet(byval parser as XML_Parser, byval do_nst as long)
declare sub XML_SetUserData(byval parser as XML_Parser, byval userData as any ptr)
#define XML_GetUserData(parser) (*cptr(any ptr ptr, (parser)))

#ifdef XML_UNICODE
	declare function XML_SetEncoding(byval parser as XML_Parser, byval encoding as const wstring ptr) as XML_Status
#else
	declare function XML_SetEncoding(byval parser as XML_Parser, byval encoding as const zstring ptr) as XML_Status
#endif

declare sub XML_UseParserAsHandlerArg(byval parser as XML_Parser)
declare function XML_UseForeignDTD(byval parser as XML_Parser, byval useDTD as XML_Bool) as XML_Error

#ifdef XML_UNICODE
	declare function XML_SetBase(byval parser as XML_Parser, byval base as const wstring ptr) as XML_Status
	declare function XML_GetBase(byval parser as XML_Parser) as const wstring ptr
#else
	declare function XML_SetBase(byval parser as XML_Parser, byval base as const zstring ptr) as XML_Status
	declare function XML_GetBase(byval parser as XML_Parser) as const zstring ptr
#endif

declare function XML_GetSpecifiedAttributeCount(byval parser as XML_Parser) as long
declare function XML_GetIdAttributeIndex(byval parser as XML_Parser) as long
declare function XML_Parse(byval parser as XML_Parser, byval s as const zstring ptr, byval len as long, byval isFinal as long) as XML_Status
declare function XML_GetBuffer(byval parser as XML_Parser, byval len as long) as any ptr
declare function XML_ParseBuffer(byval parser as XML_Parser, byval len as long, byval isFinal as long) as XML_Status
declare function XML_StopParser(byval parser as XML_Parser, byval resumable as XML_Bool) as XML_Status
declare function XML_ResumeParser(byval parser as XML_Parser) as XML_Status

type XML_Parsing as long
enum
	XML_INITIALIZED
	XML_PARSING
	XML_FINISHED
	XML_SUSPENDED
end enum

type XML_ParsingStatus
	parsing as XML_Parsing
	finalBuffer as XML_Bool
end type

declare sub XML_GetParsingStatus(byval parser as XML_Parser, byval status as XML_ParsingStatus ptr)

#ifdef XML_UNICODE
	declare function XML_ExternalEntityParserCreate(byval parser as XML_Parser, byval context as const wstring ptr, byval encoding as const wstring ptr) as XML_Parser
#else
	declare function XML_ExternalEntityParserCreate(byval parser as XML_Parser, byval context as const zstring ptr, byval encoding as const zstring ptr) as XML_Parser
#endif

type XML_ParamEntityParsing as long
enum
	XML_PARAM_ENTITY_PARSING_NEVER
	XML_PARAM_ENTITY_PARSING_UNLESS_STANDALONE
	XML_PARAM_ENTITY_PARSING_ALWAYS
end enum

declare function XML_SetParamEntityParsing(byval parser as XML_Parser, byval parsing as XML_ParamEntityParsing) as long
declare function XML_SetHashSalt(byval parser as XML_Parser, byval hash_salt as culong) as long
declare function XML_GetErrorCode(byval parser as XML_Parser) as XML_Error
declare function XML_GetCurrentLineNumber(byval parser as XML_Parser) as XML_Size
declare function XML_GetCurrentColumnNumber(byval parser as XML_Parser) as XML_Size
declare function XML_GetCurrentByteIndex(byval parser as XML_Parser) as XML_Index
declare function XML_GetCurrentByteCount(byval parser as XML_Parser) as long
declare function XML_GetInputContext(byval parser as XML_Parser, byval offset as long ptr, byval size as long ptr) as const zstring ptr
declare function XML_GetErrorLineNumber alias "XML_GetCurrentLineNumber"(byval parser as XML_Parser) as XML_Size
declare function XML_GetErrorColumnNumber alias "XML_GetCurrentColumnNumber"(byval parser as XML_Parser) as XML_Size
declare function XML_GetErrorByteIndex alias "XML_GetCurrentByteIndex"(byval parser as XML_Parser) as XML_Index
declare sub XML_FreeContentModel(byval parser as XML_Parser, byval model as XML_Content ptr)
declare function XML_MemMalloc(byval parser as XML_Parser, byval size as uinteger) as any ptr
declare function XML_MemRealloc(byval parser as XML_Parser, byval ptr as any ptr, byval size as uinteger) as any ptr
declare sub XML_MemFree(byval parser as XML_Parser, byval ptr as any ptr)
declare sub XML_ParserFree(byval parser as XML_Parser)

#ifdef XML_UNICODE
	declare function XML_ErrorString(byval code as XML_Error) as const wstring ptr
	declare function XML_ExpatVersion() as const wstring ptr
#else
	declare function XML_ErrorString(byval code as XML_Error) as const zstring ptr
	declare function XML_ExpatVersion() as const zstring ptr
#endif

type XML_Expat_Version
	major as long
	minor as long
	micro as long
end type

declare function XML_ExpatVersionInfo() as XML_Expat_Version

type XML_FeatureEnum as long
enum
	XML_FEATURE_END = 0
	XML_FEATURE_UNICODE
	XML_FEATURE_UNICODE_WCHAR_T
	XML_FEATURE_DTD
	XML_FEATURE_CONTEXT_BYTES
	XML_FEATURE_MIN_SIZE
	XML_FEATURE_SIZEOF_XML_CHAR
	XML_FEATURE_SIZEOF_XML_LCHAR
	XML_FEATURE_NS
	XML_FEATURE_LARGE_SIZE
	XML_FEATURE_ATTR_INFO
end enum

type XML_Feature
	feature as XML_FeatureEnum

	#ifdef XML_UNICODE
		name as const wstring ptr
	#else
		name as const zstring ptr
	#endif

	value as clong
end type

declare function XML_GetFeatureList() as const XML_Feature ptr
const XML_MAJOR_VERSION = 2
const XML_MINOR_VERSION = 1
const XML_MICRO_VERSION = 0

end extern
