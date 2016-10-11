%{
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#define YYSTYPE char*
YYSTYPE yylval;
char mode[20];
char state[20];
%}

%token SET STATE MODE GET STRING EOLN
%%
list:   /* nothing */
        | list getorset
        ;
getorset: getvalue 
         | setvalue 
         ;
setvalue: 
        SET STATE STRING  { strcpy(state,$3); printf("State set, %s\n", $3); }
        | SET MODE STRING { strcpy(mode,$3); printf("Mode set\n"); }
        ;
getvalue: 
        GET STATE  { printf("State: %s\n",state); }
        | GET MODE { printf("Mode: %s\n",mode); }
        ;

%%

#include <stdio.h>
#include <ctype.h>
char *progname;

int main( argc, argv )
char *argv[];
{
  progname = argv[0];
  yyparse();
  return 0;
}

int yyerror( s )
char *s;
{
  fprintf( stderr ,"%s: %s\n" , progname , s );
  return 0;
}
