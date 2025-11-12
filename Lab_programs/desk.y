%{
#include <stdio.h>
#include <ctype.h>

void yyerror(const char *s);
int yylex(void);
%}

%token DIGIT

%%

line: expr '\n' { printf("%d\n", $1); }
    ;

expr: expr '+' term { $$ = $1 + $3; }
    | term
    ;

term: term '*' factor { $$ = $1 * $3; }
    | factor
    ;

factor: '(' expr ')' { $$ = $2; }
      | DIGIT { $$ = $1; }
      ;

%%

int yylex(void)
{
    int c;

    while ((c = getchar()) == ' ' || c == '\t')
        ;  // skip whitespace

    if (isdigit(c)) {
        yylval = c - '0';
        return DIGIT;
    }

    return c;
}

void yyerror(const char *s)
{
    fprintf(stderr, "Error: %s\n", s);
}

int main(void)
{
    printf("Enter an expression:\n");
    yyparse();
    return 0;
}
