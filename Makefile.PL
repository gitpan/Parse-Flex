# Copyright (C) 2003 Ioannis Tambouras <ioannis@earthlink.net> . All rights reserved.
# LICENSE:  Latest version of GPL. Read licensing terms at  http://www.fsf.org .
 

use ExtUtils::MakeMaker;
use ExtUtils::Embed;

my $ccflags = ccflags() .  ' -D_REENTRANT ' ;



WriteMakefile(
    NAME		=> 'Parse::Flex',
    VERSION_FROM	=> 'Flex.pm', 
    CCFLAGS             =>  $ccflags,
    PREREQ_PM		=> { Test::More=>0 },
    ABSTRACT_FROM       => 'Flex.pm', 
    AUTHOR              => 'Ioannis Tambouras <ioannis@earthlink.net>',
    NORECURS            =>  0,
    MYEXTLIB            => 'src/libflexer.a',
);


sub MY::postamble {
     <<'';
     src/libflexer.a:
	$(MAKE) -C src  
     .PHONY: compare 
     compare: 
	@$(MAKE) -sC compare

}
