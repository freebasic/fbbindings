#pragma once

#include once "_mingw_unicode.bi"

extern "C"

#define _WINSPOOL_

type _PRINTER_INFO_1A
	Flags as DWORD
	pDescription as LPSTR
	pName as LPSTR
	pComment as LPSTR
end type

type PRINTER_INFO_1A as _PRINTER_INFO_1A
type PPRINTER_INFO_1A as _PRINTER_INFO_1A ptr
type LPPRINTER_INFO_1A as _PRINTER_INFO_1A ptr

type _PRINTER_INFO_1W
	Flags as DWORD
	pDescription as LPWSTR
	pName as LPWSTR
	pComment as LPWSTR
end type

type PRINTER_INFO_1W as _PRINTER_INFO_1W
type PPRINTER_INFO_1W as _PRINTER_INFO_1W ptr
type LPPRINTER_INFO_1W as _PRINTER_INFO_1W ptr

#ifdef UNICODE
	type PRINTER_INFO_1 as PRINTER_INFO_1W
	type PPRINTER_INFO_1 as PPRINTER_INFO_1W
	type LPPRINTER_INFO_1 as LPPRINTER_INFO_1W
#else
	type PRINTER_INFO_1 as PRINTER_INFO_1A
	type PPRINTER_INFO_1 as PPRINTER_INFO_1A
	type LPPRINTER_INFO_1 as LPPRINTER_INFO_1A
#endif

type _PRINTER_INFO_2A
	pServerName as LPSTR
	pPrinterName as LPSTR
	pShareName as LPSTR
	pPortName as LPSTR
	pDriverName as LPSTR
	pComment as LPSTR
	pLocation as LPSTR
	pDevMode as LPDEVMODEA
	pSepFile as LPSTR
	pPrintProcessor as LPSTR
	pDatatype as LPSTR
	pParameters as LPSTR
	pSecurityDescriptor as PSECURITY_DESCRIPTOR
	Attributes as DWORD
	Priority as DWORD
	DefaultPriority as DWORD
	StartTime as DWORD
	UntilTime as DWORD
	Status as DWORD
	cJobs as DWORD
	AveragePPM as DWORD
end type

type PRINTER_INFO_2A as _PRINTER_INFO_2A
type PPRINTER_INFO_2A as _PRINTER_INFO_2A ptr
type LPPRINTER_INFO_2A as _PRINTER_INFO_2A ptr

type _PRINTER_INFO_2W
	pServerName as LPWSTR
	pPrinterName as LPWSTR
	pShareName as LPWSTR
	pPortName as LPWSTR
	pDriverName as LPWSTR
	pComment as LPWSTR
	pLocation as LPWSTR
	pDevMode as LPDEVMODEW
	pSepFile as LPWSTR
	pPrintProcessor as LPWSTR
	pDatatype as LPWSTR
	pParameters as LPWSTR
	pSecurityDescriptor as PSECURITY_DESCRIPTOR
	Attributes as DWORD
	Priority as DWORD
	DefaultPriority as DWORD
	StartTime as DWORD
	UntilTime as DWORD
	Status as DWORD
	cJobs as DWORD
	AveragePPM as DWORD
end type

type PRINTER_INFO_2W as _PRINTER_INFO_2W
type PPRINTER_INFO_2W as _PRINTER_INFO_2W ptr
type LPPRINTER_INFO_2W as _PRINTER_INFO_2W ptr

#ifdef UNICODE
	type PRINTER_INFO_2 as PRINTER_INFO_2W
	type PPRINTER_INFO_2 as PPRINTER_INFO_2W
	type LPPRINTER_INFO_2 as LPPRINTER_INFO_2W
#else
	type PRINTER_INFO_2 as PRINTER_INFO_2A
	type PPRINTER_INFO_2 as PPRINTER_INFO_2A
	type LPPRINTER_INFO_2 as LPPRINTER_INFO_2A
#endif

type _PRINTER_INFO_3
	pSecurityDescriptor as PSECURITY_DESCRIPTOR
end type

type PRINTER_INFO_3 as _PRINTER_INFO_3
type PPRINTER_INFO_3 as _PRINTER_INFO_3 ptr
type LPPRINTER_INFO_3 as _PRINTER_INFO_3 ptr

type _PRINTER_INFO_4A
	pPrinterName as LPSTR
	pServerName as LPSTR
	Attributes as DWORD
end type

type PRINTER_INFO_4A as _PRINTER_INFO_4A
type PPRINTER_INFO_4A as _PRINTER_INFO_4A ptr
type LPPRINTER_INFO_4A as _PRINTER_INFO_4A ptr

type _PRINTER_INFO_4W
	pPrinterName as LPWSTR
	pServerName as LPWSTR
	Attributes as DWORD
end type

type PRINTER_INFO_4W as _PRINTER_INFO_4W
type PPRINTER_INFO_4W as _PRINTER_INFO_4W ptr
type LPPRINTER_INFO_4W as _PRINTER_INFO_4W ptr

#ifdef UNICODE
	type PRINTER_INFO_4 as PRINTER_INFO_4W
	type PPRINTER_INFO_4 as PPRINTER_INFO_4W
	type LPPRINTER_INFO_4 as LPPRINTER_INFO_4W
#else
	type PRINTER_INFO_4 as PRINTER_INFO_4A
	type PPRINTER_INFO_4 as PPRINTER_INFO_4A
	type LPPRINTER_INFO_4 as LPPRINTER_INFO_4A
#endif

type _PRINTER_INFO_5A
	pPrinterName as LPSTR
	pPortName as LPSTR
	Attributes as DWORD
	DeviceNotSelectedTimeout as DWORD
	TransmissionRetryTimeout as DWORD
end type

type PRINTER_INFO_5A as _PRINTER_INFO_5A
type PPRINTER_INFO_5A as _PRINTER_INFO_5A ptr
type LPPRINTER_INFO_5A as _PRINTER_INFO_5A ptr

type _PRINTER_INFO_5W
	pPrinterName as LPWSTR
	pPortName as LPWSTR
	Attributes as DWORD
	DeviceNotSelectedTimeout as DWORD
	TransmissionRetryTimeout as DWORD
end type

type PRINTER_INFO_5W as _PRINTER_INFO_5W
type PPRINTER_INFO_5W as _PRINTER_INFO_5W ptr
type LPPRINTER_INFO_5W as _PRINTER_INFO_5W ptr

#ifdef UNICODE
	type PRINTER_INFO_5 as PRINTER_INFO_5W
	type PPRINTER_INFO_5 as PPRINTER_INFO_5W
	type LPPRINTER_INFO_5 as LPPRINTER_INFO_5W
#else
	type PRINTER_INFO_5 as PRINTER_INFO_5A
	type PPRINTER_INFO_5 as PPRINTER_INFO_5A
	type LPPRINTER_INFO_5 as LPPRINTER_INFO_5A
#endif

type _PRINTER_INFO_6
	dwStatus as DWORD
end type

type PRINTER_INFO_6 as _PRINTER_INFO_6
type PPRINTER_INFO_6 as _PRINTER_INFO_6 ptr
type LPPRINTER_INFO_6 as _PRINTER_INFO_6 ptr

type _PRINTER_INFO_7A
	pszObjectGUID as LPSTR
	dwAction as DWORD
end type

type PRINTER_INFO_7A as _PRINTER_INFO_7A
type PPRINTER_INFO_7A as _PRINTER_INFO_7A ptr
type LPPRINTER_INFO_7A as _PRINTER_INFO_7A ptr

type _PRINTER_INFO_7W
	pszObjectGUID as LPWSTR
	dwAction as DWORD
end type

type PRINTER_INFO_7W as _PRINTER_INFO_7W
type PPRINTER_INFO_7W as _PRINTER_INFO_7W ptr
type LPPRINTER_INFO_7W as _PRINTER_INFO_7W ptr

#ifdef UNICODE
	type PRINTER_INFO_7 as PRINTER_INFO_7W
	type PPRINTER_INFO_7 as PPRINTER_INFO_7W
	type LPPRINTER_INFO_7 as LPPRINTER_INFO_7W
#else
	type PRINTER_INFO_7 as PRINTER_INFO_7A
	type PPRINTER_INFO_7 as PPRINTER_INFO_7A
	type LPPRINTER_INFO_7 as LPPRINTER_INFO_7A
#endif

#define DSPRINT_PUBLISH &h00000001
#define DSPRINT_UPDATE &h00000002
#define DSPRINT_UNPUBLISH &h00000004
#define DSPRINT_REPUBLISH &h00000008
#define DSPRINT_PENDING &h80000000

type _PRINTER_INFO_8A
	pDevMode as LPDEVMODEA
end type

type PRINTER_INFO_8A as _PRINTER_INFO_8A
type PPRINTER_INFO_8A as _PRINTER_INFO_8A ptr
type LPPRINTER_INFO_8A as _PRINTER_INFO_8A ptr

type _PRINTER_INFO_8W
	pDevMode as LPDEVMODEW
end type

type PRINTER_INFO_8W as _PRINTER_INFO_8W
type PPRINTER_INFO_8W as _PRINTER_INFO_8W ptr
type LPPRINTER_INFO_8W as _PRINTER_INFO_8W ptr

#ifdef UNICODE
	type PRINTER_INFO_8 as PRINTER_INFO_8W
	type PPRINTER_INFO_8 as PPRINTER_INFO_8W
	type LPPRINTER_INFO_8 as LPPRINTER_INFO_8W
#else
	type PRINTER_INFO_8 as PRINTER_INFO_8A
	type PPRINTER_INFO_8 as PPRINTER_INFO_8A
	type LPPRINTER_INFO_8 as LPPRINTER_INFO_8A
#endif

type _PRINTER_INFO_9A
	pDevMode as LPDEVMODEA
end type

type PRINTER_INFO_9A as _PRINTER_INFO_9A
type PPRINTER_INFO_9A as _PRINTER_INFO_9A ptr
type LPPRINTER_INFO_9A as _PRINTER_INFO_9A ptr

type _PRINTER_INFO_9W
	pDevMode as LPDEVMODEW
end type

type PRINTER_INFO_9W as _PRINTER_INFO_9W
type PPRINTER_INFO_9W as _PRINTER_INFO_9W ptr
type LPPRINTER_INFO_9W as _PRINTER_INFO_9W ptr

#ifdef UNICODE
	type PRINTER_INFO_9 as PRINTER_INFO_9W
	type PPRINTER_INFO_9 as PPRINTER_INFO_9W
	type LPPRINTER_INFO_9 as LPPRINTER_INFO_9W
#else
	type PRINTER_INFO_9 as PRINTER_INFO_9A
	type PPRINTER_INFO_9 as PPRINTER_INFO_9A
	type LPPRINTER_INFO_9 as LPPRINTER_INFO_9A
#endif

#define PRINTER_CONTROL_PAUSE 1
#define PRINTER_CONTROL_RESUME 2
#define PRINTER_CONTROL_PURGE 3
#define PRINTER_CONTROL_SET_STATUS 4
#define PRINTER_STATUS_PAUSED &h00000001
#define PRINTER_STATUS_ERROR &h00000002
#define PRINTER_STATUS_PENDING_DELETION &h00000004
#define PRINTER_STATUS_PAPER_JAM &h00000008
#define PRINTER_STATUS_PAPER_OUT &h00000010
#define PRINTER_STATUS_MANUAL_FEED &h00000020
#define PRINTER_STATUS_PAPER_PROBLEM &h00000040
#define PRINTER_STATUS_OFFLINE &h00000080
#define PRINTER_STATUS_IO_ACTIVE &h00000100
#define PRINTER_STATUS_BUSY &h00000200
#define PRINTER_STATUS_PRINTING &h00000400
#define PRINTER_STATUS_OUTPUT_BIN_FULL &h00000800
#define PRINTER_STATUS_NOT_AVAILABLE &h00001000
#define PRINTER_STATUS_WAITING &h00002000
#define PRINTER_STATUS_PROCESSING &h00004000
#define PRINTER_STATUS_INITIALIZING &h00008000
#define PRINTER_STATUS_WARMING_UP &h00010000
#define PRINTER_STATUS_TONER_LOW &h00020000
#define PRINTER_STATUS_NO_TONER &h00040000
#define PRINTER_STATUS_PAGE_PUNT &h00080000
#define PRINTER_STATUS_USER_INTERVENTION &h00100000
#define PRINTER_STATUS_OUT_OF_MEMORY &h00200000
#define PRINTER_STATUS_DOOR_OPEN &h00400000
#define PRINTER_STATUS_SERVER_UNKNOWN &h00800000
#define PRINTER_STATUS_POWER_SAVE &h01000000
#define PRINTER_ATTRIBUTE_QUEUED &h00000001
#define PRINTER_ATTRIBUTE_DIRECT &h00000002
#define PRINTER_ATTRIBUTE_DEFAULT &h00000004
#define PRINTER_ATTRIBUTE_SHARED &h00000008
#define PRINTER_ATTRIBUTE_NETWORK &h00000010
#define PRINTER_ATTRIBUTE_HIDDEN &h00000020
#define PRINTER_ATTRIBUTE_LOCAL &h00000040
#define PRINTER_ATTRIBUTE_ENABLE_DEVQ &h00000080
#define PRINTER_ATTRIBUTE_KEEPPRINTEDJOBS &h00000100
#define PRINTER_ATTRIBUTE_DO_COMPLETE_FIRST &h00000200
#define PRINTER_ATTRIBUTE_WORK_OFFLINE &h00000400
#define PRINTER_ATTRIBUTE_ENABLE_BIDI &h00000800
#define PRINTER_ATTRIBUTE_RAW_ONLY &h00001000
#define PRINTER_ATTRIBUTE_PUBLISHED &h00002000
#define PRINTER_ATTRIBUTE_FAX &h00004000
#define PRINTER_ATTRIBUTE_TS &h00008000
#define NO_PRIORITY 0
#define MAX_PRIORITY 99
#define MIN_PRIORITY 1
#define DEF_PRIORITY 1

