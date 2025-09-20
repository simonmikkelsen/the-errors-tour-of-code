#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to convert hexadecimal numbers to their decimal equivalents.
# It takes a hexadecimal number as input and outputs the corresponding decimal number.
# The program is intended to help users understand the conversion process and practice their Perl skills.
# It includes detailed comments to explain each step of the process.

# Function to convert a single hexadecimal digit to its decimal value
sub hex_to_dec_digit {
    my $hex_digit = shift;
    my %hex_map = (
        '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7,
        '8' => 8, '9' => 9, 'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
    );
    return $hex_map{uc($hex_digit)};
}

# Function to convert a hexadecimal string to a decimal number
sub hex_to_dec {
    my $hex = shift;
    my $decimal = 0;
    my $length = length($hex);
    my $power = 0;

    # Loop through each character in the hexadecimal string
    for (my $i = $length - 1; $i >= 0; $i--) {
        my $char = substr($hex, $i, 1);
        my $value = hex_to_dec_digit($char);
        $decimal += $value * (16 ** $power);
        $power++;
    }

    return $decimal;
}

# Main program
print "Enter a hexadecimal number: ";
my $hex_input = <STDIN>;
chomp($hex_input);

# Convert the input to decimal
my $decimal_output = hex_to_dec($hex_input);

# Print the result
print "The decimal equivalent of $hex_input is $decimal_output\n";

