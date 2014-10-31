#pragma once

#include once "crt/string.bi"
#include once "crt/math.bi"
#include once "crt/errno.bi"
#include once "crt/setjmp.bi"
#include once "crt/stdio.bi"

'' The following symbols have been renamed:
''     #define CU_ADD_TEST => CU_ADD_TEST_
''     #define CU_TEST => CU_TEST_

extern "C"

#define CU_VERSION "2.1-2"
#define CU_MAX_TEST_NAME_LENGTH 256
#define CU_MAX_SUITE_NAME_LENGTH 256
#define CU_TRUE 1
#define CU_FALSE 0
#define CU_MAX(a, b) iif((a) >= (b), (a), (b))
#define CU_MIN(a, b) iif((a) >= (b), (b), (a))

type CU_ErrorCode as long
enum
	CUE_SUCCESS = 0
	CUE_NOMEMORY = 1
	CUE_NOREGISTRY = 10
	CUE_REGISTRY_EXISTS = 11
	CUE_NOSUITE = 20
	CUE_NO_SUITENAME = 21
	CUE_SINIT_FAILED = 22
	CUE_SCLEAN_FAILED = 23
	CUE_DUP_SUITE = 24
	CUE_SUITE_INACTIVE = 25
	CUE_NOTEST = 30
	CUE_NO_TESTNAME = 31
	CUE_DUP_TEST = 32
	CUE_TEST_NOT_IN_SUITE = 33
	CUE_TEST_INACTIVE = 34
	CUE_FOPEN_FAILED = 40
	CUE_FCLOSE_FAILED = 41
	CUE_BAD_FILENAME = 42
	CUE_WRITE_ERROR = 43
end enum

type CU_ErrorAction as long
enum
	CUEA_IGNORE
	CUEA_FAIL
	CUEA_ABORT
end enum

declare function CU_get_error() as CU_ErrorCode
declare function CU_get_error_msg() as const zstring ptr
declare sub CU_set_error_action(byval action as CU_ErrorAction)
declare function CU_get_error_action() as CU_ErrorAction
declare sub CU_set_error(byval error_ as CU_ErrorCode)

type CU_InitializeFunc as function() as long
type CU_CleanupFunc as function() as long
type CU_TestFunc as sub()

type CU_Test
	pName as zstring ptr
	fActive as long
	pTestFunc as CU_TestFunc
	pJumpBuf as jmp_buf ptr
	pNext as CU_Test ptr
	pPrev as CU_Test ptr
end type

type CU_pTest as CU_Test ptr

type CU_Suite
	pName as zstring ptr
	fActive as long
	pTest as CU_pTest
	pInitializeFunc as CU_InitializeFunc
	pCleanupFunc as CU_CleanupFunc
	uiNumberOfTests as ulong
	pNext as CU_Suite ptr
	pPrev as CU_Suite ptr
end type

type CU_pSuite as CU_Suite ptr

type CU_TestRegistry
	uiNumberOfSuites as ulong
	uiNumberOfTests as ulong
	pSuite as CU_pSuite
end type

type CU_pTestRegistry as CU_TestRegistry ptr

