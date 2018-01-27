#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int state, symbol, finalStates ;
char table[100][100][100] ;
int End[100] ;
char input[100] ;
char current[100], tmp[200] ;
int len ;


int main(int argc, char *argv[])
{
    FILE *fp ;
    fp = fopen("InputNFA.txt", "r" ) ;
    fscanf( fp, "%d %d", &state, &symbol ) ;
    ++symbol ;
    int i, j ;
    for( i = 0 ; i < state ; i++ )
    {
        for( j = 0 ; j < symbol ; j++ )
        {
            fscanf( fp, "%s", table[i][j] ) ;
        }
    }
    fscanf( fp, "%d", &finalStates ) ;
    for( i = 0 ; i < finalStates ; i++ )
    {
        int x ;
        fscanf( fp, "%d", &x ) ;
        End[x] = 1 ;
    }
    fclose(fp) ;
    scanf("%s", &input ) ;
    int tmp_len = 0, st, k ;
    len = 0 ;
    current[len++] = '0' ;
    printf("0") ;
    for( i = 0 ; i < strlen(input) ; i++ )
    {
        int id = input[i] - 'a' ;
        tmp_len = 0 ;
        for( j = 0 ; j < len ; j++ )
        {
            st = current[j] - '0' ;
            if( strcmp("f", table[st][id]) == 0 ) 
				continue ;
            for( k = 0 ; k < strlen(table[st][id]) ; k++ )
            {
                tmp[tmp_len++] = table[st][id][k] ;
            }
        }
        len = 0 ;
        printf(",") ;
        for( j = 0 ; j < tmp_len ; j++ )
        {
            current[len++] = tmp[j] ;
            printf("%c", tmp[j] ) ;
        }
    }
    int done = 0 ;
    for( i = 0 ; i < len ; i++ )
    {
        int id = current[i] - '0' ;
        if( End[id] == 1 )
        {
            done = 1 ;
            break ;
        }
    }
    printf(" %s\n", done ? "yes" : "no" ) ;
    return 0 ;
}
