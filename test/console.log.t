#!/usr/bin/perl
package main;
use strict;
use warnings;
use lib '..';
use Test::More;
use NodePL::perl;
use NodePL::console;

my @tests = ();

(sub {
    push @tests, sub {
        my $toWrite = "this is a test";
        my $str = '';
        my $fake_stdout;
        open($fake_stdout, '>', \$str)
            or die("cannot open string as a stream.\n");
        select($fake_stdout);
        console::log($toWrite, $toWrite, $toWrite);
        
        ok($str eq "$toWrite $toWrite $toWrite\n", 'console::log test behaves as expected.');
    };
})->();

plan('tests' => scalar(@tests));

foreach my $test(@tests) {
    $test->();
}
