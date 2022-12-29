%{
    #include "parser.tab.h"
    #include <stdlib.h>
    void yyerror(char *);
%}

%%
[0-9]|[1-9][0-9]*   {
                        yylval = atoi(yytext);
                        return INTEGER;
                    }

[-+()=/*;]          { return *yytext; }

[ \t\n]             ;

.                   { 
                        yyerror("Illegal character"); 
                    }
%%

int yywrap() {
    return 1;
}