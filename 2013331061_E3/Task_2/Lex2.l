%option noyywrap
%option yylineno
%%
\n fprintf(yyout, "%6d\n", yylineno-1);
%%
int main(int argc, char *argv[])
{
	yyin = fopen(argv[1], "r");
	yyout = fopen(argv[2], "w");
	yylex();
	fprintf(yyout, "%6d", yylineno);
	return 0;
}