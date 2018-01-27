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
            if(strcmp(line,"for")==1 || strcmp(line,"while")==1 || strcmp(line,"int")==1)
                { printf("%s => Not Valid\n\n",line);  continue;}
            else if(line[0]>='0' && line[0]<='9')
                { printf("%s =>Not Valid.\n\n",line);  continue;}
            else
                printf("%s => Valid\n\n",line);
        }
        fclose(file);
    }
    else
    {
        perror(filename);
    }
    return 0;
}
