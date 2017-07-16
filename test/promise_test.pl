#!/usr/bin/perl
package main;
use strict;
use warnings;
use lib '..';
use Test::More;
use NodePL::perl;
use NodePL::console;
use NodePL::promise;

my @tests = (
    sub {
        my $obj = promise->new(sub {
        print "promise called\n";
        $_[0]->('done!');
        });
        console::log $obj;
        $obj->then(sub {
            console::log 'first done', $_[0];

        });
        $obj->then(sub {
            console::log 'second done', $_[0];    
        });
        console::log $obj;

        ok('test1');
    },
    sub {
        promise->new(sub {
            #$_[0]->(1);
            $_[1]->("failed");
        })->then(sub {
            console::log $_[0];
            return $_[0] + 2;
        })->then(sub {
            console::log $_[0];
            return $_[0] + 3;
        })->then(sub {
            console::log $_[0];
            return $_[0];
        });    
        ok('test2');
    }
);

(sub {
    push @tests, sub {
        my $toWrite = "this is a test";
        my $str = '';
        my $fake_stdout;
        open $fake_stdout, '>', \$str
            or die "cannot open string as a stream.\n";
        select $fake_stdout;
        console::log $toWrite, $toWrite, $toWrite;
        
        ok($str eq "$toWrite $toWrite $toWrite\n", 'console::log test behaves as expected.');
    };
})->();

plan tests => scalar @tests;

foreach my $test(@tests) {
    $test->();
}



