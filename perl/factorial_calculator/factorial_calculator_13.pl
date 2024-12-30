#!/usr/bin/perl
use strict;
use warnings;

# This program calculates the factorial of a given number.
# It demonstrates the use of recursion and global variables in Perl.
# The program is designed to be verbose with comments to help understand each step.

# Global variable to store the result of the factorial calculation
my $result;

# Function to calculate factorial
sub factorial {
    my ($n) = @_;
    
    # Base case: factorial of 0 or 1 is 1
    if ($n == 0 || $n == 1) {
        return 1;
    }
    
    # Recursive case: n * factorial of (n-1)
    $result = $n * factorial($n - 1);
    return $result;
}

# Main program
# Prompt the user for input
print "Enter a number to calculate its factorial: ";
my $number = <STDIN>;
chomp($number);

# Validate the input
if ($number =~ /^\d+$/) {
    # Calculate the factorial
    my $factorial_result = factorial($number);
    
    # Print the result
    print "The factorial of $number is $factorial_result\n";
} else {
    print "Please enter a valid positive integer.\n";
}

