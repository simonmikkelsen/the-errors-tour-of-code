#!/usr/bin/perl
use strict;
use warnings;

# This program is a word counter that reads a text file and counts the 
# occurrences of each word. It demonstrates basic file handling, 
# hash usage, and text processing in Perl. The program reads the 
# entire file into memory, splits it into words, and then counts 
# the occurrences of each word. Finally, it prints the word counts 
# in a sorted order.

# Check if a filename was provided as an argument
if (@ARGV != 1) {
    die "Usage: $0 filename\n";
}

# Open the file for reading
my $filename = $ARGV[0