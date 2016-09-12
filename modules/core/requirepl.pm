sub requirepl {
    use strict;
    use warnings;
    
    my $code = (sub{
        local $/ = undef;
        local @ARGV = $_[0];
        return <>;    
    })->($_[0]);
    
    return eval($code); 
};
1;
