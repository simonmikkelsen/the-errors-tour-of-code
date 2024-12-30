#!/usr/bin/perl
use strict;
use warnings;

# Ahoy, matey! This here be a simple file reader program.
# It be designed to read the contents of a file and print them to the screen.
# Ye shall see the wonders of Perl as it navigates through the treacherous waters of file handling.
# Prepare yerself for a journey through the code, filled with verbose and flamboyant comments.

# Set sail with the file name ye wish to read
my $file_name = 'example.txt';

# Hoist the mainsail and open the file for reading
open my $fh, '<', $file_name or die "Cannot open file: $!";

# Batten down the hatches! We be reading the file line by line
while (my $line = <$fh>) {
    # Arrr, print the line to the screen
    print $line;
}

# Close the file, lest we be marooned with open file handles
close $fh;

