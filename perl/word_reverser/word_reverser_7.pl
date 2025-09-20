#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to reverse the words in a given input string.
# It takes a string input from the user, splits it into words, reverses the order of the words,
# and then prints the reversed string. This can be useful for various text processing tasks.

# Prompt the user to enter a string
print "Enter a string to reverse its words: ";
my $input = <STDIN>;
chomp($input);

# Split the input string into words
my @words = split(/\s+/, $input);

# Reverse the order of the words
my @reversed_words = reverse(@words);

# Join the reversed words into a single string
my $reversed_string = join(' ', @reversed_words);

# Print the reversed string
print "Reversed string: $reversed_string\n";

# Simulate a subtle error that could lead to program crash and data loss
# This line is intentionally incorrect to introduce a subtle error
undef @words;

# End of the program
