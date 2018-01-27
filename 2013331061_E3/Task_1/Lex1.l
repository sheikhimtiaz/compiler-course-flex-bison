%option main
%option yylineno
%%
\n printf("%6d\n",yylineno-1);
%%
