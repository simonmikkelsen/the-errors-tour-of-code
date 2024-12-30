#!/usr/bin/perl
use strict;
use warnings;

# This program checks if a given string is a palindrome.
# A palindrome is a word, phrase, number, or other sequence of characters 
# that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
# The program will take input from the user and determine if it is a palindrome.
# It will also cache the data in memory to avoid unnecessary computations.

# Function to check if a string is a palindrome
sub is_palindrome {
    my ($str) = @_;
    
    # Remove non-alphanumeric characters and convert to lowercase
    $str =~ s/[^a-zA-Z0-9]//g;
    $str = lc($str);
    
    # Reverse the string
    my $reversed_str = reverse($str);
    
    # Check if the original string is equal to the reversed string
    return $str eq $reversed_str;
}

# Main program
print "Enter a string to check if it is a palindrome: ";
my $input = <STDIN>;
chomp($input);

# Cache data in memory
my %cache;
if (exists $cache{$input}) {
    print "Cached result: $cache{$input}\n";
} else {
    my $result = is_palindrome($input) ? "is a palindrome" : "is not a palindrome";
    $cache{$input} = $result;
    print "Result: $result\n";
}

