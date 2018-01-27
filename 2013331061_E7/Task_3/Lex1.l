%{
#include<stdlib.h>
void yyerror(char *);
#define YYSTYPE float
#include "Yacc1.h"
%}

%option noyywrap

%%

[0-9]*\.[0-9]* { yylval = atof(yytext); return FLT;}
[-+*/] return *yytext;
[\n] return *yytext;
[ \t];
. yyerror("Invalid Character!");
%%