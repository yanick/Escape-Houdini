use strict;
use warnings;

use Test::More tests => 1; 
use Test::Exception;

use Escape::Houdini qw/ :all /;

is escape_html( "<body>" ) => '&lt;body&gt;';
dies_ok { escape_html( [ 1..4]  ) };
is escape_html( 6 ) => 6;
is escape_html( '<div class="❤">foo</div>' ) => '&lt;div class=&quot;❤&quot;&gt;foo&lt;&#47;div&gt;';



