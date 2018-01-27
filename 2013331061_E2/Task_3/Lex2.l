%option main

%%

(x|yxxx)* printf("Recognized");
.* 	  printf("Not Recognized");

