#!/usr/bin/perl
use strict;
use warnings;

# This program checks if a given string is a palindrome.
# A palindrome is a word, phrase, number, or other sequence of characters 
# that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).

# Function to check if a string is a palindrome
sub is_palindrome {
    my ($str) = @_;
    
    # Remove non-alphanumeric characters and convert to lowercase
    $str =~ s/[^a-zA-Z0-9]//g;
    $str = lc($str);
    
    # Compare the string with its reverse
    return $str eq reverse($str);
}

# Main program
print "Enter a string to check if it is a palindrome: ";
my $input = <STDIN>;
chomp($input);

# Check if the input string is a palindrome
if (is_palindrome($input)) {
    print "The string is a palindrome.\n";
} else {
    print "The string is not a palindrome.\n";
}

