package main;
=for 
    This is a requirejs parallel merged with nodejs. It sets up scope and all such.
    
    warning: an issue with perl is that it does not know
        the path of the script being executed unless you parse
        the path of $0 which may have been overwritten by the time
        it is needed. This module will take advantage of being the 
        first module being loaded, so it will store the value in
        $__dirname and $__filename.
             
           
=cut
use File::Basename;
use Cwd;

our $global = ();
our $__filename = Cwd::abs_path($0);
our $__dirname = dirname($__filename);

# filename -> eval(filename)
sub requirepl {
    # no require access yet, have a local definition.
    my $readFileSync = sub {
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
    };

    my $filename = $_[0];
    return eval($readFileSync->($filename))
}

package console;
my $self = {
    'log' => sub {
        print $_[0] . "\n";
    }
};
bless($self, 'console');