declare function CU_initialize_registry() as CU_ErrorCode
declare sub CU_cleanup_registry()
declare function CU_registry_initialized() as long
declare function CU_add_suite(byval strName as const zstring ptr, byval pInit as CU_InitializeFunc, byval pClean as CU_CleanupFunc) as CU_pSuite
declare function CU_set_suite_active(byval pSuite as CU_pSuite, byval fNewActive as long) as CU_ErrorCode
declare function CU_set_suite_name(byval pSuite as CU_pSuite, byval strNewName as const zstring ptr) as CU_ErrorCode
declare function CU_set_suite_initfunc(byval pSuite as CU_pSuite, byval pNewInit as CU_InitializeFunc) as CU_ErrorCode
declare function CU_set_suite_cleanupfunc(byval pSuite as CU_pSuite, byval pNewClean as CU_CleanupFunc) as CU_ErrorCode
declare function CU_get_suite(byval strName as const zstring ptr) as CU_pSuite
declare function CU_get_suite_at_pos(byval pos_ as ulong) as CU_pSuite
declare function CU_get_suite_pos(byval pSuite as CU_pSuite) as ulong
declare function CU_get_suite_pos_by_name(byval strName as const zstring ptr) as ulong
declare function CU_add_test(byval pSuite as CU_pSuite, byval strName as const zstring ptr, byval pTestFunc as CU_TestFunc) as CU_pTest
declare function CU_set_test_active(byval pTest as CU_pTest, byval fNewActive as long) as CU_ErrorCode
declare function CU_set_test_name(byval pTest as CU_pTest, byval strNewName as const zstring ptr) as CU_ErrorCode
declare function CU_set_test_func(byval pTest as CU_pTest, byval pNewFunc as CU_TestFunc) as CU_ErrorCode
declare function CU_get_test(byval pSuite as CU_pSuite, byval strName as const zstring ptr) as CU_pTest
declare function CU_get_test_at_pos(byval pSuite as CU_pSuite, byval pos_ as ulong) as CU_pTest
declare function CU_get_test_pos(byval pSuite as CU_pSuite, byval pTest as CU_pTest) as ulong
declare function CU_get_test_pos_by_name(byval pSuite as CU_pSuite, byval strName as const zstring ptr) as ulong

#define CU_ADD_TEST_(suite, test) CU_add_test(suite, #test, cast(CU_TestFunc, test))

type CU_TestInfo
	pName as zstring ptr
	pTestFunc as CU_TestFunc
end type

type CU_pTestInfo as CU_TestInfo ptr

type CU_SuiteInfo
	pName as zstring ptr
	pInitFunc as CU_InitializeFunc
	pCleanupFunc as CU_CleanupFunc
	pTests as CU_TestInfo ptr
end type

type CU_pSuiteInfo as CU_SuiteInfo ptr

#define CU_TEST_INFO_NULL (NULL, NULL)
#define CU_SUITE_INFO_NULL (NULL, NULL, NULL, NULL)

declare function CU_register_suites(byval suite_info as CU_SuiteInfo ptr) as CU_ErrorCode
declare function CU_register_nsuites(byval suite_count as long, ...) as CU_ErrorCode
declare function CU_get_registry() as CU_pTestRegistry
declare function CU_set_registry(byval pTestRegistry as CU_pTestRegistry) as CU_pTestRegistry
declare function CU_create_new_registry() as CU_pTestRegistry
declare sub CU_destroy_existing_registry(byval ppRegistry as CU_pTestRegistry ptr)
declare function CU_get_suite_by_name(byval szSuiteName as const zstring ptr, byval pRegistry as CU_pTestRegistry) as CU_pSuite
declare function CU_get_suite_by_index(byval index as ulong, byval pRegistry as CU_pTestRegistry) as CU_pSuite
declare function CU_get_test_by_name(byval szTestName as const zstring ptr, byval pSuite as CU_pSuite) as CU_pTest
declare function CU_get_test_by_index(byval index as ulong, byval pSuite as CU_pSuite) as CU_pTest

type CU_FailureTypes as long
enum
	CUF_SuiteInactive = 1
	CUF_SuiteInitFailed
	CUF_SuiteCleanupFailed
	CUF_TestInactive
	CUF_AssertFailed
end enum

type CU_FailureType as CU_FailureTypes

type CU_FailureRecord
	as CU_FailureType type
	uiLineNumber as ulong
	strFileName as zstring ptr
	strCondition as zstring ptr
	pTest as CU_pTest
	pSuite as CU_pSuite
	pNext as CU_FailureRecord ptr
	pPrev as CU_FailureRecord ptr
end type

type CU_pFailureRecord as CU_FailureRecord ptr

type CU_RunSummary
	nSuitesRun as ulong
	nSuitesFailed as ulong
	nSuitesInactive as ulong
	nTestsRun as ulong
	nTestsFailed as ulong
	nTestsInactive as ulong
	nAsserts as ulong
	nAssertsFailed as ulong
	nFailureRecords as ulong
	ElapsedTime as double
end type