type _JOB_INFO_1A
	JobId as DWORD
	pPrinterName as LPSTR
	pMachineName as LPSTR
	pUserName as LPSTR
	pDocument as LPSTR
	pDatatype as LPSTR
	pStatus as LPSTR
	Status as DWORD
	Priority as DWORD
	Position as DWORD
	TotalPages as DWORD
	PagesPrinted as DWORD
	Submitted as SYSTEMTIME
end type

type JOB_INFO_1A as _JOB_INFO_1A
type PJOB_INFO_1A as _JOB_INFO_1A ptr
type LPJOB_INFO_1A as _JOB_INFO_1A ptr

type _JOB_INFO_1W
	JobId as DWORD
	pPrinterName as LPWSTR
	pMachineName as LPWSTR
	pUserName as LPWSTR
	pDocument as LPWSTR
	pDatatype as LPWSTR
	pStatus as LPWSTR
	Status as DWORD
	Priority as DWORD
	Position as DWORD
	TotalPages as DWORD
	PagesPrinted as DWORD
	Submitted as SYSTEMTIME
end type

type JOB_INFO_1W as _JOB_INFO_1W
type PJOB_INFO_1W as _JOB_INFO_1W ptr
type LPJOB_INFO_1W as _JOB_INFO_1W ptr

#ifdef UNICODE
	type JOB_INFO_1 as JOB_INFO_1W
	type PJOB_INFO_1 as PJOB_INFO_1W
	type LPJOB_INFO_1 as LPJOB_INFO_1W
#else
	type JOB_INFO_1 as JOB_INFO_1A
	type PJOB_INFO_1 as PJOB_INFO_1A
	type LPJOB_INFO_1 as LPJOB_INFO_1A
#endif

type _JOB_INFO_2A
	JobId as DWORD
	pPrinterName as LPSTR
	pMachineName as LPSTR
	pUserName as LPSTR
	pDocument as LPSTR
	pNotifyName as LPSTR
	pDatatype as LPSTR
	pPrintProcessor as LPSTR
	pParameters as LPSTR
	pDriverName as LPSTR
	pDevMode as LPDEVMODEA
	pStatus as LPSTR
	pSecurityDescriptor as PSECURITY_DESCRIPTOR
	Status as DWORD
	Priority as DWORD
	Position as DWORD
	StartTime as DWORD
	UntilTime as DWORD
	TotalPages as DWORD
	Size as DWORD
	Submitted as SYSTEMTIME
	Time as DWORD
	PagesPrinted as DWORD
end type

type JOB_INFO_2A as _JOB_INFO_2A
type PJOB_INFO_2A as _JOB_INFO_2A ptr
type LPJOB_INFO_2A as _JOB_INFO_2A ptr

type _JOB_INFO_2W
	JobId as DWORD
	pPrinterName as LPWSTR
	pMachineName as LPWSTR
	pUserName as LPWSTR
	pDocument as LPWSTR
	pNotifyName as LPWSTR
	pDatatype as LPWSTR
	pPrintProcessor as LPWSTR
	pParameters as LPWSTR
	pDriverName as LPWSTR
	pDevMode as LPDEVMODEW
	pStatus as LPWSTR
	pSecurityDescriptor as PSECURITY_DESCRIPTOR
	Status as DWORD
	Priority as DWORD
	Position as DWORD
	StartTime as DWORD
	UntilTime as DWORD
	TotalPages as DWORD
	Size as DWORD
	Submitted as SYSTEMTIME
	Time as DWORD
	PagesPrinted as DWORD
end type

type JOB_INFO_2W as _JOB_INFO_2W
type PJOB_INFO_2W as _JOB_INFO_2W ptr
type LPJOB_INFO_2W as _JOB_INFO_2W ptr

#ifdef UNICODE
	type JOB_INFO_2 as JOB_INFO_2W
	type PJOB_INFO_2 as PJOB_INFO_2W
	type LPJOB_INFO_2 as LPJOB_INFO_2W
#else
	type JOB_INFO_2 as JOB_INFO_2A
	type PJOB_INFO_2 as PJOB_INFO_2A
	type LPJOB_INFO_2 as LPJOB_INFO_2A
#endif

type _JOB_INFO_3
	JobId as DWORD
	NextJobId as DWORD
	Reserved as DWORD
end type

type JOB_INFO_3 as _JOB_INFO_3
type PJOB_INFO_3 as _JOB_INFO_3 ptr
type LPJOB_INFO_3 as _JOB_INFO_3 ptr

#define JOB_CONTROL_PAUSE 1
#define JOB_CONTROL_RESUME 2
#define JOB_CONTROL_CANCEL 3
#define JOB_CONTROL_RESTART 4
#define JOB_CONTROL_DELETE 5
#define JOB_CONTROL_SENT_TO_PRINTER 6
#define JOB_CONTROL_LAST_PAGE_EJECTED 7
#define JOB_STATUS_PAUSED &h00000001
#define JOB_STATUS_ERROR &h00000002
#define JOB_STATUS_DELETING &h00000004
#define JOB_STATUS_SPOOLING &h00000008
#define JOB_STATUS_PRINTING &h00000010
#define JOB_STATUS_OFFLINE &h00000020
#define JOB_STATUS_PAPEROUT &h00000040
#define JOB_STATUS_PRINTED &h00000080
#define JOB_STATUS_DELETED &h00000100
#define JOB_STATUS_BLOCKED_DEVQ &h00000200
#define JOB_STATUS_USER_INTERVENTION &h00000400
#define JOB_STATUS_RESTART &h00000800
#define JOB_STATUS_COMPLETE &h00001000
#define JOB_POSITION_UNSPECIFIED 0

type _ADDJOB_INFO_1A
	Path as LPSTR
	JobId as DWORD
end type

type ADDJOB_INFO_1A as _ADDJOB_INFO_1A
type PADDJOB_INFO_1A as _ADDJOB_INFO_1A ptr
type LPADDJOB_INFO_1A as _ADDJOB_INFO_1A ptr

type _ADDJOB_INFO_1W
	Path as LPWSTR
	JobId as DWORD
end type

type ADDJOB_INFO_1W as _ADDJOB_INFO_1W
type PADDJOB_INFO_1W as _ADDJOB_INFO_1W ptr
type LPADDJOB_INFO_1W as _ADDJOB_INFO_1W ptr

#ifdef UNICODE
	type ADDJOB_INFO_1 as ADDJOB_INFO_1W
	type PADDJOB_INFO_1 as PADDJOB_INFO_1W
	type LPADDJOB_INFO_1 as LPADDJOB_INFO_1W
#else
	type ADDJOB_INFO_1 as ADDJOB_INFO_1A
	type PADDJOB_INFO_1 as PADDJOB_INFO_1A
	type LPADDJOB_INFO_1 as LPADDJOB_INFO_1A
#endif

type _DRIVER_INFO_1A
	pName as LPSTR
end type

type DRIVER_INFO_1A as _DRIVER_INFO_1A
type PDRIVER_INFO_1A as _DRIVER_INFO_1A ptr
type LPDRIVER_INFO_1A as _DRIVER_INFO_1A ptr

type _DRIVER_INFO_1W
	pName as LPWSTR
end type

type DRIVER_INFO_1W as _DRIVER_INFO_1W
type PDRIVER_INFO_1W as _DRIVER_INFO_1W ptr
type LPDRIVER_INFO_1W as _DRIVER_INFO_1W ptr

#ifdef UNICODE
	type DRIVER_INFO_1 as DRIVER_INFO_1W
	type PDRIVER_INFO_1 as PDRIVER_INFO_1W
	type LPDRIVER_INFO_1 as LPDRIVER_INFO_1W
#else
	type DRIVER_INFO_1 as DRIVER_INFO_1A
	type PDRIVER_INFO_1 as PDRIVER_INFO_1A
	type LPDRIVER_INFO_1 as LPDRIVER_INFO_1A
#endif

type _DRIVER_INFO_2A
	cVersion as DWORD
	pName as LPSTR
	pEnvironment as LPSTR
	pDriverPath as LPSTR
	pDataFile as LPSTR
	pConfigFile as LPSTR
end type

type DRIVER_INFO_2A as _DRIVER_INFO_2A
type PDRIVER_INFO_2A as _DRIVER_INFO_2A ptr
type LPDRIVER_INFO_2A as _DRIVER_INFO_2A ptr

type _DRIVER_INFO_2W
	cVersion as DWORD
	pName as LPWSTR
	pEnvironment as LPWSTR
	pDriverPath as LPWSTR
	pDataFile as LPWSTR
	pConfigFile as LPWSTR
end type

type DRIVER_INFO_2W as _DRIVER_INFO_2W
type PDRIVER_INFO_2W as _DRIVER_INFO_2W ptr
type LPDRIVER_INFO_2W as _DRIVER_INFO_2W ptr

#ifdef UNICODE
	type DRIVER_INFO_2 as DRIVER_INFO_2W
	type PDRIVER_INFO_2 as PDRIVER_INFO_2W
	type LPDRIVER_INFO_2 as LPDRIVER_INFO_2W
#else
	type DRIVER_INFO_2 as DRIVER_INFO_2A
	type PDRIVER_INFO_2 as PDRIVER_INFO_2A
	type LPDRIVER_INFO_2 as LPDRIVER_INFO_2A
#endif

type _DRIVER_INFO_3A
	cVersion as DWORD
	pName as LPSTR
	pEnvironment as LPSTR
	pDriverPath as LPSTR
	pDataFile as LPSTR
	pConfigFile as LPSTR
	pHelpFile as LPSTR
	pDependentFiles as LPSTR
	pMonitorName as LPSTR
	pDefaultDataType as LPSTR
end type

type DRIVER_INFO_3A as _DRIVER_INFO_3A
type PDRIVER_INFO_3A as _DRIVER_INFO_3A ptr
type LPDRIVER_INFO_3A as _DRIVER_INFO_3A ptr

type _DRIVER_INFO_3W
	cVersion as DWORD
	pName as LPWSTR
	pEnvironment as LPWSTR
	pDriverPath as LPWSTR
	pDataFile as LPWSTR
	pConfigFile as LPWSTR
	pHelpFile as LPWSTR
	pDependentFiles as LPWSTR
	pMonitorName as LPWSTR
	pDefaultDataType as LPWSTR
end type

type DRIVER_INFO_3W as _DRIVER_INFO_3W
type PDRIVER_INFO_3W as _DRIVER_INFO_3W ptr
type LPDRIVER_INFO_3W as _DRIVER_INFO_3W ptr

#ifdef UNICODE
	type DRIVER_INFO_3 as DRIVER_INFO_3W
	type PDRIVER_INFO_3 as PDRIVER_INFO_3W
	type LPDRIVER_INFO_3 as LPDRIVER_INFO_3W
#else
	type DRIVER_INFO_3 as DRIVER_INFO_3A
	type PDRIVER_INFO_3 as PDRIVER_INFO_3A
	type LPDRIVER_INFO_3 as LPDRIVER_INFO_3A
#endif

type _DRIVER_INFO_4A
	cVersion as DWORD
	pName as LPSTR
	pEnvironment as LPSTR
	pDriverPath as LPSTR
	pDataFile as LPSTR
	pConfigFile as LPSTR
	pHelpFile as LPSTR
	pDependentFiles as LPSTR
	pMonitorName as LPSTR
	pDefaultDataType as LPSTR
	pszzPreviousNames as LPSTR
end type

type DRIVER_INFO_4A as _DRIVER_INFO_4A
type PDRIVER_INFO_4A as _DRIVER_INFO_4A ptr
type LPDRIVER_INFO_4A as _DRIVER_INFO_4A ptr

