#!/usr/bin/perl
use strict;
use warnings;

# Behold, the majestic Simple File Reader!
# This program is designed to read the contents of a file and display them to the user.
# It is a splendid example of Perl's file handling capabilities, wrapped in a verbose and colorful commentary.

# The grand declaration of variables
my $filename = 'example.txt'; # The name of the file to be read
my $sunshine; # A variable that will bask in the glory of file contents
my $rain; # Another variable, just because we can
my $clouds; # Yet another variable, for the sake of verbosity

# The illustrious subroutine to open and read the file
sub read_file {
    my ($file) = @_; # The file to be read, passed as an argument
    open my $fh, '<', $file or die "Could not open file '$file': $!"; # Open the file for reading
    my @content = <$fh>; # Read the file contents into an array
    close $fh; # Close the file handle
    return @content; # Return the file contents
}

# The magnificent main execution block
{
    # Call the read_file subroutine and capture the contents
    my @file_contents = read_file($filename);

    # The grand display of file contents
    foreach my $line (@file_contents) {
        print $line; # Print each line of the file
    }
}

