#!/usr/bin/perl
(sub {
    use strict;
    use warnings;
    use Cwd 'abs_path';
    use File::Basename 'dirname';    
    
    if ((scalar @ARGV) < 1) {
        die 'No file to run.';
    }
    
    my $requirepl = (sub{
        local $/ = undef;
        local @ARGV = $_[0];
        return eval(<>);    
    })->('requirepl.pl'); 
    
    sub typeof {
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
    }
    
    my $global = {
        'console' => $requirepl->('console.pl')
    };
    # need to review referencing.
    print "\n-\n" . typeof((${$global}{'console'}}{'log'}) . "\n-\n";
    
    my $__filename = abs_path($ARGV[0]);
    my $__dirname = dirname($__filename);
        
    #get code from file        
    my $code = (sub{
        local $/ = undef;
        local @ARGV = $_[0];
        return <>;    
    })->($__filename);  

    print 'running code: ' . $code;
    (sub {
        eval($code);
    })->();
})->();
