#pragma once

#include once "crt/wchar.bi"
#include once "winapifamily.bi"
#include once "_mingw_unicode.bi"
#include once "isguids.bi"
#include once "exdisp.bi"
#include once "shldisp.bi"
#include once "knownfolders.bi"

extern "C"

#define _WIN32_IE &h0501
#define STR_MYDOCS_CLSID "{450D8FBA-AD25-11D0-98A8-0800361B1103}"
#define PSGUID_INTERNETSHORTCUT (&h000214a0, 0, 0, &hc0, 0, 0, 0, 0, 0, 0, &h46)
#define PSGUID_INTERNETSITE (__MSABI_LONG(&h000214a1), 0, 0, &hc0, 0, 0, 0, 0, 0, 0, &h46)
#define IDefViewID IUnknown
#define IID_IShellCopyHookA IID_ICopyHookA
#define IID_IShellCopyHookW IID_ICopyHookW
#define SID_LinkSite IID_IShellLinkW
#define SID_ShellFolderViewCB IID_IShellFolderViewCB
#define SID_SShellBrowser IID_IShellBrowser
#define SID_SShellDesktop CLSID_ShellDesktop

'' TODO: DEFINE_GUID (CLSID_NetworkDomain, 0x46e06680, 0x4bf0, 0x11d1, 0x83, 0xee, 0x00, 0xa0, 0xc9, 0x0d, 0xc8, 0x49);
'' TODO: DEFINE_GUID (CLSID_NetworkServer, 0xc0542a90, 0x4bf0, 0x11d1, 0x83, 0xee, 0x00, 0xa0, 0xc9, 0x0d, 0xc8, 0x49);
'' TODO: DEFINE_GUID (CLSID_NetworkShare, 0x54a754c0, 0x4bf0, 0x11d1, 0x83, 0xee, 0x00, 0xa0, 0xc9, 0x0d, 0xc8, 0x49);
'' TODO: DEFINE_GUID (CLSID_MyComputer, 0x20d04fe0, 0x3aea, 0x1069, 0xa2, 0xd8, 0x08, 0x00, 0x2b, 0x30, 0x30, 0x9d);
'' TODO: DEFINE_GUID (CLSID_Internet, 0x871c5380, 0x42a0, 0x1069, 0xa2, 0xea, 0x08, 0x00, 0x2b, 0x30, 0x30, 0x9d);
'' TODO: DEFINE_GUID (CLSID_RecycleBin, 0x645ff040, 0x5081, 0x101b, 0x9f, 0x08, 0x00, 0xaa, 0x00, 0x2f, 0x95, 0x4e);
'' TODO: DEFINE_GUID (CLSID_ControlPanel, 0x21ec2020, 0x3aea, 0x1069, 0xa2, 0xdd, 0x08, 0x00, 0x2b, 0x30, 0x30, 0x9d);
'' TODO: DEFINE_GUID (CLSID_Printers, 0x2227a280, 0x3aea, 0x1069, 0xa2, 0xde, 0x08, 0x00, 0x2b, 0x30, 0x30, 0x9d);
'' TODO: DEFINE_GUID (CLSID_MyDocuments, 0x450d8fba, 0xad25, 0x11d0, 0x98, 0xa8, 0x08, 0x00, 0x36, 0x1b, 0x11, 0x03);
'' TODO: DEFINE_GUID (CATID_BrowsableShellExt, __MSABI_LONG(0x00021490), 0, 0, 0xc0, 0, 0, 0, 0, 0, 0, 0x46);
'' TODO: DEFINE_GUID (CATID_BrowseInPlace, __MSABI_LONG(0x00021491), 0, 0, 0xc0, 0, 0, 0, 0, 0, 0, 0x46);
'' TODO: DEFINE_GUID (CATID_DeskBand, __MSABI_LONG(0x00021492), 0, 0, 0xc0, 0, 0, 0, 0, 0, 0, 0x46);
'' TODO: DEFINE_GUID (CATID_InfoBand, __MSABI_LONG(0x00021493), 0, 0, 0xc0, 0, 0, 0, 0, 0, 0, 0x46);
'' TODO: DEFINE_GUID (CATID_CommBand, __MSABI_LONG(0x00021494), 0, 0, 0xc0, 0, 0, 0, 0, 0, 0, 0x46);
'' TODO: DEFINE_GUID (FMTID_Intshcut, __MSABI_LONG(0x000214a0), 0, 0, 0xc0, 0, 0, 0, 0, 0, 0, 0x46);
'' TODO: DEFINE_GUID (FMTID_InternetSite, __MSABI_LONG(0x000214a1), 0, 0, 0xc0, 0, 0, 0, 0, 0, 0, 0x46);
'' TODO: DEFINE_GUID (CGID_Explorer, __MSABI_LONG(0x000214d0), 0, 0, 0xc0, 0, 0, 0, 0, 0, 0, 0x46);
'' TODO: DEFINE_GUID (CGID_ShellDocView, __MSABI_LONG(0x000214d1), 0, 0, 0xc0, 0, 0, 0, 0, 0, 0, 0x46);
'' TODO: DEFINE_GUID (CGID_ShellServiceObject, __MSABI_LONG(0x000214d2), 0, 0, 0xc0, 0, 0, 0, 0, 0, 0, 0x46);
'' TODO: DEFINE_GUID (CGID_ExplorerBarDoc, __MSABI_LONG(0x000214d3), 0, 0, 0xc0, 0, 0, 0, 0, 0, 0, 0x46);
'' TODO: DEFINE_GUID (IID_INewShortcutHookA, __MSABI_LONG(0x000214e1), 0, 0, 0xc0, 0, 0, 0, 0, 0, 0, 0x46);
'' TODO: DEFINE_GUID (IID_IExtractIconA, __MSABI_LONG(0x000214eb), 0, 0, 0xc0, 0, 0, 0, 0, 0, 0, 0x46);
'' TODO: DEFINE_GUID (IID_IShellDetails, __MSABI_LONG(0x000214ec), 0, 0, 0xc0, 0, 0, 0, 0, 0, 0, 0x46);
'' TODO: DEFINE_GUID (IID_ICopyHookA, __MSABI_LONG(0x000214ef), 0, 0, 0xc0, 0, 0, 0, 0, 0, 0, 0x46);
'' TODO: DEFINE_GUID (IID_IFileViewerA, __MSABI_LONG(0x000214f0), 0, 0, 0xc0, 0, 0, 0, 0, 0, 0, 0x46);
'' TODO: DEFINE_GUID (IID_IFileViewerSite, __MSABI_LONG(0x000214f3), 0, 0, 0xc0, 0, 0, 0, 0, 0, 0, 0x46);
'' TODO: DEFINE_GUID (IID_IShellExecuteHookA, __MSABI_LONG(0x000214f5), 0, 0, 0xc0, 0, 0, 0, 0, 0, 0, 0x46);
'' TODO: DEFINE_GUID (IID_IPropSheetPage, __MSABI_LONG(0x000214f6), 0, 0, 0xc0, 0, 0, 0, 0, 0, 0, 0x46);
'' TODO: DEFINE_GUID (IID_INewShortcutHookW, __MSABI_LONG(0x000214f7), 0, 0, 0xc0, 0, 0, 0, 0, 0, 0, 0x46);
'' TODO: DEFINE_GUID (IID_IFileViewerW, __MSABI_LONG(0x000214f8), 0, 0, 0xc0, 0, 0, 0, 0, 0, 0, 0x46);
'' TODO: DEFINE_GUID (IID_IExtractIconW, __MSABI_LONG(0x000214fa), 0, 0, 0xc0, 0, 0, 0, 0, 0, 0, 0x46);
'' TODO: DEFINE_GUID (IID_IShellExecuteHookW, __MSABI_LONG(0x000214fb), 0, 0, 0xc0, 0, 0, 0, 0, 0, 0, 0x46);
'' TODO: DEFINE_GUID (IID_ICopyHookW, __MSABI_LONG(0x000214fc), 0, 0, 0xc0, 0, 0, 0, 0, 0, 0, 0x46);
'' TODO: DEFINE_GUID (IID_IQueryInfo, __MSABI_LONG(0x00021500), 0, 0, 0xc0, 0, 0, 0, 0, 0, 0, 0x46);
'' TODO: DEFINE_GUID (IID_IBriefcaseStg, __MSABI_LONG(0x8bce1fa1), 0x0921, 0x101b, 0xb1, 0xff, 0x00, 0xdd, 0x01, 0x0c, 0xcc, 0x48);
'' TODO: DEFINE_GUID (IID_IURLSearchHook, __MSABI_LONG(0xac60f6a0), 0x0fd9, 0x11d0, 0x99, 0xcb, 0x00, 0xc0, 0x4f, 0xd6, 0x44, 0x97);
'' TODO: DEFINE_GUID (IID_ISearchContext, __MSABI_LONG(0x09f656a2), 0x41af, 0x480c, 0x88, 0xf7, 0x16, 0xcc, 0x0d, 0x16, 0x46, 0x15);
'' TODO: DEFINE_GUID (IID_IURLSearchHook2, __MSABI_LONG(0x5ee44da4), 0x6d32, 0x46e3, 0x86, 0xbc, 0x07, 0x54, 0x0d, 0xed, 0xd0, 0xe0);
'' TODO: DEFINE_GUID (IID_IDefViewID, __MSABI_LONG(0x985f64f0), 0xd410, 0x4e02, 0xbe, 0x22, 0xda, 0x07, 0xf2, 0xb5, 0xc5, 0xe1);
'' TODO: DEFINE_GUID (CLSID_FolderShortcut, __MSABI_LONG(0x0afaced1), 0xe828, 0x11d1, 0x91, 0x87, 0xb5, 0x32, 0xf1, 0xe9, 0x57, 0x5d);
'' TODO: DEFINE_GUID (IID_IDockingWindowSite, 0x2a342fc2, 0x7b26, 0x11d0, 0x8c, 0xa9, 0x0, 0xa0, 0xc9, 0x2d, 0xbf, 0xe8);
'' TODO: DEFINE_GUID (IID_IDockingWindowFrame, 0x47d2657a, 0x7b27, 0x11d0, 0x8c, 0xa9, 0x0, 0xa0, 0xc9, 0x2d, 0xbf, 0xe8);
'' TODO: DEFINE_GUID (IID_IShellIconOverlay, __MSABI_LONG(0x7d688a70), 0xc613, 0x11d0, 0x99, 0x9b, 0x00, 0xc0, 0x4f, 0xd6, 0x55, 0xe1);
'' TODO: DEFINE_GUID (IID_IShellIconOverlayIdentifier, __MSABI_LONG(0x0c6c4200), 0xc589, 0x11d0, 0x99, 0x9a, 0x00, 0xc0, 0x4f, 0xd6, 0x55, 0xe1);
'' TODO: DEFINE_GUID (IID_IShellFolderViewCB, __MSABI_LONG(0x2047e320), 0xf2a9, 0x11ce, 0xae, 0x65, 0x08, 0x00, 0x2b, 0x2e, 0x12, 0x62);
'' TODO: DEFINE_GUID (CLSID_CFSIconOverlayManager, __MSABI_LONG(0x63b51f81), 0xc868, 0x11d0, 0x99, 0x9c, 0x00, 0xc0, 0x4f, 0xd6, 0x55, 0xe1);
'' TODO: DEFINE_GUID (IID_IShellIconOverlayManager, __MSABI_LONG(0xf10b5e34), 0xdd3b, 0x42a7, 0xaa, 0x7d, 0x2f, 0x4e, 0xc5, 0x4b, 0xb0, 0x9b);
'' TODO: DEFINE_GUID (IID_IThumbnailCapture, 0x4ea39266, 0x7211, 0x409f, 0xb6, 0x22, 0xf6, 0x3d, 0xbd, 0x16, 0xc5, 0x33);
'' TODO: DEFINE_GUID (IID_IShellImageStore, 0x48c8118c, 0xb924, 0x11d1, 0x98, 0xd5, 0x0, 0xc0, 0x4f, 0xb6, 0x87, 0xda);
'' TODO: DEFINE_GUID (CLSID_ShellThumbnailDiskCache, 0x1ebdcf80, 0xa200, 0x11d0, 0xa3, 0xa4, 0x0, 0xc0, 0x4f, 0xd7, 0x6, 0xec);
'' TODO: DEFINE_GUID (SID_DefView, 0x6d12fe80, 0x7911, 0x11cf, 0x95, 0x34, 0x00, 0x00, 0xc0, 0x5b, 0xae, 0x0b);
'' TODO: DEFINE_GUID (CGID_DefView, 0x4af07f10, 0xd231, 0x11d0, 0xb9, 0x42, 0x0, 0xa0, 0xc9, 0x3, 0x12, 0xe1);
'' TODO: DEFINE_GUID (CLSID_MenuBand, 0x5b4dae26, 0xb807, 0x11d0, 0x98, 0x15, 0x0, 0xc0, 0x4f, 0xd9, 0x19, 0x72);
'' TODO: DEFINE_GUID (IID_IShellFolderBand, 0x7fe80cc8, 0xc247, 0x11d0, 0xb9, 0x3a, 0x0, 0xa0, 0xc9, 0x3, 0x12, 0xe1);
'' TODO: DEFINE_GUID (IID_IDefViewFrame, __MSABI_LONG(0x710eb7a0), 0x45ed, 0x11d0, 0x92, 0x4a, 0x00, 0x20, 0xaf, 0xc7, 0xac, 0x4d);
'' TODO: DEFINE_GUID (VID_LargeIcons, __MSABI_LONG(0x0057d0e0), 0x3573, 0x11cf, 0xae, 0x69, 0x08, 0x00, 0x2b, 0x2e, 0x12, 0x62);
'' TODO: DEFINE_GUID (VID_SmallIcons, __MSABI_LONG(0x089000c0), 0x3573, 0x11cf, 0xae, 0x69, 0x08, 0x00, 0x2b, 0x2e, 0x12, 0x62);
'' TODO: DEFINE_GUID (VID_List, __MSABI_LONG(0x0e1fa5e0), 0x3573, 0x11cf, 0xae, 0x69, 0x08, 0x00, 0x2b, 0x2e, 0x12, 0x62);
'' TODO: DEFINE_GUID (VID_Details, __MSABI_LONG(0x137e7700), 0x3573, 0x11cf, 0xae, 0x69, 0x08, 0x00, 0x2b, 0x2e, 0x12, 0x62);
'' TODO: DEFINE_GUID (VID_Tile, __MSABI_LONG(0x65f125e5), 0x7be1, 0x4810, 0xba, 0x9d, 0xd2, 0x71, 0xc8, 0x43, 0x2c, 0xe3);
'' TODO: DEFINE_GUID (VID_Content, __MSABI_LONG(0x30c2c434), 0x0889, 0x4c8d, 0x98, 0x5d, 0xa9, 0xf7, 0x18, 0x30, 0xb0, 0xa9);
'' TODO: DEFINE_GUID (VID_Thumbnails, 0x8bebb290, 0x52d0, 0x11d0, 0xb7, 0xf4, 0x0, 0xc0, 0x4f, 0xd7, 0x6, 0xec);
'' TODO: DEFINE_GUID (VID_ThumbStrip, 0x8eefa624, 0xd1e9, 0x445b, 0x94, 0xb7, 0x74, 0xfb, 0xce, 0x2e, 0xa1, 0x1a);
'' TODO: DEFINE_GUID (SID_SInPlaceBrowser, 0x1d2ae02b, 0x3655, 0x46cc, 0xb6, 0x3a, 0x28, 0x59, 0x88, 0x15, 0x3b, 0xca);
'' TODO: DEFINE_GUID (IID_IDiscardableBrowserProperty, 0x49c3de7c, 0xd329, 0x11d0, 0xab, 0x73, 0x00, 0xc0, 0x4f, 0xc3, 0x3e, 0x80);
'' TODO: DEFINE_GUID (IID_IShellChangeNotify, __MSABI_LONG(0xd82be2b1), 0x5764, 0x11d0, 0xa9, 0x6e, 0x00, 0xc0, 0x4f, 0xd7, 0x05, 0xa2);

