use strict;
use warnings;

use Alien::Base::ModuleBuild;

my $builder = Alien::Base::ModuleBuild->new(
  module_name => 'Alien::Cairo',
  dist_abstract => 'Build and install libcairo',
  license => 'perl',
  configure_requires => {
    'Alien::Base' => 0,
  },
  requires => {
    'perl' => '5.8.1',
    'Alien::Base' => 0,
  },
  dist_author => 'David Mertens <dcmertens.perl@gmail.com>',
  alien_name => 'cairo',
  alien_repository => {
    protocol => 'http',
    host     => 'cairographics.org',
    location => '/releases',
    pattern  => qr/cairo-([\d.]+)\.tar\.gz$/,
  },
  alien_build_commands => [
    '%pconfigure --prefix=%s --enable-shared', 
    'make',
    'make install'
  ],
);
$builder->create_build_script;
