#pragma once

#define _Xmu_Misc_h
const MAXDIMENSION = (1 shl 31) - 1
#define Max(x, y) iif((x) > (y), (x), (y))
#define Min(x, y) iif((x) < (y), (x), (y))
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