type _DRIVER_INFO_4W
	cVersion as DWORD
	pName as LPWSTR
	pEnvironment as LPWSTR
	pDriverPath as LPWSTR
	pDataFile as LPWSTR
	pConfigFile as LPWSTR
	pHelpFile as LPWSTR
	pDependentFiles as LPWSTR
	pMonitorName as LPWSTR
	pDefaultDataType as LPWSTR
	pszzPreviousNames as LPWSTR
end type

type DRIVER_INFO_4W as _DRIVER_INFO_4W
type PDRIVER_INFO_4W as _DRIVER_INFO_4W ptr
type LPDRIVER_INFO_4W as _DRIVER_INFO_4W ptr

#ifdef UNICODE
	type DRIVER_INFO_4 as DRIVER_INFO_4W
	type PDRIVER_INFO_4 as PDRIVER_INFO_4W
	type LPDRIVER_INFO_4 as LPDRIVER_INFO_4W
#else
	type DRIVER_INFO_4 as DRIVER_INFO_4A
	type PDRIVER_INFO_4 as PDRIVER_INFO_4A
	type LPDRIVER_INFO_4 as LPDRIVER_INFO_4A
#endif

type _DRIVER_INFO_5A
	cVersion as DWORD
	pName as LPSTR
	pEnvironment as LPSTR
	pDriverPath as LPSTR
	pDataFile as LPSTR
	pConfigFile as LPSTR
	dwDriverAttributes as DWORD
	dwConfigVersion as DWORD
	dwDriverVersion as DWORD
end type

type DRIVER_INFO_5A as _DRIVER_INFO_5A
type PDRIVER_INFO_5A as _DRIVER_INFO_5A ptr
type LPDRIVER_INFO_5A as _DRIVER_INFO_5A ptr

type _DRIVER_INFO_5W
	cVersion as DWORD
	pName as LPWSTR
	pEnvironment as LPWSTR
	pDriverPath as LPWSTR
	pDataFile as LPWSTR
	pConfigFile as LPWSTR
	dwDriverAttributes as DWORD
	dwConfigVersion as DWORD
	dwDriverVersion as DWORD
end type

type DRIVER_INFO_5W as _DRIVER_INFO_5W
type PDRIVER_INFO_5W as _DRIVER_INFO_5W ptr
type LPDRIVER_INFO_5W as _DRIVER_INFO_5W ptr

#ifdef UNICODE
	type DRIVER_INFO_5 as DRIVER_INFO_5W
	type PDRIVER_INFO_5 as PDRIVER_INFO_5W
	type LPDRIVER_INFO_5 as LPDRIVER_INFO_5W
#else
	type DRIVER_INFO_5 as DRIVER_INFO_5A
	type PDRIVER_INFO_5 as PDRIVER_INFO_5A
	type LPDRIVER_INFO_5 as LPDRIVER_INFO_5A
#endif

type _DRIVER_INFO_6A
	cVersion as DWORD
	pName as LPSTR
	pEnvironment as LPSTR
	pDriverPath as LPSTR
	pDataFile as LPSTR
	pConfigFile as LPSTR
	pHelpFile as LPSTR
	pDependentFiles as LPSTR
	pMonitorName as LPSTR
	pDefaultDataType as LPSTR
	pszzPreviousNames as LPSTR
	ftDriverDate as FILETIME
	dwlDriverVersion as DWORDLONG
	pszMfgName as LPSTR
	pszOEMUrl as LPSTR
	pszHardwareID as LPSTR
	pszProvider as LPSTR
end type

type DRIVER_INFO_6A as _DRIVER_INFO_6A
type PDRIVER_INFO_6A as _DRIVER_INFO_6A ptr
type LPDRIVER_INFO_6A as _DRIVER_INFO_6A ptr

type _DRIVER_INFO_6W
	cVersion as DWORD
	pName as LPWSTR
	pEnvironment as LPWSTR
	pDriverPath as LPWSTR
	pDataFile as LPWSTR
	pConfigFile as LPWSTR
	pHelpFile as LPWSTR
	pDependentFiles as LPWSTR
	pMonitorName as LPWSTR
	pDefaultDataType as LPWSTR
	pszzPreviousNames as LPWSTR
	ftDriverDate as FILETIME
	dwlDriverVersion as DWORDLONG
	pszMfgName as LPWSTR
	pszOEMUrl as LPWSTR
	pszHardwareID as LPWSTR
	pszProvider as LPWSTR
end type

type DRIVER_INFO_6W as _DRIVER_INFO_6W
type PDRIVER_INFO_6W as _DRIVER_INFO_6W ptr
type LPDRIVER_INFO_6W as _DRIVER_INFO_6W ptr

#ifdef UNICODE
	type DRIVER_INFO_6 as DRIVER_INFO_6W
	type PDRIVER_INFO_6 as PDRIVER_INFO_6W
	type LPDRIVER_INFO_6 as LPDRIVER_INFO_6W
#else
	type DRIVER_INFO_6 as DRIVER_INFO_6A
	type PDRIVER_INFO_6 as PDRIVER_INFO_6A
	type LPDRIVER_INFO_6 as LPDRIVER_INFO_6A
#endif

#define DRIVER_KERNELMODE &h00000001
#define DRIVER_USERMODE &h00000002
#define DPD_DELETE_UNUSED_FILES &h00000001
#define DPD_DELETE_SPECIFIC_VERSION &h00000002
#define DPD_DELETE_ALL_FILES &h00000004
#define APD_STRICT_UPGRADE &h00000001
#define APD_STRICT_DOWNGRADE &h00000002
#define APD_COPY_ALL_FILES &h00000004
#define APD_COPY_NEW_FILES &h00000008
#define APD_COPY_FROM_DIRECTORY &h00000010

type _DOC_INFO_1A
	pDocName as LPSTR
	pOutputFile as LPSTR
	pDatatype as LPSTR
end type

type DOC_INFO_1A as _DOC_INFO_1A
type PDOC_INFO_1A as _DOC_INFO_1A ptr
type LPDOC_INFO_1A as _DOC_INFO_1A ptr

type _DOC_INFO_1W
	pDocName as LPWSTR
	pOutputFile as LPWSTR
	pDatatype as LPWSTR
end type

type DOC_INFO_1W as _DOC_INFO_1W
type PDOC_INFO_1W as _DOC_INFO_1W ptr
type LPDOC_INFO_1W as _DOC_INFO_1W ptr

#ifdef UNICODE
	type DOC_INFO_1 as DOC_INFO_1W
	type PDOC_INFO_1 as PDOC_INFO_1W
	type LPDOC_INFO_1 as LPDOC_INFO_1W
#else
	type DOC_INFO_1 as DOC_INFO_1A
	type PDOC_INFO_1 as PDOC_INFO_1A
	type LPDOC_INFO_1 as LPDOC_INFO_1A
#endif

type _FORM_INFO_1A
	Flags as DWORD
	pName as LPSTR
	Size as SIZEL
	ImageableArea as RECTL
end type

type FORM_INFO_1A as _FORM_INFO_1A
type PFORM_INFO_1A as _FORM_INFO_1A ptr
type LPFORM_INFO_1A as _FORM_INFO_1A ptr

type _FORM_INFO_1W
	Flags as DWORD
	pName as LPWSTR
	Size as SIZEL
	ImageableArea as RECTL
end type

type FORM_INFO_1W as _FORM_INFO_1W
type PFORM_INFO_1W as _FORM_INFO_1W ptr
type LPFORM_INFO_1W as _FORM_INFO_1W ptr

#ifdef UNICODE
	type FORM_INFO_1 as FORM_INFO_1W
	type PFORM_INFO_1 as PFORM_INFO_1W
	type LPFORM_INFO_1 as LPFORM_INFO_1W
#else
	type FORM_INFO_1 as FORM_INFO_1A
	type PFORM_INFO_1 as PFORM_INFO_1A
	type LPFORM_INFO_1 as LPFORM_INFO_1A
#endif

type _DOC_INFO_2A
	pDocName as LPSTR
	pOutputFile as LPSTR
	pDatatype as LPSTR
	dwMode as DWORD
	JobId as DWORD
end type

type DOC_INFO_2A as _DOC_INFO_2A
type PDOC_INFO_2A as _DOC_INFO_2A ptr
type LPDOC_INFO_2A as _DOC_INFO_2A ptr

type _DOC_INFO_2W
	pDocName as LPWSTR
	pOutputFile as LPWSTR
	pDatatype as LPWSTR
	dwMode as DWORD
	JobId as DWORD
end type

type DOC_INFO_2W as _DOC_INFO_2W
type PDOC_INFO_2W as _DOC_INFO_2W ptr
type LPDOC_INFO_2W as _DOC_INFO_2W ptr

#ifdef UNICODE
	type DOC_INFO_2 as DOC_INFO_2W
	type PDOC_INFO_2 as PDOC_INFO_2W
	type LPDOC_INFO_2 as LPDOC_INFO_2W
#else
	type DOC_INFO_2 as DOC_INFO_2A
	type PDOC_INFO_2 as PDOC_INFO_2A
	type LPDOC_INFO_2 as LPDOC_INFO_2A
#endif

#define DI_CHANNEL 1
#define DI_READ_SPOOL_JOB 3

type _DOC_INFO_3A
	pDocName as LPSTR
	pOutputFile as LPSTR
	pDatatype as LPSTR
	dwFlags as DWORD
end type

type DOC_INFO_3A as _DOC_INFO_3A
type PDOC_INFO_3A as _DOC_INFO_3A ptr
type LPDOC_INFO_3A as _DOC_INFO_3A ptr

type _DOC_INFO_3W
	pDocName as LPWSTR
	pOutputFile as LPWSTR
	pDatatype as LPWSTR
	dwFlags as DWORD
end type

type DOC_INFO_3W as _DOC_INFO_3W
type PDOC_INFO_3W as _DOC_INFO_3W ptr
type LPDOC_INFO_3W as _DOC_INFO_3W ptr

#ifdef UNICODE
	type DOC_INFO_3 as DOC_INFO_3W
	type PDOC_INFO_3 as PDOC_INFO_3W
	type LPDOC_INFO_3 as LPDOC_INFO_3W
#else
	type DOC_INFO_3 as DOC_INFO_3A
	type PDOC_INFO_3 as PDOC_INFO_3A
	type LPDOC_INFO_3 as LPDOC_INFO_3A
#endif

#define DI_MEMORYMAP_WRITE &h00000001
#define FORM_USER &h00000000
#define FORM_BUILTIN &h00000001
#define FORM_PRINTER &h00000002

type _PRINTPROCESSOR_INFO_1A
	pName as LPSTR
end type

type PRINTPROCESSOR_INFO_1A as _PRINTPROCESSOR_INFO_1A
type PPRINTPROCESSOR_INFO_1A as _PRINTPROCESSOR_INFO_1A ptr
type LPPRINTPROCESSOR_INFO_1A as _PRINTPROCESSOR_INFO_1A ptr

type _PRINTPROCESSOR_INFO_1W
	pName as LPWSTR
end type

type PRINTPROCESSOR_INFO_1W as _PRINTPROCESSOR_INFO_1W
type PPRINTPROCESSOR_INFO_1W as _PRINTPROCESSOR_INFO_1W ptr
type LPPRINTPROCESSOR_INFO_1W as _PRINTPROCESSOR_INFO_1W ptr

#ifdef UNICODE
	type PRINTPROCESSOR_INFO_1 as PRINTPROCESSOR_INFO_1W
	type PPRINTPROCESSOR_INFO_1 as PPRINTPROCESSOR_INFO_1W
	type LPPRINTPROCESSOR_INFO_1 as LPPRINTPROCESSOR_INFO_1W
#else
	type PRINTPROCESSOR_INFO_1 as PRINTPROCESSOR_INFO_1A
	type PPRINTPROCESSOR_INFO_1 as PPRINTPROCESSOR_INFO_1A
	type LPPRINTPROCESSOR_INFO_1 as LPPRINTPROCESSOR_INFO_1A
#endif

type _PRINTPROCESSOR_CAPS_1
	dwLevel as DWORD
	dwNupOptions as DWORD
	dwPageOrderFlags as DWORD
	dwNumberOfCopies as DWORD
end type

type PRINTPROCESSOR_CAPS_1 as _PRINTPROCESSOR_CAPS_1
type PPRINTPROCESSOR_CAPS_1 as _PRINTPROCESSOR_CAPS_1 ptr

#define NORMAL_PRINT &h00000000
#define REVERSE_PRINT &h00000001

type _PORT_INFO_1A
	pName as LPSTR
end type

type PORT_INFO_1A as _PORT_INFO_1A
type PPORT_INFO_1A as _PORT_INFO_1A ptr
type LPPORT_INFO_1A as _PORT_INFO_1A ptr

