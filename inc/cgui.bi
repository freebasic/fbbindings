#pragma once

#include once "crt/long.bi"
#include once "crt/stdio.bi"
#include once "crt/errno.bi"
#include once "crt/stdlib.bi"

'' The following symbols have been renamed:
''     #define ON => ON_

extern "C"

type BITMAP as BITMAP_
type FONT as FONT_
type DATAFILE as DATAFILE_

#define CGUI_H
#define CGUI_HAS_INLINE
#define CGUI_INLINE_PROVIDE_CODE
#define CGUI_VERSION_MAJOR 2
#define CGUI_VERSION_MINOR 0
#define CGUI_VERSION_PATCH 3
#define CGUI_VERSION_STRING "2.0.3"
#define CGUI_DATE 20091111
#define CGUI_DATE_STRING "Nov 11, 2009"
#define CGUI_INIT_CODE 0
#define CGUI_INIT_LOAD 0
#define CGUI_INIT_WINDOWED 1
#define CGUI_INIT_FULLSCREEN 2
#define CGUI_INIT_KEEP_CURRENT 0

declare function InitCguiEx(byval w as long, byval h as long, byval colour_depth as long, byval errno_ptr as long ptr, byval atexit_ptr as function(byval f as sub()) as long) as long

#define InitCguiLoadMode() InitCguiEx(0, CGUI_INIT_LOAD, CGUI_INIT_CODE, @errno, cptr(function cdecl(byval as sub cdecl()) as long, atexit))
#define InitCguiFullscreenMode() InitCguiEx(0, CGUI_INIT_FULLSCREEN, CGUI_INIT_CODE, @errno, cptr(function cdecl(byval as sub cdecl()) as long, atexit))
#define InitCguiWindowedMode() InitCguiEx(0, CGUI_INIT_WINDOWED, CGUI_INIT_CODE, @errno, cptr(function cdecl(byval as sub cdecl()) as long, atexit))
#define InitCguiKeepCurrent() InitCguiEx(0, CGUI_INIT_KEEP_CURRENT, CGUI_INIT_CODE, @errno, cptr(function cdecl(byval as sub cdecl()) as long, atexit))
#define InitCgui(w, h, bpp) InitCguiEx(w, h, bpp, @errno, cptr(function cdecl(byval as sub cdecl()) as long, atexit))

declare sub DeInitCgui()
declare sub CguiUseUTF8()
declare function CguiParseLabels(byval state as long) as long

#if defined(CGUI_STATICLINK) or ((not defined(CGUI_STATICLINK)) and (defined(__FB_DOS__) or defined(__FB_LINUX__)))
	extern cgui_ver as long
	extern cgui_rev as long
	extern cgui_minor_rev as long
	extern cgui_release_date as long
#else
	extern import cgui_ver as long
	extern import cgui_rev as long
	extern import cgui_minor_rev as long
	extern import cgui_release_date as long
#endif

#define DIR_TOPLEFT 1
#define DIR_RIGHT 2
#define DIR_LEFT 4
#define DIR_DOWNLEFT 8
#define DIR_DOWN &h10
#define AUTOINDICATOR &h007fffff

'' TODO: #define TOPLEFT DIR_TOPLEFT,AUTOINDICATOR
'' TODO: #define RIGHT DIR_RIGHT,AUTOINDICATOR
'' TODO: #define DOWNLEFT DIR_DOWNLEFT,AUTOINDICATOR
'' TODO: #define LEFT DIR_LEFT,AUTOINDICATOR
'' TODO: #define DOWN DIR_DOWN,AUTOINDICATOR

#define ALIGNCENTRE &h00800000
#define ALIGNBOTTOM &h01000000
#define ALIGNRIGHT &h02000000
#define HORIZONTAL &h04000000
#define VERTICAL &h08000000
#define FILLSPACE &h10000000
#define EQUALWIDTH &h20000000
#define EQUALHEIGHT &h40000000

'' TODO: #define ADAPTIVE 0,AUTOINDICATOR
'' TODO: #define FILLSCREEN 1,AUTOINDICATOR

declare function MkDialogue(byval width_ as long, byval height as long, byval label as const zstring ptr, byval attr as long) as long

#define W_SIBLING (1 shl 0)
#define W_NOMOVE (1 shl 2)
#define W_FLOATING (1 shl 3)
#define W_TOP (1 shl 4)
#define W_BOTTOM (1 shl 5)
#define W_LEFT (1 shl 6)
#define W_RIGHT (1 shl 7)
#define W_CENTRE_H (W_LEFT or W_RIGHT)
#define W_CENTRE_V (W_TOP or W_BOTTOM)
#define W_CENTRE (W_CENTRE_H or W_CENTRE_V)

