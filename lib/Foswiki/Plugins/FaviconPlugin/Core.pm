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

package Foswiki::Plugins::FaviconPlugin::Core;

use strict;
use warnings;

use Foswiki::Func ();
use Foswiki::Plugins::JQueryPlugin ();
use JSON ();

sub new {
  my $class = shift;

  my $this = bless({
    @_
  }, $class);

  return $this;
}

sub DESTROY {
  my $this = shift;

  undef $this->{_json};
}

sub json {
  my $this = shift;

  unless (defined $this->{_json}) {
    $this->{_json} = JSON->new->allow_nonref(1);
  }

  return $this->{_json};
}

sub FAV {
  my ($this, $session, $params, $topic, $web) = @_;

  Foswiki::Plugins::JQueryPlugin::createPlugin("Favicon");

  $params->{text} //= $params->{_DEFAULT} // "";

  my @htmlData = ();
  foreach my $key (sort keys %$params) {
    next if $key eq '_DEFAULT';
    next if $key eq '_RAW';
    my $val = $params->{$key};
    next unless $val;
    $key =~ s/_/\-/g;
    push @htmlData,  $this->formatHtmlData($key, $val);
  }

  return '<div class="jqFavicon" '.join(" ", @htmlData). '></div>';
}

sub formatHtmlData {
  my ($this, $key, $val) = @_;

  if (ref($val)) {
    $val = $this->json->encode($val);
  } else {
    $val = _entityEncode($val);
  }

  return "data-$key='$val'";
}

sub _entityEncode {
  my $text = shift;

  $text =~ s/([[\x01-\x09\x0b\x0c\x0e-\x1f"%&\$'*<=>@\]_])/'&#'.ord($1).';'/ge;
  return $text;
}

1;
