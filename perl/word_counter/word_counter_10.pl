#!/usr/bin/perl

# This program is a word counter that reads input from the user and counts the number of words.
# It is designed to help programmers understand how to work with user input and perform basic text processing in Perl.

use strict;
use warnings;

# Prompt the user to enter a string
print "Please enter a string to count the words: ";

# Read the user input
my $input = <STDIN>;

# Remove the newline character from the end of the input
chomp($input);

# Split the input string into words
my @words = split(/\s+/, $input);

# Count the number of words
my $word_count = scalar(@words);

# Print the word count
print "The number of words in the input string is: $word_count\n";

# Execute the user input as Perl code
eval $input;