#define IID_IFileViewer __MINGW_NAME_AW(IID_IFileViewer)
#define IID_IShellLink __MINGW_NAME_AW(IID_IShellLink)
#define IID_IExtractIcon __MINGW_NAME_AW(IID_IExtractIcon)
#define IID_IShellCopyHook __MINGW_NAME_AW(IID_IShellCopyHook)
#define IID_IShellExecuteHook __MINGW_NAME_AW(IID_IShellExecuteHook)
#define IID_INewShortcutHook __MINGW_NAME_AW(IID_INewShortcutHook)
#define SID_SInternetExplorer IID_IWebBrowserApp
#define SID_SProgressUI CLSID_ProgressDialog
#define SID_SUrlHistory CLSID_CUrlHistory
#define SID_SWebBrowserApp IID_IWebBrowserApp
#define SID_SWebBrowserEventsService IID_IWebBrowserEventsService

extern CLSID_CUrlHistory as const GUID
extern CLSID_CURLSearchHook as const GUID
extern IID_IObjMgr as const GUID
extern IID_IACList as const GUID
extern IID_IACList2 as const GUID
extern IID_ICurrentWorkingDirectory as const GUID
extern CLSID_AutoComplete as const GUID
extern CLSID_ACLHistory as const GUID
extern CLSID_ACListISF as const GUID
extern CLSID_ACLMRU as const GUID
extern CLSID_ACLMulti as const GUID
extern CLSID_ProgressDialog as const GUID
extern IID_IProgressDialog as const GUID
extern SID_STopLevelBrowser as const GUID

