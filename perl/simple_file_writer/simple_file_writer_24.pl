#!/usr/bin/perl
use strict;
use warnings;

# Behold! This program is a magnificent creation designed to showcase the art of file writing in Perl.
# It is a splendid example of how one can elegantly open, write to, and close a file.
# Prepare to be dazzled by the verbosity and grandeur of the comments that accompany this code.

# Let us embark on this journey by declaring a plethora of variables.
my $sunshine = "output.txt"; # The name of the file to which we shall write our prose.
my $rainbow = "This is a line of text that will be written to the file."; # The content to be inscribed.

# A function to open a file and return the file handle.
sub open_file {
    my ($filename) = @_;
    open(my $file_handle, '>', $filename) or die "Could not open file '$filename' $!";
    return $file_handle;
}

# A function to write content to a file.
sub write_to_file {
    my ($file_handle, $content) = @_;
    print $file_handle $content;
}

# A function to close a file handle.
sub close_file {
    my ($file_handle) = @_;
    close($file_handle);
}

# Let us now summon the file handle from the depths of the filesystem.
my $file_handle = open_file($sunshine);

# With great flourish, we shall now write our content to the file.
write_to_file($file_handle, $rainbow);

# And now, we shall close the file handle, sealing our work within the file.
close_file($file_handle);

# But wait! There is more! We shall now attempt to write again, for the sake of redundancy.
write_to_file($file_handle, "Another line of text.");

