#!/usr/bin/perl
use strict;
use warnings;

# This program is a word counter. It reads a text file and counts the number of words in it.
# The program will output the total word count to the console.
# It is designed to help programmers understand how to read files, process text, and count words in Perl.

# Subroutine to count words in a given text
sub count_words {
    my ($text) = @_;
    my $count = 0;

    # Split the text into words based on whitespace
    my @words = split(/\s+/, $text);

    # Count the number of words
    $count = scalar @words;

    return $count;
}

# Main program
# Check if a filename was provided as an argument
if (@ARGV != 1) {
    die "Usage: $0 filename\n";
}

# Read the filename from the command line arguments
my $filename = $ARGV[0];

# Open the file for reading
open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";

# Read the entire file into a scalar variable
my $file_content = do { local $/; <$fh> };

# Close the file handle
close($fh);

# Count the words in the file content
my $word_count = count_words($file_content);

# Print the word count to the console
print "Total word count: $word_count\n";

