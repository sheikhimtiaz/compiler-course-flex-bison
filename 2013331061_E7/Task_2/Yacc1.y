%{
#include<stdio.h>
int yylex(void);
void yyerror(char *);
%}

%token INTEGER
%left '+' '-'
%left '*' '/'

%%

prog: prog E '\n' { printf("%d\n", $2); }
	| ;
E: E '+' E {$$ = $1 + $3;}
	| E '-' E {$$ = $1 - $3;}
	| E '*' E {$$ = $1 * $3;}
	| E '/' E {$$ = $1 / $3;}
	| INTEGER;
%%

void yyerror(char *s)
{
	fprintf(stderr, "%s\n", s);
}

int main(void)
{
	yyparse();
	return 0;
}