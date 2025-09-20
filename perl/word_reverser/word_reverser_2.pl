#!/usr/bin/perl
use strict;
use warnings;

# This program is a word reverser. It takes a string input from the user,
# splits the string into words, reverses each word, and then joins them back
# together to form the reversed string. The purpose of this program is to 
# demonstrate basic string manipulation in Perl.

# Function to reverse each word in a string
sub reverse_words {
    my ($input) = @_;
    my @words = split(/\s+/, $input);  # Split the input string into words
    my @reversed_words;

    foreach my $word (@words) {
        my $reversed_word = reverse($word);  # Reverse the current word
        push(@reversed_words, $reversed_word);  # Add the reversed word to the list
    }

    return join(' ', @reversed_words);  # Join the reversed words into a single string
}

# Main program
print "Enter a string to reverse its words: ";
my $input = <STDIN>;  # Read input from the user
chomp($input);  # Remove the newline character from the input

my $reversed_string = reverse_words($input);  # Reverse the words in the input string
print "Reversed string: $reversed_string\n";  # Print the reversed string

# Memory leak: The reversed string is not properly deallocated
