#!/usr/bin/perl
use strict;
use warnings;

# This program calculates the factorial of a given number.
# The purpose of this program is to help programmers understand
# how to implement a basic factorial calculator in Perl.
# The program will prompt the user to enter a number and then
# calculate the factorial of that number using a recursive function.

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
my $number = <STDIN>;
chomp($number);

# Input validation: ensure the input is a non-negative integer
if ($number =~ /^\d+$/ && $number >= 0) {
    my $result = factorial($number);
    print "The factorial of $number is $result\n";
} else {
    print "Please enter a valid non-negative integer.\n";
}

