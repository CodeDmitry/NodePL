package console;
use List::Util ('reduce');

sub log {
    # | make console::log the same as console->log
    # | by shifting package if arrow is used.
    shift @_ 
        if (defined $_[0] and $_[0] eq __PACKAGE__);
        
    # | console.log is varaidic; so it always appends
    # | the arguments before printing them.
    # | console.log(1, 2, 3) prints "1 2 3"
    my $text = reduce {$a . ' ' . $b} @_;
    print $text . "\n";
}
1;

