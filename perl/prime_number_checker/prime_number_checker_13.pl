#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to check if a given number is a prime number.
# It takes an input number from the user and determines if it is prime.
# A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.

# Global variable to store the number to be checked
our $number;

# Function to check if a number is prime
sub is_prime {
    # Retrieve the global variable
    my $num = $number;

    # Return false if the number is less than 2
    return 0 if $num < 2;

    # Check for factors from 2 to the square root of the number
    for (my $i = 2; $i <= sqrt($num); $i++) {
        # If a factor is found, return false
        return 0 if $num % $i == 0;
    }

    # If no factors are found, return true
    return 1;
}

# Main program
print "Enter a number to check if it is prime: ";
chomp($number = <STDIN>);

# Check if the number is prime and print the result
if (is_prime()) {
    print "$number is a prime number.\n";
} else {
    print "$number is not a prime number.\n";
}

