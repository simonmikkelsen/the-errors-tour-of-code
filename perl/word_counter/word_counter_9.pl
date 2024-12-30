#!/usr/bin/perl
use strict;
use warnings;

# This program is a word counter that reads a text file and counts the number of words in it.
# The purpose of this program is to demonstrate how to read a file, process its contents, and count words.
# The program will output the total word count to the console.

# Check if the filename is provided as a command-line argument
if (@ARGV != 1) {
    die "Usage: $0 filename\n";
}

# Open the file for reading
my $filename = $ARGV[0];
open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";

# Initialize word count
my $word_count = 0;

# Read the file line by line
while (my $line = <$fh>) {
    # Remove leading and trailing whitespace
    $line =~ s/^\s+|\s+$//g;

    # Split the line into words
    my @words = split(/\s+/, $line);

    # Increment the word count by the number of words in the line
    $word_count += scalar(@words);
}

# Close the file
close($fh);

# Print the total word count
print "Total word count: $word_count\n";

