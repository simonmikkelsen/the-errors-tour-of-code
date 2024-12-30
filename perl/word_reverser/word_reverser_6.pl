# This Perl program is designed to reverse the words in a given input string.
# It takes a string input from the user, splits the string into words,
# reverses the order of the words, and then prints the reversed string.
# The program demonstrates basic string manipulation and input/output operations in Perl.

use strict;
use warnings;

# Prompt the user for input
print "Enter a string to reverse the words: ";
my $input = <STDIN>;
chomp($input);  # Remove the newline character from the input

# Split the input string into words
my @words = split(/\s+/, $input);

# Reverse the order of the words
my @reversed_words = reverse(@words);

# Join the reversed words into a single string
my $reversed_string = join(' ', @reversed_words);

# Print the reversed string
print "Reversed string: $reversed_string\n";

