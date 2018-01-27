%{
	#include<stdio.h>
	#include<string.h>
	
	int yylex(void);
	void yyerror(char *);
	
	int tmp_id = 0;
	int new_temp();
%}

%union{
	struct data{
		char code[1000];
		char addr[1000];
	}	e_att;
}

%token <e_att> id
%type <e_att> S E

%%

prog: prog S '\n'		{printf("%s\n" , $2.code);	tmp_id = 0;}
		|;
S:	id '=' E ';'		{
							strcpy($$.code , $3.code);
							strcat($$.code , $1.addr);	strcat($$.code , " = ");
							strcat($$.code , $3.addr);	strcat($$.code , "\n");
						}
E:	E '+' E				{
							int tmp = new_temp(); 
							char tmp_var[10];
							//tmp_var[0] = 't'; tmp_var[1] = '0' + tmp; tmp_var[2] = '\0';
							sprintf(tmp_var , "t%d" , tmp);
						
							strcpy($$.addr , tmp_var);
							strcpy($$.code , $1.code);	//strcat($$.code , " ");
							strcat($$.code , $3.code);	//strcat($$.code , " ");
							strcat($$.code , $$.addr);	strcat($$.code , " = ");
							strcat($$.code , $1.addr);	strcat($$.code , " + ");
							strcat($$.code , $3.addr);	strcat($$.code , "\n");
						}
	|'-' E				{
							int tmp = new_temp(); 
							char tmp_var[10];
							//tmp_var[0] = 't'; tmp_var[1] = '0' + tmp; tmp_var[2] = '\0';
							sprintf(tmp_var , "t%d" , tmp);
						
							strcpy($$.addr , tmp_var);
							strcpy($$.code , $2.code);	//strcat($$.code , " ");
							strcat($$.code , $$.addr);	strcat($$.code , " = ");
							strcat($$.code , " minus ");
							strcat($$.code , $2.addr);	strcat($$.code , "\n");
						}
	|'(' E ')'			{
							strcpy($$.addr , $2.addr);
							strcpy($$.code , $2.code);
						}
	|id					{
							strcpy($$.addr , $1.addr);
							strcpy($$.code , "");
						}
						
%%
	
	void yyerror(char *err)
	{
		fprintf(stderr , "ERROR: %s\n" , err);
	}
	
	int new_temp()
	{
		tmp_id++;
		return tmp_id;
	}
	
	int main()
	{
		yyparse();
		return 0;
	}