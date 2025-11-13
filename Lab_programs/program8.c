#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char input[100];
int pos = 0;

void E();
void Eprime();
void T();
void Tprime();
void F();
void error();

void advance() {
    pos++;
}

void E() {
    T();
    Eprime();
}

void Eprime() {
    if (input[pos] == '+') {
        advance();
        T();
        Eprime();
    }
}

void T() {
    F();
    Tprime();
}

void Tprime() {
    if (input[pos] == '*') {
        advance();
        F();
        Tprime();
    }
}

void F() {
    if (input[pos] == '(') {
        advance();
        E();
        if (input[pos] == ')')
            advance();
        else
            error();
    } else if (strncmp(&input[pos], "id", 2) == 0) {
        pos += 2; // move past 'id'
    } else {
        error();
    }
}

void error() {
    printf("Syntax error at position %d\n", pos);
    exit(0);
}

void main() {
    printf("Enter expression: ");
    scanf("%s", input);

    E();

    if (input[pos] == '\0')
        printf("Parsing successful!\nExpression is valid.\n");
    else
        error();
}
