#!/usr/bin/perl
use strict;
use warnings;

# This program checks if a given string is a palindrome.
# A palindrome is a string that reads the same forward and backward.
# The program uses regular expressions to remove non-alphanumeric characters
# and to compare the processed string with its reverse.

# Function to check if a string is a palindrome
sub is_palindrome {
    my ($str) = @_;

    # Convert the string to lowercase
    $str = lc $str;

    # Remove all non-alphanumeric characters using a regular expression
    $str =~ s/[^a-z0-9]//g;

    # Reverse the processed string
    my $reversed_str = reverse $str;

    # Compare the processed string with its reverse
    return $str eq $reversed_str;
}

# Main program
print "Enter a string: ";
my $input = <STDIN>;
chomp $input;

if (is_palindrome($input)) {
    print "The string is a palindrome.\n";
} else {
    print "The string is not a palindrome.\n";
}

