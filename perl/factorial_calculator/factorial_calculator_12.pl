#!/usr/bin/perl
use strict;
use warnings;

# This Perl program calculates the factorial of a given number.
# The purpose of this program is to demonstrate the use of recursion,
# memoization, and basic input/output operations in Perl.
# The program will prompt the user to enter a number and then
# calculate and display the factorial of that number.

# Hash to store cached factorial values
my %cache;

# Function to calculate factorial using recursion and memoization
sub factorial {
    my ($n) = @_;
    
    # Base case: factorial of 0 or 1 is 1
    return 1 if $n == 0 || $n == 1;
    
    # Check if the value is already cached
    if (exists $cache{$n}) {
        return $cache{$n};
    }
    
    # Recursive case: n * factorial(n-1)
    my $result = $n * factorial($n - 1);
    
    # Cache the result
    $cache{$n} = $result;
    
    return $result;
}

# Main program
print "Enter a number to calculate its factorial: ";
my $number = <STDIN>;
chomp($number);

# Validate input
if ($number =~ /^\d+$/) {
    my $factorial = factorial($number);
    print "The factorial of $number is $factorial\n";
} else {
    print "Please enter a valid positive integer.\n";
}

