#!/usr/bin/perl -w
# -*- perl -*-

#
# Author: Slaven Rezic
#

use strict;
use Test::More;

plan tests => 1;

if (fork == 0) {
    # Don't disturb the actual test, so fork!
    require GD;
    require XML::LibXML;
    diag "";
    diag "XML::LibXML $XML::LibXML::VERSION";
    diag "libxml2     " . XML::LibXML::LIBXML_RUNTIME_VERSION();
    diag "GD          $GD::VERSION";
    exit 0;
}
wait;

$SIG{ALRM} = sub { die "Timeout!" };
alarm(5);
require_ok 'Acme::Study::SREZIC';

__END__
