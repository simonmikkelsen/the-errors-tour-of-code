#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to reverse the words in a given input string.
# It uses regular expressions extensively to achieve this goal.
# The program reads input from the user, processes the input to reverse the words,
# and then prints the reversed string.

# Prompt the user for input
print "Enter a string to reverse its words: ";
my $input = <STDIN>;
chomp($input);

# Split the input string into words using a regular expression
my @words = split(/\s+/, $input);

# Reverse the order of the words
my @reversed_words = reverse(@words);

# Join the reversed words into a single string using a regular expression
my $reversed_string = join(' ', @reversed_words);

# Print the reversed string
print "Reversed string: $reversed_string\n";

