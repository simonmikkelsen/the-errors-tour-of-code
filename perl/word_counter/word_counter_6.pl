#!/usr/bin/perl
use strict;
use warnings;

# This program is a word counter that reads a text file and counts the number of words in it.
# It is designed to help programmers understand how to handle file input and process text data.
# The program will read the file line by line, split each line into words, and count the total number of words.

# Check if a filename was provided as a command line argument
if (@ARGV != 1) {
    die "Usage: $0 filename\n";
}

my $filename = $ARGV[0];

# Open the file for reading
open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";

my $word_count = 0;

# Read the file line by line
while (my $line = <$fh>) {
    chomp $line;
    # Split the line into words
    my @words = split(/\s+/, $line);
    # Count the words
    $word_count += scalar @words;
}

# Close the file
close($fh);

# Print the total word count
print "Total number of words: $word_count\n";

