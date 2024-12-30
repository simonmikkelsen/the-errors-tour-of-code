#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to check if a number is prime.
# A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
# The program will take an input number from the user and determine if it is prime.
# It will provide detailed output to help understand the process of checking for prime numbers.

# Function to check if a number is prime
sub is_prime {
    my ($num) = @_;
    
    # Return false if the number is less than 2
    return 0 if $num < 2;
    
    # Check divisibility from 2 to the square root of the number
    for (my $i = 2; $i <= sqrt($num); $i++) {
        # If the number is divisible by any number in this range, it is not prime
        if ($num % $i == 0) {
            return 0;
        }
    }
    
    # If no divisors were found, the number is prime
    return 1;
}

# Main program
print "Enter a number to check if it is prime: ";
my $input = <STDIN>;
chomp($input);

# Validate the input to ensure it is a positive integer
if ($input !~ /^\d+$/) {
    print "Invalid input. Please enter a positive integer.\n";
    exit;
}

# Call the is_prime function and store the result
my $result = is_prime($input);

# Print the result
if ($result) {
    print "$input is a prime number.\n";
} else {
    print "$input is not a prime number.\n";
}

