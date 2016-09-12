(sub {
    use strict;
    use warnings;

    my $fs = {
        ##
        # readFileSync :: string -> string
        ##
        'readFileSync' => sub {
            my $filename = $_[0];

            (sub {
                # no record separator(read everything).
                local $/ = undef;
                local @ARGV = $_[0];
                <>;
            })->($filename);
        }
    };
    
    return $fs;
})->();
