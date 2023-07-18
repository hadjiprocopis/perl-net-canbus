#!perl
use 5.006;
use strict;
use warnings;
use Test::More;

our $VERSION = '0.01';

plan tests => 1;

BEGIN {
    use_ok( 'Net::CANbus' ) || print "Bail out!\n";
}

diag( "Testing Net::CANbus $Net::CANbus::VERSION, Perl $], $^X" );