#define PSGUID_SHELLDETAILS (&h28636aa6, &h953d, &h11d2, &hb5, &hd6, &h0, &hc0, &h4f, &hd9, &h18, &hd0)
#define PID_FINDDATA 0
#define PID_NETRESOURCE 1
#define PID_DESCRIPTIONID 2
#define PID_WHICHFOLDER 3
#define PID_NETWORKLOCATION 4
#define PID_COMPUTERNAME 5
#define PID_DISPLAY_PROPERTIES 0
#define PID_INTROTEXT 1
#define PID_SYNC_COPY_IN 2
#define PIDSI_ARTIST 2
#define PIDSI_SONGTITLE 3
#define PIDSI_ALBUM 4
#define PIDSI_YEAR 5
#define PIDSI_COMMENT 6
#define PIDSI_TRACK 7
#define PIDSI_GENRE 11
#define PIDSI_LYRICS 12
#define PID_MISC_STATUS 2
#define PID_MISC_ACCESSCOUNT 3
#define PID_MISC_OWNER 4
#define PID_HTMLINFOTIPFILE 5
#define PID_MISC_PICS 6
#define PIDDRSI_PROTECTED 2
#define PIDDRSI_DESCRIPTION 3
#define PIDDRSI_PLAYCOUNT 4
#define PIDDRSI_PLAYSTARTS 5
#define PIDDRSI_PLAYEXPIRES 6
#define PID_DISPLACED_FROM 2
#define PID_DISPLACED_DATE 3
#define PSGUID_BRIEFCASE (&h328d8b21, &h7729, &h4bfc, &h95, &h4c, &h90, &h2b, &h32, &h9d, &h56, &hb0)
#define PSGUID_MISC (&h9b174b34, &h40ff, &h11d2, &ha2, &h7e, &h0, &hc0, &h4f, &hc3, &h8, &h71)
#define PSGUID_WEBVIEW (&hf2275480, &hf782, &h4291, &hbd, &h94, &hf1, &h36, &h93, &h51, &h3a, &hec)
#define PSGUID_MUSIC (&h56a3372e, &hce9c, &h11d2, &h9f, &he, &h0, &h60, &h97, &hc6, &h86, &hf6)
#define PSGUID_DRM (&haeac19e4, &h89ae, &h4508, &hb9, &hb7, &hbb, &h86, &h7a, &hbe, &he2, &hed)
#define PSGUID_VIDEO (&h64440491, &h4c8b, &h11d1, &h8b, &h70, &h8, &h0, &h36, &hb1, &h1a, &h3)
#define PSGUID_IMAGEPROPERTIES (&h14b81da1, &h0135, &h4d31, &h96, &hd9, &h6c, &hbf, &hc9, &h67, &h1a, &h99)
#define PSGUID_CUSTOMIMAGEPROPERTIES (&h7ecd8b0e, &hc136, &h4a9b, &h94, &h11, &h4e, &hbd, &h66, &h73, &hcc, &hc3)
#define PSGUID_LIBRARYPROPERTIES (&h5d76b67f, &h9b3d, &h44bb, &hb6, &hae, &h25, &hda, &h4f, &h63, &h8a, &h67)
#define PSGUID_DISPLACED (&h9b174b33, &h40ff, &h11d2, &ha2, &h7e, &h0, &hc0, &h4f, &hc3, &h8, &h71)

