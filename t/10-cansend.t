#!perl
use 5.006;
use strict;
use warnings;
use Test::More;

use Net::CANbus qw/CANsend_xs CANsend/;

my $deviceid = 'vcan0';
my @expected_results = (
	['5A1#11.2233.44556677.88', 0], # success
	['123#DEADBEEF', 0], # success
	['5AA#', 0], # success
	['123##1', 0], # success
	['213##311223344', 0], # success
	['1F334455#1122334455667788_B', 0], # success
	['123#R', 0], # success
	['00000123#R3', 0], # success
	['333#R8_E', 0], # success
	['wrong', 1], # failed
	['not good', 1], # failed
	['bad', 1], # failed
);

for my $ares (@expected_results){
	my $rc = CANsend_xs($deviceid, $ares->[0]);
	is($rc, $ares->[1], "CANsend_xs() : called and returned code '$rc' is the expected '$ares->[1]'.");
}

done_testing;
