use strict;
use warnings;
use Test::More tests => 2;
use Escape::Houdini qw(escape_html);

subtest 'refcount' => sub {
    plan tests => 1;
    use Devel::Peek qw(SvREFCNT Dump);
    my $sv = escape_html('test');
    is SvREFCNT( $sv ), 1, 'Correct refcount means this should be garbage-collected properly';
    diag Dump( $sv );
};

subtest 'leaktrace' => sub {
    eval 'use Test::LeakTrace';
    plan $@ =~ m{\QTest/LeakTrace.pm}
        ? (skip_all => "Test requires Test::LeakTrace")
        : (tests => 1);
    no_leaks_ok(sub {
        my $shouldnt_be_leaked = escape_html('<script src="http://evil.com/steal_banking_details.js"></script>');
    });
};
