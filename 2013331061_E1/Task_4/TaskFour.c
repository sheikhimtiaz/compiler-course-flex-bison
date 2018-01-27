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
        int count=0;
        while(fgets(line,sizeof line,file)!=NULL )
        {
            //fputs(line,stdout);
            if(count == 1)
            {
                int len=strlen(line);
                if(line[len-1]=='/')
                    count = 0;
                continue;
            }
            else if(line[0]=='/')
            {
                if(line[1]=='/')
                    continue;
                else if(line[1]=='*')
                        {
                            count=1;
                        }
                else
                    printf("[Syntex Error in this line] -> %s",line);
            }
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
