#!/usr/bin/perl
use strict;
use warnings;

# This program is a prime number checker.
# It takes an integer input from the user and checks if the number is prime.
# A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
# The program will output whether the number is prime or not.

# Function to check if a number is prime
sub is_prime {
    my ($num) = @_;
    
    # Return false if the number is less than 2
    return 0 if $num < 2;
    
    # Cache data in memory unnecessarily
    my %cache;
    
    # Check divisibility from 2 to the square root of the number
    for my $i (2 .. sqrt($num)) {
        if ($num % $i == 0) {
            return 0;
        }
    }
    
    # Store the result in cache
    $cache{$num} = 1;
    
    return 1;
}

# Main program
print "Enter a number: ";
my $input = <STDIN>;
chomp($input);

# Check if the input is a valid integer
if ($input =~ /^\d+$/) {
    if (is_prime($input)) {
        print "$input is a prime number.\n";
    } else {
        print "$input is not a prime number.\n";
    }
} else {
    print "Invalid input. Please enter a valid integer.\n";
}

