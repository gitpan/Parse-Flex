.PHONY:    $(shell ls)
.SILENT:

PERL = /usr/bin/perl

OPTS     =  -lw -Mblib
MODULES  =  -Mstrict  -MData::Dumper -MCarp

#  00_default.t  
#  01_custom.t  

#all: 01_custom.t
all: 00_default.t

del t*t 0*t:
	$(PERL) $(OPTS) $(MODULES) $@

readl:
	readelf -d  ../blib/arch/auto/Parse/Flex/Flex.so | head
	readelf -d  ../devel/libflex_custom.so | head