type _PORT_INFO_1W
	pName as LPWSTR
end type

type PORT_INFO_1W as _PORT_INFO_1W
type PPORT_INFO_1W as _PORT_INFO_1W ptr
type LPPORT_INFO_1W as _PORT_INFO_1W ptr

#ifdef UNICODE
	type PORT_INFO_1 as PORT_INFO_1W
	type PPORT_INFO_1 as PPORT_INFO_1W
	type LPPORT_INFO_1 as LPPORT_INFO_1W
#else
	type PORT_INFO_1 as PORT_INFO_1A
	type PPORT_INFO_1 as PPORT_INFO_1A
	type LPPORT_INFO_1 as LPPORT_INFO_1A
#endif

type _PORT_INFO_2A
	pPortName as LPSTR
	pMonitorName as LPSTR
	pDescription as LPSTR
	fPortType as DWORD
	Reserved as DWORD
end type

type PORT_INFO_2A as _PORT_INFO_2A
type PPORT_INFO_2A as _PORT_INFO_2A ptr
type LPPORT_INFO_2A as _PORT_INFO_2A ptr

type _PORT_INFO_2W
	pPortName as LPWSTR
	pMonitorName as LPWSTR
	pDescription as LPWSTR
	fPortType as DWORD
	Reserved as DWORD
end type

type PORT_INFO_2W as _PORT_INFO_2W
type PPORT_INFO_2W as _PORT_INFO_2W ptr
type LPPORT_INFO_2W as _PORT_INFO_2W ptr

#ifdef UNICODE
	type PORT_INFO_2 as PORT_INFO_2W
	type PPORT_INFO_2 as PPORT_INFO_2W
	type LPPORT_INFO_2 as LPPORT_INFO_2W
#else
	type PORT_INFO_2 as PORT_INFO_2A
	type PPORT_INFO_2 as PPORT_INFO_2A
	type LPPORT_INFO_2 as LPPORT_INFO_2A
#endif

#define PORT_TYPE_WRITE &h0001
#define PORT_TYPE_READ &h0002
#define PORT_TYPE_REDIRECTED &h0004
#define PORT_TYPE_NET_ATTACHED &h0008

type _PORT_INFO_3A
	dwStatus as DWORD
	pszStatus as LPSTR
	dwSeverity as DWORD
end type

type PORT_INFO_3A as _PORT_INFO_3A
type PPORT_INFO_3A as _PORT_INFO_3A ptr
type LPPORT_INFO_3A as _PORT_INFO_3A ptr

type _PORT_INFO_3W
	dwStatus as DWORD
	pszStatus as LPWSTR
	dwSeverity as DWORD
end type

type PORT_INFO_3W as _PORT_INFO_3W
type PPORT_INFO_3W as _PORT_INFO_3W ptr
type LPPORT_INFO_3W as _PORT_INFO_3W ptr

#ifdef UNICODE
	type PORT_INFO_3 as PORT_INFO_3W
	type PPORT_INFO_3 as PPORT_INFO_3W
	type LPPORT_INFO_3 as LPPORT_INFO_3W
#else
	type PORT_INFO_3 as PORT_INFO_3A
	type PPORT_INFO_3 as PPORT_INFO_3A
	type LPPORT_INFO_3 as LPPORT_INFO_3A
#endif

#define PORT_STATUS_TYPE_ERROR 1
#define PORT_STATUS_TYPE_WARNING 2
#define PORT_STATUS_TYPE_INFO 3
#define PORT_STATUS_OFFLINE 1
#define PORT_STATUS_PAPER_JAM 2
#define PORT_STATUS_PAPER_OUT 3
#define PORT_STATUS_OUTPUT_BIN_FULL 4
#define PORT_STATUS_PAPER_PROBLEM 5
#define PORT_STATUS_NO_TONER 6
#define PORT_STATUS_DOOR_OPEN 7
#define PORT_STATUS_USER_INTERVENTION 8
#define PORT_STATUS_OUT_OF_MEMORY 9
#define PORT_STATUS_TONER_LOW 10
#define PORT_STATUS_WARMING_UP 11
#define PORT_STATUS_POWER_SAVE 12

type _MONITOR_INFO_1A
	pName as LPSTR
end type

type MONITOR_INFO_1A as _MONITOR_INFO_1A
type PMONITOR_INFO_1A as _MONITOR_INFO_1A ptr
type LPMONITOR_INFO_1A as _MONITOR_INFO_1A ptr

type _MONITOR_INFO_1W
	pName as LPWSTR
end type

type MONITOR_INFO_1W as _MONITOR_INFO_1W
type PMONITOR_INFO_1W as _MONITOR_INFO_1W ptr
type LPMONITOR_INFO_1W as _MONITOR_INFO_1W ptr

#ifdef UNICODE
	type MONITOR_INFO_1 as MONITOR_INFO_1W
	type PMONITOR_INFO_1 as PMONITOR_INFO_1W
	type LPMONITOR_INFO_1 as LPMONITOR_INFO_1W
#else
	type MONITOR_INFO_1 as MONITOR_INFO_1A
	type PMONITOR_INFO_1 as PMONITOR_INFO_1A
	type LPMONITOR_INFO_1 as LPMONITOR_INFO_1A
#endif

type _MONITOR_INFO_2A
	pName as LPSTR
	pEnvironment as LPSTR
	pDLLName as LPSTR
end type

type MONITOR_INFO_2A as _MONITOR_INFO_2A
type PMONITOR_INFO_2A as _MONITOR_INFO_2A ptr
type LPMONITOR_INFO_2A as _MONITOR_INFO_2A ptr

type _MONITOR_INFO_2W
	pName as LPWSTR
	pEnvironment as LPWSTR
	pDLLName as LPWSTR
end type

type MONITOR_INFO_2W as _MONITOR_INFO_2W
type PMONITOR_INFO_2W as _MONITOR_INFO_2W ptr
type LPMONITOR_INFO_2W as _MONITOR_INFO_2W ptr

#ifdef UNICODE
	type MONITOR_INFO_2 as MONITOR_INFO_2W
	type PMONITOR_INFO_2 as PMONITOR_INFO_2W
	type LPMONITOR_INFO_2 as LPMONITOR_INFO_2W
#else
	type MONITOR_INFO_2 as MONITOR_INFO_2A
	type PMONITOR_INFO_2 as PMONITOR_INFO_2A
	type LPMONITOR_INFO_2 as LPMONITOR_INFO_2A
#endif

type _DATATYPES_INFO_1A
	pName as LPSTR
end type

type DATATYPES_INFO_1A as _DATATYPES_INFO_1A
type PDATATYPES_INFO_1A as _DATATYPES_INFO_1A ptr
type LPDATATYPES_INFO_1A as _DATATYPES_INFO_1A ptr

type _DATATYPES_INFO_1W
	pName as LPWSTR
end type

type DATATYPES_INFO_1W as _DATATYPES_INFO_1W
type PDATATYPES_INFO_1W as _DATATYPES_INFO_1W ptr
type LPDATATYPES_INFO_1W as _DATATYPES_INFO_1W ptr

#ifdef UNICODE
	type DATATYPES_INFO_1 as DATATYPES_INFO_1W
	type PDATATYPES_INFO_1 as PDATATYPES_INFO_1W
	type LPDATATYPES_INFO_1 as LPDATATYPES_INFO_1W
#else
	type DATATYPES_INFO_1 as DATATYPES_INFO_1A
	type PDATATYPES_INFO_1 as PDATATYPES_INFO_1A
	type LPDATATYPES_INFO_1 as LPDATATYPES_INFO_1A
#endif

type _PRINTER_DEFAULTSA
	pDatatype as LPSTR
	pDevMode as LPDEVMODEA
	DesiredAccess as ACCESS_MASK
end type

type PRINTER_DEFAULTSA as _PRINTER_DEFAULTSA
type PPRINTER_DEFAULTSA as _PRINTER_DEFAULTSA ptr
type LPPRINTER_DEFAULTSA as _PRINTER_DEFAULTSA ptr

type _PRINTER_DEFAULTSW
	pDatatype as LPWSTR
	pDevMode as LPDEVMODEW
	DesiredAccess as ACCESS_MASK
end type

type PRINTER_DEFAULTSW as _PRINTER_DEFAULTSW
type PPRINTER_DEFAULTSW as _PRINTER_DEFAULTSW ptr
type LPPRINTER_DEFAULTSW as _PRINTER_DEFAULTSW ptr

#ifdef UNICODE
	type PRINTER_DEFAULTS as PRINTER_DEFAULTSW
	type PPRINTER_DEFAULTS as PPRINTER_DEFAULTSW
	type LPPRINTER_DEFAULTS as LPPRINTER_DEFAULTSW
#else
	type PRINTER_DEFAULTS as PRINTER_DEFAULTSA
	type PPRINTER_DEFAULTS as PPRINTER_DEFAULTSA
	type LPPRINTER_DEFAULTS as LPPRINTER_DEFAULTSA
#endif

type _PRINTER_ENUM_VALUESA
	pValueName as LPSTR
	cbValueName as DWORD
	dwType as DWORD
	pData as LPBYTE
	cbData as DWORD
end type

type PRINTER_ENUM_VALUESA as _PRINTER_ENUM_VALUESA
type PPRINTER_ENUM_VALUESA as _PRINTER_ENUM_VALUESA ptr
type LPPRINTER_ENUM_VALUESA as _PRINTER_ENUM_VALUESA ptr

type _PRINTER_ENUM_VALUESW
	pValueName as LPWSTR
	cbValueName as DWORD
	dwType as DWORD
	pData as LPBYTE
	cbData as DWORD
end type

type PRINTER_ENUM_VALUESW as _PRINTER_ENUM_VALUESW
type PPRINTER_ENUM_VALUESW as _PRINTER_ENUM_VALUESW ptr
type LPPRINTER_ENUM_VALUESW as _PRINTER_ENUM_VALUESW ptr

#ifdef UNICODE
	type PRINTER_ENUM_VALUES as PRINTER_ENUM_VALUESW
	type PPRINTER_ENUM_VALUES as PPRINTER_ENUM_VALUESW
	type LPPRINTER_ENUM_VALUES as LPPRINTER_ENUM_VALUESW
#else
	type PRINTER_ENUM_VALUES as PRINTER_ENUM_VALUESA
	type PPRINTER_ENUM_VALUES as PPRINTER_ENUM_VALUESA
	type LPPRINTER_ENUM_VALUES as LPPRINTER_ENUM_VALUESA
#endif

#define EnumPrinters __MINGW_NAME_AW(EnumPrinters)

extern     WINAPI as WINBOOL
dim shared WINAPI as WINBOOL

'' TODO: WINBOOL WINAPI EnumPrintersA(DWORD Flags,LPSTR Name,DWORD Level,LPBYTE pPrinterEnum,DWORD cbBuf,LPDWORD pcbNeeded,LPDWORD pcReturned);
'' TODO: WINBOOL WINAPI EnumPrintersW(DWORD Flags,LPWSTR Name,DWORD Level,LPBYTE pPrinterEnum,DWORD cbBuf,LPDWORD pcbNeeded,LPDWORD pcReturned);

