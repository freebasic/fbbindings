#pragma once

#include once "crt/long.bi"
#include once "_mingw_unicode.bi"

#ifdef __FB_64BIT__
	extern "C"
#else
	extern "Windows"
#endif

#define __RPCNSI_H__

type RPC_NS_HANDLE as any ptr

#define RPC_C_NS_SYNTAX_DEFAULT 0
#define RPC_C_NS_SYNTAX_DCE 3
#define RPC_C_PROFILE_DEFAULT_ELT 0
#define RPC_C_PROFILE_ALL_ELT 1
#define RPC_C_PROFILE_ALL_ELTS RPC_C_PROFILE_ALL_ELT
#define RPC_C_PROFILE_MATCH_BY_IF 2
#define RPC_C_PROFILE_MATCH_BY_MBR 3
#define RPC_C_PROFILE_MATCH_BY_BOTH 4
#define RPC_C_NS_DEFAULT_EXP_AGE (-1)

declare function RpcNsBindingExportA(byval EntryNameSyntax as culong, byval EntryName as RPC_CSTR, byval IfSpec as RPC_IF_HANDLE, byval BindingVec as RPC_BINDING_VECTOR ptr, byval ObjectUuidVec as UUID_VECTOR ptr) as RPC_STATUS
declare function RpcNsBindingUnexportA(byval EntryNameSyntax as culong, byval EntryName as RPC_CSTR, byval IfSpec as RPC_IF_HANDLE, byval ObjectUuidVec as UUID_VECTOR ptr) as RPC_STATUS
declare function RpcNsBindingExportW(byval EntryNameSyntax as culong, byval EntryName as RPC_WSTR, byval IfSpec as RPC_IF_HANDLE, byval BindingVec as RPC_BINDING_VECTOR ptr, byval ObjectUuidVec as UUID_VECTOR ptr) as RPC_STATUS
declare function RpcNsBindingUnexportW(byval EntryNameSyntax as culong, byval EntryName as RPC_WSTR, byval IfSpec as RPC_IF_HANDLE, byval ObjectUuidVec as UUID_VECTOR ptr) as RPC_STATUS
declare function RpcNsBindingExportPnPA(byval EntryNameSyntax as culong, byval EntryName as RPC_CSTR, byval IfSpec as RPC_IF_HANDLE, byval ObjectVector as UUID_VECTOR ptr) as RPC_STATUS
declare function RpcNsBindingUnexportPnPA(byval EntryNameSyntax as culong, byval EntryName as RPC_CSTR, byval IfSpec as RPC_IF_HANDLE, byval ObjectVector as UUID_VECTOR ptr) as RPC_STATUS
declare function RpcNsBindingExportPnPW(byval EntryNameSyntax as culong, byval EntryName as RPC_WSTR, byval IfSpec as RPC_IF_HANDLE, byval ObjectVector as UUID_VECTOR ptr) as RPC_STATUS
declare function RpcNsBindingUnexportPnPW(byval EntryNameSyntax as culong, byval EntryName as RPC_WSTR, byval IfSpec as RPC_IF_HANDLE, byval ObjectVector as UUID_VECTOR ptr) as RPC_STATUS
declare function RpcNsBindingLookupBeginA(byval EntryNameSyntax as culong, byval EntryName as RPC_CSTR, byval IfSpec as RPC_IF_HANDLE, byval ObjUuid as UUID ptr, byval BindingMaxCount as culong, byval LookupContext as RPC_NS_HANDLE ptr) as RPC_STATUS
declare function RpcNsBindingLookupBeginW(byval EntryNameSyntax as culong, byval EntryName as RPC_WSTR, byval IfSpec as RPC_IF_HANDLE, byval ObjUuid as UUID ptr, byval BindingMaxCount as culong, byval LookupContext as RPC_NS_HANDLE ptr) as RPC_STATUS
declare function RpcNsBindingLookupNext(byval LookupContext as RPC_NS_HANDLE, byval BindingVec as RPC_BINDING_VECTOR ptr ptr) as RPC_STATUS
declare function RpcNsBindingLookupDone(byval LookupContext as RPC_NS_HANDLE ptr) as RPC_STATUS
declare function RpcNsGroupDeleteA(byval GroupNameSyntax as culong, byval GroupName as RPC_CSTR) as RPC_STATUS
declare function RpcNsGroupMbrAddA(byval GroupNameSyntax as culong, byval GroupName as RPC_CSTR, byval MemberNameSyntax as culong, byval MemberName as RPC_CSTR) as RPC_STATUS
declare function RpcNsGroupMbrRemoveA(byval GroupNameSyntax as culong, byval GroupName as RPC_CSTR, byval MemberNameSyntax as culong, byval MemberName as RPC_CSTR) as RPC_STATUS
declare function RpcNsGroupMbrInqBeginA(byval GroupNameSyntax as culong, byval GroupName as RPC_CSTR, byval MemberNameSyntax as culong, byval InquiryContext as RPC_NS_HANDLE ptr) as RPC_STATUS
declare function RpcNsGroupMbrInqNextA(byval InquiryContext as RPC_NS_HANDLE, byval MemberName as RPC_CSTR ptr) as RPC_STATUS
declare function RpcNsGroupDeleteW(byval GroupNameSyntax as culong, byval GroupName as RPC_WSTR) as RPC_STATUS
declare function RpcNsGroupMbrAddW(byval GroupNameSyntax as culong, byval GroupName as RPC_WSTR, byval MemberNameSyntax as culong, byval MemberName as RPC_WSTR) as RPC_STATUS
declare function RpcNsGroupMbrRemoveW(byval GroupNameSyntax as culong, byval GroupName as RPC_WSTR, byval MemberNameSyntax as culong, byval MemberName as RPC_WSTR) as RPC_STATUS
declare function RpcNsGroupMbrInqBeginW(byval GroupNameSyntax as culong, byval GroupName as RPC_WSTR, byval MemberNameSyntax as culong, byval InquiryContext as RPC_NS_HANDLE ptr) as RPC_STATUS
declare function RpcNsGroupMbrInqNextW(byval InquiryContext as RPC_NS_HANDLE, byval MemberName as RPC_WSTR ptr) as RPC_STATUS
declare function RpcNsGroupMbrInqDone(byval InquiryContext as RPC_NS_HANDLE ptr) as RPC_STATUS
declare function RpcNsProfileDeleteA(byval ProfileNameSyntax as culong, byval ProfileName as RPC_CSTR) as RPC_STATUS
declare function RpcNsProfileEltAddA(byval ProfileNameSyntax as culong, byval ProfileName as RPC_CSTR, byval IfId as RPC_IF_ID ptr, byval MemberNameSyntax as culong, byval MemberName as RPC_CSTR, byval Priority as culong, byval Annotation as RPC_CSTR) as RPC_STATUS
declare function RpcNsProfileEltRemoveA(byval ProfileNameSyntax as culong, byval ProfileName as RPC_CSTR, byval IfId as RPC_IF_ID ptr, byval MemberNameSyntax as culong, byval MemberName as RPC_CSTR) as RPC_STATUS
declare function RpcNsProfileEltInqBeginA(byval ProfileNameSyntax as culong, byval ProfileName as RPC_CSTR, byval InquiryType as culong, byval IfId as RPC_IF_ID ptr, byval VersOption as culong, byval MemberNameSyntax as culong, byval MemberName as RPC_CSTR, byval InquiryContext as RPC_NS_HANDLE ptr) as RPC_STATUS
declare function RpcNsProfileEltInqNextA(byval InquiryContext as RPC_NS_HANDLE, byval IfId as RPC_IF_ID ptr, byval MemberName as RPC_CSTR ptr, byval Priority as culong ptr, byval Annotation as RPC_CSTR ptr) as RPC_STATUS
declare function RpcNsProfileDeleteW(byval ProfileNameSyntax as culong, byval ProfileName as RPC_WSTR) as RPC_STATUS
declare function RpcNsProfileEltAddW(byval ProfileNameSyntax as culong, byval ProfileName as RPC_WSTR, byval IfId as RPC_IF_ID ptr, byval MemberNameSyntax as culong, byval MemberName as RPC_WSTR, byval Priority as culong, byval Annotation as RPC_WSTR) as RPC_STATUS
declare function RpcNsProfileEltRemoveW(byval ProfileNameSyntax as culong, byval ProfileName as RPC_WSTR, byval IfId as RPC_IF_ID ptr, byval MemberNameSyntax as culong, byval MemberName as RPC_WSTR) as RPC_STATUS
declare function RpcNsProfileEltInqBeginW(byval ProfileNameSyntax as culong, byval ProfileName as RPC_WSTR, byval InquiryType as culong, byval IfId as RPC_IF_ID ptr, byval VersOption as culong, byval MemberNameSyntax as culong, byval MemberName as RPC_WSTR, byval InquiryContext as RPC_NS_HANDLE ptr) as RPC_STATUS
declare function RpcNsProfileEltInqNextW(byval InquiryContext as RPC_NS_HANDLE, byval IfId as RPC_IF_ID ptr, byval MemberName as RPC_WSTR ptr, byval Priority as culong ptr, byval Annotation as RPC_WSTR ptr) as RPC_STATUS
declare function RpcNsProfileEltInqDone(byval InquiryContext as RPC_NS_HANDLE ptr) as RPC_STATUS
declare function RpcNsEntryObjectInqBeginA(byval EntryNameSyntax as culong, byval EntryName as RPC_CSTR, byval InquiryContext as RPC_NS_HANDLE ptr) as RPC_STATUS
declare function RpcNsEntryObjectInqBeginW(byval EntryNameSyntax as culong, byval EntryName as RPC_WSTR, byval InquiryContext as RPC_NS_HANDLE ptr) as RPC_STATUS
declare function RpcNsEntryObjectInqNext(byval InquiryContext as RPC_NS_HANDLE, byval ObjUuid as UUID ptr) as RPC_STATUS
declare function RpcNsEntryObjectInqDone(byval InquiryContext as RPC_NS_HANDLE ptr) as RPC_STATUS
declare function RpcNsEntryExpandNameA(byval EntryNameSyntax as culong, byval EntryName as RPC_CSTR, byval ExpandedName as RPC_CSTR ptr) as RPC_STATUS
declare function RpcNsMgmtBindingUnexportA(byval EntryNameSyntax as culong, byval EntryName as RPC_CSTR, byval IfId as RPC_IF_ID ptr, byval VersOption as culong, byval ObjectUuidVec as UUID_VECTOR ptr) as RPC_STATUS
declare function RpcNsMgmtEntryCreateA(byval EntryNameSyntax as culong, byval EntryName as RPC_CSTR) as RPC_STATUS
declare function RpcNsMgmtEntryDeleteA(byval EntryNameSyntax as culong, byval EntryName as RPC_CSTR) as RPC_STATUS
declare function RpcNsMgmtEntryInqIfIdsA(byval EntryNameSyntax as culong, byval EntryName as RPC_CSTR, byval IfIdVec as RPC_IF_ID_VECTOR ptr ptr) as RPC_STATUS
declare function RpcNsMgmtHandleSetExpAge(byval NsHandle as RPC_NS_HANDLE, byval ExpirationAge as culong) as RPC_STATUS
declare function RpcNsMgmtInqExpAge(byval ExpirationAge as culong ptr) as RPC_STATUS
declare function RpcNsMgmtSetExpAge(byval ExpirationAge as culong) as RPC_STATUS
declare function RpcNsEntryExpandNameW(byval EntryNameSyntax as culong, byval EntryName as RPC_WSTR, byval ExpandedName as RPC_WSTR ptr) as RPC_STATUS
declare function RpcNsMgmtBindingUnexportW(byval EntryNameSyntax as culong, byval EntryName as RPC_WSTR, byval IfId as RPC_IF_ID ptr, byval VersOption as culong, byval ObjectUuidVec as UUID_VECTOR ptr) as RPC_STATUS
declare function RpcNsMgmtEntryCreateW(byval EntryNameSyntax as culong, byval EntryName as RPC_WSTR) as RPC_STATUS
declare function RpcNsMgmtEntryDeleteW(byval EntryNameSyntax as culong, byval EntryName as RPC_WSTR) as RPC_STATUS
declare function RpcNsMgmtEntryInqIfIdsW(byval EntryNameSyntax as culong, byval EntryName as RPC_WSTR, byval IfIdVec as RPC_IF_ID_VECTOR ptr ptr) as RPC_STATUS
declare function RpcNsBindingImportBeginA(byval EntryNameSyntax as culong, byval EntryName as RPC_CSTR, byval IfSpec as RPC_IF_HANDLE, byval ObjUuid as UUID ptr, byval ImportContext as RPC_NS_HANDLE ptr) as RPC_STATUS
declare function RpcNsBindingImportBeginW(byval EntryNameSyntax as culong, byval EntryName as RPC_WSTR, byval IfSpec as RPC_IF_HANDLE, byval ObjUuid as UUID ptr, byval ImportContext as RPC_NS_HANDLE ptr) as RPC_STATUS
declare function RpcNsBindingImportNext(byval ImportContext as RPC_NS_HANDLE, byval Binding as RPC_BINDING_HANDLE ptr) as RPC_STATUS
declare function RpcNsBindingImportDone(byval ImportContext as RPC_NS_HANDLE ptr) as RPC_STATUS
declare function RpcNsBindingSelect(byval BindingVec as RPC_BINDING_VECTOR ptr, byval Binding as RPC_BINDING_HANDLE ptr) as RPC_STATUS

