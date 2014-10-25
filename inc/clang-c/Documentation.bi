#pragma once

#include once "clang-c/Index.bi"

extern "C"

#define CLANG_C_DOCUMENTATION_H

type CXComment
	ASTNode as const any ptr
	TranslationUnit as CXTranslationUnit
end type

declare function clang_Cursor_getParsedComment(byval C as CXCursor) as CXComment

type CXCommentKind as long
enum
	CXComment_Null = 0
	CXComment_Text = 1
	CXComment_InlineCommand = 2
	CXComment_HTMLStartTag = 3
	CXComment_HTMLEndTag = 4
	CXComment_Paragraph = 5
	CXComment_BlockCommand = 6
	CXComment_ParamCommand = 7
	CXComment_TParamCommand = 8
	CXComment_VerbatimBlockCommand = 9
	CXComment_VerbatimBlockLine = 10
	CXComment_VerbatimLine = 11
	CXComment_FullComment = 12
end enum

type CXCommentInlineCommandRenderKind as long
enum
	CXCommentInlineCommandRenderKind_Normal
	CXCommentInlineCommandRenderKind_Bold
	CXCommentInlineCommandRenderKind_Monospaced
	CXCommentInlineCommandRenderKind_Emphasized
end enum

type CXCommentParamPassDirection as long
enum
	CXCommentParamPassDirection_In
	CXCommentParamPassDirection_Out
	CXCommentParamPassDirection_InOut
end enum

declare function clang_Comment_getKind(byval Comment as CXComment) as CXCommentKind
declare function clang_Comment_getNumChildren(byval Comment as CXComment) as ulong
declare function clang_Comment_getChild(byval Comment as CXComment, byval ChildIdx as ulong) as CXComment
declare function clang_Comment_isWhitespace(byval Comment as CXComment) as ulong
declare function clang_InlineContentComment_hasTrailingNewline(byval Comment as CXComment) as ulong
declare function clang_TextComment_getText(byval Comment as CXComment) as CXString
declare function clang_InlineCommandComment_getCommandName(byval Comment as CXComment) as CXString
declare function clang_InlineCommandComment_getRenderKind(byval Comment as CXComment) as CXCommentInlineCommandRenderKind
declare function clang_InlineCommandComment_getNumArgs(byval Comment as CXComment) as ulong
declare function clang_InlineCommandComment_getArgText(byval Comment as CXComment, byval ArgIdx as ulong) as CXString
declare function clang_HTMLTagComment_getTagName(byval Comment as CXComment) as CXString
declare function clang_HTMLStartTagComment_isSelfClosing(byval Comment as CXComment) as ulong
declare function clang_HTMLStartTag_getNumAttrs(byval Comment as CXComment) as ulong
declare function clang_HTMLStartTag_getAttrName(byval Comment as CXComment, byval AttrIdx as ulong) as CXString
declare function clang_HTMLStartTag_getAttrValue(byval Comment as CXComment, byval AttrIdx as ulong) as CXString
declare function clang_BlockCommandComment_getCommandName(byval Comment as CXComment) as CXString
declare function clang_BlockCommandComment_getNumArgs(byval Comment as CXComment) as ulong
declare function clang_BlockCommandComment_getArgText(byval Comment as CXComment, byval ArgIdx as ulong) as CXString
declare function clang_BlockCommandComment_getParagraph(byval Comment as CXComment) as CXComment
declare function clang_ParamCommandComment_getParamName(byval Comment as CXComment) as CXString
declare function clang_ParamCommandComment_isParamIndexValid(byval Comment as CXComment) as ulong
declare function clang_ParamCommandComment_getParamIndex(byval Comment as CXComment) as ulong
declare function clang_ParamCommandComment_isDirectionExplicit(byval Comment as CXComment) as ulong
declare function clang_ParamCommandComment_getDirection(byval Comment as CXComment) as CXCommentParamPassDirection
declare function clang_TParamCommandComment_getParamName(byval Comment as CXComment) as CXString
declare function clang_TParamCommandComment_isParamPositionValid(byval Comment as CXComment) as ulong
declare function clang_TParamCommandComment_getDepth(byval Comment as CXComment) as ulong
declare function clang_TParamCommandComment_getIndex(byval Comment as CXComment, byval Depth as ulong) as ulong
declare function clang_VerbatimBlockLineComment_getText(byval Comment as CXComment) as CXString
declare function clang_VerbatimLineComment_getText(byval Comment as CXComment) as CXString
declare function clang_HTMLTagComment_getAsString(byval Comment as CXComment) as CXString
declare function clang_FullComment_getAsHTML(byval Comment as CXComment) as CXString
declare function clang_FullComment_getAsXML(byval Comment as CXComment) as CXString

end extern
