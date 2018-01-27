%{
	int countA = 0;
	int countB = 0; 
	int countC = 0;
%}
%option noyywrap
%option yylineno
%%
a {ECHO; countA++;}
b {ECHO; countB++;}
c {ECHO; countC++;}
\n	{fprintf(yyout, "%6d[A = %d, B = %d, C = %d]\n", yylineno - 1, countA, countB, countC);
	countA = 0; countB = 0; countC = 0;}
<<EOF>> {fprintf(yyout, "%6d[A = %d, B = %d, C = %d]\n", yylineno - 1, countA, countB, countC);
yyterminate();}
	
%%
int main(int argc, char *argv[]) {
	yyin = fopen(argv[1], "r");  
	yyout = fopen(argv[2], "w");
	yylex();
	return 0;
}