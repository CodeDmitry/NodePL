package perl;
use strict;
use warnings;
require Exporter;
use Data::Dumper;
$Data::Dumper::Deparse = 1;
$Data::Dumper::Purity = 1;
$Data::Dumper::Indent = 1;


our @ISA = ('Exporter');
our @EXPORT = (
    'typeof',
    'stringify'
);

# | comment
=head
turns object to its string representation, fingers crossed
eval friendly.
=cut
# | end comment
sub stringify {
    return Dumper $_[0];
}

# | comment
=head
qualified eval.
=cut
# | end comment
sub eval {
    return eval $_[0];
}

# | comment
=head
loads into reference.
=cut
# | end comment
sub require {
    local $/ = undef;
    my $path = $_[0];
    my $file;
    my $text;
    
    open $file, '<', $path
        or die "$!\n";

    $text = <$file>;
    close $file;

    return eval $text;
}

# | comment
=head
loads into global package scope.
=cut
# | end comment
sub require_global {
    my $n = $_[0];
    my $p = $_[1];
    
    my $obj = perl::require $p;

    my $pmain = \%main::;
    $pmain->{$n} = $obj;
}

sub typeof {
    my $obj = $_[0];
    my $ref = ref $obj;

    # | erlang-style-if
    if
        ($ref eq '' || $ref eq 'SCALAR')  { 
            return 'scalar';              } elsif
        ($ref eq 'HASH')                  {
            return 'hash';                } elsif 
        ($ref eq 'ARRAY')                 {
            return 'array';               }  elsif
        ($ref eq 'CODE')                  {
            return 'function';            }  elsif
        ($ref eq 'GLOB')                  {
            return 'typeglob';            }
        else                              {
            die $ref;                     }   
    # | end if
}

# | descriminating typeof
sub discriminate {
    my $obj = $_[0];
    my $basis = perl::typeof $obj;

    if ($basis eq 'scalar') {
        if ("$obj" =~ /^[0-9]+$/) {
            return 'integer';
        } elsif ("$obj" =~ /^[0-9]*[.][0-9]+$/) {
            return 'floating';
        } else {
            return 'string';
        }
    } else {
        return $basis;
    }
}

sub spawn {
    my $callback = shift;
    my $pid = fork();

    if ($pid) {
        return $pid;
    } 

    $callback->();

    exit;    
}

