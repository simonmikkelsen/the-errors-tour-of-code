#!/usr/bin/perl
use strict;
use warnings;

# This program checks if a given string is a palindrome.
# A palindrome is a string that reads the same forward and backward.
# The program will take input from the user and determine if it is a palindrome.

# Function to check if a string is a palindrome
sub is_palindrome {
    my ($str) = @_;
    
    # Remove non-alphanumeric characters and convert to lowercase
    $str =~ s/[^a-zA-Z0-9]//g;
    $str = lc($str);
    
    # Reverse the string
    my $reversed_str = reverse $str;
    
    # Check if the original string is equal to the reversed string
    if ($str eq $reversed_str) {
        return 1; # It is a palindrome
    } else {
        return 0; # It is not a palindrome
    }
}

# Main program
print "Enter a string to check if it is a palindrome: ";
my $input = <STDIN>;
chomp($input);

# Call the is_palindrome function and store the result
my $result = is_palindrome($input);

# Print the result
if ($result) {
    print "The string is a palindrome.\n";
} else {
    print "The string is not a palindrome.\n";
}

