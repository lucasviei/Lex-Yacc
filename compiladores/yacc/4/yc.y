%{
	#include<stdio.h>
	int val = 0;
	int val2 = 0;
	
%}

%token NUM
%left '+' '-'
%left '*' '/'

%%
S:  E {printf("\n");}
    ;
E:  E '+' E {printf("+");}
    |   E '*' E {printf("*");}
    |   '(' E ')'
    |	')' E  {val = 1;}
    |	'(' E  {val = 2;}
    |	 E ')' {val = 3;}
    |	 E '(' {val = 4;}
    |	')' E '(' {val= 5;}
    |	')' E ')' {val= 6;}
    |	'(' E '(' {val= 7;}
    |	E '+' {val2 = 1;}
    |	E '*' {val2 = 2;}
    |   NUM     {printf("%d", yylval);}
    ;
%%

int main(){
	printf("Digite a expressão aritmética: ");
	yyparse();
	if(val == 1){
		printf("Paratenses a direita não balanceado\t");	
	}
	if(val == 2){
		printf("Paratenses a direita ausente\t");	
	}
	if(val == 3){
		printf("Paratenses a esquerda ausente\t");	
	}
	if(val == 4){
		printf("Paratenses a esquerda não balanceado\t");	
	}
	if(val == 5){
		printf("Paratenses não balanceado//ordem invertida\t");	
	}
	if(val == 6){
		printf("Paratenses a direita não balanceado\t");	
	}
	if(val == 7){
		printf("Paratenses a esquerda não balanceado\t");	
	}
	if(val2 == 1){
		printf("Operando ausente\t");	
	}
	if(val2 == 2){
		printf("Operando ausente\t");	
	}
}

int yyerror (char *msg) {
	return printf ("error YACC: %s\n", msg);
}
