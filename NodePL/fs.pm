package fs;
use NodePL::perl;

# | comment
=head
opens the file and passes the handle as callback.
takes care of closing the file.
=cut
# | end comment
sub with {
    my $name;
    my $cb;
    my $file;

    # | make fs::with the same as fs->with
    # | by shifting package if arrow is used.
    if (defined $_[0] and $_[0] eq __PACKAGE__) {
        shift(@_);
    }

    $name = $_[0];
    $cb = $_[1];
    
    open($file, '<', $name)
        or die("$!\n");       

    $cb->($file);

    close $file;
}
1;

# | comment
=head
php file_get_contents
=cut
# | end
sub get_contents {
    my $file;
    my $text;
    
    # | make fs::get_contents the same as fs->get_contents
    # | by shifting package if arrow is used.
    if (defined $_[0] and $_[0] eq __PACKAGE__) {
        shift(@_);
    }

    local $/ = undef;
    open($file, '<', $_[0])
        or die "$!\n";
        
    $text = <$file>;

    close $file;
    
    return $text;
}


# | comment
=head
php file_get_contents
=cut
# | end
sub get_contents_async {
    my $fileName;
    my $callback;
    my $data;
    
    # | make fs::get_contents_async the same 
    # |     as fs->get_contents_sync
    # | by shifting package if arrow is used.
    if (defined $_[0] and $_[0] eq __PACKAGE__) {
        shift(@_); 
    }

    $fileName = $_[0];
    $callback = $_[1];
    $data = fs::get_contents($fileName);
    $callback->($data);
}


