
#define SOURCE "#define SOURCE %c%s%c\\n#define FILENAME %cGrace_kid.c%c\\n#define PRINT_FILE(x) { FILE* f = fopen(x, %cw%c); fprintf(f, SOURCE, 34, SOURCE, 34, 34, FILENAME, 34); fclose(f); } /* Grace quine */"
#define FILENAME "Grace_kid.c"
#define PRINT_FILE(x) { FILE* f = fopen(x, "w"); fprintf(f, SOURCE, 34, SOURCE, 34, 34, FILENAME, 34); fclose(f); }

PRINT_FILE(FILENAME)