#define PRINTER_ENUM_DEFAULT &h00000001
#define PRINTER_ENUM_LOCAL &h00000002
#define PRINTER_ENUM_CONNECTIONS &h00000004
#define PRINTER_ENUM_FAVORITE &h00000004
#define PRINTER_ENUM_NAME &h00000008
#define PRINTER_ENUM_REMOTE &h00000010
#define PRINTER_ENUM_SHARED &h00000020
#define PRINTER_ENUM_NETWORK &h00000040
#define PRINTER_ENUM_EXPAND &h00004000
#define PRINTER_ENUM_CONTAINER &h00008000
#define PRINTER_ENUM_ICONMASK &h00ff0000
#define PRINTER_ENUM_ICON1 &h00010000
#define PRINTER_ENUM_ICON2 &h00020000
#define PRINTER_ENUM_ICON3 &h00040000
#define PRINTER_ENUM_ICON4 &h00080000
#define PRINTER_ENUM_ICON5 &h00100000
#define PRINTER_ENUM_ICON6 &h00200000
#define PRINTER_ENUM_ICON7 &h00400000
#define PRINTER_ENUM_ICON8 &h00800000
#define PRINTER_ENUM_HIDE &h01000000
#define SPOOL_FILE_PERSISTENT &h00000001
#define SPOOL_FILE_TEMPORARY &h00000002
#define OpenPrinter __MINGW_NAME_AW(OpenPrinter)
#define ResetPrinter __MINGW_NAME_AW(ResetPrinter)
#define SetJob __MINGW_NAME_AW(SetJob)
#define GetJob __MINGW_NAME_AW(GetJob)
#define EnumJobs __MINGW_NAME_AW(EnumJobs)
#define AddPrinter __MINGW_NAME_AW(AddPrinter)
#define SetPrinter __MINGW_NAME_AW(SetPrinter)
#define GetPrinter __MINGW_NAME_AW(GetPrinter)
#define AddPrinterDriver __MINGW_NAME_AW(AddPrinterDriver)
#define AddPrinterDriverEx __MINGW_NAME_AW(AddPrinterDriverEx)
#define EnumPrinterDrivers __MINGW_NAME_AW(EnumPrinterDrivers)
#define GetPrinterDriver __MINGW_NAME_AW(GetPrinterDriver)
#define GetPrinterDriverDirectory __MINGW_NAME_AW(GetPrinterDriverDirectory)
#define DeletePrinterDriver __MINGW_NAME_AW(DeletePrinterDriver)
#define DeletePrinterDriverEx __MINGW_NAME_AW(DeletePrinterDriverEx)
#define AddPrintProcessor __MINGW_NAME_AW(AddPrintProcessor)
#define EnumPrintProcessors __MINGW_NAME_AW(EnumPrintProcessors)
#define GetPrintProcessorDirectory __MINGW_NAME_AW(GetPrintProcessorDirectory)
#define EnumPrintProcessorDatatypes __MINGW_NAME_AW(EnumPrintProcessorDatatypes)
#define DeletePrintProcessor __MINGW_NAME_AW(DeletePrintProcessor)
#define StartDocPrinter __MINGW_NAME_AW(StartDocPrinter)
#define AddJob __MINGW_NAME_AW(AddJob)
#define DocumentProperties __MINGW_NAME_AW(DocumentProperties)
#define AdvancedDocumentProperties __MINGW_NAME_AW(AdvancedDocumentProperties)
#define GetPrinterData __MINGW_NAME_AW(GetPrinterData)
#define GetPrinterDataEx __MINGW_NAME_AW(GetPrinterDataEx)
#define EnumPrinterData __MINGW_NAME_AW(EnumPrinterData)
#define EnumPrinterDataEx __MINGW_NAME_AW(EnumPrinterDataEx)
#define EnumPrinterKey __MINGW_NAME_AW(EnumPrinterKey)
#define SetPrinterData __MINGW_NAME_AW(SetPrinterData)
#define SetPrinterDataEx __MINGW_NAME_AW(SetPrinterDataEx)
#define DeletePrinterData __MINGW_NAME_AW(DeletePrinterData)
#define DeletePrinterDataEx __MINGW_NAME_AW(DeletePrinterDataEx)
#define DeletePrinterKey __MINGW_NAME_AW(DeletePrinterKey)

'' TODO: WINBOOL WINAPI OpenPrinterA(LPSTR pPrinterName,LPHANDLE phPrinter,LPPRINTER_DEFAULTSA pDefault);
'' TODO: WINBOOL WINAPI OpenPrinterW(LPWSTR pPrinterName,LPHANDLE phPrinter,LPPRINTER_DEFAULTSW pDefault);
'' TODO: WINBOOL WINAPI ResetPrinterA(HANDLE hPrinter,LPPRINTER_DEFAULTSA pDefault);
'' TODO: WINBOOL WINAPI ResetPrinterW(HANDLE hPrinter,LPPRINTER_DEFAULTSW pDefault);
'' TODO: WINBOOL WINAPI SetJobA(HANDLE hPrinter,DWORD JobId,DWORD Level,LPBYTE pJob,DWORD Command);
'' TODO: WINBOOL WINAPI SetJobW(HANDLE hPrinter,DWORD JobId,DWORD Level,LPBYTE pJob,DWORD Command);
'' TODO: WINBOOL WINAPI GetJobA(HANDLE hPrinter,DWORD JobId,DWORD Level,LPBYTE pJob,DWORD cbBuf,LPDWORD pcbNeeded);
'' TODO: WINBOOL WINAPI GetJobW(HANDLE hPrinter,DWORD JobId,DWORD Level,LPBYTE pJob,DWORD cbBuf,LPDWORD pcbNeeded);
'' TODO: WINBOOL WINAPI EnumJobsA(HANDLE hPrinter,DWORD FirstJob,DWORD NoJobs,DWORD Level,LPBYTE pJob,DWORD cbBuf,LPDWORD pcbNeeded,LPDWORD pcReturned);
'' TODO: WINBOOL WINAPI EnumJobsW(HANDLE hPrinter,DWORD FirstJob,DWORD NoJobs,DWORD Level,LPBYTE pJob,DWORD cbBuf,LPDWORD pcbNeeded,LPDWORD pcReturned);
'' TODO: HANDLE WINAPI AddPrinterA(LPSTR pName,DWORD Level,LPBYTE pPrinter);
'' TODO: HANDLE WINAPI AddPrinterW(LPWSTR pName,DWORD Level,LPBYTE pPrinter);
'' TODO: WINBOOL WINAPI DeletePrinter(HANDLE hPrinter);
'' TODO: WINBOOL WINAPI SetPrinterA(HANDLE hPrinter,DWORD Level,LPBYTE pPrinter,DWORD Command);
'' TODO: WINBOOL WINAPI SetPrinterW(HANDLE hPrinter,DWORD Level,LPBYTE pPrinter,DWORD Command);
'' TODO: WINBOOL WINAPI GetPrinterA(HANDLE hPrinter,DWORD Level,LPBYTE pPrinter,DWORD cbBuf,LPDWORD pcbNeeded);
'' TODO: WINBOOL WINAPI GetPrinterW(HANDLE hPrinter,DWORD Level,LPBYTE pPrinter,DWORD cbBuf,LPDWORD pcbNeeded);
'' TODO: WINBOOL WINAPI AddPrinterDriverA(LPSTR pName,DWORD Level,LPBYTE pDriverInfo);
'' TODO: WINBOOL WINAPI AddPrinterDriverW(LPWSTR pName,DWORD Level,LPBYTE pDriverInfo);
'' TODO: WINBOOL WINAPI AddPrinterDriverExA(LPSTR pName,DWORD Level,LPBYTE pDriverInfo,DWORD dwFileCopyFlags);
'' TODO: WINBOOL WINAPI AddPrinterDriverExW(LPWSTR pName,DWORD Level,LPBYTE pDriverInfo,DWORD dwFileCopyFlags);
'' TODO: WINBOOL WINAPI EnumPrinterDriversA(LPSTR pName,LPSTR pEnvironment,DWORD Level,LPBYTE pDriverInfo,DWORD cbBuf,LPDWORD pcbNeeded,LPDWORD pcReturned);
'' TODO: WINBOOL WINAPI EnumPrinterDriversW(LPWSTR pName,LPWSTR pEnvironment,DWORD Level,LPBYTE pDriverInfo,DWORD cbBuf,LPDWORD pcbNeeded,LPDWORD pcReturned);
'' TODO: WINBOOL WINAPI GetPrinterDriverA(HANDLE hPrinter,LPSTR pEnvironment,DWORD Level,LPBYTE pDriverInfo,DWORD cbBuf,LPDWORD pcbNeeded);
'' TODO: WINBOOL WINAPI GetPrinterDriverW(HANDLE hPrinter,LPWSTR pEnvironment,DWORD Level,LPBYTE pDriverInfo,DWORD cbBuf,LPDWORD pcbNeeded);
'' TODO: WINBOOL WINAPI GetPrinterDriverDirectoryA(LPSTR pName,LPSTR pEnvironment,DWORD Level,LPBYTE pDriverDirectory,DWORD cbBuf,LPDWORD pcbNeeded);
'' TODO: WINBOOL WINAPI GetPrinterDriverDirectoryW(LPWSTR pName,LPWSTR pEnvironment,DWORD Level,LPBYTE pDriverDirectory,DWORD cbBuf,LPDWORD pcbNeeded);
'' TODO: WINBOOL WINAPI DeletePrinterDriverA(LPSTR pName,LPSTR pEnvironment,LPSTR pDriverName);
'' TODO: WINBOOL WINAPI DeletePrinterDriverW(LPWSTR pName,LPWSTR pEnvironment,LPWSTR pDriverName);
'' TODO: WINBOOL WINAPI DeletePrinterDriverExA(LPSTR pName,LPSTR pEnvironment,LPSTR pDriverName,DWORD dwDeleteFlag,DWORD dwVersionFlag);
'' TODO: WINBOOL WINAPI DeletePrinterDriverExW(LPWSTR pName,LPWSTR pEnvironment,LPWSTR pDriverName,DWORD dwDeleteFlag,DWORD dwVersionFlag);
'' TODO: WINBOOL WINAPI AddPrintProcessorA(LPSTR pName,LPSTR pEnvironment,LPSTR pPathName,LPSTR pPrintProcessorName);
'' TODO: WINBOOL WINAPI AddPrintProcessorW(LPWSTR pName,LPWSTR pEnvironment,LPWSTR pPathName,LPWSTR pPrintProcessorName);
'' TODO: WINBOOL WINAPI EnumPrintProcessorsA(LPSTR pName,LPSTR pEnvironment,DWORD Level,LPBYTE pPrintProcessorInfo,DWORD cbBuf,LPDWORD pcbNeeded,LPDWORD pcReturned);
'' TODO: WINBOOL WINAPI EnumPrintProcessorsW(LPWSTR pName,LPWSTR pEnvironment,DWORD Level,LPBYTE pPrintProcessorInfo,DWORD cbBuf,LPDWORD pcbNeeded,LPDWORD pcReturned);
'' TODO: WINBOOL WINAPI GetPrintProcessorDirectoryA(LPSTR pName,LPSTR pEnvironment,DWORD Level,LPBYTE pPrintProcessorInfo,DWORD cbBuf,LPDWORD pcbNeeded);
'' TODO: WINBOOL WINAPI GetPrintProcessorDirectoryW(LPWSTR pName,LPWSTR pEnvironment,DWORD Level,LPBYTE pPrintProcessorInfo,DWORD cbBuf,LPDWORD pcbNeeded);
'' TODO: WINBOOL WINAPI EnumPrintProcessorDatatypesA(LPSTR pName,LPSTR pPrintProcessorName,DWORD Level,LPBYTE pDatatypes,DWORD cbBuf,LPDWORD pcbNeeded,LPDWORD pcReturned);
'' TODO: WINBOOL WINAPI EnumPrintProcessorDatatypesW(LPWSTR pName,LPWSTR pPrintProcessorName,DWORD Level,LPBYTE pDatatypes,DWORD cbBuf,LPDWORD pcbNeeded,LPDWORD pcReturned);
'' TODO: WINBOOL WINAPI DeletePrintProcessorA(LPSTR pName,LPSTR pEnvironment,LPSTR pPrintProcessorName);
'' TODO: WINBOOL WINAPI DeletePrintProcessorW(LPWSTR pName,LPWSTR pEnvironment,LPWSTR pPrintProcessorName);
'' TODO: DWORD WINAPI StartDocPrinterA(HANDLE hPrinter,DWORD Level,LPBYTE pDocInfo);
'' TODO: DWORD WINAPI StartDocPrinterW(HANDLE hPrinter,DWORD Level,LPBYTE pDocInfo);
'' TODO: WINBOOL WINAPI StartPagePrinter(HANDLE hPrinter);
'' TODO: WINBOOL WINAPI WritePrinter(HANDLE hPrinter,LPVOID pBuf,DWORD cbBuf,LPDWORD pcWritten);
'' TODO: WINBOOL WINAPI FlushPrinter(HANDLE hPrinter,LPVOID pBuf,DWORD cbBuf,LPDWORD pcWritten,DWORD cSleep);
'' TODO: WINBOOL WINAPI EndPagePrinter(HANDLE hPrinter);
'' TODO: WINBOOL WINAPI AbortPrinter(HANDLE hPrinter);
'' TODO: WINBOOL WINAPI ReadPrinter(HANDLE hPrinter,LPVOID pBuf,DWORD cbBuf,LPDWORD pNoBytesRead);
'' TODO: WINBOOL WINAPI EndDocPrinter(HANDLE hPrinter);
'' TODO: WINBOOL WINAPI AddJobA(HANDLE hPrinter,DWORD Level,LPBYTE pData,DWORD cbBuf,LPDWORD pcbNeeded);
'' TODO: WINBOOL WINAPI AddJobW(HANDLE hPrinter,DWORD Level,LPBYTE pData,DWORD cbBuf,LPDWORD pcbNeeded);
'' TODO: WINBOOL WINAPI ScheduleJob(HANDLE hPrinter,DWORD JobId);
'' TODO: WINBOOL WINAPI PrinterProperties(HWND hWnd,HANDLE hPrinter);
'' TODO: LONG WINAPI DocumentPropertiesA(HWND hWnd,HANDLE hPrinter,LPSTR pDeviceName,PDEVMODEA pDevModeOutput,PDEVMODEA pDevModeInput,DWORD fMode);
'' TODO: LONG WINAPI DocumentPropertiesW(HWND hWnd,HANDLE hPrinter,LPWSTR pDeviceName,PDEVMODEW pDevModeOutput,PDEVMODEW pDevModeInput,DWORD fMode);
'' TODO: LONG WINAPI AdvancedDocumentPropertiesA(HWND hWnd,HANDLE hPrinter,LPSTR pDeviceName,PDEVMODEA pDevModeOutput,PDEVMODEA pDevModeInput);
'' TODO: LONG WINAPI AdvancedDocumentPropertiesW(HWND hWnd,HANDLE hPrinter,LPWSTR pDeviceName,PDEVMODEW pDevModeOutput,PDEVMODEW pDevModeInput);

