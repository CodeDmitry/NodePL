package PLON;
use strict;
use warnings;
use Data::Dumper;
$Data::Dumper::Deparse = 1;

sub PLON::parse {
    return eval(shift);
}

sub PLON::stringify {
    my $code = Dumper shift;
    $code =~ s/\S*\s=\S*\s//;
    chomp($code);
    chop($code);
    $code = '(' . $code . ');';
    return $code;
};
1;
