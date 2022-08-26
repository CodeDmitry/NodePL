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
    my $void_arity = undef;
    my $unit_arity = [];
    my $two_arity = [1];

    push(@tests, sub {
        ok(perl->arity($void_arity) == 0, 'void arity check.');
    });
    push(@tests, sub {
        ok(perl->arity($unit_arity) == 1, 'unit arity check.');
    });
    push(@tests, sub {
        ok(perl->arity($two_arity) == 2, 'two arity check.');
    });
})->();

plan('tests' => scalar(@tests));

foreach my $test(@tests) {
    $test->();
}
