%{
 #include "y.tab.h"
%}
digit [0-9]+
op "&"|"|"|"!"|"<"|">"|"="
%%
{digit} { yylval = atoi(yytext); return DIGIT; }
{op} { return *yytext; }
[ \t] ;
\n { return *yytext; }
.
%%
int yywrap()
{
 return 1;
}
