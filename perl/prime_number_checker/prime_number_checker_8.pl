#!/usr/bin/perl
use strict;
use warnings;

# This program checks if a given number is a prime number.
# It takes an input from the user and determines if the number is prime.
# The program is designed to be educational with verbose comments to help understand the logic.

# Function to check if a number is prime
sub is_prime {
    my ($num) = @_;
    
    # Return false if number is less than 2
    return 0 if $num < 2;
    
    # Check divisibility from 2 to the square root of the number
    for (my $i = 2; $i <= sqrt($num); $i++) {
        # If number is divisible by any number other than 1 and itself, it's not prime
        return 0 if $num % $i == 0;
    }
    
    # If no divisors were found, the number is prime
    return 1;
}

# Main program
print "Enter a number to check if it is prime: ";
my $input = <STDIN>;  # Read input from user
chomp($input);        # Remove newline character from input

# Check if the input is a valid number
if ($input =~ /^\d+$/) {
    # Call the is_prime function and store the result
    my $result = is_prime($input);
    
    # Print the result
    if ($result) {
        print "$input is a prime number.\n";
    } else {
        print "$input is not a prime number.\n";
    }
} else {
    print "Invalid input. Please enter a positive integer.\n";
}

