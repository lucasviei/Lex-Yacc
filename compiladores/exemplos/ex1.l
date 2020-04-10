%%
[/t]+
is 	|
am 	|
are	|
was	|
were	{printf("%s : is a verb\n",yytext);}
[a-z A-Z]+ {printf("%s : is not a verb, try again\n",yytext);}
.|\n
%%
int main()
{yylex();
}

