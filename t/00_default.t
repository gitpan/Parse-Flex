use Test::More;

use Data::Dumper;
use Parse::Flex;

# Ensure that we will not been overidden
BEGIN { chdir qw( .. )  unless $0 =~ /^t/ ;
	`cd auto && rm -f Flex_*.so` 
}

plan tests => 2;


yyin "t/data";

is_deeply [ yylex() ]   =>   [qw( NUM       3) ];
is_deeply [ yylex() ]   =>   [qw( WORD apples) ];

END { `cd auto && rm -f Flex_num.so` }


