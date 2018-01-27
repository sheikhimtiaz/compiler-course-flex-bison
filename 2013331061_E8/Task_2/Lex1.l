%{
#include <stdlib.h>
#include <string.h>
void yyerror(char *);
#include "Yacc1.h"
%}
%option noyywrap
%%
[0-9]+ { strcpy(yylval.ch, yytext); return INTEGER;}
[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)? { strcpy(yylval.ch, yytext); return DOUBLE;}
[+-/*] return *yytext;
[\n] return *yytext; 
[\t ] ;
. yyerror("invalid character");
%%
