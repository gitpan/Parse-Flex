# Copyright (C) 2003 Ioannis Tambouras <ioannis@earthlink.net> . All rights reserved.
# LICENSE:  Latest version of GPL. Read licensing terms at  http://www.fsf.org .
 
package Parse::Flex;

use 5.006;
use warnings;
no strict 'refs';
use base  qw(DynaLoader);


BEGIN { unshift @INC,  $ENV{PWD} }
our @EXPORT   = qw( yyin yyout yylex );
our $VERSION  = '0.03';


# We walk light. We do our own importing and autocroaking
sub import   { *{ caller() . "::$_"}     =  $_[0]->UNIVERAL::can($_) for @EXPORT;     }
sub croak    {  require Carp ;    *croak = *Carp::croak;     &croak;                  }



sub manual {
        return unless my ($soname) = reverse sort  <auto/*so>;
        my $path =  $ENV{PWD} . "/$soname";
        my $libref = DynaLoader::dl_load_file( $path, DynaLoader::dl_load_flags() );
        croak("unresolved symbols")  if DynaLoader::dl_undef_symbols();

        my $sym = DynaLoader::dl_find_symbol( $libref, 'boot_Parse__Flex' );
        my $xs  = DynaLoader::dl_install_xsub('Parse::Flex::bootstrap', $sym );
        &$xs ;
};



# Note:  @INC has been changed earlier (in the BEGIN block)
manual()  or  bootstrap Parse::Flex $VERSION;;


1;
__END__

=head1 NAME

Parse::Flex - The Fastest Lexer on the West      ** Development Release **

=head1 SYNOPSIS

 # Copy your custom library as ENV{PWD}/auto/*.so , or
 # as  $ENV{PWD}/auto/Parse/Flex.so . Otherwise, we load the default Flex.so .

 cp  /properpath/Flex.so  $ENV{PWD}/auto/libflex_custom1.so

 use Parse::Flex;
 yying = 'datafile'
 yylex() ;

=head1 DESCRIPTION

Parse::Flex works similar to Parse::Lex, but it uses XS for faster performance. 

This module allows the user to implement a customized lexer analyzer with his own rules.
It is expected that you will supply your own rules; otherwise, the default rules might
not be very useful.

=head2  Custom Rules & Libraries

At present, the easiest way to construct your own lexer is to alter the rules
in src/default.y, and then to issue "make realclean; make && make install".
This lexer is compatible with Yapp . If you desire compatibility with Bison, you
will have to return an int value by modifying Flex.xs. Future
versions of Parse::Flex should add Bison compatibility. (Perhaps soon.).

It is good idea to save your new and old Flex.so libraries (under different names) 
if you wish to use them later to override the default Flex.so library.
For details, read the next section about Loading the Custom Library.


=head2  Loading the Custom Library

=over 0

The bootstrap process loads the first soname library found, using the following rule: 

=item *  
If there are *.so libraries in the ${PWD}/auto/  directory, sort them in reverse 
order (to fetch the latest version), then select the one at the top of the list.

=item *
If nothing was found, load the Flex.so library from the ${PWD}/auto/Parse/Flex/ 
directory.

=item *
Otherwise, load the default Flex.so library installed by MakeMaker.

=back

=head2 METHODS

=over

=item yylex()
Get the name of next token, and indirectly sets yytext . Returns undef for end
of input.


=item yyin()
Set the name of the input file.

=item yyout()
Set the name of the output file.

=back


=head2 EXPORT

 yyin, yyout, yylex

=head1 AUTHOR

Ioannis Tambouras, E<lt>ioannis@earthlink.netE<gt>

=head1 SEE ALSO

L<flex(1)>, L<Parse::Lex>

=cut


