package perl;
use strict;
use warnings;
require Exporter;
use Data::Dumper;
$Data::Dumper::Deparse = 1;
$Data::Dumper::Purity = 1;
$Data::Dumper::Indent = 1;
$Data::Dumper::Terse = 1;

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
    # | make perl::stringify the same as perl->stringify
    # | by shifting package if arrow is used.
    shift @_ 
        if (defined $_[0] and $_[0] eq __PACKAGE__);

    return Dumper $_[0];
}

# | comment
=head
qualified eval.
=cut
# | end comment
sub eval {
    # | make perl::eval the same as perl->eval
    # | by shifting package if arrow is used.
    shift @_ 
        if (defined $_[0] and $_[0] eq __PACKAGE__);

    return eval $_[0];
}

# | comment
=head
loads into reference.
=cut
# | end comment
sub require {
    # | make perl::require the same as perl->require
    # | by shifting package if arrow is used.
    shift @_ 
        if (defined $_[0] and $_[0] eq __PACKAGE__);

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
    # | make perl::require_global the same as perl->require_global
    # | by shifting package if arrow is used.
    shift @_ 
        if (defined $_[0] and $_[0] eq __PACKAGE__);

    my $n = $_[0];
    my $p = $_[1];
    
    my $obj = perl::require $p;

    my $pmain = \%main::;
    $pmain->{$n} = $obj;
}

sub typeof {
    # | make perl::typeof the same as perl->typeof
    # | by shifting package if arrow is used.
    shift @_ 
        if (defined $_[0] and $_[0] eq __PACKAGE__);

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
    # | make perl::discriminate the same as perl->discriminate
    # | by shifting package if arrow is used.
    shift @_ 
        if (defined $_[0] and $_[0] eq __PACKAGE__);

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
    # | make perl::spawn the same as perl->spawn
    # | by shifting package if arrow is used.
    shift @_ 
        if (defined $_[0] and $_[0] eq __PACKAGE__);

    my $callback = shift;
    my $pid = fork();

    if ($pid) {
        return $pid;
    } 

    $callback->();

    exit;    
}

sub perl::arity {    
    shift @_ 
        if (defined $_[0] and $_[0] eq __PACKAGE__);
 
    if (ref $_[0] eq 'ARRAY') {
        my $length = scalar @{$_[0]};
        
        return $length + 1;
    }
    
    return 0
        if (not defined $_[0]);
        
    die "arity> not an array/undef.\n";
}