declare sub DisplayWin()
declare sub CloseWin(byval dummy as any ptr)
declare sub SetWindowPosition(byval x as long, byval y as long)
declare sub GetWinInfo(byval id as long, byval x as long ptr, byval y as long ptr, byval width_ as long ptr, byval height as long ptr)
declare sub DesktopImage(byval bmp as BITMAP ptr)
declare function CurrentWindow() as long
declare sub SetOperatingWindow(byval winid as long)
declare function Req(byval winheader as const zstring ptr, byval format_text as const zstring ptr) as long
declare function Request(byval title as const zstring ptr, byval options as long, byval width_ as long, byval format as const zstring ptr, ...) as long
declare sub RedrawScreen()
declare sub ScrMode(byval CallBack as sub())
declare function MkProgressWindow(byval wlabel as const zstring ptr, byval blabel as const zstring ptr, byval w as long) as long

#define ID_DESKTOP cgui_desktop_id

#if defined(CGUI_STATICLINK) or ((not defined(CGUI_STATICLINK)) and (defined(__FB_DOS__) or defined(__FB_LINUX__)))
	extern cgui_desktop_id as long
#else
	extern import cgui_desktop_id as long
#endif

declare function MkMenu(byval text as const zstring ptr, byval CallBack as sub(byval as any ptr), byval data_ as any ptr) as long
declare function MakeMenuBar() as long
declare function MkMenuBarItem(byval text as const zstring ptr, byval CallBack as sub(byval as any ptr), byval data_ as any ptr) as long
declare sub EndMenuBar()
declare function MkScratchMenu(byval id as long, byval CallBack as sub(byval as any ptr), byval data_ as any ptr) as long
declare function MkSingleMenu(byval x as long, byval y as long, byval text as const zstring ptr, byval CallBack as sub(byval as any ptr), byval data_ as any ptr) as long
declare function MkMenuItem(byval sub_ as long, byval text as const zstring ptr, byval shortcut as const zstring ptr, byval CallBack as sub(byval as any ptr), byval data_ as any ptr) as long
declare function MkMenuRadio(byval selvar as long ptr, byval n as long, ...) as long
declare function MkMenuCheck(byval checkvar as long ptr, byval text as const zstring ptr) as long
declare function HookMenuClose(byval CloseHook as sub(byval as any ptr), byval data_ as any ptr) as long
declare function MkGroove() as long
declare function AddButton(byval x as long, byval y as long, byval label as const zstring ptr, byval CallBack as sub(byval data_ as any ptr), byval data_ as any ptr) as long
declare function AddCheck(byval x as long, byval y as long, byval label as const zstring ptr, byval sel as long ptr) as long

#define R_HORIZONTAL 0
#define R_VERTICAL 1

declare function AddFlip(byval x as long, byval y as long, byval label as const zstring ptr, byval strs as const zstring const ptr ptr, byval sel as long ptr) as long
declare function AddDropDown(byval x as long, byval y as long, byval width_ as long, byval label as const zstring ptr, byval sel as long ptr, byval data_ as const any ptr, byval n as long, byval CallBack as sub(byval data_ as const any ptr, byval i as long, byval s as zstring ptr)) as long
declare function AddDropDownS(byval x as long, byval y as long, byval width_ as long, byval label as const zstring ptr, byval sel as long ptr, byval strs as const zstring const ptr ptr, byval n as long) as long

#if defined(CGUI_STATICLINK) or ((not defined(CGUI_STATICLINK)) and (defined(__FB_DOS__) or defined(__FB_LINUX__)))
	extern cgui_drop_down_list_row_spacing as long
#else
	extern import cgui_drop_down_list_row_spacing as long
#endif

declare function MkRadioContainer(byval x as long, byval y as long, byval var_ as long ptr, byval direction as long) as long
declare function AddRadioButton(byval name_ as const zstring ptr) as long
declare sub EndRadioContainer()
declare function AddIcon(byval id as long, byval x as long, byval y as long, byval iconname as const zstring ptr, byval CallBack as sub(byval as any ptr), byval data_ as any ptr) as long
declare function MkCanvas(byval x as long, byval y as long, byval width_ as long, byval height as long, byval CallBack as sub(byval bmp as BITMAP ptr, byval x as long, byval y as long, byval data_ as any ptr), byval data_ as any ptr) as long
declare function GetRulerTabList(byval id as long, byval n as long ptr) as long ptr
declare function FlipRulerTab(byval id as long, byval x as long) as long
declare function AddTabRuler(byval x as long, byval y as long, byval width_ as long, byval height as long, byval dx as long, byval options as long, byval CallBack as sub(byval data_ as any ptr, byval x as long, byval tabs as long ptr, byval n as long), byval data_ as any ptr) as long

