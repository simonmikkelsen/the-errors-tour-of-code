#!/usr/bin/perl
use strict;
use warnings;

# This Perl program is a word counter. It reads a text file and counts the number of words in it.
# The program uses regular expressions extensively to demonstrate their usage in text processing.
# The program is designed to be verbose and well-commented to help programmers understand each step.

# Open the file for reading
open(my $fh, '<', 'input.txt') or die "Could not open file 'input.txt' $!";

# Initialize a counter for the number of words
my $word_count = 0;

# Read the file line by line
while (my $line = <$fh>) {
    # Remove newline characters
    chomp($line);

    # Use a regular expression to find all words in the line
    my @words = $line =~ /\b\w+\b/g;

    # Increment the word count by the number of words found
    $word_count += scalar(@words);
}

# Close the file
close($fh);

# Print the total word count
print "Total number of words: $word_count\n";

