use Test::More;
use Data::Dumper;
use Parse::Flex;

# Ensure that we will not be overidden
BEGIN { chdir qw( .. )  unless $0 =~ /^t/ ;
    # `cd auto && rm -f Flex_*.so` 
}

#END { `cd auto && rm -f Flex_num.so` }


use Parse::Flex;
plan tests => 3;


yyin "t/data";

is_deeply [ yylex() ]   =>   [qw( WORD     hello) ];
is_deeply [ yylex() ]   =>   [ ('OTHER',   ' '  ) ];
is_deeply [ yylex() ]   =>   [qw( EMAIL    ioannis@earthlink.net) ];



