%{
#include "y.tab.h"
char* yytext;
%}

%%
goto    { return GOTO; }
break   { return BREAK; }
continue { return CONTINUE; }
return  { return RETURN; }
[a-zA-Z][a-zA-Z0-9]* { yylval.id = strdup(yytext); return ID; }
":"     { return ':'; }
";"     { return ';'; }
[ \t\n]  ; // Ignore whitespace
.       { fprintf(stderr, "other characters: %s\n", yytext); }
%%

int yywrap() {
    return 1;
}
