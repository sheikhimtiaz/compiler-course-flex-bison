%{
#include<stdlib.h>
void yyerror(char *);
#include "Yacc3.h"
%}

%option noyywrap

%%
[0-9]+ {yylval.i = atoi(yytext); return INT;}
[0-9]*\.[0-9]* { yylval.f = atof(yytext); return FLT;}
[-+*/] return *yytext;
[\n] return *yytext;
[ \t];
. yyerror("invalid character");
%%