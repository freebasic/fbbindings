const FALSE = 0
const TRUE = -1

#include once "crt.bi"

const CH_TAB       = &h09
const CH_LF        = &h0A
const CH_CR        = &h0D
const CH_SPACE     = asc(" ")
const CH_DQUOTE    = asc("""")
const CH_QUOTE     = asc("'")
const CH_STAR      = asc("*")
const CH_SLASH     = asc("/")
const CH_BACKSLASH = asc($"\")

function strStartsWith(byref s as string, byref lookfor as string) as integer
	function = left(s, len(lookfor)) = lookfor
end function

sub strSplit(byref s as string, byref delimiter as string, byref l as string, byref r as string)
	var leftlen = instr(s, delimiter) - 1
	if leftlen > 0 then
		l = left(s, leftlen)
		r = right(s, len(s) - leftlen - len(delimiter))
	else
		l = s
		r = ""
	end if
end sub

function strIsJustWhiteSpace(byref s as string) as integer
	for i as integer = 0 to len(s) - 1
		select case s[i]
		case CH_TAB, CH_SPACE
		case else
			exit function
		end select
	next
	function = TRUE
end function

function strIsNonEmptyLine(byref s as string) as integer
	function = (len(s) > 0) andalso (not strIsJustWhiteSpace(s))
end function

#define Array(T) Array##T

#macro declareArray(T)
	type Array(T)
		p as T ptr
		count as integer
		declare function append() as T ptr
		declare sub append(byref x as T)
		declare function inRange(byval i as integer) as integer
		declare sub remove(byval i as integer)
	end type
#endmacro

#macro defineArray(T)
	function Array(T).append() as T ptr
		var i = count
		count += 1
		p = reallocate(p, count * sizeof(*p))
		clear(p[i], 0, sizeof(*p))
		function = @p[i]
	end function

	sub Array(T).append(byref x as T)
		*append() = x
	end sub

	function Array(T).inRange(byval i as integer) as integer
		function = (i >= 0) and (i < count)
	end function

	sub Array(T).remove(byval i as integer)
		assert(inRange(i))
		count -= 1
		'' Remove array element from the middle of the array: move all elements
		'' behind it to the front, by 1 slot, to close the gap.
		var tail = count - i
		if tail > 0 then
			memmove(@p[i], @p[i + 1], tail * sizeof(*p))
		end if
	end sub
#endmacro

declareArray(string)
defineArray(string)

type Comment
	lines as Array(string)
	declare function firstLineIs(byref s as string) as integer
	declare function lastLineIs(byref s as string) as integer
	declare function lineIsNonEmpty(byval i as integer) as integer
	declare function firstLineStartsWith(byref s as string) as integer
	declare function middleLinesStartWith(byref s as string) as integer
	declare sub dropLine(byval i as integer)
	declare sub dropFirstAndLast()
	declare sub cutMiddleLines(byval n as integer)
	declare sub unindent()
	declare sub emit()
end type

function Comment.firstLineIs(byref s as string) as integer
	function = (lines.count > 0) andalso (lines.p[0] = s)
end function

function Comment.lastLineIs(byref s as string) as integer
	function = (lines.count > 0) andalso (lines.p[lines.count-1] = s)
end function

function Comment.lineIsNonEmpty(byval i as integer) as integer
	function = strIsNonEmptyLine(lines.p[i])
end function

function Comment.firstLineStartsWith(byref s as string) as integer
	function = (lines.count > 0) andalso strStartsWith(lines.p[0], s)
end function

function Comment.middleLinesStartWith(byref s as string) as integer
	if lines.count <= 2 then exit function
	for i as integer = 1 to lines.count - 2
		if lineIsNonEmpty(i) then
			if strStartsWith(lines.p[i], s) = FALSE then exit function
		end if
	next
	function = TRUE
end function

sub Comment.dropLine(byval i as integer)
	if lines.inRange(i) then
		lines.p[i] = ""
		lines.remove(i)
	end if
end sub

sub Comment.dropFirstAndLast()
	dropLine(0)
	dropLine(lines.count - 1)
end sub

'' Remove n chars from the front of each middle line (all except first/last)
sub Comment.cutMiddleLines(byval n as integer)
	for i as integer = 1 to lines.count - 2
		dim ln as string ptr = @lines.p[i]
		*ln = right(*ln, len(*ln) - n)
	next
end sub

sub Comment.unindent()
	if lines.count < 3 then
		exit sub
	end if

	'' /**
	''  * Foo
	''  */
	if firstLineIs("* ") and middleLinesStartWith(" * ") and lastLineIs(" ") then
		cutMiddleLines(3)
		dropFirstAndLast()
		exit sub
	end if

	'' /*
	''   Foo
	'' */
	if firstLineIs("") and lastLineIs("") then
		if middleLinesStartWith("  ") then
			cutMiddleLines(2)
			dropFirstAndLast()
			exit sub
		end if

		if middleLinesStartWith(!"\t") then
			cutMiddleLines(1)
			dropFirstAndLast()
			exit sub
		end if
	end if
end sub

sub Comment.emit()
	for i as integer = 0 to lines.count - 1
		print lines.p[i]
	next
end sub

declareArray(Comment)
defineArray(Comment)

dim shared comments as Array(Comment)

sub oops(byref message as string)
	print "error: " + message
	end 1
end sub

dim shared code as zstring ptr '' File content
dim shared x as ubyte ptr      '' Current char, will always be <= limit

'' Look-ahead and check whether the \ is an escaped EOL, and if yes, skip it
private function hSkipEscapedEol() as integer
	var i = 0
	assert(x[0] = CH_BACKSLASH)
	i += 1

	'' Skip space between \ and EOL
	while (x[i] = CH_TAB) or (x[i] = CH_SPACE)
		i += 1
	wend

	select case x[i]
	case CH_CR
		i += 1
		if x[i] = CH_LF then	'' CRLF
			i += 1
		end if
	case CH_LF
		i += 1
	case else
		return FALSE
	end select

	x += i
	function = TRUE
end function

'' // C++ comment
'' The EOL behind the comment is not skipped; it's a (separate) token.
'' The comment may contain escaped newlines ('\' [Spaces] EOL)
'' which means the comment continues on the next line.
private sub hReadLineComment()
	x += 2

	dim s as string
	do
		var add_char = TRUE

		select case x[0]
		case 0, CH_CR, CH_LF
			exit do
		case CH_BACKSLASH
			add_char = not hSkipEscapedEol()
		end select

		if add_char then
			s += chr(x[0])
			x += 1
		end if
	loop

	comments.append()->lines.append(s)
end sub

'' /* C comment */
private sub hReadComment()
	'' /*
	x += 2

	var thiscomment = comments.append()

	dim ln as string
	do
		select case x[0]
		case 0
			oops("comment left open")

		case CH_STAR		'' *
			if x[1] = CH_SLASH then	'' */
				exit do
			end if

			ln += chr(x[0])
			x += 1

		case CH_CR, CH_LF
			'' Save previous line and start new one
			thiscomment->lines.append(ln)
			ln = ""
			x += 1

			if (x[-1] = CH_CR) and (x[0] = CH_LF) then  '' CRLF
				x += 1
			end if

		case else
			ln += chr(x[0])
			x += 1
		end select
	loop

	'' Save last line (not terminated by EOL)
	thiscomment->lines.append(ln)

	'' */
	x += 2
end sub

'' String/char literal lexing
'' String literals may contain escaped EOLs and continue on the next line.
'' For correct lexing, some escape sequences have to be handled here too.
private sub hSkipString()
	'' ' or "
	var quotechar = x[0]
	x += 1

	do
		select case x[0]
		case quotechar
			exit do

		case CH_LF, CH_CR, 0
			oops("string/char literal left open")

		case CH_BACKSLASH	'' \
			if hSkipEscapedEol() = FALSE then
				x += 1
				select case x[0]
				case CH_BACKSLASH '' \\
					x += 1
				case quotechar    '' \" or \'
					x += 1
				end select
			end if

		case else
			x += 1
		end select
	loop

	'' closing quote
	x += 1
end sub

sub loadComments()
	x = code

	do
		select case as const x[0]
		case 0
			exit do

		case CH_QUOTE, CH_DQUOTE
			hSkipString()

		case CH_SLASH		'' /
			select case x[1]
			case CH_SLASH	'' //
				hReadLineComment()
			case CH_STAR	'' /*
				hReadComment()
			case else
				x += 1
			end select

		case else
			x += 1
		end select
	loop
end sub

sub loadFile(byref filename as string)
	'' Read in the whole file content
	var f = freefile()
	if open(filename, for binary, access read, as #f) then
		oops("could not open file: '" + filename + "'")
	end if

	dim as ulongint filesize = lof(f)
	if filesize > &h40000000 then
		oops("that's a big file")
	end if

	'' An extra 0 byte at the end of the buffer so we can look ahead
	'' without bound checks, and don't need to give special treatment
	'' to empty files.
	dim as integer sizetoload = filesize
	code = callocate(sizetoload + 1)

	if sizetoload > 0 then
		var sizeloaded = 0
		var result = get(#f, , *cptr(ubyte ptr, code), sizetoload, sizeloaded)
		if result or (sizeloaded <> sizetoload) then
			oops("file I/O failed")
		end if
	end if

	close #f

	'' Disallow embedded nulls, since that indicates EOF to the lexer
	for i as integer = 0 to sizetoload-1
		if code[i] = 0 then
			oops("file '" + filename + "' has embedded nulls, please fix that first!")
		end if
	next
end sub

sub loadCommentsFromFile(byref filename as string)
	loadFile(filename)
	loadComments()
end sub

if __FB_ARGC__ <= 1 then
	print "extract comment text from C/C++ code"
	print "usage: ./this [-N[-M]] files..."
	print "-N    extract only the N'th comment"
	print "-N-M  extract comments N to M"
	end 1
end if

dim as integer rangefirst, rangelast, range_set

for i as integer = 1 to __FB_ARGC__-1
	var arg = *__FB_ARGV__[i]
	if left(arg, 1) = "-" then
		arg = right(arg, len(arg) - 1)

		dim as string n, m
		strSplit(arg, "-", n, m)

		rangefirst = valuint(n)
		if len(m) > 0 then
			rangelast = valuint(m)
		else
			rangelast = rangefirst
		end if

		'' UI is 1-based, but internals are 0-based
		rangefirst -= 1
		rangelast -= 1

		range_set = TRUE
	else
		loadCommentsFromFile(arg)
	end if
next

var last = comments.count - 1

if range_set = FALSE then
	'' Default to extracting the 1st comment, since that's the most common
	'' place for package/legal info
	rangefirst = 0
	rangelast = 0
end if

if (rangefirst <= rangelast) and (rangefirst < last) then
	if rangelast > last then rangelast = last
	for i as integer = rangefirst to rangelast
		assert(comments.inRange(i))
		comments.p[i].unindent()
		comments.p[i].emit()
	next
end if
