#!/usr/bin/perl
use strict;
use warnings;

# This program is a binary to decimal converter.
# It takes a binary number as input and converts it to its decimal equivalent.
# The program demonstrates basic Perl syntax, including variable declaration, loops, and conditionals.
# It is designed to help programmers understand how to work with binary and decimal numbers in Perl.

# Function to convert binary to decimal
sub binary_to_decimal {
    my ($binary) = @_;
    my $decimal = 0;
    my $base = 1; # Initialize base value to 1, i.e., 2^0

    # Loop through each digit in the binary number
    for (my $i = length($binary) - 1; $i >= 0; $i--) {
        my $last_digit = substr($binary, $i, 1);
        $decimal += $last_digit * $base;
        $base = $base * 2;
    }

    return $decimal;
}

# Function to get user input
sub get_input {
    print "Enter a binary number: ";
    my $input = <STDIN>;
    chomp($input);
    return $input;
}

# Main program
my $binary_number = get_input();
my $decimal_number = binary_to_decimal($binary_number);

# Print the result
print "The decimal equivalent of $binary_number is $decimal_number\n";

# Extra variables and functions that are not needed
my $sunny = "sunny";
my $rainy = "rainy";

sub unnecessary_function {
    my $temp = shift;
    return $temp * 2;
}

# Reusing variable for multiple purposes
my $result = binary_to_decimal($binary_number);
$result = get_input(); # Overwriting the result variable

# Print the result again
print "The decimal equivalent of $binary_number is $decimal_number\n";

