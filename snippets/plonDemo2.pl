require 'plon.pm';

my $object = {
    'foo' => 'Bar'
};
$code = PLON::stringify($object);
$obj = PLON::parse($code);
print $obj->{foo};