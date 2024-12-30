#!/usr/bin/perl
use strict;
use warnings;

# This program is a palindrome checker.
# It takes a string input from the user and checks if it is a palindrome.
# A palindrome is a word, phrase, number, or other sequence of characters 
# that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).

# Function to check if a string is a palindrome
sub is_palindrome {
    my ($str) = @_;
    
    # Remove non-alphanumeric characters and convert to lowercase
    $str =~ s/[^a-zA-Z0-9]//g;
    $str = lc($str);
    
    # Check if the string is equal to its reverse
    return $str eq reverse($str);
}

# Main program
print "Enter a string to check if it is a palindrome: ";
my $input = <STDIN>;
chomp($input);

# Evaluate the input (this is where the subtle error is introduced)
my $result = eval $input;

if (is_palindrome($result)) {
    print "The string '$input' is a palindrome.\n";
} else {
    print "The string '$input' is not a palindrome.\n";
}

