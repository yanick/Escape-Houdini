package Escape::Houdini;
BEGIN {
  $Escape::Houdini::AUTHORITY = 'cpan:YANICK';
}
{
  $Escape::Houdini::VERSION = '0.1.4';
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
        / ],
    html => [ qw/ escape_html unescape_html /],
    uri => [ qw/ escape_uri unescape_uri /],
    url => [ qw/ escape_url unescape_url /],
    js  => [ qw/ escape_js unescape_js /],
);

our @EXPORT_OK = @{$EXPORT_TAGS{all}};

__PACKAGE__->bootstrap;

1;

__END__

=pod

=head1 NAME

Escape::Houdini - Perl API to Houdini, a zero-dependency C web escaping library

=head1 VERSION

version 0.1.4

=head1 SYNOPSIS

    use Escape::Houdini ':all';

    my $escaped = escape_html( '<foo>' );
    # $escaped is now '&lt;foo&gt;'

=head1 DESCRIPTION

I<Escape::Houdini> is a wrapper around the zero-depedency, minimalistic
web escaping C library Houdini.

This version of I<Escape::Houdini> has been built against 
commit 
I<e6f0ec96b85578a2fd8ab79af84493cad3a84cfb>
(Wed Apr 17 17:24:20 2013 +0200) 
of Houdini, plus a mini-patch from your truly 
(see L<https://github.com/vmg/houdini/pull/13>).

=head1 FUNCTIONS

=head2 escape_html( $text )

See L<https://github.com/vmg/houdini>

=head2 unescape_html( $text )

See L<https://github.com/vmg/houdini>

=head2 escape_xml( $text )

See L<https://github.com/vmg/houdini>

=head2 escape_uri( $text )

See L<https://github.com/vmg/houdini>

=head2 unescape_uri( $text )

See L<https://github.com/vmg/houdini>

=head2 escape_url( $text )

See L<https://github.com/vmg/houdini>

=head2 unescape_url( $text )

See L<https://github.com/vmg/houdini>

=head2 escape_href( $text )

See L<https://github.com/vmg/houdini>

=head2 escape_js( $text )

See L<https://github.com/vmg/houdini>

=head2 unescape_js( $text )

See L<https://github.com/vmg/houdini>

=head1 EXPORTS

I<Escape::Houdini> doesn't export any function by default. Functions can be  
exported individually, or via the tags I<:html> (for I<escape_html> and
I<unescape_html>), I<:uri> (for I<escape_uri> and I<unescape_uri>),
I<:url> (for I<escape_url> and I<unescape_url>), I<:js> (for I<escape_js>
and I<unescape_js>) and I<:all> (for... well, all of them).

=head1 SEE ALSO

Houdini (natch) - L<https://github.com/vmg/houdini>

=head1 AUTHOR

Yanick Champoux <yanick@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Yanick Champoux.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
