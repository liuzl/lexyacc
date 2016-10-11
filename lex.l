%{
#define YYSTYPE char*
#include <stdio.h>
#include "text.tab.h"
extern YYSTYPE yylval;
%}
 
%%
set       return SET;
state     return STATE;
mode      return MODE;
get       return GET;
[a-zA-Z]+  { yylval=strdup(yytext); return STRING; }
%%
