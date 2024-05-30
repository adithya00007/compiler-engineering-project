%{
#include <stdio.h>
#include <stdlib.h>
extern char* yytext;
extern int yylex();
extern int yyparse();
void yyerror(const char* s);
%}

%token GOTO RETURN ID

%%

program: /* empty */
    | program statement

statement:
    | GOTO ID ';'
    | RETURN ID ';'

%%

void yyerror(const char* s) {
    fprintf(stderr, "Error: %s\n", s);
}
