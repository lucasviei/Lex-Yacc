%%
[.*''+ \n\t]	{printf("%s",yytext);}

%%

int yywrap(){}

int main(int argc, char*argv[]){
extern FILE *yyin;

yyin = fopen("test.txt","r");

yylex();

return 0;
}


