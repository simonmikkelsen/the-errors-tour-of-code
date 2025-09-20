#!/usr/bin/perl
use strict;
use warnings;

# This program calculates the factorial of a given number.
# The factorial of a number n is the product of all positive integers less than or equal to n.
# For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
# This program will prompt the user to enter a number and then calculate and display the factorial of that number.

# Function to calculate factorial
sub factorial {
    my ($num) = @_;
    my $result = 1;

    # Loop to calculate factorial
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
    print "The factorial of $input is $fact.\n";
} else {
    print "Please enter a valid positive integer.\n";
}

