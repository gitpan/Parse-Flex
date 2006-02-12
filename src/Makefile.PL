# Copyright (C) 2003 Ioannis Tambouras <ioannis@earthlink.net> . All rights reserved.
# LICENSE:  Latest version of GPL. Read licensing terms at  http://www.fsf.org .
 
use ExtUtils::MakeMaker;
use Config;


WriteMakefile (
     NAME  => 'Parse::Flex::Default',
);


sub MY::top_targets {
      <<'';
        all     :   libflexer.a
        static  :: libflexer.a
        pure_all:: static
	CFlAGS  +=   -D_REENTRANT 
        lex.yy.c : default.l
		flex -Cf default.l
        lex.yy.o ::  lex.yy.c
		$(CC) -c $(CFLAGS)   $^
        libflexer.a: lex.yy.o
		$(AR)  -sr $@ $^
        clean    ::
		rm -f lex.yy.[oc] libflexer.a
        test:
		@- nm -g libflexer.a | grep -q yyylex || echo "Warning: don't overide Perl_yylex" 

};

sub MY::test {}
