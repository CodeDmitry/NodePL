require "PLON.pm";
require "requirepl.pm";

$fs = requirepl('fs.pl');
print $fs->{readFileSync}->('demo3.pl');
