package promise;
use strict;
use warnings;
require Exporter;
use Data::Dumper;
use NodePL::console;

sub new {
    shift @_ 
        if (defined $_[0] and $_[0] eq __PACKAGE__);

    my %self = (
        'status' => ['pending'],
        'callbacks' => [],
        'errbacks' => []
    );

    my $object = bless \%self, __PACKAGE__;
        
    $_[0]->(sub {
        $object->{status}->[0] = 'resolved';
        $object->{value}->[0] = $_[0];        

        foreach my $f (@{$object->{callbacks}}) {
            $f->($_[0]);        
        }           
    }, sub {
        $self{status}->[0] = 'rejected';    
        $self{value}[0] = $_[0];

        foreach my $f (@{$object->{errbacks}}) {
            $f->($_[0]);
        }        
    });

    return bless \%self, __PACKAGE__;
};

sub resolve {
    shift @_ 
        if (defined $_[0] and $_[0] eq __PACKAGE__);
    
    my @given = @_;

    my $result = promise->new(sub {
        $_[0]->(@given);
    });
    
    $result->{status}[0] = 'resolved';
    return $result;
};

sub reject {
    shift @_ 
        if (defined $_[0] and $_[0] eq __PACKAGE__);

    my $result = promise->new(sub {
        $_[0]->($_);
    });
    
    $result->{status}[0] = 'rejected';
    return $result;    
}

sub then {
    my $self = shift;        
    
    my $s = $self->{status}[0];
    my $cs = $self->{callbacks};
    my $es = $self->{errbacks};
    
    if ("$s" eq 'pending') {
        push @$cs, $_[0]; 
        return $self;
    } elsif ("$s" eq 'resolved') {
        my $val = $_[0]->($self->{value}[0]);
        my $res = promise::resolve $val;
        return $res;
    } elsif ("$s" eq 'rejected') {
        my $val = $self->{value}[0];
        die "$val";
        return $self;
    }
};
