%{
  int len=0, counter=0; 
%} 
  
%% 
[a-zA-Z]+ { len=strlen(yytext); 
            if(len<10 && len>5) 
              {counter++;}
	printf("%d",counter);} 
 
%% 
  
int yywrap (void ) 
 { 
    return 1; 
 } 
  
int main() 
 { 
  printf("Enter the string:"); 
  yylex();  
  return 0; 
 } 
