package Escape::Houdini;
BEGIN {
  $Escape::Houdini::AUTHORITY = 'cpan:YANICK';
}
{
  $Escape::Houdini::VERSION = '0.1_0';
}
# ABSTRACT: Perl API to Houdini, a zero-dependency C web escaping library


use strict;
use warnings;

use parent qw/ DynaLoader Exporter /;

our %EXPORT_TAGS = (
    all => [ qw/ escape_html unescape_html escape_xml 
        escape_uri escape_url escape_href
        unescape_uri unescape_url 
        escape_js unescape_js
        / ]
);

our @EXPORT_OK = @{$EXPORT_TAGS{all}};

__PACKAGE__->bootstrap;

1;

__END__

=pod

=head1 NAME

Escape::Houdini - Perl API to Houdini, a zero-dependency C web escaping library

=head1 VERSION

version 0.1_0

=head1 SYNOPSIS

    use Escape::Houdini ':all';

    my $escaped = escape_html( '<foo>' );
    # $escaped is now '&lt;foo&gt;'

=head1 DESCRIPTION

I<Escape::Houdini> is a wrapper around the zero-depedency, minimalistic
C web escaping library Houdini.

This version of I<Escape::Houdini> has been built against 
commit 
I<e6f0ec96b85578a2fd8ab79af84493cad3a84cfb>
(Wed Apr 17 17:24:20 2013 +0200) 
of Houdini.

B<WARNING>: I'm a n00b at XS, so until this module get reviewed by somebody
who knows what they are doing, take it with a grain of salt.

=head1 FUNCTIONS

=head2 escape_html( $text )

=head2 unescape_html( $text )

=head2 escape_xml( $text )

=head2 escape_uri( $text )

=head2 unescape_uri( $text )

=head2 escape_url( $text )

=head2 unescape_url( $text )

=head2 escape_href( $text )

=head2 escape_js( $text )

=head2 unescape_js( $text )

=head1 SEE ALSO

Houdini (natch) - L<https://github.com/vmg/houdini>

=head1 AUTHOR

Yanick Champoux <yanick@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Yanick Champoux.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
