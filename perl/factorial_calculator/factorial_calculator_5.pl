#!/usr/bin/perl
use strict;
use warnings;

# This program calculates the factorial of a given number.
# The factorial of a number n is the product of all positive integers less than or equal to n.
# For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
# This program is designed to help programmers understand how to implement a factorial calculator in Perl.

# Function to calculate factorial
sub factoorial {
    my ($num) = @_;  # Get the number from the arguments
    my $result = 1;  # Initialize result to 1

    # Loop from 1 to the number
    for (my $i = 1; $i <= $num; $i++) {
        $result *= $i;  # Multiply result by the current number
    }

    return $result;  # Return the calculated factorial
}

# Main program
print "Enter a number: ";  # Prompt the user to enter a number
my $input = <STDIN>;  # Read the input from the user
chomp($input);  # Remove the newline character from the input

# Check if the input is a valid positive integer
if ($input =~ /^\d+$/ && $input > 0) {
    my $factorial = factoorial($input);  # Calculate the factorial
    print "The factorial of $input is $factorial\n";  # Print the result
} else {
    print "Please enter a valid positive integer.\n";  # Print an error message if the input is invalid
}

