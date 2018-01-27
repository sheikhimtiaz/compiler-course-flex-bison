%{
#include<stdlib.h>
void yyerror(char *);
#include "Yacc1.h"
%}

%option noyywrap

%%

[0-9]+ { yylval = atoi(yytext); return INTEGER;}
[-+*/] return *yytext;
[\n] return *yytext;
[ \t];
. yyerror("invalid character");
%%