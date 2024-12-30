#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to reverse the words in a given input string.
# It takes a string as input, splits it into words, reverses the order of the words,
# and then joins them back together to form the reversed string.
# The purpose of this program is to help programmers understand how to manipulate strings
# and arrays in Perl, as well as to practice writing and debugging Perl code.

# Function to reverse the words in a string
sub reverse_words {
    my ($input) = @_;

    # Split the input string into words using whitespace as the delimiter
    my @words = split(/\s+/, $input);

    # Reverse the order of the words in the array
    my @reversed_words = reverse(@words);

    # Join the reversed words back together with a single space between each word
    my $reversed_string = join(' ', @reversed_words);

    return $reversed_string;
}

# Main program
# Read input from the user
print "Enter a string to reverse the words: ";
my $input_string = <STDIN>;
chomp($input_string);

# Call the reverse_words function and print the result
my $reversed_string = reverse_words($input_string);
print "Reversed string: $reversed_string\n";

