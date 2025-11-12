%{
#include <stdio.h>

int lines = 0, words = 0;
%}

%%
\n              { lines++; }
[ \t]+          { /* Ignore spaces and tabs */ }
[^ \t\n]+       { words++; }
%%

int main() {
    yylex();
    printf("Number of lines: %d\n", lines);
    printf("Number of words: %d\n", words);
    return 0;
}

int yywrap() {
    return 1;
}