declare function ExtDeviceMode(byval hWnd as HWND, byval hInst as HANDLE, byval pDevModeOutput as LPDEVMODEA, byval pDeviceName as LPSTR, byval pPort as LPSTR, byval pDevModeInput as LPDEVMODEA, byval pProfile as LPSTR, byval fMode as DWORD) as LONG

'' TODO: DWORD WINAPI GetPrinterDataA(HANDLE hPrinter,LPSTR pValueName,LPDWORD pType,LPBYTE pData,DWORD nSize,LPDWORD pcbNeeded);
'' TODO: DWORD WINAPI GetPrinterDataW(HANDLE hPrinter,LPWSTR pValueName,LPDWORD pType,LPBYTE pData,DWORD nSize,LPDWORD pcbNeeded);
'' TODO: DWORD WINAPI GetPrinterDataExA(HANDLE hPrinter,LPCSTR pKeyName,LPCSTR pValueName,LPDWORD pType,LPBYTE pData,DWORD nSize,LPDWORD pcbNeeded);
'' TODO: DWORD WINAPI GetPrinterDataExW(HANDLE hPrinter,LPCWSTR pKeyName,LPCWSTR pValueName,LPDWORD pType,LPBYTE pData,DWORD nSize,LPDWORD pcbNeeded);
'' TODO: DWORD WINAPI EnumPrinterDataA(HANDLE hPrinter,DWORD dwIndex,LPSTR pValueName,DWORD cbValueName,LPDWORD pcbValueName,LPDWORD pType,LPBYTE pData,DWORD cbData,LPDWORD pcbData);
'' TODO: DWORD WINAPI EnumPrinterDataW(HANDLE hPrinter,DWORD dwIndex,LPWSTR pValueName,DWORD cbValueName,LPDWORD pcbValueName,LPDWORD pType,LPBYTE pData,DWORD cbData,LPDWORD pcbData);
'' TODO: DWORD WINAPI EnumPrinterDataExA(HANDLE hPrinter,LPCSTR pKeyName,LPBYTE pEnumValues,DWORD cbEnumValues,LPDWORD pcbEnumValues,LPDWORD pnEnumValues);
'' TODO: DWORD WINAPI EnumPrinterDataExW(HANDLE hPrinter,LPCWSTR pKeyName,LPBYTE pEnumValues,DWORD cbEnumValues,LPDWORD pcbEnumValues,LPDWORD pnEnumValues);
'' TODO: DWORD WINAPI EnumPrinterKeyA(HANDLE hPrinter,LPCSTR pKeyName,LPSTR pSubkey,DWORD cbSubkey,LPDWORD pcbSubkey);
'' TODO: DWORD WINAPI EnumPrinterKeyW(HANDLE hPrinter,LPCWSTR pKeyName,LPWSTR pSubkey,DWORD cbSubkey,LPDWORD pcbSubkey);
'' TODO: DWORD WINAPI SetPrinterDataA(HANDLE hPrinter,LPSTR pValueName,DWORD Type,LPBYTE pData,DWORD cbData);
'' TODO: DWORD WINAPI SetPrinterDataW(HANDLE hPrinter,LPWSTR pValueName,DWORD Type,LPBYTE pData,DWORD cbData);
'' TODO: DWORD WINAPI SetPrinterDataExA(HANDLE hPrinter,LPCSTR pKeyName,LPCSTR pValueName,DWORD Type,LPBYTE pData,DWORD cbData);
'' TODO: DWORD WINAPI SetPrinterDataExW(HANDLE hPrinter,LPCWSTR pKeyName,LPCWSTR pValueName,DWORD Type,LPBYTE pData,DWORD cbData);
'' TODO: DWORD WINAPI DeletePrinterDataA(HANDLE hPrinter,LPSTR pValueName);
'' TODO: DWORD WINAPI DeletePrinterDataW(HANDLE hPrinter,LPWSTR pValueName);
'' TODO: DWORD WINAPI DeletePrinterDataExA(HANDLE hPrinter,LPCSTR pKeyName,LPCSTR pValueName);
'' TODO: DWORD WINAPI DeletePrinterDataExW(HANDLE hPrinter,LPCWSTR pKeyName,LPCWSTR pValueName);
'' TODO: DWORD WINAPI DeletePrinterKeyA(HANDLE hPrinter,LPCSTR pKeyName);
'' TODO: DWORD WINAPI DeletePrinterKeyW(HANDLE hPrinter,LPCWSTR pKeyName);

#define PRINTER_NOTIFY_TYPE &h00
#define JOB_NOTIFY_TYPE &h01
#define PRINTER_NOTIFY_FIELD_SERVER_NAME &h00
#define PRINTER_NOTIFY_FIELD_PRINTER_NAME &h01
#define PRINTER_NOTIFY_FIELD_SHARE_NAME &h02
#define PRINTER_NOTIFY_FIELD_PORT_NAME &h03
#define PRINTER_NOTIFY_FIELD_DRIVER_NAME &h04
#define PRINTER_NOTIFY_FIELD_COMMENT &h05
#define PRINTER_NOTIFY_FIELD_LOCATION &h06
#define PRINTER_NOTIFY_FIELD_DEVMODE &h07
#define PRINTER_NOTIFY_FIELD_SEPFILE &h08
#define PRINTER_NOTIFY_FIELD_PRINT_PROCESSOR &h09
#define PRINTER_NOTIFY_FIELD_PARAMETERS &h0A
#define PRINTER_NOTIFY_FIELD_DATATYPE &h0B
#define PRINTER_NOTIFY_FIELD_SECURITY_DESCRIPTOR &h0C
#define PRINTER_NOTIFY_FIELD_ATTRIBUTES &h0D
#define PRINTER_NOTIFY_FIELD_PRIORITY &h0E
#define PRINTER_NOTIFY_FIELD_DEFAULT_PRIORITY &h0F
#define PRINTER_NOTIFY_FIELD_START_TIME &h10
#define PRINTER_NOTIFY_FIELD_UNTIL_TIME &h11
#define PRINTER_NOTIFY_FIELD_STATUS &h12
#define PRINTER_NOTIFY_FIELD_STATUS_STRING &h13
#define PRINTER_NOTIFY_FIELD_CJOBS &h14
#define PRINTER_NOTIFY_FIELD_AVERAGE_PPM &h15
#define PRINTER_NOTIFY_FIELD_TOTAL_PAGES &h16
#define PRINTER_NOTIFY_FIELD_PAGES_PRINTED &h17
#define PRINTER_NOTIFY_FIELD_TOTAL_BYTES &h18
#define PRINTER_NOTIFY_FIELD_BYTES_PRINTED &h19
#define PRINTER_NOTIFY_FIELD_OBJECT_GUID &h1A
#define JOB_NOTIFY_FIELD_PRINTER_NAME &h00
#define JOB_NOTIFY_FIELD_MACHINE_NAME &h01
#define JOB_NOTIFY_FIELD_PORT_NAME &h02
#define JOB_NOTIFY_FIELD_USER_NAME &h03
#define JOB_NOTIFY_FIELD_NOTIFY_NAME &h04
#define JOB_NOTIFY_FIELD_DATATYPE &h05
#define JOB_NOTIFY_FIELD_PRINT_PROCESSOR &h06
#define JOB_NOTIFY_FIELD_PARAMETERS &h07
#define JOB_NOTIFY_FIELD_DRIVER_NAME &h08
#define JOB_NOTIFY_FIELD_DEVMODE &h09
#define JOB_NOTIFY_FIELD_STATUS &h0A
#define JOB_NOTIFY_FIELD_STATUS_STRING &h0B
#define JOB_NOTIFY_FIELD_SECURITY_DESCRIPTOR &h0C
#define JOB_NOTIFY_FIELD_DOCUMENT &h0D
#define JOB_NOTIFY_FIELD_PRIORITY &h0E
#define JOB_NOTIFY_FIELD_POSITION &h0F
#define JOB_NOTIFY_FIELD_SUBMITTED &h10
#define JOB_NOTIFY_FIELD_START_TIME &h11
#define JOB_NOTIFY_FIELD_UNTIL_TIME &h12
#define JOB_NOTIFY_FIELD_TIME &h13
#define JOB_NOTIFY_FIELD_TOTAL_PAGES &h14
#define JOB_NOTIFY_FIELD_PAGES_PRINTED &h15
#define JOB_NOTIFY_FIELD_TOTAL_BYTES &h16
#define JOB_NOTIFY_FIELD_BYTES_PRINTED &h17

type _PRINTER_NOTIFY_OPTIONS_TYPE
	as WORD Type
	Reserved0 as WORD
	Reserved1 as DWORD
	Reserved2 as DWORD
	Count as DWORD
	pFields as PWORD
end type

type PRINTER_NOTIFY_OPTIONS_TYPE as _PRINTER_NOTIFY_OPTIONS_TYPE
type PPRINTER_NOTIFY_OPTIONS_TYPE as _PRINTER_NOTIFY_OPTIONS_TYPE ptr
type LPPRINTER_NOTIFY_OPTIONS_TYPE as _PRINTER_NOTIFY_OPTIONS_TYPE ptr

#define PRINTER_NOTIFY_OPTIONS_REFRESH &h01

type _PRINTER_NOTIFY_OPTIONS
	Version as DWORD
	Flags as DWORD
	Count as DWORD
	pTypes as PPRINTER_NOTIFY_OPTIONS_TYPE
end type

type PRINTER_NOTIFY_OPTIONS as _PRINTER_NOTIFY_OPTIONS
type PPRINTER_NOTIFY_OPTIONS as _PRINTER_NOTIFY_OPTIONS ptr
type LPPRINTER_NOTIFY_OPTIONS as _PRINTER_NOTIFY_OPTIONS ptr

#define PRINTER_NOTIFY_INFO_DISCARDED &h01

type ___PRINTER_NOTIFY_INFO_DATA_Data
	cbBuf as DWORD
	pBuf as LPVOID
end type

union ___PRINTER_NOTIFY_INFO_DATA_NotifyData
	adwData(0 to 1) as DWORD
	Data as ___PRINTER_NOTIFY_INFO_DATA_Data
end union

type _PRINTER_NOTIFY_INFO_DATA
	as WORD Type
	Field as WORD
	Reserved as DWORD
	Id as DWORD
	NotifyData as ___PRINTER_NOTIFY_INFO_DATA_NotifyData
end type

type PRINTER_NOTIFY_INFO_DATA as _PRINTER_NOTIFY_INFO_DATA
type PPRINTER_NOTIFY_INFO_DATA as _PRINTER_NOTIFY_INFO_DATA ptr
type LPPRINTER_NOTIFY_INFO_DATA as _PRINTER_NOTIFY_INFO_DATA ptr

type _PRINTER_NOTIFY_INFO
	Version as DWORD
	Flags as DWORD
	Count as DWORD
	aData(0 to 0) as PRINTER_NOTIFY_INFO_DATA
end type

type PRINTER_NOTIFY_INFO as _PRINTER_NOTIFY_INFO
type PPRINTER_NOTIFY_INFO as _PRINTER_NOTIFY_INFO ptr
type LPPRINTER_NOTIFY_INFO as _PRINTER_NOTIFY_INFO ptr

type _BINARY_CONTAINER
	cbBuf as DWORD
	pData as LPBYTE
end type

type BINARY_CONTAINER as _BINARY_CONTAINER
type PBINARY_CONTAINER as _BINARY_CONTAINER ptr

union ___BIDI_DATA_u
	bData as WINBOOL
	iData as LONG
	sData as LPWSTR
	fData as FLOAT
	biData as BINARY_CONTAINER
end union

type _BIDI_DATA
	dwBidiType as DWORD
	u as ___BIDI_DATA_u
end type

type BIDI_DATA as _BIDI_DATA
type PBIDI_DATA as _BIDI_DATA ptr
type LPBIDI_DATA as _BIDI_DATA ptr

type _BIDI_REQUEST_DATA
	dwReqNumber as DWORD
	pSchema as LPWSTR
	data as BIDI_DATA
end type

type BIDI_REQUEST_DATA as _BIDI_REQUEST_DATA
type PBIDI_REQUEST_DATA as _BIDI_REQUEST_DATA ptr
type LPBIDI_REQUEST_DATA as _BIDI_REQUEST_DATA ptr

