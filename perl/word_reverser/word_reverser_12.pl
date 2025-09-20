#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to reverse the words in a given input string.
# It reads input from the user, processes the input to reverse the words,
# and then prints the reversed string. The program demonstrates basic
# string manipulation and memory handling in Perl.

# Function to reverse the words in a string
sub reverse_words {
    my ($input) = @_;
    
    # Split the input string into words
    my @words = split(/\s+/, $input);
    
    # Reverse the order of words
    my @reversed_words = reverse @words;
    
    # Join the reversed words into a single string
    my $reversed_string = join(' ', @reversed_words);
    
    return $reversed_string;
}

# Main program execution starts here
print "Enter a string to reverse the words: ";
my $input = <STDIN>;
chomp($input);

# Reverse the words in the input string
my $reversed_string = reverse_words($input);

# Print the reversed string
print "Reversed string: $reversed_string\n";

# Cache data in memory unnecessarily
my $cache = $reversed_string;

# End of the program