#define TR_SHOWPOS 1

declare function UpdateProgressValue(byval id as long, byval percent as long) as long
declare function AddProgressBar(byval x as long, byval y as long, byval w as long, byval h as long) as long

#define SL_SCALE 1
#define SL_LABEL 2
#define SL_STYLE1 4
#define SL_STYLE2 8
#define SL_STYLE3 &h20

declare function AddSlider(byval x as long, byval y as long, byval length as long, byval ctrl as long ptr, byval start as long, byval end_ as long, byval option_ as long, byval id as long) as long
declare function AddSliderFloat(byval x as long, byval y as long, byval length as long, byval ctrl as single ptr, byval start as single, byval end_ as single, byval ndecimals as long, byval option_ as long, byval id as long) as long
declare function HookSpinButtons(byval id as long, byval var_ as long ptr, byval delta1 as long, byval delta2 as long, byval minv as long, byval maxv as long) as long
declare function AddTag(byval x as long, byval y as long, byval tag as const zstring ptr) as long
declare function AddStatusField(byval x as long, byval y as long, byval width_ as long, byval FormatFunc as sub(byval data_ as any ptr, byval string_ as zstring ptr), byval data_ as any ptr) as long
declare function AddTextBox(byval x as long, byval y as long, byval text as const zstring ptr, byval width_ as long, byval nrows as long, byval option_ as long) as long
declare sub TextboxHighlighting(byval id as long, byval bgcolor as long, byval textcolor as long, byval line_nr as long)
declare sub TextboxScrollDownOneLine(byval id as long)
declare function TextboxGetHighlightedText(byval id as long) as const zstring ptr

#define TB_FRAMERAISE &h80000000
#define TB_FRAMESINK &h40000000
#define TB_PREFORMAT &h20000000
#define TB_LINEFEED_ &h10000000
#define TB_FIXFONT &h08000000
#define TB_WHITE &h04000000
#define TB_TEXTFILE &h02000000
#define TB_FOCUS_END &h01000000

declare function UpdateTextBoxText(byval id as long, byval s as const zstring ptr) as long
declare function AddEditBox(byval x as long, byval y as long, byval width_ as long, byval label as const zstring ptr, byval format as long, byval string_buffer_size as long, byval data_ as any ptr) as long

#define TERMINATE_EDIT 999

declare sub CguiEditBoxSetSelectionMode(byval mode as long)
declare sub GetEditData(byval scan as long ptr, byval ascii as long ptr, byval offset as long ptr)
declare sub SetEditData(byval scan as long, byval ascii as long, byval offset as long)
declare function TabOnCR(byval id as long) as long

#define FBYTE 1
#define FSHORT 2
#define FINT 3
#define FLONG 4
#define FSTRING 5
#define FPTRSTR 6
#define FPOINTS 7
#define FBPOINTS 8
#define FFLOAT 9
#define FHEX1 10
#define FHEX2 11
#define FHEX4 12
#define FOCT1 13
#define FOCT2 14
#define FOCT3 15
#define FOCT4 16
#define FNAME &h20
#define FBLANK0 &h40
#define FUNDEF &h6000
#define B_UNDEF_VAL &hFF
#define S_UNDEF_VAL &h8000
#define I_UNDEF_VAL cast(clong, &h80000000)
#define L_UNDEF_VAL cast(clong, &h80000000)
#define P_UNDEF_VAL &h8000
#define BP_UNDEF_VAL &h80

declare sub Refresh(byval id as long)
declare sub DeActivate(byval id as long)
declare sub Activate(byval id as long)
declare function CguiLoadImage(byval filename as const zstring ptr, byval imagename as const zstring ptr, byval transp as long, byval id as long) as long
declare function InsertPoint(byval id as long) as long

#define IMAGE_BMP 0
#define IMAGE_TRANS_BMP 1
#define IMAGE_RLE_SPRITE 2
#define IMAGE_CMP_SPRITE 3

declare function RegisterImage(byval data_ as any ptr, byval imagename as const zstring ptr, byval type_ as long, byval id as long) as long
declare function GetRegisteredImage(byval name_ as const zstring ptr, byval type_ as long ptr, byval id as long) as const any ptr

#define LEFT_MOUSE 1
#define RIGHT_MOUSE 2