type CU_pRunSummary as CU_RunSummary ptr
type CU_SuiteStartMessageHandler as sub(byval pSuite as const CU_pSuite)
type CU_TestStartMessageHandler as sub(byval pTest as const CU_pTest, byval pSuite as const CU_pSuite)
type CU_TestCompleteMessageHandler as sub(byval pTest as const CU_pTest, byval pSuite as const CU_pSuite, byval pFailure as const CU_pFailureRecord)
type CU_SuiteCompleteMessageHandler as sub(byval pSuite as const CU_pSuite, byval pFailure as const CU_pFailureRecord)
type CU_AllTestsCompleteMessageHandler as sub(byval pFailure as const CU_pFailureRecord)
type CU_SuiteInitFailureMessageHandler as sub(byval pSuite as const CU_pSuite)
type CU_SuiteCleanupFailureMessageHandler as sub(byval pSuite as const CU_pSuite)

declare sub CU_set_suite_start_handler(byval pSuiteStartMessage as CU_SuiteStartMessageHandler)
declare sub CU_set_test_start_handler(byval pTestStartMessage as CU_TestStartMessageHandler)
declare sub CU_set_test_complete_handler(byval pTestCompleteMessage as CU_TestCompleteMessageHandler)
declare sub CU_set_suite_complete_handler(byval pSuiteCompleteMessage as CU_SuiteCompleteMessageHandler)
declare sub CU_set_all_test_complete_handler(byval pAllTestsCompleteMessage as CU_AllTestsCompleteMessageHandler)
declare sub CU_set_suite_init_failure_handler(byval pSuiteInitFailureMessage as CU_SuiteInitFailureMessageHandler)
declare sub CU_set_suite_cleanup_failure_handler(byval pSuiteCleanupFailureMessage as CU_SuiteCleanupFailureMessageHandler)
declare function CU_get_suite_start_handler() as CU_SuiteStartMessageHandler
declare function CU_get_test_start_handler() as CU_TestStartMessageHandler
declare function CU_get_test_complete_handler() as CU_TestCompleteMessageHandler
declare function CU_get_suite_complete_handler() as CU_SuiteCompleteMessageHandler
declare function CU_get_all_test_complete_handler() as CU_AllTestsCompleteMessageHandler
declare function CU_get_suite_init_failure_handler() as CU_SuiteInitFailureMessageHandler
declare function CU_get_suite_cleanup_failure_handler() as CU_SuiteCleanupFailureMessageHandler
declare function CU_run_all_tests() as CU_ErrorCode
declare function CU_run_suite(byval pSuite as CU_pSuite) as CU_ErrorCode
declare function CU_run_test(byval pSuite as CU_pSuite, byval pTest as CU_pTest) as CU_ErrorCode
declare sub CU_set_fail_on_inactive(byval new_inactive as long)
declare function CU_get_fail_on_inactive() as long
declare function CU_get_number_of_suites_run() as ulong
declare function CU_get_number_of_suites_failed() as ulong
declare function CU_get_number_of_suites_inactive() as ulong
declare function CU_get_number_of_tests_run() as ulong
declare function CU_get_number_of_tests_failed() as ulong
declare function CU_get_number_of_tests_inactive() as ulong
declare function CU_get_number_of_asserts() as ulong
declare function CU_get_number_of_successes() as ulong
declare function CU_get_number_of_failures() as ulong
declare function CU_get_number_of_failure_records() as ulong
declare function CU_get_elapsed_time() as double
declare function CU_get_failure_list() as CU_pFailureRecord
declare function CU_get_run_summary() as CU_pRunSummary
declare function CU_get_run_results_string() as zstring ptr
declare sub CU_print_run_results(byval file as FILE ptr)
declare function CU_get_current_suite() as CU_pSuite
declare function CU_get_current_test() as CU_pTest
declare function CU_is_test_running() as long
declare sub CU_clear_previous_results()
declare function CU_assertImplementation(byval bValue as long, byval uiLine as ulong, byval strCondition as const zstring ptr, byval strFile as const zstring ptr, byval strFunction as const zstring ptr, byval bFatal as long) as long

