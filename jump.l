%{
#include "y.tab.h"
%}

%%

"goto"      { return GOTO; }
"return"    { return RETURN; }
[a-zA-Z_][a-zA-Z0-9_]*   { yylval.strval = strdup(yytext); return ID; }
[ \t\n]     ;   // Ignore whitespace and newline characters
.           { return *yytext; }

%%

int yywrap() {
    return 1;
}