declare sub SetObjectSlidable(byval id as long, byval Slider as function(byval x as long, byval y as long, byval src as any ptr, byval id as long, byval reason as long) as long, byval buttons as long, byval data_ as any ptr)
declare sub SetObjectDouble(byval id as long, byval DoubleCall as sub(byval as any ptr), byval data_ as any ptr, byval button as long)
declare sub SetObjectGrippable(byval id as long, byval Grip as function(byval src as any ptr, byval id as long, byval reason as long) as any ptr, byval flags as long, byval buttons as long, byval data_ as any ptr)
declare sub SetObjectDroppable(byval id as long, byval Drop as function(byval dest as any ptr, byval id as long, byval src as any ptr, byval reason as long, byval flags as long) as long, byval flags as long, byval data_ as any ptr)

#define DD_GRIPPED 0
#define DD_UNGRIPPED 1
#define DD_SUCCESS 2
#define DD_OVER_GRIP 3
#define DD_OVER_DROP 4
#define DD_END_OVER_DROP 5
#define SL_OVER 6
#define SL_OVER_END 7
#define SL_STARTED 8
#define SL_PROGRESS 9
#define SL_STOPPED 10

declare function ToolTipText(byval id as long, byval text as const zstring ptr) as long
declare sub CguiSetToolTipDelay(byval delay as long)
declare sub CguiSetToolTipAnimation(byval step_ as long, byval delay as long)
declare function SetView(byval id as long, byval flags as long) as long

#define SV_HIDE_LABEL 1
#define SV_HIDE_ICON 2
#define SV_NO_TOOLTIP 4
#define SV_ONLY_BRIEF 8
#define SV_ONLY_LONG 16
#define SV_PREFERE_BRIEF 32
#define SV_PREFERE_LONG 0

declare function RegisterDragFlag(byval flag as long) as long
declare function UnRegisterDragFlag(byval flag as long) as long
declare function SetMouseButtons(byval id as long, byval buttons as long) as long
declare sub Remove(byval id as long)
declare sub Destroy(byval id as long)
declare function GetPressedButton(byval id as long) as long
declare sub PointerOn(byval id as long)
declare sub ModifyHeader(byval id as long, byval newtag as zstring ptr)
declare function AddHandler(byval id as long, byval Handler as sub(byval data_ as any ptr), byval data_ as any ptr) as long
declare sub Click(byval id as long)
declare function GetObjectPosition(byval id as long, byval x as long ptr, byval y as long ptr, byval wx as long ptr, byval wy as long ptr) as long
declare sub SetBlitLimit(byval x1 as long, byval y1 as long, byval x2 as long, byval y2 as long)

#if defined(CGUI_STATICLINK) or ((not defined(CGUI_STATICLINK)) and (defined(__FB_DOS__) or defined(__FB_LINUX__)))
	extern cgui_use_vsync as long
#else
	extern import cgui_use_vsync as long
#endif

#define CT_BORDER 1
#define CT_OBJECT_TABLE 2

declare function StartContainer(byval x as long, byval y as long, byval width_ as long, byval height as long, byval label as const zstring ptr, byval options as long) as long
declare sub EndContainer()
declare sub SelectContainer(byval id as long)
declare function SetSpacing(byval id as long, byval leftx as long, byval xdist as long, byval rightx as long, byval topy as long, byval ydist as long, byval boty as long) as long
declare sub SetMeasure(byval leftx as long, byval xdist as long, byval rightx as long, byval topy as long, byval ydist as long, byval boty as long)
declare sub SetDistance(byval xdist as long, byval ydist as long)
declare sub ReBuildContainer(byval id as long)
declare sub EmptyContainer(byval id as long)

#define OFF 0
#define ON_ 1
#define ROW_STRIKE (1 shl 31)
#define ROW_UNDERLINE (1 shl 30)
#define ROW_CHECK (1 shl 29)
#define ROW_UNCHECK (1 shl 28)
#define COL_RIGHT_ALIGN (1 shl 27)
#define ROW_COLUMN_UNDERLINE (1 shl 26)

