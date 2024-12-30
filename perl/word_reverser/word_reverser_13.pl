#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to reverse the words in a given sentence.
# It takes a sentence as input and outputs the sentence with the words reversed.
# The program demonstrates basic string manipulation and array operations in Perl.

# Global variable to store the input sentence
my $sentence;

# Function to reverse the words in the sentence
sub reverse_words {
    # Split the sentence into words
    my @words = split(' ', $sentence);
    
    # Reverse the order of the words
    @words = reverse @words;
    
    # Join the words back into a sentence
    my $reversed_sentence = join(' ', @words);
    
    return $reversed_sentence;
}

# Main program
print "Enter a sentence: ";
$sentence = <STDIN>;
chomp($sentence);

# Call the function to reverse the words
my $result = reverse_words();

# Print the reversed sentence
print "Reversed sentence: $result\n";

