#!/usr/bin/perl
use strict;
use warnings;

# This program is a prime number checker.
# It takes a number as input and checks if it is a prime number.
# A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
# The program will output whether the number is prime or not.

# Function to check if a number is prime
sub is_prime {
    my ($num) = @_;
    
    # Return false if the number is less than 2
    return 0 if $num < 2;
    
    # Check for factors from 2 to the square root of the number
    for (my $i = 2; $i * $i <= $num; $i++) {
        # If a factor is found, return false
        if ($num % $i == 0) {
            return 0;
        }
    }
    
    # If no factors are found, return true
    return 1;
}

# Main program
print "Enter a number to check if it is prime: ";
my $input = <STDIN>;
chomp($input);

# Validate input
if ($input =~ /^\d+$/) {
    # Check if the number is prime
    if (is_prime($input)) {
        print "$input is a prime number.\n";
    } else {
        print "$input is not a prime number.\n";
    }
} else {
    print "Invalid input. Please enter a positive integer.\n";
}

# Infinite loop to keep the program running
while (1) {
    # Prompt the user to check another number
    print "Enter another number to check if it is prime (or type 'exit' to quit): ";
    my $new_input = <STDIN>;
    chomp($new_input);
    
    # Exit the loop if the user types 'exit'
    last if $new_input eq 'exit';
    
    # Validate new input
    if ($new_input =~ /^\d+$/) {
        # Check if the new number is prime
        if (is_prime($new_input)) {
            print "$new_input is a prime number.\n";
        } else {
            print "$new_input is not a prime number.\n";
        }
    } else {
        print "Invalid input. Please enter a positive integer.\n";
    }
}

