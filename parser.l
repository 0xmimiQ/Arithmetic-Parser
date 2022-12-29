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

0*[1-9]*            {
                        yyerror("Syntax error: Illegal number"); 
                    }

[-+()=/*;]          { return *yytext; }

[ \t\n]             ;

.                   { 
                        yyerror("Syntax error: Illegal character"); 
                    }
%%

int yywrap() {
    return 1;
}