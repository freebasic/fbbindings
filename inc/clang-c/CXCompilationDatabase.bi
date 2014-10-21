#pragma once

extern "C"

#define CLANG_CXCOMPILATIONDATABASE_H

type CXCompilationDatabase as any ptr
type CXCompileCommands as any ptr
type CXCompileCommand as any ptr

type CXCompilationDatabase_Error as long
enum
	CXCompilationDatabase_NoError = 0
	CXCompilationDatabase_CanNotLoadDatabase = 1
end enum

declare function clang_CompilationDatabase_fromDirectory(byval BuildDir as const zstring ptr, byval ErrorCode as CXCompilationDatabase_Error ptr) as CXCompilationDatabase
declare sub clang_CompilationDatabase_dispose(byval as CXCompilationDatabase)
declare function clang_CompilationDatabase_getCompileCommands(byval as CXCompilationDatabase, byval CompleteFileName as const zstring ptr) as CXCompileCommands
declare function clang_CompilationDatabase_getAllCompileCommands(byval as CXCompilationDatabase) as CXCompileCommands
declare sub clang_CompileCommands_dispose(byval as CXCompileCommands)
declare function clang_CompileCommands_getSize(byval as CXCompileCommands) as ulong
declare function clang_CompileCommands_getCommand(byval as CXCompileCommands, byval I as ulong) as CXCompileCommand
declare function clang_CompileCommand_getDirectory(byval as CXCompileCommand) as CXString
declare function clang_CompileCommand_getNumArgs(byval as CXCompileCommand) as ulong
declare function clang_CompileCommand_getArg(byval as CXCompileCommand, byval I as ulong) as CXString
declare function clang_CompileCommand_getNumMappedSources(byval as CXCompileCommand) as ulong
declare function clang_CompileCommand_getMappedSourcePath(byval as CXCompileCommand, byval I as ulong) as CXString
declare function clang_CompileCommand_getMappedSourceContent(byval as CXCompileCommand, byval I as ulong) as CXString

end extern
