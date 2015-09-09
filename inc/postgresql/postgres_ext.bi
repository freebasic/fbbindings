#pragma once

#define POSTGRES_EXT_H
type Oid as ulong
const InvalidOid = cast(Oid, 0)
#define OID_MAX UINT_MAX
type pg_int64 as longint
#define PG_DIAG_SEVERITY asc("S")
#define PG_DIAG_SQLSTATE asc("C")
#define PG_DIAG_MESSAGE_PRIMARY asc("M")
#define PG_DIAG_MESSAGE_DETAIL asc("D")
#define PG_DIAG_MESSAGE_HINT asc("H")
#define PG_DIAG_STATEMENT_POSITION asc("P")
#define PG_DIAG_INTERNAL_POSITION asc("p")
#define PG_DIAG_INTERNAL_QUERY asc("q")
#define PG_DIAG_CONTEXT asc("W")
#define PG_DIAG_SCHEMA_NAME asc("s")
#define PG_DIAG_TABLE_NAME asc("t")
#define PG_DIAG_COLUMN_NAME asc("c")
#define PG_DIAG_DATATYPE_NAME asc("d")
#define PG_DIAG_CONSTRAINT_NAME asc("n")
#define PG_DIAG_SOURCE_FILE asc("F")
#define PG_DIAG_SOURCE_LINE asc("L")
#define PG_DIAG_SOURCE_FUNCTION asc("R")
