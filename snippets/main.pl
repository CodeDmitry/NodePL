(sub {
    use strict;
    use warnings;
    use Cwd 'abs_path';
    use File::Basename 'dirname';
    
    my $global = {};
    my $__filename = abs_path($0);
    my $__dirname = dirname($__filename);
    
    $args = {
        'require' 
    };
    
    my $code = (sub{
        local $/ = undef;
        local @ARGV = $_[0];
        return <>;    
    })->($_[0]);    
})->();