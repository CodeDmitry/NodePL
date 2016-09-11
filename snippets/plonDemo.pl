use Data::Dumper;
$Data::Dumper::Deparse = 1;

my $obj = (sub {
    my $inner = {
        'a' => 'andy',
        'b' => 3,
        'c' => sub {
            print 'Hello!';
        }
    };

    return $inner;
});

$code = Dumper $obj;
$code =~ s/\S*\s=\S*\s//;
chomp($code);
chop($code);
$code = '(' . $code . ');';
$a = eval($code);
$obj = $a->();
$obj->{'c'}->();
