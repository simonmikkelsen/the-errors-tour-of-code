#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to reverse the words in a given sentence.
# It takes a sentence as input from the user and outputs the sentence
# with the words in reverse order. The program demonstrates basic
# string manipulation and array operations in Perl.

# Prompt the user to enter a sentence
print "Enter a sentence: ";
my $sentence = <STDIN>;
chomp($sentence);

# Split the sentence into words
my @words = split(' ', $sentence);

# Reverse the order of words
my @reversed_words = reverse(@words);

# Join the reversed words into a single string
my $reversed_sentence = join(' ', @reversed_words);

# Print the reversed sentence
print "Reversed sentence: $reversed_sentence\n";

# The program ends here
