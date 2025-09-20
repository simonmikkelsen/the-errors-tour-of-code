#!/usr/bin/perl
use strict;
use warnings;

# This program checks if a given number is a prime number.
# It takes an input from the user and determines if the number is prime.
# The program uses a subroutine to perform the prime check.
# The purpose of this program is to help programmers understand how to implement a prime number checker in Perl.

# Subroutine to check if a number is prime
sub is_prime {
    my ($num) = @_;
    
    # Return false if the number is less than 2
    return 0 if $num < 2;
    
    # Check for factors from 2 to the square root of the number
    for my $i (2 .. sqrt($num)) {
        return 0 if $num % $i == 0;
    }
    
    # If no factors are found, the number is prime
    return 1;
}

# Main program
print "Enter a number to check if it is prime: ";
my $input = <STDIN>;
chomp($input);

# Open a file to log the result
open(my $fh, '>', 'prime_check.log') or die "Could not open file 'prime_check.log' $!";

if (is_prime($input)) {
    print "$input is a prime number.\n";
    print $fh "$input is a prime number.\n";
} else {
    print "$input is not a prime number.\n";
    print $fh "$input is not a prime number.\n";
}

# Close the file handle
