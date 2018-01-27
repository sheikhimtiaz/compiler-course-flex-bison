%option main
%%

(a|b)*abbb(a|b)* printf("Recognized");
.*		 printf("Not Recognized");