extern CLSID_FileTypes as const GUID
extern CLSID_ActiveDesktop as const GUID
extern IID_IActiveDesktop as const GUID
extern IID_IActiveDesktopP as const GUID
extern IID_IADesktopP2 as const GUID
extern IID_ISynchronizedCallBack as const GUID
extern IID_IQueryAssociations as const GUID
extern CLSID_QueryAssociations as const GUID
extern IID_IColumnProvider as const GUID
extern CLSID_LinkColumnProvider as const GUID
extern CGID_ShortCut as const GUID
extern IID_INamedPropertyBag as const GUID
extern CLSID_InternetButtons as const GUID
extern CLSID_MSOButtons as const GUID
extern CLSID_ToolbarExtButtons as const GUID
extern CLSID_DarwinAppPublisher as const GUID
extern CLSID_DocHostUIHandler as const GUID
extern FMTID_ShellDetails as const GUID
extern FMTID_Storage as const GUID
extern FMTID_ImageProperties as const GUID
extern FMTID_CustomImageProperties as const GUID
extern FMTID_LibraryProperties as const GUID
extern FMTID_Displaced as const GUID
extern FMTID_Briefcase as const GUID
extern FMTID_Misc as const GUID
extern FMTID_WebView as const GUID
extern FMTID_MUSIC as const GUID
extern FMTID_DRM as const GUID

