%option noyywrap
%option yylineno

%%

\/\*+([^*]|(\*+[^/]))*\*+\/ fprintf(yyout, "MCM[%d]",yyleng-4);

\/\/.* fprintf(yyout, "SCM[&d]",yyleng-2);

%%

int main(int argc, char *argv[])
{
	yyin=fopen(argv[1],"r");
	yyout=fopen(argv[2],"w");
	yylex();
	return 0;
}

