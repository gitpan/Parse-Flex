.PHONY:    $(shell ls) 
.SILENT:

PERL = /usr/bin/perl

OPTS     =  -lw  -Mblib
MODULES  =  -Mstrict  -MData::Dumper -MCarp


all: clean compare
#all: lex


compare: #john.yp
	#yapp -v -mJohn  $<
	$(PERL) $(OPTS) $(MODULES) $@


lex:
	$(PERL) $(OPTS) $(MODULES) $@

clean:
	rm -f  John.pm
