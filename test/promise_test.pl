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
        eval {
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
        };
        ok('test2') if $@;
    }
);

plan tests => scalar @tests;

foreach my $test(@tests) {
    $test->();
}



