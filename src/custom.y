
 #define YY_DECL char* yyylex YY_PROTO(( void ))
 #undef yywrap
 int yywrap(void) {  return 1 ;}



DIGITS     [0-9]+
NAME       [a-z][A-Za-z0-9_]+

%%

{DIGITS}      return "DIGITS"  ;
{NAME}        return "NAME" ;
[a-zA-Z]/\    return "CHAR" ;
\n            return "EOL"  ;
.  ;
<<EOF>>       return  ""    ;
%%

