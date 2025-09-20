#!/usr/bin/perl
use strict;
use warnings;

# This program is designed to convert hexadecimal numbers to their decimal equivalents.
# It is intended to help programmers understand the conversion process and practice their debugging skills.
# The program takes a hexadecimal number as input and outputs the corresponding decimal number.
# It includes detailed comments to explain each step of the process.

# Function to convert a single hexadecimal digit to its decimal value
sub hex_to_dec_digit {
    my $hex_digit = shift;
    my %hex_map = (
        '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
        '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
        'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15,
        'a' => 10, 'b' => 11, 'c' => 12, 'd' => 13, 'e' => 14, 'f' => 15,
    );
    return $hex_map{$hex_digit};
}

# Function to convert a hexadecimal string to its decimal value
sub hex_to_dec {
    my $hex =
    