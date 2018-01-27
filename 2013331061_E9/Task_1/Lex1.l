%{
#include<stdlib.h>
#include<string.h>
void yyerror(char *);
#include "Yacc1.h"
%}

%option noyywrap
SIGN [+-]?
DIGIT [0-9]
EXP [eE]{SIGN}{DIGIT}+

%%

[a-zA-Z_]+ { strcpy(yylval.p, yytext); return id;}
"+"|"-"|"("|")"|";"|"=" { return *yytext; }
[\n] return NOT_LAST;
[ \t] ;
<<EOF>> { printf("EOF OCCURED\n"); return 0;}
. printf("Invalid Character - %s\n", yytext);

%%