type _BIDI_REQUEST_CONTAINER
	Version as DWORD
	Flags as DWORD
	Count as DWORD
	aData(0 to 0) as BIDI_REQUEST_DATA
end type

type BIDI_REQUEST_CONTAINER as _BIDI_REQUEST_CONTAINER
type PBIDI_REQUEST_CONTAINER as _BIDI_REQUEST_CONTAINER ptr
type LPBIDI_REQUEST_CONTAINER as _BIDI_REQUEST_CONTAINER ptr

type _BIDI_RESPONSE_DATA
	dwResult as DWORD
	dwReqNumber as DWORD
	pSchema as LPWSTR
	data as BIDI_DATA
end type

type BIDI_RESPONSE_DATA as _BIDI_RESPONSE_DATA
type PBIDI_RESPONSE_DATA as _BIDI_RESPONSE_DATA ptr
type LPBIDI_RESPONSE_DATA as _BIDI_RESPONSE_DATA ptr

type _BIDI_RESPONSE_CONTAINER
	Version as DWORD
	Flags as DWORD
	Count as DWORD
	aData(0 to 0) as BIDI_RESPONSE_DATA
end type

type BIDI_RESPONSE_CONTAINER as _BIDI_RESPONSE_CONTAINER
type PBIDI_RESPONSE_CONTAINER as _BIDI_RESPONSE_CONTAINER ptr
type LPBIDI_RESPONSE_CONTAINER as _BIDI_RESPONSE_CONTAINER ptr

#define BIDI_ACTION_ENUM_SCHEMA wstr("EnumSchema")
#define BIDI_ACTION_GET wstr("Get")
#define BIDI_ACTION_SET wstr("Set")
#define BIDI_ACTION_GET_ALL wstr("GetAll")

type BIDI_TYPE as long
enum
	BIDI_NULL = 0
	BIDI_INT = 1
	BIDI_FLOAT = 2
	BIDI_BOOL = 3
	BIDI_STRING = 4
	BIDI_TEXT = 5
	BIDI_ENUM = 6
	BIDI_BLOB = 7
end enum

#define BIDI_ACCESS_ADMINISTRATOR &h1
#define BIDI_ACCESS_USER &h2
#define ERROR_BIDI_STATUS_OK 0
#define ERROR_BIDI_NOT_SUPPORTED ERROR_NOT_SUPPORTED
#define ERROR_BIDI_ERROR_BASE 13000
#define ERROR_BIDI_STATUS_WARNING (ERROR_BIDI_ERROR_BASE + 1)
#define ERROR_BIDI_SCHEMA_READ_ONLY (ERROR_BIDI_ERROR_BASE + 2)
#define ERROR_BIDI_SERVER_OFFLINE (ERROR_BIDI_ERROR_BASE + 3)
#define ERROR_BIDI_DEVICE_OFFLINE (ERROR_BIDI_ERROR_BASE + 4)
#define ERROR_BIDI_SCHEMA_NOT_SUPPORTED (ERROR_BIDI_ERROR_BASE + 5)

'' TODO: DWORD WINAPI WaitForPrinterChange(HANDLE hPrinter,DWORD Flags);
'' TODO: HANDLE WINAPI FindFirstPrinterChangeNotification(HANDLE hPrinter,DWORD fdwFlags,DWORD fdwOptions,LPVOID pPrinterNotifyOptions);
'' TODO: WINBOOL WINAPI FindNextPrinterChangeNotification(HANDLE hChange,PDWORD pdwChange,LPVOID pPrinterNotifyOptions,LPVOID *ppPrinterNotifyInfo);
'' TODO: WINBOOL WINAPI FreePrinterNotifyInfo (PPRINTER_NOTIFY_INFO pPrinterNotifyInfo);
'' TODO: WINBOOL WINAPI FindClosePrinterChangeNotification(HANDLE hChange);

#define PRINTER_CHANGE_ADD_PRINTER &h00000001
#define PRINTER_CHANGE_SET_PRINTER &h00000002
#define PRINTER_CHANGE_DELETE_PRINTER &h00000004
#define PRINTER_CHANGE_FAILED_CONNECTION_PRINTER &h00000008
#define PRINTER_CHANGE_PRINTER &h000000FF
#define PRINTER_CHANGE_ADD_JOB &h00000100
#define PRINTER_CHANGE_SET_JOB &h00000200
#define PRINTER_CHANGE_DELETE_JOB &h00000400
#define PRINTER_CHANGE_WRITE_JOB &h00000800
#define PRINTER_CHANGE_JOB &h0000FF00
#define PRINTER_CHANGE_ADD_FORM &h00010000
#define PRINTER_CHANGE_SET_FORM &h00020000
#define PRINTER_CHANGE_DELETE_FORM &h00040000
#define PRINTER_CHANGE_FORM &h00070000
#define PRINTER_CHANGE_ADD_PORT &h00100000
#define PRINTER_CHANGE_CONFIGURE_PORT &h00200000
#define PRINTER_CHANGE_DELETE_PORT &h00400000
#define PRINTER_CHANGE_PORT &h00700000
#define PRINTER_CHANGE_ADD_PRINT_PROCESSOR &h01000000
#define PRINTER_CHANGE_DELETE_PRINT_PROCESSOR &h04000000
#define PRINTER_CHANGE_PRINT_PROCESSOR &h07000000
#define PRINTER_CHANGE_ADD_PRINTER_DRIVER &h10000000
#define PRINTER_CHANGE_SET_PRINTER_DRIVER &h20000000
#define PRINTER_CHANGE_DELETE_PRINTER_DRIVER &h40000000
#define PRINTER_CHANGE_PRINTER_DRIVER &h70000000
#define PRINTER_CHANGE_TIMEOUT &h80000000
#define PRINTER_CHANGE_ALL &h7777FFFF
#define PrinterMessageBox __MINGW_NAME_AW(PrinterMessageBox)
#define AddForm __MINGW_NAME_AW(AddForm)
#define DeleteForm __MINGW_NAME_AW(DeleteForm)
#define GetForm __MINGW_NAME_AW(GetForm)
#define SetForm __MINGW_NAME_AW(SetForm)
#define EnumForms __MINGW_NAME_AW(EnumForms)
#define EnumMonitors __MINGW_NAME_AW(EnumMonitors)
#define AddMonitor __MINGW_NAME_AW(AddMonitor)
#define DeleteMonitor __MINGW_NAME_AW(DeleteMonitor)
#define EnumPorts __MINGW_NAME_AW(EnumPorts)
#define AddPort __MINGW_NAME_AW(AddPort)
#define ConfigurePort __MINGW_NAME_AW(ConfigurePort)
#define DeletePort __MINGW_NAME_AW(DeletePort)
#define GetDefaultPrinter __MINGW_NAME_AW(GetDefaultPrinter)
#define SetDefaultPrinter __MINGW_NAME_AW(SetDefaultPrinter)
#define SetPort __MINGW_NAME_AW(SetPort)
#define AddPrinterConnection __MINGW_NAME_AW(AddPrinterConnection)
#define DeletePrinterConnection __MINGW_NAME_AW(DeletePrinterConnection)

'' TODO: DWORD WINAPI PrinterMessageBoxA(HANDLE hPrinter,DWORD Error,HWND hWnd,LPSTR pText,LPSTR pCaption,DWORD dwType);
'' TODO: DWORD WINAPI PrinterMessageBoxW(HANDLE hPrinter,DWORD Error,HWND hWnd,LPWSTR pText,LPWSTR pCaption,DWORD dwType);

#define PRINTER_ERROR_INFORMATION &h80000000
#define PRINTER_ERROR_WARNING &h40000000
#define PRINTER_ERROR_SEVERE &h20000000
#define PRINTER_ERROR_OUTOFPAPER &h00000001
#define PRINTER_ERROR_JAM &h00000002
#define PRINTER_ERROR_OUTOFTONER &h00000004

'' TODO: WINBOOL WINAPI ClosePrinter(HANDLE hPrinter);
'' TODO: WINBOOL WINAPI AddFormA(HANDLE hPrinter,DWORD Level,LPBYTE pForm);
'' TODO: WINBOOL WINAPI AddFormW(HANDLE hPrinter,DWORD Level,LPBYTE pForm);
'' TODO: WINBOOL WINAPI DeleteFormA(HANDLE hPrinter,LPSTR pFormName);
'' TODO: WINBOOL WINAPI DeleteFormW(HANDLE hPrinter,LPWSTR pFormName);
'' TODO: WINBOOL WINAPI GetFormA(HANDLE hPrinter,LPSTR pFormName,DWORD Level,LPBYTE pForm,DWORD cbBuf,LPDWORD pcbNeeded);
'' TODO: WINBOOL WINAPI GetFormW(HANDLE hPrinter,LPWSTR pFormName,DWORD Level,LPBYTE pForm,DWORD cbBuf,LPDWORD pcbNeeded);
'' TODO: WINBOOL WINAPI SetFormA(HANDLE hPrinter,LPSTR pFormName,DWORD Level,LPBYTE pForm);
'' TODO: WINBOOL WINAPI SetFormW(HANDLE hPrinter,LPWSTR pFormName,DWORD Level,LPBYTE pForm);
'' TODO: WINBOOL WINAPI EnumFormsA(HANDLE hPrinter,DWORD Level,LPBYTE pForm,DWORD cbBuf,LPDWORD pcbNeeded,LPDWORD pcReturned);
'' TODO: WINBOOL WINAPI EnumFormsW(HANDLE hPrinter,DWORD Level,LPBYTE pForm,DWORD cbBuf,LPDWORD pcbNeeded,LPDWORD pcReturned);
'' TODO: WINBOOL WINAPI EnumMonitorsA(LPSTR pName,DWORD Level,LPBYTE pMonitor,DWORD cbBuf,LPDWORD pcbNeeded,LPDWORD pcReturned);
'' TODO: WINBOOL WINAPI EnumMonitorsW(LPWSTR pName,DWORD Level,LPBYTE pMonitor,DWORD cbBuf,LPDWORD pcbNeeded,LPDWORD pcReturned);
'' TODO: WINBOOL WINAPI AddMonitorA(LPSTR pName,DWORD Level,LPBYTE pMonitorInfo);
'' TODO: WINBOOL WINAPI AddMonitorW(LPWSTR pName,DWORD Level,LPBYTE pMonitorInfo);
'' TODO: WINBOOL WINAPI DeleteMonitorA(LPSTR pName,LPSTR pEnvironment,LPSTR pMonitorName);
'' TODO: WINBOOL WINAPI DeleteMonitorW(LPWSTR pName,LPWSTR pEnvironment,LPWSTR pMonitorName);
'' TODO: WINBOOL WINAPI EnumPortsA(LPSTR pName,DWORD Level,LPBYTE pPorts,DWORD cbBuf,LPDWORD pcbNeeded,LPDWORD pcReturned);
'' TODO: WINBOOL WINAPI EnumPortsW(LPWSTR pName,DWORD Level,LPBYTE pPorts,DWORD cbBuf,LPDWORD pcbNeeded,LPDWORD pcReturned);
'' TODO: WINBOOL WINAPI AddPortA(LPSTR pName,HWND hWnd,LPSTR pMonitorName);
'' TODO: WINBOOL WINAPI AddPortW(LPWSTR pName,HWND hWnd,LPWSTR pMonitorName);
'' TODO: WINBOOL WINAPI ConfigurePortA(LPSTR pName,HWND hWnd,LPSTR pPortName);
'' TODO: WINBOOL WINAPI ConfigurePortW(LPWSTR pName,HWND hWnd,LPWSTR pPortName);
'' TODO: WINBOOL WINAPI DeletePortA(LPSTR pName,HWND hWnd,LPSTR pPortName);
'' TODO: WINBOOL WINAPI DeletePortW(LPWSTR pName,HWND hWnd,LPWSTR pPortName);
'' TODO: WINBOOL WINAPI XcvDataW(HANDLE hXcv,PCWSTR pszDataName,PBYTE pInputData,DWORD cbInputData,PBYTE pOutputData,DWORD cbOutputData,PDWORD pcbOutputNeeded,PDWORD pdwStatus);

#define XcvData XcvDataW

