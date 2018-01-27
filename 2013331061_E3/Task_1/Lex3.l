%{
	int countA=0;
%}
%option main
%option yylineno
%%
a {ECHO; countA++;}
\n printf("%6d[A=%d]\n",yylineno-1,countA); countA=0;
%%

