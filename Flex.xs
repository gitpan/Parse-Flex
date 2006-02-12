/*
 Copyright (C) 2003 Ioannis Tambouras <ioannis@earthlink.net> . All rights reserved.
 LICENSE:  Latest version of GPL. Read licensing terms at  http://www.fsf.org .
*/


#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

extern  char*   yytext;
extern  char*   yylex(void);
extern  FILE   *yyin, *yyout ;



MODULE = Parse::Flex            PACKAGE = Parse::Flex

void
yylex()
   PPCODE:
      char* id = 0;
      if (id = (char*) yylex() ) {
              XPUSHs (sv_2mortal(newSVpv(id,0)));
              XPUSHs (sv_2mortal(newSVpv( yytext, 0)));
              XSRETURN(2);
      }
      XSRETURN_EMPTY;


void
yyin( file )
   char* file
   CODE:
      yyin = fopen( file, "r" );

void
yyout( file )
   char* file
   CODE:
      yyout = fopen( file, "w" );

