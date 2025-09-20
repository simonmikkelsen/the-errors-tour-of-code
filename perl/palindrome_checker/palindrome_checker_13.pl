#!/usr/bin/perl
use strict;
use warnings;

# This program checks if a given string is a palindrome.
# A palindrome is a word, phrase, number, or other sequence of characters 
# that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
# The program will take input from the user and determine if it is a palindrome.

# Global variable to store the input string
my $input_string;

# Function to check if a string is a palindrome
sub is_palindrome {
    # Remove non-alphanumeric characters and convert to lowercase
    my $cleaned_string = lc($input_string);
    $cleaned_string =~ s/[^a-z0-9]//g;

    # Reverse the cleaned string
    my $reversed_string = reverse($cleaned_string);

    # Check if the cleaned string is equal to its reverse
    return $cleaned_string eq $reversed_string;
}

# Main program
print "Enter a string to check if it is a palindrome: ";
$input_string = <STDIN>;
chomp($input_string);

if (is_palindrome()) {
    print "The string \"$input_string\" is a palindrome.\n";
} else {
    print "The string \"$input_string\" is not a palindrome.\n";
}

