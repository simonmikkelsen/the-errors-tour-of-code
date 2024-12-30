#!/usr/bin/perl
use strict;
use warnings;

# This program calculates the factorial of a given number.
# It is designed to help programmers understand the process of calculating factorials.
# The program will prompt the user to enter a number and then compute the factorial of that number.
# Factorial of a number n is the product of all positive integers less than or equal to n.
# For example, factorial of 5 (denoted as 5!) is 5 * 4 * 3 * 2 * 1 = 120.

# Function to calculate factorial
sub factorial {
    my ($n) = @_;
    my $result = 1;

    # Loop to calculate factorial
    for (my $i = 1; $i <= $n; $i++) {
        $result *= $i;
    }

    return $result;
}

# Main program
print "Enter a number to calculate its factorial: ";
my $number = <STDIN>;
chomp($number);

# Check if the input is a valid positive integer
if ($number =~ /^\d+$/ && $number >= 0) {
    my $fact = factorial($number);
    print "The factorial of $number is $fact\n";
} else {
    print "Please enter a valid positive integer.\n";
}

