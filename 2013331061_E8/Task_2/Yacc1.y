%{
#include <stdio.h>
#include <string.h>
int yylex(void);
void yyerror(char *);
%}

%union{
    char ch[1000];
}

%token <ch> INTEGER DOUBLE
%type <ch> E T F
%%
prog: prog E '\n' { printf("\n"); }
	| ;
E: E '+' T { printf("+"); }
	|  E '-' T { printf("-"); }
	|  T { };

T:	T '*' F { printf("*"); }	
	| T '/' F { printf("/"); }	
	| F { };
	
F:  INTEGER { printf("%s", $1); }
	| DOUBLE { printf("%s", $1); };
%%
void yyerror(char *ch){
	fprintf(stderr, "%s\n", ch);
}
int main(void){
	yyparse();
	return 0;
}
