#pragma once

#include once "crt/long.bi"

#define _X11_XREGION_H_

type BOX
	x1 as short
	x2 as short
	y1 as short
	y2 as short
end type

type BoxRec as BOX
type BoxPtr as BOX ptr

type RECTANGLE
	x as short
	y as short
	width as short
	height as short
end type

type RectangleRec as RECTANGLE
type RectanglePtr as RECTANGLE ptr

type _XRegion
	size as clong
	numRects as clong
	rects as BOX ptr
	extents as BOX
end type

#define EXTENTCHECK(r1, r2) (((((r1)->x2 > (r2)->x1) andalso ((r1)->x1 < (r2)->x2)) andalso ((r1)->y2 > (r2)->y1)) andalso ((r1)->y1 < (r2)->y2))
#macro EXTENTS(r, idRect)
	scope
		'' TODO: if((r)->x1 < (idRect)->extents.x1) (idRect)->extents.x1 = (r)->x1;
		'' TODO: if((r)->y1 < (idRect)->extents.y1) (idRect)->extents.y1 = (r)->y1;
		'' TODO: if((r)->x2 > (idRect)->extents.x2) (idRect)->extents.x2 = (r)->x2;
		'' TODO: if((r)->y2 > (idRect)->extents.y2) (idRect)->extents.y2 = (r)->y2;
	end scope
#endmacro
#define MEMCHECK(reg, rect, firstrect) '' TODO: { if ((reg)->numRects >= ((reg)->size - 1)){ BoxPtr tmpRect = Xrealloc ((firstrect), (2 * (sizeof(BOX)) * ((reg)->size))); if (tmpRect == NULL) return(0); (firstrect) = tmpRect; (reg)->size *= 2; (rect) = &(firstrect)[(reg)->numRects]; } }
#define CHECK_PREVIOUS(Reg, R, Rx1, Ry1, Rx2, Ry2) (((((((Reg)->numRects > 0) andalso ((R - 1)->y1 = (Ry1))) andalso ((R - 1)->y2 = (Ry2))) andalso ((R - 1)->x1 <= (Rx1))) andalso ((R - 1)->x2 >= (Rx2))) = 0)
#define ADDRECT(reg, r, rx1, ry1, rx2, ry2) '' TODO: { if (((rx1) < (rx2)) && ((ry1) < (ry2)) && CHECK_PREVIOUS((reg), (r), (rx1), (ry1), (rx2), (ry2))){ (r)->x1 = (rx1); (r)->y1 = (ry1); (r)->x2 = (rx2); (r)->y2 = (ry2); EXTENTS((r), (reg)); (reg)->numRects++; (r)++; } }
#define ADDRECTNOX(reg, r, rx1, ry1, rx2, ry2) '' TODO: { if ((rx1 < rx2) && (ry1 < ry2) && CHECK_PREVIOUS((reg), (r), (rx1), (ry1), (rx2), (ry2))){ (r)->x1 = (rx1); (r)->y1 = (ry1); (r)->x2 = (rx2); (r)->y2 = (ry2); (reg)->numRects++; (r)++; } }
#define EMPTY_REGION(pReg) '' TODO: pReg->numRects = 0
#define REGION_NOT_EMPTY(pReg) pReg->numRects
#define INBOX(r, x, y) (((((r).x2 > x) andalso ((r).x1 <= x)) andalso ((r).y2 > y)) andalso ((r).y1 <= y))
const NUMPTSTOBUFFER = 200

type _POINTBLOCK
	pts(0 to 199) as XPoint
	next as _POINTBLOCK ptr
end type

type POINTBLOCK as _POINTBLOCK
