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

=head1 SYNOPSIS

    use Escape::Houdini ':all';

    my $escaped = escape_html( '<foo>' );
    # $escaped is now '&lt;foo&gt;'

=head1 DESCRIPTION

I<Escape::Houdini> is a wrapper around the zero-depedency, minimalistic
web escaping C library L<Houdini|https://github.com/vmg/houdini>.

This version of I<Escape::Houdini> has been built against
the commit
L<https://github.com/vmg/houdini/commit/3e2a78a2399bf3f58253c435278df6daf0e41740>
of Houdini.

=head1 EXPORTS

I<Escape::Houdini> doesn't export any function by default. Functions can be
exported individually, or via the following tags:

    | tag   | exported functions         |
    |-------|----------------------------|
    | :all  | all o' them                |
    | :html | escape_html, unescape_html |
    | :uri  | escape_uri, unescape_uri   |
    | :url  | escape_url, unescape_url   |
    | :js   | escape_js, unescape_js     |


=func escape_html( $text )

    escape_html( '<body class="foo">' ); # => '&lt;body class=&quot;foo&quot;&gt;'

=func unescape_html( $text )

    unescape_html( "&lt;body&gt;" ); # => '<body>'

=func escape_xml( $text )

    escape_xml( "<foo>" ); # => '&lt;foo&gt;'

=func escape_uri( $text )

=func unescape_uri( $text )

=func escape_url( $text )

    escape_url("http://foo.com/meh"); # => 'http%3A%2F%2Ffoo.com%2Fmeh'

=func unescape_url( $text )

    unescape_url('http%3A%2F%2Ffoo.com%2Fmeh'); # => "http://foo.com/meh"

=func escape_href( $text )

=func escape_js( $text )

    escape_js( "foo\nbar" ); # => 'foo\nbar'

=func unescape_js( $text )

    escape_js( 'foo\nbar' ); # => "foo\nbar"

=head1 SEE ALSO

Houdini (natch) - L<https://github.com/vmg/houdini>

=cut