#macro CU_PASS(msg)
	scope
		CU_assertImplementation(CU_TRUE, __LINE__, ("CU_PASS(" + #msg) + ")", __FILE__, "", CU_FALSE)
	end scope
#endmacro
#macro CU_ASSERT(value)
	scope
		CU_assertImplementation((value), __LINE__, #value, __FILE__, "", CU_FALSE)
	end scope
#endmacro
#macro CU_ASSERT_FATAL(value)
	scope
		CU_assertImplementation((value), __LINE__, #value, __FILE__, "", CU_TRUE)
	end scope
#endmacro
#macro CU_TEST_(value)
	scope
		CU_assertImplementation((value), __LINE__, #value, __FILE__, "", CU_FALSE)
	end scope
#endmacro
#macro CU_TEST_FATAL(value)
	scope
		CU_assertImplementation((value), __LINE__, #value, __FILE__, "", CU_TRUE)
	end scope
#endmacro
#macro CU_FAIL(msg)
	scope
		CU_assertImplementation(CU_FALSE, __LINE__, ("CU_FAIL(" + #msg) + ")", __FILE__, "", CU_FALSE)
	end scope
#endmacro
#macro CU_FAIL_FATAL(msg)
	scope
		CU_assertImplementation(CU_FALSE, __LINE__, ("CU_FAIL_FATAL(" + #msg) + ")", __FILE__, "", CU_TRUE)
	end scope
#endmacro
#macro CU_ASSERT_TRUE(value)
	scope
		CU_assertImplementation((value), __LINE__, ("CU_ASSERT_TRUE(" + #value) + ")", __FILE__, "", CU_FALSE)
	end scope
#endmacro
#macro CU_ASSERT_TRUE_FATAL(value)
	scope
		CU_assertImplementation((value), __LINE__, ("CU_ASSERT_TRUE_FATAL(" + #value) + ")", __FILE__, "", CU_TRUE)
	end scope
#endmacro
#macro CU_ASSERT_FALSE(value)
	scope
		CU_assertImplementation(-((value) = 0), __LINE__, ("CU_ASSERT_FALSE(" + #value) + ")", __FILE__, "", CU_FALSE)
	end scope
#endmacro
#macro CU_ASSERT_FALSE_FATAL(value)
	scope
		CU_assertImplementation(-((value) = 0), __LINE__, ("CU_ASSERT_FALSE_FATAL(" + #value) + ")", __FILE__, "", CU_TRUE)
	end scope
#endmacro
#macro CU_ASSERT_EQUAL(actual, expected)
	scope
		CU_assertImplementation(-((actual) = (expected)), __LINE__, ((("CU_ASSERT_EQUAL(" + #actual) + ",") + #expected) + ")", __FILE__, "", CU_FALSE)
	end scope
#endmacro
#macro CU_ASSERT_EQUAL_FATAL(actual, expected)
	scope
		CU_assertImplementation(-((actual) = (expected)), __LINE__, ((("CU_ASSERT_EQUAL_FATAL(" + #actual) + ",") + #expected) + ")", __FILE__, "", CU_TRUE)
	end scope
#endmacro
#macro CU_ASSERT_NOT_EQUAL(actual, expected)
	scope
		CU_assertImplementation(-((actual) <> (expected)), __LINE__, ((("CU_ASSERT_NOT_EQUAL(" + #actual) + ",") + #expected) + ")", __FILE__, "", CU_FALSE)
	end scope
#endmacro
#macro CU_ASSERT_NOT_EQUAL_FATAL(actual, expected)
	scope
		CU_assertImplementation(-((actual) <> (expected)), __LINE__, ((("CU_ASSERT_NOT_EQUAL_FATAL(" + #actual) + ",") + #expected) + ")", __FILE__, "", CU_TRUE)
	end scope
#endmacro
#macro CU_ASSERT_PTR_EQUAL(actual, expected)
	scope
		CU_assertImplementation(cptr(any ptr, -((actual) = cptr(any ptr, (expected)))), __LINE__, ((("CU_ASSERT_PTR_EQUAL(" + #actual) + ",") + #expected) + ")", __FILE__, "", CU_FALSE)
	end scope
#endmacro
#macro CU_ASSERT_PTR_EQUAL_FATAL(actual, expected)
	scope
		CU_assertImplementation(cptr(any ptr, -((actual) = cptr(any ptr, (expected)))), __LINE__, ((("CU_ASSERT_PTR_EQUAL_FATAL(" + #actual) + ",") + #expected) + ")", __FILE__, "", CU_TRUE)
	end scope
#endmacro
#macro CU_ASSERT_PTR_NOT_EQUAL(actual, expected)
	scope
		CU_assertImplementation(cptr(any ptr, -((actual) <> cptr(any ptr, (expected)))), __LINE__, ((("CU_ASSERT_PTR_NOT_EQUAL(" + #actual) + ",") + #expected) + ")", __FILE__, "", CU_FALSE)
	end scope
#endmacro
#macro CU_ASSERT_PTR_NOT_EQUAL_FATAL(actual, expected)
	scope
		CU_assertImplementation(cptr(any ptr, -((actual) <> cptr(any ptr, (expected)))), __LINE__, ((("CU_ASSERT_PTR_NOT_EQUAL_FATAL(" + #actual) + ",") + #expected) + ")", __FILE__, "", CU_TRUE)
	end scope
#endmacro
#macro CU_ASSERT_PTR_NULL(value)
	scope
		CU_assertImplementation(-(NULL = cptr(any ptr, (value))), __LINE__, ("CU_ASSERT_PTR_NULL(" + #value) + ")", __FILE__, "", CU_FALSE)
	end scope
#endmacro
#macro CU_ASSERT_PTR_NULL_FATAL(value)
	scope
		CU_assertImplementation(-(NULL = cptr(any ptr, (value))), __LINE__, ("CU_ASSERT_PTR_NULL_FATAL(" + #value) + ")", __FILE__, "", CU_TRUE)
	end scope
#endmacro
#macro CU_ASSERT_PTR_NOT_NULL(value)
	scope
		CU_assertImplementation(-(NULL <> cptr(any ptr, (value))), __LINE__, ("CU_ASSERT_PTR_NOT_NULL(" + #value) + ")", __FILE__, "", CU_FALSE)
	end scope
#endmacro
#macro CU_ASSERT_PTR_NOT_NULL_FATAL(value)
	scope
		CU_assertImplementation(-(NULL <> cptr(any ptr, (value))), __LINE__, ("CU_ASSERT_PTR_NOT_NULL_FATAL(" + #value) + ")", __FILE__, "", CU_TRUE)
	end scope
#endmacro
#macro CU_ASSERT_STRING_EQUAL(actual, expected)
	scope
		CU_assertImplementation(-(strcmp(cptr(const zstring ptr, (actual)), cptr(const zstring ptr, (expected))) = 0), __LINE__, ((("CU_ASSERT_STRING_EQUAL(" + #actual) + ",") + #expected) + ")", __FILE__, "", CU_FALSE)
	end scope
#endmacro
#macro CU_ASSERT_STRING_EQUAL_FATAL(actual, expected)
	scope
		CU_assertImplementation(-(strcmp(cptr(const zstring ptr, (actual)), cptr(const zstring ptr, (expected))) = 0), __LINE__, ((("CU_ASSERT_STRING_EQUAL_FATAL(" + #actual) + ",") + #expected) + ")", __FILE__, "", CU_TRUE)
	end scope
#endmacro
#macro CU_ASSERT_STRING_NOT_EQUAL(actual, expected)
	scope
		CU_assertImplementation(strcmp(cptr(const zstring ptr, (actual)), cptr(const zstring ptr, (expected))), __LINE__, ((("CU_ASSERT_STRING_NOT_EQUAL(" + #actual) + ",") + #expected) + ")", __FILE__, "", CU_FALSE)
	end scope
#endmacro
#macro CU_ASSERT_STRING_NOT_EQUAL_FATAL(actual, expected)
	scope
		CU_assertImplementation(strcmp(cptr(const zstring ptr, (actual)), cptr(const zstring ptr, (expected))), __LINE__, ((("CU_ASSERT_STRING_NOT_EQUAL_FATAL(" + #actual) + ",") + #expected) + ")", __FILE__, "", CU_TRUE)
	end scope
#endmacro
#macro CU_ASSERT_NSTRING_EQUAL(actual, expected, count)
	scope
		CU_assertImplementation(-(strncmp(cptr(const zstring ptr, (actual)), cptr(const zstring ptr, (expected)), cuint((count))) = 0), __LINE__, ((((("CU_ASSERT_NSTRING_EQUAL(" + #actual) + ",") + #expected) + ",") + #count) + ")", __FILE__, "", CU_FALSE)
	end scope
#endmacro
#macro CU_ASSERT_NSTRING_EQUAL_FATAL(actual, expected, count)
	scope
		CU_assertImplementation(-(strncmp(cptr(const zstring ptr, (actual)), cptr(const zstring ptr, (expected)), cuint((count))) = 0), __LINE__, ((((("CU_ASSERT_NSTRING_EQUAL_FATAL(" + #actual) + ",") + #expected) + ",") + #count) + ")", __FILE__, "", CU_TRUE)
	end scope
#endmacro
#macro CU_ASSERT_NSTRING_NOT_EQUAL(actual, expected, count)
	scope
		CU_assertImplementation(strncmp(cptr(const zstring ptr, (actual)), cptr(const zstring ptr, (expected)), cuint((count))), __LINE__, ((((("CU_ASSERT_NSTRING_NOT_EQUAL(" + #actual) + ",") + #expected) + ",") + #count) + ")", __FILE__, "", CU_FALSE)
	end scope
#endmacro
#macro CU_ASSERT_NSTRING_NOT_EQUAL_FATAL(actual, expected, count)
	scope
		CU_assertImplementation(strncmp(cptr(const zstring ptr, (actual)), cptr(const zstring ptr, (expected)), cuint((count))), __LINE__, ((((("CU_ASSERT_NSTRING_NOT_EQUAL_FATAL(" + #actual) + ",") + #expected) + ",") + #count) + ")", __FILE__, "", CU_TRUE)
	end scope
#endmacro
#macro CU_ASSERT_DOUBLE_EQUAL(actual, expected, granularity)
	scope
		CU_assertImplementation(-(fabs(cast(double, (actual) - (expected))) <= fabs(cast(double, (granularity)))), __LINE__, ((((("CU_ASSERT_DOUBLE_EQUAL(" + #actual) + ",") + #expected) + ",") + #granularity) + ")", __FILE__, "", CU_FALSE)
	end scope
#endmacro
#macro CU_ASSERT_DOUBLE_EQUAL_FATAL(actual, expected, granularity)
	scope
		CU_assertImplementation(-(fabs(cast(double, (actual) - (expected))) <= fabs(cast(double, (granularity)))), __LINE__, ((((("CU_ASSERT_DOUBLE_EQUAL_FATAL(" + #actual) + ",") + #expected) + ",") + #granularity) + ")", __FILE__, "", CU_TRUE)
	end scope
#endmacro
#macro CU_ASSERT_DOUBLE_NOT_EQUAL(actual, expected, granularity)
	scope
		CU_assertImplementation(-(fabs(cast(double, (actual) - (expected))) > fabs(cast(double, (granularity)))), __LINE__, ((((("CU_ASSERT_DOUBLE_NOT_EQUAL(" + #actual) + ",") + #expected) + ",") + #granularity) + ")", __FILE__, "", CU_FALSE)
	end scope
#endmacro
#macro CU_ASSERT_DOUBLE_NOT_EQUAL_FATAL(actual, expected, granularity)
	scope
		CU_assertImplementation(-(fabs(cast(double, (actual) - (expected))) > fabs(cast(double, (granularity)))), __LINE__, ((((("CU_ASSERT_DOUBLE_NOT_EQUAL_FATAL(" + #actual) + ",") + #expected) + ",") + #granularity) + ")", __FILE__, "", CU_TRUE)
	end scope
#endmacro

end extern
