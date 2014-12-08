#pragma once

#include once "crt/wchar.bi"
#include once "winapifamily.bi"
#include once "objbase.bi"
#include once "commctrl.bi"
#include once "accctrl.bi"
#include once "authz.bi"

#ifdef __FB_64BIT__
	extern "C"
#else
	extern "Windows"
#endif

type ISecurityInformationVtbl as ISecurityInformationVtbl_
type ISecurityInformation2Vtbl as ISecurityInformation2Vtbl_
type IEffectivePermissionVtbl as IEffectivePermissionVtbl_
type ISecurityObjectTypeInfoVtbl as ISecurityObjectTypeInfoVtbl_

#define _ACLUI_H_

type _SI_OBJECT_INFO
	dwFlags as DWORD
	hInstance as HINSTANCE
	pszServerName as LPWSTR
	pszObjectName as LPWSTR
	pszPageTitle as LPWSTR
	guidObjectType as GUID
end type

type SI_OBJECT_INFO as _SI_OBJECT_INFO
type PSI_OBJECT_INFO as _SI_OBJECT_INFO ptr

#define SI_EDIT_PERMS __MSABI_LONG(&h00000000)
#define SI_EDIT_OWNER __MSABI_LONG(&h00000001)
#define SI_EDIT_AUDITS __MSABI_LONG(&h00000002)
#define SI_CONTAINER __MSABI_LONG(&h00000004)
#define SI_READONLY __MSABI_LONG(&h00000008)
#define SI_ADVANCED __MSABI_LONG(&h00000010)
#define SI_RESET __MSABI_LONG(&h00000020)
#define SI_OWNER_READONLY __MSABI_LONG(&h00000040)
#define SI_EDIT_PROPERTIES __MSABI_LONG(&h00000080)
#define SI_OWNER_RECURSE __MSABI_LONG(&h00000100)
#define SI_NO_ACL_PROTECT __MSABI_LONG(&h00000200)
#define SI_NO_TREE_APPLY __MSABI_LONG(&h00000400)
#define SI_PAGE_TITLE __MSABI_LONG(&h00000800)
#define SI_SERVER_IS_DC __MSABI_LONG(&h00001000)
#define SI_RESET_DACL_TREE __MSABI_LONG(&h00004000)
#define SI_RESET_SACL_TREE __MSABI_LONG(&h00008000)
#define SI_OBJECT_GUID __MSABI_LONG(&h00010000)
#define SI_EDIT_EFFECTIVE __MSABI_LONG(&h00020000)
#define SI_RESET_DACL __MSABI_LONG(&h00040000)
#define SI_RESET_SACL __MSABI_LONG(&h00080000)
#define SI_RESET_OWNER __MSABI_LONG(&h00100000)
#define SI_NO_ADDITIONAL_PERMISSION __MSABI_LONG(&h00200000)
#define SI_MAY_WRITE __MSABI_LONG(&h10000000)
#define SI_EDIT_ALL ((SI_EDIT_PERMS or SI_EDIT_OWNER) or SI_EDIT_AUDITS)

type _SI_ACCESS
	pguid as const GUID ptr
	mask as ACCESS_MASK
	pszName as LPCWSTR
	dwFlags as DWORD
end type

type SI_ACCESS as _SI_ACCESS
type PSI_ACCESS as _SI_ACCESS ptr

#define SI_ACCESS_SPECIFIC __MSABI_LONG(&h00010000)
#define SI_ACCESS_GENERAL __MSABI_LONG(&h00020000)
#define SI_ACCESS_CONTAINER __MSABI_LONG(&h00040000)
#define SI_ACCESS_PROPERTY __MSABI_LONG(&h00080000)

type _SI_INHERIT_TYPE
	pguid as const GUID ptr
	dwFlags as ULONG_
	pszName as LPCWSTR
end type

type SI_INHERIT_TYPE as _SI_INHERIT_TYPE
type PSI_INHERIT_TYPE as _SI_INHERIT_TYPE ptr

type _SI_PAGE_TYPE as long
enum
	SI_PAGE_PERM = 0
	SI_PAGE_ADVPERM
	SI_PAGE_AUDIT
	SI_PAGE_OWNER
	SI_PAGE_EFFECTIVE
