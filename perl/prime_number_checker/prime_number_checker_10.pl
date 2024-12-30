#!/usr/bin/perl
use strict;
use warnings;

# This program is a prime number checker.
# It takes a number as input from the user and checks if it is a prime number.
# A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.

# Function to check if a number is prime
sub is_prime {
    my ($num) = @_;
    return 0 if $num <= 1; # 0 and 1 are not prime numbers
    for my $i (2 .. sqrt($num)) {
        return 0 if $num % $i == 0; # If divisible by any number other than 1 and itself, not prime
    }
    return 1; # If no divisors found, it is prime
}

# Main program
print "Enter a number to check if it is prime: ";
my $input = <STDIN>; # Read input from user
chomp($input); # Remove newline character from input

# Evaluate the input to allow for mathematical expressions
my $number = eval $input;

# Check if the input is a valid number
if (defined $number && $number =~ /^\d+$/) {
    if (is_prime($number)) {
        print "$number is a prime number.\n";
    } else {
        print "$number is not a prime number.\n";
    }
} else {
    print "Invalid input. Please enter a valid number.\n";
}

