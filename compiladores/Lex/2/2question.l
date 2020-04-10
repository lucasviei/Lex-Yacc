%{
%}    

%% 
float { fprintf(yyout, "double");} 
.       { fprintf(yyout, "%s", yytext); } 

%% 
  
int yywrap(){}

int main(int argc, char*argv[]){
	extern FILE *yyin, *yyout; 
	
	yyin = fopen("testtest2.c","r");
	
	yyout = fopen("output2.c", "w"); 

	yylex();

	return 0;
}
