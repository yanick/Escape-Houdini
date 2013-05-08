package Escape::Houdini;
# ABSTRACT: 

=head1 SYNOPSIS

=head1 DESCRIPTION

=cut

use strict;
use warnings;

use parent qw/ DynaLoader Exporter /;

our %EXPORT_TAGS = (
    all => [ qw/ escape_html / ]
);

our @EXPORT_OK = @{$EXPORT_TAGS{all}};

our $VERSION = '0.0.1';

__PACKAGE__->bootstrap($VERSION);

1;
