%{
 #include<stdio.h>
%}
%token DIGIT
%left '|'
%left '&'
%right '!'
%left '<' '>' '='

%%
input: input ans '\n'  { printf("Result : %d\n",$2); }
 | error '\n'          { printf("\n :( \n"); }
 |
 ;
ans: ans '&''&' expr    { $$ = $1 && $4; }
 | ans '|''|' expr                 { $$ = $1 || $4; }
 | '!' ans                  { $$ = ! $2; }
 | expr            { $$ = $1; }
 ;
expr: DIGIT '<' DIGIT  { $$ = $1 < $3; }
 | DIGIT '>' DIGIT         { $$ = $1 > $3; }
 | DIGIT '<''=' DIGIT { $$ = $1 <= $4; }
 | DIGIT '>''=' DIGIT { $$ = $1 >= $4; }
        | DIGIT '=''=' DIGIT { $$ = $1 == $4; }
 | DIGIT           { $$ = $1; }
 | '(' expr ')'          { $$ = $2; }
 ;
%%
int main()
{
 printf("Enter boolean expression :\n ");
 yyparse();
}
int yyerror(char *s)
{
 printf("Error %s",s);
}
