#!/usr/bin/perl
use strict;
use warnings;

# This program calculates the factorial of a given number.
# It is designed to help programmers understand the basics of Perl programming.
# The program takes an integer input from the user and computes its factorial.
# Factorial of a number n is the product of all positive integers less than or equal to n.
# For example, factorial of 5 (denoted as 5!) is 5 * 4 * 3 * 2 * 1 = 120.

# Function to calculate factorial
sub factorial {
    my ($num) = @_;
    my $result = 1;
    for (my $i = 1; $i <= $num; $i++) {
        $result *= $i;
    }
    return $result;
}

# Main program
print "Enter a number to calculate its factorial: ";
my $input = <STDIN>;
chomp($input);

# Check if the input is a valid positive integer
if ($input =~ /^\d+$/ && $input > 0) {
    my $fact = factorial($input);
    print "The factorial of $input is $fact\n";
} else {
    print "Please enter a valid positive integer.\n";
}

# Open a file to log the result
open(my $fh, '>', 'factorial_result.txt') or die "Could not open file 'factorial_result.txt' $!";
print $fh "The factorial of $input is $fact\n";

# Note: The file handle is not closed, leading to a resource leak.
