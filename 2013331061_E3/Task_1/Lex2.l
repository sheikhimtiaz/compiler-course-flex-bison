%option main
%option yylineno
%%
[[:alnum:]]+	printf("AlNum[%d]", yyleng);
\n printf("%6d\n",yylineno-1);
%%