end enum

type SI_PAGE_TYPE as _SI_PAGE_TYPE

type _SI_PAGE_ACTIVATED as long
enum
	SI_SHOW_DEFAULT = 0
	SI_SHOW_PERM_ACTIVATED
	SI_SHOW_AUDIT_ACTIVATED
	SI_SHOW_OWNER_ACTIVATED
	SI_SHOW_EFFECTIVE_ACTIVATED
	SI_SHOW_SHARE_ACTIVATED
	SI_SHOW_CENTRAL_POLICY_ACTIVATED
end enum

type SI_PAGE_ACTIVATED as _SI_PAGE_ACTIVATED

#define GET_PAGE_TYPE(X) cast(UINT, (X) and &h0000ffff)
#define GET_ACTIVATION_TYPE(Y) cast(UINT, ((Y) shr 16) and &h0000ffff)
#define COMBINE_PAGE_ACTIVATION(X, Y) cast(UINT, ((Y) shl 16) or X)
#define DOBJ_RES_CONT __MSABI_LONG(&h00000001)
#define DOBJ_RES_ROOT __MSABI_LONG(&h00000002)
#define DOBJ_VOL_NTACLS __MSABI_LONG(&h00000004)
#define DOBJ_COND_NTACLS __MSABI_LONG(&h00000008)
#define DOBJ_RIBBON_LAUNCH __MSABI_LONG(&h00000010)
#define PSPCB_SI_INITDIALOG (WM_USER + 1)

type ISecurityInformation
	lpVtbl as ISecurityInformationVtbl ptr
end type

type ISecurityInformationVtbl_
	QueryInterface as function(byval This_ as ISecurityInformation ptr, byval riid as const IID const ptr, byval ppvObj as any ptr ptr) as HRESULT
	AddRef as function(byval This_ as ISecurityInformation ptr) as ULONG_
	Release as function(byval This_ as ISecurityInformation ptr) as ULONG_
	GetObjectInformation as function(byval This_ as ISecurityInformation ptr, byval pObjectInfo as PSI_OBJECT_INFO) as HRESULT
	GetSecurity as function(byval This_ as ISecurityInformation ptr, byval RequestedInformation as SECURITY_INFORMATION, byval ppSecurityDescriptor as PSECURITY_DESCRIPTOR ptr, byval fDefault as WINBOOL) as HRESULT
	SetSecurity as function(byval This_ as ISecurityInformation ptr, byval SecurityInformation as SECURITY_INFORMATION, byval pSecurityDescriptor as PSECURITY_DESCRIPTOR) as HRESULT
	GetAccessRights as function(byval This_ as ISecurityInformation ptr, byval pguidObjectType as const GUID ptr, byval dwFlags as DWORD, byval ppAccess as PSI_ACCESS ptr, byval pcAccesses as ULONG_ ptr, byval piDefaultAccess as ULONG_ ptr) as HRESULT
	MapGeneric as function(byval This_ as ISecurityInformation ptr, byval pguidObjectType as const GUID ptr, byval pAceFlags as UCHAR ptr, byval pMask as ACCESS_MASK ptr) as HRESULT
	GetInheritTypes as function(byval This_ as ISecurityInformation ptr, byval ppInheritTypes as PSI_INHERIT_TYPE ptr, byval pcInheritTypes as ULONG_ ptr) as HRESULT
	PropertySheetPageCallback as function(byval This_ as ISecurityInformation ptr, byval hwnd as HWND, byval uMsg as UINT, byval uPage as SI_PAGE_TYPE) as HRESULT
end type

type LPSECURITYINFO as ISecurityInformation ptr

type ISecurityInformation2
	lpVtbl as ISecurityInformation2Vtbl ptr
end type

type ISecurityInformation2Vtbl_
	QueryInterface as function(byval This_ as ISecurityInformation2 ptr, byval riid as const IID const ptr, byval ppvObj as any ptr ptr) as HRESULT
	AddRef as function(byval This_ as ISecurityInformation2 ptr) as ULONG_
	Release as function(byval This_ as ISecurityInformation2 ptr) as ULONG_
	IsDaclCanonical as function(byval This_ as ISecurityInformation2 ptr, byval pDacl as PACL) as WINBOOL
	LookupSids as function(byval This_ as ISecurityInformation2 ptr, byval cSids as ULONG_, byval rgpSids as PSID ptr, byval ppdo as LPDATAOBJECT ptr) as HRESULT
