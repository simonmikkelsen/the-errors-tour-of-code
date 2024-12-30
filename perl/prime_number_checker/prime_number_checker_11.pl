#!/usr/bin/perl
use strict;
use warnings;

# This program is a prime number checker.
# It takes an integer input from the user and checks if it is a prime number.
# The program uses regular expressions as much as possible to perform the checks.
# The purpose of this program is to help programmers understand how to use regular expressions in Perl.

# Function to check if a number is prime
sub is_prime {
    my ($num) = @_;
    
    # Return false if number is less than 2
    return 0 if $num < 2;
    
    # Check for factors other than 1 and the number itself
    for my $i (2 .. sqrt($num)) {
        # Use regular expression to check for factors
        if ($num =~ /^$i$/) {
            return 0;
        }
    }
    
    return 1;
}

# Main program
print "Enter a number: ";
my $input = <STDIN>;
chomp($input);

# Validate input using regular expression
if ($input =~ /^\d+$/) {
    if (is_prime($input)) {
        print "$input is a prime number.\n";
    } else {
        print "$input is not a prime number.\n";
    }
} else {
    print "Invalid input. Please enter a valid integer.\n";
}

