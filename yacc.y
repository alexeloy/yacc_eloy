%{
    #include <stdio.h>
    int yylex(void);
    int yywrap() {return 1;}
    void yyerror(const char *erro) {fprintf(stderr, "Erro encontrado: %s\n", erro); }
%}

%%
%token SELECT FROM ID WHERE OR AND;

line: input '\n'{
    printf("Sintaxe Correta\n");
    return 0;
};

input: select items from condition;

select: SELECT;
items: '*' | it;
it: ID | ID ',' it;

from: FROM ID WHERE;

condition: condition AND condition | condition OR condition | operation;
operation: it '=' it;

%%


int main(){
    printf("Digite um comando sql:\n");
    yyparse();
    return 0;
}
