# Plugin for Foswiki - The Free and Open Source Wiki, https://foswiki.org/
#
# FaviconPlugin is Copyright (C) 2021-2024 Michael Daum http://michaeldaumconsulting.com
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

package Foswiki::Plugins::FaviconPlugin;

use strict;
use warnings;

use Foswiki::Func ();
use Foswiki::Plugins::JQueryPlugin ();

our $VERSION = '1.10';
our $RELEASE = '%$RELEASE%';
our $SHORTDESCRIPTION = "Display a badge, image or video in a browser tab's favicon";
our $LICENSECODE = '%$LICENSECODE%';
our $NO_PREFS_IN_TOPIC = 1;
our $core;

sub initPlugin {

  Foswiki::Func::registerTagHandler('FAV', sub { return getCore()->FAV(@_); });
  Foswiki::Plugins::JQueryPlugin::registerPlugin("Favicon", 'Foswiki::Plugins::FaviconPlugin::JQuery');

  return 1;
}

sub getCore {
  unless (defined $core) {
    require Foswiki::Plugins::FaviconPlugin::Core;
    $core = Foswiki::Plugins::FaviconPlugin::Core->new();
  }
  return $core;
}


sub finishPlugin {
  undef $core;
}

1;
