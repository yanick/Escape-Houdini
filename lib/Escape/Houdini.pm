package Escape::Houdini;
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

=func escape_html( $text )

=func unescape_html( $text )

=func escape_xml( $text )

=func escape_uri( $text )

=func unescape_uri( $text )

=func escape_url( $text )

=func unescape_url( $text )

=func escape_href( $text )

=func escape_js( $text )

=func unescape_js( $text )

=head1 SEE ALSO

Houdini (natch) - L<https://github.com/vmg/houdini>

=cut
