#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to convert hexadecimal numbers to decimal numbers.
# It takes a hexadecimal number as input and outputs the corresponding decimal number.
# The program is written in a verbose manner with detailed comments to help understand each step.

# Function to convert a single hexadecimal digit to its decimal equivalent
sub hex_to_dec_digit {
    my $hex_digit = shift;
    my %hex_map = (
        '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
        '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
        'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
    );
    return $hex_map{uc($hex_digit)};
}

# Function to convert a hexadecimal string to a decimal number
sub hex_to_dec {
    my $hex = shift;
    my $length = length($hex);
    my $decimal = 0;
    my $power = 0;

    # Loop through each character in the hexadecimal string from right to left
    for (my $i = $length - 1; $i >= 0; $i--) {
        my $digit = substr($hex, $i, 1);
        $decimal += hex_to_dec_digit($digit) * (16 ** $power);
        $power++;
    }

    return $decimal;
}

# Main program starts here
# Prompt the user to enter a hexadecimal number
print "Enter a hexadecimal number: ";
my $hex_input = <STDIN>;
chomp($hex_input);

# Convert the hexadecimal input to decimal
my $decimal_output = hex_to_dec($hex_input);

# Print the result
print "The decimal equivalent of $hex_input is $decimal_output\n";