declare function AddList(byval x as long, byval y as long, byval listdata as any ptr, byval n as long ptr, byval width_ as long, byval events as long, byval TextFormatter as function(byval as any ptr, byval as zstring ptr) as long, byval Action as sub(byval id as long, byval as any ptr), byval norows as long) as long
declare function SetLinkedList(byval id as long, byval NextCreater as function(byval list as any ptr, byval prev as any ptr) as any ptr) as long
declare function SetIndexedList(byval id as long, byval IndexCreater as function(byval list as any ptr, byval i as long) as any ptr) as long
declare function RefreshListRow(byval id as long, byval i as long) as long
declare function GetMarkedRows(byval listid as long, byval n as long ptr) as any ptr ptr
declare function BrowseToF(byval id as long, byval i as long) as long
declare function BrowseToL(byval id as long, byval i as long) as long
declare function BrowseTo(byval id as long, byval i as long, byval uncond as long) as long
declare function SetListColumns(byval id as long, byval RowTextCreater as function(byval rowdata as any ptr, byval s as zstring ptr, byval colnr as long) as long, byval widths as long ptr, byval n as long, byval options as long, byval labels as zstring ptr ptr, byval CallBack as sub(byval data_ as any ptr, byval id as long, byval i as long), byval data_ as any ptr) as long
declare function SetListGrippable(byval listid as long, byval Grip as function(byval srcobj as any ptr, byval reason as long, byval srclist as any ptr, byval i as long) as long, byval flags as long, byval buttons as long) as long
declare function SetListDroppable(byval listid as long, byval Drop as function(byval destobj as any ptr, byval reason as long, byval srcobj as any ptr, byval destlist as any ptr, byval i as long, byval flags as long) as long, byval flags as long) as long
declare function SetListDoubleClick(byval listid as long, byval AppDouble as sub(byval id as long, byval data_ as any ptr, byval i as long), byval button as long) as long
declare function HookList(byval listid as long, byval listdata as any ptr, byval n as long ptr, byval width_ as long, byval events as long, byval TextFormatter as function(byval as any ptr, byval as zstring ptr) as long, byval Action as sub(byval as long, byval as any ptr)) as long
declare function SetDeleteHandler(byval listid as long, byval CallBack as sub(byval rowid as long, byval object_ as any ptr)) as long
declare function SetInsertHandler(byval listid as long, byval CallBack as sub(byval list as any ptr, byval index as long)) as long
declare function GetListIndex(byval id as long) as long
declare function HookExit(byval id as long, byval ExitFun as sub(byval data_ as any ptr), byval data_ as any ptr) as long
declare function NotifyFocusMove(byval listid as long, byval CallBack as sub(byval id as long, byval rowobject as any ptr)) as long

#define TR_HIDE_ROOT &h00000001

declare function ListTreeView(byval listid as long, byval width_ as long, byval IsLeaf as function(byval rowobject as any ptr) as long, byval options as long) as long
declare function ListTreeSetNodesExpandedState(byval listid as long, byval IsExpanded as function(byval data_ as any ptr) as long) as long
declare function ListTreeSetNodeExpandedState(byval listid as long, byval new_expanded_state as long, byval data_ as any ptr) as long
declare function InstallBelowListEndCallBack(byval listid as long, byval CallBack as sub(byval id as long, byval data_ as any ptr), byval data_ as any ptr) as long
declare function CguiListBoxSetToolTip(byval listid as long, byval mode as long, byval options as long) as long
declare sub CguiListBoxRowSetBar(byval color_ as long, byval percentage as double)
declare function CguiListBoxRowGetClickedColumn(byval rowid as long) as long
declare sub CguiListBoxSetColumnSelection(byval listid as long, byval state as long)

#if defined(CGUI_STATICLINK) or ((not defined(CGUI_STATICLINK)) and (defined(__FB_DOS__) or defined(__FB_LINUX__)))
	extern cgui_list_no_multiple_row_selection as long
	extern cgui_list_show_focused_row as long
	extern CGUI_list_font as FONT ptr
	extern CGUI_list_row_font as FONT ptr
	extern CGUI_list_row_f_color as long
	extern CGUI_list_row_b_color as long
	extern CGUI_list_vspace as long
	extern CGUI_list_fixfont as long
	extern cgui_list_fix_digits as long
#else
	extern import cgui_list_no_multiple_row_selection as long
	extern import cgui_list_show_focused_row as long
	extern import CGUI_list_font as FONT ptr
	extern import CGUI_list_row_font as FONT ptr
	extern import CGUI_list_row_f_color as long
	extern import CGUI_list_row_b_color as long
	extern import CGUI_list_vspace as long
	extern import CGUI_list_fixfont as long
	extern import cgui_list_fix_digits as long
#endif

#define LIST_COLUMNS_ADJUSTABLE (1 shl 0)
#define LIST_COLUMNS_ADJUSTABLE_KEEP_BOX_WIDTH (1 shl 1)
#define LIST_COLUMNS_DELIMITER (1 shl 2)

