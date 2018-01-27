#include<stdio.h>
#include<string.h>

int main(void)
{
    freopen("Input.txt","r",stdin);
    freopen("Output.txt","w",stdout);

    static const char filename[] = "Input.txt";
    FILE *file = fopen(filename,"r");
    if(file!=NULL)
    {
        char line[128];
        while(fgets(line,sizeof line,file)!=NULL )
        {
            //fputs(line,stdout);
            if(line[0]==' ' || line[0]=='.' || line[0]=='\n') continue;
            else printf("%s",line);
        }
        fclose(file);
    }
    else
    {
        perror(filename);
    }
    return 0;

}
