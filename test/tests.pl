use Test::More;
use lib "../modules/core";
use console;
use perl;
use fs;

console::log "this is a console::log test.";

fs::with "tests.pl", sub {  
    my $handle = $_[0];
    my $firstLine = <$handle>;
    console::log 'first line has ' . (length $firstLine) . ' characters.';
};

my $content = fs::get_contents 'tests.pl';
console::log 'tests.pl contains ' . (length $content) . ' characters.';

fs::get_contents_async 'tests.pl', sub {
    my $text = shift;
    console::log 'tests.pl contains ' . (length $content) . ' characters.';
};

perl::spawn (sub {
    console::log 'hello!';
});

my @stuff = (
    'a string',
    1337,
    [1, 2, 3],
    {foo => 'bar'},
    sub { return "hi!"; }
);

foreach my $thing(@stuff) { 
    my $raw = stringify($thing);
    chomp $raw;
    my $info = typeof $thing;


    console::log ("begin\n" . $raw . "\n--is a--\n" . $info . "\nend\n");
}
