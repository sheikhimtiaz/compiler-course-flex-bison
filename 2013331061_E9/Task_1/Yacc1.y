%{
#include <stdio.h>
#include <string.h>
int yylex(void);
int val = 0;
char* TEMP();
char ss[100];
void yyerror(char *s);
%}

%union{
	char p[100];
	struct A{
		char addr[100];
		char code[100];
	};
}

%token <p> id
%type <A> E
%type <p> S

%token <p> NOT_LAST



%%

start: start S NOT_LAST { printf("\n"); }
	| ;

S:  id '=' E ';'  	{ strcpy($$, $<code>3);
						strcat($$, $1);
						strcat($$, "=");
						strcat($$, $<addr>3);
						printf("%s\n", $$);
						}
E : E '+' E        { strcpy($<addr>$, TEMP());
					 strcpy($<code>$, $<code>1);
					 strcat($<code>$, $<code>3);
					 strcat($<code>$, $<addr>$);
					 strcat($<code>$, "=");
					 strcat($<code>$, $<addr>1);
					 strcat($<code>$, "+");
					 strcat($<code>$, $<addr>3);
					 strcat($<code>$, "\n");
						}
	| '-' E       	{
						strcpy($<addr>$, TEMP());
						strcpy($<code>$, $<addr>$);
						strcat($<code>$, "=");
						strcat($<code>$, " minus ");
						strcat($<code>$, $<addr>2);
						strcat($<code>$, "\n");
					}
	| '(' E ')'      {
						strcpy($<addr>$, $<addr>2);
						strcpy($<code>$, $<code>2);
					}
	| id   			{
						//printf("%s\n", $1);
						strcpy($<addr>$, $1);
					}

%%
void yyerror(char *s)
{
	printf("The error is: %s\n", s);
}

char* TEMP()
{
	//char *s ;
	sprintf(ss, "t%d", ++val);
	return ss;
}

int main()
{
	yyparse();
	return 0;
//	start: start S NOT_LAST { printf("\n"); }
	//	| ;
}
