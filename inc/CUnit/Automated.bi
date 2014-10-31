#pragma once

#include once "CUnit.bi"

extern "C"

#define CUNIT_AUTOMATED_H_SEEN

declare sub CU_automated_run_tests()
declare function CU_list_tests_to_file() as CU_ErrorCode
declare sub CU_set_output_filename(byval szFilenameRoot as const zstring ptr)

end extern