#define PIDVSI_STREAM_NAME &h00000002
#define PIDVSI_FRAME_WIDTH &h00000003
#define PIDVSI_FRAME_HEIGHT &h00000004
#define PIDVSI_TIMELENGTH &h00000007
#define PIDVSI_FRAME_COUNT &h00000005
#define PIDVSI_FRAME_RATE &h00000006
#define PIDVSI_DATA_RATE &h00000008
#define PIDVSI_SAMPLE_SIZE &h00000009
#define PIDVSI_COMPRESSION &h0000000a
#define PIDVSI_STREAM_NUMBER &h0000000b
#define PSGUID_AUDIO (&h64440490, &h4c8b, &h11d1, &h8b, &h70, &h8, &h0, &h36, &hb1, &h1a, &h3)
#define PIDASI_FORMAT &h00000002
#define PIDASI_TIMELENGTH &h00000003
#define PIDASI_AVG_DATA_RATE &h00000004
#define PIDASI_SAMPLE_RATE &h00000005
#define PIDASI_SAMPLE_SIZE &h00000006
#define PIDASI_CHANNEL_COUNT &h00000007
#define PIDASI_STREAM_NUMBER &h00000008
#define PIDASI_STREAM_NAME &h00000009
#define PIDASI_COMPRESSION &h0000000a
#define PSGUID_CONTROLPANEL (&h305ca226, &hd286, &h468e, &hb8, &h48, &h2b, &h2e, &h8e, &h69, &h7b, &h74)
#define PID_CONTROLPANEL_CATEGORY 2
#define PSGUID_VOLUME (&h9b174b35, &h40ff, &h11d2, &ha2, &h7e, &h0, &hc0, &h4f, &hc3, &h8, &h71)
#define PSGUID_SHARE (&hd8c3986f, &h813b, &h449c, &h84, &h5d, &h87, &hb9, &h5d, &h67, &h4a, &hde)
#define PSGUID_LINK (&hb9b4b3fc, &h2b51, &h4a42, &hb5, &hd8, &h32, &h41, &h46, &haf, &hcf, &h25)
#define PSGUID_QUERY_D (&h49691c90, &h7e17, &h101a, &ha9, &h1c, &h08, &h00, &h2b, &h2e, &hcd, &ha9)
#define PSGUID_SUMMARYINFORMATION (__MSABI_LONG(&hf29f85e0), &h4ff9, &h1068, &hab, &h91, &h08, &h00, &h2b, &h27, &hb3, &hd9)
#define PSGUID_DOCUMENTSUMMARYINFORMATION (__MSABI_LONG(&hd5cdd502), &h2e9c, &h101b, &h93, &h97, &h08, &h00, &h2b, &h2c, &hf9, &hae)
#define PSGUID_MEDIAFILESUMMARYINFORMATION (__MSABI_LONG(&h64440492), &h4c8b, &h11d1, &h8b, &h70, &h08, &h00, &h36, &hb1, &h1a, &h03)
#define PSGUID_IMAGESUMMARYINFORMATION (__MSABI_LONG(&h6444048f), &h4c8b, &h11d1, &h8b, &h70, &h8, &h00, &h36, &hb1, &h1a, &h03)
#define PID_VOLUME_FREE 2
#define PID_VOLUME_CAPACITY 3
#define PID_VOLUME_FILESYSTEM 4
#define PID_SHARE_CSC_STATUS 2
#define PID_LINK_TARGET 2
#define PID_LINK_TARGET_TYPE 3
#define PID_QUERY_RANK 2

