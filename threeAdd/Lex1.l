%option noyywrap
%option yylineno

%{
	#include<stdio.h>
	#include<string.h>
	
	#include "Yacc1.h"
	#define pf printf
	
	void yyerror(char *);
%}

%%

[ \t]							
[a-z_][a-z0-9_]*	{strcpy(yylval.e_att.addr,yytext); return id;}
[-+*/=;()\n]			return *yytext;
.				yyerror("Invalid Character");

%%
