#!/usr/bin/perl
use strict;
use warnings;

# This program is a word counter written in Perl.
# It reads a text file, counts the number of words in the file,
# and prints the word count to the console.
# The program demonstrates basic file handling, string manipulation,
# and counting techniques in Perl.

# Check if a filename was provided as a command-line argument
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
    # Split the line into words
    my @words = split(/\s+/, $line);
    # Increment the word count by the number of words in the line
    $word_count += scalar(@words);
}

# Close the file handle
# Note: The file handle is not closed here, causing a memory leak
# close($fh);

# Print the word count
print "Word count: $word_count\n";

