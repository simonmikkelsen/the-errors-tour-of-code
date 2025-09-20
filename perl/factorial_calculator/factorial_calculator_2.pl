#!/usr/bin/perl
use strict;
use warnings;

# This program calculates the factorial of a given number.
# It is designed to help programmers understand the process of calculating factorials.
# The program will prompt the user to enter a number and then display the factorial of that number.
# Factorials are calculated using a recursive function.

# Function to calculate factorial recursively
sub factorial {
    my ($n) = @_;
    return 1 if $n == 0; # Base case: factorial of 0 is 1
    return $n * factorial($n - 1); # Recursive case: n * factorial of (n-1)
}

# Main program
print "Enter a number to calculate its factorial: ";
my $input = <STDIN>; # Read user input
chomp($input); # Remove newline character from input

# Validate input
if ($input =~ /^\d+$/) {
    my $result = factorial($input); # Calculate factorial
    print "The factorial of $input is $result\n"; # Display result
} else {
    print "Please enter a valid positive integer.\n"; # Error message for invalid input
}