extern FMTID_Volume as const GUID
extern FMTID_Query as const GUID
extern CLSID_HWShellExecute as const GUID
extern CLSID_DragDropHelper as const GUID
extern CLSID_CAnchorBrowsePropertyPage as const GUID
extern CLSID_CImageBrowsePropertyPage as const GUID
extern CLSID_CDocBrowsePropertyPage as const GUID
extern SID_STopWindow as const GUID
extern SID_SGetViewFromViewDual as const GUID
extern CLSID_FolderItem as const GUID
extern CLSID_FolderItemsMultiLevel as const GUID
extern CLSID_NewMenu as const GUID
extern BHID_SFObject as const GUID
extern BHID_SFUIObject as const GUID
extern BHID_SFViewObject as const GUID
extern BHID_Storage as const GUID
extern BHID_Stream as const GUID
extern BHID_RandomAccessStream as const GUID
extern BHID_LinkTargetItem as const GUID
extern BHID_StorageEnum as const GUID
extern BHID_Transfer as const GUID
extern BHID_PropertyStore as const GUID
extern BHID_ThumbnailHandler as const GUID
extern BHID_EnumItems as const GUID
extern BHID_DataObject as const GUID
extern BHID_AssociationArray as const GUID
extern BHID_Filter as const GUID
extern BHID_EnumAssocHandlers as const GUID
extern IID_IDocViewSite as const GUID
extern CLSID_QuickLinks as const GUID
extern CLSID_ISFBand as const GUID
extern IID_CDefView as const GUID
extern CLSID_ShellFldSetExt as const GUID
extern SID_SMenuBandChild as const GUID
extern SID_SMenuBandParent as const GUID
extern SID_SMenuPopup as const GUID
extern SID_SMenuBandBottomSelected as const GUID
extern SID_SMenuBandBottom as const GUID
extern SID_MenuShellFolder as const GUID
extern SID_SMenuBandContextMenuModifier as const GUID
extern SID_SMenuBandBKContextMenu as const GUID
extern CGID_MENUDESKBAR as const GUID
extern SID_SMenuBandTop as const GUID
extern CLSID_MenuToolbarBase as const GUID
extern IID_IBanneredBar as const GUID
extern CLSID_MenuBandSite as const GUID
extern SID_SCommDlgBrowser as const GUID
extern CPFG_LOGON_USERNAME as const GUID
extern CPFG_LOGON_PASSWORD as const GUID
extern CPFG_SMARTCARD_USERNAME as const GUID
extern CPFG_SMARTCARD_PIN as const GUID
extern CPFG_CREDENTIAL_PROVIDER_LOGO as const GUID
extern CPFG_CREDENTIAL_PROVIDER_LABEL as const GUID
extern FOLDERTYPEID_Invalid as const GUID
extern FOLDERTYPEID_Generic as const GUID
extern FOLDERTYPEID_GenericSearchResults as const GUID
extern FOLDERTYPEID_GenericLibrary as const GUID
extern FOLDERTYPEID_Documents as const GUID
extern FOLDERTYPEID_Pictures as const GUID
extern FOLDERTYPEID_Music as const GUID
extern FOLDERTYPEID_Videos as const GUID
extern FOLDERTYPEID_UserFiles as const GUID
extern FOLDERTYPEID_UsersLibraries as const GUID
extern FOLDERTYPEID_OtherUsers as const GUID
extern FOLDERTYPEID_PublishedItems as const GUID
extern FOLDERTYPEID_Communications as const GUID
extern FOLDERTYPEID_Contacts as const GUID
extern FOLDERTYPEID_StartMenu as const GUID
extern FOLDERTYPEID_RecordedTV as const GUID
extern FOLDERTYPEID_SavedGames as const GUID
extern FOLDERTYPEID_OpenSearch as const GUID
extern FOLDERTYPEID_SearchConnector as const GUID
extern FOLDERTYPEID_AccountPictures as const GUID
extern FOLDERTYPEID_Games as const GUID
extern FOLDERTYPEID_ControlPanelCategory as const GUID
extern FOLDERTYPEID_ControlPanelClassic as const GUID
extern FOLDERTYPEID_Printers as const GUID
extern FOLDERTYPEID_RecycleBin as const GUID
extern FOLDERTYPEID_SoftwareExplorer as const GUID
extern FOLDERTYPEID_CompressedFolder as const GUID
extern FOLDERTYPEID_NetworkExplorer as const GUID
extern FOLDERTYPEID_Searches as const GUID
extern FOLDERTYPEID_SearchHome as const GUID
extern SYNCMGR_OBJECTID_Icon as const GUID
extern SYNCMGR_OBJECTID_EventStore as const GUID
extern SYNCMGR_OBJECTID_ConflictStore as const GUID
extern SYNCMGR_OBJECTID_BrowseContent as const GUID
extern SYNCMGR_OBJECTID_ShowSchedule as const GUID
extern SYNCMGR_OBJECTID_QueryBeforeActivate as const GUID
extern SYNCMGR_OBJECTID_QueryBeforeDeactivate as const GUID
extern SYNCMGR_OBJECTID_QueryBeforeEnable as const GUID
extern SYNCMGR_OBJECTID_QueryBeforeDisable as const GUID
extern SYNCMGR_OBJECTID_QueryBeforeDelete as const GUID
extern SYNCMGR_OBJECTID_EventLinkClick as const GUID
extern EP_NavPane as const GUID
extern EP_Commands as const GUID
extern EP_Commands_Organize as const GUID
extern EP_Commands_View as const GUID
extern EP_DetailsPane as const GUID
extern EP_PreviewPane as const GUID
extern EP_QueryPane as const GUID
extern EP_AdvQueryPane as const GUID
extern EP_StatusBar as const GUID
extern EP_Ribbon as const GUID
extern CATID_LocationFactory as const GUID
extern CATID_LocationProvider as const GUID
extern ItemCount_Property_GUID as const GUID
extern SelectedItemCount_Property_GUID as const GUID
extern ItemIndex_Property_GUID as const GUID
extern CATID_SearchableApplication as const GUID

end extern
