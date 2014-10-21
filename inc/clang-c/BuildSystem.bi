#pragma once

extern "C"

type CXVirtualFileOverlayImpl as CXVirtualFileOverlayImpl_
type CXModuleMapDescriptorImpl as CXModuleMapDescriptorImpl_

#define CLANG_C_BUILD_SYSTEM_H

declare function clang_getBuildSessionTimestamp() as ulongint

type CXVirtualFileOverlay as CXVirtualFileOverlayImpl ptr

declare function clang_VirtualFileOverlay_create(byval options as ulong) as CXVirtualFileOverlay
declare function clang_VirtualFileOverlay_addFileMapping(byval as CXVirtualFileOverlay, byval virtualPath as const zstring ptr, byval realPath as const zstring ptr) as CXErrorCode
declare function clang_VirtualFileOverlay_setCaseSensitivity(byval as CXVirtualFileOverlay, byval caseSensitive as long) as CXErrorCode
declare function clang_VirtualFileOverlay_writeToBuffer(byval as CXVirtualFileOverlay, byval options as ulong, byval out_buffer_ptr as zstring ptr ptr, byval out_buffer_size as ulong ptr) as CXErrorCode
declare sub clang_VirtualFileOverlay_dispose(byval as CXVirtualFileOverlay)

type CXModuleMapDescriptor as CXModuleMapDescriptorImpl ptr

declare function clang_ModuleMapDescriptor_create(byval options as ulong) as CXModuleMapDescriptor
declare function clang_ModuleMapDescriptor_setFrameworkModuleName(byval as CXModuleMapDescriptor, byval name_ as const zstring ptr) as CXErrorCode
declare function clang_ModuleMapDescriptor_setUmbrellaHeader(byval as CXModuleMapDescriptor, byval name_ as const zstring ptr) as CXErrorCode
declare function clang_ModuleMapDescriptor_writeToBuffer(byval as CXModuleMapDescriptor, byval options as ulong, byval out_buffer_ptr as zstring ptr ptr, byval out_buffer_size as ulong ptr) as CXErrorCode
declare sub clang_ModuleMapDescriptor_dispose(byval as CXModuleMapDescriptor)

end extern
