%{
#include<stdio.h>
int yylex(void);
void yyerror(char *);
%}
%token INT
%%

prog: prog expr '\n' {printf("%d\n", $2);}
	| ;
expr: expr '+' term { $$ = $1 + $3; printf("E -> E+T\n");}
	| expr '-' term { $$ = $1 - $3; printf("E -> E-T\n");}
	| term { $$ = $1; printf("E -> T\n");};
term: term '*' F { $$ = $1 * $3; printf("T -> T*F\n");}
	| term '/' F { $$ = $1 / $3; printf("T -> T/F\n");}
	| F { $$ = $1; printf("T -> F\n");};
F: INT {printf("F -> INT\n");}

%%

void yyerror(char *s){
	fprintf(stderr, "%s\n", s);
}

int main(void){
	yyparse();
	return 0;
}