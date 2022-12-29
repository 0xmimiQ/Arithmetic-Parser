%{
    #include <stdio.h>
    #include <stdlib.h>
    void yyerror(char*);
    int yylex();
    extern FILE *yyin;
%}

%token INTEGER

%%

conmand:
        conmand statement ';'
        | conmand ';'
        | /* empty */
        ;

statement:
        expression                      { printf("%d\n", $1); }
        ;

expression:
        expression '+' term             { $$ = $1 + $3; }
        | expression '-' term           { $$ = $1 - $3; }
        | term                          { $$ = $1; }
        ;

term:
        term '*' factor                 { $$ = $1 * $3; }
        | term '/' factor               {
                                            if ($3 != 0)
                                            {
                                                $$ = $1 / $3;
                                            }
                                            else
                                            {
                                                yyerror("Fatal: Division by 0.");
                                            }
                                        }
        | factor                        { $$ = $1; }
        ;

factor: 
        '(' expression ')'              { $$ = $2; }
        | '-' factor                    { $$ = -$2; }
        | INTEGER
        ;

%%

void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
    exit(1);
}

int main(int argc, char **argv)
{
    yyin = fopen("testcase.in", "r");
    yyparse();
    fclose(yyin);
    return 0;
}