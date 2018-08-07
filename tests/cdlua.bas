#include "Lua/lua.bi"

#include "cd/cd.bi"

#include "cd/cdlua.bi"
#include "cd/cdluagl.bi"
#include "cd/cdluaim.bi"
#include "cd/cdluaiup.bi"
#include "cd/cdluapdf.bi"

'' conflicts with cdlua5_private.bi,
'' and our Lua headers are version 5 (not 3) anyways
'#include "cd/cdlua3_private.bi"

#include "cd/cdlua5_private.bi"
