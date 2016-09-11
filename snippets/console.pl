(sub {
    my $console = {
        'log' => sub {
            print $_[0] . "\n";
        }
    };
    
    return $console;
})->();