#define RpcNsBindingLookupBegin __MINGW_NAME_AW(RpcNsBindingLookupBegin)
#define RpcNsBindingImportBegin __MINGW_NAME_AW(RpcNsBindingImportBegin)
#define RpcNsBindingExport __MINGW_NAME_AW(RpcNsBindingExport)
#define RpcNsBindingUnexport __MINGW_NAME_AW(RpcNsBindingUnexport)
#define RpcNsGroupDelete __MINGW_NAME_AW(RpcNsGroupDelete)
#define RpcNsGroupMbrAdd __MINGW_NAME_AW(RpcNsGroupMbrAdd)
#define RpcNsGroupMbrRemove __MINGW_NAME_AW(RpcNsGroupMbrRemove)
#define RpcNsGroupMbrInqBegin __MINGW_NAME_AW(RpcNsGroupMbrInqBegin)
#define RpcNsGroupMbrInqNext __MINGW_NAME_AW(RpcNsGroupMbrInqNext)
#define RpcNsEntryExpandName __MINGW_NAME_AW(RpcNsEntryExpandName)
#define RpcNsEntryObjectInqBegin __MINGW_NAME_AW(RpcNsEntryObjectInqBegin)
#define RpcNsMgmtBindingUnexport __MINGW_NAME_AW(RpcNsMgmtBindingUnexport)
#define RpcNsMgmtEntryCreate __MINGW_NAME_AW(RpcNsMgmtEntryCreate)
#define RpcNsMgmtEntryDelete __MINGW_NAME_AW(RpcNsMgmtEntryDelete)
#define RpcNsMgmtEntryInqIfIds __MINGW_NAME_AW(RpcNsMgmtEntryInqIfIds)
#define RpcNsProfileDelete __MINGW_NAME_AW(RpcNsProfileDelete)
#define RpcNsProfileEltAdd __MINGW_NAME_AW(RpcNsProfileEltAdd)
#define RpcNsProfileEltRemove __MINGW_NAME_AW(RpcNsProfileEltRemove)
#define RpcNsProfileEltInqBegin __MINGW_NAME_AW(RpcNsProfileEltInqBegin)
#define RpcNsProfileEltInqNext __MINGW_NAME_AW(RpcNsProfileEltInqNext)
#define RpcNsBindingExportPnP __MINGW_NAME_AW(RpcNsBindingExportPnP)
#define RpcNsBindingUnexportPnP __MINGW_NAME_AW(RpcNsBindingUnexportPnP)

end extern
