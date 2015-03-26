#pragma once

#define _Xmu_Misc_h
const MAXDIMENSION = (1 shl 31) - 1
#macro AssignMax(x, y)
	scope
		'' TODO: if ((y) > (x)) x = (y);
	end scope
#endmacro
#macro AssignMin(x, y)
	scope
		'' TODO: if ((y) < (x)) x = (y);
	end scope
#endmacro
