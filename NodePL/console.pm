package console;
use Data::Dumper;
$Data::Dumper::Deparse = 1;

sub log {
    if ("$_[0]" eq __PACKAGE__) {
        shift @_; 
    }   
    print shift . "\n";
}
1;

