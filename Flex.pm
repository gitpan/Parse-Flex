package Parse::Flex;

use 5.006;
use strict;
use warnings;
use base  qw(Exporter DynaLoader);
use Carp;


BEGIN { unshift @INC,  $ENV{PWD} }



 our %EXPORT_TAGS = ( 'all' => [ qw( ) ] );
#our @EXPORT_OK   = ( @{ $EXPORT_TAGS{'all'} } );
 our @EXPORT      = qw( yyin yyout yylex );
 our $VERSION     = '0.01';

sub manual {
	return unless my ($soname) = reverse sort  <auto/*so>;
	my $path =  $ENV{PWD} . "/$soname";
	my $libref = DynaLoader::dl_load_file( $path, DynaLoader::dl_load_flags() );
	croak("unresolved symbols")  if DynaLoader::dl_undef_symbols();

	my $sym = DynaLoader::dl_find_symbol( $libref, 'boot_Parse__Flex' );
	my $xs  = DynaLoader::dl_install_xsub('Parse::Flex::bootstrap', $sym );
        &$xs ;
};



# Note:  @INC has been changed through the BEGIN block

manual() or  bootstrap Parse::Flex $VERSION;;


1;
__END__

=head1 NAME

Parse::Flex - The Fastest Lexer on the West   **Development Release**

=head1 SYNOPSIS

 # Add any custom libraries as $ENV{PWD}/auto/*.so , or
 # as $ENV{PWD}/auto/Parse/Flex.so . Otherwise you get the default Flex.so .

 use Parse::Flex;
 yying = 'datafile'
 yylex() ;

=head1 DESCRIPTION

 This module implements a lexer analyzer based on flex(1)

 Parse::Flex works similar to Parse::Lex, but it uses XS for speedup. The
 documentation for this section will be added in the next version due this weekend.

=head2 Methods

=over

=item yylex()

 Get the name of next token, and idirectly sets yytext . Returns undef for end
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