declare function MkVerticalBrowser(byval x as long, byval y as long, byval CallBack as sub(byval data_ as any ptr), byval data_ as any ptr, byval viewpos as long ptr) as long
declare function MkHorizontalBrowser(byval x as long, byval y as long, byval CallBack as sub(byval data_ as any ptr), byval data_ as any ptr, byval viewpos as long ptr) as long
declare function NotifyBrowser(byval id as long, byval step_ as long, byval scrolled_area_length as long) as long
declare function SetBrowserSize(byval id as long, byval view_port_length as long, byval browser_length as long) as long
declare function RegisterFileType(byval ext as const zstring ptr, byval Handler as sub(byval data_ as any ptr, byval path as zstring ptr), byval data_ as any ptr, byval aname as const zstring ptr, byval icon as const zstring ptr, byval label as const zstring ptr, byval Viewer as sub(byval privatedata as any ptr, byval viewdata as any ptr)) as long
declare function FileSelect(byval masks as const zstring ptr, byval rpath as const zstring ptr, byval flags as long, byval winheader as const zstring ptr, byval buttonlabel as const zstring ptr) as const zstring ptr
declare sub FileManager(byval winheader as const zstring ptr, byval flags as long)
declare function UnPackSelection(byval flist as zstring ptr ptr) as zstring ptr

#define FS_BROWSE_DAT (1 shl 0)
#define FS_DISABLE_EDIT_DAT (1 shl 1)
#define FS_WARN_EXISTING_FILE (1 shl 2)
#define FS_FORBID_EXISTING_FILE (1 shl 3)
#define FS_REQUIRE_EXISTING_FILE (1 shl 4)
#define FS_SELECT_DIR (1 shl 5)
#define FS_DISABLE_CREATE_DIR (1 shl 6)
#define FS_DISABLE_DELETING (1 shl 7)
#define FS_DISABLE_COPYING (1 shl 8)
#define FS_SHOW_MENU (1 shl 9)
#define FS_NO_SETTINGS_IN_CONFIG (1 shl 10)
#define FS_MULTIPLE_SELECTION (1 shl 11)
#define FS_NO_DRAG_DROP (1 shl 12)
#define FS_DIRECT_SELECT_BY_DOUBLE_CLICK (1 shl 13)
#define FS_SAVE_AS (1 shl 14)
#define FS_SHOW_DIR_TREE (1 shl 15)
#define FS_SHOW_DIRS_IN_FILE_VIEW (1 shl 16)
#define FS_HIDE_LOCATION (1 shl 17)
#define FS_HIDE_UP_BUTTON (1 shl 18)
#define FS_HIDE_UP_DIRECTORY (1 shl 19)
#define FS_FILE_FILTER_IS_READ_ONLY (1 shl 20)
#define FM_HIDE_FILE_VEW (1 shl 21)
#define FM_DO_NOT_SHOW_MENU (1 shl 22)
#define FM_NO_FLOATING (1 shl 23)
#define FM_BROWSE_DAT FS_BROWSE_DAT
#define FM_DISABLE_EDIT_DAT FS_DISABLE_EDIT_DAT
#define FM_DISABLE_CREATE_DIR FS_DISABLE_CREATE_DIR
#define FM_DISABLE_DELETING FS_DISABLE_DELETING
#define FM_DISABLE_COPYING FS_DISABLE_COPYING
#define FM_NO_SETTINGS_IN_CONFIG FS_NO_SETTINGS_IN_CONFIG
#define FM_SHOW_DIR_TREE FM_SHOW_DIR_TREE
#define FM_SHOW_DIRS_IN_FILE_VIEW FS_SHOW_DIRS_IN_FILE_VIEW
#define FM_HIDE_LOCATION FS_HIDE_LOCATION
#define FM_HIDE_UP_BUTTON FS_HIDE_UP_BUTTON
#define FM_HIDE_UP_DIRECTORY FS_HIDE_UP_DIRECTORY

declare sub CguiUseIcons(byval filename as const zstring ptr)
declare function CreateTabWindow(byval x as long, byval y as long, byval width_ as long, byval height as long, byval status as long ptr) as long
declare function AddTab(byval id as long, byval callback as sub(byval data_ as any ptr, byval id as long), byval data_ as any ptr, byval label as const zstring ptr) as long
declare sub HookLeaveTab(byval callback as sub(byval data_ as any ptr), byval data_ as any ptr)
declare function SetFocusOn(byval id as long) as long
declare function JoinTabChain(byval id as long) as long
declare function GetCurrentFocus(byval id as long) as long
declare sub SetCguiFont(byval f as FONT ptr)
declare function GetCguiFont() as FONT ptr
declare function GetCguiFixFont() as FONT ptr
declare sub CguiSetBaseLine(byval base_line as long)
declare function Invite(byval mask as long, byval data_ as any ptr, byval text as zstring ptr) as long
declare function Attend(byval mask as long) as any ptr
declare sub ProcessEvents()
declare sub StopProcessEvents()
declare function GenEvent(byval Handler as sub(byval as any ptr), byval msg as any ptr, byval delay as ulong, byval objid as long) as ulong
declare sub CguiEventIterateFunction(byval Function_ as function(byval as any ptr) as long, byval as any ptr)
declare function KillEvent(byval id as ulong) as long
declare sub FlushGenEvents()
declare sub CguiYieldTimeslice(byval state as long)

