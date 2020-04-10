%{
int LT= 0, LE = 0, EQ = 0, NE = 0, GT=0,GE=0,IF=0,THEN=0,ELSE=0,ID=0,NUMERO=0,RELOP = 0;
	

%}

delim	[ \t\n]
ws	{delim}+
letra 	[A-Za-z]
digito	[0-9]
id	{letra}({letra}|{digito})*
numero 	{digito}+(\.{digito}+)?(E[+\-]?{digito}+)?

%%

{ws}	{}
if	{printf("token IF(%d)\t%s\n",++IF,yytext);}
then	{printf("token THEN(%d)\t%s\n",++THEN,yytext);}
else 	{printf("token ELSE(%d)\t%s\n",++ELSE,yytext);}
{id}	{printf("token ID(%d)\t%s\n",++ID,yytext);}
{numero} {printf("token NUMERO(%d)\t%s\n",++NUMERO,yytext);}
"<"	{printf("token <(%d)\t%s\n",++LT,yytext);}
"<="	{printf("token <=(%d)\t%s\n",++LE,yytext);}
"="	{printf("token =(%d)\t%s\n",++EQ,yytext);}
"<>"	{printf("token <>(%d)\t%s\n",++NE,yytext);}
">"	{printf("token >(%d)\t%s\n",++GT,yytext);}
">="	{printf("token >=(%d)\t%s\n",++GE,yytext);}

.	{printf("token INVALIDO(%d)\t%s\n",++RELOP,yytext);}

%%	
int yywrap(){}

int main(int argc, char*argv[]){
	extern FILE *yyin; 
	
	yyin = fopen("input2.txt","r");
	
	yylex();

	return 0;
}