end type

type LPSECURITYINFO2 as ISecurityInformation2 ptr

#define CFSTR_ACLUI_SID_INFO_LIST TEXT_("CFSTR_ACLUI_SID_INFO_LIST")

type _SID_INFO
	pSid as PSID
	pwzCommonName as PWSTR
	pwzClass as PWSTR
	pwzUPN as PWSTR
end type

type SID_INFO as _SID_INFO
type PSID_INFO as _SID_INFO ptr

type _SID_INFO_LIST
	cItems as ULONG_
	aSidInfo(0 to 0) as SID_INFO
end type

type SID_INFO_LIST as _SID_INFO_LIST
type PSID_INFO_LIST as _SID_INFO_LIST ptr

type IEffectivePermission
	lpVtbl as IEffectivePermissionVtbl ptr
end type

type IEffectivePermissionVtbl_
	QueryInterface as function(byval This_ as IEffectivePermission ptr, byval riid as const IID const ptr, byval ppvObj as any ptr ptr) as HRESULT
	AddRef as function(byval This_ as IEffectivePermission ptr) as ULONG_
	Release as function(byval This_ as IEffectivePermission ptr) as ULONG_
	GetEffectivePermission as function(byval This_ as IEffectivePermission ptr, byval pguidObjectType as const GUID ptr, byval pUserSid as PSID, byval pszServerName as LPCWSTR, byval pSD as PSECURITY_DESCRIPTOR, byval ppObjectTypeList as POBJECT_TYPE_LIST ptr, byval pcObjectTypeListLength as ULONG_ ptr, byval ppGrantedAccessList as PACCESS_MASK ptr, byval pcGrantedAccessListLength as ULONG_ ptr) as HRESULT
end type

type LPEFFECTIVEPERMISSION as IEffectivePermission ptr

type ISecurityObjectTypeInfo
	lpVtbl as ISecurityObjectTypeInfoVtbl ptr
end type

type ISecurityObjectTypeInfoVtbl_
	QueryInterface as function(byval This_ as ISecurityObjectTypeInfo ptr, byval riid as const IID const ptr, byval ppvObj as any ptr ptr) as HRESULT
	AddRef as function(byval This_ as ISecurityObjectTypeInfo ptr) as ULONG_
	Release as function(byval This_ as ISecurityObjectTypeInfo ptr) as ULONG_
	GetInheritSource as function(byval si as SECURITY_INFORMATION, byval pACL as PACL, byval ppInheritArray as PINHERITED_FROM ptr) as HRESULT
end type

type LPSecurityObjectTypeInfo as ISecurityObjectTypeInfo ptr

'' TODO: const IID __attribute__((selectany)) IID_ISecurityInformation = {0x965fc360,0x16ff,0x11d0,{0x91,0xcb,0x0,0xaa,0x0,0xbb,0xb7,0x23}};
'' TODO: const IID __attribute__((selectany)) IID_ISecurityInformation2 = {0xc3ccfdb4,0x6f88,0x11d2,{0xa3,0xce,0x0,0xc0,0x4f,0xb1,0x78,0x2a}};
'' TODO: const IID __attribute__((selectany)) IID_IEffectivePermission = {0x3853dc76,0x9f35,0x407c,{0x88,0xa1,0xd1,0x93,0x44,0x36,0x5f,0xbc}};
'' TODO: const IID __attribute__((selectany)) IID_ISecurityObjectTypeInfo = {0xfc3066eb,0x79ef,0x444b,{0x91,0x11,0xd1,0x8a,0x75,0xeb,0xf2,0xfa}};

declare function CreateSecurityPage(byval psi as LPSECURITYINFO) as HPROPSHEETPAGE
declare function EditSecurity(byval hwndOwner as HWND, byval psi as LPSECURITYINFO) as WINBOOL

end extern
