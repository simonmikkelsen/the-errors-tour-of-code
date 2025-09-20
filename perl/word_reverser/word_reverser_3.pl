#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to reverse the words in a given input string.
# It takes input from the user, processes the input to reverse each word,
# and then prints the reversed words as output.

# Function to reverse the words in a string
sub reverse_words {
    my ($input) = @_;
    my @words = split(/\s+/, $input);  # Split the input string into words
    my @reversed_words = map { scalar reverse $_ } @words;  # Reverse each word
    return join(' ', @reversed_words);  # Join the reversed words into a single string
}

# Main program execution starts here
print "Enter a string to reverse its words: ";
my $input = <STDIN>;  # Read input from the user
chomp($input);  # Remove the newline character from the input

# Call the function to reverse the words and print the result
my $reversed = reverse_words($input);
print "Reversed words: $reversed\n";

