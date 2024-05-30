%{
#include <stdio.h>
#include <stdlib.h>
%}

%token IF ELSE WHILE BREAK CONTINUE RETURN
%token SEMICOLON

%%

program: statement_list

statement_list: statement
              | statement_list statement

statement: IF '(' expression ')' '{' statement_list '}'
         | IF '(' expression ')' '{' statement_list '}' ELSE '{' statement_list '}'
         | WHILE '(' expression ')' '{' statement_list '}'
         | BREAK SEMICOLON
         | CONTINUE SEMICOLON
         | RETURN expression SEMICOLON
         | SEMICOLON

expression: /* Your expression rules go here */

%%

int main() {
    yyparse();
    return 0;
}

int yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}
