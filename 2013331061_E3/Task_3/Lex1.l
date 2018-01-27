%option noyywrap
%option yylineno

%%
[ \t\n]	ECHO;
[_a-zA-Z][_a-zA-Z0-9]* fprintf(yyout, "ID:%s[%d]", yytext, yyleng);
[^ \t\na-zA-Z]* fprintf(yyout, "NOT_RECOGNIZED");

%%

int main(int argc, char *argv[])
{
	yyin=fopen(argv[1], "r");
	yyout=fopen(argv[2], "w");
	yylex();
	return 0;
}