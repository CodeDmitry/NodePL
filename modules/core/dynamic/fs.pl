(sub {
    my $fs = {
        'readFileSync' => sub {
            my $filename = $_[0];

            # reminder: you should be familiar of anonymous scopes, 
            # js example: (function(){console.log('hi')})();
            (sub {
                # reminder: local "temporarily changes the value within scope".           
                # reminder: $_ is "arguments".
                # reminder: $/ is "record separator". defaults to 'newline'. we want whole file.
                # reminder: <> opens every argument in @ARGV and returns a record from it.
                local $/ = undef;
                local @ARGV = $_[0];
                <>;
            })->($filename);
        }
    };
    
    return $fs;
})->();
