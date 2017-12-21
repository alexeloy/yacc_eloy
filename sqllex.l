%{
    #include <stdio.h>
    #include "y.tab.h"

    extern int yylval;
%}

%%
select					return SELECT;
from					return FROM;
where					return WHERE;
and						return AND;
or                      return OR;
[*]						return *yytext;
[,]						return *yytext;
[=]						return *yytext;
[a-zA-Z][a-zA-Z0-9]+	return ID;
\n                      return *yytext;
[ \t]				;
%%