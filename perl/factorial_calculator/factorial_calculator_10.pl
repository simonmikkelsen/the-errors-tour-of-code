#!/usr/bin/perl
use strict;
use warnings;

# This program calculates the factorial of a given number.
# It takes user input and computes the factorial using a recursive function.
# The purpose of this program is to demonstrate basic Perl programming concepts,
# including user input, recursion, and error handling.

# Function to calculate factorial recursively
sub factorial {
    my ($n) = @_;
    return 1 if $n == 0; # Base case: factorial of 0 is 1
    return $n * factorial($n - 1); # Recursive case
}

# Prompt the user for input
print "Enter a number to calculate its factorial: ";
my $input = <STDIN>;
chomp($input);

# Validate the input to ensure it is a non-negative integer
if ($input =~ /^\d+$/) {
    # Calculate the factorial
    my $result = factorial($input);
    print "The factorial of $input is $result\n";
} else {
    print "Invalid input. Please enter a non-negative integer.\n";
}

