#!/usr/bin/env perl
use 5.10.0;
use strict;
use warnings;
use utf8;

use Parser;
use Diagram;

my $parser = Parser->new( filename => '../sample_data/log.ltsv' );
my $diagram = Diagram->new($parser->parse);
$diagram->print_access_count_by_uri;
