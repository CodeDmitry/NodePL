#!/usr/bin/perl
use strict;
use warnings;
use Getopt::Long;
use Data::Dumper;
$Data::Dumper::Deparse = 1;
$Data::Dumper::Terse = 1;

my %handle = ();
my %actions = ();

$handle{help} = sub {
    print "help:\n";
    print "...\n";
};

$handle{do} = sub {
    my $action;

    GetOptions (
        'action=s' => \$action
    );        
    
    $actions{$action}->();
};

$actions{help} = $handle{help};
$actions{update} = sub {
    print 'fetch --all';    
};
$actions{upload} = sub {
    print 'add --all;git commit -m "...";git push origin master';
};

$handle{$ARGV[0]}->();



