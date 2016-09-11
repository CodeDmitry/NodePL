(sub {
    use strict;
    use warnings;

    my $unknown = $_[0];
    
    my $ref = ref($unknown); 
    my %map = (
        'CODE' => 'sub',
        'HASH' => 'map',
    );
    my $mapDefault = 'string';
    
    
    if ($ref) {
        if (exists($map{$ref})) {
            return($map{$ref});
        }
    
        return $ref;
    } else {
        return $mapDefault;
    }
});