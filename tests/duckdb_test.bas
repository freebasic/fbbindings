#include once "duckdb.bi"
#include once "crt/stdio.bi"            

   Dim db As duckdb_database = NULL
   Dim con As duckdb_connection = NULL
   Dim result As duckdb_result
   If duckdb_open(NULL, @db) = DuckDBError Then
      fprintf(stderr, !"Failed to open database\n")
        Goto cleanup
   End If
   If duckdb_connect(db, @con) = DuckDBError Then
      fprintf(stderr, !"Failed to open connection\n")
        Goto cleanup
   End If
   If duckdb_query(con, "CREATE TABLE integers(i INTEGER, j INTEGER);", NULL) = DuckDBError Then
      fprintf(stderr, !"Failed to query database\n")
      Goto cleanup
   End If
   If duckdb_query(con, "INSERT INTO integers VALUES (3, 4), (5, 6), (7, NULL);", NULL) = DuckDBError Then
      fprintf(stderr, !"Failed to query database\n")
       Goto cleanup
   End If
   If duckdb_query(con, "SELECT * FROM integers", @result) = DuckDBError Then
      fprintf(stderr, !"Failed to query database\n")
        Goto cleanup
     End If
   Scope' If True Then
   Dim row_count As idx_t = duckdb_row_count(@result)
   Dim column_count As idx_t = duckdb_column_count(@result)
   For i As UInteger = 0 To column_count -1
      printf("%s ", duckdb_column_name(@result, i))
   Next
   printf(!"\n")
 
   For row_idx As UInteger = 0 To row_count-1
      For col_idx As UInteger = 0 To column_count -1
         Dim As ZString Ptr Val_ = duckdb_value_varchar(@result, col_idx, row_idx) 
         printf("%s ", Val_) 
         duckdb_free(Val_)         
      Next       
       printf(!"\n")
    Next
    End Scope '  End  If
cleanup : 
   duckdb_destroy_result(@result)
   duckdb_disconnect(@con)
   duckdb_close(@db)
   Sleep
