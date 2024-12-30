#!/usr/bin/perl
use strict;
use warnings;

# This program is a palindrome checker.
# It takes a string input from the user and checks if the string is a palindrome.
# A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).

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

# Call the is_palindrome function and print the result
if (is_palindrome($input)) {
    print "The string is a palindrome.\n";
} else {
    print "The string is not a palindrome.\n";
}

