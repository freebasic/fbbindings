dim shared ids(any) as string
dim shared values(any) as string

function lookupDefine(byref id as string) as integer
	for i as integer = lbound(ids) to ubound(ids)
		if ids(i) = id then
			return i
		end if
	next
	return -1
end function

sub addDefine(byref id as string, byref value as string)
	redim preserve ids(0 to ubound(ids) + 1)
	redim preserve values(0 to ubound(values) + 1)
	ids(ubound(ids)) = id
	values(ubound(values)) = value
end sub

function strStartsWith(byref s as string, byref lookfor as string) as integer
	function = left(s, len(lookfor)) = lookfor
end function

function strSplit(byref s as string, byref delimiter as string, byref l as string, byref r as string) as integer
	var leftlen = instr(s, delimiter) - 1
	if leftlen > 0 then
		l = left(s, leftlen)
		r = right(s, len(s) - leftlen - len(delimiter))
		function = TRUE
	else
		function = FALSE
	end if
end function

for i as integer = 1 to __FB_ARGC__ - 1
	var arg = *__FB_ARGV__[i]
	dim as string id, value
	if strSplit(arg, "=", id, value) = FALSE then
		id = arg
		value = "1"
	end if
	addDefine(id, value)
next

if open cons(for input, as #1) <> 0 then
	print "failed to open stdin"
	end 1
end if

dim ln as string
while not eof(1)
	line input #1, ln

	'' Check for #undef|cmakedefine <id> lines
	const undef = "#undef"
	const cmakedefine = "#cmakedefine"
	dim keyword as string
	if strStartsWith(ln, undef) then
		keyword = undef
	elseif strStartsWith(ln, cmakedefine) then
		keyword = cmakedefine
	end if

	if len(keyword) > 0 then
		'' Space behind the #keyword?
		if mid(ln, len(keyword) + 1, 1) = " " then
			'' Id?
			var id = mid(ln, len(keyword) + 2, len(ln) - len(keyword) - 1)
			if len(id) > 0 then
				'' Like autoconf, we either turn #undefs into #defines,
				'' or comment them out (so they won't be preserved into
				'' the .bi by fbfrog)
				var def = lookupDefine(id)
				if def >= 0 then
					ln = "#define " + id + " " + values(def)
				else
					ln = "/* " + ln + " */"
				end if
			end if
		end if
	end if

	print ln
wend

close #1
