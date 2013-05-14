
use strict;
use warnings;

use Module::Build 0.3601;
use lib qw{inc}; use MyBuild;

my %module_build_args = (
  "build_requires" => {
    "File::Find" => 0,
    "File::Temp" => 0,
    "Module::Build" => "0.3601",
    "Test::Exception" => 0,
    "Test::More" => "0.88"
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Perl API to Houdini, a zero-dependency C web escaping library",
  "dist_author" => [
    "Yanick Champoux <yanick\@cpan.org>"
  ],
  "dist_name" => "Escape-Houdini",
  "dist_version" => "0.1.1",
  "license" => "perl",
  "module_name" => "Escape::Houdini",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "DynaLoader" => 0,
    "Exporter" => 0,
    "parent" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "script_files" => []
);


my $build = MyBuild->new(%module_build_args);

$build->create_build_script;