'' TODO: WINBOOL WINAPI GetDefaultPrinterA(LPSTR pszBuffer,LPDWORD pcchBuffer);
'' TODO: WINBOOL WINAPI GetDefaultPrinterW(LPWSTR pszBuffer,LPDWORD pcchBuffer);
'' TODO: WINBOOL WINAPI SetDefaultPrinterA(LPCSTR pszPrinter);
'' TODO: WINBOOL WINAPI SetDefaultPrinterW(LPCWSTR pszPrinter);
'' TODO: WINBOOL WINAPI SetPortA(LPSTR pName,LPSTR pPortName,DWORD dwLevel,LPBYTE pPortInfo);
'' TODO: WINBOOL WINAPI SetPortW(LPWSTR pName,LPWSTR pPortName,DWORD dwLevel,LPBYTE pPortInfo);
'' TODO: WINBOOL WINAPI AddPrinterConnectionA(LPSTR pName);
'' TODO: WINBOOL WINAPI AddPrinterConnectionW(LPWSTR pName);
'' TODO: WINBOOL WINAPI DeletePrinterConnectionA(LPSTR pName);
'' TODO: WINBOOL WINAPI DeletePrinterConnectionW(LPWSTR pName);
'' TODO: HANDLE WINAPI ConnectToPrinterDlg(HWND hwnd,DWORD Flags);

type _PROVIDOR_INFO_1A
	pName as LPSTR
	pEnvironment as LPSTR
	pDLLName as LPSTR
end type

type PROVIDOR_INFO_1A as _PROVIDOR_INFO_1A
type PPROVIDOR_INFO_1A as _PROVIDOR_INFO_1A ptr
type LPPROVIDOR_INFO_1A as _PROVIDOR_INFO_1A ptr

type _PROVIDOR_INFO_1W
	pName as LPWSTR
	pEnvironment as LPWSTR
	pDLLName as LPWSTR
end type

type PROVIDOR_INFO_1W as _PROVIDOR_INFO_1W
type PPROVIDOR_INFO_1W as _PROVIDOR_INFO_1W ptr
type LPPROVIDOR_INFO_1W as _PROVIDOR_INFO_1W ptr

#ifdef UNICODE
	type PROVIDOR_INFO_1 as PROVIDOR_INFO_1W
	type PPROVIDOR_INFO_1 as PPROVIDOR_INFO_1W
	type LPPROVIDOR_INFO_1 as LPPROVIDOR_INFO_1W
#else
	type PROVIDOR_INFO_1 as PROVIDOR_INFO_1A
	type PPROVIDOR_INFO_1 as PPROVIDOR_INFO_1A
	type LPPROVIDOR_INFO_1 as LPPROVIDOR_INFO_1A
#endif

type _PROVIDOR_INFO_2A
	pOrder as LPSTR
end type

type PROVIDOR_INFO_2A as _PROVIDOR_INFO_2A
type PPROVIDOR_INFO_2A as _PROVIDOR_INFO_2A ptr
type LPPROVIDOR_INFO_2A as _PROVIDOR_INFO_2A ptr

type _PROVIDOR_INFO_2W
	pOrder as LPWSTR
end type

type PROVIDOR_INFO_2W as _PROVIDOR_INFO_2W
type PPROVIDOR_INFO_2W as _PROVIDOR_INFO_2W ptr
type LPPROVIDOR_INFO_2W as _PROVIDOR_INFO_2W ptr

#ifdef UNICODE
	type PROVIDOR_INFO_2 as PROVIDOR_INFO_2W
	type PPROVIDOR_INFO_2 as PPROVIDOR_INFO_2W
	type LPPROVIDOR_INFO_2 as LPPROVIDOR_INFO_2W
#else
	type PROVIDOR_INFO_2 as PROVIDOR_INFO_2A
	type PPROVIDOR_INFO_2 as PPROVIDOR_INFO_2A
	type LPPROVIDOR_INFO_2 as LPPROVIDOR_INFO_2A
#endif

#define AddPrintProvidor __MINGW_NAME_AW(AddPrintProvidor)
#define DeletePrintProvidor __MINGW_NAME_AW(DeletePrintProvidor)
#define IsValidDevmode __MINGW_NAME_AW(IsValidDevmode)

'' TODO: WINBOOL WINAPI AddPrintProvidorA(LPSTR pName,DWORD level,LPBYTE pProvidorInfo);
'' TODO: WINBOOL WINAPI AddPrintProvidorW(LPWSTR pName,DWORD level,LPBYTE pProvidorInfo);
'' TODO: WINBOOL WINAPI DeletePrintProvidorA(LPSTR pName,LPSTR pEnvironment,LPSTR pPrintProvidorName);
'' TODO: WINBOOL WINAPI DeletePrintProvidorW(LPWSTR pName,LPWSTR pEnvironment,LPWSTR pPrintProvidorName);
'' TODO: WINBOOL WINAPI IsValidDevmodeA (PDEVMODEA pDevmode,size_t DevmodeSize);
'' TODO: WINBOOL WINAPI IsValidDevmodeW (PDEVMODEW pDevmode,size_t DevmodeSize);

#define SPLREG_DEFAULT_SPOOL_DIRECTORY TEXT("DefaultSpoolDirectory")
#define SPLREG_PORT_THREAD_PRIORITY_DEFAULT TEXT("PortThreadPriorityDefault")
#define SPLREG_PORT_THREAD_PRIORITY TEXT("PortThreadPriority")
#define SPLREG_SCHEDULER_THREAD_PRIORITY_DEFAULT TEXT("SchedulerThreadPriorityDefault")
#define SPLREG_SCHEDULER_THREAD_PRIORITY TEXT("SchedulerThreadPriority")
#define SPLREG_BEEP_ENABLED TEXT("BeepEnabled")
#define SPLREG_NET_POPUP TEXT("NetPopup")
#define SPLREG_RETRY_POPUP TEXT("RetryPopup")
#define SPLREG_NET_POPUP_TO_COMPUTER TEXT("NetPopupToComputer")
#define SPLREG_EVENT_LOG TEXT("EventLog")
#define SPLREG_MAJOR_VERSION TEXT("MajorVersion")
#define SPLREG_MINOR_VERSION TEXT("MinorVersion")
#define SPLREG_ARCHITECTURE TEXT("Architecture")
#define SPLREG_OS_VERSION TEXT("OSVersion")
#define SPLREG_OS_VERSIONEX TEXT("OSVersionEx")
#define SPLREG_DS_PRESENT TEXT("DsPresent")
#define SPLREG_DS_PRESENT_FOR_USER TEXT("DsPresentForUser")
#define SPLREG_REMOTE_FAX TEXT("RemoteFax")
#define SPLREG_RESTART_JOB_ON_POOL_ERROR TEXT("RestartJobOnPoolError")
#define SPLREG_RESTART_JOB_ON_POOL_ENABLED TEXT("RestartJobOnPoolEnabled")
#define SPLREG_DNS_MACHINE_NAME TEXT("DNSMachineName")
#define SPLREG_ALLOW_USER_MANAGEFORMS TEXT("AllowUserManageForms")
#define SPLREG_WEBSHAREMGMT TEXT("WebShareMgmt")
#define SERVER_ACCESS_ADMINISTER &h00000001
#define SERVER_ACCESS_ENUMERATE &h00000002
#define PRINTER_ACCESS_ADMINISTER &h00000004
#define PRINTER_ACCESS_USE &h00000008
#define JOB_ACCESS_ADMINISTER &h00000010
#define JOB_ACCESS_READ &h00000020
#define SERVER_ALL_ACCESS ((STANDARD_RIGHTS_REQUIRED or SERVER_ACCESS_ADMINISTER) or SERVER_ACCESS_ENUMERATE)
#define SERVER_READ (STANDARD_RIGHTS_READ or SERVER_ACCESS_ENUMERATE)
#define SERVER_WRITE ((STANDARD_RIGHTS_WRITE or SERVER_ACCESS_ADMINISTER) or SERVER_ACCESS_ENUMERATE)
#define SERVER_EXECUTE (STANDARD_RIGHTS_EXECUTE or SERVER_ACCESS_ENUMERATE)
#define PRINTER_ALL_ACCESS ((STANDARD_RIGHTS_REQUIRED or PRINTER_ACCESS_ADMINISTER) or PRINTER_ACCESS_USE)
#define PRINTER_READ (STANDARD_RIGHTS_READ or PRINTER_ACCESS_USE)
#define PRINTER_WRITE (STANDARD_RIGHTS_WRITE or PRINTER_ACCESS_USE)
#define PRINTER_EXECUTE (STANDARD_RIGHTS_EXECUTE or PRINTER_ACCESS_USE)
#define JOB_ALL_ACCESS ((STANDARD_RIGHTS_REQUIRED or JOB_ACCESS_ADMINISTER) or JOB_ACCESS_READ)
#define JOB_READ (STANDARD_RIGHTS_READ or JOB_ACCESS_READ)
#define JOB_WRITE (STANDARD_RIGHTS_WRITE or JOB_ACCESS_ADMINISTER)
#define JOB_EXECUTE (STANDARD_RIGHTS_EXECUTE or JOB_ACCESS_ADMINISTER)
#define SPLDS_SPOOLER_KEY TEXT("DsSpooler")
#define SPLDS_DRIVER_KEY TEXT("DsDriver")
#define SPLDS_USER_KEY TEXT("DsUser")
#define SPLDS_ASSET_NUMBER TEXT("assetNumber")
#define SPLDS_BYTES_PER_MINUTE TEXT("bytesPerMinute")
#define SPLDS_DESCRIPTION TEXT("description")
#define SPLDS_DRIVER_NAME TEXT("driverName")
#define SPLDS_DRIVER_VERSION TEXT("driverVersion")
#define SPLDS_LOCATION TEXT("location")
#define SPLDS_PORT_NAME TEXT("portName")
#define SPLDS_PRINT_ATTRIBUTES TEXT("printAttributes")
#define SPLDS_PRINT_BIN_NAMES TEXT("printBinNames")
#define SPLDS_PRINT_COLLATE TEXT("printCollate")
#define SPLDS_PRINT_COLOR TEXT("printColor")
#define SPLDS_PRINT_DUPLEX_SUPPORTED TEXT("printDuplexSupported")
#define SPLDS_PRINT_END_TIME TEXT("printEndTime")
#define SPLDS_PRINTER_CLASS TEXT("printQueue")
#define SPLDS_PRINTER_NAME TEXT("printerName")
#define SPLDS_PRINT_KEEP_PRINTED_JOBS TEXT("printKeepPrintedJobs")
#define SPLDS_PRINT_LANGUAGE TEXT("printLanguage")
#define SPLDS_PRINT_MAC_ADDRESS TEXT("printMACAddress")
#define SPLDS_PRINT_MAX_X_EXTENT TEXT("printMaxXExtent")
#define SPLDS_PRINT_MAX_Y_EXTENT TEXT("printMaxYExtent")
#define SPLDS_PRINT_MAX_RESOLUTION_SUPPORTED TEXT("printMaxResolutionSupported")
#define SPLDS_PRINT_MEDIA_READY TEXT("printMediaReady")
#define SPLDS_PRINT_MEDIA_SUPPORTED TEXT("printMediaSupported")
#define SPLDS_PRINT_MEMORY TEXT("printMemory")
#define SPLDS_PRINT_MIN_X_EXTENT TEXT("printMinXExtent")
#define SPLDS_PRINT_MIN_Y_EXTENT TEXT("printMinYExtent")
#define SPLDS_PRINT_NETWORK_ADDRESS TEXT("printNetworkAddress")
#define SPLDS_PRINT_NOTIFY TEXT("printNotify")
#define SPLDS_PRINT_NUMBER_UP TEXT("printNumberUp")
#define SPLDS_PRINT_ORIENTATIONS_SUPPORTED TEXT("printOrientationsSupported")
#define SPLDS_PRINT_OWNER TEXT("printOwner")
#define SPLDS_PRINT_PAGES_PER_MINUTE TEXT("printPagesPerMinute")
#define SPLDS_PRINT_RATE TEXT("printRate")
#define SPLDS_PRINT_RATE_UNIT TEXT("printRateUnit")
#define SPLDS_PRINT_SEPARATOR_FILE TEXT("printSeparatorFile")
#define SPLDS_PRINT_SHARE_NAME TEXT("printShareName")
#define SPLDS_PRINT_SPOOLING TEXT("printSpooling")
#define SPLDS_PRINT_STAPLING_SUPPORTED TEXT("printStaplingSupported")
#define SPLDS_PRINT_START_TIME TEXT("printStartTime")
#define SPLDS_PRINT_STATUS TEXT("printStatus")
#define SPLDS_PRIORITY TEXT("priority")
#define SPLDS_SERVER_NAME TEXT("serverName")
#define SPLDS_SHORT_SERVER_NAME TEXT("shortServerName")
#define SPLDS_UNC_NAME TEXT("uNCName")
#define SPLDS_URL TEXT("url")
#define SPLDS_FLAGS TEXT("flags")
#define SPLDS_VERSION_NUMBER TEXT("versionNumber")
#define SPLDS_PRINTER_NAME_ALIASES TEXT("printerNameAliases")
#define SPLDS_PRINTER_LOCATIONS TEXT("printerLocations")
#define SPLDS_PRINTER_MODEL TEXT("printerModel")

end extern
