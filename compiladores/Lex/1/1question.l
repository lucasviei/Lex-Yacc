%{
%}    

%% 
[" " \t]+ {fprintf(yyout, " ");} 
.       { fprintf(yyout, "%s", yytext); } 

%% 
  
int yywrap(){} 
  
 int main() 
{ 
    	extern FILE *yyin, *yyout; 

    	yyin = fopen("input2.txt", "r"); 
	
	yyout = fopen("output2.txt", "w"); 
  
    	yylex(); 
    	return 0; 
} 
