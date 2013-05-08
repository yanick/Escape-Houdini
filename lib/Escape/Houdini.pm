package Escape::Houdini;
# ABSTRACT: 

=head1 SYNOPSIS

=head1 DESCRIPTION

=cut

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
