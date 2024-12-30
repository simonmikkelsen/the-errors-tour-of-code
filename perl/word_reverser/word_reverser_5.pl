#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to reverse the words in a given sentence.
# It takes a sentence as input from the user, splits the sentence into words,
# reverses the order of the words, and then prints the reversed sentence.
# The program is intended to help programmers practice their Perl skills.

# Prompt the user to enter a sentence
print "Please enter a sentence: ";

# Read the input from the user
my $sentence = <STDIN>;

# Remove the newline character from the end of the input
chomp($sentence);

# Split the sentence into words
my @words = split(' ', $sentence);

# Reverse the order of the words
my @reversed_words = reverse(@words);

# Join the reversed words into a single string
my $reversed_sentence = join(' ', @reversed_words);

# Print the reversed sentence
print "Reversed sentence: $reversed_sentence\n";

