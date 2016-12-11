package fs;

# | comment
=head
opens the file and passes the handle as callback.
takes care of closing the file.
=cut
# | end comment
sub with {
    my $name = $_[0];
    my $cb = $_[1];
    
    open my $file, '<', $name
        or die "$!\n";       

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
    local $/ = undef;
    open my $file, '<', $_[0]
        or die "$!\n";
    my $text = <$file>;
    close $file;
    return $text;
}

# | comment
=head
php file_get_contents
=cut
# | end
sub get_contents_async {
    local $/ = undef;
    open my $file, '<', $_[0]
        or die "$!\n";
    my $text = <$file>;
    close $file;
    $_[1]->($text);
}


