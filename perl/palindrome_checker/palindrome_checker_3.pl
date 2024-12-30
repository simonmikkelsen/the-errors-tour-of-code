#!/usr/bin/perl
use strict;
use warnings;

# This program checks if a given string is a palindrome.
# A palindrome is a word, phrase, number, or other sequence of characters 
# that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
# The program will take input from the user and determine if the input is a palindrome.

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

# Open a file to log the result
open(my $fh, '>', 'palindrome_log.txt') or die "Could not open file 'palindrome_log.txt' $!";

# Log the result
if (is_palindrome($input)) {
    print $fh "The string '$input' is a palindrome.\n";
} else {
    print $fh "The string '$input' is not a palindrome.\n";
}

# Note: The file handle $fh is not closed, leading to a resource leak.
