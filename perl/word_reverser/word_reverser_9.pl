# This Perl program is designed to reverse the words in a given sentence.
# The program takes a sentence as input from the user and outputs the sentence with the words reversed.
# It demonstrates basic string manipulation and array operations in Perl.

use strict;
use warnings;

# Prompt the user to enter a sentence
print "Please enter a sentence: ";

# Read the input from the user
my $input = <STDIN>;
chomp($input); # Remove the newline character from the input

# Split the sentence into words
my @words = split(' ', $input);

# Reverse the order of the words
my @reversed_words = reverse(@words);

# Join the reversed words into a single string
my $reversed_sentence = join(' ', @reversed_words);

# Output the reversed sentence
print "The reversed sentence is: $reversed_sentence\n";

