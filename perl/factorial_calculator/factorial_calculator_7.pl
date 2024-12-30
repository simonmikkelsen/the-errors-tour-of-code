#!/usr/bin/perl
use strict;
use warnings;

# This Perl program calculates the factorial of a given number.
# It is designed to help programmers understand the process of 
# calculating factorials using recursion. The program takes an 
# integer input from the user and prints the factorial of that number.
# Factorial of a number n is the product of all positive integers less than or equal to n.
# For example, factorial of 5 (denoted as 5!) is 5 * 4 * 3 * 2 * 1 = 120.

# Function to calculate factorial recursively
sub factorial {
    my ($n) = @_;
    
    # Base case: factorial of 0 or 1 is 1
    if ($n == 0 || $n == 1) {
        return 1;
    }
    
    # Recursive case: n * factorial of (n-1)
    return $n * factorial($n - 1);
}

# Main program
print "Enter a number to calculate its factorial: ";
my $input = <STDIN>;
chomp($input);

# Check if the input is a valid positive integer
if ($input =~ /^\d+$/ && $input >= 0) {
    my $result = factorial($input);
    print "The factorial of $input is $result\n";
} else {
    print "Invalid input. Please enter a non-negative integer.\n";
}

