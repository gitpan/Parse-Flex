use Test::More;

use Data::Dumper;

# Overide the default library, with the a custom library
BEGIN { chdir qw( .. )  unless $0 =~ /^t/ ;
	`cd auto && ln -sf save/Flex_digits.so .`
}

# Loading Flex should always come after any library overides  
use Parse::Flex;

plan tests => 2;


yyin "t/data";

is_deeply [ yylex() ]   =>   [qw( DIGITS       3) ];
is_deeply [ yylex() ]   =>   [qw( NAME    apples) ];


END { `cd auto && rm -f Flex_digits.so` }

