%{
#include <stdio.h>
#include <string.h>
int yylex(void);
void yyerror(char *);
%}

%union
{
	char arr[100];
}
%token <arr>INT
%type <arr> E T


%%

prog: prog E '\n'{ printf("%s\n", $2); }  //multiline input
	| ;
E	: E '+' T { strcpy($$,$1);strcat($$," ");strcat($$,$3);strcat($$," +"); }
	| E '-' T{ strcpy($$,$1);strcat($$," ");strcat($$,$3);strcat($$," -"); }
    | T{ strcpy($$,$1); };
T   : INT{strcpy($$,$1);};

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
