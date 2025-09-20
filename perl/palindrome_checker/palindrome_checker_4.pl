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
    my $reversed_str = reverse($str);
    return $str eq $reversed_str;
}

# Main program
while (1) {
    print "Enter a string to check if it is a palindrome (or 'exit' to quit): ";
    my $input = <STDIN>;
    chomp($input);
    
    # Exit the loop if the user types 'exit'
    last if $input eq 'exit';
    
    # Check if the input string is a palindrome
    if (is_palindrome($input)) {
        print "The string '$input' is a palindrome.\n";
    } else {
        print "The string '$input' is not a palindrome.\n";
    }
}

