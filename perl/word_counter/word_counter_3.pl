#!/usr/bin/perl
use strict;
use warnings;

# This program is a word counter that reads a file and counts the number of words in it.
# It is designed to help programmers understand how to work with file I/O in Perl.
# The program will open a file, read its contents, and then count and print the number of words.

# Function to count words in a given string
sub count_words {
    my ($text) = @_;
    my @words = split(/\s+/, $text);
    return scalar @words;
}

# Main program
my $filename = 'input.txt';  # Name of the file to be read

# Open the file for reading
open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";

# Read the entire file content into a scalar variable
my $content = do { local $/; <$fh> };

# Count the number of words in the file content
my $word_count = count_words($content);

# Print the word count
print "The file '$filename' contains $word_count words.\n";

# Close the file handle
