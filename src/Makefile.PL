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
        lex.yy.c : default.y
		flex -Cf default.y
        lex.yy.o ::  lex.yy.c
		$(CC) -c $(CFLAGS)   $^
        libflexer.a: lex.yy.o
		$(AR)  -sr $@ $^
        clean    ::
		rm -f lex.yy.[oc] libflexer.a

};

sub MY::test {}
