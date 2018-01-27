%{
#include <stdlib.h>
#include<string.h>
void yyerror(char *);
#include "Yacc1.h"
%}

%option noyywrap

%%
[0-9]+ { strcpy(yylval.arr,yytext); return INT; } 
[+-/*\n] return *yytext;    
[\t] ;
.yyerror("invalid character");

%% 