#if defined(CGUI_STATICLINK) or ((not defined(CGUI_STATICLINK)) and (defined(__FB_DOS__) or defined(__FB_LINUX__)))
	extern event_message_buffer_size as long
#else
	extern import event_message_buffer_size as long
#endif

declare sub InstallKBHandler(byval Handler as function(byval data_ as any ptr, byval scan as long, byval key as long) as long, byval data_ as any ptr)
declare function UnInstallKBHandler(byval Handler as function(byval as any ptr, byval as long, byval as long) as long) as any ptr
declare function SetHotKey(byval id as long, byval CallBack as sub(byval as any ptr), byval data_ as any ptr, byval scan as long, byval ascii as long) as long
declare function IsHotKey(byval scan as long, byval ascii as long) as long
declare sub SimulateHotKeys(byval control as long, byval key as long)
declare sub UseHotKeys(byval s as zstring ptr)
declare sub AutoHotKeys(byval mode as long)

#if defined(CGUI_STATICLINK) or ((not defined(CGUI_STATICLINK)) and (defined(__FB_DOS__) or defined(__FB_LINUX__)))
	'' TODO: extern int cgui_colors[];
#else
	'' TODO: extern __attribute__((dllimport)) int cgui_colors[];
#endif

type t_cgui_colors as long
enum
	CGUI_COLOR_DESKTOP
	CGUI_COLOR_UNSELECTED_TAB
	CGUI_COLOR_SELECTED_TAB
	CGUI_COLOR_LIGHTENED_BORDER
	CGUI_COLOR_HEAVY_LIGHTENED_BORDER
	CGUI_COLOR_SHADOWED_BORDER
	CGUI_COLOR_HEAVY_SHADOWED_BORDER
	CGUI_COLOR_CONTAINER
	CGUI_COLOR_WIDGET_BACKGROUND
	CGUI_COLOR_LABEL
	CGUI_COLOR_LABEL_FOCUS
	CGUI_COLOR_LABEL_HIDDEN_FOCUS
	CGUI_COLOR_LABEL_INACTIVE_1
	CGUI_COLOR_LABEL_INACTIVE_2
	CGUI_COLOR_BUTTON_FRAME_FOCUS
	CGUI_COLOR_TEXT_CURSOR
	CGUI_COLOR_DRAGGED_TEXT
	CGUI_COLOR_LISTBOX_TEXT
	CGUI_COLOR_LISTBOX_BACKGROUND
	CGUI_COLOR_LISTBOX_FOCUS_TEXT
	CGUI_COLOR_LISTBOX_FOCUS_BACKGROUND
	CGUI_COLOR_LISTBOX_HIDDEN_FOCUS_BACKGROUND
	CGUI_COLOR_LISTBOX_HIDDEN_FOCUS_TEXT
	CGUI_COLOR_LISTBOX_ROW_DELIMITER
	CGUI_COLOR_LISTBOX_COLUMN_DELIMITER
	CGUI_COLOR_TOOL_TIP_BACKGROUND
	CGUI_COLOR_TOOL_TIP_FRAME
	CGUI_COLOR_TOOL_TIP_TEXT
	CGUI_COLOR_TEXTBOX_TEXT
	CGUI_COLOR_TEXTBOX_BACKGROUND
	CGUI_COLOR_CONTAINER_LABEL
	CGUI_COLOR_EDITBOX_BACKGROUND_MARK
	CGUI_COLOR_EDITBOX_TEXT_MARK
	CGUI_COLOR_EDITBOX_BACKGROUND_INACTIVE
	CGUI_COLOR_EDITBOX_TEXT_INACTIVE
	CGUI_COLOR_EDITBOX_BACKGROUND
	CGUI_COLOR_EDITBOX_TEXT
	CGUI_COLOR_STATUSFIELD_BACKGROUND
	CGUI_COLOR_STATUSFIELD_TEXT
	CGUI_COLOR_PROGRESSBAR
	CGUI_COLOR_PROGRESSBAR_BACKGROUND
	CGUI_COLOR_TITLE_FOCUS_BACKGROUND
	CGUI_COLOR_TITLE_FOCUS_TEXT
	CGUI_COLOR_TITLE_UNFOCUS_BACKGROUND
	CGUI_COLOR_TITLE_UNFOCUS_TEXT
	CGUI_COLOR_TREE_VIEW_BACKGROUND
	CGUI_COLOR_TREE_CONTROL_BACKGROUND
	CGUI_COLOR_TREE_CONTROL_OUTLINE
	CGUI_COLOR_CHECKBOX_MARK_BACKGROUND
	CGUI_COLOR_BROWSEBAR_BACKGROUND
	CGUI_COLOR_BROWSEBAR_HANDLE_BACKGROUND
	CGUI_COLOR_RESIZER_HANDLE
	NR_OF_CGUI_COLORS
