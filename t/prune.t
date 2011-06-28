#!/usr/bin/perl -T


use warnings;
use strict;

use Test::More;
use Test::XML;

BEGIN {
    use_ok('XML::TreeBuilder');
}

my $root = XML::TreeBuilder->new();
my $xml =<<'EOHTML';
<note onError="stopOnError">
    <to>Joni</to>
    <from>Jani</from>
    <heading>Reminder</heading>
    <body>
      <kim>
        <one>
          <two></two>
          <kar>dashian</kar>
        </one>
      </kim>
      <super></super>
    </body>
</note>
EOHTML

$root->parse($xml);
$root->prune;

my $expected = '<note onError="stopOnError">
    <to>Joni</to>
    <from>Jani</from>
    <heading>Reminder</heading>
    <body>
      <kim>
        <one>

          <kar>dashian</kar>
        </one>
      </kim>

    </body>
</note>
';

is_xml($root->as_XML, $expected, 'test pruning');



done_testing;
