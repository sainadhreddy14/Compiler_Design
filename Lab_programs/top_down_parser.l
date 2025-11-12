%{
#include "expr.tab.h"
#include <stdio.h>
%}

%%
"+"             { return PLUS; }
"*"             { return STAR; }
"("             { return LPAREN; }
")"             { return RPAREN; }
[a-zA-Z][a-zA-Z0-9]*   { return ID; }
[ \t]           { /* ignore spaces and tabs */ }
\n              { return '\n'; }
.               { yyerror("Invalid character"); }
%%

int yywrap(void) {
    return 1;
}