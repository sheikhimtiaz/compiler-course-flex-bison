#include<stdio.h>
#include<string.h>

int states, symbol, totalFinalState;
char str[10000];
int transitionTable[50][50];
int finalState[50];

void checkDFA()
{
	int i, j;
	printf("0");
	int now=0;
	for(i=0; i<strlen(str); i++)
	{
		int nxt=str[i]-'a';
		now=transitionTable[now][nxt];
		printf(", %d", now);
	}
	
	if(finalState[now]==1) printf(" yes!\n");
	else printf(" no!\n");
}

int main()
{
	FILE *ff;
	ff=fopen("InputDFA.txt", "r");
	
	fscanf(ff, "%d %d", &states, &symbol);
	
	int i, j;
	for(i=0; i<states; i++)
	{
		for(j=0; j<symbol; j++) 
		{
			fscanf(ff, "%d", &transitionTable[i][j]);
		}
	}
	fscanf(ff, "%d", &totalFinalState);
	for(i=0; i<15; i++) 
	{
		finalState[i]=0;
	}
	for(i=0; i<totalFinalState; i++) 
	{
		int tt;
		fscanf(ff, "%d", &tt);
		finalState[tt]=1;
	}
	fclose(ff);
	while(scanf("%s", &str)==1) 
		checkDFA();
	return 0;
}
