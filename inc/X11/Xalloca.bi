#pragma once

const XALLOCA_H = 1
#define alloca __builtin_alloca
#define ALLOCATE_LOCAL(size) alloca(clng((size)))
#define DEALLOCATE_LOCAL(_ptr) '' TODO: do {} while(0)