end enum

declare function CguiSetColor(byval color_name as long, byval r as long, byval g as long, byval b as long) as long
declare sub NameCase(byval text as zstring ptr)
declare sub Sound(byval freq as long, byval duration as long)
declare function AddClock(byval x as long, byval y as long, byval options as long) as long

#define CLOCK_SHOW_SECONDS 1
#define CLOCK_SHOW_MINUTES 2
#define CLOCK_NO_DIALOGUE 4

declare function ToUpper(byval chr_ as long) as long
declare function SaveDatafileObject(byval path as const zstring ptr, byval data_ as any ptr, byval type_ as long) as long
declare function CreateNewDataFile(byval path as const zstring ptr, byval fn as const zstring ptr, byval pack as long, byval pwd as const zstring ptr) as long
declare function msprintf(byval format as const zstring ptr, ...) as zstring ptr
declare sub InstallCursor(byval cursor_no as long, byval sprite as BITMAP ptr, byval x as long, byval y as long)
declare sub ShowPointer()
declare sub HidePointer()
declare sub PointerLocation(byval id as long, byval x as long ptr, byval y as long ptr)
declare function ObjectApearance(byval id as long) as BITMAP ptr
declare sub OverlayPointer(byval sprite as BITMAP ptr, byval x as long, byval y as long)
declare sub RemoveOverlayPointer()
declare sub MkTextPointer(byval f as FONT ptr, byval text as const zstring ptr)
declare sub SelectCursor(byval cursor_no as long)

#define CURS_ILLEGAL 0
#define CURS_DRAGGABLE 1
#define CURS_DRAG_V 2
#define CURS_DRAG_H 3
#define CURS_CROSS 4
#define CURS_BUSY 5
#define CURS_DEFAULT 6

declare sub CguiSetMouseInput(byval MouseInput as sub(byval x as long ptr, byval y as long ptr, byval z as long ptr, byval buttons as long ptr), byval ForcePos as sub(byval x as long, byval y as long), byval SetRange as sub(byval x as long, byval y as long, byval w as long, byval h as long))
declare sub SetMousePos(byval x as long, byval y as long)

#if defined(CGUI_STATICLINK) or ((not defined(CGUI_STATICLINK)) and (defined(__FB_DOS__) or defined(__FB_LINUX__)))
	extern cgui_mouse_draw_in_interrupt as long
#else
	extern import cgui_mouse_draw_in_interrupt as long
#endif

declare function LoadTexts(byval fn as const zstring ptr, byval section as const zstring ptr, byval nr as long ptr) as const zstring const ptr ptr
declare sub DestroyTexts()
declare sub RegisterConversionHandler(byval Handler as sub(byval as any ptr, byval as zstring ptr), byval data_ as any ptr, byval name_ as const zstring ptr)
declare sub PrintFloatingConversion(byval dest as zstring ptr, byval src as const zstring ptr)
declare function LoadCompiledTexts(byval dat as const DATAFILE ptr, byval section as const zstring ptr, byval nr as long ptr) as const zstring const ptr ptr
declare sub RegisterRefresh(byval id as long, byval AppUpd as sub(byval id as long, byval data_ as any ptr, byval calldata as any ptr, byval reason as long), byval data_ as any ptr)
declare sub ConditionalRefresh(byval calldata as any ptr, byval reason as long)
declare function GetSizeOffset(byval id as long, byval x as long ptr, byval y as long ptr) as long
declare function SetSizeOffset(byval id as long, byval x as long, byval y as long) as long
declare function MakeStretchable(byval id as long, byval Notify as sub(byval as any ptr), byval data_ as any ptr, byval options as long) as long

#define NO_VERTICAL 1
#define NO_HORIZONTAL 2

#if defined(CGUI_STATICLINK) or ((not defined(CGUI_STATICLINK)) and (defined(__FB_DOS__) or defined(__FB_LINUX__)))
	extern continous_update_resize as long
#else
	extern import continous_update_resize as long
#endif

#define FRAMERAISE TB_FRAMERAISE
#define FRAMESINK TB_FRAMESINK
#define W_NOMODAL W_FLOATING
#define W_CHILD 0

end extern
