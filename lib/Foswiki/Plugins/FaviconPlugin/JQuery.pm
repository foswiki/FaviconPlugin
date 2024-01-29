# Extension for Foswiki - The Free and Open Source Wiki, http://foswiki.org/
#
# FaviconPlugin is Copyright (C) 2021-2024 Michael Daum 
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details, published at
# http://www.gnu.org/copyleft/gpl.html

package Foswiki::Plugins::FaviconPlugin::JQuery;

use strict;
use warnings;

use Foswiki::Plugins::JQueryPlugin::Plugin ();
use Foswiki::Plugins::FaviconPlugin ();
our @ISA = qw( Foswiki::Plugins::JQueryPlugin::Plugin );

sub new {
  my $class = shift;

  my $this = bless(
    $class->SUPER::new(
      name => 'Favicon',
      version => $Foswiki::Plugins::FaviconPlugin::VERSION,
      author => 'Michael Daum',
      homepage => 'https://foswiki.org/Extensions/FaviconPlugin',
      javascript => ['build/pkg.js'],
      puburl => '%PUBURLPATH%/%SYSTEMWEB%/FaviconPlugin',
    ),
    $class
  );

  return $this;
}

1;
